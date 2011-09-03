require 'spec_helper'

describe 'pages/home' do
  include Devise::TestHelpers

  context "when not signed in" do
    before do
      render :template => 'pages/home', :layout => 'layouts/application'
    end

    it 'should have h1 "Welcome" tag' do
      rendered.should have_selector("h1", :content => "Welcome")
    end

    it 'should have a "Sign with Twitter" link' do
      rendered.should have_selector("a[href='/users/auth/twitter'][title='Sign in with Twitter']")
    end
  end

  context "when signed in" do
    before do
      sign_in Factory.create(:twitter_user)
      render :template => 'pages/home', :layout => 'layouts/application'
    end

    it 'should not have anything saying "sign in" on the page at all' do
      rendered.should_not match(/sign in/i)
    end

    it 'should have a "Sign out" link' do
      rendered.should have_selector("a[href='#{destroy_user_session_path}']", :content => "Sign out")
    end

    it 'should have the name displayed' do
      rendered.should have_selector("div.login", :content => "Joe Smith")
    end

    it 'should have the avatar url displayed' do
      rendered.should have_selector("div.login img[src='http://example.com/joesmith.png']")
    end
  end
end
