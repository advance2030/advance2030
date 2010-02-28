require 'paperclip'
class Venue < ActiveRecord::Base
  has_attached_file :avatar,
                    :styles => { :medium => "80x80>", :thumb => "50x50" }
  
  belongs_to :venue_type
  named_scope :list
  
  def validate
    self.errors.add(:title, 'Please provide a title') unless self.title?
  end
  
  def blacklisted?
    self.is_blacklisted
  end
  
  def before_save
    self.url_friendly = self.title.extend(Helper::String).to_url_friendly unless self.url_friendly?
  end
  
  def to_param
    self.url_friendly
  end
end