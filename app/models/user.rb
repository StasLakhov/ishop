class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  has_one :account, dependent: :destroy
  has_one :cart, through: :account
  
  validates :name, presence: true
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

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(age: 20,
                         name: data["name"],
                         email: data["email"],
                         password: Devise.friendly_token[0,20])
    end
    user
  end


end
