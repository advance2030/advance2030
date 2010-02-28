require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VenueParkingOptions do
  before(:each) do
    @valid_attributes = {
      :venue_id => 1,
      :parking_option_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    VenueParkingOptions.create!(@valid_attributes)
  end
end
