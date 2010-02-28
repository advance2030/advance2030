class PostalCode < ActiveRecord::Base
  belongs_to :state
  belongs_to :city
  belongs_to :postal_code_type
  
  named_scope :by_state, lambda { |state| { :conditions => ["postal_codes.state_id = ?", state] }}
  named_scope :by_city, lambda { |city| { :conditions => ["postal_codes.city_id = ?", city] }}
  named_scope :by_type, lambda { |type| { :conditions => ["postal_codes.postal_code_type_id = ?", type] }}

  def state?
    !self.state.blank?
  end
  
  def city?
    !self.city.blank?
  end
  
  def postal_code_type?
    !self.postal_code_type.blank?
  end
  
  def state_name
    self.state.title if self.state?
  end
  
  def city_name
    self.city.title if self.city?
  end
  
  def before_validation_on_create
    self.latitude = 0 unless self.longitude?
    self.longitude = 0 unless self.longitude?
  end
  
  def before_save
    self.postal_code_type_id = 2 unless self.postal_code_type?
  end
end
