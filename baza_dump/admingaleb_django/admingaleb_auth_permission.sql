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
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add admin radnje',7,'add_adminradnje'),(26,'Can change admin radnje',7,'change_adminradnje'),(27,'Can delete admin radnje',7,'delete_adminradnje'),(28,'Can view admin radnje',7,'view_adminradnje'),(29,'Can add dobavljac',8,'add_dobavljac'),(30,'Can change dobavljac',8,'change_dobavljac'),(31,'Can delete dobavljac',8,'delete_dobavljac'),(32,'Can view dobavljac',8,'view_dobavljac'),(33,'Can add komponenete',9,'add_komponenete'),(34,'Can change komponenete',9,'change_komponenete'),(35,'Can delete komponenete',9,'delete_komponenete'),(36,'Can view komponenete',9,'view_komponenete'),(37,'Can add konfiguracija',10,'add_konfiguracija'),(38,'Can change konfiguracija',10,'change_konfiguracija'),(39,'Can delete konfiguracija',10,'delete_konfiguracija'),(40,'Can view konfiguracija',10,'view_konfiguracija'),(41,'Can add korisnik',11,'add_korisnik'),(42,'Can change korisnik',11,'change_korisnik'),(43,'Can delete korisnik',11,'delete_korisnik'),(44,'Can view korisnik',11,'view_korisnik'),(45,'Can add nabava',12,'add_nabava'),(46,'Can change nabava',12,'change_nabava'),(47,'Can delete nabava',12,'delete_nabava'),(48,'Can view nabava',12,'view_nabava'),(49,'Can add odjel',13,'add_odjel'),(50,'Can change odjel',13,'change_odjel'),(51,'Can delete odjel',13,'delete_odjel'),(52,'Can view odjel',13,'view_odjel'),(53,'Can add organizacijska jedinica',14,'add_organizacijskajedinica'),(54,'Can change organizacijska jedinica',14,'change_organizacijskajedinica'),(55,'Can delete organizacijska jedinica',14,'delete_organizacijskajedinica'),(56,'Can view organizacijska jedinica',14,'view_organizacijskajedinica'),(57,'Can add programi',15,'add_programi'),(58,'Can change programi',15,'change_programi'),(59,'Can delete programi',15,'delete_programi'),(60,'Can view programi',15,'view_programi'),(61,'Can add prostorija',16,'add_prostorija'),(62,'Can change prostorija',16,'change_prostorija'),(63,'Can delete prostorija',16,'delete_prostorija'),(64,'Can view prostorija',16,'view_prostorija'),(65,'Can add uredaj',17,'add_uredaj'),(66,'Can change uredaj',17,'change_uredaj'),(67,'Can delete uredaj',17,'delete_uredaj'),(68,'Can view uredaj',17,'view_uredaj'),(69,'Can add zahtjev',18,'add_zahtjev'),(70,'Can change zahtjev',18,'change_zahtjev'),(71,'Can delete zahtjev',18,'delete_zahtjev'),(72,'Can view zahtjev',18,'view_zahtjev'),(73,'Can add zgrada',19,'add_zgrada'),(74,'Can change zgrada',19,'change_zgrada'),(75,'Can delete zgrada',19,'delete_zgrada'),(76,'Can view zgrada',19,'view_zgrada'),(77,'Can add admin ovlasti',20,'add_adminovlasti'),(78,'Can change admin ovlasti',20,'change_adminovlasti'),(79,'Can delete admin ovlasti',20,'delete_adminovlasti'),(80,'Can view admin ovlasti',20,'view_adminovlasti'),(81,'Can add instalirani programi',21,'add_instaliraniprogrami'),(82,'Can change instalirani programi',21,'change_instaliraniprogrami'),(83,'Can delete instalirani programi',21,'delete_instaliraniprogrami'),(84,'Can view instalirani programi',21,'view_instaliraniprogrami');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
