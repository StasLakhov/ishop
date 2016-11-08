class Account < ApplicationRecord
  belongs_to :user
  has_one :cart

  validates_numericality_of :balance, :greater_than_or_equal_to => 0
end
