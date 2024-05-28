class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
  end

  def update_quantity
    @cart_item = current_user.cart.cart_items.find(params[:id])
    @cart_item.update(quantity: params[:quantity])
    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Quantité mise à jour.' }
      format.js
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
