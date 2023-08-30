/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE and escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 and 17.3;

-- Transaction 1
BEGIN;
UPDATE ANIMALS SET species='unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Transaction 2
BEGIN;
UPDATE ANIMALS SET species='digimon' WHERE name like '%mon';
UPDATE ANIMALS SET species='pokemon' WHERE species is null;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

-- Transaction3
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Transaction 4
BEGIN;
DELETE FROM animals where date_of_birth>'2022-01-01';
SAVEPOINT point1;
UPDATE animals SET weight_kg=weight_kg*-1;
ROLLBACK TO point1;
UPDATE animals SET weight_kg=weight_kg*-1 WHERE weight_kg<0;
COMMIT;
SELECT * FROM animals ORDER BY id;

/*More Queries.*/
SELECT COUNT(name) AS total_animals FROM animals;

SELECT COUNT(escape_attempts) AS animals_tried_escaping
  FROM animals WHERE escape_attempts<0;

SELECT AVG(weight_kg) AS average_weight FROM animals;

SELECT neutered, SUM(escape_attempts) AS escape_Attempts
  FROM animals GROUP BY neutered ORDER BY escape_attempts DESC;

SELECT species, MAX(weight_kg) AS maximum_weight_kg,
  MIN(weight_kg) AS minimum_weight_kg FROM animals GROUP BY species;

SELECT species, ROUND(AVG(escape_attempts), 2) AS escape_attempts
  FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000
  GROUP BY species;
