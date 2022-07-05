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