Rails.application.routes.draw do
  root 'static_pages#home'

  get "dashboard", :to => "static_pages#dashboard"

  get 'users/new'
  resources :entries
end
