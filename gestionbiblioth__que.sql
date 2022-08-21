-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 21 août 2022 à 21:27
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionbibliothèque`
--

-- --------------------------------------------------------

--
-- Structure de la table `lecteur`
--

DROP TABLE IF EXISTS `lecteur`;
CREATE TABLE IF NOT EXISTS `lecteur` (
  `NumLecteur` varchar(50) NOT NULL,
  `Nom` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`NumLecteur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `lecteur`
--

INSERT INTO `lecteur` (`NumLecteur`, `Nom`) VALUES
('L02', 'Hariliva'),
('L01', 'Mianja'),
('L03', 'RAKOTO'),
('L04', 'Mirantsoa');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

DROP TABLE IF EXISTS `livre`;
CREATE TABLE IF NOT EXISTS `livre` (
  `NumLivre` varchar(50) NOT NULL,
  `Titre` varchar(50) NOT NULL,
  `Auteur` varchar(50) NOT NULL,
  `Date_edition` varchar(50) NOT NULL,
  `Disponible` varchar(50) NOT NULL,
  `Quantité` int NOT NULL,
  `Nb_Fois_Preté` int NOT NULL,
  PRIMARY KEY (`NumLivre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`NumLivre`, `Titre`, `Auteur`, `Date_edition`, `Disponible`, `Quantité`, `Nb_Fois_Preté`) VALUES
('Livre02', 'ROMAN', 'ARIEL', '2022-02-09', 'OUI', 3, 10),
('Livre01', 'Tantara', 'DOX', '2022-03-02', 'NON', 0, 23),
('Livre03', 'Tantara', 'EDA', '2022-03-02', 'OUI', 1, 0),
('123', 'babouche', 'Dora', '12-12-2020', 'oui', 12, 0),
('Mark', 'Mark', 'Mark', '12-12-07', 'oui', 45, 0),
('coucou', 'coucou', 'coucou', '12-12-12', 'OUI', 13, 0),
('qss', 'ss', 'sss', 'ss', 'ss', 0, 0),
('azee', 'aaaa', 'aaaa', 'aaa', 'bbbbbbb', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `pret`
--

DROP TABLE IF EXISTS `pret`;
CREATE TABLE IF NOT EXISTS `pret` (
  `NumPret` int NOT NULL AUTO_INCREMENT,
  `NumLecteur` varchar(50) NOT NULL,
  `NumLivre` varchar(50) NOT NULL,
  `DatePret` date DEFAULT NULL,
  `DateRetour` date NOT NULL,
  PRIMARY KEY (`NumPret`,`NumLecteur`,`NumLivre`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `pret`
--

INSERT INTO `pret` (`NumPret`, `NumLecteur`, `NumLivre`, `DatePret`, `DateRetour`) VALUES
(7, 'L01', 'Livre01', '2022-03-10', '2022-06-02'),
(8, 'L01', 'Livre01', '2022-02-18', '2022-06-25'),
(9, 'L01', 'Livre01', '2022-02-14', '2022-03-18'),
(11, 'L01', 'Livre01', '2022-03-01', '2022-06-30'),
(12, 'L01', 'Livre01', '2022-03-02', '2022-03-11'),
(13, 'L01', 'Livre01', '2022-02-08', '2022-05-04'),
(14, 'L01', 'Livre01', '2022-03-09', '2022-03-16'),
(15, 'L01', 'Livre2', '2022-02-23', '2022-03-04'),
(16, 'L01', 'Livre02', '2022-02-22', '2022-03-04'),
(17, 'L01', 'Livre02', '2022-02-09', '2022-03-18'),
(18, 'L01', 'Livre02', '2022-03-23', '2022-03-11'),
(20, 'L01', 'Livre01', '2022-02-16', '0000-00-00'),
(21, 'L01', 'Livre01', '2022-02-09', '0000-00-00'),
(22, 'L01', 'Livre03', '2022-02-17', '0000-00-00'),
(25, 'L01', 'Livre01', '2022-02-11', '0000-00-00'),
(26, 'L01', 'Livre01', '2022-02-11', '0000-00-00'),
(27, 'L01', 'Livre01', '2022-02-17', '0000-00-00'),
(28, 'L01', 'Livre02', '2022-02-23', '0000-00-00'),
(29, 'L01', 'Livre02', '2022-03-11', '0000-00-00'),
(30, 'L01', 'Livre02', '2022-02-28', '0000-00-00'),
(31, 'L03', 'Livre02', '2022-02-28', '0000-00-00'),
(32, 'L04', 'Livre01', '2022-02-28', '0000-00-00'),
(33, 'L01', 'Livre01', '2022-02-09', '2022-01-12'),
(34, 'L01', 'Livre01', '2022-02-23', '2022-03-11'),
(35, 'L01', 'Livre03', '2022-02-08', '2022-03-04'),
(37, 'L01', 'Livre01', '2022-03-03', '2022-03-11'),
(39, 'L03', 'Livre01', '2022-03-04', '0000-00-00'),
(40, 'L02', 'Livre01', '2022-03-10', '0000-00-00'),
(41, 'L03', 'Livre01', '2022-03-19', '0000-00-00'),
(42, 'L04', 'Livre01', '2022-03-02', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Matricule` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `Matricule`, `nom`, `email`, `pass`) VALUES
(13, '008', 'Gasimiaro Mandimby', 'zagasimiaro@gmail.com', '12345'),
(14, '004', 'Rakotomalala Mirantsoa', 'rakotomalalamirantsoa1@gmail.c', 'sdfghj'),
(12, '003', 'Rakotomalala Mirantsoa', 'rakotomalalamirantsoa1@gmail.c', 'sdfghj');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
