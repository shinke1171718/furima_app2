class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
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
      redirect_to @item
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def checkout
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :image_meta_data)
  end

end
