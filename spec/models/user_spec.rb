require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @user = Factory.build(:user)
  end

  it "should create a new instance given valid attributes" do
    @user.should be_valid
  end
end
