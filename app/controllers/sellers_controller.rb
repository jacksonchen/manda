class SellersController < ApplicationController
  def index
    @buyers = Buyer.all
  end

  def create
    @seller = Seller.new(seller_params)
    @seller.user_id = current_user.id
    @seller.expertise = seller_params[:expertise].split(',')
    invite = current_user.invitations.where(accepted: true).first
    if !invite.nil?
      @seller.company = invite.company
    end

    if @seller.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @seller = Seller.new
  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end

  private

    def seller_params
      params.require(:seller).permit(:company_role, :name,
        :corporate_email, :phone, :address, :gender, :age, :education, :education_institution,
        :expertise, :linkedin, :equity, :ssn, :about,
        employers_attributes: [:employable_type, :employable_id, :name, :role, :_destroy]
        )
    end
end
