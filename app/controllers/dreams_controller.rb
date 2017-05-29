class DreamsController < ApplicationController
  before_action :set_dream, only: [:show, :edit, :update, :destroy]

  def index
    @dreams = Dream.all
  end

  def show
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

    if @dream.save
      redirect_to @dream, notice: 'Dream was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize(@dream)

    if @dream.update(dream_params)
      redirect_to @dream, notice: 'Dream was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize(@dream)
    @dream.destroy
    redirect_to dreams_url, notice: 'Dream was successfully destroyed.'
  end

  private
    def set_dream
      @dream = Dream.find(params[:id])
    end

    def dream_params
      params.require(:dream).permit(:title, :description, :goal_amount, :end_date, :reached, :user_id, :category_id, :picture)
    end
end
