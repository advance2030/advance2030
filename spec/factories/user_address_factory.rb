Factory.define(:user_address) do |f|
  f.user_id 1
  f.street '111 Cleveland Avenue'
  f.postal_code_id 1
  f.address_type_id 3
  f.is_primary true
  f.sort_order 1
end