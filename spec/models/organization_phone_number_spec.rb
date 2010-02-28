require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrganizationPhoneNumber do
  before(:each) do
    @organization_phone_number = Factory.build(:organization_phone_number)
  end

  it "should create a new instance given valid attributes" do
    @organization_phone_number.should be_valid
  end
end
