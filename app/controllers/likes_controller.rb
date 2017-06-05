class LikesController < ApplicationController
  def create
    @dream = Dream.find(params[:dream_id])
    @user = current_user
    @like = Like.create(dream: @dream, user: @user)
    @notification = Notification.create(user: @dream.user,
      subject: @dream,
      content: "#{@user.first_name.capitalize} #{@user.last_name.capitalize} liked your dream: #{@dream.title}")
  end

  def destroy
    @dream = Dream.find(params[:dream_id])
    @like = current_user.likes.where(dream: @dream).first
    @like.destroy
  end
end
