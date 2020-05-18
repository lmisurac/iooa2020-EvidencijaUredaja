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
-- Table structure for table `uredaj`
--

DROP TABLE IF EXISTS `uredaj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uredaj` (
  `id_uredaj` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vrsta` set('PC','Laptop','Printer/Scanner','Telefon','Switch','Ostalo') DEFAULT 'PC',
  `hostname_IP` varchar(45) DEFAULT NULL,
  `oznaka_prostorije` varchar(15) DEFAULT NULL,
  `id_korisnik` int(10) unsigned DEFAULT NULL,
  `napomena` varchar(500) DEFAULT NULL,
  `id_nabave` int(10) unsigned DEFAULT NULL,
  `istek_garancije` date DEFAULT NULL,
  `proizvodac` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_uredaj`),
  KEY `FK_prostorija_uredaj_idx` (`oznaka_prostorije`),
  KEY `FK_korisnik_uredaj_idx` (`id_korisnik`),
  KEY `FK_nabava_uredaj_idx` (`id_nabave`),
  CONSTRAINT `FK_korisnik_uredaj` FOREIGN KEY (`id_korisnik`) REFERENCES `korisnik` (`id_korisnik`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_nabava_uredaj` FOREIGN KEY (`id_nabave`) REFERENCES `nabava` (`id_nabave`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_prostorija_uredaj` FOREIGN KEY (`oznaka_prostorije`) REFERENCES `prostorija` (`oznaka_prostorije`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='podaci o uredajima\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uredaj`
--

LOCK TABLES `uredaj` WRITE;
/*!40000 ALTER TABLE `uredaj` DISABLE KEYS */;
INSERT INTO `uredaj` VALUES (1,'PC','GRA-G101-101','g101',4,NULL,1,'2021-05-14','Asus','ASUSPRO D641SC'),(2,'PC','GRA-G101-102','g101',4,NULL,1,'2021-05-14','Asus','ASUSPRO D641SC'),(3,'PC','GRA-G101-103','g101',4,NULL,1,'2021-05-14','Asus','ASUSPRO D641SC');
/*!40000 ALTER TABLE `uredaj` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-16 14:40:06
