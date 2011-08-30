class SessionsController < ApplicationController

  def create
    raise request.env['omniauth.auth'].to_yaml  # Do this in Firefox (not Chrome) -- it looks better
  end

  def failure
    render :text => "OOPS"
  end

end
