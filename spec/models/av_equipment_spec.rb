require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AvEquipment do
  before(:each) do
    @av_equipment = Factory.build(:av_equipment)
  end

  it "should create a new instance given valid attributes" do
    @av_equipment.should be_valid
  end
end
