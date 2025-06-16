namespace :user do
  desc "List all users with their ID, name, and email"
  task list: :environment do
    puts "--- User List ---"
    User.all.each do |user|
      puts "ID: #{user.id}, Name: #{user.name}, Email: #{user.email}"
    end
    puts "-----------------"
  end
end
