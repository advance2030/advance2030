class OrganizationsRole < ActiveRecord::Base
  belongs_to :organization
  belongs_to :organization_role
end
