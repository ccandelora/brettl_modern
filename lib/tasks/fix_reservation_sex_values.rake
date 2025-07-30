namespace :reservations do
  desc "Fix reservation sex values to match their user sex values"
  task fix_sex_values: :environment do
    puts "Fixing reservation sex values to match their user sex values..."

    fixed_count = 0
    Reservation.includes(:user).each do |reservation|
      next unless reservation.user # Skip reservations without a user

      user_sex = reservation.user.sex
      if reservation.sex != user_sex
        puts "  #{reservation.user.name} (#{reservation.reservation_week.res_date}): changing reservation sex from #{reservation.sex} to #{user_sex}"
        reservation.update!(sex: user_sex)
        fixed_count += 1
      end
    end

    puts "Done! Fixed #{fixed_count} reservations."
  end
end
