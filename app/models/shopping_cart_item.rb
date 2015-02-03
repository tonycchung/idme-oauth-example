class ShoppingCartItem < ActiveRecord::Base
  acts_as_shopping_cart_item

  def price
    super * 0.8
  end
end
