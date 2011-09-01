require 'spec_helper'

describe "Sign in via Twitter" do

  it 'lets user log in from home page' do
    visit '/'
    click_link 'Sign in with Twitter'
    path.should == '/notes'
    response.should have_selector('div.login', :content => 'Joe Smith')
    response.should have_selector('div.login img[src="http://example.com/joesmith.png"]')
  end
  
end
