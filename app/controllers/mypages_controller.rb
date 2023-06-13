class MypagesController < ApplicationController
  def show
    @current_user = current_user
  end

  #購入済み商品一覧を表示する機能
  def purchased_items
    @purchase_items = Item.where(buyer_id: current_user.id)
  end

  #出品商品一覧を表示する機能
  def listed_items
    @listed_items = Item.where(seller_id: current_user.id)
  end

end
