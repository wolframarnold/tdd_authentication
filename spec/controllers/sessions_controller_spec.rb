require 'spec_helper'

describe SessionsController do

  context '#create' do
    before do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] 
    end

    it 'sets session variables' do
      get :create, :provider => 'twitter'
      session[:name].should == 'Joe Smith'
      session[:provider].should == 'twitter'
      session[:avatar].should == 'http://example.com/joesmith.png'
      controller.should be_signed_in
    end

    it 'redirects to root_path' do
      get :create, :provider => 'twitter'
      response.should redirect_to(notes_path)
    end
  end

  context '#failure' do
    before do
      get :failure
    end

    it 'has flash[:alert]' do
      flash[:alert].should == 'Authentication failure'
    end

    it 'redirects to root_path' do
      response.should redirect_to(root_path)
    end
  end

  context '#destroy' do

    it 'deletes session' do
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
end
