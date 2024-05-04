CREATE DATABASE IF NOT EXISTS renting_bcn;
USE renting_bcn;

CREATE TABLE IF NOT EXISTS district (
district VARCHAR(20),
district_id INT,
PRIMARY KEY (district_id)
);

CREATE TABLE IF NOT EXISTS neighbourhood (
district_id INT,
neighbourhood VARCHAR(20),
neighbourhood_id INT,
PRIMARY KEY (neighbourhood_id)
);

CREATE TABLE IF NOT EXISTS rent (
neighbourhood_id INT,
district_id INT,
price_avg FLOAT,
rent_id INT,
PRIMARY KEY (rent_id)
);

CREATE TABLE IF NOT EXISTS population (
neighbourhood_id INT,
population_id INT,
population FLOAT,
spaniards FLOAT,
strangers FLOAT, 
PRIMARY KEY (population_id)
);

CREATE TABLE IF NOT EXISTS airbnb (
airbnb_id INT,
type VARCHAR(50),	
name VARCHAR(50),	
nhab VARCHAR(50),	
services VARCHAR(50),	
rating FLOAT,	
price_night	INT,
district_id	INT,
PRIMARY KEY (airbnb_id)
);

ALTER TABLE neighbourhood
ADD FOREIGN KEY (district_id) REFERENCES district(district_id);

ALTER TABLE rent
ADD FOREIGN KEY (district_id) REFERENCES district(district_id),
ADD FOREIGN KEY (neighbourhood_id) REFERENCES neighbourhood(neighbourhood_id);

ALTER TABLE population
ADD FOREIGN KEY (neighbourhood_id) REFERENCES neighbourhood(neighbourhood_id);

ALTER TABLE airbnb
ADD FOREIGN KEY (district_id) REFERENCES district(district_id);



