class Item < ApplicationRecord
  before_action :authenticate_user!
end
