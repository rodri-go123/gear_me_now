Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: %i[index new create show] do
    resources :rental, only: %i[new create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
