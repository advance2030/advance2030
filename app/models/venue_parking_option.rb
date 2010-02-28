class VenueParkingOption < ActiveRecord::Base
  belongs_to :venue
  belongs_to :parking_option
end
