Rails.application.routes.draw do

  resources :question_tags
  resources :tags
namespace :admin do 
    root 'application#index'
    resources :categories
    resources :users 
    resources :questions do 
        resources :answers
    end 
end 

 
root 'sessions#home'

get '/signup' => 'users#new'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'
get '/auth/google_oauth2/callback' => 'sessions#omniauth'


resources :questions

resources :users

resources :categories do
    #resources :questions, except: [:index]
    resources :questions
end

resources :questions do 
    resources :answers
end 

resources :tags, only: [:show]

get 'search' => 'search#index'

end
