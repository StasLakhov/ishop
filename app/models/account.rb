class Account < ApplicationRecord
  has_one :cart
  belongs_to :user
end