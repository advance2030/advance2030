class VenueFoodServiceOption < ActiveRecord::Base
  belongs_to :venue
  belongs_to :food_service_option
end
