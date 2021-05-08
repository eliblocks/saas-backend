class ApplicationController < ActionController::API
	include ActionController::MimeResponds
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :check_user_authentication!, only: [:auth]
	respond_to :json

	def check_user_authentication!
		return if current_user

		render json: { error: "not signed in" }, status: :unauthorized
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
		devise_parameter_sanitizer.permit(:accept_invitation, keys: [:full_name, :admin])
		devise_parameter_sanitizer.permit(:account_update, keys: [:full_name])
		devise_parameter_sanitizer.permit(:invite, keys: [:admin])
	end

	def auth
		render json: current_user
	end

	def current_account
		current_user.account
	end

	def check_admin
    return if current_user.admin

    render json: { error: "not authorized" }, status: :unprocessable_entity
  end
end
