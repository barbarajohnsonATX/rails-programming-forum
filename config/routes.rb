Rails.application.routes.draw do

  resources :categories
root 'sessions#home'

get '/signup' => 'users#new'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'

resources :users
resources :questions

end
