Rails.application.routes.draw do
  resources :carts
  resources :line_items
  resources :products
  root "store#index"
end
