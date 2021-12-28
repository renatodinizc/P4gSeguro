Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  root to: 'home#index'

  resources :companies
  resources :users, only: [:show]
end
