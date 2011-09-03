require 'spec_helper'

describe ApplicationHelper do

  include Devise::TestHelpers

  it "gets twitter logo" do
    sign_in Factory.create(:twitter_user)
    helper.provider_logo.should == "twitter_16.png"
    File.exists?(Rails.root.join('public','images',helper.provider_logo)).should be_true
  end

end
