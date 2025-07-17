class BunkAssignmentService
  def initialize(reservation_week)
    @reservation_week = reservation_week
  end

  def generate_assignments
    # Clear existing assignments for this week
    @reservation_week.bunk_assignments.destroy_all

    # Step 1: Fetch Data
    reservations = @reservation_week.reservations.includes(:user)
    bunks = Bunk.includes(:room, :owner).joins(:room)

    # Step 2: Assign Owners
    assign_owners(reservations, bunks)

    # Step 3: Assign Non-Owners
    assign_non_owners(reservations, bunks)
  end

  def update_assignments(assignment_params)
    # Handle manual updates to assignments
    assignment_params.each do |bunk_id, reservation_id|
      bunk = Bunk.find(bunk_id)

      # Remove existing assignment for this bunk in this week
      existing_assignment = @reservation_week.bunk_assignments.find_by(bunk: bunk)
      existing_assignment&.destroy

      # Create new assignment if reservation_id is present and not empty
      if reservation_id.present? && reservation_id != ""
        reservation = @reservation_week.reservations.find(reservation_id)

        # Remove any existing assignment for this reservation in this week
        existing_res_assignment = @reservation_week.bunk_assignments.find_by(reservation: reservation)
        existing_res_assignment&.destroy

        # Create the new assignment
        BunkAssignment.create!(
          reservation_week: @reservation_week,
          reservation: reservation,
          bunk: bunk
        )
      end
    end
  end

  private

  def assign_owners(reservations, bunks)
    reservations.each do |reservation|
      # Find if this user owns any bunks
      owned_bunks = bunks.select { |bunk| bunk.owner_id == reservation.user_id }

      owned_bunks.each do |bunk|
        # Check gender compatibility
        if gender_compatible?(reservation, bunk)
          create_assignment(reservation, bunk)
          break # Only assign to one owned bunk per reservation
        end
      end
    end
  end

  def assign_non_owners(reservations, bunks)
    # Get reservations that haven't been assigned yet
    assigned_reservation_ids = @reservation_week.bunk_assignments.pluck(:reservation_id)
    unassigned_reservations = reservations.reject { |r| assigned_reservation_ids.include?(r.id) }

    unassigned_reservations.each do |reservation|
      # Find available bunks for this reservation's gender
      available_bunks = find_available_bunks(reservation, bunks)

      # Prefer open bunks over owned bunks
      open_bunks = available_bunks.select(&:open?)
      owned_bunks = available_bunks.select(&:owned?)

      preferred_bunks = open_bunks.any? ? open_bunks : owned_bunks

      if preferred_bunks.any?
        # Assign to the first available bunk (ordered by room order, then bunk order)
        bunk = preferred_bunks.sort_by { |b| [b.room.order, b.order] }.first
        create_assignment(reservation, bunk)
      end
    end
  end

  def find_available_bunks(reservation, bunks)
    # Get bunks that are already assigned this week
    assigned_bunk_ids = @reservation_week.bunk_assignments.pluck(:bunk_id)

    # Get bunks that are owned by someone who is also attending this week
    attending_owner_ids = @reservation_week.reservations.pluck(:user_id)
    unavailable_owned_bunk_ids = bunks.select do |bunk|
      bunk.owned? && attending_owner_ids.include?(bunk.owner_id)
    end.map(&:id)

    # Filter bunks
    bunks.select do |bunk|
      gender_compatible?(reservation, bunk) &&
        !assigned_bunk_ids.include?(bunk.id) &&
        !unavailable_owned_bunk_ids.include?(bunk.id)
    end
  end

  def gender_compatible?(reservation, bunk)
    room_gender = bunk.room.gender
    reservation_gender = reservation.sex&.downcase

    case room_gender
    when 'men'
      reservation_gender == 'male'
    when 'women'
      reservation_gender == 'female'
    else
      false
    end
  end

  def create_assignment(reservation, bunk)
    BunkAssignment.create!(
      reservation_week: @reservation_week,
      reservation: reservation,
      bunk: bunk
    )
  end
end
