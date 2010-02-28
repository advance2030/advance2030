require 'spec_helper'

describe Presenters::EventForm do

  it "should take an event" do
    lambda { Presenters::EventForm.new }.should raise_error(ArgumentError)
  end

  before do
    @event = mock_model(Event)
  end

  subject { Presenters::EventForm.new(@event) }

  it { should respond_to(:event) }
  it { subject.event.should == @event }

end
