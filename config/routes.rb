Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  get "mis_publicaciones", to: "posts#mis_publicaciones"

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :posts do
    resources :reviews, only: [:create, :update]
  end
  resources :reviews, only: [:edit, :destroy]
end
