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
ROLLBACK;
SELECT * FROM animals;

-- Transaction 2
BEGIN;
UPDATE ANIMALS SET species='digimon' WHERE name like '%mon';
UPDATE ANIMALS SET species='pokemon' WHERE species is null;
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
SELECT * FROM animals;