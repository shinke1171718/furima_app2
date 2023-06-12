class Chat < ApplicationRecord
  belongs_to :item
  has_many :messages
end
