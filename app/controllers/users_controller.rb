class UsersController < ApplicationController
  def index
    @users = current_user.account.users

    render json: @users
  end
end
