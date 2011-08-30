module ApplicationHelper

  def signed_in?
    session[:uid].present?
  end

end
