require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Registration do
  it { should validate_presence_of(:login) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email_address) }
end
