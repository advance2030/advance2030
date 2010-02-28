require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VenueNote do
  before(:each) do
    @venue_note = Factory.build(:venue_note)
  end

  it "should create a new instance given valid attributes" do
    @venue_note.should be_valid
  end
end
