class Category < ActiveRecord::Base
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"

  has_many :categorizations
  has_many :events, :through => :categorizations
end
