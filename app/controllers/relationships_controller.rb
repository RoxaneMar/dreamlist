class RelationshipsController < ApplicationController
  def create
    if params[:dream_id].exists
      @dream = Dream.find(params[:dream_id])
      user = @dream.user
    else
      user = User.find(params[:id])
    end

    @relationship = Relationship.create!(follower_id: current_user.id,
      followed_id: user.id)
  end

  def destroy
    if params[:dream_id].exists
      @dream = Dream.find(params[:dream_id])
      user = @dream.user
    else
      user = User.find(params[:id])
    end

    @relationship = current_user.active_relationships.where(followed_id: user.id).first
    @relationship.destroy
  end
end
