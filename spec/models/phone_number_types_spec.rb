require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhoneNumberTypes do
  before(:each) do
    @phone_number_type = Factory.build(:phone_number_type)
  end

  it "should create a new instance given valid attributes" do
    @phone_number_type.should be_valid
  end
end
