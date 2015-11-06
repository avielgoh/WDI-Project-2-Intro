class Industry < ActiveRecord::Base
  has_many :users
  has_many :industry_users, dependent: :destroy
  has_many :interested_users, through: :industry_users, source: :user, dependent: :destroy
end
