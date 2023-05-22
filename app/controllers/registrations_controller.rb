class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :postal_code, :address1, :address2, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :postal_code, :address1, :address2, :email, :password, :password_confirmation, :current_password)
  end
end