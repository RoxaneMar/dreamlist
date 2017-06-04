class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:profile_id])

    @relationship = Relationship.create!(follower_id: current_user.id,
      followed_id: user.id)
  end

  def destroy
    user = User.find(params[:profile_id])

    @relationship = current_user.active_relationships.where(followed_id: user.id).first
    @relationship.destroy
  end
end
