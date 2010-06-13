# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
events = Event.create([
  {:name => "National City Night on the Town", 
   :start_datetime => "2010-06-18 08:30:00",
   :end_datetime => "2010-06-18 10:30:00",
   :sponsor => true
   },
   {:name => "Great Lakes Brewery...",
     :start_datetime => "2010-06-20 09:00:00",
     :end_datetime => "2010-06-20 10:00:00",
     :sponsor => true},
   {:name => "Hackibou",
     :start_datetime => "2010-07-03 07:30:00",
     :end_datetime => "2010-07-03 11:00:00",
     :sponsor => true},
    {:name => "Clerb",
     :start_datetime => "2010-06-17 10:00:00",
     :end_datetime => "2010-06-17 11:00:00",
     :sponsor => false}])