class Product < ApplicationRecord
  has_and_belongs_to_many :carts

  validates :name, presence: true
  validates :price, presence: true
  validates_numericality_of :price, :greater_than_or_equal_to => 0
  validates :description, presence: true
end
