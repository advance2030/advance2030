require 'spec_helper'

describe Event do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :summary => "value for summary",
      :description => "value for description",
      :start_date_time => Date.today,
      :end_date_time => Date.today,
      :registration_start_date_time => Date.today,
      :registration_end_date_time => Date.today,
      :attendee_target_count => 1,
      :attendee_limit => 1,
      :notes => "value for notes",
      :venue_notes => "value for venue_notes"
    }
  end

  it "should create a new instance given valid attributes" do
    Event.create!(@valid_attributes)
  end
end
