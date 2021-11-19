Rails.application.routes.draw do
  devise_for :users
  root to: "properties#index"
  resources :properties, only: [:index, :new, :create] do
    collection do
      get 'serch'
    end
  end
  resources :rooms, only: [:index, :new]
  resources :items, only: [:index, :new, :create]
end
