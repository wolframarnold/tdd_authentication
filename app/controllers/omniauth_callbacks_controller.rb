class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    # p request.env['omniauth.auth'].inspect

    @user = User.with_twitter_uid(request.env['omniauth.auth']['uid']).first
    flash[:notice] = "Signed in successfully via Twitter"
    if @user.nil?
      @user = User.create!(:uid  => request.env['omniauth.auth']['uid'],
                           :provider => request.env['omniauth.auth']['provider'],
                           :name => request.env['omniauth.auth']['user_info']['name'],
                           :nickname => request.env['omniauth.auth']['user_info']['avatar'],
                           :email => request.env['omniauth.auth']['user_info']['email'])
    end
    sign_in_and_redirect @user, :event => :authentication
  end

end
