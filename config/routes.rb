Rails.application.routes.draw do
  resources :comments
  root 'products#index'

  resources :products, only: [:index, :new, :create, :show, :destroy]
  resources :users
  resource :cart, only: [:show, :destroy] do
    get 'add', on: :member
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
