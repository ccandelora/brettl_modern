namespace :bunks do
  desc "Export bunks and rooms data to SQL file"
  task export_sql: :environment do
    timestamp = Time.current.strftime("%Y%m%d_%H%M%S")
    filename = "db/bunks_export_#{timestamp}.sql"

    File.open(filename, "w") do |file|
      file.puts "-- Bunks and Rooms Export"
      file.puts "-- Generated at #{Time.current}"
      file.puts "-- This file contains SQL INSERT statements for rooms and bunks"
      file.puts ""

      # Export rooms first (since bunks depend on rooms)
      file.puts "-- Clear existing data"
      file.puts "DELETE FROM bunk_assignments;"
      file.puts "DELETE FROM bunks;"
      file.puts "DELETE FROM rooms;"
      file.puts ""

      file.puts "-- Insert rooms"
      Room.order(:order, :id).each do |room|
        file.puts "INSERT INTO rooms (id, name, gender, \"order\", created_at, updated_at) VALUES"
        file.puts "(#{room.id}, '#{room.name}', '#{room.gender}', #{room.order}, '#{room.created_at}', '#{room.updated_at}');"
      end
      file.puts ""

      # Export bunks
      file.puts "-- Insert bunks"
      Bunk.joins(:room).order("rooms.order", :order, :id).each do |bunk|
        owner_id = bunk.owner_id ? bunk.owner_id : "NULL"
        file.puts "INSERT INTO bunks (id, room_id, owner_id, name, bunk_type, \"order\", created_at, updated_at) VALUES"
        file.puts "(#{bunk.id}, #{bunk.room_id}, #{owner_id}, '#{bunk.name}', '#{bunk.bunk_type}', #{bunk.order}, '#{bunk.created_at}', '#{bunk.updated_at}');"
      end
      file.puts ""

      # Reset sequences
      file.puts "-- Reset sequences"
      file.puts "SELECT setval('rooms_id_seq', COALESCE((SELECT MAX(id)+1 FROM rooms), 1), false);"
      file.puts "SELECT setval('bunks_id_seq', COALESCE((SELECT MAX(id)+1 FROM bunks), 1), false);"
    end

    puts "Exported #{Room.count} rooms and #{Bunk.count} bunks to #{filename}"
    puts "Rooms: #{Room.joins(:bunks).group('rooms.name').count.map { |name, count| "#{name} (#{count} bunks)" }.join(', ')}"
    puts "Bunk types: #{Bunk.group(:bunk_type).count}"
  end

  desc "Export bunks and rooms data to Ruby seed format"
  task export_seed: :environment do
    timestamp = Time.current.strftime("%Y%m%d_%H%M%S")
    filename = "db/seeds/bunks_export_#{timestamp}.rb"

    File.open(filename, "w") do |file|
      file.puts "# Bunks and Rooms Export - Ruby Seed Format"
      file.puts "# Generated at #{Time.current}"
      file.puts "# Usage: rails runner db/seeds/#{File.basename(filename)}"
      file.puts ""

      file.puts "puts 'Creating rooms and bunks from export...'"
      file.puts ""

      file.puts "# Clear existing data"
      file.puts "BunkAssignment.destroy_all"
      file.puts "Bunk.destroy_all"
      file.puts "Room.destroy_all"
      file.puts ""

      # Export rooms
      file.puts "# Create rooms"
      Room.order(:order, :id).each do |room|
        file.puts "#{room.name.downcase.gsub(' ', '_')} = Room.create!("
        file.puts "  name: '#{room.name}',"
        file.puts "  gender: '#{room.gender}',"
        file.puts "  order: #{room.order}"
        file.puts ")"
        file.puts ""
      end

      # Export bunks grouped by room
      Room.order(:order).each do |room|
        bunks = room.bunks.order(:order)
        next if bunks.empty?

        room_var = room.name.downcase.gsub(" ", "_")
        file.puts "# Create bunks for #{room.name}"
        file.puts "#{room_var}.bunks.create!(["

        bunk_data = bunks.map do |bunk|
          owner_part = bunk.owner ? ", owner: User.find_by(email: '#{bunk.owner.email}')" : ""
          "  { name: '#{bunk.name}', bunk_type: '#{bunk.bunk_type}', order: #{bunk.order}#{owner_part} }"
        end

        file.puts bunk_data.join(",\n")
        file.puts "])"
        file.puts ""
      end

      file.puts "puts \"Created \#{Room.count} rooms and \#{Bunk.count} bunks\""
      file.puts "puts \"Rooms: \#{Room.pluck(:name).join(', ')}\""
      file.puts "puts 'Export seed creation complete!'"
    end

    puts "Exported #{Room.count} rooms and #{Bunk.count} bunks to #{filename}"
  end

  desc "Show current bunks summary"
  task summary: :environment do
    puts "=== BUNKS SUMMARY ==="
    puts "Total Rooms: #{Room.count}"
    puts "Total Bunks: #{Bunk.count}"
    puts ""

    puts "Rooms:"
    Room.order(:order).each do |room|
      bunks_count = room.bunks.count
      owned_count = room.bunks.where.not(owner: nil).count
      puts "  #{room.name} (#{room.gender}): #{bunks_count} bunks (#{owned_count} owned, #{bunks_count - owned_count} open)"
    end
    puts ""

    puts "Bunk Types:"
    Bunk.group(:bunk_type).count.each do |type, count|
      puts "  #{type}: #{count}"
    end
    puts ""

    puts "Ownership:"
    puts "  Owned: #{Bunk.owned.count}"
    puts "  Open: #{Bunk.open.count}"
  end
end
