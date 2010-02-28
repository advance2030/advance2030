require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LinkType do
  before(:each) do
    @link_type = Factory.build(:link_type)
  end

  it "should create a new instance given valid attributes" do
    @link_type.should be_valid
  end
end
