require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FoodServiceOption do
  before(:each) do
    @food_service_option = Factory.build(:food_service_option)
  end

  it "should create a new instance given valid attributes" do
    @food_service_option.should be_valid
  end
end
