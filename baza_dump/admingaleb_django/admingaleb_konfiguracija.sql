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
-- Table structure for table `konfiguracija`
--

DROP TABLE IF EXISTS `konfiguracija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konfiguracija` (
  `id_konfiguracija` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_komponente` int(10) unsigned DEFAULT NULL,
  `stanje` set('ispravno','upitno','kvar','zamjenjena') DEFAULT 'ispravno',
  `napomena` varchar(500) DEFAULT NULL,
  `id_uredaj` int(10) unsigned DEFAULT NULL,
  `id_radnje` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_konfiguracija`),
  KEY `FK_komponente_konfiguracija_idx` (`id_komponente`),
  KEY `FK_admin_radnje_konfiguracija_idx` (`id_radnje`),
  KEY `FK_uredaj_konfiguracija_idx` (`id_uredaj`),
  CONSTRAINT `FK_admin_radnje_konfiguracija` FOREIGN KEY (`id_radnje`) REFERENCES `admin_radnje` (`id_radnje`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_komponente_konfiguracija` FOREIGN KEY (`id_komponente`) REFERENCES `komponenete` (`id_komponenete`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_uredaj_konfiguracija` FOREIGN KEY (`id_uredaj`) REFERENCES `uredaj` (`id_uredaj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='komponente u uredaju';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konfiguracija`
--

LOCK TABLES `konfiguracija` WRITE;
/*!40000 ALTER TABLE `konfiguracija` DISABLE KEYS */;
/*!40000 ALTER TABLE `konfiguracija` ENABLE KEYS */;
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
