require "set"

# BunkAssignmentService handles the automated assignment of members and guests to bunks
# for a given reservation week. The assignment follows these priority rules:
#
# 1. OWNERS FIRST: Bunk owners are always assigned to their owned bunks (if attending)
# 2. PREFERRED MEMBERS: If a bunk's owner is not attending, preferred members are assigned
#    in rank order (1st, 2nd, 3rd, etc.)
# 3. GENERAL ASSIGNMENT: Remaining unassigned members/guests are assigned to available bunks
#
# SPECIAL CASE: OWNER ON PREFERRED LIST
# When a bunk owner is also on another bunk's preferred list:
# - If the owner is assigned to their own bunk, they stay there (owner priority)
# - If the owner is NOT assigned to their own bunk, they can be assigned to the preferred bunk
# - This prevents conflicts and ensures fair assignment
#
# Example:
# - Bunk A is owned by John
# - Bunk B has John as preferred member #1
# - If John is assigned to Bunk A, he stays there
# - If John is NOT assigned to Bunk A, he can be assigned to Bunk B as preferred member
#
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
    # Clear existing assignments
    @reservation_week.bunk_assignments.destroy_all
    @assigned_bunk_ids.clear
    @assigned_assignable_ids.clear

    # Step 1: Assign owners to their own bunks
    owner_reservations = reservations.select do |res|
      effective_user = res.effective_user
      effective_name = res.effective_name

      # Check if effective_user owns a bunk
      user_owns_bunk = effective_user && bunks.any? do |b|
        b.owner_id == effective_user.id ||
        (b.owner && b.owner.display_name.to_s.downcase == effective_user.display_name.to_s.downcase)
      end

      # Check if effective_name owns a bunk (for guest reservations where effective_user is nil)
      name_owns_bunk = effective_name && bunks.any? do |b|
        b.owner && b.owner.display_name.to_s.downcase == effective_name.to_s.downcase
      end

      user_owns_bunk || name_owns_bunk
    end

    owner_reservations.each do |reservation|
      effective_user = reservation.effective_user
      effective_name = reservation.effective_name

      # Find the bunk this person owns
      owned_bunk = bunks.find do |b|
        if effective_user
          b.owner_id == effective_user.id ||
          (b.owner && b.owner.display_name.to_s.downcase == effective_user.display_name.to_s.downcase)
        else
          b.owner && b.owner.display_name.to_s.downcase == effective_name.to_s.downcase
        end
      end

      if owned_bunk && !@assigned_bunk_ids.include?(owned_bunk.id)
        create_assignment(reservation, owned_bunk)
      end
    end

    # Step 2: Assign preferred members to bunks when owners are not attending
    bunks_with_preferred = bunks.select { |b| b.preferred_users.any? }

    bunks_with_preferred.each do |bunk|
      # Check if the owner is attending
      owner_attending = owner_reservations.any? do |owner_res|
        owner_effective_user = owner_res.effective_user
        owner_effective_name = owner_res.effective_name

        # Check by effective_user (for member reservations)
        user_match = owner_effective_user && (
          bunk.owner_id == owner_effective_user.id ||
          (bunk.owner && bunk.owner.display_name.to_s.downcase == owner_effective_user.display_name.to_s.downcase)
        )

        # Check by effective_name (for guest reservations)
        name_match = owner_effective_name && bunk.owner && bunk.owner.display_name.to_s.downcase == owner_effective_name.to_s.downcase

        user_match || name_match
      end

      # If owner is not attending, try to assign preferred members
      unless owner_attending
        bunk.preferred_users_ordered.each do |preferred_user|
          # Find the reservation for this preferred user
          preferred_reservation = reservations.find do |res|
            effective_user = res.effective_user
            effective_name = res.effective_name

            # Check by effective_user (for member reservations)
            user_match = effective_user && (
              effective_user.id == preferred_user.id ||
              effective_user.display_name.to_s.downcase == preferred_user.display_name.to_s.downcase
            )

            # Check by effective_name (for guest reservations)
            name_match = effective_name && effective_name.to_s.downcase == preferred_user.display_name.to_s.downcase

            user_match || name_match
          end

          if preferred_reservation
            # Check gender compatibility
            unless gender_compatible?(preferred_user, bunk)
              next
            end

            # If this preferred member is already assigned to their owned bunk, unassign them first
            if user_assigned_to_owned_bunk?(preferred_user, bunks)
              # Find their current assignment and remove it
              current_assignment = @reservation_week.bunk_assignments.find do |a|
                effective_user = a.assignable.effective_user
                effective_name = a.assignable.effective_name

                # Check by effective_user (for member reservations)
                user_match = effective_user && effective_user.id == preferred_user.id

                # Check by effective_name (for guest reservations)
                name_match = effective_name && effective_name.to_s.downcase == preferred_user.display_name.to_s.downcase

                user_match || name_match
              end

              if current_assignment
                current_assignment.destroy!
                @assigned_bunk_ids.delete(current_assignment.bunk_id)
                @assigned_assignable_ids.delete("Reservation:#{current_assignment.assignable_id}")
              end
            end

            create_assignment(preferred_reservation, bunk)
            break # Only assign the first available preferred member
          end
        end
      end
    end

    # Step 3: Assign remaining unassigned reservations to available bunks
    remaining_reservations = reservations.reject do |res|
      @assigned_assignable_ids.include?("Reservation:#{res.id}")
    end

    remaining_reservations.each do |reservation|
      available_bunks = find_available_bunks(reservation, bunks)
      if available_bunks.any?
        create_assignment(reservation, available_bunks.first)
      end
    end
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

  def reservations
    @reservations ||= @reservation_week.reservations.includes(:user)
  end

  def bunks
    @bunks ||= Bunk.includes(:room, :owner, :preferred_users, :bunk_preferred_members).joins(:room).order("rooms.order ASC, bunks.order ASC")
  end

  def assign_owners(reservations, bunks)
    reservations.each do |reservation|
      effective_user = reservation.effective_user
      next unless effective_user

      # Find bunks owned by this user
      owned_bunks = bunks.select do |bunk|
        bunk.owner_id == effective_user.id ||
        (bunk.owner && bunk.owner.display_name.to_s.downcase == effective_user.display_name.to_s.downcase)
      end

      # Try to assign to owned bunk
      owned_bunks.each do |bunk|
        if !@assigned_bunk_ids.include?(bunk.id) && gender_compatible?(reservation, bunk)
          create_assignment(reservation, bunk)
          debug_log "Assigned owner #{effective_user.display_name} to their bunk #{bunk.name}"
          break
        end
      end
    end
  end

  def assign_non_owners(assignables, bunks)
    # Get assignables that haven't been assigned yet
    unassigned_assignables = assignables.reject do |assignable|
      @assigned_assignable_ids.include?("#{assignable.class.name}:#{assignable.id}")
    end

    debug_log "Processing #{unassigned_assignables.size} unassigned assignables"

    unassigned_assignables.each do |assignable|
      # Skip owners - they should only get their own bunks or remain unassigned
      if assignable.is_a?(Reservation) && assignable.effective_user
        effective_user = assignable.effective_user
        owns_bunk = bunks.any? do |bunk|
          bunk.owner_id == effective_user.id ||
          (bunk.owner && bunk.owner.display_name.to_s.downcase == effective_user.display_name.to_s.downcase)
        end

        if owns_bunk
          debug_log "Skipping owner #{effective_user.display_name} - they should only get their own bunks"
          next
        end
      end

      available_bunks = find_available_bunks(assignable, bunks)

      if available_bunks.any?
        bunk = available_bunks.first
        create_assignment(assignable, bunk)
        debug_log "Assigned #{assignable.effective_name} to #{bunk.name}"
      else
        debug_log "No available bunks for #{assignable.effective_name}"
      end
    end
  end

  def is_available?(bunk)
    !@assigned_bunk_ids.include?(bunk.id)
  end

  def find_available_bunks(assignable, bunks)
    # Get bunks that are owned by someone who has a reservation this week
    attending_owner_ids = @reservation_week.reservations.pluck(:user_id)

    available_bunks = bunks.select do |bunk|
      # Bunk must be unassigned
      next false unless is_available?(bunk)

      # Bunk must be gender compatible
      next false unless gender_compatible?(assignable, bunk)

      # If bunk has an owner, owner must be attending this week
      if bunk.owner
        next false unless attending_owner_ids.include?(bunk.owner_id)
      end

      true
    end

    # Sort by priority: preferred member bunks first, then by room order, then bunk order
    available_bunks.sort_by do |bunk|
      # Check if this assignable is a preferred member for this bunk
      is_preferred_member = false
      if assignable.is_a?(Reservation)
        # Check both effective_user and user for preferred member status
        effective_user = assignable.effective_user
        user = assignable.user
        is_preferred_member = (effective_user && bunk.preferred_users.include?(effective_user)) ||
                             (user && bunk.preferred_users.include?(user))
      end

      # Sort by: preferred member status (false first, so preferred members get priority), room order, bunk order
      [ !is_preferred_member, bunk.room.order, bunk.order ]
    end
  end

  def owner_assigned_to_bunk?(owner_id)
    # Check if the owner has been assigned to any bunk in this week
    @assigned_assignable_ids.any? do |assignable_key|
      assignable_type, assignable_id = assignable_key.split(":")
      if assignable_type == "Reservation"
        reservation = @reservation_week.reservations.find_by(id: assignable_id)
        reservation&.user_id == owner_id
      else
        false
      end
    end
  end

  def user_assigned_to_owned_bunk?(user, bunks)
    @assigned_bunk_ids.any? do |bunk_id|
      bunk = bunks.find { |b| b.id == bunk_id }
      bunk && (
        bunk.owner_id == user.id ||
        (bunk.owner && bunk.owner.display_name.to_s.downcase == user.display_name.to_s.downcase)
      )
    end
  end

  def user_owns_bunk?(user, bunks)
    bunks.any? do |bunk|
      bunk.owner_id == user.id ||
      (bunk.owner && bunk.owner.display_name.to_s.downcase == user.display_name.to_s.downcase)
    end
  end

  def gender_compatible?(assignable, bunk)
    room_gender = bunk.room.gender&.downcase
    assignable_gender = assignable.sex&.downcase

    case room_gender
    when "women"
      assignable_gender == "female"
    when "men"
      assignable_gender == "male"
    when "coed"
      true # All genders allowed in coed rooms
    else
      true # Fallback - allow if room gender is not set
    end
  end

  def create_assignment(assignable, bunk)
    # Double-check that neither is already assigned
    assignable_key = "#{assignable.class.name}:#{assignable.id}"

    if @assigned_assignable_ids.include?(assignable_key)
      return
    end

    if @assigned_bunk_ids.include?(bunk.id)
      return
    end

    # Create the assignment
    assignment = BunkAssignment.create!(
      reservation_week: @reservation_week,
      assignable: assignable,
      bunk: bunk
    )

    # Update tracking
    @assigned_bunk_ids.add(bunk.id)
    @assigned_assignable_ids.add(assignable_key)

    debug_log "Assigned #{assignable.effective_name} to #{bunk.name}"

    # Ensure in-memory assignments are up to date for unassignment logic
    @reservation_week.bunk_assignments.reload
  end
end
