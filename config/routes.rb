Rails.application.routes.draw do
  root 'application#index'

  resources :users, only: [:new, :create, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
