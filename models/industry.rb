class Industry < ActiveRecord::Base
  has_many :users
  has_many :industry_users
  has_many :interested_users, through: :industry_users, source: :user
end
