class Industry < ActiveRecord::Base
  has_many :organizations_industries
  has_many :organizations, :through => :organizations_industries
  
  named_scope :list
end
