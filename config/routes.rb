Rails.application.routes.draw do
  get 'inquiryes/new'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'tasks#index'
  resources :tasks do
    post 'done_update', to: 'tasks#done_update' 
    post 'done_remove', to: 'tasks#done_remove' 
  end
  resources :projects
  resources :users, only: [:index, :show]
  resources :inquiries
end
