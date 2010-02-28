class OrganizationRole < ActiveRecord::Base
  has_many :organizations_roles, :dependent => :destroy
  has_many :organizations, :through => :organizations_roles
  
  named_scope :list
end
