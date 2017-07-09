Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
                                       :registrations => "users/registrations"}

  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  root to: 'static_page#index'

  resources :buyers
  resources :sellers
  resources :companies do
    get '/profile/new', to: 'companies#new_public_profile', as: :new_public_profile
    post '/profile/new', to: 'companies#create_public_profile', as: :create_public_profile
  end

  mount ActionCable.server => '/cable'
  resources :conversations, param: :id
  resources :messages

  # post '/notifications/:id', to: 'notifications#update_read', as: :update_notification_read
end
