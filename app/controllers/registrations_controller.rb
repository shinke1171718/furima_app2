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
    @user = current_user
  end

  def update
    #ユーザーのデータを格納する
    @user = current_user

    if edit_user_params[:password].present? && edit_user_params[:password_confirmation].present?
      # パスワードがある場合の処理
      if !@user.authenticate(edit_user_params[:current_password])
        flash[:notice] = "現在のパスワードが正しくありません。"
        render :edit
        return
      end

      @user.update(edit_user_params)
      flash[:notice] = "ユーザー情報とパスワードを更新しました。"
      redirect_to edit_user_registration_path
    else
      # パスワードがない場合の処理
      @user.update(user_params_without_password)
      flash[:notice] = "ユーザー情報を更新しました。（パスワード未更新：パスワードを設定された場合には入力漏れがないか確認してください。）"
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :postal_code, :address2, :address1, :password, :password_confirmation)
  end

  def edit_user_params
    params.require(:user).permit(:name, :email, :postal_code, :address2, :address1, :password, :password_confirmation, :current_password)
  end

  def user_params_without_password
    params.require(:user).permit(:name, :email, :postal_code, :address2, :address1)
  end
end
