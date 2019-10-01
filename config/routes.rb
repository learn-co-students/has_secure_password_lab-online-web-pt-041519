Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/login' => 'sessions#create'
get '/login' => 'users#create'
get '/login' => 'users#new'

end
