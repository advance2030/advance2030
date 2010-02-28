class Event < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations

  class << self
    def min_start_date_time
      self.minimum(:start_datetime)
    end

    def max_end_date_time
      self.maximum(:end_datetime)
    end
  end
end
