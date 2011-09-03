class SessionsController < ApplicationController

  # The SessionsController only handles log-out now.
  # Sign in and sign-in failure are handled by OmniauthCallbacksController

  def destroy
    sign_out # provided by Devise
    redirect_to root_path
  end

end
