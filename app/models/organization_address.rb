class OrganizationAddress < ActiveRecord::Base
  belongs_to :address_type
  belongs_to :organization
  belongs_to :postal_code
  
  named_scope :by_address_type, lambda { |type| { :conditions => ["organization_addresses.address_type_id = ?", type] }}
  named_scope :by_organization, lambda { |org| { :conditions => ["organization_addresses.organization_id = ?", org] }}
  named_scope :by_postal_code, lambda { |pc| { :conditions => ["organization_addresses.postal_code_id = ?", pc] }}
  named_scope :primary, :conditions => { :is_primary => true }
  named_scope :ordered, lambda { |order| { :order => order }}
  
  named_scope :headquarters, :conditions => { :address_type_id => AddressType.headquarters.id }
  named_scope :local, :conditions => { :address_type_id => AddressType.work.id }
  
  def create_postal_code=(attrs)
    city = City.find_or_create_by_title(attrs.delete(:city_name))
    attrs.merge!(:city_id => city.id)
    
    if self.new_record?
      self.build_postal_code(attrs)
    else
      self.create_postal_code(attrs)
    end
  end
  
  def postal_code_code
    self.postal_code.code
  end
  
  def hq_address_type_id
    @hq_address_type_id ||= AddressType.headquarters.id
  end
  
  def hq_address_type_id=(val)
    self.address_type_id = val
  end

  def to_s
    ("%s %s %s %s" % [self.street, self.postal_code.city_name, self.postal_code.state_name, self.postal_code_code]).strip.squeeze
  end
end
