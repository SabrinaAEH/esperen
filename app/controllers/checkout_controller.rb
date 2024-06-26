class CheckoutController < ApplicationController
  def create
    @user = current_user
    @total_price = params[:total_price].to_d

    begin
      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [
          {
            price_data: {
              currency: 'eur',
              unit_amount: (@total_price * 100).to_i, # Stripe accepte les centimes
              product_data: {
                name: 'Rails Stripe Checkout',
              },
            },
            quantity: 1,
          },
        ],
        mode: 'payment',
        success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
        cancel_url: checkout_cancel_url
      )

      respond_to do |format|
        format.html { redirect_to @session.url, allow_other_host: true }
        format.js   # renders create.js.erb
        format.json { render json: { id: @session.id } }
      end

    rescue Stripe::StripeError => e
      flash[:error] = e.message
      redirect_to checkout_cancel_url
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end
end
