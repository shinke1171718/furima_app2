class User < ApplicationRecord
  has_many :orders
  has_many :items, through: :orders
  has_many :image
  has_many :messages
  has_secure_password
  validates :email, uniqueness: true
  has_one :mypage
  has_one :secondaddress

  #仮想属性をユーザーモデルに追加
  attr_accessor :new_password, :new_password_confirmation, :current_password
end
