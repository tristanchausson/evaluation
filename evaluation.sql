-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2018 at 11:56 AM
-- Server version: 5.7.22-0ubuntu18.04.1
-- PHP Version: 7.2.5-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evaluation`
--

-- --------------------------------------------------------

--
-- Table structure for table `Chambre`
--

CREATE TABLE `Chambre` (
  `idChambre` int(11) NOT NULL,
  `Nom` varchar(45) NOT NULL,
  `Superficie` int(11) NOT NULL,
  `Prix/nuitée` int(11) NOT NULL,
  `Type_de_chambre` tinyint(1) NOT NULL,
  `Acessibilité_PMR` tinyint(1) NOT NULL,
  `Type_de_lit` tinyint(1) NOT NULL,
  `Equipement_SDB` varchar(45) NOT NULL,
  `Situation_idSituation` int(11) NOT NULL,
  `Services_idServices` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Chambre`
--

INSERT INTO `Chambre` (`idChambre`, `Nom`, `Superficie`, `Prix/nuitée`, `Type_de_chambre`, `Acessibilité_PMR`, `Type_de_lit`, `Equipement_SDB`, `Situation_idSituation`, `Services_idServices`) VALUES
(1, 'Chambre 1', 20, 50, 0, 0, 0, 'Douche', 1, 1),
(2, 'Chambre 2', 200, 3000, 1, 1, 1, 'Douche + Baignoire', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE `Client` (
  `idClient` int(11) NOT NULL,
  `Nom` varchar(45) NOT NULL,
  `Prenom` varchar(45) NOT NULL,
  `Telephone` decimal(10,0) NOT NULL,
  `Mail` varchar(45) NOT NULL,
  `Adresse_postale` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Client`
--

INSERT INTO `Client` (`idClient`, `Nom`, `Prenom`, `Telephone`, `Mail`, `Adresse_postale`, `Password`) VALUES
(1, 'Chausson', 'Tristan', '606060606', 'tristan@chausson.fr', 'Ma rue 31000 Toulouse', 'mdp_de_tristan'),
(2, 'Chirac', 'Jacques', '707070707', 'jacques@chirac.fr', 'Une certaine rue 75000 Paris', 'mdp_de_l_ancien_president');

-- --------------------------------------------------------

--
-- Table structure for table `Cout`
--

CREATE TABLE `Cout` (
  `idCout` int(11) NOT NULL,
  `Prix_chambre` int(11) NOT NULL,
  `Prix_services` int(11) NOT NULL,
  `Client_idClient` int(11) NOT NULL,
  `Date_arrivee` date NOT NULL,
  `Date_depart` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Cout`
--

INSERT INTO `Cout` (`idCout`, `Prix_chambre`, `Prix_services`, `Client_idClient`, `Date_arrivee`, `Date_depart`) VALUES
(1, 50, 10, 1, '2018-06-08', '2018-06-10'),
(2, 3000, 500, 2, '2018-06-08', '2018-06-29');

-- --------------------------------------------------------

--
-- Table structure for table `gerant`
--

CREATE TABLE `gerant` (
  `idSuivi_commandes` int(11) NOT NULL,
  `idReservation` int(11) NOT NULL,
  `idCout` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gerant`
--

INSERT INTO `gerant` (`idSuivi_commandes`, `idReservation`, `idCout`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Reservation`
--

CREATE TABLE `Reservation` (
  `idReservation` int(11) NOT NULL,
  `Client` varchar(45) NOT NULL,
  `Chambre` varchar(45) NOT NULL,
  `Date_arrivee` date NOT NULL,
  `Date_depart` date NOT NULL,
  `Services` varchar(45) NOT NULL,
  `Etat` varchar(45) NOT NULL,
  `Cout_idCout` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Reservation`
--

INSERT INTO `Reservation` (`idReservation`, `Client`, `Chambre`, `Date_arrivee`, `Date_depart`, `Services`, `Etat`, `Cout_idCout`) VALUES
(1, 'Chausson', 'Chambre 1', '2018-06-08', '2018-06-10', 'Petit déjeuner', 'Payé', 1),
(2, 'Chirac', 'Chambre 2', '2018-06-08', '2018-06-29', 'Champagne', 'En cours', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Services`
--

CREATE TABLE `Services` (
  `idServices` int(11) NOT NULL,
  `Nom` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  `Catégorie` varchar(45) NOT NULL,
  `Prix` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Services`
--

INSERT INTO `Services` (`idServices`, `Nom`, `Description`, `Catégorie`, `Prix`) VALUES
(1, 'Petit Déjeuner', 'Petit déjeuner dans la chambre', 'Repas', 10),
(2, 'Mini Bar + Champagne', 'Petit déj + mini bar + bouteille de champagne', 'Spécial', 500);

-- --------------------------------------------------------

--
-- Table structure for table `Situation`
--

CREATE TABLE `Situation` (
  `idSituation` int(11) NOT NULL,
  `Etage` int(11) NOT NULL,
  `Vue` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Situation`
--

INSERT INTO `Situation` (`idSituation`, `Etage`, `Vue`) VALUES
(1, 1, 'Nord'),
(2, 2, 'Sud');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Chambre`
--
ALTER TABLE `Chambre`
  ADD PRIMARY KEY (`idChambre`,`Situation_idSituation`,`Services_idServices`),
  ADD UNIQUE KEY `Nom_UNIQUE` (`Nom`),
  ADD UNIQUE KEY `idChambre_UNIQUE` (`idChambre`),
  ADD KEY `fk_Chambre_Situation1_idx` (`Situation_idSituation`),
  ADD KEY `fk_Chambre_Services1_idx` (`Services_idServices`);

--
-- Indexes for table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`idClient`),
  ADD UNIQUE KEY `idClient_UNIQUE` (`idClient`),
  ADD UNIQUE KEY `Nom_UNIQUE` (`Nom`),
  ADD UNIQUE KEY `Telephone_UNIQUE` (`Telephone`),
  ADD UNIQUE KEY `Mail_UNIQUE` (`Mail`),
  ADD UNIQUE KEY `Adresse_postale_UNIQUE` (`Adresse_postale`);

--
-- Indexes for table `Cout`
--
ALTER TABLE `Cout`
  ADD PRIMARY KEY (`idCout`,`Client_idClient`),
  ADD UNIQUE KEY `idCout_UNIQUE` (`idCout`),
  ADD KEY `fk_Cout_Chambre1_idx` (`Prix_chambre`),
  ADD KEY `fk_Cout_2_idx` (`Prix_services`),
  ADD KEY `fk_Cout_Client1_idx` (`Client_idClient`),
  ADD KEY `fk_Cout_1_idx` (`Date_arrivee`),
  ADD KEY `fk_Cout_3_idx` (`Date_depart`);

--
-- Indexes for table `gerant`
--
ALTER TABLE `gerant`
  ADD PRIMARY KEY (`idSuivi_commandes`),
  ADD UNIQUE KEY `idSuivi_commandes_UNIQUE` (`idSuivi_commandes`),
  ADD UNIQUE KEY `Reservation_UNIQUE` (`idReservation`);

--
-- Indexes for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`idReservation`,`Cout_idCout`),
  ADD UNIQUE KEY `idReservation_UNIQUE` (`idReservation`),
  ADD KEY `fk_Reservation_1_idx` (`Client`),
  ADD KEY `fk_Reservation_3_idx` (`Services`),
  ADD KEY `fk_Reservation_Cout1_idx` (`Cout_idCout`);

--
-- Indexes for table `Services`
--
ALTER TABLE `Services`
  ADD PRIMARY KEY (`idServices`),
  ADD UNIQUE KEY `idServices_UNIQUE` (`idServices`),
  ADD UNIQUE KEY `Nom_UNIQUE` (`Nom`),
  ADD UNIQUE KEY `Description_UNIQUE` (`Description`);

--
-- Indexes for table `Situation`
--
ALTER TABLE `Situation`
  ADD PRIMARY KEY (`idSituation`),
  ADD UNIQUE KEY `idSituation_UNIQUE` (`idSituation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Chambre`
--
ALTER TABLE `Chambre`
  MODIFY `idChambre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Client`
--
ALTER TABLE `Client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Cout`
--
ALTER TABLE `Cout`
  MODIFY `idCout` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gerant`
--
ALTER TABLE `gerant`
  MODIFY `idSuivi_commandes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `idReservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Services`
--
ALTER TABLE `Services`
  MODIFY `idServices` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Situation`
--
ALTER TABLE `Situation`
  MODIFY `idSituation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Chambre`
--
ALTER TABLE `Chambre`
  ADD CONSTRAINT `fk_Chambre_Services1` FOREIGN KEY (`Services_idServices`) REFERENCES `Services` (`idServices`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Chambre_Situation1` FOREIGN KEY (`Situation_idSituation`) REFERENCES `Situation` (`idSituation`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
