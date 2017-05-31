Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  root to: 'static_page#index'

  resources :buyers
  resources :sellers
  resources :companies
end
