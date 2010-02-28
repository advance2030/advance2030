require 'spec_helper'

describe Presenters::EventForm do

  it "should be instantiated" do
    Presenters::EventForm.new.should_not be_nil
  end
end
