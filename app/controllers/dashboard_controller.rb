class DashboardController < ApplicationController
  before_action :completed_profile

  def index

  end

  def completed_profile
    if current_user.user_type == "buyer" && current_user.buyer.nil?
      redirect_to new_buyer_path
    elsif current_user.user_type == "seller" && current_user.seller.nil?
      redirect_to new_seller_path
    end
  end
end
