class LikesController < ApplicationController
  def index
    @category = params[:category]
    @dreams = Dream.where(category: @category)
    @dreams =
  end

  def create
    @dream = Dream.find(params[:dream_id])
    @user = current_user
    @like = Like.create(dream: @dream, user: @user)
  end

  def destroy
    @dream = Dream.find(params[:dream_id])
    @like = current_user.likes.where(dream: @dream).first
    @like.destroy
  end
end
