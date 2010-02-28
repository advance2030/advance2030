class AlertsController < ApplicationController

  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @alert = Alert.new

  end


  def create
    @alert = Alert.create(params[:alerts])
    if not @alert.valid?
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end


end
