class CompaniesController < ApplicationController

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
      invites_attributes: [:email]
        )
    end
end
