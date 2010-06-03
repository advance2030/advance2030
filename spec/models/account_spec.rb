require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Account do
  before(:each) do
    @account = Factory.build(:account)
  end

=begin
  after(:each) do
    @user_profile.destroy
  end
=end

  it { should belong_to :user }
  it { should have_one :registration }

  it "should set the join date when a user registers"
  it "should set their expiration date 1 year into the future"
end

