require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FeeOption do
  before(:each) do
    @fee_option = Factory.build(:fee_option)
  end

  it "should create a new instance given valid attributes" do
    @fee_option.should be_valid
  end
end