require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserPhoneNumber do
  before(:each) do
    @user_phone_number = Factory.build(:user_phone_number)
  end

  it "should create a new instance given valid attributes" do
    @user_phone_number.should be_valid
  end
end