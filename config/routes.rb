Rails.application.routes.draw do
<<<<<<< HEAD

  devise_for :users
  root "pages#home"
=======
>>>>>>> master
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
<<<<<<< HEAD
  #resources :orders

  resources :orders, only: [:index, :show, :edit]

=======
  devise_for :users

  resources :products

  root to: "products#index"
>>>>>>> master
end
