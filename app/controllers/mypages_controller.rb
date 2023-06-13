class MypagesController < ApplicationController
  def show
    @current_user = current_user
  end
end
