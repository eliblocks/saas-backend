class AccountsController < ApplicationController
	def create
		@account = Account.new(account_params)

		if @account.save
			render json: @account
		else
			render json: { errors: @account.errors }, status: :unprocessable_entity
		end
	end

	private

	def account_params
		params.require(:account).permit(:name, users_attributes: [:full_name, :email, :password])
	end
end