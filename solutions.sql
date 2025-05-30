-- Active: 1747932506631@@localhost@5432@conservation_db

-- problem-1 = Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
SELECT * from rangers;
INSERT into rangers (ranger_id, name, region)
VALUES(4, 'Derek Fox', 'Coastal Plains');


-- problem-2 =  Count unique species ever sighted.
SELECT * from species;
SELECT * from sightings;
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;



-- problem-3 = Find all sightings where the location includes "Pass".
SELECT * from sightings;
select * from sightings where location ILIKE '%pass%';



-- problem-4 = List each ranger's name and their total number of sightings.
select rangers.name, count(*) as total_sightings
from rangers
join sightings on rangers.ranger_id = sightings.ranger_id
GROUP BY rangers.name;



-- problem-5 = List species that have never been sighted.
SELECT * from species;
select species.common_name
from species
WHERE species.species_id NOT IN (SELECT sightings.species_id FROM sightings);



-- problem-6 = Show the most recent 2 sightings.
select * from sightings;
SELECT common_name, sighting_time, name from sightings
INNER join rangers on rangers.ranger_id = sightings.ranger_id
INNER join species on species.species_id = sightings.species_id 
ORDER BY sighting_time DESC
LIMIT 2;



-- problem-7 = Update species that were discovered before 1800 to be 'Historic'.
SELECT * from species;
UPDATE species
set conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';



-- problem-8 = Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT * from sightings;

SELECT sighting_id,
CASE
  WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 5 AND 11 THEN 'Morning'
  WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 16 THEN 'Afternoon'
  ELSE 'Evening'
END AS time_of_day
FROM sightings;




-- problem-9= Delete rangers who have never sighted any species
select * from species;
select * from rangers;
DELETE from rangers
WHERE rangers.ranger_id NOT IN (SELECT sightings.ranger_id FROM sightings);