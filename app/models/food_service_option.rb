class FoodServiceOption < ActiveRecord::Base
  has_many :venue_food_service_options, :dependent => :destroy
  has_many :venues, :through => :venue_food_service_options
  
  named_scope :list
end
