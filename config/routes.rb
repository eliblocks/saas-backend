Rails.application.routes.draw do
  root 'application#auth'

  devise_for :users

	get "/dashboard", to: 'dashboard#index'
	get "/auth", to: 'application#auth'

	resources :accounts, only: [:create]
  resources :users, only: [:index, :update, :destroy]
end
