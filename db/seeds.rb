# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Load production data from SQL dump
# This runs the SQL dump we created from development

puts "Setting up basic data..."

# Commenting out SQL dump loading for now due to PostgreSQL compatibility issues
# sql_file = Rails.root.join('db', 'production_backup.sql')
#
# if File.exist?(sql_file)
#   puts "Executing SQL dump..."
#   sql_content = File.read(sql_file)
#
#   # Execute the SQL dump
#   ActiveRecord::Base.connection.execute(sql_content)
#
#   puts "✅ Production data loaded successfully!"
#   puts "📊 Current counts:"
#   puts "   Users: #{User.count}"
#   puts "   Reservation Weeks: #{ReservationWeek.count}"
#   puts "   Reservations: #{Reservation.count}"
#   puts "   Notes: #{Note.count}"
# else
#   puts "❌ SQL dump file not found at #{sql_file}"

puts "Creating default admin user..."

User.find_or_create_by(email: 'admin@brettl.org') do |user|
  user.password = 'change_me_now!'
  user.password_confirmation = 'change_me_now!'
  user.role = 2  # Admin role as integer
  user.name = 'Admin User'
  user.confirmed_at = Time.current
end

puts "✅ Default admin created: admin@brettl.org / change_me_now!"

# Create a sample reservation week
current_wednesday = Date.current.beginning_of_week(:wednesday)
ReservationWeek.find_or_create_by(res_date: current_wednesday) do |week|
  week.note = "Welcome to the Brettl-Hupfers Ski Club! This is a sample week."
end

next_wednesday = current_wednesday + 1.week
ReservationWeek.find_or_create_by(res_date: next_wednesday) do |week|
  week.note = "Next week's reservations are now open!"
end

puts "✅ Sample reservation weeks created"

# Load bunk list seed data
puts "\n" + "="*50
puts "Setting up Bunk List data..."
puts "="*50

load Rails.root.join('db', 'seeds', 'bunks_seed.rb')
