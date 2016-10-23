class User < ApplicationRecord
  has_one :account
  has_one :cart, through: :account
  
  validates :name, presence: true, length: {minimum: 2}, on: :create
  validates :age, inclusion: {in: 12..100}, on: :create
  validates :balance, numericality: {greater_than_or_equal_to => 0}, on: :create
  validates :email, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, allow_nil: true, allow_blank: true, on: :create

 
  after_create :create_account_for_user
  after_create :update_user_balance, if: age >=18?

  protected

  def create_account_for_user
    create_account(balance: 0)
  end

  def update_user_balance
    account.update(balance: 100)
  end

end
