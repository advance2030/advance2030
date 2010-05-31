class HomeController < ApplicationController

  def index
    @coming_events = Event.by_range(Time.now, Time.now.advance(:days => 14))
    @sponsored_events = @coming_events.sponsored
    @unsponsored_events = @coming_events - @coming_sponsored_events
  end
  
end

  