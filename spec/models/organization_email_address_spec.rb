require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrganizationEmailAddress do
  before(:each) do
    @organization_email_address = Factory.build(:organization_email_address)
  end

  it "should create a new instance given valid attributes" do
    @organization_email_address.should be_valid
  end
end
