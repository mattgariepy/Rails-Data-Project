Rails.application.routes.draw do
  get 'genres/index'
  get 'genres/show'
  get 'artists/index'
  get 'artists/show'
  get 'songs/index'
  get 'songs/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
