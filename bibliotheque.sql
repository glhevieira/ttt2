-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 05 déc. 2025 à 09:40
-- Version du serveur : 8.0.44
-- Version de PHP : 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bibliotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherents`
--

CREATE TABLE `adherents` (
  `Id_Adherent` int NOT NULL,
  `Nom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Prenom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date_naissance` date DEFAULT NULL,
  `Date_adhesion` date DEFAULT NULL,
  `Adresse` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Num_tel` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Mail` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auteurs`
--

CREATE TABLE `auteurs` (
  `ID_Auteur` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Nom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Prenom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date_naissance` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

CREATE TABLE `emprunts` (
  `Id_emprunt` int NOT NULL,
  `Date_emprunt` date DEFAULT NULL,
  `Duree` int DEFAULT NULL,
  `Id_Adherent` int NOT NULL,
  `Reference_livre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `Reference_livre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Nbre_pages` int DEFAULT NULL,
  `ID_Auteur` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Annee` date DEFAULT NULL,
  `Genre` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Disponibilité` tinyint(1) DEFAULT NULL,
  `Nbre_emprunts` int DEFAULT NULL,
  `Etat` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Nbre_exemplaire` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adherents`
--
ALTER TABLE `adherents`
  ADD PRIMARY KEY (`Id_Adherent`);

--
-- Index pour la table `auteurs`
--
ALTER TABLE `auteurs`
  ADD PRIMARY KEY (`ID_Auteur`);

--
-- Index pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD PRIMARY KEY (`Id_emprunt`),
  ADD KEY `Id_Adherent` (`Id_Adherent`),
  ADD KEY `Reference_livre` (`Reference_livre`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`Reference_livre`),
  ADD KEY `ID_Auteur` (`ID_Auteur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adherents`
--
ALTER TABLE `adherents`
  MODIFY `Id_Adherent` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emprunts`
--
ALTER TABLE `emprunts`
  MODIFY `Id_emprunt` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD CONSTRAINT `emprunts_ibfk_1` FOREIGN KEY (`Id_Adherent`) REFERENCES `adherents` (`Id_Adherent`),
  ADD CONSTRAINT `emprunts_ibfk_2` FOREIGN KEY (`Reference_livre`) REFERENCES `livres` (`Reference_livre`);

--
-- Contraintes pour la table `livres`
--
ALTER TABLE `livres`
  ADD CONSTRAINT `livres_ibfk_1` FOREIGN KEY (`ID_Auteur`) REFERENCES `auteurs` (`ID_Auteur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
