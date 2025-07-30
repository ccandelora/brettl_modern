namespace :reservations do
  desc "Fix invalid reservation_type values"
  task fix_reservation_types: :environment do
    puts "Checking for invalid reservation_type values..."

    invalid_reservations = Reservation.where(reservation_type: [ nil, "" ])
    puts "Found #{invalid_reservations.count} reservations with blank reservation_type"

    invalid_reservations.each do |reservation|
      puts "  #{reservation.user&.name || 'Unknown'} (#{reservation.reservation_week.res_date}): reservation_type is '#{reservation.reservation_type}'"
    end

    # Also check for invalid values
    invalid_values = Reservation.where.not(reservation_type: %w[myself other_member guest])
    puts "Found #{invalid_values.count} reservations with invalid reservation_type values"

    invalid_values.each do |reservation|
      puts "  #{reservation.user&.name || 'Unknown'} (#{reservation.reservation_week.res_date}): reservation_type is '#{reservation.reservation_type}'"
    end

    total_invalid = invalid_reservations.count + invalid_values.count
    puts "Total invalid reservations: #{total_invalid}"

    if total_invalid > 0
      puts "\nTo fix these, you can run:"
      puts "rails runner \"Reservation.where(reservation_type: [nil, '']).update_all(reservation_type: 'myself')\""
      puts "rails runner \"Reservation.where.not(reservation_type: %w[myself other_member guest]).update_all(reservation_type: 'myself')\""
    end
  end
end
