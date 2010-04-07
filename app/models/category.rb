class Category < ActiveRecord::Base
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"

  has_many :categorizations
  has_many :events, :through => :categorizations

  def color
    #TODO: migrate this to the db for site specific, or admin changability
    #TODO: for now, let's assume sluggable name is the css class -> color:
    self.name.parameterize.to_s
  end
end
