require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrganizationType do
  before(:each) do
    @organization_type = Factory.build(:organization_type)
  end

  it "should create a new instance given valid attributes" do
    @organization_type.should be_valid
  end
end
