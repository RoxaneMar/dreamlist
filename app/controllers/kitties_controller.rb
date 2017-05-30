class KittiesController < ApplicationController
  before_action :set_kitty, only: [:show, :edit, :update]
  before_action :set_dream, only: [:new, :show, :create, :update]
  def show
  end

  def new
    @kitty = Kitty.new(dream: @dream)
    authorize(@kitty)
  end

  def create
    @kitty = Kitty.new(kitty_params)
    authorize(@kitty)

     if @kitty.save
      redirect_to @dream_path, notice: 'Kitty was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize(@kitty)
  end

  def update
    authorize(@kitty)

    if @kitty.update(kitty_params)
      redirect_to @dream_path, notice: 'Kitty was successfully updated.'
    else
      render :edit
    end
  end

  private
  def set_kitty
    @kitty = Kitty.find(params[:id])
  end

  def set_dream
    @dream = Dream.find(params[:dream_id])
  end

  def kitty_params
    params
      .require(:kitty)
      .permit(:goal_amount)
      .merge(dream: @dream)
  end
end
