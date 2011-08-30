class SessionsController < ApplicationController

  def create
    flash[:notice] = "Successfully logged in"
    session[:name] = request.env['omniauth.auth']['user_info']['name']
    session[:uid] = request.env['omniauth.auth']['uid']
    session[:provider] = request.env['omniauth.auth']['provider']
    session[:avatar] = request.env['omniauth.auth']['user_info']['image']
    session[:nickname] = request.env['omniauth.auth']['user_info']['nickname']
    redirect_to root_path
  end

  def failure
    flash[:alert] = "Authentication failure"
    redirect_to root_path
  end

end
