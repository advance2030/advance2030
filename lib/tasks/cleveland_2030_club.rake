namespace :ac do
  namespace :db do
    task :load_postal_codes => :environment do
      local_settings = YAML::load_file("config/database.yml")[RAILS_ENV]
      postal_codes = File.join(Rails.root, 'db', 'sql', 'postal_codes.sql')
      system "mysql -u#{local_settings["username"]} #{"-p#{local_settings["password"]}" if local_settings["password"]} #{local_settings["database"]} < #{postal_codes}"
    end

    task :load_categories => :environment do
      categories = ["Education", "Social", "Networking", "Philanthropy", "Technology", "Membership", "Communications"]
      categories.each { |c| Category.create( :name => c, :description => c ) }
    end

    task :load_industries => :environment do
      industries = ["Accounting", "Advertising/Marketing", "Aerospace", "Architecture", "Banking", "Biotechnology", "Construction/Development", "Distribution", "Education", "Engineering", "Entertainment", "Financial Services", "Government", "Healthcare", "Hospitality", "Human Resources", "Insurance", "Legal", "Manufacturing", "Media", "Nonprofit", "Public Relations", "Real Estate", "Restaurant/Food and Beverage", "Retail", "Sales", "Software", "Technology/IT", "Telecommunications", "Transportation", "Utilities", "Other"]
      industries.each { |i| Industry.create(:title => i) }
    end

    task :load_service_regions => :environment do
      regions = ["Cleveland", "Northeast Ohio", "Ohio", "Great Lakes", "National", "Global"]
      regions.each { |r| ServiceRegion.create(:title => r) }
    end

    task :load_organization_types => :environment do
      types = ["Corporation", "Nonprofit", "Media", "Government", "Political", "Other"]
      types.each { |t| OrganizationType.create(:title => t) }
    end
    
    task :load_organization_roles => :environment do
      roles = ["Employer", "Venue", "Corporate Member", "Sponsor", "Donor", "Civic Partner", "YP Group"]
      roles.each { |r| OrganizationRole.create(:role => r) }
    end
    
    task :load_venue_types => :environment do
      types = ["Bar", "Restaurant", "Bar/Restaurant", "Hall", "Theater", "Private Club", "Museum", "Outdoor", "Other"]
      types.each { |t| VenueType.create(:title => t) }
    end
    
    task :load_address_types => :environment do
      types = ["Home", "Work", "Headquarters", "Other"]
      types.each { |t| AddressType.create(:title => t) }
    end
    
    task :load_link_types => :environment do
      types = ["Home", "Work", "Headquarters", "Other"]
      types.each { |t| Linktype.create(:title => t) }
    end
    
    task :load_social_media_types => :environment do
      types = ["Twitter", "LinkedIn", "Facebook"]
      types.each { |t| SocialMediaType.create(:title => t) }
    end
    
    task :load_email_address_types => :environment do
      types = ["Home", "Work", "Headquarters", "Other"]
      types.each { |t| EmailAddressType.create(:title => t) }
    end
    
    task :load_phone_number_types => :environment do
      types = ["Home", "Work", "Mobile", "Headquarters", "Other"]
      types.each { |t| PhoneNumberType.create(:title => t) }
    end
    
    task :load_av_equipment_options => :environment do
      avs = ["LCDs", "Projector", "Audio", "Other"]
      avs.each { |a| AvEquipmentOption.create(:title => a) }
    end
    
    task :load_parking_options => :environment do
      options = ["Free Onsite", "Paid Onsite", "Street", "Offsite"]
      options.each { |o| ParkingOption.create(:title => o) }
    end
    
    task :load_fee_options => :environment do
      options = ["Food", "Space", "Equipment"]
      options.each { |o| FeeOption.create(:title => o) }
    end
    
    task :load_food_service_options => :environment do
      options = ["Food and Alcohol", "Alcohol Only", "Food Only", "Catering", "None"]
      options.each { |o| FoodServiceOption.create(:title => o) }
    end
  end
end
