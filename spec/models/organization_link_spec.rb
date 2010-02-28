require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrganizationLink do
  before(:each) do
    @organization_link = Factory.build(:organization_link)
  end

  it "should create a new instance given valid attributes" do
    @organization_link.should be_valid
  end
end
