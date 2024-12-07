require 'sidekiq/web'

Rails.application.routes.draw do
  # Mounting RailsAdmin only once
  authenticate :user, ->(u) { u.admin? } do
    # resources :tables
    mount Sidekiq::Web => '/sidekiq'
  end

  authenticate :user do
    # resources :tables
  end

  # Resource routes
  resources :order_items
  resources :orders
  resources :reservations
  resources :feedbacks
  # resources :tables
  resources :menu_items
  resources :cates
  resources :customers
  resources :tables
  resources :dashboards, only: [:index]
  # routes.rb
  resources :menu_items, only: [:show]

  

  # Devise routes for user authentication
  devise_for :users

  # Defines the root path route ("/")
  root "home#index"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
