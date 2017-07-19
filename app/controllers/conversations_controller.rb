class ConversationsController < ApplicationController
  before_action :authenticate_user!, :completed_profile
  before_action :convo_permissions, only: [:show]
  # before_action :update_notifications, only: [:show]

  def index
    if current_user.seller?
      @conversations = current_user.seller.company.conversations
    else
      @conversations = current_user.conversations
    end
  end

  def create
    if params.has_key?(:company)
      @exists = Conversation.where(company_id: params[:company]).first
    else
      @exists = Conversation.where(buyer_id: params[:buyer]).first
    end

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

  # def update_notifications
  #   @conversation = Conversation.find_by_id(params[:id])
  #   @conversation.messages.includes(:notifications).update_all({read: true})
  # end
end
