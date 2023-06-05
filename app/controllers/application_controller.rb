class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers


  private

  def require_login
    unless logged_in?
      redirect_to new_user_session_path
    end
  end

  def logged_in?
    session[:user_id].present?
  end
end
