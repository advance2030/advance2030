require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SocialMediaType do
  before(:each) do
    @social_media_type = Factory.build(:social_media_type)
  end

  it "should create a new instance given valid attributes" do
    @social_media_type.should be_valid
  end
end
