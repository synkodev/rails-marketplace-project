Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :orders, only: %i[index show edit]
  resources :products

  post 'cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'

  devise_for :users
  root to: "products#index"
end
