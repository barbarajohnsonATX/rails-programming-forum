Rails.application.routes.draw do



namespace :admin do 
    root 'application#index'
    resources :categories
    resources :users 
    resources :questions do 
        resources :answers, only: [:index, :new, :create]
    end 
end 

 
root 'sessions#home'

get '/signup' => 'users#new'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'
get '/auth/google_oauth2/callback' => 'sessions#omniauth'

resources :question_tags
resources :tags, only: [:show]

#resources :questions
resources :users

resources :categories do
     resources :questions
end

resources :questions do 
    resources :likes
    resources :answers
end 


get 'search' => 'search#index'

 

end
