require 'spec_helper'

describe SessionsController do

  context '#destroy' do

    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in Factory.create(:twitter_user)
    end

    it 'deletes session' do
      controller.should be_signed_in
      get :destroy
      controller.should_not be_signed_in
    end

    it 'redirects to root_path' do
      get :destroy
      response.should redirect_to(root_path)
    end
  end
end
