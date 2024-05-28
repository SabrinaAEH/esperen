module ApplicationHelper
  def cart_item_count
    user_signed_in? ? current_user.cart.cart_items.count : 0
  end

  def cart_total_amount
    current_user.cart.cart_items.sum { |cart_item| cart_item.item.price }
  end
end
