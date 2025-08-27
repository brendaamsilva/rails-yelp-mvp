require 'faker'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Restaurant.destroy_all

categories = %w[chinese italian japanese french belgian]

10.times do
  puts "Creating restaurants..."
  rest = Restaurant.create!(
    name: Faker::Restaurant.name,
    address:Faker::Address.full_address,
    phone_number:Faker::Number.number(digits: 8),
    category: categories.sample)
  Review.create!(
    content:"yummy yummy",
    rating:rand(1..5),
    restaurant_id: rest.id)
end


puts "Finished! Created #{Restaurant.count} restaurants."
