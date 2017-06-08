class PaymentsController < ApplicationController
  before_action :set_contributor

  def new
  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @contributor.price_cents, # or amount_pennies
      description:  "Payment for #{@contributor.kitty.dream.user.first_name}'s dream (#{@contributor.kitty.dream.title}) for contribution #{@contributor.id}",
      currency:     @contributor.price.currency
    )

    @contributor.update(payment: charge.to_json, state: 'paid')

    if !@contributor.private
    @notification = Notification.create!(
        user: @contributor.kitty.dream.user,
        subject: @contributor.kitty.dream,
        content: "<strong>#{@contributor.user.first_name.capitalize} #{@contributor.user.last_name.capitalize}</strong> made a contribution to your dream!")
    end

    redirect_to dream_path(@contributor.kitty.dream)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_contributor_payment_path(@contributor)
  end

  def set_contributor
    @contributor = Contributor.where(state: 'pending').find(params[:contributor_id])
  end
end
