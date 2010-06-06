require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Venue do
  before(:each) do
    @venue = Factory.build(:venue)
  end

  it "should create a new instance given valid attributes" do
    @venue.should be_valid
  end

  it "should not be valid without a title" do
    @venue.title = nil
    @venue.should_not be_valid
  end

  it "should return true for #blacklisted? if blacklisted" do
    @venue.is_blacklisted = true
    @venue.should be_blacklisted
  end

=begin
  it "should only allow capacity to be numeric" do
    pending
    @venue.capacity = 'letters'
    @venue.should_not be_valid
  end

  it "should only allow full capacity to be numeric" do
    pending
    @venue.full_capacity = 'letters'
    @venue.should_not be_valid
  end
=end

  context "#url_friendly" do
    it "should be set to the value provided" do
      @venue.title = 'This is the title'
      @venue.url_friendly = 'this-is-custom'
      @venue.save
      @venue.url_friendly.should == 'this-is-custom'
    end

    it "should be set automatically from the title if not provided" do
      @venue.title = 'This is the title'
      @venue.url_friendly = nil
      @venue.save
      @venue.url_friendly.should == 'this-is-the-title'
    end
  end
end
