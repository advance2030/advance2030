source :gemcutter

gem "rails",                  "2.3.5"
gem "tzinfo",                 "0.3.16"
gem "authlogic",              "2.1.3"
gem "sqlite3-ruby",           "1.2.5"
gem "newrelic_rpm",           "2.10.5"
gem "paperclip",              "2.3.1.1"
gem "activemerchant",         "1.5.1", :require => 'active_merchant'
gem "is_taggable",            "0.1.0"

group :development do
  gem "roo",                            "1.3.11"
end

group :test do
  gem "rspec",                          "1.3.0"
  gem "rspec-rails-w-factory_girl",     "1.3.2", :require => 'spec/rails'
  gem "factory_girl",                   "1.2.3"
  gem "shoulda",                        "2.10.3"
  gem "cucumber",                       "0.6.2"
  gem "cucumber-rails",                 "0.3.0"
  gem "capybara",                       "0.3.5"
  gem 'database_cleaner',               "0.5.0"
  if RUBY_VERSION > "1.9"
    gem 'test-unit',                    "1.2.3"
  end
end
