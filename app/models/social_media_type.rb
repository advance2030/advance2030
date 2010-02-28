class SocialMediaType < ActiveRecord::Base
  named_scope :by_title, lambda { |title| { :conditions => ["social_media_types.title = ?", title]} }
  
  class << self
    def twitter
      self.by_title('Twitter').first
    end
    
    def linked_in
      self.by_title('LinkedIn').first
    end
    
    def facebook
      self.by_title('Facebook').first
    end
  end
end
