require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Surname do
  before(:each) do
    @surname = Factory.build(:surname)
  end

  it "should create a new instance given valid attributes" do
    @surname.should be_valid
  end
end