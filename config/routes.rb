Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tags, only: [:show, :index]
  resources :species, only: [:show]
  resources :users, only: [:show, :edit, :update]
  resource  :gallery, only: [:show]
  namespace :user do
    resources :tags, only: [:index, :new, :create]
  end
end
