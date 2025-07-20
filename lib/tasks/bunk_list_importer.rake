namespace :bunk_list do
  desc "Import master bunk list from HTML file"
  task import_from_html: :environment do
    require 'nokogiri'

    html_file = Rails.root.join('Bunk List Draft .html')

    unless File.exist?(html_file)
      puts "Error: HTML file not found at #{html_file}"
      exit 1
    end

    puts "Reading HTML file..."
    html_content = File.read(html_file)
    doc = Nokogiri::HTML(html_content)

    # Start transaction to ensure data consistency
    ActiveRecord::Base.transaction do
      puts "Clearing existing rooms and bunks..."
      BunkAssignment.destroy_all
      Bunk.destroy_all
      Room.destroy_all

      # Extract all table cells with bunk data
      table_cells = doc.css('td')

      women_rooms = []
      men_rooms = []
      current_section = nil
      current_room = nil

      table_cells.each do |cell|
        text = cell.text.strip

        # Check for section headers
        if text.include?("WOMEN'S ROOMS")
          current_section = 'women'
          current_room = nil
          next
        elsif text.include?("MEN'S ROOMS")
          current_section = 'men'
          current_room = nil
          next
        end

        # Skip if no section is set
        next unless current_section

        # Check for room names (these are room identifiers)
        if text.match(/^(Cannon Mt|Attitash Mt|Black Mt|Tyrol Mt|Bear Mt|Kings Room|Wildcat Mt|Masters|North Face|Hog Haven)$/)
          current_room = text
          next
        end

        # Check for bunk identifiers (number followed by L, U, or S)
        if text.match(/^\d+\s+[LUS]$/)
          next if current_room.nil?

          # Find the owner in the next cell
          owner_cell = cell.next_element
          owner_text = owner_cell&.text&.strip

          # Clean up owner name
          owner_name = nil
          if owner_text && !owner_text.empty? && owner_text != "Open" && owner_text != "Open." && owner_text != "n/a"
            owner_name = owner_text.gsub(/[^\w\s\.]/, '').strip
          end

          bunk_data = {
            room: current_room,
            bunk: text,
            owner: owner_name,
            section: current_section
          }

          if current_section == 'women'
            women_rooms << bunk_data
          else
            men_rooms << bunk_data
          end
        end
      end

      puts "Creating rooms and bunks..."

      # Process women's rooms
      women_room_order = 1
      women_rooms.group_by { |b| b[:room] }.each do |room_name, bunks|
        puts "Creating women's room: #{room_name}"
        room = Room.create!(
          name: room_name,
          gender: 'women',
          order: women_room_order
        )
        women_room_order += 1

        bunks.each_with_index do |bunk_data, index|
          bunk_name = bunk_data[:bunk]
          bunk_type = case bunk_name.split.last
                     when 'L' then 'Lower'
                     when 'U' then 'Upper'
                     when 'S' then 'Single'
                     end

          owner = nil
          if bunk_data[:owner]
            # Try to find user by name
            owner = User.find_by("name ILIKE ?", bunk_data[:owner])
          end

          puts "  Creating bunk: #{bunk_name} (Owner: #{bunk_data[:owner] || 'Open'})"
          room.bunks.create!(
            name: bunk_name,
            bunk_type: bunk_type,
            order: index + 1,
            owner: owner
          )
        end
      end

      # Process men's rooms
      men_room_order = 1
      men_rooms.group_by { |b| b[:room] }.each do |room_name, bunks|
        puts "Creating men's room: #{room_name}"
        room = Room.create!(
          name: room_name,
          gender: 'men',
          order: men_room_order
        )
        men_room_order += 1

        bunks.each_with_index do |bunk_data, index|
          bunk_name = bunk_data[:bunk]
          bunk_type = case bunk_name.split.last
                     when 'L' then 'Lower'
                     when 'U' then 'Upper'
                     when 'S' then 'Single'
                     end

          owner = nil
          if bunk_data[:owner]
            # Try to find user by name
            owner = User.find_by("name ILIKE ?", bunk_data[:owner])
          end

          puts "  Creating bunk: #{bunk_name} (Owner: #{bunk_data[:owner] || 'Open'})"
          room.bunks.create!(
            name: bunk_name,
            bunk_type: bunk_type,
            order: index + 1,
            owner: owner
          )
        end
      end

      puts "\nImport completed successfully!"
      puts "Created #{Room.count} rooms and #{Bunk.count} bunks"
      puts "Women's rooms: #{Room.where(gender: 'women').count}"
      puts "Men's rooms: #{Room.where(gender: 'men').count}"
      puts "Owned bunks: #{Bunk.where.not(owner: nil).count}"
      puts "Open bunks: #{Bunk.where(owner: nil).count}"
    end
  end

  desc "Show current bunk list summary"
  task summary: :environment do
    puts "\n=== Current Bunk List Summary ==="
    puts "Total Rooms: #{Room.count}"
    puts "Total Bunks: #{Bunk.count}"
    puts ""

    ['women', 'men'].each do |gender|
      puts "#{gender.capitalize}'s Rooms:"
      Room.where(gender: gender).order(:order).each do |room|
        bunks_count = room.bunks.count
        owned_count = room.bunks.where.not(owner: nil).count
        open_count = room.bunks.where(owner: nil).count

        puts "  #{room.name}: #{bunks_count} bunks (#{owned_count} owned, #{open_count} open)"

        room.bunks.ordered.each do |bunk|
          owner_name = bunk.owner ? bunk.owner.name : "Open"
          puts "    #{bunk.name} (#{bunk.bunk_type}) - #{owner_name}"
        end
      end
      puts ""
    end
  end
end
