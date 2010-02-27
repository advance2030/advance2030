require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe City do
  before(:each) do
    @city = Factory.build(:city)
  end

  it "should create a new instance given valid attributes" do
    @city.should be_valid
  end
end
