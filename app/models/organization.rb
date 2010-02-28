class Organization < ActiveRecord::Base
  belongs_to :service_region
  belongs_to :organization_type
  
  has_many :organizations_roles, :dependent => :destroy
  has_many :roles, :through => :organizations_roles, :source => :organization_role
  
  has_many :organizations_industries, :dependent => :destroy
  has_many :industries, :through => :organizations_industries
  
  has_many :links, :class_name => 'OrganizationLink'
  has_many :phone_numbers, :class_name => 'OrganizationPhoneNumber'
  has_many :social_medias, :class_name => 'OrganizationSocialMedia'
  has_many :addresses, :class_name => 'OrganizationAddress'
  has_many :email_addresses, :class_name => 'OrganizationEmailAddress'
  
  #has_one :headquarters_address, :class_name => 'OrganizationAddress', :conditions => ["organization_addresses.address_type_id = ?", AddressType.headquarters]
  #has_one :local_address, :class_name => 'OrganizationAddress', :conditions => ["organization_addresses.address_type_id = ?", AddressType.work]
  
  named_scope :list
  
  has_attached_file :logo,
                    :styles => { :medium => "80x80>", :thumb => "50x50" }
  
  validates_attachment_size :logo, :less_than => 5.megabytes
  validates_attachment_content_type :logo, :content_type => []
                    
  def validate
    errors.add(:name, 'Please provide a name') unless self.name?
  end
  
  def main_url=(val)
  end
  
  def main_url
  end
  
  def email_address=(val)
  end
  
  def email_address
  end
  
  def create_local_address=(attrs)
    if self.new_record?
      self.local_address.build(attrs.merge(:address_type_id => AddressType.work.id))
    else
      self.local_address.update_attributes(attrs)
    end
  end
  
  def local_address?
    !self.local_address.blank?
  end
  
  def create_headquarters_address=(attrs)
    if self.new_record?
      self.headquarters_address.build(attrs.merge(:address_type_id => AddressType.headquarters.id))
    else
      self.headquarters_address.update_attributes(attrs)
    end
  end
  
  def headquarters_address?
    !self.headquarters_address.blank?
  end
  
  def local_address=(attrs)
  end
  
  def local_address
  end
  
  def twitter_url=(val)
  end
  
  def twitter_url
  end
  
  def facebook_url=(val)
  end
  
  def facebook_url
  end
  
  def phone_number=(val)
  end
  
  def phone_number
  end
  
  def fax_number=(val)
  end
  
  def fax_number
  end
  
  def roles?
    self.roles.any?
  end
  
  def industries?
    self.industries.any?
  end
  
  def destroy_logo!
    self.update_attributes(:logo => nil)
  end
end
