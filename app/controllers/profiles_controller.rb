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
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :edit
    end

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar)
  end
end
