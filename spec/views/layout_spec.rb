require 'spec_helper'

describe 'pages/home' do
  before do
    render :template => 'pages/home', :layout => 'layouts/application'
  end

  it 'should have h1 "Welcome" tag' do
    rendered.should have_selector("h1", :content => "Welcome")
  end

  it 'should have a "Sign with Twitter" link' do
    rendered.should have_selector("a[href='/auth/twitter']", :content => "Sign in with Twitter")
  end
end
