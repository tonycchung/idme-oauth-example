class Product < ActiveRecord::Base
  def price
    super * 0.8
  end
end
