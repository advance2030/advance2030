require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Link do
  before(:each) do
    @link = Factory.build(:link)
  end

  it "should create a new instance given valid attributes" do
    @link.should be_valid
  end
end