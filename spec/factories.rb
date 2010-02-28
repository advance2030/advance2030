factories_dir = File.join(File.dirname(__FILE__), 'factories', '*')

Dir[factories_dir].each do |f|
  require f
end
