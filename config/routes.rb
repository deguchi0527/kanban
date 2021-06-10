Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :lists, only: [:new, :create, :edit, :update]
end
