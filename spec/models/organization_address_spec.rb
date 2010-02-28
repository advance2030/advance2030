require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrganizationAddress do
  before(:each) do
    @organization_address = Factory.build(:organization_address)
  end

  it "should create a new instance given valid attributes" do
    @organization_address.should be_valid
  end
end
