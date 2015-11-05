# require 'carrierwave'
require 'active_record' # require Ruby Gem

options = {
  adapter: 'postgresql',
  database: 'heyintro'
}

# establish connection to the db based on the options above
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || options)
