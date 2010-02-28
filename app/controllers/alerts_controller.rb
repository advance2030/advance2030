class AlertsController < ApplicationController

  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @alert = Alerts.new

  end


  def create
    @alert = Alerts.new(params[:alerts])
    if @alert.save
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end


end
