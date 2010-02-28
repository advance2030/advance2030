require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Industry do
  before(:each) do
    @industry = Factory.build(:industry)
  end

  it "should create a new instance given valid attributes" do
    @industry.should be_valid
  end
end
