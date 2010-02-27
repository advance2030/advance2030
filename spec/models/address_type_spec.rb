require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AddressType do
  before(:each) do
    @address_type = Factory.build(:address_type)
  end

  it "should create a new instance given valid attributes" do
    @address_type.should be_valid
  end
end
