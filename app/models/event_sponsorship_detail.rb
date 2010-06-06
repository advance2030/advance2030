class EventSponsorshipDetail < ActiveRecord::Base
=begin
  belongs_to :event, :dependent => :destroy
  belongs_to :organization, :dependent => :destroy
=end
end
