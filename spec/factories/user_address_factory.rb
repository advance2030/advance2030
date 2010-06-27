Factory.define(:user_address) do |f|
  f.user_id 1
  f.sequence(:address) { |n| "#{n} Cleveland Avenue" }
  f.city 'Cleveland'
  f.state_code 'OH'
  f.zip '46751'
  f.address_type_id 1
  f.is_primary true
  f.sort_order 1
end

