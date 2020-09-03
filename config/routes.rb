Rails.application.routes.draw do
  root 'application#auth'

  devise_for :users

	get "/dashboard", to: 'dashboard#index'
	get "/auth", to: 'application#auth'
  get "/account", to: 'accounts#show'
  patch "/account", to: 'accounts#update'

	resources :accounts, only: [:create]
  resources :users, only: [:index, :update, :destroy]
  resources :tasks, only: [:index, :create, :update, :destroy]
end
