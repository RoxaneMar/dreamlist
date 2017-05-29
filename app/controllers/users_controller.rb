class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def profile_edit
    @user = current_user
  end

  def profile_update
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end
end
