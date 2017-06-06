class DreamsController < ApplicationController
  before_action :set_dream, only: [:show, :edit, :update, :destroy]

  # def cat_index
  #   @category = params[:category]
  #   @dreams = Dream.where(category: @category)
  # end

  def index
    if params[:query].present?
      @query = params[:query]
      test = Dream.joins(:user)
      @dreams = test.where(
        'title ilike ?
        OR category ilike ?
        OR first_name ilike ?
        OR last_name ilike ?',
        "%#{params[:query]}%",
        "%#{params[:query]}%",
        "%#{params[:query]}%",
        "%#{params[:query]}%"
      )
    else
      @dreams = Dream.all
    end
  end

  def show
    @user = current_user
    authorize(@dream)
  end

  def new
    @dream = Dream.new
    authorize(@dream)
  end

  def edit
    authorize(@dream)
  end

  def create
    @dream = Dream.new(dream_params)
    authorize(@dream)
    @dream.user = current_user

    if @dream.save
      @dream.user.followers.each do |follower|
        Notification.create!(
          user: follower,
          subject: @dream,
          content: "#{@dream.user.first_name.capitalize} #{@dream.user.last_name.capitalize} created a new dream!")
      end
      redirect_to new_dream_kitty_path(@dream)
    else
      render :new
    end
  end

  def update
    authorize(@dream)

    if @dream.update(dream_params)
      redirect_to @dream
    else
      render :edit
    end
  end

  def destroy
    authorize(@dream)
    @dream.destroy
    redirect_to dreams_url
  end

  private

  def set_dream
    @dream = Dream.find(params[:id])
  end

  def dream_params
    params
      .require(:dream)
      .permit(
        :title,
        :description,
        :goal_amount,
        :end_date,
        :reached,
        :user_id,
        :category,
        :picture,
        kitty_attributes: [:goal_amount, :private]
      )
  end
end
