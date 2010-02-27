Factory.define(:asset) do |f|
  f.asset_file_name 'My File'
  f.asset_file_size 122
  f.asset_content_type 'image/gif'
  f.asset_updated_at Time.now
end