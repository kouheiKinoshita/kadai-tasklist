Rails.application.routes.draw do
 
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

 root to: "toppages#index"
 resources :tasks
 
 get "signup", to: "users#new"
 resources :users, only: [:show, :new, :create]
 
 get "login", to: "sessions#new"
 post "login", to: "sessions#create"
 delete "logout", to: "sessions#destroy"
end
