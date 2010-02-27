require 'spec_helper'

describe Category do
  before(:each) do
    @valid_attributes = {
      :name => "Category",
      :description => "Description"
    }
  end

  it "should create a new instance given valid attributes" do
    Category.create!(@valid_attributes)
  end

  it "should complain when the name already exists" do
    Category.create!(@valid_attributes)
    
    category = Category.new(@valid_attributes)
    category.should_not be_valid
    category.errors.on(:name).should == "must be unique"
  end
end
