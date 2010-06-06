require 'lib/helper/string'
require 'is_taggable'

class Event < ActiveRecord::Base
  
  validates_presence_of :start_datetime, :end_datetime
  has_attached_file :sponsor_logo, :styles => {:sponsored_event => "75x75"}
  
  named_scope :by_range do |from, to|  
    {:conditions => ["start_datetime between ? and ?", from, to],
    :order => :start_datetime} 
  end
  named_scope :sponsored, :conditions => {:sponsor => true }
  
  def before_save
    self.url_friendly = self.name.extend(Helper::String).to_url_friendly unless self.url_friendly?
  end

  def to_param
    self.url_friendly
  end
  
  class << self
    def min_start_date_time
      self.minimum(:start_datetime)
    end

    def max_end_date_time
      self.maximum(:end_datetime)
    end
    
    def all_in_month(date)
      self.by_range(date.beginning_of_month, date.end_of_month).find(:all, :order => 'start_datetime asc, name asc')
    end
  
    def all_in_day(date)
      self.by_range(date.beginning_of_day, date.end_of_day).find(:all, :order => 'start_datetime asc, name asc')
    end
  end

end


=begin
  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_one :manager, :class_name => "User"
  belongs_to :venue
  has_one :supervisor, :class_name => "User"
  has_one :committee_sponsor, :foreign_key => :committee_id, :class_name => "Committee"
  has_many :event_sponorship_details
  #has_one :sponsor, :through => :event_sponsorship_details, :class_name => "Organization"
  

  is_taggable :tags

  def primary_category
    self.categories.first
  end

  def color
    category = self.primary_category
    
    category.blank? ? 'uncategorized' : category.color
  end
  
  def venue?
    !self.venue_id.nil?
  end




  end
=end

