Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  root to: "pages#home"

  get "products/:id", to: "products#show"
=======
>>>>>>> master
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :orders, only: [:index, :show, :edit]
  resources :products

  devise_for :users
  root to: "products#index"
end
