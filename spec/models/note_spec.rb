require File.dirname(__FILE__) + '/../spec_helper'

describe Note do
  it "requires title" do
    subject.should_not be_valid
    subject.errors[:title].should_not be_empty
  end

  it 'requires a uid and provider' do
    subject.should_not be_valid
    subject.errors[:uid].should_not be_empty
    subject.errors[:provider].should_not be_empty
  end
end
