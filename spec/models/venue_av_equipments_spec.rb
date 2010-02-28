require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VenueAvEquipments do
  before(:each) do
    @valid_attributes = {
      :venue_id => 1,
      :av_equipment_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    VenueAvEquipments.create!(@valid_attributes)
  end
end
