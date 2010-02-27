require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EmailAddressType do
  before(:each) do
    @email_address_type = Factory.build(:email_address_type)
  end

  it "should create a new instance given valid attributes" do
    @email_address_type.should be_valid
  end
end
