Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: %i[index new create show edit update destroy] do
    resources :rentals, only: %i[new create]
    # resources :pages, only: %i[dashboard]
  end
  get '/dashboard', to: 'pages#dashboard'
  get '/map', to: 'pages#map'
end
