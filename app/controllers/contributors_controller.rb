class ContributorsController < ApplicationController
  def new
    @contributor = Contributor.new
    @kitty = Kitty.find(params[:kitty_id])
  end

  def create
    @contributor = Contributor.new(contributor_params)

    @contributor.user = current_user
    @kitty = Kitty.find(params[:kitty_id])
    @contributor.kitty = @kitty
    @contributor.state = 'pending'
    @dream = @contributor.kitty.dream

    if @contributor.save
      redirect_to new_contributor_payment_path(@contributor)
      # dream_path(@dream)
    else
      render :new
    end
  end

  private

  def contributor_params
    params
      .require(:contributor)
      .permit(
        :price,
        :private,
        :message
      )
  end

end
