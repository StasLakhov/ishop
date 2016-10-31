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
    @product = Cart.find(params[:product_id])
    @cart.products.destroy(@product)
    flash[:notice] = 'Product was deleted successfully'
  end


end
