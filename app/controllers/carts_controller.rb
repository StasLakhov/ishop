class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id]).products
  end

  def add
    def add
      @cart = Cart.find(session[:cart_id])
      @product = Product.find(params[:product_id])
      @cart.products << @product
    end
  end

end
