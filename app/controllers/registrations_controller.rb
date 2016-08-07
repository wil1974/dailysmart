class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_parms
    params.require(:user).permit(:first_name, :last_name, :username, :email,
          :password,  :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
          :password_confirmation, :current_password, :username)
  end
end
