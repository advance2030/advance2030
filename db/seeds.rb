# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
events = Event.create([
  {:name => "National City Night on the Town", 
   :start_datetime => Time.now.advance(:days => 5),
   :end_datetime => Time.now.advance(:days =>5, :minutes => 30),
   :sponsor => true
   },
   {:name => "Great Lakes Brewery...",
     :start_datetime => Time.now.advance(:days => 8),
     :end_datetime => Time.now.advance(:days => 8, :minutes => 30),
     :sponsor => true},
   {:name => "Hackibou",
     :start_datetime => Time.now.advance(:days => 20),
     :end_datetime => Time.now.advance(:days => 20, :minutes => 30),
     :sponsor => true},
    {:name => "Clerb",
     :start_datetime => Time.now.advance(:days => 6),
     :end_datetime => Time.now.advance(:days => 6, :minutes => 30),
     :sponsor => false}])