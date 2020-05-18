-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: admingaleb
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `zahtjev`
--

DROP TABLE IF EXISTS `zahtjev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zahtjev` (
  `id_zahtjev` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_korisnik` int(10) unsigned DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `nacin_podnosenja` set('email','telefon','formalni sastanak',' dogovor') NOT NULL DEFAULT 'email',
  `opis` varchar(500) NOT NULL,
  `status` set('novi','preuzet','riješen','nerješiv') NOT NULL DEFAULT 'novi',
  `napomena` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_zahtjev`),
  KEY `FK_korisnik_zahtjev_idx` (`id_korisnik`),
  CONSTRAINT `FK_korisnik_zahtjev` FOREIGN KEY (`id_korisnik`) REFERENCES `korisnik` (`id_korisnik`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='zahtjevi korisnika';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zahtjev`
--

LOCK TABLES `zahtjev` WRITE;
/*!40000 ALTER TABLE `zahtjev` DISABLE KEYS */;
INSERT INTO `zahtjev` VALUES (1,4,'2020-05-14','email','Molim pripremu 30 novih računala za učionicu G101','novi',NULL),(2,1,'2020-05-14','email','Poštovani, molim Vas instalaciju Office na računalo u knjižnici','novi',NULL),(3,3,'2020-05-12','telefon','Računalo mi se gasi, ne mogu obračunati plaće za ovaj mjesec','novi',NULL),(4,2,'2020-05-10','email','Molim instalaciju Rhinocerosa na računalo u uredu i u učionici G101 radi održavanja radionice 1.6 lp','novi',NULL),(5,2,'2020-05-06',' dogovor','Prema dogovoru treba instalirati AutoCAD 2020 u G102','novi',NULL);
/*!40000 ALTER TABLE `zahtjev` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-16 14:40:09
