class ItemsController < ApplicationController
  before_action :require_login

  def index
    @items = Item.where(buyer_id: nil).where.not(seller_id: current_user.id)
  end

  def show
    @item = Item.find(params[:id])
    @chat = Chat.find_by(item_id: @item.id)
    @current_user = current_user
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    if @item.nil?
      render 'new'
    else
      @item.save!
      #チャットルームの作成
      @chat = Chat.create(item: @item)
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def cheackout
    @item = Item.find(params[:item_id])
    @item.update(buyer_id: current_user.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :image_meta_data)
  end

end
