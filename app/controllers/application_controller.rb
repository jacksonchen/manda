class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type, :token])
  end

  def after_sign_in_path_for(resource_or_scope)
    if current_user.user_type == "buyer" && current_user.buyer.nil?
      new_buyer_path
    elsif current_user.user_type == "seller"
      if current_user.seller.nil?
        new_seller_path
      elsif current_user.seller.company.nil?
        new_company_path
      elsif current_user.seller.company.available.nil?
        company_new_public_profile_path(current_user.seller.company)
      end
    end
  end

  def completed_profile
    if current_user.user_type == "buyer" && current_user.buyer.nil?
      redirect_to new_buyer_path
    elsif current_user.user_type == "seller"
      if current_user.seller.nil?
        redirect_to new_seller_path
      elsif current_user.seller.company.nil?
        redirect_to new_company_path
      elsif current_user.seller.company.available.nil?
        redirect_to company_new_public_profile_path(current_user.seller.company)
      end
    end
  end
end
