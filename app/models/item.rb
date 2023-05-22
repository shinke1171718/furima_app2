class Item < ApplicationRecord
  before_action :authenticate_user!
  has_many :orders
  has_many :users, through: :orders
end
