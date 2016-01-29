# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dog_session',
  :secret      => '3d16da0a702facaeeb724436ae3cb268fa261634924363696a5d7fd04741e478d7edd28842d8ca0fbce668d7973b3ca7cfb576ff1b5d8d96247cea88da6c3e42'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
