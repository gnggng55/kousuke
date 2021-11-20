Rails.application.routes.draw do
  devise_for :users
  root to: "properties#index"
  resources :properties, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:index, :new]
  resources :items, only: [:index, :new, :create]
end
