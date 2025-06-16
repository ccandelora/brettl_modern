# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Load production data from SQL dump
# This runs the SQL dump we created from development

puts "Loading production data..."

sql_file = Rails.root.join('db', 'production_backup.sql')

if File.exist?(sql_file)
  puts "Executing SQL dump..."
  sql_content = File.read(sql_file)

  # Execute the SQL dump
  ActiveRecord::Base.connection.execute(sql_content)

  puts "✅ Production data loaded successfully!"
  puts "📊 Current counts:"
  puts "   Users: #{User.count}"
  puts "   Reservation Weeks: #{ReservationWeek.count}"
  puts "   Reservations: #{Reservation.count}"
  puts "   Notes: #{Note.count}"
else
  puts "❌ SQL dump file not found at #{sql_file}"
  puts "Creating default admin user..."

  User.find_or_create_by(email: 'admin@brettl.org') do |user|
    user.password = 'change_me_now!'
    user.password_confirmation = 'change_me_now!'
    user.admin = true
    user.name = 'Admin'
  end

  puts "✅ Default admin created: admin@brettl.org / change_me_now!"
end
