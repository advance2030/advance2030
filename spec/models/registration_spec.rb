require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Registration do

  context "validation on first step" do
    it { should validate_presence_of(:login) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email_address) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }

    it { should allow_value("john@gmail.com").for(:email_address) }
    it { should allow_value("john.doe@gmail.com").for(:email_address) }
    it { should_not allow_value("john_gmail.com").for(:email_address) }
    it { should_not allow_value("john@gmailcom").for(:email_address) }
    it { should_not allow_value("john@@gmail.com").for(:email_address) }

    it "validates that password and password_confirm match" do
      registration = Registration.new(:password => 'password', :password_confirmation => 'password1')
      registration.valid?.should be_false
      registration.errors[:password].should == 'and confirmation do not match'
    end
  end

  context "validation on second step" do
    before(:each) do
      @subject = Factory.build(:registration)
      @subject.current_step = 'personal_info'
    end

    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip) }
    it { should validate_presence_of(:phone_number) }
  end

  context "multi steps logic" do
    before(:each) do
      @registration = Registration.new
    end

    it "has an array of steps" do
      @registration.steps.should == %w[create personal_info review]
    end

    it "has the first step as current step at the beginning" do
      @registration.current_step.should == 'create'
    end

    it "has second step as the next step when current step is first step" do
      @registration.next_step.should == 'personal_info'
    end

    it "has third step as the next step when current step is second step" do
      @registration.current_step = 'personal_info'
      @registration.next_step.should == 'review'
    end

    it "has second step as previous step when current step is third step" do
      @registration.current_step = 'review'
      @registration.previous_step.should == 'personal_info'
    end

    it "tells me if it's on first step" do
      @registration.current_step = 'create'
      @registration.first_step?.should be_true
    end

    it "tells me if it's on last step" do
      @registration.current_step = 'review'
      @registration.last_step?.should be_true
    end
  end
end

