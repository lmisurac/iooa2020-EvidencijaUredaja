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
-- Table structure for table `prostorija`
--

DROP TABLE IF EXISTS `prostorija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prostorija` (
  `oznaka_prostorije` varchar(15) NOT NULL,
  `oznaka_zgrade` varchar(15) NOT NULL,
  `kat` int(11) DEFAULT NULL,
  `namjena` varchar(45) DEFAULT NULL,
  `napomena` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`oznaka_prostorije`),
  KEY `FK_zgrada_prostorija_idx` (`oznaka_zgrade`),
  CONSTRAINT `FK_zgrada_prostorija` FOREIGN KEY (`oznaka_zgrade`) REFERENCES `zgrada` (`oznaka_zgrade`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prostorija`
--

LOCK TABLES `prostorija` WRITE;
/*!40000 ALTER TABLE `prostorija` DISABLE KEYS */;
INSERT INTO `prostorija` VALUES ('g001','ZGF',0,'ured dekana','obavezna najava'),('g002','ZGF',0,'ured prodekana',NULL),('g010','ZGF',0,'knjižnica','radno vrijeme pon-sri 8h-16h cet pet 12h-20h '),('g101','ZGF',1,'računalna učionica','ulazak sa karticom'),('g102','ZGF',1,'učionica','1 laptop i projektor otključana'),('g201','ZGF',2,'računovodstvo ured',NULL),('g301','ZGF',3,'kabinet profesora',NULL);
/*!40000 ALTER TABLE `prostorija` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-16 14:40:07
