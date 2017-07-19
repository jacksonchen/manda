class DashboardController < ApplicationController
  before_action :authenticate_user!, :completed_profile, :redirect_user_type

  def index
    @greeting = "hello " + current_user.user_type
    if current_user.user_type == "seller" && current_user.seller.company.approval == "pending"
      @greeting = "hello, your company is still under review."
    end
  end

  def admin_index

  end

  private
  def redirect_user_type
    if current_user.user_type == "buyer"
      redirect_to buyers_path
    elsif current_user.user_type == "seller"
      redirect_to sellers_path
    elsif current_user.user_type == "admin"
      redirect_to :admin_index
    end
  end
end
