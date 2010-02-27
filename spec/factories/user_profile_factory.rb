Factory.define :user_profile do |f|
  f.user_id 1
  f.birthdate Time.now.to_date
  f.bio 'Here is my bio'
end

