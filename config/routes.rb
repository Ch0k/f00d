Rails.application.routes.draw do
  get 'tags/:tag', to: 'store#index', as: :tag
  devise_for :users
  resources :carts
  resources :line_items
  resources :products
  resources :orders 
  resources :users, only: [:index, :edit, :update] do
    collection do
      get 'orders'
    end
  end
  root 'store#index', as: 'store_index'
end
