require 'spec_helper'

describe Events do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :summary => "value for summary",
      :description => "value for description",
      :start_date_time => ,
      :end_date_time => ,
      :registration_start_date_time => ,
      :registration_end_date_time => ,
      :attendee_target_count => 1,
      :attendee_limit => 1,
      :notes => "value for notes",
      :venue_notes => "value for venue_notes"
    }
  end

  it "should create a new instance given valid attributes" do
    Events.create!(@valid_attributes)
  end
end
