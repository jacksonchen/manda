class BuyersController < ApplicationController
  def index

  end

  def create
    @buyer = Buyer.new(buyer_params)
    @buyer.user_id = current_user.id
    @buyer.expertise = buyer_params[:expertise].split(',')
    if @buyer.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @buyer = Buyer.new
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

    def buyer_params
      params.require(:buyer).permit(:company, :company_role, :name,
        :corporate_email, :phone, :address, :gender, :age, :education, :education_institution,
        :expertise, :linkedin, :startup_background, :about,
        employers_attributes: [:employable_type, :employable_id, :name, :role, :_destroy]
        )
    end
end