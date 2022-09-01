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

# Create example recipes in dev
if Rails.env.development?
  Recipe.transaction do
    53.times do
      Recipe.create title: Faker::Food.unique.dish, ingredients: "#{Faker::Food.measurement} #{Faker::Food.ingredient}, #{Faker::Food.measurement} #{Faker::Food.ingredient}, #{Faker::Food.measurement} #{Faker::Food.ingredient}", instructions: Faker::Food.description, category_id: rand(1..Category.count)
    end
  end
  puts "Created example recipes."
end
