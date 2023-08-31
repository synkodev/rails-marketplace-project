Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :orders, only: %i[:index, :show, :edit]
  resources :products

  devise_for :users
  root to: "products#index"
end
