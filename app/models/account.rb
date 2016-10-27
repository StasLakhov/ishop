class Account < ApplicationRecord
  has_one :cart
  belongs_to :user

  validates_numericality_of :balance, :greater_than_or_equal_to => 0
end
