require 'spec_helper'
require 'rails_helper'

describe ProductsController do

  before do
    get :index
  end

  it 'returns OK' do
    expect(response).to be_ok
  end

  describe 'show action' do
    it 'render show' do
      product = Product.create(description: 'qqq', name: 'www', price: 22)
      get :show, params: {id: product.id}
      expect(response).to render_template('show')
    end
  end

  describe 'create action' do
    it 'when product creating pass' do
      post :create, params: {description: 'qqq', name: 'www', price: 22}
      expect(response).to redirect_to products_path
    end

    it 'when product creating fail' do
      post :create, params: {description: 'qqq', name: 'www', price: nil}
      expect(response).to render_template('new')
    end
  end

  describe 'destroy action' do
    it 'destoy product' do
      product = Product.create(description: 'qqq', name: 'www', price: 22)
      delete :destroy, params: {id: product.id}
      expect(response).to redirect_to products_path
    end
  end

  describe 'index action' do
    it 'render index' do
      product = Product.create(description: 'qqq', name: 'www', price: 22)
      get :index, params: {id: product.id}
      expect(response).to render_template('index')
    end
  end

  describe 'new action' do
    it 'render new' do
      product = Product.new
      get :new, params: {id: product.id}
      expect(response).to render_template('new')
    end
  end

end