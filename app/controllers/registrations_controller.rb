class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #パスワードをハッシュ化する
    password = params[:user].delete(:password)
    password_confirmation = params[:user].delete(:password_confirmation)
    #user情報を格納する
    @user = User.new(user_params)
    @user.password = password
    @user.password_confirmation = password_confirmation
    if @user.save
      #セッションIDを払い出す
      session[:user_id] = @user.id
      #もし一致する場合にはroot_pathへ移動
      redirect_to items_path(user_id: @user.id)
      #ログインしましたとアナウンス
      flash[:notice] = "ログインしました"
    else
      #合わない場合にはregistrations#newへ戻る
      render 'new'
      #ログインできませんでしたとアナウンス
      flash[:notice] = "ユーザー名かパスワードのどちらかが違います。"
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :postal_code, :address2, :address1, :password, :password_confirmation)
  end

end
