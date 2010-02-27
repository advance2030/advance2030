Factory.define :account do |f|
  f.joined_at = Time.now
  f.expired_at = Time.now + 1.year
end