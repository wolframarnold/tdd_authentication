module ApplicationHelper

  def signed_in?
    session[:uid].present?
  end

  def provider_logo
    "#{session[:provider]}_16.png"
  end

end
