namespace :data do
  desc "Fix guest reservations that don't have proper associations with Guest objects"
  task fix_guest_reservations: :environment do
    puts "Fixing guest reservations..."

    # Find all guest reservations that don't have an associated guest
    guest_reservations_without_guest = Reservation.where(reservation_type: "guest").where(guest_id: nil)

    puts "Found #{guest_reservations_without_guest.count} guest reservations without proper associations"

    guest_reservations_without_guest.each do |reservation|
      puts "Processing reservation #{reservation.id} for #{reservation.name}..."

      # Check if there's already a guest with the same name in the same week
      existing_guest = reservation.reservation_week.guests.find_by(name: reservation.name)

      if existing_guest
        # Link the reservation to the existing guest
        reservation.update!(guest: existing_guest)
        puts "  Linked to existing guest #{existing_guest.id}"
      else
        # Create a new guest and link it
        guest = reservation.reservation_week.guests.create!(
          name: reservation.name,
          sex: reservation.sex,
          guest_type: reservation.res_member_type
        )
        reservation.update!(guest: guest)
        puts "  Created new guest #{guest.id} and linked"
      end
    end

    puts "Completed fixing guest reservations"
  end
end
