Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :orders, only: [:index, :show, :edit]
  resources :products do
    collection do
      get "my_products"
    end
  end

  devise_for :users
  root to: "products#index"
end
