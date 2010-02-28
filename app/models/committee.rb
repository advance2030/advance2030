class Committee < ActiveRecord::Base
  has_many :users, :through => :committee_member
  has_many :assets, :through => :committee_asset
  has_many :events, :through => :committee_event
  has_many :committee_posts
end
