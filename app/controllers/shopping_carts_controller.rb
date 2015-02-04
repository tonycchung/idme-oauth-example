class ShoppingCartsController < ApplicationController
  before_action :set_shopping_cart
  def create
    @product = Product.find(params[:product_id])
    @shopping_cart.add(@product, @product.price)
    flash[:notice] = "Added #{@product.name} to your cart!"
    redirect_to products_path
  end

  def show
    @shopping_cart.veteran_discount(current_user)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @shopping_cart.remove(@product, 1)
    flash[:notice] = "Removed #{@product.name} from your cart!"
    redirect_to shopping_cart_path
  end

private
  def set_shopping_cart
    if session[:shopping_cart_id]
      @shopping_cart ||= ShoppingCart.find(session[:shopping_cart_id])
    else
      @shopping_cart = ShoppingCart.create!
    end
    session[:shopping_cart_id] ||= @shopping_cart.id
    @shopping_cart
  end
end
