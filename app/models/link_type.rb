class LinkType < ActiveRecord::Base
  named_scope :by_title, lambda { |title| { :conditions => ["link_types.title = ?", title]} }
  
  class << self
    def home
      self.by_title('Home').first
    end
    
    def work
      self.by_title('Work').first
    end
    
    def headquarters
      self.by_title('Headquarters').first
    end
    
    def other
      self.by_title('Other').first
    end
  end
end
