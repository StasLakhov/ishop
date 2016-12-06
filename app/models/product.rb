class Product < ApplicationRecord
  has_and_belongs_to_many :carts
  has_many :product_assets
  attr_ :asset_attributes, :product_asset_attributes

  accepts_nested_attributes_for :product_assets

  has_one :address, as: :addressable

end
