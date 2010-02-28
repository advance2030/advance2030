class PostalCodeType < ActiveRecord::Base
  has_many :postal_codes, :dependent => :destroy
end
