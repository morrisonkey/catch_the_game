Rails.application.routes.draw do
  devise_for :users
  
  root to: "broadcasts#index"
 # get 'exit', to: 'sessions#destroy', as: :logout
  resources :fans
  resources :groups
  resources :broadcasts
  resources :venues
  resources :teams
  resources :events, except: :destroy 
  resources :likes

  get '/search/teams' => 'teams#search'
  get '/delete/events/:id' => 'events#destroy'
  post 'events/:id' => 'events#update'
end
