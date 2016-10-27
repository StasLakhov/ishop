Rails.application.routes.draw do
  get 'carts/show'

  root 'products#index'

  resources :products, only: [:index, :new, :create, :show, :destroy]
  resources :users
  resources :carts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
