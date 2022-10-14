Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  resources :posts do
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:edit, :update, :destroy]
end
