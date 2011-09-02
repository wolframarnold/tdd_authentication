require 'spec_helper'

describe User do
  before do
    @user = Factory(:twitter_user)
  end

  it 'finds an existing record based on UID' do
    found_user = User.with_twitter_uid(@user.uid).first
    found_user.should == @user
  end

end
