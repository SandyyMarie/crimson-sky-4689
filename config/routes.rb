Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chefs do
    resources :dishes
  end

  resources :dishes, only: [:show] do
    resources :ingredients
  end
end
