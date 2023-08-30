/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255),
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOL,
	weight_kg FLOAT,
	species VARCHAR(255)
);

CREATE TABLE owners(
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(255),
	age int
);

CREATE TABLE species(
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255)
);

