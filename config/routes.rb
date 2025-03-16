Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :restaurants
  end

  resources :restaurants, controller: 'public_restaurants', only: [:index, :show] # Added show route

  root to: 'public_restaurants#index'
end
