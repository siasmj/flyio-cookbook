require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
    @account = accounts(:one)
  end

  test "should get index" do
    get recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_url
    assert_response 302
    assert_redirected_to "/login"
    assert_equal "Please login to continue", flash[:alert]
    login(@account)
    get new_recipe_url
    assert_response :success
  end

  test "should create recipe" do
    get "/login"
    assert_response :success
    login(@account)
    assert_difference("Recipe.count") do
      post recipes_url, params: { recipe: { ingredients: @recipe.ingredients, instructions: @recipe.instructions, title: @recipe.title } }
    end

    assert_redirected_to recipe_url(Recipe.last)
  end

  test "should show recipe" do
    get recipe_url(@recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_url(@recipe)
    assert_response 302
    assert_redirected_to "/login"
    assert_equal "Please login to continue", flash[:alert]
    login(@account)
    get edit_recipe_url(@recipe)
    assert_response :success
  end

  test "should update recipe" do
    get "/login"
    assert_response :success
    login(@account)
    patch recipe_url(@recipe), params: { recipe: { ingredients: @recipe.ingredients, instructions: @recipe.instructions, title: @recipe.title } }
    assert_redirected_to recipe_url(@recipe)
  end

  test "should destroy recipe" do
    get "/login"
    assert_response :success
    login(@account)
    assert_difference("Recipe.count", -1) do
      delete recipe_url(@recipe)
    end

    assert_redirected_to recipes_url
  end

  private

  def login(account)
    session[:account_id] = account.id
    session[:authenticated_by] = [ "password" ]
  end

  def logout
    session.clear
  end
end
