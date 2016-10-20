class User < ApplicationRecord
  has_one :account

  validates :name, presence: true, length: {minimum: 2}
  validates :age, numericality: {greater_than: 0}
  validates :email, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  after_create :crete_account_for_user

  def create_account_for_user
    create_account(balance: 250)
  end


  end
