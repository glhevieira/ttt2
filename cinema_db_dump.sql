
-- SQL dump for database `cinema`
-- Generated for the user's Mission_6 (Mission_10.docx) requirements.
-- Tables: pays, realisateur, acteur, film, casting
-- Note: genre2 and nb_jour_tournage are OPTIONAL (NULL allowed)

DROP DATABASE IF EXISTS `cinema`;
CREATE DATABASE `cinema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cinema`;

-- TABLE: pays
CREATE TABLE `pays` (
  `id_pays` INT AUTO_INCREMENT PRIMARY KEY,
  `nom` VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- TABLE: realisateur
CREATE TABLE `realisateur` (
  `id_realisateur` INT AUTO_INCREMENT PRIMARY KEY,
  `nom` VARCHAR(100) NOT NULL,
  `prenom` VARCHAR(100) NOT NULL,
  `date_naissance` DATE NOT NULL,
  `nb_films_ecrit_produit` INT DEFAULT 0
) ENGINE=InnoDB;

-- TABLE: acteur
CREATE TABLE `acteur` (
  `id_acteur` INT AUTO_INCREMENT PRIMARY KEY,
  `nom` VARCHAR(100) NOT NULL,
  `prenom` VARCHAR(100) NOT NULL,
  `date_naissance` DATE NOT NULL,
  `nb_films` INT DEFAULT 0
) ENGINE=InnoDB;

-- TABLE: film
CREATE TABLE `film` (
  `id_film` INT AUTO_INCREMENT PRIMARY KEY,
  `titre` VARCHAR(255) NOT NULL,
  `genre1` VARCHAR(50) NOT NULL,
  `genre2` VARCHAR(50) DEFAULT NULL, -- optionnel
  `date_sortie` DATE NOT NULL,
  `pays_id` INT NOT NULL,
  `distributeur` VARCHAR(150) NOT NULL,
  `realisateur_id` INT NOT NULL,
  `duree` INT NOT NULL, -- durée en minutes
  `nb_jour_tournage` INT DEFAULT NULL, -- optionnel
  CONSTRAINT `fk_film_pays` FOREIGN KEY (`pays_id`) REFERENCES `pays`(`id_pays`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_realisateur` FOREIGN KEY (`realisateur_id`) REFERENCES `realisateur`(`id_realisateur`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- TABLE: casting (relation many-to-many entre acteur et film)
CREATE TABLE `casting` (
  `id_casting` INT AUTO_INCREMENT PRIMARY KEY,
  `id_film` INT NOT NULL,
  `id_acteur` INT NOT NULL,
  `role` VARCHAR(200) DEFAULT NULL,
  CONSTRAINT `fk_casting_film` FOREIGN KEY (`id_film`) REFERENCES `film`(`id_film`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_casting_acteur` FOREIGN KEY (`id_acteur`) REFERENCES `acteur`(`id_acteur`) ON DELETE CASCADE ON UPDATE CASCADE,
  UNIQUE KEY `unique_acteur_film` (`id_film`,`id_acteur`)
) ENGINE=InnoDB;

-- INSERT: pays (avoid text redundancy in film.table)
INSERT INTO `pays` (`nom`) VALUES
('France'),
('USA'),
('UK'),
('Canada'),
('Japon'),
('Italie');

-- INSERT: realisateurs (including Georges Lucas and directors born in the 1950s)
INSERT INTO `realisateur` (nom, prenom, date_naissance, nb_films_ecrit_produit) VALUES
('Lucas','Georges','1944-05-14', 9),
('Coen','Joel','1954-11-29', 40),
('Coen','Ethan','1957-09-21', 38),
('Boon','Dany','1966-06-26', 12),
('Nolan','Christopher','1970-07-30', 12),
('Spielberg','Steven','1946-12-18', 35);

-- INSERT: acteurs (some with nb_films between 40 and 90)
INSERT INTO `acteur` (nom, prenom, date_naissance, nb_films) VALUES
('Ford','Harrison','1942-07-13', 75),
('Hamill','Mark','1951-09-25', 60),
('Carrie','Fisher','1956-10-21', 50),
('Jackson','Samuel L.','1948-12-21', 150),
('Dujardin','Jean','1972-06-19', 45),
('Depardieu','Gérard','1948-12-27', 120),
('Dupont','Jean','1985-01-01', 5); -- example contemporary actor

-- INSERT: films (include sample data, SF films, and the requested "Bienvenue chez les Ch'ti's")
INSERT INTO `film` (titre, genre1, genre2, date_sortie, pays_id, distributeur, realisateur_id, duree, nb_jour_tournage) VALUES
('Star Wars: Episode IV - A New Hope','SF', NULL, '1977-05-25', 2, '20th Century Fox', 1, 121, NULL),
('Blade Runner','SF', 'Thriller', '1982-06-25', 3, 'Warner Bros.', 5, 117, NULL),
('Bienvenue chez les Ch''ti''s','Comédie', NULL, '2008-02-27', 1, 'Gaumont', 4, 100, 40),
('Some Modern Movie','Comédie', 'Drame', '2010-05-15', 1, 'Indie', 2, 95, 30),
('Epic Adventure','Aventure', 'SF', '2011-07-07', 2, 'Universal', 6, 130, 50),
('Old Movie','Drame', NULL, '1955-03-10', 3, 'ClassicDist', 2, 85, NULL),
('Indie SF Gem','SF', NULL, '2009-11-20', 1, 'SmallDist', 2, 105, 20);

-- INSERT: casting (connect actors to films)
-- Star Wars cast (simplified)
INSERT INTO `casting` (id_film, id_acteur, role) VALUES
(1, 2, 'Luke Skywalker'),
(1, 1, 'Han Solo'),
(1, 3, 'Leia Organa');

-- Blade Runner cast (fictional mapping)
INSERT INTO `casting` (id_film, id_acteur, role) VALUES
(2, 1, 'Rick Deckard');

-- Bienvenue chez les Ch'ti's cast (Dany Boon is director, actors fictional)
INSERT INTO `casting` (id_film, id_acteur, role) VALUES
(3, 5, 'Antoine'), -- Jean Dujardin
(3, 7, 'Supporting'); -- Jean Dupont

-- Some Modern Movie cast
INSERT INTO `casting` (id_film, id_acteur, role) VALUES
(4, 5, 'Lead'),
(4, 7, 'Support');

-- Epic Adventure cast
INSERT INTO `casting` (id_film, id_acteur, role) VALUES
(5, 1, 'Hero'),
(5, 4, 'Villain');

-- Indie SF Gem cast
INSERT INTO `casting` (id_film, id_acteur, role) VALUES
(7, 2, 'Protagonist'),
(7, 5, 'Cameo');

-- Update counts in acteur and realisateur to reflect inserted film involvement where relevant
UPDATE acteur SET nb_films = 75 WHERE id_acteur = 1;
UPDATE acteur SET nb_films = 60 WHERE id_acteur = 2;
UPDATE acteur SET nb_films = 50 WHERE id_acteur = 3;
UPDATE acteur SET nb_films = 45 WHERE id_acteur = 5;

UPDATE realisateur SET nb_films_ecrit_produit = 9 WHERE id_realisateur = 1;
UPDATE realisateur SET nb_films_ecrit_produit = 40 WHERE id_realisateur = 2;

-- SAMPLE QUERIES REQUIRED BY THE MISSION (for reference)
-- 1) Liste des films (ID et Titre) qui ont un genre SF.
-- SELECT id_film, titre FROM film WHERE genre1 = 'SF' OR genre2 = 'SF';

-- 2) Liste des réalisateurs (nom, prenom) nés dans les années 50.
-- SELECT nom, prenom FROM realisateur WHERE date_naissance BETWEEN '1950-01-01' AND '1959-12-31';

-- 3) Nom et prénom des acteurs qui ont joué dans un film réalisé par 'Georges Lucas'.
-- SELECT a.nom, a.prenom
-- FROM acteur a
-- JOIN casting c ON a.id_acteur = c.id_acteur
-- JOIN film f ON f.id_film = c.id_film
-- JOIN realisateur r ON r.id_realisateur = f.realisateur_id
-- WHERE r.nom = 'Lucas' AND r.prenom = 'Georges';

-- 4) Films > 90min sortis entre 2008 and 2012
-- SELECT * FROM film WHERE duree > 90 AND date_sortie BETWEEN '2008-01-01' AND '2012-12-31';

-- 5) Acteurs ayant tourné entre 40 et 90 films
-- SELECT nom, prenom, nb_films FROM acteur WHERE nb_films BETWEEN 40 AND 90;

-- END OF DUMP
