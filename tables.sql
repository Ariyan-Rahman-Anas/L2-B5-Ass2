-- Active: 1747932506631@@localhost@5432@conservation_db
-- table-1
create table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    region VARCHAR(255) NOT NULL
);

insert into rangers (ranger_id, name, region) values (1, 'John Doe', 'Northern Hills'),
(2, 'Jane Smith', 'River Delta'),
(3, 'Bob Johnson', 'Mountain Range');

SELECT * FROM rangers;



-- table-2
create table species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(250) not NULL,
    scientific_name VARCHAR(250) not NULL,
    discovery_date TIMESTAMP not NULL,
    conservation_status VARCHAR(250) not NULL
) 

SELECT * FROM species;

INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) 
VALUES (1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus', '1758-01-01', 'Endangered')



-- table-3
create table sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id int REFERENCES rangers(ranger_id),
    species_id int REFERENCES species(species_id),
    sighting_time TIMESTAMP not NULL,
    location VARCHAR(255) NOT NULL,
    notes TEXT
)

INSERT INTO sightings (sighting_id, ranger_id, species_id, sighting_time, location, notes) 
VALUES (1, 1, 1, '2024-05-10 07:45:00', 'Peak Ridge', 'Snow Leopard sighting'),
(2, 2, 2, '2024-05-12 16:20:00', 'Bankwood Area', 'Bengal Tiger sighting'),
(3, 3, 3, '2024-05-15 09:10:00', 'Bamboo Grove East', 'Red Panda sighting'),
(4, 2, 1, '2024-05-18 18:30:00', 'Snowfall Pass', 'Snow Leopard sighting');

SELECT * FROM sightings;