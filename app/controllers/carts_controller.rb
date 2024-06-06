class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
    @cart_items = current_user.cart.cart_items
    @total_price = @cart_items.sum { |cart_item| cart_item.item.price * cart_item.quantity }
  end

  def update_quantity
    @cart_item = current_user.cart.cart_items.find(params[:id])
    if @cart_item.update(quantity: params[:cart_item][:quantity])
      @total_price = current_user.cart.cart_items.sum { |cart_item| cart_item.item.price * cart_item.quantity }
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to cart_path, notice: 'Quantité mise à jour.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to cart_path, alert: 'Erreur de mise à jour.' }
      end
    end
  end

  def destroy_item
    @cart_item = current_user.cart.cart_items.find(params[:id])
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Article supprimé du panier.' }
      format.js
    end
  end

end
