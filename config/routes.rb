Rails.application.routes.draw do
  devise_for :users
  
  root to: "welcome#index"

  resources :fans
  resources :groups
  resources :broadcasts
  resources :venues
  resources :teams
  resources :events
  resources :likes

  get '/search/teams' => 'teams#search'
end
