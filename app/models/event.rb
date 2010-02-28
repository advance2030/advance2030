class Event < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_one :manager, :class_name => "User"
  has_one :venue
  has_one :supervisor, :class_name => "User"
  has_one :committee_sponsor, :foreign_key => :committee_id, :class_name => "Committee"

  class << self
    def min_start_date_time
      self.minimum(:start_datetime)
    end

    def max_end_date_time
      self.maximum(:end_datetime)
    end
  end

end
