class RegistrationsController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    session[:registration_params] ||= {}
    @registration = Registration.new(session[:registration_params])
    @registration.current_step = session[:registration_step]
  end

  def create
    session[:registration_params].deep_merge!(params[:registration]) if params[:registration]
    @registration = Registration.new(session[:registration_params])
    @registration.current_step = session[:registration_step]
    if @registration.valid?
      if (@registration.current_step == 'personal_info')
        @registration.save!
        registration_converter = ConvertsRegistrationToAccountInformation.new
        registration_converter.do_it(@registration)
      end

      # render :action => :show
      #redirect_to account_url
      @registration.next_step
      session[:registration_step] = @registration.current_step
      # logger.info("Current step is #{@registration.current_step}")
    end

    if @registration.new_record?
      render "new"
    else
      #Continue from here -> the 3rd step should render "show"
      render "new"
      #session[:registration_step] = session[:registration_params] = nil
      #flash[:notice] = "Registration saved!"
      #render "show"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

end

