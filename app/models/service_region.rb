class ServiceRegion < ActiveRecord::Base
  has_many :organizations
  
  class << self
    def options
      self.all.map { |v| [v.title, v.id] }
    end
  end
end
