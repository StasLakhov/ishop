require 'rails_helper'
require 'spec_helper'

describe Product do

  it 'validates name' do
    product = Product.new(name: '')
    product.valid?
    expect(product.errors[:name]).not_to be_empty
  end

  it 'validates price' do
    product = Product.new(price: '')
    product.valid?
    expect(product.errors[:price]).not_to be_empty
  end

  it 'validates price' do
    product = Product.new(description: '')
    product.valid?
    expect(product.errors[:description]).not_to be_empty
  end

end