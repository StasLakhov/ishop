class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id]).products
  end
end
