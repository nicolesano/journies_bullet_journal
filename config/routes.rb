Rails.application.routes.draw do
  root 'static_pages#home'

  get 'dashboard', to: 'static_pages#dashboard'

  get '/signup', to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :entries, except: [:index]
  resources :tasks, except: [:index, :create]

  post '/dashboard', to: 'tasks#create'
end
