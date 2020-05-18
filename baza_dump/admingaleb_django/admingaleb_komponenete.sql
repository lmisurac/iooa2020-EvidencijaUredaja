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
-- Table structure for table `komponenete`
--

DROP TABLE IF EXISTS `komponenete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `komponenete` (
  `id_komponenete` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vrsta` varchar(45) DEFAULT NULL,
  `proizvodac` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `opis` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_komponenete`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Hardverske komponente ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komponenete`
--

LOCK TABLES `komponenete` WRITE;
/*!40000 ALTER TABLE `komponenete` DISABLE KEYS */;
INSERT INTO `komponenete` VALUES (1,'RAM','Kingston',' KVR13S9K2/16','Specs: DDR3, 1333MHz, Non-ECC, CL9, 1.5V, Unbuffered, SODIMM'),(2,'HDD','Western Digital','WD10EZEX ','WD Blue PC Desktop Hard Drive Capacity 1 TB Interface SATA Form Factor 3.5 Inch Cache Size 64 MB Disk Speed (RPM) 7200rpm Dimensions (L x W x H) 5.79\" x 4\" x 1.03\"'),(3,'napajanje PSU','Chieftec','APB-400B8','Maximum Load: 400W AC Input:230V / 4A Frequency:50 Hz'),(4,'matična ploča MB ','ASUS','ProArt Z490-CREATOR 10G','Intel® Z490 LGA 1200 ATX motherboard for content creators features a 10G LAN card, onboard 2.5G Intel LAN, dual Thunderbolt™ 3 Type-C ports, dual M.2, USB 3.2 Gen 2 ports, SATA 6 Gbps');
/*!40000 ALTER TABLE `komponenete` ENABLE KEYS */;
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
