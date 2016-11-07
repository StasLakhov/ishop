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
    flash[:success] = t(:Created_successfully)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:warning] = t(:Deleted_successfully)
    redirect_to products_path
  end

  private

  def product_params
    #params.require('product').permit(:name, :price, :description)
    {
      name: params[:name],
      price: params[:price],
      description: params[:description]
    }
  end
end