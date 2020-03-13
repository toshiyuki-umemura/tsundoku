class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    callback_from :twitter
  end

  private

  def callback_from(provider)
    provider = provider.to_s

    session[:oauth] = request.env['omniauth.auth'].except('extra')
    session[:user] = User.find_for_oauth(request.env['omniauth.auth'])
    if session[:user]
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Twitter'
      sign_in_and_redirect session[:user], event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_path
    end
  end

end