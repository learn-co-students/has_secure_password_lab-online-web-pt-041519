Rails.application.routes.draw do

  get '/home', to: 'users#home'
  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  root 'sessions#new'

end
