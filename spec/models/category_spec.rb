require 'spec_helper'

describe Category do
  before(:each) do
    @category = Factory.build(:category)
  end


  it "should create a new instance given valid attributes" do
    @category.should be_valid
  end

  it "should complain when the name already exists" do
    @category.save

    new_category = Factory.build(:category)
    new_category.should_not be_valid
    new_category.errors.on(:name).should == "must be unique"
  end


  it { should have_many :categorizations }
  it { should have_many :events }
end

