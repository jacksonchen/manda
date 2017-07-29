class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
      @user = User.from_omniauth(request.env["omniauth.auth"])
      @user.user_type = @user.user_type || request.env["omniauth.params"]["user_type"]
      if @user.user_type.nil?
        @user.destroy
        flash[:error] = "Please enter a user type"
        redirect_to new_user_registration_path and return
      else
        sign_in_and_redirect @user
      end
  end
  # def linkedin
  #   # You need to implement the method below in your model (e.g. app/models/user.rb)
  #   @user = User.from_omniauth(request.env["omniauth.auth"])
  #
  #   if @user.persisted?
  #     sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
  #     set_flash_message(:notice, :success, :kind => "Linkedin") if is_navigational_format?
  #   else
  #     session["devise.linkedin_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end
  #
  def failure
    redirect_to root_path
  end
end
