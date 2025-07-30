namespace :reservations do
  desc "Fix reservation sex values to match their user sex values"
  task fix_sex_values: :environment do
    puts "Fixing reservation sex values to match their user sex values..."

    fixed_count = 0
    error_count = 0

    Reservation.includes(:user).each do |reservation|
      next unless reservation.user # Skip reservations without a user

      # Skip reservations with invalid reservation_type
      unless reservation.reservation_type.present? && %w[myself other_member guest].include?(reservation.reservation_type)
        puts "  Skipping #{reservation.user.name} (#{reservation.reservation_week.res_date}): invalid reservation_type '#{reservation.reservation_type}'"
        error_count += 1
        next
      end

      user_sex = reservation.user.sex
      if reservation.sex != user_sex
        puts "  #{reservation.user.name} (#{reservation.reservation_week.res_date}): changing reservation sex from #{reservation.sex} to #{user_sex}"
        begin
          reservation.update!(sex: user_sex)
          fixed_count += 1
        rescue => e
          puts "  ERROR updating #{reservation.user.name} (#{reservation.reservation_week.res_date}): #{e.message}"
          error_count += 1
        end
      end
    end

    puts "Done! Fixed #{fixed_count} reservations. Errors: #{error_count}"
  end
end
