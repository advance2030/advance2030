require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe State do
  before(:each) do
    @state = Factory.build(:state)
  end

  it "should create a new instance given valid attributes" do
    @state.should be_valid
  end
end