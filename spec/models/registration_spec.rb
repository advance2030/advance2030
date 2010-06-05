require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Registration do
  it { should validate_presence_of(:login) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email_address) }

  it { should allow_value("john@gmail.com").for(:email_address) }
  it { should allow_value("john.doe@gmail.com").for(:email_address) }
  it { should_not allow_value("john_gmail.com").for(:email_address) }
  it { should_not allow_value("john@gmailcom").for(:email_address) }
  it { should_not allow_value("john@@gmail.com").for(:email_address) }
end
