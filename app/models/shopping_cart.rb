class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart

  def taxes
    0
  end

  def veteran_discount_percent(user)
    "20%" if user.affiliation == 'Veteran'
  end

  def veteran_discount(user)
    if user && user.affiliation == 'Veteran'
      def total
        super * 0.8
      end
    else
      def total
        super
      end
    end
  end
end
