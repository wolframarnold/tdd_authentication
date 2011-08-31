require 'spec_helper'

describe ApplicationHelper do

  %w(twitter facebook linked_in).each do |provider|
    it "gets #{provider} logo" do
      helper.session[:provider] = provider
      helper.provider_logo.should == "#{provider}_16.png"
      File.exists?(Rails.root.join('public','images',helper.provider_logo)).should be_true
    end
  end

end
