CREATE DATABASE heyintro;
\c heyintro

CREATE TABLE users
(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(500),
  last_name VARCHAR(500),
  email VARCHAR(500) NOT NULL,
  password_digest VARCHAR(500),
  linkedin_url VARCHAR(2500),
  personal_url VARCHAR(2500),
  industry_id INTEGER,
  location_id INTEGER,
  date_joined DATE NOT NULL DEFAULT CURRENT_DATE
  administrator BOOLEAN,
);

CREATE TABLE locations
(
  id SERIAL4 PRIMARY KEY,
  city VARCHAR(500) NOT NULL,
  country VARCHAR(500) NOT NULL
);

INSERT INTO locations (city, country) VALUES ('Melbourne', 'Australia');
INSERT INTO locations (city, country) VALUES ('Sydney', 'Australia');
INSERT INTO locations (city, country) VALUES ('Brisbane', 'Australia');
INSERT INTO locations (city, country) VALUES ('Perth', 'Australia');
INSERT INTO locations (city, country) VALUES ('Adelaide', 'Australia');

CREATE TABLE industries
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(500) NOT NULL
);

INSERT INTO industries (name) VALUES ('Accounting');
INSERT INTO industries (name) VALUES ('Advertising');
INSERT INTO industries (name) VALUES ('Consulting');
INSERT INTO industries (name) VALUES ('Design');
INSERT INTO industries (name) VALUES ('Education');
INSERT INTO industries (name) VALUES ('Engineering');
INSERT INTO industries (name) VALUES ('Entreprenuer');
INSERT INTO industries (name) VALUES ('Finance');
INSERT INTO industries (name) VALUES ('Freelancer');
INSERT INTO industries (name) VALUES ('HR / Recruitment');
INSERT INTO industries (name) VALUES ('Legal');
INSERT INTO industries (name) VALUES ('Marketing');
INSERT INTO industries (name) VALUES ('Not-for-profit');
INSERT INTO industries (name) VALUES ('Project Management');
INSERT INTO industries (name) VALUES ('Software Development');
INSERT INTO industries (name) VALUES ('Startups');
INSERT INTO industries (name) VALUES ('UX/UI');

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
