require 'spec_helper'

describe Event do
  before(:each) do
    @event = Factory.build(:event)
  end

  it "should create a new instance given valid attributes" do
    @event.should be_valid
  end
end
