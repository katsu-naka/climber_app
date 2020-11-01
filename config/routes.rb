Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'
  resources :tasks do
    post 'done_update', to: 'tasks#done_update' 
    post 'done_remove', to: 'tasks#done_remove' 
  end
  resources :projects 
  resources :users, only: [:index, :show]
end
