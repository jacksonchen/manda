class CompaniesController < ApplicationController

  def index

  end

  def create
    @company = Company.new(company_params.except(:users_attributes))
    @cc = CompanyCategory.all
    @company.company_categories << CompanyCategory.find(params[:company][:company_categories])
    # @user = User.new(params[:company][:users_attributes])
    if @company.save #&& @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @company = Company.new
    @cc = CompanyCategory.all
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

    def company_params
      params.require(:company).permit(:name, :url, :email, :phone,
      :price, :founded, :opportunity, :location, :financials,
      :about, :logo, :funding_report,
      :userbase_analytics, :finances, :llc, :tax, :equity_division,
      :originality, :legal,
      users_attributes: [:email, :password]
        )
    end
end
