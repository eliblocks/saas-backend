class AccountsController < ApplicationController
	before_action :check_admin

	def create
		@account = Account.new(account_params)
		@account.plan = 'free'

		if @account.save
			render json: @account
		else
			render json: { errors: @account.errors }, status: :unprocessable_entity
		end
	end

	def show
		render json: { account: current_account }
	end

	def update
		@account = current_user.account
		@account.update(account_params)

		render json: { account: @account }
	end

	private

	def account_params
		params.require(:account).permit(:name, :plan, users_attributes: [:full_name, :email, :password])
	end
end
