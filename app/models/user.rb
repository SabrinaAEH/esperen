class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  after_create :create_user_cart

  private

  def create_user_cart
    Cart.create(user: self)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
