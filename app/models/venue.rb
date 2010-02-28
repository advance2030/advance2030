require 'lib/helper/string'
require 'paperclip'

class Venue < ActiveRecord::Base
  has_attached_file :avatar,
                    :styles => { :medium => "80x80>", :thumb => "50x50" }
  
  belongs_to :venue_type
  
  has_many :venue_parking_options, :dependent => :destroy
  has_many :parking_options, :through => :venue_parking_options
  
  has_many :venue_food_service_options, :dependent => :destroy
  has_many :food_service_options, :through => :venue_food_service_options
  
  has_many :venue_fee_options, :dependent => :destroy
  has_many :fee_options, :through => :venue_fee_options
  
  has_many :venue_av_equipment_options, :dependent => :destroy
  has_many :av_equipment_options, :through => :venue_av_equipment_options
  
  has_many :notes, :class_name => 'VenueNote'
  
  named_scope :list
  
  def validate
    self.errors.add(:title, 'Please provide a title') unless self.title?
  end
  
  def parking_options?
    self.parking_options.any?
  end
  
  def fee_options?
    self.fee_options.any?
  end
  
  def av_equipment_options?
    self.av_equipment_options.any?
  end
  
  def food_service_options?
    self.food_service_options.any?
  end
  
  def notes?
    self.notes.any?
  end
  
  def blacklisted?
    self.is_blacklisted
  end
  
  def destroy_avatar!
    self.update_attributes(:avatar => nil)
  end
  
  def before_save
    self.url_friendly = self.title.extend(Helper::String).to_url_friendly unless self.url_friendly?
  end
  
  def to_param
    self.url_friendly
  end
end