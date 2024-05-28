class ItemsController < ApplicationController
  def add_to_cart
    @item = Item.find(params[:id])
    cart = current_user.cart || current_user.create_cart
    cart_item = cart.cart_items.find_or_initialize_by(item: @item)
    cart_item.quantity ||= 0 # Initialisez à 0 si nil
    cart_item.quantity += 1
    cart_item.save

    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Item ajouté au panier.' }
      format.js
    end
  end
end
