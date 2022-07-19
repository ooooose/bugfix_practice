Rails.application.routes.draw do
  root 'top_pages#index'
  get '/top_pages/help', to: 'top_pages#help'
  get '/top_pages',   to: 'top_pages#index'
  get    '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  get    '/login',   to: 'user_sessions#new'
  post  '/login',   to:'user_sessions#create'
  delete '/logout',  to: 'user_sessions#destroy'
  resources :users
end
