# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Faker::Config.locale = "fr"

# puts 'Creating 140 fake users, profile and participant'

# 140.times do
#   user = User.new(
#     email: Faker::Internet.safe_email,
#     password: Faker::Internet.password
#     )
#     user.save!
#   profile = Profile.new(
#       first_name: Faker::Name.first_name,
#       last_name: Faker::Name.last_name,
#       gender: Faker::Gender.binary_type,
#       phone_number: Faker::PhoneNumber.cell_phone
#     )
#     profile.user = user
#     profile.save!
#   participant = Participant.new(
#       role: "player"
#     )
#     participant.user = user
#     participant.save!
#   end


puts 'Creating 5 true users'
  user1 = User.new(
    email: 'jean.mennesson@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    admin: true
    )
  user1.save!

  user2= User.new(
    email: 'maxence.ammeux@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    admin: false
    )
  user2.save!

  user3= User.new(
    email: 'rodrigue.frassaint@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    admin: false
    )
  user3.save!

  user4= User.new(
    email: 'rodrigue.frassaint@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    admin: false
    )
  user4.save!

  user5 = User.new(
    email: 'jeanlucien.pourin@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    admin: false
    )
  user5.save!

 puts "Users created!"


puts 'Creating 4 true profiles'
  profile1 = Profile.new(
    user_id: 1,
    first_name: "Jean",
    last_name: "Mennesson",
    gender: "Homme",
    phone_number: "0671956602",
    role: "captain",
    status: "active",
    party: true
    )
  profile1.save!

  profile2 = Profile.new(
    user_id: 2,
    first_name: "Maxence",
    last_name: "Ammeux",
    gender: "Homme",
    phone_number: "0676547823",
    role: "captain",
    status: "active",
    party: true
    )
  profile2.save!

  profile3 = Profile.new(
    user_id: 3,
    first_name: "Rodrigue",
    last_name: "Frassaint",
    gender: "Homme",
    phone_number: "0634908751",
    role: "player",
    status: "active",
    party: false
    )
  profile3.save!

  profile4 = Profile.new(
    user_id: 4,
    first_name: "Armand",
    last_name: "Lavenne",
    gender: "Homme",
    phone_number: "0675009131",
    role: "player",
    status: "active",
    party: true
  )
  profile4.save!

  profile5 = Profile.new(
    user_id: 4,
    first_name: "Jean-Lucien",
    last_name: "Pourin",
    gender: "Homme",
    phone_number: "0694909151",
    role: "spectator",
    status: "inactive",
    party: true
  )
  profile5.save!

puts "Profiles created!"


puts 'Creating 2 teams'
team1 = Team.new(
  user_id: 1,
  name: "Les Jaunes de Montluçon",
  motto: "Boire ou conduire, il faut boire",
  status: :accepted
  )
team1.save!

team2 = Team.new(
  user_id: 2,
  name: "Les Verts de Saint-Étienne",
  motto: "Libéré, délivré",
  status: :accepted
  )
team2.save!

puts "Teams created"

puts 'Creating 3 players'
player1 = Participant.new(
  user_id: 1,
  team_id: 1,
  status: :accepted
  )
  player1.save!

player2 = Participant.new(
  user_id: 2,
  team_id: 2,
  status: :accepted
  )
  player2.save!

player3 = Participant.new(
  user_id: 3,
  team_id: 1,
  status: :pending
  )
player3.save!


puts "Players created!"
