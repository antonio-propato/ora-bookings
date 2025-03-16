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
admin = User.create!(
  email:    'admin@example.com',
  password: 'password', # Change this to a secure password in a real app!
  admin:    true
)
puts "Admin user created with email: #{admin.email}"

Restaurant.destroy_all
Restaurant.create(name: "Delicious Delights", location: "123 Main St", cuisine: "Italian", description: "A fantastic place to eat!")
Restaurant.create(name: "Coffee House", location: "345 Side St", cuisine: "American", description: "Coffee and nice meals!")
puts "DB Seeding Complete"
