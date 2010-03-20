# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mimunicipio_session',
  :secret      => '96a49e6cca08a80c240ddd593f1079c9569fbe6eff178f1629e9aac31b55a6e697b3bb007a2fd241b70b2f949d378d05cd58c79757d606c7815c69f85363edcd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
