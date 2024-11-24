-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 24 nov. 2024 à 17:07
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
-- Base de données : `e-commerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `command`
--

DROP TABLE IF EXISTS `command`;
CREATE TABLE IF NOT EXISTS `command` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  `Date` datetime NOT NULL,
  `User_Cart` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `User_ID` (`User_ID`),
  KEY `User_Cart` (`User_Cart`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `command`
--

INSERT INTO `command` (`ID`, `User_ID`, `Date`, `User_Cart`) VALUES
(1, 3, '2024-05-08 12:59:30', 5),
(2, 6, '2024-05-21 18:23:24', 7),
(3, 6, '2024-03-26 21:36:16', 3),
(4, 1, '2024-07-30 01:54:39', 7),
(5, 10, '2024-10-11 08:01:40', 4),
(6, 7, '2024-11-10 20:41:28', 6),
(7, 7, '2024-03-26 15:05:10', 4),
(8, 2, '2024-10-24 01:46:55', 1),
(9, 4, '2024-09-24 01:10:56', 5),
(10, 5, '2024-01-16 11:31:17', 3);

-- --------------------------------------------------------

--
-- Structure de la table `command_product`
--

DROP TABLE IF EXISTS `command_product`;
CREATE TABLE IF NOT EXISTS `command_product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Command_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Command_ID` (`Command_ID`),
  KEY `Product_ID` (`Product_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `Command_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Command_ID` (`Command_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `invoices`
--

INSERT INTO `invoices` (`ID`, `User_ID`, `Total`, `Command_ID`) VALUES
(1, 2, 385.00, 4),
(2, 8, 185.60, 3),
(3, 8, 229.07, 2),
(4, 3, 278.86, 5),
(5, 5, 169.84, 9),
(6, 4, 431.56, 9),
(7, 7, 260.17, 2),
(8, 2, 91.06, 3),
(9, 7, 203.44, 9),
(10, 8, 451.35, 10);

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  `Command_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Command_ID` (`Command_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`ID`, `User_ID`, `Command_ID`) VALUES
(1, 3, 9),
(2, 5, 9),
(3, 4, 2),
(4, 10, 8),
(5, 8, 10),
(6, 9, 9),
(7, 9, 5),
(8, 5, 6),
(9, 6, 3),
(10, 10, 7);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Category` varchar(100) NOT NULL,
  `stock_quantity` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`ID`, `Name`, `Price`, `Category`, `stock_quantity`) VALUES
(1, 'rem', 60.93, 'modi', 24),
(2, 'nesciunt', 163.22, 'ipsum', 23),
(3, 'commodi', 618.50, 'ut', 24),
(4, 'est', 207.45, 'et', 76),
(5, 'nam', 679.65, 'qui', 60),
(6, 'eligendi', 51.20, 'sunt', 33),
(7, 'odio', 819.18, 'ut', 16),
(8, 'dignissimos', 380.82, 'rerum', 58),
(9, 'explicabo', 797.53, 'aut', 79),
(10, 'minus', 333.67, 'debitis', 61);

-- --------------------------------------------------------

--
-- Structure de la table `rate`
--

DROP TABLE IF EXISTS `rate`;
CREATE TABLE IF NOT EXISTS `rate` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Note` int NOT NULL,
  `Opinion` text,
  `Product_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Product_ID` (`Product_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `rate`
--

INSERT INTO `rate` (`ID`, `Note`, `Opinion`, `Product_ID`) VALUES
(1, 2, 'Vel nam voluptatem eum.', 9),
(2, 3, 'Sequi exercitationem explicabo similique consequatur voluptas harum.', 7),
(3, 2, 'Dolores minus quod maiores maiores perferendis debitis quos.', 5),
(4, 2, 'Reprehenderit repellat repellendus deserunt est aut occaecati.', 7),
(5, 4, 'Quia laborum doloribus nostrum dignissimos.', 2),
(6, 5, 'Iusto error repudiandae quisquam quia distinctio.', 9),
(7, 3, 'Accusantium velit porro possimus aut cumque.', 9),
(8, 1, 'Cumque quasi voluptatem tempora at cum ducimus.', 2),
(9, 4, 'Laudantium provident et dolor ut quibusdam voluptates ea.', 3),
(10, 5, 'Facere dolorem fuga non.', 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(100) DEFAULT NULL,
  `Last_Name` varchar(100) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `First_Name`, `Last_Name`, `Email`, `Phone_Number`, `Password`, `Username`) VALUES
(1, 'Lilyan', 'Lesch', 'laury03@gmail.com', '1-352-261-4207', '$2y$10$wE965FdqUsOaIWaebM3bq.UodGhcZmBSJ3ShVnTmi3PJsR8SoAlri', 'jamir25'),
(2, 'Aiyana', 'Mosciski', 'ankunding.joanny@hoppe.biz', '1-832-417-8117', '$2y$10$ARQQZmAdmaZ66NPm4qEGhOh/16XN5yWr6T5nCUX9/nV5X/OrkZnhi', 'rempel.verner'),
(3, 'Ralph', 'Bayer', 'erdman.michele@pfeffer.com', '928.460.1050', '$2y$10$HRGgVUxR77FmTTYdoPQkTuCIjboCfM4p9EVSEuzXgq4YeM5q6Imti', 'catharine.cremin'),
(4, 'Kristian', 'Kovacek', 'breanne.boehm@mcclure.net', '802.561.0912', '$2y$10$3JNC7MtSTMTEdSeahE30Ve/i3fTNSuRS.kOsdh4/VnuA80frc01p6', 'ondricka.shayna'),
(5, 'Bianka', 'Bahringer', 'ygraham@gmail.com', '812-468-2614', '$2y$10$GwaWd3AsYrTmQ5BaQpaL4.MuiMTqyf/gSyAQL8g6o4yA2tcOEZxui', 'effie05'),
(6, 'Orlando', 'Beahan', 'josh.casper@satterfield.info', '(718) 433-1017', '$2y$10$6wIbcu5ceYCgjgtfXppfpudt0o1hosWZDMqfe4Igc0yJtNllwiAVa', 'tracey.feest'),
(7, 'Leann', 'Mueller', 'pagac.mia@yahoo.com', '+1 (351) 863-6306', '$2y$10$fOU7z/knyEmF5A..xMg/VO9BMnie4M3uqsdvbV9jTdB0bpokfz9bW', 'kendra.mueller'),
(8, 'Ellie', 'Cole', 'delphia89@funk.info', '+1-786-891-6490', '$2y$10$snvzNWOC4x5dr07Ga6iOZeH16OqWwB0PyeSPa7X9xm4ADlGPxxpZi', 'hintz.sydni'),
(9, 'Germaine', 'Harvey', 'lkunde@ebert.info', '+14587040631', '$2y$10$BXf/0gdVQPU1z2eSNesuM.7JNvGz1uNSOXwQ.Q8GH1TldYdtF87r.', 'lorenz55'),
(10, 'Halle', 'Rolfson', 'jakob13@gmail.com', '1-919-386-3187', '$2y$10$RnWDxezxDufd4tp0teZsAugBX9SnTSgs50PzscMzNkJLL9MKIVA0e', 'sherman.dare');

-- --------------------------------------------------------

--
-- Structure de la table `user_cart`
--

DROP TABLE IF EXISTS `user_cart`;
CREATE TABLE IF NOT EXISTS `user_cart` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  `Cart_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `User_ID` (`User_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user_cart`
--

INSERT INTO `user_cart` (`ID`, `User_ID`, `Cart_ID`) VALUES
(1, 6, 3),
(2, 7, 4),
(3, 8, 10),
(4, 3, 2),
(5, 1, 6),
(6, 6, 7),
(7, 7, 8),
(8, 3, 6),
(9, 3, 8),
(10, 10, 7);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
