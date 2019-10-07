Rails.application.routes.draw do
  root 'application#home'
  resources :users, only:[:new, :create, :show]
  resources :sessions 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
