# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_my-advance2030_session',
  :secret      => '49f7d6b1987b699eca681978914979a6e903a58b819125fbe31dbebd2735e7e05ea1cab4910effc9cd98c778b02e0f7555a7b2f028de1cc1271b69c892e14d4a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
