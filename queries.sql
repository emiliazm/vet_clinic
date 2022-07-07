/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name like '%mon';

SELECT name from animals WHERE date_of_birth between '2016-01-01' and '2019-12-31';

SELECT name from animals WHERE neutered = true and escape_attempts < 3;

SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

SELECT * from animals WHERE neutered = true;

SELECT * from animals WHERE name <> 'Gabumon';

SELECT * from animals WHERE weight_kg between 10.4 and 17.3;

BEGIN;
UPDATE animals
SET species = 'unspecified'
ROLLBACK;
SELECT * from animals;


BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name like '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species is null;
COMMIT;
SELECT * from animals;

BEGIN;
DELETE from animals;
ROLLBACK;
SELECT * from animals;

BEGIN;
DELETE from animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT delDate;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO delDate;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
SELECT * from animals;

SELECT COUNT(*)
FROM animals;

SELECT 
COUNT(escape_attempts)
FROM animals
WHERE escape_attempts < 1;

SELECT AVG(weight_kg)
FROM animals;

SELECT name, escape_attempts
FROM animals
WHERE escape_attempts = (SELECT MAX(escape_attempts) from animals);

SELECT species, MAX(weight_kg), MIN(weight_kg)
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts)
FROM animals
WHERE date_of_birth between '1990-01-01' and '2000-12-31'
GROUP BY species;

-- What animals belong to Melody Pond?
SELECT owners.full_name, animals.*
FROM animals 
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT species.name, animals.*
FROM animals
INNER JOIN species ON species.id = animals.species_id
WHERE species.name = 'Pokemon'

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name AS owner, animals.*
FROM owners
LEFT OUTER JOIN animals ON owners.id = animals.owner_id

-- How many animals are there per species?
SELECT species.name, COUNT(animals.*)
FROM animals
INNER JOIN species ON species.id = animals.species_id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name, species.name, animals.*
FROM animals
INNER JOIN species ON species.id = animals.species_id
INNER JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Jennifer Orwell'
AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT owners.full_name, animals.*
FROM animals
INNER JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester'
AND escape_attempts = 0

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.*)
FROM animals
INNER JOIN owners ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY COUNT(animals.id) DESC
LIMIT 1

-- Write queries to answer the following
-- Who was the last animal seen by William Tatcher?
SELECT vets.name, animals.name, visits.date_of_visit
FROM visits
INNER JOIN animals ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT vets.name, COUNT(visits.animal_id)
FROM visits
INNER JOIN animals ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name AS speciality
FROM vets
LEFT OUTER JOIN specializations ON specializations.vet_id = vets.id
LEFT JOIN species ON species.id = specializations.spec_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, vets.name, visits.date_of_visit
FROM visits
INNER JOIN animals ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'
AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(visits.date_of_visit) AS visits
FROM visits
INNER JOIN animals ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
GROUP BY animals.id
ORDER BY COUNT(visits.date_of_visit) DESC
LIMIT 1

-- Who was Maisy Smith's first visit?
SELECT vets.name, animals.name, visits.date_of_visit
FROM visits
INNER JOIN animals ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit ASC
LIMIT 1

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT visits.date_of_visit, animals.*, vets.*
FROM visits
FULL OUTER JOIN animals ON animals.id = visits.animal_id
FULL OUTER JOIN vets ON vets.id = visits.vet_id
ORDER BY visits.date_of_visit ASC

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) AS visits_of_vets_not_specialize
FROM visits
INNER JOIN vets ON vets.id = visits.vet_id
INNER JOIN animals ON animals.id = visits.animal_id
WHERE animals.species_id NOT IN (
	SELECT coalesce(specializations.spec_id, -1)
	FROM vets
	LEFT OUTER JOIN specializations ON specializations.vet_id = vets.id
	WHERE vets.id = visits.vet_id
)

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT vets.name, species.name, COUNT(animals.species_id)
FROM visits
INNER JOIN vets ON vets.id = visits.vet_id
INNER JOIN animals ON animals.id = visits.animal_id
INNER JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY vets.name, species.name
ORDER BY COUNT(animals.species_id) DESC
LIMIT 1