Rails.application.routes.draw do
  devise_for :users
  root to: "properties#index"
  resources :properties, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'search'
    end
    resources :rooms, only: [:index, :create, :show] do
      resources :approaches, only: [:index, :new]
    end
  end
  resources :items, only: [:index, :new, :create]
end
