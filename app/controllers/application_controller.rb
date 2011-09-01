class ApplicationController < ActionController::Base
  protect_from_forgery

  def signed_in?
    session[:uid].present?
  end
  helper_method :signed_in?

  protected

  def authenticate!
    redirect_to root_path unless signed_in?
  end
end
