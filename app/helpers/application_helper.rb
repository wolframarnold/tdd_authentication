module ApplicationHelper

  def provider_logo
    "#{current_user.provider}_16.png"
  end

end
