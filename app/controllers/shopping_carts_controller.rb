class ShoppingCartsController < ApplicationController

  def create
    @shopping_cart = current_cart
    @product = Product.find(params[:product_id])
    @shopping_cart.add(@product, @product.price)
    flash[:notice] = "Added #{@product.name} to your cart!"
    redirect_to products_path
  end

  def show
    @shopping_cart = current_cart
  end

end
