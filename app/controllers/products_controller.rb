class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = Product.order(params[:sort])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = 'Product was deleted successfully'
    redirect_to products_path
  end

  private

  def product_params
    params.require('product').permit(:name, :price, :description)
  end

end
