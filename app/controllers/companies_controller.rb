class CompaniesController < ApplicationController

  def index

  end

  def create
    @company = Company.new(company_params.except(:users_attributes))
    @cc = CompanyCategory.all
    @company.company_categories << CompanyCategory.find(params[:company][:company_categories])
    if !company_params[:users_attributes].nil?
      company_params[:users_attributes].keys.each do |userKey|
        @user = User.new(company_params[:users_attributes][userKey])
        @user.user_type = "seller"
        if @user.save
          FounderMailer.welcome(@user, current_user).deliver # TODO: Add a way to link company + new user
        else
          self.errors.add(:users_attributes, "User #{@user.email} did not save")
        end
      end
    end

    sellerChange = current_user.seller
    sellerChange.company = @company

    if @company.save && sellerChange.save
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
