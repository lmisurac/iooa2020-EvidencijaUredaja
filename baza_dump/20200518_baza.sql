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
-- Table structure for table `admin_ovlasti`
--

DROP TABLE IF EXISTS `admin_ovlasti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_ovlasti` (
  `id_uredaj` int(10) unsigned NOT NULL,
  `lokalni_admin` varchar(45) NOT NULL,
  `datum_kreiranja` date DEFAULT NULL,
  `id_zahtjev` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_uredaj`,`lokalni_admin`),
  KEY `FK_zahtjev_admin_ovalsti_idx` (`id_zahtjev`),
  CONSTRAINT `FK_uredaj_admin_ovlasti` FOREIGN KEY (`id_uredaj`) REFERENCES `uredaj` (`id_uredaj`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_zahtjev_admin_ovlasti` FOREIGN KEY (`id_zahtjev`) REFERENCES `zahtjev` (`id_zahtjev`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_ovlasti`
--

LOCK TABLES `admin_ovlasti` WRITE;
/*!40000 ALTER TABLE `admin_ovlasti` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_ovlasti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_radnje`
--

DROP TABLE IF EXISTS `admin_radnje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_radnje` (
  `id_radnje` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_zahtjev` int(10) unsigned DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `opis` varchar(500) DEFAULT NULL,
  `napomena` varchar(500) DEFAULT NULL,
  `id_uredaj` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_radnje`),
  KEY `FK_zahtjev_admin_radnje_idx` (`id_zahtjev`),
  KEY `FK_uredaj_admin_radnje_idx` (`id_uredaj`),
  CONSTRAINT `FK_uredaj_admin_radnje` FOREIGN KEY (`id_uredaj`) REFERENCES `uredaj` (`id_uredaj`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_zahtjev_admin_radnje` FOREIGN KEY (`id_zahtjev`) REFERENCES `zahtjev` (`id_zahtjev`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_radnje`
--

LOCK TABLES `admin_radnje` WRITE;
/*!40000 ALTER TABLE `admin_radnje` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_radnje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$L8xxHD7FMLf4$AMpyHNOkgBZt0O2DFj+YGIf2BorwvYTsPI9yCkDIpMU=','2020-05-18 13:16:25.174229',1,'luka','','','',1,1,'2020-05-16 12:26:08.666171');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-05-16 12:58:47.379516','4','Korisnik object (4)',2,'[]',11,1),(2,'2020-05-16 14:07:48.098044','4','4 Damir Damirić Odjel object (GFDKN)',2,'[{\"changed\": {\"fields\": [\"Oznaka odjela\"]}}]',11,1),(3,'2020-05-16 14:42:21.627940','1','2020-05-14  Građevinski fakultet u Rijeci --> Informatička oprema d.d',2,'[]',12,1),(4,'2020-05-16 18:19:29.129497','infop','infop Informatička oprema d.d Ulica skladišta opreme bb 51000 Rijeka',2,'[{\"changed\": {\"fields\": [\"Adresa\"]}}]',8,1),(5,'2020-05-16 18:22:10.629150','4','MB matična ploča ASUS ProArt Z490-CREATOR 10G',2,'[{\"changed\": {\"fields\": [\"Vrsta\"]}}]',9,1),(6,'2020-05-16 18:22:21.894945','3','PSU napajanje Chieftec APB-400B8',2,'[{\"changed\": {\"fields\": [\"Vrsta\"]}}]',9,1),(7,'2020-05-16 18:26:48.020077','GFKNJZ','GFKNJZ Knjižnica Građevinski fakultet u Rijeci',2,'[{\"changed\": {\"fields\": [\"Naziv\"]}}]',13,1),(8,'2020-05-16 18:32:49.160318','g301','g301  Kabinet profesora    (Zgrada Građevinskog fakulteta 3.kat)',2,'[{\"changed\": {\"fields\": [\"Namjena\"]}}]',16,1),(9,'2020-05-16 18:32:56.973267','g201','g201  Računovodstvo ured    (Zgrada Građevinskog fakulteta 2.kat)',2,'[{\"changed\": {\"fields\": [\"Namjena\"]}}]',16,1),(10,'2020-05-16 18:33:08.519833','g102','g102  Učionica    (Zgrada Građevinskog fakulteta 1.kat)',2,'[{\"changed\": {\"fields\": [\"Namjena\"]}}]',16,1),(11,'2020-05-16 18:33:15.504185','g101','g101  Računalna učionica    (Zgrada Građevinskog fakulteta 1.kat)',2,'[{\"changed\": {\"fields\": [\"Namjena\"]}}]',16,1),(12,'2020-05-16 18:33:23.082445','g010','g010  Knjižnica    (Zgrada Građevinskog fakulteta 0.kat)',2,'[{\"changed\": {\"fields\": [\"Namjena\", \"Napomena\"]}}]',16,1),(13,'2020-05-16 18:33:31.347876','g002','g002  Ured prodekana    (Zgrada Građevinskog fakulteta 0.kat)',2,'[{\"changed\": {\"fields\": [\"Namjena\"]}}]',16,1),(14,'2020-05-16 18:33:40.160757','g001','g001  Ured dekana    (Zgrada Građevinskog fakulteta 0.kat)',2,'[{\"changed\": {\"fields\": [\"Namjena\"]}}]',16,1),(15,'2020-05-16 18:48:49.988414','1','2020-05-14  Damir Damirić (damir.damiric@gradri.hr) novi Molim pripremu 30 novih računala za učionicu G101',2,'[]',18,1),(16,'2020-05-16 18:58:49.767925','4','Damir Damirić (damir.damiric@gradri.hr) - prodekan za opće poslove Dekanat Građevinskog fakulteta  Građevinski fakultet u Rijeci',2,'[]',11,1),(17,'2020-05-18 13:18:55.111923','5','laptop: GRA-G120-201  Lenovo(ThinkPad L490) Damir Damirić (damir.damiric@gradri.hr) prodekan za opće poslove',1,'[{\"added\": {}}]',17,1),(18,'2020-05-18 13:44:30.002366','GFDKN','GFDKN Dekanat (Građevinski fakultet u Rijeci)',2,'[{\"changed\": {\"fields\": [\"Naziv\"]}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(20,'galeb','adminovlasti'),(7,'galeb','adminradnje'),(8,'galeb','dobavljac'),(21,'galeb','instaliraniprogrami'),(9,'galeb','komponenete'),(10,'galeb','konfiguracija'),(11,'galeb','korisnik'),(12,'galeb','nabava'),(13,'galeb','odjel'),(14,'galeb','organizacijskajedinica'),(15,'galeb','programi'),(16,'galeb','prostorija'),(17,'galeb','uredaj'),(18,'galeb','zahtjev'),(19,'galeb','zgrada'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-05-16 11:35:34.347960'),(2,'auth','0001_initial','2020-05-16 11:35:35.239758'),(3,'admin','0001_initial','2020-05-16 11:35:37.691838'),(4,'admin','0002_logentry_remove_auto_add','2020-05-16 11:35:38.330878'),(5,'admin','0003_logentry_add_action_flag_choices','2020-05-16 11:35:38.363681'),(6,'contenttypes','0002_remove_content_type_name','2020-05-16 11:35:38.879121'),(7,'auth','0002_alter_permission_name_max_length','2020-05-16 11:35:39.097877'),(8,'auth','0003_alter_user_email_max_length','2020-05-16 11:35:39.176063'),(9,'auth','0004_alter_user_username_opts','2020-05-16 11:35:39.191616'),(10,'auth','0005_alter_user_last_login_null','2020-05-16 11:35:39.520077'),(11,'auth','0006_require_contenttypes_0002','2020-05-16 11:35:39.535599'),(12,'auth','0007_alter_validators_add_error_messages','2020-05-16 11:35:39.582392'),(13,'auth','0008_alter_user_username_max_length','2020-05-16 11:35:39.957253'),(14,'auth','0009_alter_user_last_name_max_length','2020-05-16 11:35:40.191910'),(15,'auth','0010_alter_group_name_max_length','2020-05-16 11:35:40.269885'),(16,'auth','0011_update_proxy_permissions','2020-05-16 11:35:40.302183'),(17,'galeb','0001_initial','2020-05-16 11:35:40.363470'),(18,'sessions','0001_initial','2020-05-16 11:35:40.504322');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dobavljac`
--

DROP TABLE IF EXISTS `dobavljac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dobavljac` (
  `oznaka_dobavljaca` varchar(15) NOT NULL,
  `puni_naziv` varchar(45) DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `kontakt` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`oznaka_dobavljaca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='podaci o dobavljacima opreme\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dobavljac`
--

LOCK TABLES `dobavljac` WRITE;
/*!40000 ALTER TABLE `dobavljac` DISABLE KEYS */;
INSERT INTO `dobavljac` VALUES ('infop','Informatička oprema d.d','Ulica skladišta opreme bb 51000 Rijeka','info@infop.hr 001-111-555 www.infop.com');
/*!40000 ALTER TABLE `dobavljac` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `komponenete` VALUES (1,'RAM','Kingston',' KVR13S9K2/16','Specs: DDR3, 1333MHz, Non-ECC, CL9, 1.5V, Unbuffered, SODIMM'),(2,'HDD','Western Digital','WD10EZEX ','WD Blue PC Desktop Hard Drive Capacity 1 TB Interface SATA Form Factor 3.5 Inch Cache Size 64 MB Disk Speed (RPM) 7200rpm Dimensions (L x W x H) 5.79\" x 4\" x 1.03\"'),(3,'PSU napajanje','Chieftec','APB-400B8','Maximum Load: 400W AC Input:230V / 4A Frequency:50 Hz'),(4,'MB matična ploča','ASUS','ProArt Z490-CREATOR 10G','Intel® Z490 LGA 1200 ATX motherboard for content creators features a 10G LAN card, onboard 2.5G Intel LAN, dual Thunderbolt™ 3 Type-C ports, dual M.2, USB 3.2 Gen 2 ports, SATA 6 Gbps');
/*!40000 ALTER TABLE `komponenete` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korisnik` (
  `id_korisnik` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ime` varchar(45) DEFAULT NULL,
  `prezime` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  `radno_mjesto` varchar(45) DEFAULT NULL,
  `oznaka_odjela` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_korisnik`),
  KEY `FK_korisnik_odjel_idx` (`oznaka_odjela`),
  CONSTRAINT `FK_odjel_korisnik` FOREIGN KEY (`oznaka_odjela`) REFERENCES `odjel` (`oznaka_odjela`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnik`
--

LOCK TABLES `korisnik` WRITE;
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` VALUES (1,'Ana','Anic','ana.anic@gradri.hr','111-001','knjižničar','GFKNJZ'),(2,'Branka','Brankić','branka.brankic@gradri.hr','111-002','profesor','GFKOG'),(3,'Cvjetka','Cvjetić','cvjetka.cvjetic@gradri.hr','111-003','voditeljica računovodstva','GFRCN'),(4,'Damir','Damirić','damir.damiric@gradri.hr','111-004','prodekan za opće poslove','GFDKN');
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `odjel` VALUES ('FFGER','Odjel za germanistiku','FFRI'),('FFPU','Odjel za povijest umjetnosti','FFRI'),('GFDKN','Dekanat','GRADRI'),('GFKNJZ','Knjižnica','GRADRI'),('GFKOG','Katedra za organizaciju građenja','GRADRI'),('GFRCN','Računovodstvo','GRADRI'),('GFZNK','Zavod za nosive konstrukcije','GRADRI'),('OIZRCN','Zavod za računarstvo','SOIRI');
/*!40000 ALTER TABLE `odjel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizacijska_jedinica`
--

DROP TABLE IF EXISTS `organizacijska_jedinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizacijska_jedinica` (
  `oznaka_org_jed` varchar(10) NOT NULL,
  `naziv` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`oznaka_org_jed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Podaci o organizacijskim jedinicama';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizacijska_jedinica`
--

LOCK TABLES `organizacijska_jedinica` WRITE;
/*!40000 ALTER TABLE `organizacijska_jedinica` DISABLE KEYS */;
INSERT INTO `organizacijska_jedinica` VALUES ('FFRI','Filozofski fakultet u Rijeci'),('GRADRI','Građevinski fakultet u Rijeci'),('SOIRI','Sveučilišni odjel informatike u Rijeci');
/*!40000 ALTER TABLE `organizacijska_jedinica` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `prostorija` VALUES ('g001','ZGF',0,'Ured dekana','obavezna najava'),('g002','ZGF',0,'Ured prodekana',NULL),('g010','ZGF',0,'Knjižnica','radno vrijeme pon-sri 8h-16h cet pet 12h-20h'),('g101','ZGF',1,'Računalna učionica','ulazak sa karticom'),('g102','ZGF',1,'Učionica','1 laptop i projektor otključana'),('g201','ZGF',2,'Računovodstvo ured',NULL),('g301','ZGF',3,'Kabinet profesora',NULL);
/*!40000 ALTER TABLE `prostorija` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='podaci o uredajima\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uredaj`
--

LOCK TABLES `uredaj` WRITE;
/*!40000 ALTER TABLE `uredaj` DISABLE KEYS */;
INSERT INTO `uredaj` VALUES (1,'PC','GRA-G101-101','g101',4,NULL,1,'2021-05-14','Asus','ASUSPRO D641SC'),(2,'PC','GRA-G101-102','g101',4,NULL,1,'2021-05-14','Asus','ASUSPRO D641SC'),(3,'PC','GRA-G101-103','g101',4,NULL,1,'2021-05-14','Asus','ASUSPRO D641SC'),(5,'Laptop','GRA-G120-201','g102',4,NULL,1,'2021-05-18','Lenovo','ThinkPad L490');
/*!40000 ALTER TABLE `uredaj` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `zgrada`
--

DROP TABLE IF EXISTS `zgrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zgrada` (
  `oznaka_zgrade` varchar(15) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`oznaka_zgrade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='podaci o zgradama';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zgrada`
--

LOCK TABLES `zgrada` WRITE;
/*!40000 ALTER TABLE `zgrada` DISABLE KEYS */;
INSERT INTO `zgrada` VALUES ('ZFF','Zgrada Filozofskog fakulteta','Filozofska 2'),('ZGF','Zgrada Građevinskog fakulteta','Građevinska 1'),('ZSO','Zgrada Sveučilišnih odjela','Sveučillišna 3');
/*!40000 ALTER TABLE `zgrada` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-18 17:40:54
