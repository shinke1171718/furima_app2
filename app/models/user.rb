class User < ApplicationRecord
  has_many :orders
  has_many :items, through: :orders
  has_many :image
  has_many :messages
  has_secure_password
  validates :email, uniqueness: true
  has_one :mypage
end
