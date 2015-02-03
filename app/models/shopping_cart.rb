class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart

  def self.subtotal
    super * 0.8
  end

  def self.total
    super * 0.8
  end
end
