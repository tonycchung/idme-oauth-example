class ShoppingCartsController < ApplicationController
  before_action :set_shopping_cart
  def create
    @product = Product.find(params[:product_id])
    @shopping_cart.add(@product, @product.price)
    flash[:notice] = "Added #{@product.name} to your cart!"
    redirect_to products_path
  end

  def show
  end

  def clear_cart
    @shopping_cart.clear
  end

  def destroy
    @product = Product.find(params[:product_id])
    @shopping_cart.remove(@product, 1)
    flash[:notice] = "Removed #{@product.name} from your cart!"
    redirect_to shopping_cart_path
  end

private
  def set_shopping_cart
    @shopping_cart = current_cart
  end
end
