class ItemsController < ApplicationController
  def add_to_cart
    @item = Item.find(params[:id])
    cart = current_user.cart || current_user.create_cart
    cart.cart_items.create(item: @item)

    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Item ajouté au panier.' }
      format.js   # add_to_cart.js.erb
    end
  end
end
