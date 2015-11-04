require 'active_record'
require 'pry'

# this will show the SQL in the terminal
ActiveRecord::Base.logger = Logger.new(STDERR)

require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/industry'
require_relative 'models/industry_user'
require_relative 'models/location'
require_relative 'models/introduction'

binding.pry
