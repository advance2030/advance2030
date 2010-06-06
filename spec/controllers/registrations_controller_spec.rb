require 'spec_helper'

describe RegistrationsController do

  it "returns a new Registration object when accessing GET /new" do
    get :new

    assigns[:registration].should_not be_nil
  end

  it "creates a registered user" do
    post_values = {"login" => "jdoe", "first_name" => "John", "last_name" => "Doe", 
      "email_address" => "jdoe@gmail.com"}
    registration = mock(Registration)
    converter = mock(ConvertsRegistrationToAccountInformation)
    
    Registration.should_receive(:new).with(post_values).and_return(registration)
    registration.should_receive(:save).and_return(true)
    ConvertsRegistrationToAccountInformation.should_receive(:new).and_return(converter)
    converter.should_receive(:do_it)
    
    post 'create', {:registration => post_values}
    
    response.should redirect_to(account_url)
  end
end
