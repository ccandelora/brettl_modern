namespace :reservations do
  desc "Fix reservation names to match user records for member reservations"
  task fix_reservation_names: :environment do
    puts "Fixing reservation names to match user records..."

    fixed_count = 0
    error_count = 0

    Reservation.includes(:user).each do |reservation|
      next unless reservation.user # Skip reservations without a user

      case reservation.reservation_type
      when "myself"
        # For myself reservations, name should match the user's name
        if reservation.name != reservation.user.name
          puts "  Fixing #{reservation.user.name} (#{reservation.reservation_week.res_date}): changing name from '#{reservation.name}' to '#{reservation.user.name}'"
          begin
            reservation.update!(name: reservation.user.name)
            fixed_count += 1
          rescue => e
            puts "  ERROR updating #{reservation.user.name} (#{reservation.reservation_week.res_date}): #{e.message}"
            error_count += 1
          end
        end
      when "other_member"
        # For other_member reservations, name should match the user's name
        if reservation.name != reservation.user.name
          puts "  Fixing #{reservation.user.name} (#{reservation.reservation_week.res_date}): changing name from '#{reservation.name}' to '#{reservation.user.name}'"
          begin
            reservation.update!(name: reservation.user.name)
            fixed_count += 1
          rescue => e
            puts "  ERROR updating #{reservation.user.name} (#{reservation.reservation_week.res_date}): #{e.message}"
            error_count += 1
          end
        end
      when "guest"
        # For guest reservations, name should be the guest's name (leave as is)
        puts "  Skipping #{reservation.name} (#{reservation.reservation_week.res_date}): guest reservation (name: '#{reservation.name}')"
      else
        puts "  Skipping #{reservation.user.name} (#{reservation.reservation_week.res_date}): invalid reservation_type '#{reservation.reservation_type}'"
        error_count += 1
      end
    end

    puts "Done! Fixed #{fixed_count} reservations. Errors: #{error_count}"
  end
end
