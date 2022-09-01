class PagesController < ApplicationController
  def index
    @number_of_recipes = Recipe.count
  end

  def about
    @page_title = "About"
  end

  def contact
    @page_title = "Contact"
  end
end
