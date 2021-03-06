Rails.application.routes.draw do
  devise_for :users
  root to: "properties#index"
  resources :properties do
    collection do
      get 'search'
    end
    resources :rooms, only: [:index, :create, :show, :destroy, :edit, :update] do
      resources :approaches, only: [:index, :create, :destroy]
    end
  end

  resources :items do
    collection do
      get 'search'
    end
  end
end
