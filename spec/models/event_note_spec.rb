require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EventNote do
  before(:each) do
    @event_note = Factory.build(:event_note)
  end

  it "should create a new instance given valid attributes" do
    @event_note.should be_valid
  end
end
