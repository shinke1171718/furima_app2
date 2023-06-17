class ItemsController < ApplicationController
  before_action :require_login

  def index
    @items = Item.where(buyer_id: nil).where.not(seller_id: current_user.id)
  end

  def show
    @item = Item.find(params[:id])
    @chat = Chat.find_by(item_id: @item.id)
    @current_user = current_user

    # 住所とサブ住所のデータを取得し、インスタンスに格納する
    if current_user.present?
      @address = {
        postal_code: current_user.postal_code,
        address1: current_user.address1,
        address2: current_user.address2
      }

      # テキスト化して結合
      @address[:text] = "#{@address[:postal_code]}, #{@address[:address1]}, #{@address[:address2]}"
    end

    if current_user.secondaddress.present?
      @second_address = {
        second_postal_code: current_user.secondaddress.second_postal_code,
        second_address1: current_user.secondaddress.second_address1,
        second_address2: current_user.secondaddress.second_address2
      }

      # テキスト化して結合
      @second_address[:text] = "#{@second_address[:second_postal_code]}, #{@second_address[:second_address1]}, #{@second_address[:second_address2]}"
    end

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

    #洗濯した住所のデータを格納する。
    selected_address = params[:selected_address]
    @item.update(address: selected_address)
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :image_meta_data)
  end

end
