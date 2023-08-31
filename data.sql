/* Populate database with sample data. */

-- Populate animals table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES
('Agumon', '2020-02-03', 0, TRUE, 10.23),
('Gabumon', '2018-11-15', 2, TRUE, 8.00),
('Pikachu', '2021-01-07', 1, FALSE, 15.04),
('Devimon', '2017-12-05', 5, TRUE, 11),
('Charmander', '2020-02-08', 0, FALSE, -11),
('Plantmon', '2021-11-15', 2, TRUE, -5.7),
('Squirtle', '1993-04-02', 3, FALSE, -12.13),
('Angemon', '2005-06-12', 1, TRUE, -45),
('Boramon', '2005-06-07', 7, TRUE, 20.4),
('Blossom', '1998-10-13', 3, TRUE, 17),
('Ditto', '2022-05-14', 4, TRUE, 22);

-- Populate species table
INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');

-- Updade species column in animals table
UPDATE animals
SET species_id = CASE
	WHEN animals.name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
    END;

-- Populate owners table
INSERT INTO owners (full_name, age) VALUES
('Sam Smith', 34),
('Jeniffer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Update animals table
UPDATE animals
SET owners_id = CASE
	WHEN animals.name = 'Agumon'
		THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN animals.name IN ('Gabumon', 'Pikachu')
		THEN (SELECT id FROM owners WHERE full_name = 'Jeniffer Orwell')
	WHEN animals.name IN ('Devimon', 'Plantmon')
		THEN (SELECT id FROM owners WHERE full_name = 'Bob')
	WHEN animals.name IN ('Charmander', 'Squirtle', 'Blossom')
		THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
	WHEN animals.name IN ('Angemon', 'Boarmon')
		THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
    END;

-- Populate vets table
INSERT INTO vets (name, age, date_of_graduation) VALUES
('Vet William Tatcher', 45, '2000-04-23'),
('Vet Maisy Smith', 26, '2019-01-17'),
('Vet Stephanie Mendez', 64, '1981-05-04'),
('Vet Jack Harkness', 38, '2008-06-08');