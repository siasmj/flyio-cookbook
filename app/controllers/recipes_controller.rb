class RecipesController < ApplicationController
  include Pagy::Backend

  before_action :authenticate, except: %i[index show]
  before_action :get_categories, only: %i[new edit create update]
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @page_title = "Recipes"
    @recipes = Recipe.includes(:category).all
    @recipes = Recipe.search(params[:q]).includes(:category) if params[:q].present?
    @pagy, @recipes = pagy @recipes.reorder(sort_column => sort_direction)
  end

  def show
    @page_title = @recipe.title
  end

  def new
    @page_title = "New Recipe"
    @recipe = Recipe.new
  end

  def edit
    @page_title = "Edit #{@recipe.title}"
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: "Recipe was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: "Recipe was successfully deleted."
  end

  private

  def get_categories
    @categories = Category.all.collect { |c| [c.name, c.id] }
  end

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :category_id)
  end

  def set_recipe
    @recipe = Recipe.includes(:category).find(params[:id])
  end

  def sort_column
    %w[title category_id updated_at].include?(params[:sort]) ? params[:sort] : "updated_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
