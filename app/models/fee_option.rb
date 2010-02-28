class FeeOption < ActiveRecord::Base
  has_many :venue_fee_options, :dependent => :destroy
  has_many :venues, :through => :venue_fee_options
end
