class User < ActiveRecord::Base
  has_secure_password
  belongs_to :location
  belongs_to :industry
  has_many :introductions, dependent: :destroy
  has_many :industry_users, dependent: :destroy
  has_many :interested_industries, through: :industry_users, source: :industry, dependent: :destroy
end
