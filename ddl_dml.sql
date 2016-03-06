-- MySQL dump 10.13  Distrib 5.7.11, for osx10.10 (x86_64)
--
-- Host: localhost    Database: nyanpi
-- ------------------------------------------------------
-- Server version	5.7.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,'camera'),(2,'camera'),(3,'button'),(4,'mike'),(5,'button');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live`
--

DROP TABLE IF EXISTS `live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `started_at` datetime NOT NULL,
  `scene` varchar(255) NOT NULL DEFAULT 'samba',
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live`
--

LOCK TABLES `live` WRITE;
/*!40000 ALTER TABLE `live` DISABLE KEYS */;
INSERT INTO `live` VALUES (1,'2016-03-05 05:14:33','samba','started'),(2,'2016-03-05 06:39:32','samba','started'),(3,'2016-03-05 06:40:37','samba','started'),(4,'2016-03-05 06:40:50','samba','started'),(5,'2016-03-05 06:40:53','samba','started'),(6,'2016-03-05 06:40:59','samba','started'),(7,'2016-03-05 06:43:23','samba','started'),(8,'2016-03-05 06:43:35','samba','started'),(9,'2016-03-05 06:43:40','samba','started'),(10,'2016-03-05 06:43:56','samba','ended'),(11,'2016-03-05 06:51:10','samba','started'),(12,'2016-03-05 07:01:07','samba','started'),(13,'2016-03-05 07:01:21','samba','started'),(14,'2016-03-05 07:01:27','samba','started'),(15,'2016-03-05 07:01:28','samba','started'),(16,'2016-03-05 07:01:45','samba','started'),(17,'2016-03-05 07:01:46','samba','started'),(18,'2016-03-05 07:01:46','samba','started'),(19,'2016-03-05 07:01:52','samba','started'),(20,'2016-03-05 07:03:19','samba','started'),(21,'2016-03-05 07:03:23','samba','started'),(22,'2016-03-05 07:03:25','samba','started'),(23,'2016-03-05 07:03:27','samba','started'),(24,'2016-03-05 07:07:59','samba','started'),(25,'2016-03-05 07:24:57','samba','started'),(26,'2016-03-05 08:02:04','samba','started'),(27,'2016-03-05 08:16:56','samba','started'),(28,'2016-03-05 08:17:12','samba','started'),(29,'2016-03-05 08:18:40','samba','started'),(30,'2016-03-05 08:20:04','samba','started'),(31,'2016-03-05 08:20:10','samba','started'),(32,'2016-03-05 08:20:22','samba','started'),(33,'2016-03-05 08:20:26','samba','started'),(34,'2016-03-05 08:21:17','samba','started'),(35,'2016-03-06 04:39:08','samba','started'),(36,'2016-03-06 04:39:33','samba','started'),(37,'2016-03-06 05:06:53','samba','started'),(38,'2016-03-06 05:07:31','samba','started'),(39,'2016-03-06 05:07:48','samba','started'),(40,'2016-03-06 05:14:42','samba','started'),(41,'2016-03-06 05:42:57','abarenbo','started'),(42,'2016-03-06 06:05:06','abarenbo','started'),(43,'2016-03-06 06:05:06','abarenbo','started'),(44,'2016-03-06 06:05:14','abarenbo','started'),(45,'2016-03-06 06:05:48','abarenbo','started');
/*!40000 ALTER TABLE `live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_sensor`
--

DROP TABLE IF EXISTS `trigger_sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_sensor` (
  `device_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  KEY `fk_trigger_sensor1_idx` (`device_id`),
  CONSTRAINT `fk_trigger_sensor1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_sensor`
--

LOCK TABLES `trigger_sensor` WRITE;
/*!40000 ALTER TABLE `trigger_sensor` DISABLE KEYS */;
INSERT INTO `trigger_sensor` VALUES (3,0),(5,0);
/*!40000 ALTER TABLE `trigger_sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_sensor`
--

DROP TABLE IF EXISTS `volume_sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_sensor` (
  `device_id` int(11) NOT NULL,
  `volume` int(11) NOT NULL,
  KEY `fk_volume_sensor_device1_idx` (`device_id`),
  CONSTRAINT `fk_volume_sensor_device1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_sensor`
--

LOCK TABLES `volume_sensor` WRITE;
/*!40000 ALTER TABLE `volume_sensor` DISABLE KEYS */;
INSERT INTO `volume_sensor` VALUES (1,8),(2,7),(3,8),(4,3);
/*!40000 ALTER TABLE `volume_sensor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-06 17:55:44
