require 'lib/helper/string'
require 'is_taggable'

class Event < ActiveRecord::Base
  named_scope :by_range, lambda { |from, to| { :conditions => ["events.start_datetime between ? and ?", from, to]} }

  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_one :manager, :class_name => "User"
  belongs_to :venue
  has_one :supervisor, :class_name => "User"
  has_one :committee_sponsor, :foreign_key => :committee_id, :class_name => "Committee"

  validates_presence_of :start_datetime, :end_datetime

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

  def before_save
    self.url_friendly = self.title.extend(Helper::String).to_url_friendly unless self.url_friendly?
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

    # TODO: moves these up into scope
    def all_in_month(date)
      self.by_range(date.beginning_of_month, date.end_of_month).find(:all, :order => 'start_datetime asc, name asc')
    end
  
    def all_in_day(date)
      self.by_range(date.beginning_of_day, date.end_of_day).find(:all, :order => 'start_datetime asc, name asc')
    end
  end

end
