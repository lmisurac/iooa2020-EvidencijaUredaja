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
-- Table structure for table `odjel`
--

DROP TABLE IF EXISTS `odjel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odjel` (
  `oznaka_odjela` varchar(15) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `oznaka_org_jed` varchar(45) NOT NULL,
  PRIMARY KEY (`oznaka_odjela`),
  KEY `FK_organizacijska_jedinica_idx` (`oznaka_org_jed`),
  CONSTRAINT `FK_organizacijska_jedinica_odjel` FOREIGN KEY (`oznaka_org_jed`) REFERENCES `organizacijska_jedinica` (`oznaka_org_jed`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Podaci o odjelima unutar organizacijskih jedinica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odjel`
--

LOCK TABLES `odjel` WRITE;
/*!40000 ALTER TABLE `odjel` DISABLE KEYS */;
INSERT INTO `odjel` VALUES ('FFGER','Odjel za germanistiku','FFRI'),('FFPU','Odjel za povijest umjetnosti','FFRI'),('GFDKN','Dekanat Građevinskog fakulteta','GRADRI'),('GFKNJZ','Knjižnica Građevinski fakultet','GRADRI'),('GFKOG','Katedra za organizaciju građenja','GRADRI'),('GFRCN','Računovodstvo','GRADRI'),('GFZNK','Zavod za nosive konstrukcije','GRADRI'),('OIZRCN','Zavod za računarstvo','SOIRI');
/*!40000 ALTER TABLE `odjel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-16 14:40:08
