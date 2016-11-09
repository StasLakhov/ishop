class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id])
    @products = @cart.products
  end

  def add
    @cart = Cart.find(session[:cart_id])
    @product = Product.find(params[:product_id])
    @cart.products << @product
    CartMailer.product_added(@product).deliver_now
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @product = Product.find(params[:product_id])
    @cart.products.destroy(@product)
    flash[:warning] = t(:Removed_from_cart_successfully)
    redirect_to cart_path
  end

  def order
    CartMailer.product_ordered(@product).deliver_now
  end

end
