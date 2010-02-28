Factory.define :event do |f|
  f.name "value for name"
  f.summary "value for summary"
  f.description "value for description"
  f.start_date_time 
  f.end_date_time 
  f.registration_start_date_time 
  f.registration_end_date_time 
  f.attendee_target_count 1
  f.attendee_limit 1
  f.notes "value for notes"
  f.venue_notes "value for venue_notes"
end