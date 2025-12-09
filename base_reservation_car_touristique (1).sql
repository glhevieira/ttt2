-- Base de données : Reservation Car Touristique Paris
CREATE DATABASE IF NOT EXISTS reservation_car;
USE reservation_car;

-- ============================
-- TABLE : CLIENTS
-- ============================
CREATE TABLE clients (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    email VARCHAR(150) UNIQUE NOT NULL,
    telephone VARCHAR(20),
    date_inscription DATE
) ENGINE=InnoDB;
-- ============================
-- TABLE : CARS (BUS)
-- ============================
CREATE TABLE cars (
    id_car INT AUTO_INCREMENT PRIMARY KEY,
    immatriculation VARCHAR(20) UNIQUE NOT NULL,
    capacite INT NOT NULL,
    marque VARCHAR(100),
    modele VARCHAR(100),
    en_service TINYINT(1) DEFAULT 1
) ENGINE=InnoDB;

-- ============================
-- TABLE : CHAUFFEURS
-- ============================
CREATE TABLE chauffeurs (
    id_chauffeur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    telephone VARCHAR(20),
    permis VARCHAR(20) NOT NULL,
    date_embauche DATE
) ENGINE=InnoDB;

-- ============================
-- TABLE : CIRCUITS TOURISTIQUES
-- ============================
CREATE TABLE circuits (
    id_circuit INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(150) NOT NULL,
    description TEXT,
    duree_minutes INT,
    prix DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

-- ============================
-- TABLE : DEPARTS
-- ============================
CREATE TABLE departs (
    id_depart INT AUTO_INCREMENT PRIMARY KEY,
    id_circuit INT NOT NULL,
    id_car INT NOT NULL,
    id_chauffeur INT NOT NULL,
    date_heure_depart DATETIME NOT NULL,
    FOREIGN KEY (id_circuit) REFERENCES circuits(id_circuit) ON DELETE CASCADE,
    FOREIGN KEY (id_car) REFERENCES cars(id_car) ON DELETE CASCADE,
    FOREIGN KEY (id_chauffeur) REFERENCES chauffeurs(id_chauffeur) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ============================
-- TABLE : RESERVATIONS
-- ============================
CREATE TABLE reservations (
    id_reservation INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT NOT NULL,
    id_depart INT NOT NULL,
    nb_places INT NOT NULL,
    statut VARCHAR(20) DEFAULT 'EN_ATTENTE',
    date_reservation DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_client) REFERENCES clients(id_client) ON DELETE CASCADE,
    FOREIGN KEY (id_depart) REFERENCES departs(id_depart) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ============================
-- TABLE : PAIEMENTS
-- ============================
CREATE TABLE paiements (
    id_paiement INT AUTO_INCREMENT PRIMARY KEY,
    id_reservation INT NOT NULL,
    montant DECIMAL(10,2) NOT NULL,
    mode_paiement VARCHAR(50),
    date_paiement DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_reservation) REFERENCES reservations(id_reservation) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ============================
-- INSERTIONS D'EXEMPLES
-- ============================

INSERT INTO clients (nom, prenom, email, telephone) VALUES
('Dupont', 'Jean', 'jean.dupont@example.com', '0601020304'),
('Martin', 'Sophie', 'sophie.martin@example.com', '0605060708');

INSERT INTO cars (immatriculation, capacite, marque, modele, en_service) VALUES
('AB-123-CD', 50, 'Mercedes', 'Tourismo', 1),
('EF-456-GH', 30, 'Iveco', 'Evadys', 1);

INSERT INTO chauffeurs (nom, prenom, telephone, permis, date_embauche) VALUES
('Bernard', 'Luc', '0611223344', 'D', '2019-05-20'),
('Petit', 'Marc', '0677889900', 'D', '2021-03-12');

INSERT INTO circuits (nom, description, duree_minutes, prix) VALUES
('Paris de Nuit', 'Visite nocturne de Paris', 120, 45.00),
('Paris Historique', 'Découverte des monuments historiques', 180, 60.00);

INSERT INTO departs (id_circuit, id_car, id_chauffeur, date_heure_depart) VALUES
(1, 1, 1, '2025-12-01 20:00:00'),
(2, 2, 2, '2025-12-02 14:00:00');

INSERT INTO reservations (id_client, id_depart, nb_places, statut) VALUES
(1, 1, 2, 'CONFIRMEE'),
(2, 2, 3, 'EN_ATTENTE');

INSERT INTO paiements (id_reservation, montant, mode_paiement) VALUES
(1, 90.00, 'Carte Bancaire');
