require 'helper/select_list'

module Presenters
  class EventForm
    include Helper::SelectList

    attr_reader :event
    delegate :venue, :manager, :to => :event

    def initialize(event)
      @event = event
    end

    def venues
      Venue.list
    end

    def managers
      select_list(User.managers, :id, :display_name)
    end

    def venue_prompt
      "Select a Venue"
    end

    def manager_prompt
      "Select a Manager"
    end

  end
end
