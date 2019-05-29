Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :users, only: [:show]
  resources :messages, only: [:index, :new, :create, :edit, :update, :delete]
end
