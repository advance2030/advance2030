require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Venue do
  before(:each) do
    @venue = Factory.build(:venue)
  end

  it "should create a new instance given valid attributes" do
    @venue.should be_valid
  end
end