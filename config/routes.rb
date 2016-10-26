Rails.application.routes.draw do
  get 'carts/show'

  get 'carts_controller/show'

  root 'products#index'

  resources :products, only: [:index, :new, :create, :show, :destroy]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
