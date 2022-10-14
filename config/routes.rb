Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :post do
    resources :review only: :create
  end
  resources :review only: [:edit, :update, :destroy]
end
