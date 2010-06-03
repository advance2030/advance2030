class EventSponsorshipDetail < ActiveRecord::Base

  belongs_to :event, :dependent => :destroy
  belongs_to :organization, :dependent => :destroy

end
