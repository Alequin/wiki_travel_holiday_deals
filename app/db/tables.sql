DROP TABLE IF EXISTS deals;
DROP TABLE IF EXISTS holidays;
DROP TABLE IF EXISTS travel_agents;
DROP TABLE IF EXISTS hotels;

-- database name: holiday_tracker

CREATE TABLE travel_agents(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  logo_path VARCHAR(255)
);

CREATE TABLE hotels(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  stars INT2,
  image_path VARCHAR(255)
);

CREATE TABLE holidays(
  id SERIAL4 PRIMARY KEY,
  travel_agent_id INT4 REFERENCES travel_agents(id),
  hotel_id INT4 REFERENCES hotels(id),
  cost_per_person FLOAT,
  nights INT2
);

CREATE TABLE deals(
  id SERIAL4 PRIMARY KEY,
  holiday_id INT4 REFERENCES holidays(id),
  percentage_off FLOAT,
  deal_start_date CHAR(8),
  deal_end_date CHAR(8)
);
