require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostalCode do
  before(:each) do
    @postal_code = Factory.build(:postal_code)
  end

  it "should create a new instance given valid attributes" do
    @postal_code.should be_valid
  end
end
