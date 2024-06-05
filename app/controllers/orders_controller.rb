class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = create_order(current_user, current_user.cart)

    if @order.persisted?
      redirect_to @order, notice: 'Order was successfully created.'
    else
      redirect_to cart_path(current_user.cart), alert: 'There was an error creating the order.'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def create_order(user, cart)
    order = nil

    Order.transaction do
      order = user.orders.create!

      cart.cart_items.each do |cart_item|
        order.order_items.create!(
          item: cart_item.item,
          quantity: cart_item.quantity,
          unit_price: cart_item.item.price
        )
      end

      # calculate_total_price will be called before validation
      # Save order to trigger before_validation callback
      order.save!

      # Clear the cart
      cart.cart_items.destroy_all
    end

    order
  rescue ActiveRecord::RecordInvalid => e
    # Handle errors and transaction rollback
    flash[:alert] = "There was an error creating the order: #{e.message}"
    nil
  end
end
