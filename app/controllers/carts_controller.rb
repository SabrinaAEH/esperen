class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart

    if @cart && @cart.cart_items.any?
      @cart_items = @cart.cart_items.includes(:item)
    else
      @cart_items = []
    end
  end

  def update_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:quantity])
    redirect_to cart_path, notice: 'Quantité mise à jour avec succès'
  end

  def destroy_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: 'Article supprimé avec succès du panier'
  end

end
