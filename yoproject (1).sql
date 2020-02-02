-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 11 nov. 2019 à 10:57
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `yoproject`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `ID` int(11) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PRIVILEGE` varchar(255) DEFAULT NULL,
  `nom` varchar(32) NOT NULL,
  `prenom` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`ID`, `EMAIL`, `PASSWORD`, `PRIVILEGE`, `nom`, `prenom`) VALUES
(1, 'admin@gmail.com', '4124bc0a9335c27f086f24ba207a4912', 'administrateur', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `besoinprojet`
--

CREATE TABLE `besoinprojet` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `IDCLIENT` bigint(20) DEFAULT NULL,
  `active` bigint(20) DEFAULT NULL,
  `IDMETIER` bigint(20) DEFAULT NULL,
  `NOMCOMPLET` varchar(255) DEFAULT NULL,
  `NOMCOURT` varchar(255) DEFAULT NULL,
  `BUDGET` varchar(255) DEFAULT NULL,
  `COUTESTIME` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `besoinprojet`
--

INSERT INTO `besoinprojet` (`ID`, `DESCRIPTION`, `TYPE`, `IDCLIENT`, `active`, `IDMETIER`, `NOMCOMPLET`, `NOMCOURT`, `BUDGET`, `COUTESTIME`) VALUES
(1, 'website', 'php', 1, 1, NULL, NULL, NULL, NULL, NULL),
(2, 'website', 'javacript', 1, 0, NULL, NULL, NULL, NULL, NULL),
(3, 'Design logo', 'Design', 1, 0, NULL, NULL, NULL, NULL, NULL),
(4, 'charte graphique', 'design', 1, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `chefdeprojet`
--

CREATE TABLE `chefdeprojet` (
  `ID` bigint(20) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `VILLE` varchar(255) DEFAULT NULL,
  `DATEN` varchar(255) DEFAULT NULL,
  `TITRE` varchar(255) DEFAULT NULL,
  `TELEPHONE` varchar(255) DEFAULT NULL,
  `INTERET` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `FACEBOOK` varchar(255) DEFAULT NULL,
  `TWITTER` varchar(255) DEFAULT NULL,
  `GOOGLEPLUS` varchar(255) DEFAULT NULL,
  `PRIVILIGE` varchar(255) DEFAULT NULL,
  `PHOTO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chefdeprojet`
--

INSERT INTO `chefdeprojet` (`ID`, `EMAIL`, `PRENOM`, `NOM`, `VILLE`, `DATEN`, `TITRE`, `TELEPHONE`, `INTERET`, `PASSWORD`, `FACEBOOK`, `TWITTER`, `GOOGLEPLUS`, `PRIVILIGE`, `PHOTO`) VALUES
(1, 'sebaouiyoussef1977@gmail.com', 'Youssef', 'Sebaoui', 'Oujda', '20/03/2019', 'Designer', '0670431743', '', '4124bc0a9335c27f086f24ba207a4912', 'https://facebook.com', 'https://twitte.com', 'https://google.com', 'Chef de projet', NULL),
(2, 'abdalaoui@gmail.com', 'Youssef', 'Sebaoui', 'Oujda', '12/03/2019', 'zz', '0670431743', '', '4124bc0a9335c27f086f24ba207a4912', 'https://facebook.com', 'https://twitte.com', 'https://google.com', 'Chef de projet', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `ID` bigint(20) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `PRIVILIGE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`ID`, `NOM`, `EMAIL`, `PASSWORD`, `PRENOM`, `PRIVILIGE`) VALUES
(1, 'salmi', 'aa@gmail.com', '4124bc0a9335c27f086f24ba207a4912', 'jamal', 'client'),
(2, 'toubi', 'toubi@gmail.com', '4124bc0a9335c27f086f24ba207a4912', 'youssef', 'client');

-- --------------------------------------------------------

--
-- Structure de la table `collaborateur`
--

CREATE TABLE `collaborateur` (
  `ID` bigint(20) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `VILLE` varchar(255) DEFAULT NULL,
  `DATEN` varchar(255) DEFAULT NULL,
  `TELEPHONE` varchar(255) DEFAULT NULL,
  `INTERET` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PRIVILIGE` varchar(255) DEFAULT NULL,
  `PHOTO` varchar(255) DEFAULT NULL,
  `TITRE` varchar(255) DEFAULT NULL,
  `FACEBOOK` varchar(255) DEFAULT NULL,
  `TWITTER` varchar(255) DEFAULT NULL,
  `GOOGLEPLUS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `collaborateur`
--

INSERT INTO `collaborateur` (`ID`, `EMAIL`, `PRENOM`, `NOM`, `VILLE`, `DATEN`, `TELEPHONE`, `INTERET`, `PASSWORD`, `PRIVILIGE`, `PHOTO`, `TITRE`, `FACEBOOK`, `TWITTER`, `GOOGLEPLUS`) VALUES
(21, 'ahmadi@gmail.com', 'youssef', 'Ahmadi', 'Oujda', '07/03/2019', '0670431743', 'ss', '4124bc0a9335c27f086f24ba207a4912', 'Collaborateur', NULL, 'zsss', 'https://facebook.com', 'https://twitte.com', 'https://google.com'),
(23, 'fadwaibbou1986@gmail.com', 'Youssef', 'Sebaoui', 'Oujda', '20/03/2019', '0670431743', 'f', '4124bc0a9335c27f086f24ba207a4912', 'Collaborateur', NULL, 'f', 'https://facebook.com', 'https://twitte.com', 'https://google.com');

-- --------------------------------------------------------

--
-- Structure de la table `metier`
--

CREATE TABLE `metier` (
  `ID` bigint(20) NOT NULL,
  `TECHNOLOGIE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `metier`
--

INSERT INTO `metier` (`ID`, `TECHNOLOGIE`) VALUES
(1, 'SEO'),
(2, 'Conception web');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `besoinprojet`
--
ALTER TABLE `besoinprojet`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `chefdeprojet`
--
ALTER TABLE `chefdeprojet`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `collaborateur`
--
ALTER TABLE `collaborateur`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `metier`
--
ALTER TABLE `metier`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `besoinprojet`
--
ALTER TABLE `besoinprojet`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `chefdeprojet`
--
ALTER TABLE `chefdeprojet`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `collaborateur`
--
ALTER TABLE `collaborateur`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `metier`
--
ALTER TABLE `metier`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
