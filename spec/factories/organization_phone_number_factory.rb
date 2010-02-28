Factory.define(:organization_phone_number) do |f|
  f.organization_id 1
  f.phone_number_type_id 3
  f.number '330-987-4433'
  f.is_primary true
  f.sort_order 1
end