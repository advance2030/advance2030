require 'spec_helper'

describe RegistrationsController do

  before(:each) do
    @create_post_values = {"login" => "jdoe", "first_name" => "John", "last_name" => "Doe",
      "email_address" => "jdoe@gmail.com", "password" => "password"}
  end

  it "returns a new Registration object when accessing GET /new" do
    get :new

    assigns[:registration].should_not be_nil
  end

  context "first step" do
    it "catches the model validation and stays on the create page" do
      @create_post_values["password"] = ""

      session[:registration_params] = {}
      registration = Registration.new
      Registration.stub!(:new).with(@create_post_values).and_return(registration)

      # Call the action
      post 'create', {:registration => @create_post_values}

      registration.should_not be_valid
      registration.current_step.should == 'create'

      assigns(:registration).should == registration
      response.should render_template 'new'
    end
  end

  context "second step" do
    it "creates a new user account and move on to personal information" do
      session[:registration_params] = {}
      registration = stub(Registration)
      Registration.stub!(:new).with(@create_post_values).and_return(registration)

      registration.should_receive(:current_step=).with(nil)
      registration.should_receive(:valid?).and_return(true)
      registration.should_receive(:current_step).and_return('create')
      registration.should_receive(:next_step)
      registration.should_receive(:current_step)
      registration.should_receive(:new_record?).and_return(true)

      # Call the action
      post 'create', {:registration => @create_post_values}
      assigns(:registration).should == registration
      response.should render_template "new"
    end

    it "does not proceed to third step when second step fails" do
      session[:registration_params] = {}
      registration = stub(Registration)
      Registration.stub!(:new).with(@create_post_values).and_return(registration)

      registration.should_receive(:current_step=).with(nil)
      registration.should_receive(:valid?).and_return(false)
      registration.should_receive(:new_record?).and_return(true)

      post 'create', {:registration => @create_post_values}
      assigns(:registration).should == registration
      response.should render_template "new"
    end

    it "creates the user account when second step succeeds" do
      second_step_params = {"address" => "434 Cedar", "city" => "Beachwood",
        "state" => "OH", "zip" => "44253", "phone_number" => "216-453-4433"}
      session[:registration_params] = @create_post_values
      session[:registration_step] = 'personal_info'

      merged_params = @create_post_values.deep_merge!(second_step_params)
      registration = stub(Registration)
      Registration.stub!(:new).with(merged_params).and_return(registration)

      registration.should_receive(:current_step=).with('personal_info')
      registration.should_receive(:valid?).and_return(true)
      registration.should_receive(:current_step).and_return('personal_info')
      registration.should_receive(:save!)

      registration_converter = mock(ConvertsRegistrationToAccountInformation)
      ConvertsRegistrationToAccountInformation.stub!(:new).and_return(registration_converter)
      registration_converter.should_receive(:do_it).with(registration)

      registration.should_receive(:next_step)
      registration.should_receive(:current_step)
      registration.should_receive(:new_record?).and_return(:false)

      post 'create', {:registration => second_step_params}
    end
  end
end

