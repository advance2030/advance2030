require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ParkingOption do
  before(:each) do
    @parking_option = Factory.build(:parking_option)
  end

  it "should create a new instance given valid attributes" do
    @parking_option.should be_valid
  end
end
