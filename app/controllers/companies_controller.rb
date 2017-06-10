class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def create
    @company = Company.new(company_params.except(:users_attributes))
    @cc = CompanyCategory.all
    @company.company_categories << CompanyCategory.find(params[:company][:company_categories])

    sellerChange = current_user.seller
    sellerChange.company = @company

    if @company.save && sellerChange.save
      @company.invites.each do |invite|
        invite.sender = current_user
        if !User.find_by_email(invite.email).nil?
          invite.recipient = User.find_by_email(invite.email)
          FounderMailer.welcome(invite, request.base_url + new_user_session(:token => invite.token)).deliver
        else
          FounderMailer.welcome(invite, request.base_url + new_user_registration_path(:token => invite.token)).deliver
        end
        invite.save

      end
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
    @company = Company.find_by_id(params[:id])
  end

  def update

  end

  def destroy

  end

  def new_public_profile
    if Company.find_by_id(params[:company_id]).nil?
      flash[:error] = "Page does not exist"
      redirect_to :root
    elsif current_user.seller.nil? || current_user.seller.company.id != params[:company_id].to_i
      flash[:error] = "You do not have permission to access that page!"
      redirect_to :root
    else
      @company = Company.find_by_id(params[:company_id])
    end
  end

  def create_public_profile
    @company = Company.find_by_id(params[:company_id])
    if @company.update_attributes(profile_params)
      flash[:success] = "Company profile successfully saved!"
      redirect_to :root
    else
      render 'new_public_profile'
    end
  end

  private

    def company_params
      params.require(:company).permit(:name, :url, :email, :phone,
      :price, :founded, :opportunity, :location, :financials,
      :about, :logo, :funding_report,
      :userbase_analytics, :finances, :llc, :tax, :equity_division,
      :originality, :legal, :approval,
      invites_attributes: [:email]
        )
    end

    def profile_params
      params.require(:company).permit(:about, :available,
        :financials, :user_base, :growth)

    end
end
