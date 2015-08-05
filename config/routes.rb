Rails.application.routes.draw do
  require 'resque/server'

  #Use mount to ask for external routes
  mount Resque::Server.new, at: "/resque"

  resources :articles
  resources :comments
  resource  :account,   only: [:show] do
    get :work
  end

  get  '/login'     => 'sessions#new'
  post '/login'     => 'sessions#create'
  get  '/logout'    => 'sessions#destroy'

  get  '/dashboard' => 'dashboard#show'

  root to: 'articles#index'
end
