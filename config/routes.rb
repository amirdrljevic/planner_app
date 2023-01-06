Rails.application.routes.draw do
  resources :meetings do
    resources :comments
  end
  devise_for :users
  #resources :users, only: [:index, :show] #leave it for now, but it will probably go
  resources :users_admin, :controller => "users" 
  #get 'home/index'
  resources :companies
  resources :roles
  root 'home#index'
  resources :departments, except: [:show]

  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
end
