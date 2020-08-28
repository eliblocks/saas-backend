Rails.application.routes.draw do
  devise_for :users

	get "/dashboard", to: 'dashboard#index'
	get "/auth", to: 'application#auth'

	resources :accounts, only: [:create]
end
