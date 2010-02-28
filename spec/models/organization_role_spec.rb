require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrganizationRole do
  before(:each) do
    @organization_role = Factory.build(:organization_role)
  end

  it "should create a new instance given valid attributes" do
    @organization_role.should be_valid
  end
end