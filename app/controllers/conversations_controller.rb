class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :convo_permissions, only: [:show]

  def index

  end

  def create
    @exists = Conversation.where(company_id: params[:company]).first
    if @exists.nil?
      @conversation = Conversation.new
      @conversation.company = Company.find_by_id(params[:company])
      @conversation.buyer = current_user.buyer
      if @conversation.save
        redirect_to conversation_path(@conversation)
      else
        flash[:error] = "There was an error in creating a conversation"
        redirect_to :back
      end
    else
      redirect_to conversation_path(@exists)
    end
  end

  def show
    @conversation = Conversation.find_by_id(params[:id])
    @message = Message.new
  end

  private
  def convo_permissions
    @conversation = Conversation.find_by_id(params[:id])
    if @conversation.nil? ||
       (!current_user.buyer.nil? && @conversation.buyer != current_user.buyer) ||
       (!current_user.seller.nil? && @conversation.company != current_user.seller.company)

       flash[:error] = "The conversation you requested is not available"
       redirect_to root_path
    end
  end
end
