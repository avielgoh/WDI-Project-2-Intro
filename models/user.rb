class User < ActiveRecord::Base
  has_secure_password
  belongs_to :location
  belongs_to :industry
  has_many :introductions
  has_many :industry_users
  has_many :interested_industries, through: :industry_users, source: :industry
end
