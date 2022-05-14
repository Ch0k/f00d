Rails.application.routes.draw do
  resources :carts
  resources :line_items
  resources :products
  root 'store#index', as: 'store_index'
end
