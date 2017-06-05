class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:profile_id])

    @relationship = Relationship.create!(follower_id: current_user.id,
      followed_id: @user.id)
    @notification = Notification.create!(user: @user,
      subject: current_user,
      content: "#{current_user.first_name.capitalize} #{current_user.last_name.capitalize} is now your follower!")
  end

  def destroy
    @user = User.find(params[:profile_id])

    @relationship = current_user.active_relationships.where(followed_id: @user.id).first
    @relationship.destroy
  end
end
