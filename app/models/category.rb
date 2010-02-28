class Category < ActiveRecord::Base
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
end
