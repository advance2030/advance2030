class PhoneNumberType < ActiveRecord::Base
  named_scope :by_title, lambda { |title| { :conditions => ["phone_number_types.title = ?", title]} }
  
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
    
    def mobile
      self.by_title('Mobile').first
    end
    
    def other
      self.by_title('Other').first
    end
  end
end
