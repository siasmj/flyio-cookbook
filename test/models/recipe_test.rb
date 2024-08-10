require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "creates valid record" do
    recipe = Recipe.new
    recipe.title = "Ice water"
    recipe.ingredients = "Water, ice"
    recipe.instructions = "Combine ingredients in a glass"
  end

  test "should not save unless title is filled in" do
    recipe = Recipe.new
    assert_not recipe.save
    assert recipe.errors[:title].include?("can't be blank")
  end

  test "should not save unless ingredients is filled in" do
    recipe = Recipe.new
    assert_not recipe.save
    assert recipe.errors[:ingredients].include?("can't be blank")
  end

  test "should not save unless instructions is filled in" do
    recipe = Recipe.new
    assert_not recipe.save
    assert recipe.errors[:instructions].include?("can't be blank")
  end

  test "should not duplicate titles" do
    recipe = Recipe.new
    recipe.title = "Cupcakes"
    recipe.ingredients = "Flour, sugar, eggs"
    recipe.instructions = "Mix ingredients..."
    assert recipe.save

    dupe_title = Recipe.new
    dupe_title.title = "Cupcakes"
    dupe_title.ingredients = "Flour, butter, eggs"
    dupe_title.instructions = "Mix ingredients..."
    assert_not dupe_title.save
    assert dupe_title.errors[:title].include?("has already been taken")
  end

  test "should find a match on title" do
    test_recipe = Recipe.create!(title: "Cake", ingredients: "Flour, sugar, eggs", instructions: "Mix ingredients...")

    assert_equal test_recipe, Recipe.search("cake").first
  end

  test "should find 2 matches on title" do
    Recipe.create!(title: "Cake", ingredients: "Flour, sugar, eggs", instructions: "Mix ingredients...")
    Recipe.create!(title: "Chocolate Cake", ingredients: "Flour, butter, eggs", instructions: "Mix ingredients...")

    assert_equal 2, Recipe.search("cake").count
  end

  test "should find a match on ingredients" do
    test_recipe = Recipe.create!(title: "Cake", ingredients: "Flour, sugar, eggs", instructions: "Mix ingredients...")

    assert_equal test_recipe, Recipe.search("flour").first
  end

  test "should find a match on instructions" do
    test_recipe = Recipe.create!(title: "Cake", ingredients: "Flour, sugar, eggs", instructions: "Mix ingredients...")

    assert_equal test_recipe, Recipe.search("mix").first
  end
end
