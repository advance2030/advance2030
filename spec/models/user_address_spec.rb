require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserAddress do
  before(:each) do
    @user_address = Factory.build(:user_address)
  end

  it "should create a new instance given valid attributes" do
    @user_address.should be_valid
  end
end