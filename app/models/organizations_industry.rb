class OrganizationsIndustry < ActiveRecord::Base
  belongs_to :organization
  belongs_to :industry
end
