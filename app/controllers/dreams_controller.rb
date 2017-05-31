class DreamsController < ApplicationController
  before_action :set_dream, only: [:show, :edit, :update, :destroy]

  def index
    @dreams = Dream.all
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
      redirect_to  new_dream_kitty_path(@dream)
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
          :category_id,
          :picture,
          kitty_attributes: [:goal_amount, :private]
        )
    end
end
