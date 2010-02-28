require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ServiceRegion do
  before(:each) do
    @service_region = Factory.build(:service_region)
  end

  it "should create a new instance given valid attributes" do
    @service_region.should be_valid
  end
end
