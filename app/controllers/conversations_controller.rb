class ConversationsController < ApplicationController
  def index

  end

  def create
    @conversation = Conversation.new
    @conversation.company = Company.find_by_id(params[:company])
    # @conversation.users << current_user
    # render :text => @conversation.to_json
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      flash[:error] = "There was an error in creating a conversation"
      redirect_to :back
    end
  end

  def show
    @conversation = Conversation.find_by_id(params[:id])
    @message = Message.new
  end
end
