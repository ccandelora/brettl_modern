namespace :reservations do
  desc "Create Guest objects for existing guest reservations that don't have them"
  task fix_guest_reservations: :environment do
    puts "Creating Guest objects for existing guest reservations..."

    fixed_count = 0
    error_count = 0

    Reservation.where(reservation_type: "guest").includes(:reservation_week).each do |reservation|
      # Check if a Guest object already exists for this reservation
      existing_guest = reservation.reservation_week.guests.find_by(name: reservation.name)

      if existing_guest
        puts "  Skipping #{reservation.name} (#{reservation.reservation_week.res_date}): Guest object already exists"
        next
      end

      begin
        # Create a Guest object for this guest reservation
        guest = reservation.reservation_week.guests.create!(
          name: reservation.name,
          sex: reservation.sex,
          guest_type: reservation.res_member_type
        )

        puts "  Created Guest object for #{reservation.name} (#{reservation.reservation_week.res_date})"
        fixed_count += 1
      rescue => e
        puts "  ERROR creating Guest for #{reservation.name} (#{reservation.reservation_week.res_date}): #{e.message}"
        error_count += 1
      end
    end

    puts "Done! Created #{fixed_count} Guest objects. Errors: #{error_count}"
  end
end
