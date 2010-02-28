class VenueType < ActiveRecord::Base
  has_many :venues
  
  class << self
    def options
      self.all.map { |v| [v.title, v.id] }
    end
  end
end
