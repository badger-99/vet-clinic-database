/* Database schema to keep the structure of entire database. */

-- Animals table
CREATE TABLE animals (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255),
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOL,
	weight_kg FLOAT,
	species VARCHAR(255)
);

--  Owners table
CREATE TABLE owners(
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(255),
	age int
);

-- Species table
CREATE TABLE species(
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255)
);

-- Altering 'animals' table
ALTER TABLE animals
DROP COLUMN species,
ADD COLUMN species_id INT,
	ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id),
ADD COLUMN owners_id INT,
	ADD CONSTRAINT fk_owners FOREIGN KEY (owners_id) REFERENCES owners(id);

-- Vets table
CREATE TABLE vets(
	id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255),
	age INT,
	date_of_graduation DATE
);

-- Vets-Species join table
CREATE TABLE specializations(
	species_id INT,
	vets_id INT,
	CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id),
	CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets(id),
	PRIMARY KEY (species_id, vets_id)
);

-- Animals-vets join table
CREATE TABLE visits(
	animals_id INT,
	vets_id INT,
	date_of_visit DATE,
	CONSTRAINT fk_animals FOREIGN KEY (animals_id) REFERENCES animals(id),
	CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets(id),
	CONSTRAINT visits_pk PRIMARY KEY
	(animals_id, vets_id, date_of_visit)
);

-- Added Email column to Owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Added index to visits table
CREATE INDEX idx_animal_id ON visits (animals_id ASC);
-- Added index to vets table
CREATE INDEX vets_idx ON visits(vets_id ASC);