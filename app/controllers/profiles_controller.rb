class ProfilesController < ApplicationController
  before_action :set_user, only: [:dreams, :show, :edit, :update]
  def dreams
    @dreams = @user.dreams
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def set_user
    @user = current_user
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end
end