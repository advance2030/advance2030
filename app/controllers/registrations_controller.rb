class RegistrationsController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @registration = Registration.new
  end
  
  def create
    @registration = Registration.new(params[:registration])
    if @registration.save
      registration_converter = ConvertsRegistrationToAccountInformation.new
      registration_converter.do_it(@registration)
      
      # render :action => :show
      redirect_to account_url
    else
      render :action => :new
    end
  end
  
  def show
  end
 
  def edit
  end
  
  def update
  end
  
end
