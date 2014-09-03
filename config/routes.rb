Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  resources :lines
  resources :stations
  resources :stops
  resources :users
  resources :sessions

  root :to => 'homepages#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
