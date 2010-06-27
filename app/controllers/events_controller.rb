class EventsController < ApplicationController
  helper_method :presenter

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "You Have Successfully Registered a New Event"
      redirect_to (event_detail_path(@event))
    else
      render new_event_path
    end
  end
  
  def edit
    @event = Event.find_by_url_friendly(params[:id])
  end
  
  def update
    @event = Event.find_by_url_friendly(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = "You have successfully updated the event"
      redirect_to event_detail_path(@event)
    else
      render edit_event_path(@event)
    end
  end

  def presenter
    @presenter ||= Presenters::EventForm.new(@event)
  end

  def detail
    @event = Event.find_by_url_friendly(params[:id])
  end
end
