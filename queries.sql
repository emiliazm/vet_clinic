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