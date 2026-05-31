# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Case.destroy_all
User.destroy_all
puts "🗑️  Users & Cases cleared"

halo = User.create!(
  name: "Halo",
  email: "admin@murder.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true
)
puts "✅ Admin user created"

nick = User.create!(
  name: "Nick",
  email: "nick@murder.com",
  password: "341111",
  password_confirmation: "341111",
  admin: false
)
puts "✅ Nick created"

Case.create!(
  name: "The Vanishing at Blackwood Manor",
  intro: "A wealthy socialite has disappeared from her locked study. The guests are restless, the staff are hiding secrets, and nothing is as it seems.",
  created_by: User.find_by(name: "Nick"),
  status: 0
)

Case.create!(
  name: "The Murder at The Flowerist",
  intro: "A beloved florist is found dead among her flowers. The shop is locked, the bouquets are wilting, and someone in town knows more than they're letting on.",
  created_by: halo,
  status: :idea
)

Case.create!(
  name: "The Mystery of Cabin 3",
  intro: "A visitor to the secluded Pine Ridge Lodge has gone missing. With little evidence and plenty of rumours, it's up to you to piece together the truth behind their disappearance.",
  created_by: halo,
  status: :in_progress
)
puts "✅ 3 Cases created"
puts "✅ Case created"
