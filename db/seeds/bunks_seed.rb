# Bunk List Seed Data
# This file creates sample rooms and bunks for the Brettl-Hupfers Ski Club

puts "Creating rooms and bunks..."

# Clear existing data
BunkAssignment.destroy_all
Bunk.destroy_all
Room.destroy_all

# Women's Rooms
cannon_mt = Room.create!(
  name: "Cannon Mt",
  gender: "women",
  order: 1
)

bear_mt = Room.create!(
  name: "Bear Mt",
  gender: "women",
  order: 2
)

# Men's Rooms
wildcat_mt = Room.create!(
  name: "Wildcat Mt",
  gender: "men",
  order: 1
)

loon_mt = Room.create!(
  name: "Loon Mt",
  gender: "men",
  order: 2
)

attitash_mt = Room.create!(
  name: "Attitash Mt",
  gender: "men",
  order: 3
)

# Create bunks for Cannon Mt (Women's)
cannon_mt.bunks.create!([
  { name: "1 L", bunk_type: "Lower", order: 1 },
  { name: "1 U", bunk_type: "Upper", order: 2 },
  { name: "2 L", bunk_type: "Lower", order: 3 },
  { name: "2 U", bunk_type: "Upper", order: 4 },
  { name: "3 S", bunk_type: "Single", order: 5 },
  { name: "4 S", bunk_type: "Single", order: 6 }
])

# Create bunks for Bear Mt (Women's)
bear_mt.bunks.create!([
  { name: "5 L", bunk_type: "Lower", order: 1 },
  { name: "5 U", bunk_type: "Upper", order: 2 },
  { name: "6 L", bunk_type: "Lower", order: 3 },
  { name: "6 U", bunk_type: "Upper", order: 4 },
  { name: "7 L", bunk_type: "Lower", order: 5 },
  { name: "7 U", bunk_type: "Upper", order: 6 }
])

# Create bunks for Wildcat Mt (Men's)
wildcat_mt.bunks.create!([
  { name: "8 L", bunk_type: "Lower", order: 1 },
  { name: "8 U", bunk_type: "Upper", order: 2 },
  { name: "9 L", bunk_type: "Lower", order: 3 },
  { name: "9 U", bunk_type: "Upper", order: 4 },
  { name: "10 S", bunk_type: "Single", order: 5 },
  { name: "11 S", bunk_type: "Single", order: 6 }
])

# Create bunks for Loon Mt (Men's)
loon_mt.bunks.create!([
  { name: "12 L", bunk_type: "Lower", order: 1 },
  { name: "12 U", bunk_type: "Upper", order: 2 },
  { name: "13 L", bunk_type: "Lower", order: 3 },
  { name: "13 U", bunk_type: "Upper", order: 4 },
  { name: "14 L", bunk_type: "Lower", order: 5 },
  { name: "14 U", bunk_type: "Upper", order: 6 }
])

# Create bunks for Attitash Mt (Men's)
attitash_mt.bunks.create!([
  { name: "15 L", bunk_type: "Lower", order: 1 },
  { name: "15 U", bunk_type: "Upper", order: 2 },
  { name: "16 L", bunk_type: "Lower", order: 3 },
  { name: "16 U", bunk_type: "Upper", order: 4 },
  { name: "17 S", bunk_type: "Single", order: 5 },
  { name: "18 S", bunk_type: "Single", order: 6 }
])

# Assign some bunks to existing users (if any exist)
if User.any?
  sample_users = User.limit(6)
  sample_bunks = Bunk.limit(6)

  sample_users.zip(sample_bunks).each do |user, bunk|
    bunk.update!(owner: user) if bunk
  end
end

puts "Created #{Room.count} rooms and #{Bunk.count} bunks"
puts "Women's rooms: #{Room.women.count} (#{Room.women.joins(:bunks).distinct.count(:bunks)} bunks)"
puts "Men's rooms: #{Room.men.count} (#{Room.men.joins(:bunks).distinct.count(:bunks)} bunks)"
puts "Owned bunks: #{Bunk.owned.count}"
puts "Open bunks: #{Bunk.open.count}"
puts "Seed data creation complete!"
