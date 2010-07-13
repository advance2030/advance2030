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
        clear_session
      else
        @registration.next_step
        session[:registration_step] = @registration.current_step
      end
      # logger.info("Current step is #{@registration.current_step}")
    end

    if @registration.new_record?
      render "new"
    else
      #Continue from here -> the 3rd step should render "show"
      render "review"
      #session[:registration_step] = session[:registration_params] = nil
      #flash[:notice] = "Registration saved!"
      #render "show"
    end
  end

  def start_over
    clear_session
    redirect_to new_registration_path
  end

  def review
    # logger.info("The current_user is #{@current_user}")
  end

  def show
  end

  def edit
  end

  def update
  end

private
  def clear_session
    session[:registration_params] = nil
    session[:registration_step] = nil
  end

end

