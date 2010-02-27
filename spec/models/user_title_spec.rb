require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserTitle do
  before(:each) do
    @user_title = Factory.build(:user_title)
  end

  it "should create a new instance given valid attributes" do
    @user_title.should be_valid
  end
end