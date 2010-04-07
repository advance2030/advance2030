Factory.define :event do |f|
  f.name "value for name"
  f.url_friendly 'value-for-name'
  f.summary "value for summary"
  f.description "value for description"
  f.start_datetime '4/1/2010'
  f.end_datetime '4/1/2010'
  f.registration_start_datetime
  f.registration_end_datetime
  f.attendee_target_count 1
  f.attendee_limit 1
end
