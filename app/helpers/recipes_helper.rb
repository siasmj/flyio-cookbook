module RecipesHelper
  def sort_link_to(name, column, **)
    direction = if params[:sort] == column.to_s
      (params[:direction] == "asc") ? "desc" : "asc"
    else
      "asc"
    end
    link_to(name, request.params.merge(sort: column, direction: direction), **)
  end
end
