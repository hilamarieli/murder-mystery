# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Case.destroy_all
puts "🗑️  Users & Cases cleared"

User.create!(
  name: "Halo",
  email: "admin@murder.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true
)
puts "✅ Admin user created"

Case.create!(
  name: "The Vanishing at Blackwood Manor",
  intro: "A wealthy socialite has disappeared from her locked study. The guests are restless, the staff are hiding secrets, and nothing is as it seems.",
  created_by: User.find_by(name: "Halo")
)
puts "✅ Case created"
