class UsersController < ApplicationController
  def index
    @users = current_user.account.users

    render json: @users
  end

  def update
    @user = current_user.account.users.find(params[:id])
    if @user.update(user_params)
      render json: { user: @user }
    else
      render json: { errors: @user.errors }
    end
  end

  def destroy
    @user = current_user.account.users.find(params[:id])

    @user.destroy

    render json: { success: true }

  end

  def user_params
    params.require(:user).permit(:admin, :full_name)
  end
end
