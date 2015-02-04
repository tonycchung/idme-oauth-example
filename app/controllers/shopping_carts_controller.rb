class ShoppingCartsController < ApplicationController
  before_action :set_shopping_cart
  def create
    @product = Product.find(params[:product_id])
    @shopping_cart.add(@product, @product.price)
    flash[:notice] = "Added #{@product.name} to your cart!"
    redirect_to products_path
  end

  def show
    @shopping_cart.veteran_discount(current_user) if current_user.present?
  end

  def destroy
    @product = Product.find(params[:product_id])
    @shopping_cart.remove(@product, 1)
    flash[:notice] = "Removed #{@product.name} from your cart!"
    redirect_to shopping_cart_path
  end

private
  def set_shopping_cart
    shopping_cart_id = session[:shopping_cart_id]
    @shopping_cart = session[:shopping_cart_id] ? ShoppingCart.find(shopping_cart_id) : ShoppingCart.create
    session[:shopping_cart_id] = @shopping_cart.id
  end
end
