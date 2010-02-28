require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserRole do
  before(:each) do
    @user_role = Factory.build(:user_role)
  end

  it "should create a new instance given valid attributes" do
    @user_role.should be_valid
  end
end
