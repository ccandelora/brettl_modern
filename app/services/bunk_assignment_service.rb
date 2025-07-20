require "set"

class BunkAssignmentService
  def initialize(reservation_week)
    @reservation_week = reservation_week
    @debug = true  # Enable debug logging
    @assignments = []  # Track assignments before saving
    @assigned_bunk_ids = Set.new
    @assigned_assignable_ids = Set.new
  end

  private

  def debug_log(message)
    Rails.logger.info("BunkAssignment: #{message}") if @debug
  end

  public

  def generate_assignments
    debug_log "Starting bunk assignment generation for week of #{@reservation_week.res_date}"

    # Clear existing assignments
    @reservation_week.bunk_assignments.destroy_all

    # Get all reservations and bunks
    reservations = @reservation_week.reservations.includes(:user)
    bunks = Bunk.includes(:room, :owner).joins(:room).order("rooms.order ASC, bunks.order ASC")

    debug_log "Total reservations: #{reservations.size}"
    debug_log "Total bunks: #{bunks.size}"

    # First pass: Match owners to their bunks
    # Get reservations from owners - match by ID or display_name only
    owner_reservations = reservations.select do |res|
      user = res.user
      bunks.any? do |b|
        b.owner_id == user.id ||
        (b.owner && b.owner.display_name.to_s.downcase == user.display_name.to_s.downcase)
      end
    end

    debug_log "Found #{owner_reservations.size} owners with reservations"

    # Process owner assignments first - owners should ONLY get their owned bunks
    owner_reservations.each do |reservation|
      user = reservation.user
      owned_bunks = bunks.select do |b|
        b.owner_id == user.id ||
        (b.owner && b.owner.display_name.to_s.downcase == user.display_name.to_s.downcase)
      end

      debug_log "Processing owner #{user.display_name} (ID: #{user.id}) who owns bunks: #{owned_bunks.map { |b| "#{b.name} (owner: #{b.owner&.display_name})" }.join(', ')}"

      assigned = false
      owned_bunks.each do |bunk|
        debug_log "  Checking bunk #{bunk.name} - Owner ID match: #{bunk.owner_id == user.id}, Name match: #{bunk.owner&.display_name.to_s.downcase == user.display_name.to_s.downcase}"
        if !@assigned_bunk_ids.include?(bunk.id) && gender_compatible?(reservation, bunk)
          create_assignment(reservation, bunk)
          debug_log "✓ Assigned owner #{user.display_name} to their owned bunk #{bunk.name}"
          assigned = true
          break  # Stop after first successful assignment
        else
          debug_log "Cannot assign #{user.display_name} to their bunk #{bunk.name} - already assigned or gender mismatch"
        end
      end
      unless assigned
        debug_log "Owner #{user.display_name} could not be assigned to any of their owned bunks. Will not assign to open bunks."
      end
    end

    # Step 3: Handle remaining reservations and guests
    remaining_reservations = reservations - owner_reservations
    assign_non_owners(remaining_reservations + @reservation_week.guests, bunks)
  end

  def assign_unassigned_only
    # Get current assignments and update tracking
    @assigned_bunk_ids.clear
    @assigned_assignable_ids.clear

    @reservation_week.bunk_assignments.includes(:assignable, :bunk).each do |assignment|
      @assigned_bunk_ids.add(assignment.bunk_id)
      @assigned_assignable_ids.add("#{assignment.assignable_type}:#{assignment.assignable_id}")
    end

    # Step 1: Fetch Data
    assignables = @reservation_week.all_assignables
    bunks = Bunk.includes(:room, :owner).joins(:room)

    # Step 2: Assign unassigned members only
    assign_non_owners(assignables, bunks)
  end

  def update_assignments(assignment_params)
    # Handle manual updates to assignments
    assignment_params.each do |bunk_id, assignable_data|
      bunk = Bunk.find(bunk_id)

      # Remove existing assignment for this bunk in this week
      existing_assignment = @reservation_week.bunk_assignments.find_by(bunk: bunk)
      existing_assignment&.destroy

      # Create new assignment if assignable_data is present and not empty
      if assignable_data.present? && assignable_data != ""
        assignable_type, assignable_id = assignable_data.split(":")

        assignable = case assignable_type
        when "Reservation"
                      @reservation_week.reservations.find(assignable_id)
        when "Guest"
                      @reservation_week.guests.find(assignable_id)
        else
                      next
        end

        # Remove any existing assignment for this assignable in this week
        existing_assignment = @reservation_week.bunk_assignments.find_by(assignable: assignable)
        existing_assignment&.destroy

        # Create the new assignment
        BunkAssignment.create!(
          reservation_week: @reservation_week,
          assignable: assignable,
          bunk: bunk
        )
      end
    end
  end

  private

  def assign_owners(reservations, bunks)
    reservations.each do |reservation|
      # Skip if this reservation is already assigned
      next if @assigned_assignable_ids.include?("Reservation:#{reservation.id}")

      # Find the bunks owned by this user
      owned_bunks = bunks.select { |bunk| bunk.owner_id == reservation.user_id }
      next unless owned_bunks.any?

      # Try to assign to their owned bunk if gender-compatible
      owned_bunks.each do |bunk|
        next if @assigned_bunk_ids.include?(bunk.id)

        if gender_compatible?(reservation, bunk)
          create_assignment(reservation, bunk)
          break # Once we've assigned to one of their bunks, stop looking
        else
          Rails.logger.info "Owner #{reservation.user.display_name} cannot be assigned to their bunk #{bunk.name} due to gender rules"
        end
      end
    end
  end

  def assign_non_owners(assignables, bunks)
    # Get assignables that haven't been assigned yet
    unassigned_assignables = assignables.reject do |assignable|
      @assigned_assignable_ids.include?("#{assignable.class.name}:#{assignable.id}")
    end

    unassigned_assignables.each do |assignable|
      # Find available bunks for this assignable's gender
      available_bunks = find_available_bunks(assignable, bunks)

      # Prefer open bunks over owned bunks
      open_bunks = available_bunks.select(&:open?)
      owned_bunks = available_bunks.select(&:owned?)

      preferred_bunks = open_bunks.any? ? open_bunks : owned_bunks

      if preferred_bunks.any?
        # Assign to the first available bunk (ordered by room order, then bunk order)
        bunk = preferred_bunks.sort_by { |b| [ b.room.order, b.order ] }.first
        create_assignment(assignable, bunk)
      end
    end
  end

  def is_available?(bunk)
    !@assigned_bunk_ids.include?(bunk.id)
  end

  def find_available_bunks(assignable, bunks)
    # Get bunks that are owned by someone who has a reservation this week
    attending_owner_ids = @reservation_week.reservations.pluck(:user_id)

    # A bunk is unavailable if:
    # 1. It's already assigned
    # 2. It's owned by someone with a reservation who has already been assigned to a bunk
    #    (unless it's their own reservation trying to access their bunk)
    unavailable_owned_bunk_ids = bunks.select do |bunk|
      bunk.owned? &&
      attending_owner_ids.include?(bunk.owner_id) &&
      owner_assigned_to_bunk?(bunk.owner_id) &&
      !(assignable.is_a?(Reservation) && assignable.user_id == bunk.owner_id)
    end.map(&:id)

    # Filter bunks
    available_bunks = bunks.select do |bunk|
      gender_compatible?(assignable, bunk) &&
        !@assigned_bunk_ids.include?(bunk.id) &&
        !unavailable_owned_bunk_ids.include?(bunk.id)
    end

    # Sort by room order and bunk order
    available_bunks.sort_by { |b| [ b.room.order, b.order ] }
  end

  def owner_assigned_to_bunk?(owner_id)
    # Check if the owner has been assigned to any bunk in this week
    @assigned_assignable_ids.any? do |assignable_key|
      assignable_type, assignable_id = assignable_key.split(":")
      assignable_type == "Reservation" &&
      @reservation_week.reservations.exists?(id: assignable_id, user_id: owner_id)
    end
  end

  def gender_compatible?(assignable, bunk)
    room_gender = bunk.room.gender
    assignable_gender = assignable.sex&.downcase

    case room_gender
    when "men"
      assignable_gender == "male"
    when "women"
      assignable_gender == "female"
    when "coed"
      %w[male female].include?(assignable_gender)
    else
      false
    end
  end

  def create_assignment(assignable, bunk)
    # Double-check that neither is already assigned
    assignable_key = "#{assignable.class.name}:#{assignable.id}"
    return if @assigned_bunk_ids.include?(bunk.id) || @assigned_assignable_ids.include?(assignable_key)

    BunkAssignment.create!(
      reservation_week: @reservation_week,
      assignable: assignable,
      bunk: bunk
    )

    # Track the assignments
    @assigned_bunk_ids.add(bunk.id)
    @assigned_assignable_ids.add(assignable_key)
  end
end
