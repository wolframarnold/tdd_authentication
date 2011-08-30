require 'spec_helper'

describe SessionsController do
  it '#destroy deletes session' do
    session[:uid] = 'some uid'
    expect {
      get :destroy
    }.to change{session[:uid]}.from('some uid').to(nil)
  end

  it 'redirects to root_path' do
    get :destroy
    response.should redirect_to(root_path)
  end
end
