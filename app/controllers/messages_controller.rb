class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user
    if current_user.seller?
      message.recipient = message.conversation.buyer
    else
      message.recipient = message.conversation.company
    end
    if message.save
      if !current_user.buyer.nil?
        ActionCable.server.broadcast 'messages',
          message: message.content,
          user: message.user.name
        head :ok
      else
        ActionCable.server.broadcast 'messages',
          message: message.content,
          user: message.user.seller.company.name
        head :ok
      end
    else
      redirect_to conversations_path
    end
  end

  private
    def message_params
      params.require(:message).permit(:content, :conversation_id)
    end
end
