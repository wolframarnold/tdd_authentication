class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    # raise request.env['omniauth.auth'].to_yaml

    @user = User.with_twitter_uid(request.env['omniauth.auth']['uid']).first
    flash[:notice] = "Signed in successfully via Twitter"
    if @user.nil?
      @user = User.create!(:uid  => request.env['omniauth.auth']['uid'],
                           :provider => request.env['omniauth.auth']['provider'],
                           :name => request.env['omniauth.auth']['user_info']['name'],
                           :nickname => request.env['omniauth.auth']['user_info']['nickname'],
                           :avatar => request.env['omniauth.auth']['user_info']['image'],
                           :email => request.env['omniauth.auth']['user_info']['email'])
    end
    sign_in_and_redirect @user, :event => :authentication
  end

end
