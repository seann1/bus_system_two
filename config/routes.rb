Rails.application.routes.draw do
  root :to => 'homepages#index'
  resources :lines
  resources :stations
  resources :stops
end
