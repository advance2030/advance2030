class EventsController < ApplicationController
  helper_method :presenter

  def new
    @event = Event.new
    render :action => :new
  end
  
  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "You Have Successfully Registered a New Event"
      redirect_to (detail_event_path(@event))
    else
      render new_event_path
    end
  end

  def presenter
    @presenter ||= Presenters::EventForm.new(@event)
  end

  def detail
    @event = Event.find(params[:id])
  end
end
