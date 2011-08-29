require File.dirname(__FILE__) + '/../spec_helper'

describe Note do
  it "requires title" do
    subject.should_not be_valid
    subject.errors[:title].should_not be_empty
  end
end
