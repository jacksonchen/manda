class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_buyer, :completed_profile, except: [:create, :new]

  def index
    @companies = Company.where(approval: 2, buyer_id: nil)
  end

  def create
    @buyer = Buyer.new(buyer_params)
    @buyer.user_id = current_user.id
    @buyer.expertise = buyer_params[:expertise].split(',')
    if @buyer.save
      flash[:success] = "Successfully saved your profile"
      redirect_to root_path
    else
      flash[:error] = "There was an issue saving your profile"
      render 'new'
    end
  end

  def new
    @buyer = Buyer.new
  end

  def edit

  end

  def show
    @buyer = Buyer.find_by_id(params[:id])
  end

  def update

  end

  def destroy

  end

  private
    def is_buyer
      return current_user.buyer?
    end

    def buyer_params
      params.require(:buyer).permit(:company, :company_role, :name,
        :corporate_email, :phone, :address, :gender, :age, :education, :education_institution,
        :expertise, :linkedin, :startup_background, :about,
        employers_attributes: [:employable_type, :employable_id, :name, :role, :_destroy]
        )
    end
end
