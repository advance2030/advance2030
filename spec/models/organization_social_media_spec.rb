require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrganizationSocialMedia do
  before(:each) do
    @organization_social_media = Factory.build(:organization_social_media)
  end

  it "should create a new instance given valid attributes" do
    @organization_social_media.should be_valid
  end
end
