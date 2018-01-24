-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 24 jan. 2018 à 10:15
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `boissons-2e-version`
--

-- --------------------------------------------------------

--
-- Structure de la table `boissons`
--

DROP TABLE IF EXISTS `boissons`;
CREATE TABLE IF NOT EXISTS `boissons` (
  `idboissons` int(11) NOT NULL AUTO_INCREMENT,
  `nameboisson` varchar(45) DEFAULT NULL,
  `codeboisson` varchar(3) DEFAULT NULL,
  `price` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`idboissons`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `boissons`
--

INSERT INTO `boissons` (`idboissons`, `nameboisson`, `codeboisson`, `price`) VALUES
(1, 'Espresso', 'ESP', 40),
(2, 'Lungo', 'LUN', 40),
(3, 'Latte', 'LAT', 50),
(4, 'Tea', 'TEA', 30);

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `idingredients` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`idingredients`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ingredients`
--

INSERT INTO `ingredients` (`idingredients`, `name`, `quantity`) VALUES
(1, 'coffee', 65),
(2, 'water', 357),
(3, 'milk', 41),
(4, 'tea', 153),
(5, 'sugar', 222);

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

DROP TABLE IF EXISTS `recettes`;
CREATE TABLE IF NOT EXISTS `recettes` (
  `boissons_idboissons` int(11) NOT NULL,
  `ingredients_idingredients` int(11) NOT NULL,
  `dose` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`boissons_idboissons`,`ingredients_idingredients`),
  KEY `fk_boissons_has_ingredients_ingredients1_idx` (`ingredients_idingredients`),
  KEY `fk_boissons_has_ingredients_boissons1_idx` (`boissons_idboissons`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `recettes`
--

INSERT INTO `recettes` (`boissons_idboissons`, `ingredients_idingredients`, `dose`) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 1),
(2, 2, 4),
(3, 1, 1),
(3, 2, 3),
(3, 3, 1),
(4, 2, 4),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ventes`
--

DROP TABLE IF EXISTS `ventes`;
CREATE TABLE IF NOT EXISTS `ventes` (
  `idventes` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `boissons_idboissons` int(11) NOT NULL,
  `date` int(11) DEFAULT NULL,
  `nbSucres` tinyint(3) UNSIGNED DEFAULT NULL,
  `priceVente` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`idventes`),
  KEY `fk_ventes_boissons_idx` (`boissons_idboissons`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ventes`
--

INSERT INTO `ventes` (`idventes`, `boissons_idboissons`, `date`, `nbSucres`, `priceVente`) VALUES
(1, 1, 20180122, 0, 40),
(2, 1, 20180122, 2, 40),
(3, 3, 20180122, 4, 50),
(4, 2, 20180123, 4, 40),
(5, 4, 20180124, 1, 30),
(6, 1, 20180124, 3, 40),
(7, 1, 20180124, 0, 40),
(8, 3, 20180124, 2, 50);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `recettes`
--
ALTER TABLE `recettes`
  ADD CONSTRAINT `fk_boissons_has_ingredients_boissons1` FOREIGN KEY (`boissons_idboissons`) REFERENCES `boissons` (`idboissons`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_boissons_has_ingredients_ingredients1` FOREIGN KEY (`ingredients_idingredients`) REFERENCES `ingredients` (`idingredients`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ventes`
--
ALTER TABLE `ventes`
  ADD CONSTRAINT `fk_ventes_boissons` FOREIGN KEY (`boissons_idboissons`) REFERENCES `boissons` (`idboissons`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
