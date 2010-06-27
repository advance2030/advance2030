require 'spec_helper'

describe BenefitsController do

  #Delete these examples and add some real ones
  it "should use BenefitsController" do
    controller.should be_an_instance_of(BenefitsController)
  end


  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'social'" do
    it "should be successful" do
      get 'social'
      response.should be_success
    end
  end
  
    describe "GET 'networking'" do
    it "should be successful" do
      get 'networking'
      response.should be_success
    end
  end
  
    describe "GET 'philanthropic'" do
    it "should be successful" do
      get 'philanthropic'
      response.should be_success
    end
  end
  
    describe "GET 'educational'" do
    it "should be successful" do
      get 'educational'
      response.should be_success
    end
  end
  
    describe "GET 'involved'" do
    it "should be successful" do
      get 'involved'
      response.should be_success
    end
  end
  
    describe "GET 'discounts'" do
    it "should be successful" do
      get 'discounts'
      response.should be_success
    end
  end
  
    describe "GET 'join'" do
    it "should be successful" do
      get 'join'
      response.should be_success
    end
  end
end
