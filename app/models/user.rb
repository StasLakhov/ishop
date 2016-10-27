class User < ApplicationRecord
  has_one :account
  has_one :cart, through: :account
  
  validates :name, presence: true, length: {minimum: 2}
  validates :age, inclusion: {in: 12..100}
 # validates :balance, numericality: {greater_than_or_equal_to => 0}
  validates :email, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, allow_blank: true

 
  after_create :create_account_for_user
  after_create :update_user_balance, if: :adult

  private

  def create_account_for_user
    create_account(balance: 0)
  end

  def update_user_balance
    self.account.update(balance: 100)
  end

  def adult
    self.age >=18
  end


end
