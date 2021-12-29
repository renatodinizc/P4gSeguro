Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  root to: 'home#index'

  resources :companies do
    post 'accept', on: :member
  end
  
  resources :users, only: [:show]
  resources :admins, only: [:show]
end
