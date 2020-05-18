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
-- Table structure for table `nabava`
--

DROP TABLE IF EXISTS `nabava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nabava` (
  `id_nabave` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oznaka_org_jed` varchar(15) NOT NULL,
  `oznaka_dobavljaca` varchar(15) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `napomena` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_nabave`),
  KEY `FK_dobavljac_nabava_idx` (`oznaka_dobavljaca`),
  KEY `FK_orgjed_nabava_idx` (`oznaka_org_jed`),
  CONSTRAINT `FK_dobavljac_nabava` FOREIGN KEY (`oznaka_dobavljaca`) REFERENCES `dobavljac` (`oznaka_dobavljaca`) ON UPDATE CASCADE,
  CONSTRAINT `FK_orgjed_nabava` FOREIGN KEY (`oznaka_org_jed`) REFERENCES `organizacijska_jedinica` (`oznaka_org_jed`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='podaci o nabavama';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nabava`
--

LOCK TABLES `nabava` WRITE;
/*!40000 ALTER TABLE `nabava` DISABLE KEYS */;
INSERT INTO `nabava` VALUES (1,'GRADRI','infop','2020-05-14','30 PC za g101 2 PC za djelatnike 10 monitora 20 tipkovnica 20 miševa 10 UTP kabela 3m');
/*!40000 ALTER TABLE `nabava` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-16 14:40:05
