-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 22 nov. 2024 à 14:52
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `restaurant`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int NOT NULL,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telephone` int NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `email`, `telephone`) VALUES
(1, 'test', 'testt', 'hj,hgjhgjh', 10000),
(2, 'erhtwfx', 'rgdhtfy', 'grdthf', 8525245),
(3, 'cscvgrhdgf', 'whdtfn', 'wrdhtfg', 156125),
(4, 'rhtxjyku', 'wdhtgkh', 'grhdwxgh', 145654),
(5, 'fegrhtj', 'grhtfyj', 'rhtjyku', 74156);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int NOT NULL,
  `id_client` int NOT NULL,
  `date_commande` text NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `id_client` (`id_client`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_client`, `date_commande`) VALUES
(1, 2, '2024-10-07'),
(2, 1, '2024-10-08'),
(3, 8, '2024-10-09');

-- --------------------------------------------------------

--
-- Structure de la table `commande_plat`
--

DROP TABLE IF EXISTS `commande_plat`;
CREATE TABLE IF NOT EXISTS `commande_plat` (
  `id_commande_plat` int NOT NULL,
  `id_commande` int NOT NULL,
  `id_plat` int NOT NULL,
  `quantite` int NOT NULL,
  PRIMARY KEY (`id_commande_plat`),
  KEY `id_commande` (`id_commande`),
  KEY `id_plat` (`id_plat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commande_plat`
--

INSERT INTO `commande_plat` (`id_commande_plat`, `id_commande`, `id_plat`, `quantite`) VALUES
(1, 1, 5, 4),
(2, 1, 6, 1),
(3, 2, 4, 1),
(4, 3, 7, 6);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `id_plat` int NOT NULL,
  `nom_plat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prix` int NOT NULL,
  `categorie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_plat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id_plat`, `nom_plat`, `prix`, `categorie`) VALUES
(1, 'Pate Carbo', 10, 'Plat'),
(2, 'Grec', 6, 'Plat'),
(3, 'Salade', 4, 'Entrée'),
(4, 'Glace Chocolat', 3, 'Dessert'),
(5, 'Glace Vanille', 3, 'Dessert'),
(6, 'Glace Fraise', 3, 'Dessert'),
(7, 'Burger Vegan', 15, 'Plat'),
(8, 'Oeuf', 4, 'Entrée'),
(9, 'Marmiton', 5, 'Entrée'),
(10, 'Samoussa', 7, 'Entrée');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
