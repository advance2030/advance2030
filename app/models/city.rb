class City < ActiveRecord::Base
  has_many :postal_codes, :dependent => :destroy
  
  def before_save
    self.url_friendly = self.title.extend(Helper::String).to_url_friendly unless self.url_friendly?
  end
end
