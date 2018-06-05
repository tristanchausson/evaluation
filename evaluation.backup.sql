-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: evaluation
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Chambre`
--

DROP TABLE IF EXISTS `Chambre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Chambre` (
  `idChambre` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) NOT NULL,
  `Superficie` int(11) NOT NULL,
  `Prix/nuitée` int(11) NOT NULL,
  `Type_de_chambre` tinyint(1) NOT NULL,
  `Acessibilité_PMR` tinyint(1) NOT NULL,
  `Type_de_lit` tinyint(1) NOT NULL,
  `Equipement_SDB` varchar(45) NOT NULL,
  `Situation_idSituation` int(11) NOT NULL,
  `Services_idServices` int(11) NOT NULL,
  PRIMARY KEY (`idChambre`,`Situation_idSituation`,`Services_idServices`),
  UNIQUE KEY `Nom_UNIQUE` (`Nom`),
  UNIQUE KEY `idChambre_UNIQUE` (`idChambre`),
  KEY `fk_Chambre_Situation1_idx` (`Situation_idSituation`),
  KEY `fk_Chambre_Services1_idx` (`Services_idServices`),
  CONSTRAINT `fk_Chambre_Services1` FOREIGN KEY (`Services_idServices`) REFERENCES `Services` (`idServices`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Chambre_Situation1` FOREIGN KEY (`Situation_idSituation`) REFERENCES `Situation` (`idSituation`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chambre`
--

LOCK TABLES `Chambre` WRITE;
/*!40000 ALTER TABLE `Chambre` DISABLE KEYS */;
INSERT INTO `Chambre` VALUES (1,'Chambre 1',20,50,0,0,0,'Douche',1,1),(2,'Chambre 2',200,3000,1,1,1,'Douche + Baignoire',2,2);
/*!40000 ALTER TABLE `Chambre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) NOT NULL,
  `Prenom` varchar(45) NOT NULL,
  `Telephone` decimal(10,0) NOT NULL,
  `Mail` varchar(45) NOT NULL,
  `Adresse_postale` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `idClient_UNIQUE` (`idClient`),
  UNIQUE KEY `Nom_UNIQUE` (`Nom`),
  UNIQUE KEY `Telephone_UNIQUE` (`Telephone`),
  UNIQUE KEY `Mail_UNIQUE` (`Mail`),
  UNIQUE KEY `Adresse_postale_UNIQUE` (`Adresse_postale`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (1,'Chausson','Tristan',606060606,'tristan@chausson.fr','Ma rue 31000 Toulouse','mdp_de_tristan'),(2,'Chirac','Jacques',707070707,'jacques@chirac.fr','Une certaine rue 75000 Paris','mdp_de_l_ancien_president');
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cout`
--

DROP TABLE IF EXISTS `Cout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cout` (
  `idCout` int(11) NOT NULL AUTO_INCREMENT,
  `Prix_chambre` int(11) NOT NULL,
  `Prix_services` int(11) NOT NULL,
  `Client_idClient` int(11) NOT NULL,
  `Date_arrivee` date NOT NULL,
  `Date_depart` date NOT NULL,
  PRIMARY KEY (`idCout`,`Client_idClient`),
  UNIQUE KEY `idCout_UNIQUE` (`idCout`),
  KEY `fk_Cout_Chambre1_idx` (`Prix_chambre`),
  KEY `fk_Cout_2_idx` (`Prix_services`),
  KEY `fk_Cout_Client1_idx` (`Client_idClient`),
  KEY `fk_Cout_1_idx` (`Date_arrivee`),
  KEY `fk_Cout_3_idx` (`Date_depart`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cout`
--

LOCK TABLES `Cout` WRITE;
/*!40000 ALTER TABLE `Cout` DISABLE KEYS */;
INSERT INTO `Cout` VALUES (1,50,10,1,'2018-06-08','2018-06-10'),(2,3000,500,2,'2018-06-08','2018-06-29');
/*!40000 ALTER TABLE `Cout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reservation` (
  `idReservation` int(11) NOT NULL AUTO_INCREMENT,
  `Client` varchar(45) NOT NULL,
  `Chambre` varchar(45) NOT NULL,
  `Date_arrivee` date NOT NULL,
  `Date_depart` date NOT NULL,
  `Services` varchar(45) NOT NULL,
  `Etat` varchar(45) NOT NULL,
  `Cout_idCout` int(11) NOT NULL,
  PRIMARY KEY (`idReservation`,`Cout_idCout`),
  UNIQUE KEY `idReservation_UNIQUE` (`idReservation`),
  KEY `fk_Reservation_1_idx` (`Client`),
  KEY `fk_Reservation_3_idx` (`Services`),
  KEY `fk_Reservation_Cout1_idx` (`Cout_idCout`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES (1,'Chausson','Chambre 1','2018-06-08','2018-06-10','Petit déjeuner','Payé',1),(2,'Chirac','Chambre 2','2018-06-08','2018-06-29','Champagne','En cours',2);
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Services`
--

DROP TABLE IF EXISTS `Services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Services` (
  `idServices` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  `Catégorie` varchar(45) NOT NULL,
  `Prix` int(11) NOT NULL,
  PRIMARY KEY (`idServices`),
  UNIQUE KEY `idServices_UNIQUE` (`idServices`),
  UNIQUE KEY `Nom_UNIQUE` (`Nom`),
  UNIQUE KEY `Description_UNIQUE` (`Description`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Services`
--

LOCK TABLES `Services` WRITE;
/*!40000 ALTER TABLE `Services` DISABLE KEYS */;
INSERT INTO `Services` VALUES (1,'Petit Déjeuner','Petit déjeuner dans la chambre','Repas',10),(2,'Mini Bar + Champagne','Petit déj + mini bar + bouteille de champagne','Spécial',500);
/*!40000 ALTER TABLE `Services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Situation`
--

DROP TABLE IF EXISTS `Situation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Situation` (
  `idSituation` int(11) NOT NULL AUTO_INCREMENT,
  `Etage` int(11) NOT NULL,
  `Vue` varchar(45) NOT NULL,
  PRIMARY KEY (`idSituation`),
  UNIQUE KEY `idSituation_UNIQUE` (`idSituation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Situation`
--

LOCK TABLES `Situation` WRITE;
/*!40000 ALTER TABLE `Situation` DISABLE KEYS */;
INSERT INTO `Situation` VALUES (1,1,'Nord'),(2,2,'Sud');
/*!40000 ALTER TABLE `Situation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerant`
--

DROP TABLE IF EXISTS `gerant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gerant` (
  `idSuivi_commandes` int(11) NOT NULL AUTO_INCREMENT,
  `idReservation` int(11) NOT NULL,
  `idCout` int(11) NOT NULL,
  PRIMARY KEY (`idSuivi_commandes`),
  UNIQUE KEY `idSuivi_commandes_UNIQUE` (`idSuivi_commandes`),
  UNIQUE KEY `Reservation_UNIQUE` (`idReservation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerant`
--

LOCK TABLES `gerant` WRITE;
/*!40000 ALTER TABLE `gerant` DISABLE KEYS */;
INSERT INTO `gerant` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `gerant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-05 15:32:50
