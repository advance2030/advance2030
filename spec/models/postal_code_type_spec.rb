require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostalCodeType do
  before(:each) do
    @postal_code_type = Factory.build(:postal_code_type)
  end

  it "should create a new instance given valid attributes" do
    @postal_code_type.should be_valid
  end
end
