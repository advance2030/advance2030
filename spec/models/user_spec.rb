require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @user = Factory.build(:user)
  end

  it "should create a new instance given valid attributes" do
    @user.should be_valid
  end

  it "should have a display_name property from First name and Last name" do
    @user.display_name.should == "George Plate"
  end

  it "should have a login property mapped to Account" do
    account = Account.new(:login => 'gplate')
    @user.account = account
    @user.login.should == 'gplate'
  end
end
