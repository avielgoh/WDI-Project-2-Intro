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
  industry_id INTEGER,
  location_id INTEGER,
  admin BOOLEAN,
  accept_terms VARCHAR(50)
);

INSERT INTO users (first_name, last_name, email, password_digest, linkedin_url, personal_url, industry_id, location_id) VALUES ('Aviel', 'Goh', 'avielgwk@gmail.com', 'avielgoh', 'https://au.linkedin.com/in/avielgoh', 'http://avielgoh.com/', 2, 2);

INSERT INTO users (first_name, last_name, email, password_digest, linkedin_url, personal_url, industry_id, location_id) VALUES ('John', 'Smith', 'avielgwk@gmail.com', 'avielgoh', 'https://au.linkedin.com/in/avielgoh', 'http://avielgoh.com/', 2, 2);

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


CREATE TABLE industry_users
(
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  industry_id INTEGER
);

CREATE TABLE introductions
(
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  connection_id INTEGER,
  connection_date DATE NOT NULL DEFAULT CURRENT_DATE,
  rating BOOLEAN
);

INSERT INTO introductions (user_id, connection_id, response) VALUES (1, 2, true);

INSERT INTO introductions (user_id, connection_id) VALUES (1, 3);
