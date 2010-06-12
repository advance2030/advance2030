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

  it "creates a new user account and move on to personal information" do
    session[:registration_params] = {}
    registration = stub(Registration)
    Registration.stub!(:new).with(@create_post_values).and_return(registration)

    registration.should_receive(:current_step=).with(nil)
    registration.should_receive(:valid?).and_return(true)
    registration.should_receive(:next_step)
    registration.should_receive(:new_record?).and_return(true)

    # Call the action
    post 'create', {:registration => @create_post_values}
    assigns(:registration).should == registration
    response.should render_template "new"
  end
end

