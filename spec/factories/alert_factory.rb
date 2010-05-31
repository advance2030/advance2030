Factory.define :alert do |f|
  f.name 'Alert'
  f.alerttext 'This is my alert text'
  f.start_date_time Time.now
  f.end_date_time Time.now + 1.month
end

