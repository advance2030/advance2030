class EventsController < ApplicationController
  helper_method :presenter

  def new
    @event = Event.new
    render :action => :new
  end

  def presenter
    @presenter ||= Presenters::EventForm.new(@event)
  end

end
