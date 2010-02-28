class ParkingOption < ActiveRecord::Base
  has_many :venue_parking_options, :dependent => :destroy
  has_many :venues, :through => :venue_parking_options, :source => :venue

  named_scope :list

  class << self
    def options
      self.all.map { |v| [v.title, v.id] }
    end
  end
end
