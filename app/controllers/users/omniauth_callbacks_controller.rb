class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # def twitter
  #   callback_from :twitter
  # end

  # private

  # def callback_from(provider)
  #   provider = provider.to_s

  #   session[:oauth] = request.env['omniauth.auth'].except('extra')
  #   session[:user] = User.find_for_oauth(request.env['omniauth.auth'])
  #   if session[:user]
  #     flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Twitter'
  #     sign_in_and_redirect session[:user], event: :authentication
  #   else
  #     session["devise.#{provider}_data"] = request.env['omniauth.auth']
  #     redirect_to new_user_registration_path
  #   end
  # end

  # def after_sign_in_path_for(resource)
  #   if session[:user].id == nil
  #     step1_signup_index_path
  #   else
  #     root_path
  #   end
  # end
  def twitter
    # You need to implement the method below in your model
    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  end
end