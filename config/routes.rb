Rails.application.routes.draw do
  resources :users
  get 'checkout/create'
  get 'checkout/new'

  root 'products#index'
  resources :checkout, only: [:create]

  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
  #
  post "checkout/create", to: "checkout#create"
  resources :webhooks, only: [:create]
  get "success", to: "checkout#success"
  get "cancel", to: "checkout#cancel"

  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
end
