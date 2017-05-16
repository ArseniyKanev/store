Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :products, only: [:show, :index]
  resources :orders, only: [:index, :create]

  resource :cart, only: :show do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    get 'total', to: 'carts#total'
  end
end
