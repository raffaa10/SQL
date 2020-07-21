-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 21 juil. 2020 à 10:36
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `compta`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_article`
--

CREATE TABLE `t_article` (
  `id` int(10) NOT NULL,
  `ref` varchar(13) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `prix` decimal(15,0) NOT NULL DEFAULT 7,
  `id_fou` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_article`
--

INSERT INTO `t_article` (`id`, `ref`, `designation`, `prix`, `id_fou`) VALUES
(1, 'A01', 'Perceuse P1', '75', 1),
(2, 'F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', '2', 2),
(3, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', '4', 2),
(4, 'D01', 'Boulon Laiton 5 x 40 mm (sachet de 10)', '4', 3),
(5, 'A02', 'Meuleuse 125mm', '38', 1),
(6, 'D03', 'Boulon acier zingué 4 x 40 mm (sachet de 10)', '2', 3),
(7, 'A03', 'Perceuse à colonne', '185', 1),
(8, 'D04', 'Coffret meches à bois', '12', 3),
(9, 'F03', 'Coffret meches plates', '6', 2),
(10, 'F04', 'Fraise d\'encastrement', '8', 2);

-- --------------------------------------------------------

--
-- Structure de la table `t_bon`
--

CREATE TABLE `t_bon` (
  `id` int(10) NOT NULL,
  `numero` int(10) NOT NULL,
  `date_cmde` timestamp NOT NULL DEFAULT current_timestamp(),
  `delai` int(10) NOT NULL,
  `id_fou` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_bon`
--

INSERT INTO `t_bon` (`id`, `numero`, `date_cmde`, `delai`, `id_fou`) VALUES
(1, 1, '2020-07-21 08:32:46', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_compo`
--

CREATE TABLE `t_compo` (
  `id` int(10) NOT NULL,
  `qte` int(10) NOT NULL,
  `id_bon` int(10) NOT NULL,
  `id_art` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_compo`
--

INSERT INTO `t_compo` (`id`, `qte`, `id_bon`, `id_art`) VALUES
(1, 3, 1, 1),
(2, 4, 1, 5),
(3, 1, 1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `t_fournisseur`
--

CREATE TABLE `t_fournisseur` (
  `id` int(10) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_fournisseur`
--

INSERT INTO `t_fournisseur` (`id`, `nom`) VALUES
(1, 'Française d’Imports '),
(2, 'FDM SA'),
(3, 'Dubois & Fils');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `t_article`
--
ALTER TABLE `t_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_fou_article` (`id_fou`);

--
-- Index pour la table `t_bon`
--
ALTER TABLE `t_bon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_fou_bon` (`id_fou`);

--
-- Index pour la table `t_compo`
--
ALTER TABLE `t_compo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_bon_compo` (`id_bon`),
  ADD KEY `FK_art_compo` (`id_art`);

--
-- Index pour la table `t_fournisseur`
--
ALTER TABLE `t_fournisseur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `t_compo`
--
ALTER TABLE `t_compo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `t_article`
--
ALTER TABLE `t_article`
  ADD CONSTRAINT `FK_fou_article` FOREIGN KEY (`id_fou`) REFERENCES `t_fournisseur` (`id`);

--
-- Contraintes pour la table `t_bon`
--
ALTER TABLE `t_bon`
  ADD CONSTRAINT `FK_fou_bon` FOREIGN KEY (`id_fou`) REFERENCES `t_fournisseur` (`id`);

--
-- Contraintes pour la table `t_compo`
--
ALTER TABLE `t_compo`
  ADD CONSTRAINT `FK_art_compo` FOREIGN KEY (`id_art`) REFERENCES `t_article` (`id`),
  ADD CONSTRAINT `FK_bon_compo` FOREIGN KEY (`id_bon`) REFERENCES `t_bon` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
