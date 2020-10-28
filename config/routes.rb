Rails.application.routes.draw do

  resources :songs, only: [:index, :show] do
    collection do
      get 'search'
    end
  end
  resources :artists, only: [:index, :show]
  resources :genres, only: [:index, :show]
  resources :about, only: [:index]
  root to: 'home#index'
end
