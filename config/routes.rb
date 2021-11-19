Rails.application.routes.draw do
  devise_for :users
  root to: "properties#index"
  resources :properties, only: [:index, :new, :create]
  resources :items, only: [:index, :new, :create]
end
