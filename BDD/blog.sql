-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mar. 22 jan. 2019 à 16:07
-- Version du serveur :  5.7.24-0ubuntu0.16.04.1
-- Version de PHP :  7.2.11-2+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `Author`
--

CREATE TABLE `Author` (
  `Id` int(11) NOT NULL,
  `FirstName` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `LastName` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Author`
--

INSERT INTO `Author` (`Id`, `FirstName`, `LastName`) VALUES
(2, 'Victor', 'HUGO'),
(3, 'Emile', 'ZOLA'),
(6, 'Marc', 'LEVY'),
(7, 'JM', 'MARCHAND'),
(9, 'douille', 'douille'),
(10, 'test1', 'test2');

-- --------------------------------------------------------

--
-- Structure de la table `Category`
--

CREATE TABLE `Category` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Category`
--

INSERT INTO `Category` (`Id`, `Name`) VALUES
(1, 'Voyages'),
(2, 'Societe'),
(3, 'Sports'),
(6, 'Famille'),
(7, 'Jeux'),
(8, 'cuisine');

-- --------------------------------------------------------

--
-- Structure de la table `Comment`
--

CREATE TABLE `Comment` (
  `Id` int(11) NOT NULL,
  `Pseudo` varchar(70) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `Contents` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `CreationDate` datetime NOT NULL,
  `Post_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Comment`
--

INSERT INTO `Comment` (`Id`, `Pseudo`, `Contents`, `CreationDate`, `Post_Id`) VALUES
(25, 'test 6', 'comment 6', '2019-01-10 11:05:32', 2),
(26, 'test 7', 'commentaire 7', '2019-01-10 11:05:47', 2),
(27, 'test 8', 'comment 8', '2019-01-10 11:38:56', 2),
(28, 'test de commentaire 1', 'fbstghbrrrr', '2019-01-10 14:51:49', 6),
(29, 'test de commentaire 2', 'dsvsvdrqesbverbvhb', '2019-01-10 14:51:58', 6),
(30, 'ahhhhhhhh', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaahhhhhhhhhhhhhhhhhh', '2019-01-10 15:09:51', 6),
(32, 'com1', 'commentaire numéro 1', '2019-01-10 16:33:27', 10),
(33, 'douille', 'coucou', '2019-01-16 11:12:51', 10),
(34, 'test 2', 'commentaire numéro 2', '2019-01-16 12:17:24', 7),
(35, 'test1', 'commentaire 1', '2019-01-22 14:29:09', 10);

-- --------------------------------------------------------

--
-- Structure de la table `Post`
--

CREATE TABLE `Post` (
  `Id` int(11) NOT NULL,
  `Title` varchar(70) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `Contents` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `CreationDate` datetime NOT NULL,
  `Author_Id` int(11) NOT NULL,
  `Category_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Post`
--

INSERT INTO `Post` (`Id`, `Title`, `Contents`, `CreationDate`, `Author_Id`, `Category_Id`) VALUES
(7, 'test 3', 'Quam ob rem cave Catoni anteponas ne istum quidem ipsum, quem Apollo, ut ais, sapientissimum iudicavit; huius enim facta, illius dicta laudantur. De me autem, ut iam cum utroque vestrum loquar, sic habetote.\r\n\r\nIllud tamen clausos vehementer angebat quod captis navigiis, quae frumenta vehebant per flumen, Isauri quidem alimentorum copiis adfluebant, ipsi vero solitarum rerum cibos iam consumendo inediae propinquantis aerumnas exitialis horrebant.\r\n\r\nQuanta autem vis amicitiae sit, ex hoc intellegi maxime potest, quod ex infinita societate generis humani, quam conciliavit ipsa natura, ita contracta res est et adducta in angustum ut omnis caritas aut inter duos aut inter paucos iungeretur.\r\n', '2019-01-10 14:50:39', 3, 3),
(10, 'coucou', 'Quam ob rem cave Catoni anteponas ne istum quidem ipsum, quem Apollo, ut ais, sapientissimum iudicavit; huius enim facta, illius dicta laudantur. De me autem, ut iam cum utroque vestrum loquar, sic habetote.\r\n\r\nIllud tamen clausos vehementer angebat quod captis navigiis, quae frumenta vehebant per flumen, Isauri quidem alimentorum copiis adfluebant, ipsi vero solitarum rerum cibos iam consumendo inediae propinquantis aerumnas exitialis horrebant.\r\n', '2019-01-10 15:30:14', 2, 1),
(11, 'test1', 'uktyyyyyyyyyyyyyyyyyyyyyyyyyyyy\r\nhfluor-è_urfo', '2019-01-16 11:15:29', 8, 3),
(12, 'Article 3', 'Quam ob rem cave Catoni anteponas ne istum quidem ipsum, quem Apollo, ut ais, sapientissimum iudicavit; huius enim facta, illius dicta laudantur. De me autem, ut iam cum utroque vestrum loquar, sic habetote.\r\n\r\nIllud tamen clausos vehementer angebat quod captis navigiis, quae frumenta vehebant per flumen, Isauri quidem alimentorum copiis adfluebant, ipsi vero solitarum rerum cibos iam consumendo inediae propinquantis aerumnas exitialis horrebant.\r\n\r\nQuanta autem vis amicitiae sit, ex hoc intellegi maxime potest, quod ex infinita societate generis humani, quam conciliavit ipsa natura, ita contracta res est et adducta in angustum ut omnis caritas aut inter duos aut inter paucos iungeretur.\r\n\r\nUtque aegrum corpus quassari etiam levibus solet offensis, ita animus eius angustus et tener, quicquid increpuisset, ad salutis suae dispendium existimans factum aut cogitatum, insontium caedibus fecit victoriam luctuosam.', '2019-01-16 12:21:41', 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE `Users` (
  `Id` int(11) NOT NULL,
  `email` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `password` varchar(120) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `firstname` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `pseudo` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `role` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Users`
--

INSERT INTO `Users` (`Id`, `email`, `password`, `name`, `firstname`, `pseudo`, `role`) VALUES
(11, 'test3@mail.fr', '$2y$11$42d988dbe3eaa989f176fuk0AkbseDzPTQmJRoqPCMiDG9xBAiClC', 'RICHARD', 'Pierre', 'Pierrot', 'admin'),
(12, 'admin1@blog.fr', '$2y$11$7292b3e1db7345617c296uazPPg24emQSCCSpi5RqoQYa75k5VH4a', 'SUPER', 'Admin', 'admin', 'admin'),
(13, 'admin2@blog.fr', '$2y$11$69bcb511f340e49fc79e8u5mOR7Bgnq0gHlY8OC7moe70QdEdiQPy', 'SUPER 2', 'Admin 2', 'admin 2', 'admin'),
(14, 'user1@mail.fr', '$2y$11$c22a3217570ad8f23472fukmvjnhxrWDvY/NtC3pygU1DxyYDPdTW', 'PETIT', 'User', 'user', 'user');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Author`
--
ALTER TABLE `Author`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Comment`
--
ALTER TABLE `Comment`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Post`
--
ALTER TABLE `Post`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Author`
--
ALTER TABLE `Author`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `Category`
--
ALTER TABLE `Category`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `Comment`
--
ALTER TABLE `Comment`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `Post`
--
ALTER TABLE `Post`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
