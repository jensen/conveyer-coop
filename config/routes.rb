Rails.application.routes.draw do
  resources :restaurants, param: :slug, only: :show
  resources :cuisines, param: :slug, only: :show

  root 'cuisines#index'
end
