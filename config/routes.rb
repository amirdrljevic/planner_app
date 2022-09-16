Rails.application.routes.draw do
  devise_for :users
  #resources :users, only: [:index, :show] #leave it for now, but it will probably go
  resources :users, :controller => "users" 
  get 'home/index'
  resources :companies
  resources :roles
  root 'home#index'
  resources :departments
end
