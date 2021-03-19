Rails.application.routes.draw do
  devise_for :users
  root to: "rankings#index"
  resources :users, only: [:edit, :update]
  resources :rankings, only: [:new, :create]
end
  