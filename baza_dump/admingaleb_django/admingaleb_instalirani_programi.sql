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
-- Table structure for table `instalirani_programi`
--

DROP TABLE IF EXISTS `instalirani_programi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instalirani_programi` (
  `id_programa` int(10) unsigned NOT NULL,
  `id_uredaj` int(10) unsigned NOT NULL,
  `id_radnje` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_programa`,`id_uredaj`),
  KEY `FK_admin_radnje_instalirani_programi_idx` (`id_radnje`),
  KEY `FK_uredaj_instalirani_programi_idx` (`id_uredaj`),
  KEY `FK_uredaj_instalirani_programi_id` (`id_uredaj`),
  CONSTRAINT `FK_admin_radnje_instalirani_programi` FOREIGN KEY (`id_radnje`) REFERENCES `admin_radnje` (`id_radnje`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_program_instalirani_programi` FOREIGN KEY (`id_programa`) REFERENCES `programi` (`id_programa`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_uredaj_instalirani_programi` FOREIGN KEY (`id_uredaj`) REFERENCES `uredaj` (`id_uredaj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='programi na uredaju';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instalirani_programi`
--

LOCK TABLES `instalirani_programi` WRITE;
/*!40000 ALTER TABLE `instalirani_programi` DISABLE KEYS */;
/*!40000 ALTER TABLE `instalirani_programi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-16 14:40:04
