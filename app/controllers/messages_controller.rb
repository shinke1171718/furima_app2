class MessagesController < ApplicationController

  def create
    #パラメーターを取得
    @chat = Chat.find(params[:chat_id])
    #パラメーターを取得
    @comment = Message.new(comment_params)
    # @comment = @chat.comment.build(comment_params)
    #@commentに値が入ったらsaveする。できなければリダイレクトをして
    if @comment.nil?
      redirect_to item_path(@chat.item_id)
    else
      @comment.save
      redirect_to item_path(@chat.item.id)
    end
  end

  private

  def comment_params
    params.permit(:comment, :chat_id).merge(user_id: current_user.id)
  end
end
