namespace :ac do
  namespace :db do
    task :load_postal_codes => :environment do
      local_settings = YAML::load_file("config/database.yml")[RAILS_ENV]
      postal_codes = File.join(Rails.root, 'db', 'sql', 'postal_codes.sql')
      system "mysql -u#{local_settings["username"]} #{"-p#{local_settings["password"]}" if local_settings["password"]} #{local_settings["database"]} < #{postal_codes}"
    end
    
    task :load_industries => :environment do
      industries = ["Accounting", "Advertising/Marketing", "Aerospace", "Architecture", "Banking", "Biotechnology", "Construction/Development", "Distribution", "Education", "Engineering", "Entertainment", "Financial Services", "Government", "Healthcare", "Hospitality", "Human Resources", "Insurance", "Legal", "Manufacturing", "Media", "Nonprofit", "Public Relations", "Real Estate", "Restaurant/Food and Beverage", "Retail", "Sales", "Software", "Technology/IT", "Telecommunications", "Transportation", "Utilities", "Other"]
      industries.each { |i| Industry.create(:title => i ) }
    end
  end
end
