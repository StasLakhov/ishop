Rails.application.routes.draw do
  root 'products#index'

  resources :products, only: [:index, :new, :create, :show, :destroy]
  resources :users
  resource :cart

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
