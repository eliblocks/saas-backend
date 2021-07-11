class DashboardController < ApplicationController
	include ActionView::Helpers::DateHelper

	before_action :check_user_authentication!

	def index
		render json: {
			account_age: time_ago_in_words(current_account.created_at),
			users_count: current_account.users.count,
			plan: current_account.plan,
		}
	end
end
