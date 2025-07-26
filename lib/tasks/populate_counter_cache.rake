namespace :counter_cache do
  desc "Populate reservations_count for all reservation weeks"
  task populate_reservations_count: :environment do
    puts "Populating reservations_count for all reservation weeks..."

    ReservationWeek.find_each do |week|
      count = week.reservations.count
      week.update_column(:reservations_count, count)
      puts "Week #{week.id} (#{week.res_date}): #{count} reservations"
    end

    puts "Counter cache population complete!"
  end
end
