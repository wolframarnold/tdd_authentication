require 'spec_helper'

describe OmniauthCallbacksController do

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  context "Existing user" do

    before do
      @twitter_user = Factory(:twitter_user, :uid => '123456789abc')
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter].merge('uid' => '123456789abc')
      get :twitter
    end

    it 'should redirect to notes index path' do
      response.should redirect_to(notes_path)
    end
    it 'should sign the user in' do
      controller.user_signed_in?.should be_true
    end

  end

  context "New user" do
    before do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter].merge('uid' => 'random_uid_string')
    end

    it 'should create a new user' do
      expect {
        get :twitter
      }.to change(User,:count)
      assigns[:user].uid.should == 'random_uid_string'
      assigns[:user].name.should == 'Joe Smith'
      assigns[:user].nickname.should == 'joesmith'
      assigns[:user].avatar.should == 'http://example.com/joesmith.png'
      assigns[:user].provider.should == 'twitter'
    end

    it 'should redirects to notes_path' do
      get :twitter
      response.should redirect_to(notes_path)
    end

    it 'should sign the user in' do
      get :twitter
      controller.user_signed_in?.should be_true
    end

  end

end
