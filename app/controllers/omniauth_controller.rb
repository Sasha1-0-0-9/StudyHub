class OmniauthController < ApplicationController
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
  end

  def failure
    flash[:error] = 'error'
    redirect_to new_user_registration_url
  end
end
