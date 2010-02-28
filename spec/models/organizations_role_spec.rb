require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrganizationsRole do
  before(:each) do
    @valid_attributes = {
      :organization_role_id => 1,
      :organization_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    OrganizationsRole.create!(@valid_attributes)
  end
end
