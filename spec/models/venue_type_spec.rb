require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VenueType do
  before(:each) do
    @venue_type = Factory.build(:venue_type)
  end

  it "should create a new instance given valid attributes" do
    @venue_type.should be_valid
  end
end