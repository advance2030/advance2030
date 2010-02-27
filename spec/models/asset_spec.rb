require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Asset do
  before(:each) do
    @asset = Factory.build(:asset)
  end

  it "should create a new instance given valid attributes" do
    @asset.should be_valid
  end
end
