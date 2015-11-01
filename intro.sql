CREATE DATABASE heyintro;
\c heyintro

CREATE TABLE users
(
  id SERIAL4 PRIMARY KEY,
  user_id VARCHAR(200) NOT NULL,
  first_name VARCHAR(500) NOT NULL,
  last_name VARCHAR(500) NOT NULL,
  email VARCHAR(500) NOT NULL,
  password_digest VARCHAR(500) NOT NULL,
  linkedin_url VARCHAR(2500) NOT NULL,
  personal_url VARCHAR (2500),
  location VARCHAR(500) NOT NULL,
  agreement VARCHAR(200) NOT NULL,
  created_at,
  updated_at
);

CREATE TABLE industries
(
  id SERIAL4 PRIMARY KEY,
  industry_id VARCHAR(200) NOT NULL,
  name VARCHAR(500) NOT NULL
);

INSERT INTO industries (industry_id, name) VALUES (1, 'Startups');
INSERT INTO industries (industry_id, name) VALUES (2, 'Entreprenuer');
INSERT INTO industries (industry_id, name) VALUES (3, 'Software Development');
INSERT INTO industries (industry_id, name) VALUES (4, 'UX/UI');
INSERT INTO industries (industry_id, name) VALUES (5, 'Design');
INSERT INTO industries (industry_id, name) VALUES (6, 'Advertising');
INSERT INTO industries (industry_id, name) VALUES (7, 'Marketing');
INSERT INTO industries (industry_id, name) VALUES (8, 'Product Management');
INSERT INTO industries (industry_id, name) VALUES (9, 'Engineering');
INSERT INTO industries (industry_id, name) VALUES (10, 'Freelancer');
INSERT INTO industries (industry_id, name) VALUES (11, 'Corporate');
INSERT INTO industries (industry_id, name) VALUES (12, 'Legal');
INSERT INTO industries (industry_id, name) VALUES (13, 'Consulting');
INSERT INTO industries (industry_id, name) VALUES (14, 'Other');

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

CREATE TABLE user_industries
(
  id SERIAL4 PRIMARY KEY,
  user_id VARCHAR(200),
  industry_id VARCHAR(200)
);

CREATE TABLE interest_industries
(
  id SERIAL4 PRIMARY KEY,
  user_id VARCHAR(200),
  industry_id VARCHAR(200)
);

CREATE TABLE introductions
(
  id SERIAL4 PRIMARY KEY,
  user_id VARCHAR(500),
  connection_id VARCHAR(500), -- id of the user connected
  response VARCHAR(500),
  created_at,
  updated_at
);
