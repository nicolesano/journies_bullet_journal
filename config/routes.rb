Rails.application.routes.draw do
  root 'static_pages#home'

  get "dashboard", :to => "static_pages#dashboard"

  get '/signup', to: 'users#new'
  
  resources :users
  
  resources :entries
end
