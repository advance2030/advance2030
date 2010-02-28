require 'helper/select_list'

module Presenters
  class EventForm
    include Helper::SelectList

    attr_reader :event
    delegate :venue, :manager, :supervisor, :committee_sponsor,
             :name, :summary, :description, :tag_list,
             :logo, :start_datetime, :end_datetime, :to => :event

    def initialize(event)
      @event = event
    end

    def venues
      Venue.list
    end

    def managers
      select_list(User.managers, :id, :display_name)
    end

    def supervisors
      select_list(User.supervisors, :id, :display_name)
    end

    def committee_sponsors
      Committee.list
    end

    def committee_sponsor_prompt
      "Select a Sponsor"
    end

    def venue_prompt
      "Select a Venue"
    end

    def manager_prompt
      "Select a Manager"
    end

    def supervisor_prompt
      "Select a Supervisor"
    end

  end
end
