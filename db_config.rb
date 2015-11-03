require 'active_record' # require Ruby Gem

options = {
  adapter: 'postgresql',
  database: 'heyintro'
}

# establish connection to the db based on the options above
ActiveRecord::Base.establish_connection(options)


Essentially what I need is:
1. Each user can select one industry that they are currently in
2. Each user can select multiple industries that they are interested in meeting people from
3. The Admin can filter by users that are currently in a specified industry, and also filter by users that are interested in a specified industry

CREATE TABLE users
(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(500) NOT NULL,
  last_name VARCHAR(500) NOT NULL,
  email VARCHAR(500) NOT NULL,
  password_digest VARCHAR(500) NOT NULL,
  linkedin_url VARCHAR(2500) NOT NULL,
  personal_url VARCHAR(2500),
  current_industry VARCHAR(500),
  location_id INTEGER,
  accept_terms VARCHAR(50)
);

CREATE TABLE industries
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(500) NOT NULL
);

CREATE TABLE user_current_industry
(
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  industry_id INTEGER
);

CREATE TABLE user_interest_industry
(
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  industry_id INTEGER
);

What I'm currently thinking, but not quite understanding is:

class User < ActiveRecord::Base
  has_secure_password
  has_one :industry, through: :user_current_industry
  has_many :industries, through: :user_interest_industry
end

class Industry < ActiveRecord::Base
  has_one :user, through: :user_current_industry
  has_many :users, through: :user_interest_industry
end

class UserInterestIndustry < ActiveRecord::Base
  belongs_to :user
  belongs_to :industry
end

class UserCurrentIndustry < ActiveRecord::Base
  belongs_to :user
  belongs_to :industry
end
