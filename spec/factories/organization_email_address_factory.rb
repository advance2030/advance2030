Factory.define(:organization_email_address) do |f|
  f.email_address_type_id 1
  f.organization_id 2
  f.address 'user@me.com'
  f.is_primary true
  f.is_confirmed true
  f.sort_order 1
end