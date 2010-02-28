require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrganizationAddress do
  before(:each) do
    @valid_attributes = {
      :address_type_id => 1,
      :organization_id => 1,
      :street => "value for street",
      :postal_code_id => 1,
      :is_primary => false,
      :sort_order => 1
    }
  end

  it "should create a new instance given valid attributes" do
    OrganizationAddress.create!(@valid_attributes)
  end
end
