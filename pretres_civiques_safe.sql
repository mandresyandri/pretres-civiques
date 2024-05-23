-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : jeu. 23 mai 2024 à 21:18
-- Version du serveur : 8.1.0
-- Version de PHP : 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pretres_civiques`
--

-- --------------------------------------------------------

--
-- Structure de la table `apparaitre`
--

CREATE TABLE `apparaitre` (
  `id_cite` int NOT NULL,
  `id_source` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `cite`
--

CREATE TABLE `cite` (
  `id_cite` int NOT NULL,
  `nom_cite` varchar(255) DEFAULT NULL,
  `lattitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `lien_pleiade` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `cite`
--

INSERT INTO `cite` (`id_cite`, `nom_cite`, `lattitude`, `longitude`, `lien_pleiade`) VALUES
(0, 'Silandos', NULL, NULL, NULL),
(1, 'Cos', 36.891500, 27.287800, 'https://pleiades.stoa.org/places/599836'),
(2, 'Ténos', 37.538501, 25.161702, 'https://pleiades.stoa.org/places/590073'),
(3, 'Siphnos', 36.979812, 24.680141, 'https://pleiades.stoa.org/places/590049'),
(4, 'Stectorium', 38.332362, 30.148649, 'https://pleiades.stoa.org/places/609535'),
(5, 'Rhodes', 36.443113, 28.227611, 'https://pleiades.stoa.org/places/590030'),
(6, 'Théra', 36.363279, 25.478430, 'https://pleiades.stoa.org/places/599971'),
(7, 'Silandos', NULL, NULL, NULL),
(8, 'Cyzique', NULL, NULL, NULL),
(9, 'Hiérapolis', NULL, NULL, NULL),
(10, 'Apamée du Méandre', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `corpus`
--

CREATE TABLE `corpus` (
  `id_corpus` int NOT NULL,
  `nom_corpus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `datation`
--

CREATE TABLE `datation` (
  `nom_datation` varchar(255) NOT NULL,
  `debut` varchar(255) DEFAULT NULL,
  `fin` varchar(255) DEFAULT NULL,
  `is_periode` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `datation`
--

INSERT INTO `datation` (`nom_datation`, `debut`, `fin`, `is_periode`) VALUES
('Époque impériale', '1', '10', 0),
('Fin du IIe / début du IIIe siècle après J.-C.', '11', '20', 1),
('Fin du IIe siècle - premier tiers du IIIe siècle après J.-C.', NULL, NULL, 1),
('Philippe l\\’Arabe', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `mentionner`
--

CREATE TABLE `mentionner` (
  `id_pretre` int NOT NULL,
  `id_source` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `pretre`
--

CREATE TABLE `pretre` (
  `id_pretre` int NOT NULL,
  `nom_grec` varchar(255) DEFAULT NULL,
  `nom_traduit` varchar(255) DEFAULT NULL,
  `presentation_p` text,
  `commentaires_p` text,
  `nom_datation` varchar(255) DEFAULT NULL,
  `nom_pretrise` varchar(255) DEFAULT NULL,
  `nom_cite` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `pretre`
--

INSERT INTO `pretre` (`id_pretre`, `nom_grec`, `nom_traduit`, `presentation_p`, `commentaires_p`, `nom_datation`, `nom_pretrise`, `nom_cite`) VALUES
(19, 'Π. Τρέβιος Φιλέρως', 'Trebius Philerus', 'P. Trebius Philerus a été grand-prêtre et stéphanéphore. Il apparaît sur un fragment d\'inscription, peut-être son épitaphe. Il n\'existe pas d\'élément de datationa. Le gentilice Trebius est attesté également à Délos , il peut s\'agir d\'une famille d\'Italiens installés dans le bassin égéen depuis l\'époque républicaine.', 'a Il est sans doute apparenté à P. Trebius Alaphais, prêtre d\'Apollon à la fin du Ier siècle avant J.-C. (IGR 4, 1101, l. 23).', 'Époque impériale', 'ἀρχιερεύς', 1),
(89, 'Ἰούλιος [-]', 'Iulius [-]', 'Ce grand-prêtre n\\’est connu que par une statue du fondateur mythique Cyzikos, datée par l\\’archontat de son fils C. Iulius Seleucus. L\\’inscription date de la fin du IIe ou du début du IIIe siècle. La famille, qui a la citoyenneté romaine depuis l\\’époque augustéenne au moins, n\\’est pas connue.', NULL, 'Fin du IIe / début du IIIe siècle après J.-C.', 'ἀρχιερεύς', 8),
(222, 'Γ. Ἰούλιος Aἰλιανὸς', 'Iulius Aelianus', 'C. Iulius Aelianus, grand-prêtre, stéphanéphorea et agonothète, est honoré d\\’une statue par le Conseil, le peuple, et les artistes itinérants (peripolistikai). Il a exercé « toutes les archai et philotimiai » : ce terme désignant la générosité, fréquent à l\\’époque impériale, remplace l\\’habituelle référence aux liturgies aux côtés des magistratures (1). Il est sans doute le père d\\’un monétaire homonyme de l\\’époque de Sévère Alexandre, « fils de grand-prêtre » (2). La famille n\\’est pas connue par ailleurs, mais a reçu la citoyenneté romaine dès l\\’époque augustéenne ou tibérienne.', NULL, 'Fin du IIe siècle - premier tiers du IIIe siècle après J.-C.', 'ἀρχιερεύς', 7),
(432, 'Μ. Aὐρήλιος Ἀλεξάνδρος', 'Aurelius Alexander', 'M. Aurelius Alexander fils d\'Alexander apparaît sur des monnaies de l\'époque de Philippe l\'Arabe. Au moins huit types monétaires différents portent sa signature, formant un programme iconographique riche se référant à la fois à la mythologie locale et à un contexte agonistique auquel l\'émission monétaire peut être liée.', NULL, 'Philippe l\\’Arabe', 'ἀρχιερεύς', 10),
(444, 'Ζεύξις', 'Zeuxis', 'Zeuxis et Iulianè, grands-prêtres, sont connus par l\'inscription gravée sur leur tombeau par leur fille Zeuxianè et leur petite-fille Modesta. Ils portent des noms très fréquents et il n\'est donc pas possible de les rattacher à une famille de Hiérapolisa. Aucun élément de datation n\'est conservé.', 'a Voir par exemple un autre couple constitué par un Zeuxis et une Iulianè dans Alt.v.Hierapolis 150, également connu par une épitaphe, ou encore Flavius Zeuxis à la fin du Ier siècle. (Syll3, 1229).', 'Époque impériale', 'ἀρχιερεύς', 9);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `pretres_civiques_obt`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `pretres_civiques_obt` (
`cite_lattitude` decimal(9,6)
,`cite_lien_pleiade` varchar(255)
,`cite_longitude` decimal(9,6)
,`cite_nom_cite` varchar(255)
,`commentaires_p` text
,`contenu_source` varchar(255)
,`contenu_traduit` varchar(255)
,`datation_debut` varchar(255)
,`datation_fin` varchar(255)
,`datation_is_periode` tinyint(1)
,`id_corpus` int
,`id_pretre` int
,`id_source` int
,`lien_corpus` varchar(255)
,`nom_corpus` varchar(255)
,`nom_datation` varchar(255)
,`nom_grec` varchar(255)
,`nom_pretrise` varchar(255)
,`nom_source` varchar(255)
,`nom_traduit` varchar(255)
,`presentation_p` text
,`pretre_associe` int
,`pretre_nom_cite` int
,`source_nom_cite` int
,`type_source` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure de la table `regrouper`
--

CREATE TABLE `regrouper` (
  `id_source` int NOT NULL,
  `id_corpus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `source`
--

CREATE TABLE `source` (
  `id_source` int NOT NULL,
  `type_source` varchar(255) DEFAULT NULL,
  `nom_source` varchar(255) DEFAULT NULL,
  `contenu_source` varchar(255) DEFAULT NULL,
  `contenu_traduit` varchar(255) DEFAULT NULL,
  `nom_cite` int DEFAULT NULL,
  `lien_corpus` varchar(255) DEFAULT NULL,
  `pretre_associe` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `source`
--

INSERT INTO `source` (`id_source`, `type_source`, `nom_source`, `contenu_source`, `contenu_traduit`, `nom_cite`, `lien_corpus`, `pretre_associe`) VALUES
(1, 'Dédicace d\'un bâtiment', 'AA 1903, p. 193-194', 'Γαίος Στερτίνιος | Ἡρακλείτου υἱὸς | Ξενοφῶν φιλόκαι|σαρ, ἱερεὺς Ἀσκλα|πιοῦ, Ὑγείας, Ἀπι|όνας καὶ τῶν Σε|βαστῶν, τοῖ(ς) Σε|βαστοῖς καὶ τῷ | δάμωι ἐκ τῶν ἰ[δί]|ων τὰν βυ̣[βλιοθήκαν ?].', 'C. Stertinius Xénophon, fils d\'Heracleitus, philocésar, prêtre d\'Asclépios, d\'Hygie, d\'Épione et des Augustes, (a dédié) aux Augustes et au peuple la [bibliothèque ?], à ses frais.', NULL, NULL, NULL),
(2, 'Inscription funéraire', 'Alt.v.Hierapolis 118', 'l. 3-4 : [Μ.] Aὐρ(ηλίου) Διονυσίου Ἀρτεμωνιανοῦ τοῦ κρατίστου, ἀρχιερέω<ς>, καὶ τῆς γυναικὸς αὐτοῦ Τιβ(ερίας) Κλ(αυδίας) Ἀντωνίας Φιρμείνης, ἀρχιερείης.', NULL, NULL, NULL, NULL),
(3, 'Inscription funéraire', 'Alt.v.Hierapolis 234', 'l. 1 : Τιβ(ερίου) Κλ(αυδίου) Κλέωνος ἀρχιερέως', NULL, NULL, NULL, NULL),
(4, 'Inscription funéraire', 'Alt.v.Hierapolis 261 (IGR 4, 839)', 'l. 3-4 : Ζεύξιδος ἀρχιερέως καὶ Ἰουλιανῆς ἀρχιε|ρείας.', NULL, NULL, NULL, NULL),
(5, 'Inscription honorifique des cardeurs de laine', 'Alt.v.Hierapolis 40 (IGR 4, 821)', 'Ἠ σεμνοτάτη | ἐργασία τῶν | ἐριοπλυτῶν | Τιβ(έριον) Κ[λ(αύδιον) Ζω]|τικὸν [Bοᾶ] | τὸν (π)ρῶ[τον] | στρατηγ[ὸν] | καὶ φιλό[τει]|μον ἀγω[νο]|θέτην καὶ [γρα]|ματέα να[ῶν] | τῶν ἐν Ἀσί[ᾳ] | καὶ πρεσβε[υ]|τὴν ἔνδοξο[ν] | καὶ ἀρχιερέα, | εὐεργέτην | τῆς πατρίδο', 'La très vénérable association des laveurs de laine honore Ti. Claudius Zoticus, fils de Boas, premier stratège, agonothète dévoué, secrétaire des temples d\'Asie, illustre ambassadeur, grand-prêtre, bienfaiteur de la patrie.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la vue `pretres_civiques_obt`
--
DROP TABLE IF EXISTS `pretres_civiques_obt`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `pretres_civiques_obt`  AS SELECT `pretre`.`id_pretre` AS `id_pretre`, `pretre`.`nom_grec` AS `nom_grec`, `pretre`.`nom_traduit` AS `nom_traduit`, `pretre`.`presentation_p` AS `presentation_p`, `pretre`.`commentaires_p` AS `commentaires_p`, `pretre`.`nom_datation` AS `nom_datation`, `datation`.`debut` AS `datation_debut`, `datation`.`fin` AS `datation_fin`, `datation`.`is_periode` AS `datation_is_periode`, `pretre`.`nom_pretrise` AS `nom_pretrise`, `pretre`.`nom_cite` AS `pretre_nom_cite`, `cite`.`nom_cite` AS `cite_nom_cite`, `cite`.`lattitude` AS `cite_lattitude`, `cite`.`longitude` AS `cite_longitude`, `cite`.`lien_pleiade` AS `cite_lien_pleiade`, `source`.`id_source` AS `id_source`, `source`.`type_source` AS `type_source`, `source`.`nom_source` AS `nom_source`, `source`.`contenu_source` AS `contenu_source`, `source`.`contenu_traduit` AS `contenu_traduit`, `source`.`nom_cite` AS `source_nom_cite`, `source`.`lien_corpus` AS `lien_corpus`, `source`.`pretre_associe` AS `pretre_associe`, `corpus`.`id_corpus` AS `id_corpus`, `corpus`.`nom_corpus` AS `nom_corpus` FROM ((((((`pretre` left join `datation` on((`pretre`.`nom_datation` = `datation`.`nom_datation`))) left join `cite` on((`pretre`.`nom_cite` = `cite`.`id_cite`))) left join `mentionner` on((`pretre`.`id_pretre` = `mentionner`.`id_pretre`))) left join `source` on((`mentionner`.`id_source` = `source`.`id_source`))) left join `regrouper` on((`source`.`id_source` = `regrouper`.`id_source`))) left join `corpus` on((`regrouper`.`id_corpus` = `corpus`.`id_corpus`))) ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `apparaitre`
--
ALTER TABLE `apparaitre`
  ADD PRIMARY KEY (`id_cite`,`id_source`),
  ADD KEY `id_source` (`id_source`);

--
-- Index pour la table `cite`
--
ALTER TABLE `cite`
  ADD PRIMARY KEY (`id_cite`);

--
-- Index pour la table `corpus`
--
ALTER TABLE `corpus`
  ADD PRIMARY KEY (`id_corpus`);

--
-- Index pour la table `datation`
--
ALTER TABLE `datation`
  ADD PRIMARY KEY (`nom_datation`);

--
-- Index pour la table `mentionner`
--
ALTER TABLE `mentionner`
  ADD PRIMARY KEY (`id_pretre`,`id_source`),
  ADD KEY `id_source` (`id_source`);

--
-- Index pour la table `pretre`
--
ALTER TABLE `pretre`
  ADD PRIMARY KEY (`id_pretre`),
  ADD UNIQUE KEY `nom_grec` (`nom_grec`),
  ADD KEY `nom_datation` (`nom_datation`),
  ADD KEY `nom_pretrise` (`nom_pretrise`),
  ADD KEY `nom_cite` (`nom_cite`);

--
-- Index pour la table `regrouper`
--
ALTER TABLE `regrouper`
  ADD PRIMARY KEY (`id_source`,`id_corpus`),
  ADD KEY `id_corpus` (`id_corpus`);

--
-- Index pour la table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id_source`),
  ADD KEY `nom_cite` (`nom_cite`),
  ADD KEY `pretre_associe` (`pretre_associe`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `apparaitre`
--
ALTER TABLE `apparaitre`
  ADD CONSTRAINT `apparaitre_ibfk_1` FOREIGN KEY (`id_cite`) REFERENCES `cite` (`id_cite`),
  ADD CONSTRAINT `apparaitre_ibfk_2` FOREIGN KEY (`id_source`) REFERENCES `source` (`id_source`);

--
-- Contraintes pour la table `mentionner`
--
ALTER TABLE `mentionner`
  ADD CONSTRAINT `mentionner_ibfk_1` FOREIGN KEY (`id_pretre`) REFERENCES `pretre` (`id_pretre`),
  ADD CONSTRAINT `mentionner_ibfk_2` FOREIGN KEY (`id_source`) REFERENCES `source` (`id_source`);

--
-- Contraintes pour la table `pretre`
--
ALTER TABLE `pretre`
  ADD CONSTRAINT `pretre_ibfk_1` FOREIGN KEY (`nom_datation`) REFERENCES `datation` (`nom_datation`),
  ADD CONSTRAINT `pretre_ibfk_3` FOREIGN KEY (`nom_cite`) REFERENCES `cite` (`id_cite`);

--
-- Contraintes pour la table `regrouper`
--
ALTER TABLE `regrouper`
  ADD CONSTRAINT `regrouper_ibfk_1` FOREIGN KEY (`id_source`) REFERENCES `source` (`id_source`),
  ADD CONSTRAINT `regrouper_ibfk_2` FOREIGN KEY (`id_corpus`) REFERENCES `corpus` (`id_corpus`);

--
-- Contraintes pour la table `source`
--
ALTER TABLE `source`
  ADD CONSTRAINT `source_ibfk_1` FOREIGN KEY (`nom_cite`) REFERENCES `cite` (`id_cite`),
  ADD CONSTRAINT `source_ibfk_2` FOREIGN KEY (`pretre_associe`) REFERENCES `pretre` (`id_pretre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
