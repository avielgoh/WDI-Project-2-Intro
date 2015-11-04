class User < ActiveRecord::Base
  has_secure_password # gives us the password method, authenticate method
  belongs_to :location
  belongs_to :industry
  has_many :introductions
  has_many :industry_users
  has_many :interested_industries, through: :industry_users, source: :industry

  # mount_uploader :name, ImageUploader
end

# User.find(id).industry => returns industry of user
