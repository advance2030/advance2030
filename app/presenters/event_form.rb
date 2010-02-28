module Presenters
  class EventForm
    attr_reader :event
    delegate :venue, :manager, :to => :event

    def initialize(event)
      @event = event
    end

    def venues
      Venue.list
    end

    def venue_prompt
      "Select a Venue"
    end

  end
end
