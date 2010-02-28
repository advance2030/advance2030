require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VenueFoodServiceOptions do
  before(:each) do
    @valid_attributes = {
      :venue_id => 1,
      :food_service_option_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    VenueFoodServiceOptions.create!(@valid_attributes)
  end
end
