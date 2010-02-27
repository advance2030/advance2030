require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Suffix do
  before(:each) do
    @suffix = Factory.build(:suffix)
  end

  it "should create a new instance given valid attributes" do
    @suffix.should be_valid
  end
end
