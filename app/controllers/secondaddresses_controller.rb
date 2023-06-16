class SecondaddressesController < ApplicationController

  def edit_or_new
    #ログインユーザーでサブ住所が登録してあるか確認（あればeditアクションへ、なければnewアクションへ）
    if current_user.secondaddress.present?
      redirect_to edit_secondaddress_path(current_user.secondaddress)
    else
      redirect_to new_secondaddress_path
    end
  end

  def new
    @secondaddress = Secondaddress.new
  end

  def create
    @secondaddress = Secondaddress.new(secondaddress_params)
    @secondaddress.user = current_user
    if @secondaddress.save
      redirect_to edit_secondaddress_path(@secondaddress), notice: "サブ住所を登録しました。"
    else
      render :new
    end
  end

  def edit
    @secondaddress = current_user.secondaddress
  end

  def update
    @secondaddress = current_user.secondaddress

    if @secondaddress.update(secondaddress_params)
      redirect_to edit_secondaddress_path(@secondaddress), notice: "サブ住所を更新しました。"
    else
      render :edit
    end
  end

  private

  def secondaddress_params
    params.require(:secondaddress).permit(:second_postal_code, :second_address1, :second_address2)
  end

end
