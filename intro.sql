CREATE DATABASE heyintro;
\c heyintro

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
  admin BOOLEAN,
  accept_terms VARCHAR(50)
);

INSERT INTO users (first_name, last_name, email, password_digest, linkedin_url, personal_url, current_industry, location_id) VALUES ('Aviel', 'Goh', 'avielgwk@gmail.com', 'avielgoh', 'https://au.linkedin.com/in/avielgoh', 'http://avielgoh.com/', "Software Development", 2);

CREATE TABLE locations
(
  id SERIAL4 PRIMARY KEY,
  city VARCHAR(500) NOT NULL,
  country VARCHAR(500) NOT NULL
);
# each User belongs_to a Location
# each Location has_many Users

INSERT INTO locations (city, country) VALUES ('Other', '');
INSERT INTO locations (city, country) VALUES ('Melbourne', 'Australia');
INSERT INTO locations (city, country) VALUES ('Sydney', 'Australia');

CREATE TABLE industries
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(500) NOT NULL
);

INSERT INTO industries (name) VALUES ('Startups');
INSERT INTO industries (name) VALUES ('Entreprenuer');
INSERT INTO industries (name) VALUES ('Software Development');
INSERT INTO industries (name) VALUES ('UX/UI');
INSERT INTO industries (name) VALUES ('Design');
INSERT INTO industries (name) VALUES ('Advertising');
INSERT INTO industries (name) VALUES ('Marketing');
INSERT INTO industries (name) VALUES ('Product Management');
INSERT INTO industries (name) VALUES ('Engineering');
INSERT INTO industries (name) VALUES ('Freelancer');
INSERT INTO industries (name) VALUES ('Corporate');
INSERT INTO industries (name) VALUES ('Legal');
INSERT INTO industries (name) VALUES ('Consulting');
INSERT INTO industries (name) VALUES ('Not-for-profit');
INSERT INTO industries (name) VALUES ('Education');
INSERT INTO industries (name) VALUES ('Other');

-- Startups
-- Entreprenuer
-- Software Development
-- UX/UI
-- Design
-- Advertising
-- Marketing
-- Product Management
-- Engineering
-- Freelancer
-- Corporate
-- Legal
-- Consulting
-- Other

CREATE TABLE interests
(
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  industry_id INTEGER
);


CREATE TABLE industries_users
(
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  industry_id INTEGER
);

CREATE TABLE introductions
(
  id SERIAL4 PRIMARY KEY,
  user_id VARCHAR(500),
  connection_id VARCHAR(500), -- id of the user connected
  response VARCHAR(500),
  connection_date DATE,
  created_at,
  updated_at
);
