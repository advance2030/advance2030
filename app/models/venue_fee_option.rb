class VenueFeeOption < ActiveRecord::Base
  belongs_to :venue
  belongs_to :fee_option
end
