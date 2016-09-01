Rails.application.routes.draw do
  namespace :admin do
    resources :items
  end
  devise_for :users, controllers: {sessions: 'admin/sessions'}
  root 'statics#home'

  namespace :admin do
    resources :products
  end
end
