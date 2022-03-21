Rails.application.routes.draw do
  resources :restaurants, param: :slug, only: :show
  resources :cuisines, param: :slug, only: :show

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :menu_items do
    resources :line_items, only: [:new, :create]
  end

  resources :carts, only: [:show]
  resources :line_items, only: [:destroy]

  resources :orders, only: [:new, :create, :show]

  get "/register", to: "users#new"
  get "/login", to: "sessions#new"
  delete '/logout',  to: 'sessions#destroy'

  root 'cuisines#index'
end
