-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 mars 2024 à 11:00
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `itpark`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateurs`
--

DROP TABLE IF EXISTS `administrateurs`;
CREATE TABLE IF NOT EXISTS `administrateurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_mail` varchar(50) DEFAULT NULL,
  `statut` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `employes`
--

DROP TABLE IF EXISTS `employes`;
CREATE TABLE IF NOT EXISTS `employes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `poste` varchar(50) NOT NULL,
  `accord_sortie` varchar(50) NOT NULL,
  `id_service` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_service` (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `interventions`
--

DROP TABLE IF EXISTS `interventions`;
CREATE TABLE IF NOT EXISTS `interventions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `responsable` varchar(100) NOT NULL,
  `action_requise` varchar(500) NOT NULL,
  `decision` varchar(50) NOT NULL,
  `date_intervention` date NOT NULL,
  `id_technicien` int NOT NULL,
  `id_panne` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_panne` (`id_panne`),
  KEY `id_technicien` (`id_technicien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inventaires`
--

DROP TABLE IF EXISTS `inventaires`;
CREATE TABLE IF NOT EXISTS `inventaires` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_inventaire` date NOT NULL,
  `responsable` varchar(100) NOT NULL,
  `id_technicien` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_technicien` (`id_technicien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ligne_inventaire`
--

DROP TABLE IF EXISTS `ligne_inventaire`;
CREATE TABLE IF NOT EXISTS `ligne_inventaire` (
  `id_inventaire` int NOT NULL,
  `id_materiel` int NOT NULL,
  `observation` varchar(50) DEFAULT NULL,
  `etat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_inventaire`,`id_materiel`),
  KEY `id_materiel` (`id_materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ligne_materiel`
--

DROP TABLE IF EXISTS `ligne_materiel`;
CREATE TABLE IF NOT EXISTS `ligne_materiel` (
  `id_materiel` int NOT NULL,
  `id_logiciel` int NOT NULL,
  `date_installation` date DEFAULT NULL,
  PRIMARY KEY (`id_materiel`,`id_logiciel`),
  KEY `id_logiciel` (`id_logiciel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `logiciels`
--

DROP TABLE IF EXISTS `logiciels`;
CREATE TABLE IF NOT EXISTS `logiciels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `editeur` varchar(100) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `date_achat` date NOT NULL,
  `date_expiration` date DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `id_type_logiciel` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type_logiciel` (`id_type_logiciel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `materiels`
--

DROP TABLE IF EXISTS `materiels`;
CREATE TABLE IF NOT EXISTS `materiels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) DEFAULT NULL,
  `fabricant` varchar(50) NOT NULL,
  `modele` varchar(50) DEFAULT NULL,
  `numero_serie` varchar(50) DEFAULT NULL,
  `etat_achat` varchar(50) NOT NULL,
  `mobilite` varchar(50) NOT NULL,
  `id_employe` int NOT NULL,
  `id_administrateur` int NOT NULL,
  `id_type_materiel` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_employe` (`id_employe`),
  KEY `id_administrateur` (`id_administrateur`),
  KEY `id_type_materiel` (`id_type_materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pannes`
--

DROP TABLE IF EXISTS `pannes`;
CREATE TABLE IF NOT EXISTS `pannes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `diagnostic` varchar(500) NOT NULL,
  `date_diagnostic` date NOT NULL,
  `id_materiel` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materiel` (`id_materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `techniciens`
--

DROP TABLE IF EXISTS `techniciens`;
CREATE TABLE IF NOT EXISTS `techniciens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_mail` varchar(50) DEFAULT NULL,
  `statut` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_logiciels`
--

DROP TABLE IF EXISTS `type_logiciels`;
CREATE TABLE IF NOT EXISTS `type_logiciels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_materiels`
--

DROP TABLE IF EXISTS `type_materiels`;
CREATE TABLE IF NOT EXISTS `type_materiels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `employes`
--
ALTER TABLE `employes`
  ADD CONSTRAINT `employes_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `interventions`
--
ALTER TABLE `interventions`
  ADD CONSTRAINT `interventions_ibfk_1` FOREIGN KEY (`id_technicien`) REFERENCES `techniciens` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `interventions_ibfk_2` FOREIGN KEY (`id_panne`) REFERENCES `pannes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `inventaires`
--
ALTER TABLE `inventaires`
  ADD CONSTRAINT `inventaires_ibfk_1` FOREIGN KEY (`id_technicien`) REFERENCES `techniciens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ligne_inventaire`
--
ALTER TABLE `ligne_inventaire`
  ADD CONSTRAINT `ligne_inventaire_ibfk_1` FOREIGN KEY (`id_inventaire`) REFERENCES `inventaires` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ligne_inventaire_ibfk_2` FOREIGN KEY (`id_materiel`) REFERENCES `materiels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ligne_materiel`
--
ALTER TABLE `ligne_materiel`
  ADD CONSTRAINT `ligne_materiel_ibfk_1` FOREIGN KEY (`id_materiel`) REFERENCES `materiels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ligne_materiel_ibfk_2` FOREIGN KEY (`id_logiciel`) REFERENCES `logiciels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `logiciels`
--
ALTER TABLE `logiciels`
  ADD CONSTRAINT `logiciels_ibfk_1` FOREIGN KEY (`id_type_logiciel`) REFERENCES `type_logiciels` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `materiels`
--
ALTER TABLE `materiels`
  ADD CONSTRAINT `materiels_ibfk_1` FOREIGN KEY (`id_employe`) REFERENCES `employes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `materiels_ibfk_2` FOREIGN KEY (`id_administrateur`) REFERENCES `administrateurs` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `materiels_ibfk_3` FOREIGN KEY (`id_type_materiel`) REFERENCES `type_materiels` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `pannes`
--
ALTER TABLE `pannes`
  ADD CONSTRAINT `pannes_ibfk_1` FOREIGN KEY (`id_materiel`) REFERENCES `materiels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
