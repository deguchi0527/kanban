Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :lists, except: [:index, :show] do
    resources :cards, except: [:index]
  end
end
