# Bunks and Rooms Export - Ruby Seed Format
# Generated at 2025-07-26 01:12:23 UTC
# Usage: rails runner db/seeds/bunks_export_20250726_011223.rb

puts 'Creating rooms and bunks from export...'

# Clear existing data
BunkAssignment.destroy_all
Bunk.destroy_all
Room.destroy_all

# Create rooms
cannon_mt = Room.create!(
  name: 'Cannon Mt',
  gender: 'women',
  order: 1
)

bear_mt = Room.create!(
  name: 'Bear Mt',
  gender: 'men',
  order: 1
)

attitash_mt = Room.create!(
  name: 'Attitash Mt',
  gender: 'women',
  order: 2
)

kings_room = Room.create!(
  name: 'Kings Room',
  gender: 'men',
  order: 2
)

black_mt = Room.create!(
  name: 'Black Mt',
  gender: 'women',
  order: 3
)

wildcat_mt = Room.create!(
  name: 'Wildcat Mt',
  gender: 'coed',
  order: 3
)

tyrol_mt = Room.create!(
  name: 'Tyrol Mt',
  gender: 'women',
  order: 4
)

masters = Room.create!(
  name: 'Masters',
  gender: 'men',
  order: 4
)

north_face = Room.create!(
  name: 'North Face',
  gender: 'men',
  order: 5
)

hog_haven = Room.create!(
  name: 'Hog Haven',
  gender: 'men',
  order: 6
)

# Create bunks for Cannon Mt
cannon_mt.bunks.create!([
  { name: '3 L', bunk_type: 'Lower', order: 1, owner: User.find_by(email: 'mischy@comcast.net') },
  { name: '4 U', bunk_type: 'Upper', order: 2 },
  { name: '5 L', bunk_type: 'Lower', order: 3, owner: User.find_by(email: 'aciak2004@yahoo.com') },
  { name: '6 U', bunk_type: 'Upper', order: 4 },
  { name: '7 L', bunk_type: 'Lower', order: 5 },
  { name: '8 U', bunk_type: 'Upper', order: 6, owner: User.find_by(email: 'meganmccauley6@gmail.com') }
])

# Create bunks for Bear Mt
bear_mt.bunks.create!([
  { name: '1 L', bunk_type: 'Lower', order: 1 },
  { name: '2 U', bunk_type: 'Upper', order: 2 },
  { name: '3 L', bunk_type: 'Lower', order: 3 },
  { name: '4 U', bunk_type: 'Upper', order: 4 },
  { name: '5 L', bunk_type: 'Lower', order: 5, owner: User.find_by(email: 'jdobermill@yahoo.com') },
  { name: '6 U', bunk_type: 'Upper', order: 6 }
])

# Create bunks for Kings Room
kings_room.bunks.create!([
  { name: '9 L', bunk_type: 'Lower', order: 1, owner: User.find_by(email: 'chris.candelora@gmail.com') },
  { name: '10 U', bunk_type: 'Upper', order: 2, owner: User.find_by(email: 'ford289@hotmail.com') },
  { name: '11 L', bunk_type: 'Lower', order: 3, owner: User.find_by(email: 'brickteewall@gmail.com') },
  { name: '12 U', bunk_type: 'Upper', order: 4, owner: User.find_by(email: 'douglasrobertmayo@yahoo.com') }
])

# Create bunks for Attitash Mt
attitash_mt.bunks.create!([
  { name: '9 L', bunk_type: 'Lower', order: 1 },
  { name: '10 U', bunk_type: 'Upper', order: 2 },
  { name: '11 L', bunk_type: 'Lower', order: 3, owner: User.find_by(email: 'amccarthy005@yahoo.com') },
  { name: '12 U', bunk_type: 'Upper', order: 4 },
  { name: '13 L', bunk_type: 'Lower', order: 5, owner: User.find_by(email: 'murphyn318@gmail.com') },
  { name: '14 U', bunk_type: 'Upper', order: 6 }
])

# Create bunks for Black Mt
black_mt.bunks.create!([
  { name: '15 L', bunk_type: 'Lower', order: 1, owner: User.find_by(email: 'bethrollsmith@gmail.com') },
  { name: '16 U', bunk_type: 'Upper', order: 2 },
  { name: '17 L', bunk_type: 'Lower', order: 3 },
  { name: '18 U', bunk_type: 'Upper', order: 4 },
  { name: '19 L', bunk_type: 'Lower', order: 5, owner: User.find_by(email: 'vsantarc@gmail.com') },
  { name: '20 U', bunk_type: 'Upper', order: 6 }
])

# Create bunks for Wildcat Mt
wildcat_mt.bunks.create!([
  { name: '15 S', bunk_type: 'Single', order: 1 },
  { name: '16 S', bunk_type: 'Single', order: 2, owner: User.find_by(email: 'ablohm@portcityair.com') },
  { name: '17 S', bunk_type: 'Single', order: 3 },
  { name: '18 S', bunk_type: 'Single', order: 4 },
  { name: '19 S', bunk_type: 'Single', order: 5 },
  { name: '20 S', bunk_type: 'Single', order: 6 },
  { name: '21 L', bunk_type: 'Lower', order: 7 },
  { name: '22 U', bunk_type: 'Upper', order: 8 },
  { name: '23 L', bunk_type: 'Lower', order: 9 },
  { name: '24 U', bunk_type: 'Upper', order: 10 }
])

# Create bunks for Tyrol Mt
tyrol_mt.bunks.create!([
  { name: '31 L', bunk_type: 'Lower', order: 1 },
  { name: '32 U', bunk_type: 'Upper', order: 2 },
  { name: '33 S', bunk_type: 'Single', order: 3 }
])

# Create bunks for Masters
masters.bunks.create!([
  { name: '25 S', bunk_type: 'Single', order: 1, owner: User.find_by(email: 'cjbroms@gmail.com') },
  { name: '26 S', bunk_type: 'Single', order: 2, owner: User.find_by(email: 'jelloshot@gmail.com') }
])

# Create bunks for North Face
north_face.bunks.create!([
  { name: '27 L', bunk_type: 'Lower', order: 1, owner: User.find_by(email: 'ohno21212@gmail.com') },
  { name: '28 U', bunk_type: 'Upper', order: 2, owner: User.find_by(email: 'dantshults@gmail.com') },
  { name: '29 L', bunk_type: 'Lower', order: 3, owner: User.find_by(email: 'markrbuckley@gmail.com') },
  { name: '29 U', bunk_type: 'Upper', order: 4 },
  { name: '30 S', bunk_type: 'Single', order: 5, owner: User.find_by(email: 'janlankowski@comcast.net') }
])

# Create bunks for Hog Haven
hog_haven.bunks.create!([
  { name: '31 L', bunk_type: 'Lower', order: 1 },
  { name: '32 U', bunk_type: 'Upper', order: 2 },
  { name: '33 L', bunk_type: 'Lower', order: 3, owner: User.find_by(email: 'kurtyang04@gmail.com') },
  { name: '33 U', bunk_type: 'Upper', order: 4 },
  { name: '34 S', bunk_type: 'Single', order: 5 }
])

puts "Created #{Room.count} rooms and #{Bunk.count} bunks"
puts "Rooms: #{Room.pluck(:name).join(', ')}"
puts 'Export seed creation complete!'
