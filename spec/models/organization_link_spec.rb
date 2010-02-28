require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrganizationLink do
  before(:each) do
    @valid_attributes = {
      :link_type_id => 1,
      :organization_id => 1,
      :link_id => 1,
      :is_primary => false,
      :sort_order => 1
    }
  end

  it "should create a new instance given valid attributes" do
    OrganizationLink.create!(@valid_attributes)
  end
end
