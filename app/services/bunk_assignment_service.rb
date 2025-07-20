require 'set'

class BunkAssignmentService
  def initialize(reservation_week)
    @reservation_week = reservation_week
    @assigned_bunk_ids = Set.new
    @assigned_assignable_ids = Set.new
  end

  def generate_assignments
    # Clear existing assignments for this week
    @reservation_week.bunk_assignments.destroy_all

    # Reset tracking sets
    @assigned_bunk_ids.clear
    @assigned_assignable_ids.clear

    # Step 1: Fetch Data
    assignables = @reservation_week.all_assignables
    bunks = Bunk.includes(:room, :owner).joins(:room)

    # Step 2: Assign Owners (only reservations can own bunks)
    assign_owners(assignables.select { |a| a.is_a?(Reservation) }, bunks)

    # Step 3: Assign Non-Owners (both reservations and guests)
    assign_non_owners(assignables, bunks)
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
        assignable_type, assignable_id = assignable_data.split(':')

        assignable = case assignable_type
                     when 'Reservation'
                       @reservation_week.reservations.find(assignable_id)
                     when 'Guest'
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

      # Find if this user owns any bunks
      owned_bunks = bunks.select { |bunk| bunk.owner_id == reservation.user_id }

      owned_bunks.each do |bunk|
        # Skip if bunk is already assigned
        next if @assigned_bunk_ids.include?(bunk.id)

        # Check gender compatibility
        if gender_compatible?(reservation, bunk)
          create_assignment(reservation, bunk)
          break # Only assign to one owned bunk per reservation
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
        bunk = preferred_bunks.sort_by { |b| [b.room.order, b.order] }.first
        create_assignment(assignable, bunk)
      end
    end
  end

  def find_available_bunks(assignable, bunks)
    # Get bunks that are owned by someone who is also attending this week
    attending_owner_ids = @reservation_week.reservations.pluck(:user_id)
    unavailable_owned_bunk_ids = bunks.select do |bunk|
      bunk.owned? && attending_owner_ids.include?(bunk.owner_id)
    end.map(&:id)

    # Filter bunks
    bunks.select do |bunk|
      gender_compatible?(assignable, bunk) &&
        !@assigned_bunk_ids.include?(bunk.id) &&
        !unavailable_owned_bunk_ids.include?(bunk.id)
    end
  end

  def gender_compatible?(assignable, bunk)
    room_gender = bunk.room.gender
    assignable_gender = assignable.sex&.downcase

    case room_gender
    when 'men'
      assignable_gender == 'male'
    when 'women'
      assignable_gender == 'female'
    when 'coed'
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
