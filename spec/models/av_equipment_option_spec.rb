require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AvEquipmentOption do
  before(:each) do
    @av_equipment_option = Factory.build(:av_equipment_option)
  end

  it "should create a new instance given valid attributes" do
    @av_equipment_option.should be_valid
  end
end
