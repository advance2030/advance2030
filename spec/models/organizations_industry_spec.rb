require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrganizationsIndustry do
  before(:each) do
    @valid_attributes = {
      :organization_id => 1,
      :industry_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    OrganizationsIndustry.create!(@valid_attributes)
  end
end
