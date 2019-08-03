Rails.application.routes.draw do

 
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

end
