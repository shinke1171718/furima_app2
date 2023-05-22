class Item < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders
  has_many :image
end
