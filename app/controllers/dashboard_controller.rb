class DashboardController < ApplicationController
	before_action :check_user_authentication!

	def index
		render json: { message: "You are authenticated!" }
	end
end