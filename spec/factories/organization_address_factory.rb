Factory.define(:organization_address) do |f|
  f.address_type_id 1
  f.organization_id 3
  f.street '111 Lean Dog'
  f.postal_code_id 3
  f.is_primary true
  f.sort_order 1
end