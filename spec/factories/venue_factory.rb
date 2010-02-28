Factory.define(:venue) do |f|
  f.title 'Lean Dog'
  f.url_friendly 'lean-dog'
  f.venue_type_id 1
  f.capacity 20
  f.full_capacity 50
  f.has_internet true
  f.is_blacklisted false
end
