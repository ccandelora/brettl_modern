namespace :users do
  desc "Fix user sex values to match their reservation sex values"
  task fix_sex_values: :environment do
    puts "Fixing user sex values to match their reservations..."

    fixed_count = 0
    User.includes(:reservations).each do |user|
      next unless user.reservations.any?

      reservation_sex = user.reservations.last.sex
      if user.sex != reservation_sex
        puts "  #{user.name}: changing from #{user.sex} to #{reservation_sex}"
        user.update!(sex: reservation_sex)
        fixed_count += 1
      end
    end

    puts "Done! Fixed #{fixed_count} users."
  end
end
