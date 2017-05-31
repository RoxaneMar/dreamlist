class ContributorsController < ApplicationController
  def new
    @contributor = Contributor.new
    @kitty = Kitty.find(params[:kitty_id])
  end

  def create
    @contributor = Contributor.new(contributor_params)

    @contributor.user = current_user
    @contributor.kitty = Kitty.find(params[:kitty_id])
    @dream = @contributor.kitty.dream

    if @contributor.save
      redirect_to dream_path(@dream)
    else
      render :new
    end
  end

  private

  def contributor_params
    params
      .require(:contributor)
      .permit(
        :amount,
        :message
      )
  end

end
