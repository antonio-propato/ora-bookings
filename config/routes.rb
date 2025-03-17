Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :restaurants do
      member do
        delete :delete_picture
      end
    end
  end

  resources :restaurants, controller: "public_restaurants", only: [ :index, :show ]

  root to: "public_restaurants#index"
end
