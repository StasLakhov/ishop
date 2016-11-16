require 'spec_helper'
require 'rails_helper'

describe CartsController do

  describe 'show action' do
    it 'render show' do
      product = Product.create(description: 'qqq', name: 'www', price: 22)
      get :show, params: {id: product.id}
      expect(response).to render_template('show')
    end
  end

  describe 'add action' do
    let(:create) do
      post 'products#create', controller => 'prodcucts', name: 'Prod2', description: 'Prod2 descr', price: 12
      @product = Product.find(params[:product_id])
      @cart.products << @product
    end
  end

  describe 'destroy action' do
    it 'destoy product from cart' do
      post 'products#create', controller: 'prodcucts', params: {description: 'qqq', name: 'www', price: 22}
      @product = Product.find(params[:product_id])
      @cart.products << @product
      delete :destroy, params: {id: @product.id}
      expect(response).to redirect_to cart_path
    end
  end

  describe 'order action' do
    it 'order product' do

    end
  end


end