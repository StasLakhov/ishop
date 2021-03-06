class CartsController < ApplicationController
  attr_accessor :user_mail, :comment

  def show
    @cart = Cart.find(session[:cart_id])
    @products = @cart.products
  end

  def add
    @cart = Cart.find(session[:cart_id])
    @product = Product.find(params[:product_id])
    @cart.products << @product
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @product = Product.find(params[:product_id])
    @cart.products.destroy(@product)
    flash[:warning] = t(:Removed_from_cart_successfully)
    redirect_to cart_path
  end

  def order
    @user_mail = current_user.email
    CartMailer.product_ordered(@user_mail).deliver_now
    flash[:success] = t('.product_ordered_successfully_wait_for_delievery')
    redirect_to cart_path
  end

end
