Rails.application.routes.draw do

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  get 'products/index'

  devise_for :users, controllers: {sessions: 'admin/sessions'}

  resources :products, only: [:index]
  resources :categories
  resource :cart, only: [:show]
  resources :orders, only: :update
  resources :order_items, only: [:create, :update, :destroy]
  root to: "products#index"

  # root 'statics#home'
  get '/cart' => 'carts#index'
  get '/cart/clear' => 'carts#clearCart'
  get '/cart/:id' => 'carts#add'

  resources :items, only: [:index, :show]
  namespace :admin do
    resources :products
    resources :product_attachments, only: [:destroy]
    resources :items
    resources :item_attachments, only: [:destroy]
  end
end
