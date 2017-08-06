class DashboardController < ApplicationController
  before_action :authenticate_user!, :completed_profile

  def index
    if current_user.buyer?
      redirect_to buyers_path
    elsif current_user.seller?
      redirect_to sellers_path
    end
  end

  def admin_index

  end
end
