class DashboardController < ApplicationController
  before_action :authenticate_user!, :completed_profile

  def index
    @greeting = "hello " + current_user.user_type
    if current_user.user_type == "seller" && current_user.seller.company.approval == "pending"
      @greeting = "hello, your company is still under review."
    end

    if current_user.buyer?
      @iterable = Company.where(approval: 2, buyer_id: nil)
    elsif current_user.seller?
      @iterable = Seller.where(approval: 2)
    else
      @iterable = nil
    end
  end

  def admin_index

  end
end
