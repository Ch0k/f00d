Rails.application.routes.draw do
  devise_for :users
  resources :carts
  resources :line_items
  resources :products
  root 'store#index', as: 'store_index'
end
