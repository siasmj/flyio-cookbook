Rails.application.routes.draw do
  root "pages#index"
  get "/about", to: "pages#about", as: "about"
  get "/contact", to: "pages#contact", as: "contact"
  resources :recipes
end
