class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.buyer.name #Check for user type buyer
      head :ok
    else
      redirect_to conversations_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :conversation_id)
  end
end
