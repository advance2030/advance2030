class EventSponsorshipDetail < ActiveRecord::Base

  belongs_to :event, :dependant => :destroy
  belongs_to :organization, :dependant => :destroy

end
