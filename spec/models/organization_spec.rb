require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Organization do
  before(:each) do
    @organization = Factory.build(:organization)
  end

  it "should create a new instance given valid attributes" do
    @organization.should be_valid
  end
end
