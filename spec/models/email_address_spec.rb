require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EmailAddress do
  #before(:each) do
  #  @subject = Factory.build(:user)
  #end

  it { should belong_to :user }
end

