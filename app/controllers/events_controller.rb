class EventsController < ApplicationController

  def new
    @event = Event.new
    render :action => :new
  end

  def presenter
    @presenter ||= Presenters::EventForm.new
  end

end
