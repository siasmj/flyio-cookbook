# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

# Create categories
Category.transaction do
  Category.create name: "Appetizers"
  Category.create name: "Beverages"
  Category.create name: "Breakfast"
  Category.create name: "Desserts"
  Category.create name: "Entrees"
  Category.create name: "Sandwiches"
end
puts "Created categories."

# Create example recipes
Recipe.transaction do
  53.times do
    Recipe.create title: Faker::Food.unique.dish, ingredients: "#{Faker::Food.measurement} #{Faker::Food.ingredient}, #{Faker::Food.measurement} #{Faker::Food.ingredient}, #{Faker::Food.measurement} #{Faker::Food.ingredient}", instructions: Faker::Food.description, category_id: rand(1..Category.count)
  end
end
puts "Created example recipes."
