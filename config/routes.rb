Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'admin/sessions'}

  root 'statics#home'
  get '/cart' => 'carts#index'
  get '/cart/clear' => 'carts#clearCart'
  get '/cart/:id' => 'carts#add'

  resources :items, only: [:index, :show]
  namespace :admin do
    resources :items
    resources :item_attachments, only: [:destroy]
  end
end
