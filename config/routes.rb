Rails.application.routes.draw do

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'rankings/want', to: 'rankings#want'
  get 'rankings/good', to: 'rankings#good'
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
  resources :shops, only: [:new, :show]
  resources :wants, only: [:create, :destroy]
  resources :goods, only: [:create, :destroy]
  
end
