# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
Category.create([
  { :name => "Education", :description => "Education" },
  { :name => "Social", :description => "Social" },
  { :name => "Networking", :description => "Networking" },
  { :name => "Philanthropy", :description => "Philanthropy" },
  { :name => "Technology", :description => "Technology" },
  { :name => "Membership", :description => "Membership" },
  { :name => "Communications", :description => "Communications" }
])
