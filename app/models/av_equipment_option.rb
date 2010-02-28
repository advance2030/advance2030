class AvEquipmentOption < ActiveRecord::Base
  has_many :venue_av_equipments, :dependent => :destroy
  has_many :venues, :through => :venue_av_equipments
  
  named_scope :list
end
