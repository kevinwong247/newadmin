Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # sets the landing page controller and route
  root to: 'users#index'
  
  # resources :posts implicitly defines
  #   the following routes
  # get '/users/', to: 'users#index', as: 'users'
  # get '/users/:id', to: 'users#show', as: 'user'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # post '/users/', to: 'users#create'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
  resources :users, except: [:new]

  resources :students 

  resources :courses

  resources :instructors

  resources :cohorts

  resources :students_cohorts





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login', to: 'sessions#new', as: 'login' # login_path, login_url
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new', as: 'signup' # signup_path, signup_url
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
