require 'spec_helper'

describe AboutController do

  #Delete these examples and add some real ones
  it "should use AboutController" do
    controller.should be_an_instance_of(AboutController)
  end


  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'directors'" do
    it "should be successful" do
      get 'directors'
      response.should be_success
    end
  end
end
