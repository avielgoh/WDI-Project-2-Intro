require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'heyintro'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || options) # establish connection Heroku
