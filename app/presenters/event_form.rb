module Presenters
  class EventForm
    attr_reader :event
    delegate :venue, :to => :event

    def initialize(event)
      @event = event
    end

    def venues
      Venue.list
    end

  end
end
