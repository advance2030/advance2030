require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersRole do
  before(:each) do
    @users_role = Factory.build(:users_role)
  end

  it "should create a new instance given valid attributes" do
    @users_role.should be_valid
  end
end
