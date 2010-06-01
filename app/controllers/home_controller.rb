class HomeController < ApplicationController

  def index
    @coming_events = Event.by_range(Time.now, Time.now.advance(:days => 14))
    unless @coming_events.empty?    
      @sponsored_events = @coming_events.sponsored
      @unsponsored_events = @coming_events - @sponsored_events
    else
      @sponsored_events = []
      @unsponsored_events = []
    end
  end
  
end

  