require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VenueFeeOptions do
  before(:each) do
    @valid_attributes = {
      :venue_id => 1,
      :fee_option_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    VenueFeeOptions.create!(@valid_attributes)
  end
end
