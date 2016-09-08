Rails.application.routes.draw do
  namespace :admin do
    resources :items
    resources :item_attachments, only: [:destroy]
  end
  devise_for :users, controllers: {sessions: 'admin/sessions'}
  root 'statics#home'
end
