require 'active_record'
require 'pry'

# this will show the SQL in the terminal
ActiveRecord::Base.logger = Logger.new(STDERR)

require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/industry'
require_relative 'models/interest'
require_relative 'models/location'
require_relative 'models/connection'

binding.pry

LinkedIn.configure do |config|
  config.client_id     = ENV["75jsg810muljov"]
  config.client_secret = ENV["f7x2sH9g0aSlG08x"]
  config.redirect_uri  = "http://localhost:4567/linkedin"
end

LinkedIn::OAuth2.new('75jsg810muljov','f7x2sH9g0aSlG08x')

https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id=75jsg810muljov&redirect_uri=http://localhost:4567/linkedin&state=987654321&scope=r_basicprofile

https://www.linkedin.com/uas/oauth2/grant_type=authorization_code&code=AQSMoyxL1Plav8h9cFEvSkhMv9DSxJa1JXHaAfNefwdVWZGpk-JnxfdxfnYjpQAWsGuwrjb_d3-wJAfNskTJ54mdWJDsmxG7h382T6HHn2g4_DL3jbg&redirect_uri=http://localhost:4567/linkedin&client_id=75jsg810muljov&client_secret=f7x2sH9g0aSlG08x
