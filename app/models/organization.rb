class Organization < ActiveRecord::Base
  belongs_to :service_region
  belongs_to :organization_type
  
  has_many :organizations_roles, :dependent => :destroy
  has_many :roles, :through => :organizations_roles, :source => :organization_role
  
  named_scope :list
  
  has_attached_file :logo,
                    :styles => { :medium => "80x80>", :thumb => "50x50" }
                    
  def validate
    errors.add(:name, 'Please provide a name') unless self.name?
  end
  
  def roles?
    self.roles.any?
  end
  
  def destroy_logo!
    self.update_attributes(:logo => nil)
  end
end
