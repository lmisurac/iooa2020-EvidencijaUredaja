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
-- Table structure for table `programi`
--

DROP TABLE IF EXISTS `programi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programi` (
  `id_programa` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `naziv_programa` varchar(45) NOT NULL,
  `proizvodac` varchar(45) DEFAULT NULL,
  `licenca` varchar(45) DEFAULT NULL,
  `napomena` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_programa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='informacije o programima';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programi`
--

LOCK TABLES `programi` WRITE;
/*!40000 ALTER TABLE `programi` DISABLE KEYS */;
INSERT INTO `programi` VALUES (1,'Windows 10 Education','Miscrosoft','msref','OS'),(2,'Office 2016 Education','Miscrosoft','msref',NULL),(3,'AutoCAD 2020','Autodesk','multiuser','Serrial number iz datoteke'),(4,'Rhinoceros 5','McNeil','mrežna',' licenčni server zoo.uniri.hr 10.1.1.101 ističe 1.4.2022'),(5,'Notepad ++','Don Ho','freeware','https://notepad-plus-plus.org/downloads/ '),(6,'Linux Mint',NULL,'freeware','OS https://www.linuxmint.com/ ');
/*!40000 ALTER TABLE `programi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-16 14:40:10
