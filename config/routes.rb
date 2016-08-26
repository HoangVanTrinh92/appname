Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'admin/sessions'}
  root 'statics#home'

  namespace :admin do
    resources :products
  end
end
