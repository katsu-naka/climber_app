Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'
  resources :tasks
  resources :projects 
  resources :users, only: [:index, :show]
end
