# maps class to the users table
class User < ActiveRecord::Base
  has_secure_password # gives us the password method, authenticate method
  belongs_to :location
  has_and_belongs_to_many :industries
end
