-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: snipeit_db
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `requestable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int unsigned DEFAULT NULL,
  `min_amt` int DEFAULT NULL,
  `manufacturer_id` int DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `accessories_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accessories_users`
--

DROP TABLE IF EXISTS `accessories_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessories_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `accessory_id` int DEFAULT NULL,
  `assigned_to` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories_users`
--

LOCK TABLES `accessories_users` WRITE;
/*!40000 ALTER TABLE `accessories_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessories_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action_logs`
--

DROP TABLE IF EXISTS `action_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` int DEFAULT NULL,
  `target_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `filename` text COLLATE utf8mb4_unicode_ci,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int NOT NULL,
  `expected_checkin` date DEFAULT NULL,
  `accepted_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `thread_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `accept_signature` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_meta` text COLLATE utf8mb4_unicode_ci,
  `action_date` datetime DEFAULT NULL,
  `stored_eula` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `action_logs_thread_id_index` (`thread_id`),
  KEY `action_logs_created_at_index` (`created_at`),
  KEY `action_logs_item_type_item_id_action_type_index` (`item_type`,`item_id`,`action_type`),
  KEY `action_logs_target_type_target_id_action_type_index` (`target_type`,`target_id`,`action_type`),
  KEY `action_logs_target_type_target_id_index` (`target_type`,`target_id`),
  KEY `action_logs_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_logs`
--

LOCK TABLES `action_logs` WRITE;
/*!40000 ALTER TABLE `action_logs` DISABLE KEYS */;
INSERT INTO `action_logs` VALUES (1,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',1,NULL,NULL,'2022-11-24 11:11:24','2022-11-24 11:11:24',NULL,NULL,1,NULL,NULL,NULL,NULL),(2,1,'checkout',2,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',1,NULL,NULL,'2022-11-24 11:11:24','2022-11-24 11:11:24',NULL,NULL,NULL,NULL,NULL,'2022-11-24 11:11:24',NULL),(3,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',2,NULL,NULL,'2022-11-30 03:48:36','2022-11-30 03:48:36',NULL,NULL,3,NULL,NULL,NULL,NULL),(4,1,'checkout',3,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',2,NULL,NULL,'2022-11-30 03:48:36','2022-11-30 03:48:36',NULL,NULL,NULL,NULL,NULL,'2022-11-30 03:48:36',NULL),(5,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',2,NULL,NULL,'2022-11-30 03:52:54','2022-11-30 03:52:54',NULL,NULL,3,NULL,'{\"rtd_location_id\":{\"old\":null,\"new\":\"3\"},\"expected_checkin\":{\"old\":null,\"new\":\"2022-11-18 00:00:00\"}}',NULL,NULL),(6,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',3,NULL,NULL,'2022-11-30 04:01:28','2022-11-30 04:01:28',NULL,NULL,2,NULL,NULL,NULL,NULL),(7,1,'checkout',4,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',3,NULL,NULL,'2022-11-30 04:01:28','2022-11-30 04:01:28',NULL,NULL,NULL,NULL,NULL,'2022-11-30 04:01:28',NULL),(8,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',4,NULL,NULL,'2022-11-30 04:05:12','2022-11-30 04:05:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,1,'checkout',1,'App\\Models\\User',4,'Checked out on asset creation',NULL,'App\\Models\\Asset',4,NULL,NULL,'2022-11-30 04:05:12','2022-11-30 04:05:12',NULL,NULL,3,NULL,NULL,'2022-11-30 04:05:12',NULL),(10,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',5,NULL,NULL,'2022-11-30 04:08:33','2022-11-30 04:08:33',NULL,NULL,2,NULL,NULL,NULL,NULL),(11,1,'checkout',5,'App\\Models\\User',4,'Checked out on asset creation',NULL,'App\\Models\\Asset',5,NULL,NULL,'2022-11-30 04:08:33','2022-11-30 04:08:33',NULL,NULL,NULL,NULL,NULL,'2022-11-30 04:08:33',NULL),(12,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',6,NULL,NULL,'2022-11-30 04:10:43','2022-11-30 04:10:43',NULL,NULL,2,NULL,NULL,NULL,NULL),(13,1,'checkout',6,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',6,NULL,NULL,'2022-11-30 04:10:43','2022-11-30 04:10:43',NULL,NULL,NULL,NULL,NULL,'2022-11-30 04:10:43',NULL),(14,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',7,NULL,NULL,'2022-11-30 04:14:51','2022-11-30 04:14:51',NULL,NULL,1,NULL,NULL,NULL,NULL),(15,1,'checkout',7,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',7,NULL,NULL,'2022-11-30 04:14:51','2022-11-30 04:14:51',NULL,NULL,NULL,NULL,NULL,'2022-11-30 04:14:51',NULL),(16,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',8,NULL,NULL,'2022-11-30 04:18:41','2022-11-30 04:18:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,1,'checkout',8,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',8,NULL,NULL,'2022-11-30 04:18:41','2022-11-30 04:18:41',NULL,NULL,NULL,NULL,NULL,'2022-11-30 04:18:41',NULL),(18,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',9,NULL,NULL,'2022-11-30 05:21:47','2022-11-30 05:21:47',NULL,NULL,1,NULL,NULL,NULL,NULL),(19,1,'checkout',9,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',9,NULL,NULL,'2022-11-30 05:21:47','2022-11-30 05:21:47',NULL,NULL,NULL,NULL,NULL,'2022-11-30 05:21:47',NULL),(20,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',10,NULL,NULL,'2022-11-30 05:24:28','2022-11-30 05:24:28',NULL,NULL,1,NULL,NULL,NULL,NULL),(21,1,'checkout',10,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',10,NULL,NULL,'2022-11-30 05:24:32','2022-11-30 05:24:32',NULL,NULL,NULL,NULL,NULL,'2022-11-30 05:24:30',NULL),(22,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',11,NULL,NULL,'2022-12-01 05:29:59','2022-12-01 05:29:59',NULL,NULL,1,NULL,NULL,NULL,NULL),(23,1,'checkout',11,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',11,NULL,NULL,'2022-12-01 05:29:59','2022-12-01 05:29:59',NULL,NULL,NULL,NULL,NULL,'2022-12-01 05:29:59',NULL),(24,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',12,NULL,NULL,'2022-12-01 05:31:54','2022-12-01 05:31:54',NULL,NULL,1,NULL,NULL,NULL,NULL),(25,1,'checkout',12,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',12,NULL,NULL,'2022-12-01 05:31:54','2022-12-01 05:31:54',NULL,NULL,NULL,NULL,NULL,'2022-12-01 05:31:54',NULL),(26,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',13,NULL,NULL,'2022-12-01 05:33:25','2022-12-01 05:33:25',NULL,NULL,2,NULL,NULL,NULL,NULL),(27,1,'checkout',13,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',13,NULL,NULL,'2022-12-01 05:33:26','2022-12-01 05:33:26',NULL,NULL,NULL,NULL,NULL,'2022-12-01 05:33:26',NULL),(28,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',14,NULL,NULL,'2022-12-01 05:35:00','2022-12-01 05:35:00',NULL,NULL,2,NULL,NULL,NULL,NULL),(29,1,'checkout',14,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',14,NULL,NULL,'2022-12-01 05:35:00','2022-12-01 05:35:00',NULL,NULL,NULL,NULL,NULL,'2022-12-01 05:35:00',NULL),(30,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',15,NULL,NULL,'2022-12-01 05:37:06','2022-12-01 05:37:06',NULL,NULL,4,NULL,NULL,NULL,NULL),(31,1,'checkout',15,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',15,NULL,NULL,'2022-12-01 05:37:06','2022-12-01 05:37:06',NULL,NULL,NULL,NULL,NULL,'2022-12-01 05:37:06',NULL),(32,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',16,NULL,NULL,'2022-12-02 06:19:32','2022-12-02 06:19:32',NULL,NULL,2,NULL,NULL,NULL,NULL),(33,1,'checkout',16,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',16,NULL,NULL,'2022-12-02 06:19:32','2022-12-02 06:19:32',NULL,NULL,NULL,NULL,NULL,'2022-12-02 06:19:32',NULL),(34,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',17,NULL,NULL,'2022-12-02 06:21:33','2022-12-02 06:21:33',NULL,NULL,1,NULL,NULL,NULL,NULL),(35,1,'checkout',17,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',17,NULL,NULL,'2022-12-02 06:21:33','2022-12-02 06:21:33',NULL,NULL,NULL,NULL,NULL,'2022-12-02 06:21:33',NULL),(36,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',18,NULL,NULL,'2022-12-02 06:24:58','2022-12-02 06:24:58',NULL,NULL,2,NULL,NULL,NULL,NULL),(37,1,'checkout',18,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',18,NULL,NULL,'2022-12-02 06:24:59','2022-12-02 06:24:59',NULL,NULL,NULL,NULL,NULL,'2022-12-02 06:24:59',NULL),(38,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',19,NULL,NULL,'2022-12-02 06:26:19','2022-12-02 06:26:19',NULL,NULL,2,NULL,NULL,NULL,NULL),(39,1,'checkout',19,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',19,NULL,NULL,'2022-12-02 06:26:19','2022-12-02 06:26:19',NULL,NULL,NULL,NULL,NULL,'2022-12-02 06:26:19',NULL),(40,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',19,NULL,NULL,'2022-12-02 06:28:36','2022-12-02 06:28:36',NULL,NULL,2,NULL,'{\"notes\":{\"old\":null,\"new\":\"Ankit to Shantanu\"}}',NULL,NULL),(41,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',20,NULL,NULL,'2022-12-02 06:31:30','2022-12-02 06:31:30',NULL,NULL,2,NULL,NULL,NULL,NULL),(42,1,'checkout',20,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',20,NULL,NULL,'2022-12-02 06:31:30','2022-12-02 06:31:30',NULL,NULL,NULL,NULL,NULL,'2022-12-02 06:31:30',NULL),(43,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',21,NULL,NULL,'2022-12-05 05:09:53','2022-12-05 05:09:53',NULL,NULL,2,NULL,NULL,NULL,NULL),(44,1,'checkout',21,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',21,NULL,NULL,'2022-12-05 05:09:53','2022-12-05 05:09:53',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:09:53',NULL),(45,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',22,NULL,NULL,'2022-12-05 05:11:51','2022-12-05 05:11:51',NULL,NULL,2,NULL,NULL,NULL,NULL),(46,1,'checkout',22,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',22,NULL,NULL,'2022-12-05 05:11:51','2022-12-05 05:11:51',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:11:51',NULL),(47,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',23,NULL,NULL,'2022-12-05 05:14:01','2022-12-05 05:14:01',NULL,NULL,1,NULL,NULL,NULL,NULL),(48,1,'checkout',23,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',23,NULL,NULL,'2022-12-05 05:14:01','2022-12-05 05:14:01',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:14:01',NULL),(49,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',24,NULL,NULL,'2022-12-05 05:17:47','2022-12-05 05:17:47',NULL,NULL,1,NULL,NULL,NULL,NULL),(50,1,'checkout',24,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',24,NULL,NULL,'2022-12-05 05:17:48','2022-12-05 05:17:48',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:17:48',NULL),(51,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',25,NULL,NULL,'2022-12-05 05:19:54','2022-12-05 05:19:54',NULL,NULL,1,NULL,NULL,NULL,NULL),(52,1,'checkout',25,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',25,NULL,NULL,'2022-12-05 05:19:55','2022-12-05 05:19:55',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:19:55',NULL),(53,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',26,NULL,NULL,'2022-12-05 05:21:36','2022-12-05 05:21:36',NULL,NULL,1,NULL,NULL,NULL,NULL),(54,1,'checkout',26,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',26,NULL,NULL,'2022-12-05 05:21:36','2022-12-05 05:21:36',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:21:36',NULL),(55,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',27,NULL,NULL,'2022-12-05 05:27:05','2022-12-05 05:27:05',NULL,NULL,1,NULL,NULL,NULL,NULL),(56,1,'checkout',27,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',27,NULL,NULL,'2022-12-05 05:27:05','2022-12-05 05:27:05',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:27:05',NULL),(57,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',28,NULL,NULL,'2022-12-05 05:28:55','2022-12-05 05:28:55',NULL,NULL,1,NULL,NULL,NULL,NULL),(58,1,'checkout',28,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',28,NULL,NULL,'2022-12-05 05:28:55','2022-12-05 05:28:55',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:28:55',NULL),(59,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',29,NULL,NULL,'2022-12-05 05:33:07','2022-12-05 05:33:07',NULL,NULL,1,NULL,NULL,NULL,NULL),(60,1,'checkout',29,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',29,NULL,NULL,'2022-12-05 05:33:08','2022-12-05 05:33:08',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:33:07',NULL),(61,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',30,NULL,NULL,'2022-12-05 05:34:59','2022-12-05 05:34:59',NULL,NULL,1,NULL,NULL,NULL,NULL),(62,1,'checkout',30,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',30,NULL,NULL,'2022-12-05 05:34:59','2022-12-05 05:34:59',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:34:59',NULL),(63,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',31,NULL,NULL,'2022-12-05 05:37:43','2022-12-05 05:37:43',NULL,NULL,1,NULL,NULL,NULL,NULL),(64,1,'checkout',31,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',31,NULL,NULL,'2022-12-05 05:37:44','2022-12-05 05:37:44',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:37:44',NULL),(65,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',32,NULL,NULL,'2022-12-05 05:40:27','2022-12-05 05:40:27',NULL,NULL,1,NULL,NULL,NULL,NULL),(66,1,'checkout',32,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',32,NULL,NULL,'2022-12-05 05:40:27','2022-12-05 05:40:27',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:40:27',NULL),(67,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',33,NULL,NULL,'2022-12-05 05:50:03','2022-12-05 05:50:03',NULL,NULL,1,NULL,NULL,NULL,NULL),(68,1,'checkout',33,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',33,NULL,NULL,'2022-12-05 05:50:03','2022-12-05 05:50:03',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:50:03',NULL),(69,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',34,NULL,NULL,'2022-12-05 05:55:17','2022-12-05 05:55:17',NULL,NULL,1,NULL,NULL,NULL,NULL),(70,1,'checkout',34,'App\\Models\\User',4,'Checked out on asset creation',NULL,'App\\Models\\Asset',34,NULL,NULL,'2022-12-05 05:55:17','2022-12-05 05:55:17',NULL,NULL,NULL,NULL,NULL,'2022-12-05 05:55:17',NULL),(71,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',35,NULL,NULL,'2022-12-06 10:17:28','2022-12-06 10:17:28',NULL,NULL,1,NULL,NULL,NULL,NULL),(72,1,'checkout',36,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',35,NULL,NULL,'2022-12-06 10:17:28','2022-12-06 10:17:28',NULL,NULL,NULL,NULL,NULL,'2022-12-06 10:17:28',NULL),(73,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',36,NULL,NULL,'2022-12-06 10:20:53','2022-12-06 10:20:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,1,'checkout',37,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',36,NULL,NULL,'2022-12-06 10:20:53','2022-12-06 10:20:53',NULL,NULL,NULL,NULL,NULL,'2022-12-06 10:20:53',NULL),(75,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',37,NULL,NULL,'2022-12-06 10:25:00','2022-12-06 10:25:00',NULL,NULL,1,NULL,NULL,NULL,NULL),(76,1,'checkout',39,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',37,NULL,NULL,'2022-12-06 10:25:00','2022-12-06 10:25:00',NULL,NULL,NULL,NULL,NULL,'2022-12-06 10:25:00',NULL),(77,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',38,NULL,NULL,'2022-12-06 10:28:36','2022-12-06 10:28:36',NULL,NULL,1,NULL,NULL,NULL,NULL),(78,1,'checkout',40,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',38,NULL,NULL,'2022-12-06 10:28:36','2022-12-06 10:28:36',NULL,NULL,NULL,NULL,NULL,'2022-12-06 10:28:36',NULL),(79,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',20,NULL,NULL,'2022-12-06 10:30:40','2022-12-06 10:30:40',NULL,NULL,2,NULL,'{\"serial\":{\"old\":\"PF262XNY\",\"new\":\"JZ1T4L3\"},\"notes\":{\"old\":null,\"new\":\"2 laptops is assign\"}}',NULL,NULL),(80,2,'audit',NULL,NULL,NULL,'Asset handover start from Brijesh','','App\\Models\\Asset',16,NULL,NULL,'2022-12-09 13:53:43','2022-12-09 13:53:43',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',39,NULL,NULL,'2022-12-09 14:14:40','2022-12-09 14:14:40',NULL,NULL,1,NULL,NULL,NULL,NULL),(82,1,'checkout',41,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',39,NULL,NULL,'2022-12-09 14:14:40','2022-12-09 14:14:40',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:14:40',NULL),(83,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',40,NULL,NULL,'2022-12-09 14:16:26','2022-12-09 14:16:26',NULL,NULL,1,NULL,NULL,NULL,NULL),(84,1,'checkout',42,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',40,NULL,NULL,'2022-12-09 14:16:26','2022-12-09 14:16:26',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:16:26',NULL),(85,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',41,NULL,NULL,'2022-12-09 14:23:59','2022-12-09 14:23:59',NULL,NULL,1,NULL,NULL,NULL,NULL),(86,1,'checkout',44,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',41,NULL,NULL,'2022-12-09 14:23:59','2022-12-09 14:23:59',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:23:59',NULL),(87,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',42,NULL,NULL,'2022-12-09 14:25:54','2022-12-09 14:25:54',NULL,NULL,2,NULL,NULL,NULL,NULL),(88,1,'checkout',45,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',42,NULL,NULL,'2022-12-09 14:25:54','2022-12-09 14:25:54',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:25:54',NULL),(89,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',43,NULL,NULL,'2022-12-09 14:27:32','2022-12-09 14:27:32',NULL,NULL,2,NULL,NULL,NULL,NULL),(90,1,'checkout',46,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',43,NULL,NULL,'2022-12-09 14:27:32','2022-12-09 14:27:32',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:27:32',NULL),(91,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',44,NULL,NULL,'2022-12-09 14:29:05','2022-12-09 14:29:05',NULL,NULL,1,NULL,NULL,NULL,NULL),(92,1,'checkout',47,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',44,NULL,NULL,'2022-12-09 14:29:05','2022-12-09 14:29:05',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:29:05',NULL),(93,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',45,NULL,NULL,'2022-12-09 14:30:26','2022-12-09 14:30:26',NULL,NULL,1,NULL,NULL,NULL,NULL),(94,1,'checkout',48,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',45,NULL,NULL,'2022-12-09 14:30:26','2022-12-09 14:30:26',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:30:26',NULL),(95,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',46,NULL,NULL,'2022-12-09 14:32:23','2022-12-09 14:32:23',NULL,NULL,1,NULL,NULL,NULL,NULL),(96,1,'checkout',49,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',46,NULL,NULL,'2022-12-09 14:32:23','2022-12-09 14:32:23',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:32:23',NULL),(97,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',47,NULL,NULL,'2022-12-09 14:34:27','2022-12-09 14:34:27',NULL,NULL,2,NULL,NULL,NULL,NULL),(98,1,'checkout',50,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',47,NULL,NULL,'2022-12-09 14:34:27','2022-12-09 14:34:27',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:34:27',NULL),(99,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',48,NULL,NULL,'2022-12-09 14:36:16','2022-12-09 14:36:16',NULL,NULL,1,NULL,NULL,NULL,NULL),(100,1,'checkout',51,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',48,NULL,NULL,'2022-12-09 14:36:16','2022-12-09 14:36:16',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:36:16',NULL),(101,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',48,NULL,NULL,'2022-12-09 14:39:11','2022-12-09 14:39:11',NULL,NULL,1,NULL,'{\"notes\":{\"old\":\"anuj to akansha\",\"new\":\"anuj to akansha  \\r\\n\\r\\nkeyboard pannel change cost 4500 gst added\\r\\nbattery cost 1416 gst added\"}}',NULL,NULL),(102,1,'update',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',44,NULL,NULL,'2022-12-09 14:41:30','2022-12-09 14:41:30',NULL,NULL,1,NULL,'{\"notes\":{\"old\":\"Payal to Anchita, neelu singh to ajay\",\"new\":\"Payal to Anchita, neelu singh to ajay\\r\\nwebcam added\"}}',NULL,NULL),(103,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',49,NULL,NULL,'2022-12-09 14:43:55','2022-12-09 14:43:55',NULL,NULL,3,NULL,NULL,NULL,NULL),(104,1,'checkout',52,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',49,NULL,NULL,'2022-12-09 14:43:55','2022-12-09 14:43:55',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:43:55',NULL),(105,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',50,NULL,NULL,'2022-12-09 14:45:47','2022-12-09 14:45:47',NULL,NULL,2,NULL,NULL,NULL,NULL),(106,1,'checkout',53,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',50,NULL,NULL,'2022-12-09 14:45:47','2022-12-09 14:45:47',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:45:47',NULL),(107,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',51,NULL,NULL,'2022-12-09 14:50:21','2022-12-09 14:50:21',NULL,NULL,3,NULL,NULL,NULL,NULL),(108,1,'checkout',55,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',51,NULL,NULL,'2022-12-09 14:50:21','2022-12-09 14:50:21',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:50:21',NULL),(109,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',52,NULL,NULL,'2022-12-09 14:51:59','2022-12-09 14:51:59',NULL,NULL,3,NULL,NULL,NULL,NULL),(110,1,'checkout',56,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',52,NULL,NULL,'2022-12-09 14:51:59','2022-12-09 14:51:59',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:51:59',NULL),(111,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',53,NULL,NULL,'2022-12-09 14:53:41','2022-12-09 14:53:41',NULL,NULL,3,NULL,NULL,NULL,NULL),(112,1,'checkout',57,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',53,NULL,NULL,'2022-12-09 14:53:41','2022-12-09 14:53:41',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:53:41',NULL),(113,1,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',54,NULL,NULL,'2022-12-09 14:55:10','2022-12-09 14:55:10',NULL,NULL,3,NULL,NULL,NULL,NULL),(114,1,'checkout',58,'App\\Models\\User',NULL,'Checked out on asset creation',NULL,'App\\Models\\Asset',54,NULL,NULL,'2022-12-09 14:55:10','2022-12-09 14:55:10',NULL,NULL,NULL,NULL,NULL,'2022-12-09 14:55:10',NULL),(115,2,'create',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',55,NULL,NULL,'2022-12-09 15:41:06','2022-12-09 15:41:06',NULL,NULL,4,NULL,NULL,NULL,NULL),(116,2,'delete',NULL,NULL,NULL,NULL,NULL,'App\\Models\\Asset',55,NULL,NULL,'2022-12-09 15:43:36','2022-12-09 15:43:36',NULL,NULL,4,NULL,NULL,NULL,NULL),(117,2,'audit',NULL,NULL,NULL,NULL,'','App\\Models\\Asset',1,NULL,NULL,'2022-12-09 16:34:10','2022-12-09 16:34:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(118,2,'audit',NULL,NULL,NULL,'hghfh','','App\\Models\\Asset',1,NULL,NULL,'2022-12-09 16:35:26','2022-12-09 16:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(119,2,'audit',NULL,NULL,NULL,'Picture','audit-HNEmp9gLSEUKVpIjHW.jpg','App\\Models\\Asset',1,NULL,NULL,'2022-12-09 16:39:54','2022-12-09 16:39:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(120,2,'audit',NULL,NULL,NULL,'test','audit-0NhAJhlL14BuslRx5Y.jpg','App\\Models\\Asset',1,NULL,NULL,'2022-12-09 16:40:39','2022-12-09 16:40:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,2,'uploaded',NULL,NULL,NULL,'Laptop pic','hardware-1-jOKcE37r-img-20221209-211808.jpg','App\\Models\\Asset',1,NULL,NULL,'2022-12-09 16:41:34','2022-12-09 16:41:34',NULL,NULL,1,NULL,NULL,NULL,NULL),(122,2,'audit',NULL,NULL,NULL,'New pic','audit-TbbKeqILOrXOMyFQWh.jpg','App\\Models\\Asset',1,NULL,NULL,'2022-12-09 16:48:53','2022-12-09 16:48:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `action_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_logs`
--

DROP TABLE IF EXISTS `asset_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_id` int NOT NULL,
  `checkedout_to` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `asset_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `filename` text COLLATE utf8mb4_unicode_ci,
  `requested_at` datetime DEFAULT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `accessory_id` int DEFAULT NULL,
  `accepted_id` int DEFAULT NULL,
  `consumable_id` int DEFAULT NULL,
  `expected_checkin` date DEFAULT NULL,
  `component_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_logs`
--

LOCK TABLES `asset_logs` WRITE;
/*!40000 ALTER TABLE `asset_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_maintenances`
--

DROP TABLE IF EXISTS `asset_maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_maintenances` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL,
  `supplier_id` int unsigned NOT NULL,
  `asset_maintenance_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_warranty` tinyint(1) NOT NULL,
  `start_date` date NOT NULL,
  `completion_date` date DEFAULT NULL,
  `asset_maintenance_time` int DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci,
  `cost` decimal(20,2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_maintenances`
--

LOCK TABLES `asset_maintenances` WRITE;
/*!40000 ALTER TABLE `asset_maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_uploads`
--

DROP TABLE IF EXISTS `asset_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_uploads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_id` int NOT NULL,
  `filenotes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_uploads`
--

LOCK TABLES `asset_uploads` WRITE;
/*!40000 ALTER TABLE `asset_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` int DEFAULT NULL,
  `serial` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_to` int DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `physical` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `warranty_months` int DEFAULT NULL,
  `depreciate` tinyint(1) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `requestable` tinyint NOT NULL DEFAULT '0',
  `rtd_location_id` int DEFAULT NULL,
  `_snipeit_mac_address_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_checkout` datetime DEFAULT NULL,
  `expected_checkin` date DEFAULT NULL,
  `company_id` int unsigned DEFAULT NULL,
  `assigned_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_audit_date` datetime DEFAULT NULL,
  `next_audit_date` date DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `checkin_counter` int NOT NULL DEFAULT '0',
  `checkout_counter` int NOT NULL DEFAULT '0',
  `requests_counter` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_rtd_location_id_index` (`rtd_location_id`),
  KEY `assets_assigned_type_assigned_to_index` (`assigned_type`,`assigned_to`),
  KEY `assets_created_at_index` (`created_at`),
  KEY `assets_deleted_at_status_id_index` (`deleted_at`,`status_id`),
  KEY `assets_deleted_at_model_id_index` (`deleted_at`,`model_id`),
  KEY `assets_deleted_at_assigned_type_assigned_to_index` (`deleted_at`,`assigned_type`,`assigned_to`),
  KEY `assets_deleted_at_supplier_id_index` (`deleted_at`,`supplier_id`),
  KEY `assets_deleted_at_location_id_index` (`deleted_at`,`location_id`),
  KEY `assets_deleted_at_rtd_location_id_index` (`deleted_at`,`rtd_location_id`),
  KEY `assets_deleted_at_asset_tag_index` (`deleted_at`,`asset_tag`),
  KEY `assets_deleted_at_name_index` (`deleted_at`,`name`),
  KEY `assets_serial_index` (`serial`),
  KEY `assets_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,NULL,'BJ97X93',1,'BJ97X93',NULL,NULL,NULL,2,'Delivered on 21 Apr 2022, | ',NULL,1,'2022-11-24 11:11:24','2022-12-09 16:48:53',1,NULL,4,0,NULL,0,1,0,2,NULL,NULL,'2022-11-24 11:11:24',NULL,1,'App\\Models\\User','2022-12-09 16:48:53','2023-01-09',NULL,0,1,0),(2,NULL,'CND2411MLP',2,'CND2411MLP',NULL,NULL,NULL,3,'new laptop assign to obaid aslam ',NULL,1,'2022-11-30 03:48:36','2022-11-30 03:52:54',1,NULL,4,0,NULL,0,1,0,3,NULL,NULL,'2022-11-30 03:48:36','2022-11-18',3,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(3,NULL,'PF25SCHF',3,'PF25SCHF',NULL,NULL,NULL,4,NULL,NULL,1,'2022-11-30 04:01:27','2022-11-30 10:47:18',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-11-30 04:01:28',NULL,2,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(4,NULL,'CND2411QCR',2,'CND2411QCR',NULL,NULL,NULL,1,'new laptop assign to afsar',NULL,1,'2022-11-30 04:05:12','2022-12-14 11:09:20',1,NULL,4,0,NULL,0,NULL,0,4,NULL,NULL,'2022-11-30 04:05:12',NULL,NULL,'App\\Models\\User',NULL,NULL,4,0,1,0),(5,NULL,'R90X8ASF',4,'R90X8ASF',NULL,NULL,NULL,5,'akansha to arpan',NULL,1,'2022-11-30 04:08:33','2022-11-30 04:08:34',1,NULL,4,0,NULL,0,NULL,0,4,NULL,NULL,'2022-11-30 04:08:33',NULL,2,'App\\Models\\User',NULL,NULL,4,0,1,0),(6,NULL,'S/N: PF21WH3S  | MTM 81VD0079IN ',5,'S/N: PF21WH3S  | MTM 81VD0079IN ',NULL,NULL,NULL,6,'rahul to keshav',NULL,1,'2022-11-30 04:10:43','2022-11-30 04:12:22',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-11-30 04:10:43',NULL,2,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(7,NULL,'JZ1T4L3',6,'JZ1T4L3',NULL,NULL,NULL,7,NULL,NULL,1,'2022-11-30 04:14:51','2022-11-30 04:14:51',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-11-30 04:14:51',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(8,NULL,'19765908938',7,'19765908938',NULL,NULL,NULL,8,'hamza to sahzaib',NULL,1,'2022-11-30 04:18:41','2022-11-30 04:18:41',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-11-30 04:18:41',NULL,NULL,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(9,NULL,'20397304586',7,'20397304586',NULL,NULL,NULL,9,'heap phone also assigned',NULL,1,'2022-11-30 05:21:46','2022-11-30 05:21:47',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-11-30 05:21:47',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(10,NULL,'28301150558/D01RVJ2',8,'28301150558/D01RVJ2',NULL,NULL,NULL,10,'head phone also assigned',NULL,1,'2022-11-30 05:24:26','2022-11-30 05:24:32',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-11-30 05:24:30',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(11,NULL,'38415058634',7,'38415058634',NULL,NULL,NULL,11,NULL,NULL,1,'2022-12-01 05:29:59','2022-12-01 05:29:59',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-01 05:29:59',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(12,NULL,'MP1NZ70S',7,'MP1NZ70S',NULL,NULL,NULL,12,NULL,NULL,1,'2022-12-01 05:31:54','2022-12-01 05:31:55',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-01 05:31:54',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(13,NULL,'R90X87FT',4,'R90X87FT',NULL,NULL,NULL,13,NULL,NULL,1,'2022-12-01 05:33:25','2022-12-01 05:33:26',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-01 05:33:26',NULL,2,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(14,NULL,'PF21XN4E',4,'PF21XN4E',NULL,NULL,NULL,14,NULL,NULL,1,'2022-12-01 05:35:00','2022-12-01 05:35:00',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-01 05:35:00',NULL,2,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(15,NULL,'NXEG8SI001028115AF3400',9,'NXEG8SI001028115AF3400',NULL,NULL,NULL,15,NULL,NULL,1,'2022-12-01 05:37:06','2022-12-02 06:17:01',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-01 05:37:06',NULL,4,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(16,NULL,'PF21WKBS',5,'PF21WKBS',NULL,NULL,NULL,16,'Mina. to brijesh',NULL,1,'2022-12-02 06:19:31','2022-12-09 13:53:43',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-02 06:19:32',NULL,2,'App\\Models\\User','2022-12-09 13:53:43','2023-01-09',NULL,0,1,0),(17,NULL,'28771123466',10,'28771123466',NULL,NULL,NULL,17,NULL,NULL,1,'2022-12-02 06:21:32','2022-12-02 06:21:33',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-02 06:21:33',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(18,NULL,'R90Y50QQ',4,'R90Y50QQ',NULL,NULL,NULL,18,'Samiksha to Gaurav to pratik  porwal',NULL,1,'2022-12-02 06:24:58','2022-12-02 06:24:59',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-02 06:24:59',NULL,2,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(19,NULL,'PF2ANEF7',11,'PF2ANEF7',NULL,NULL,NULL,19,'Ankit to Shantanu',NULL,1,'2022-12-02 06:26:19','2022-12-02 06:28:36',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-02 06:26:19',NULL,2,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(20,NULL,'PF262XNY',3,'JZ1T4L3',NULL,NULL,NULL,20,'2 laptops is assign',NULL,1,'2022-12-02 06:31:30','2022-12-06 10:33:16',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-02 06:31:30',NULL,2,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(21,NULL,'PF1SWY5H',3,'PF1SWY5H',NULL,NULL,NULL,21,NULL,NULL,1,'2022-12-05 05:09:53','2022-12-05 05:09:53',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-05 05:09:53',NULL,2,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(22,NULL,'PF1ST3YA',3,'PF1ST3YA',NULL,NULL,NULL,22,'Ansh to Nitesh to swati grover',NULL,1,'2022-12-05 05:11:51','2022-12-05 05:11:51',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-05 05:11:51',NULL,2,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(23,NULL,'88Q7R32',12,'88Q7R32',NULL,NULL,NULL,23,'Saumya to Saurabh Tiwari',NULL,1,'2022-12-05 05:14:01','2022-12-05 05:14:01',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-05 05:14:01',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(24,NULL,'47HF463',1,'47HF463',NULL,NULL,NULL,24,NULL,NULL,1,'2022-12-05 05:17:47','2022-12-05 05:17:48',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-05 05:17:48',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(25,NULL,'GPDGN93',1,'GPDGN93',NULL,NULL,NULL,25,'Aashish Tyagi to Jatin Agarwal',NULL,1,'2022-12-05 05:19:54','2022-12-05 05:19:55',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-05 05:19:55',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(26,NULL,'4K97X93',1,'4K97X93',NULL,NULL,NULL,26,NULL,NULL,1,'2022-12-05 05:21:35','2022-12-05 05:21:36',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-05 05:21:36',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(27,NULL,'8J97X93',1,'8J97X93',NULL,NULL,NULL,27,'Wireless mouse keyboar',NULL,1,'2022-12-05 05:27:04','2022-12-05 05:27:05',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-05 05:27:05',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(28,NULL,'1H5DP93',1,'1H5DP93',NULL,NULL,NULL,28,NULL,NULL,1,'2022-12-05 05:28:55','2022-12-05 05:28:55',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-05 05:28:55',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(29,NULL,'62Q1P93',1,'62Q1P93',NULL,NULL,NULL,29,NULL,NULL,1,'2022-12-05 05:33:07','2022-12-05 05:33:08',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-05 05:33:07',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(30,NULL,'CD3DP93',1,'CD3DP93',NULL,NULL,NULL,30,NULL,NULL,1,'2022-12-05 05:34:58','2022-12-05 05:34:59',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-05 05:34:59',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(31,NULL,'54HF463',1,'54HF463',NULL,NULL,NULL,31,'hp printer MFP M128f ,  \r\nlaptop Zaheen to payal',NULL,1,'2022-12-05 05:37:43','2022-12-05 05:46:37',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-05 05:37:44',NULL,1,'App\\Models\\User',NULL,NULL,4,0,1,0),(32,NULL,'1ZYYN93',1,'1ZYYN93',NULL,NULL,NULL,32,NULL,NULL,1,'2022-12-05 05:40:27','2022-12-05 05:43:00',1,NULL,4,0,NULL,0,NULL,0,4,NULL,NULL,'2022-12-05 05:40:27',NULL,1,'App\\Models\\User',NULL,NULL,4,0,1,0),(33,NULL,'3J5DP93',1,'3J5DP93',NULL,NULL,NULL,33,NULL,NULL,1,'2022-12-05 05:50:03','2022-12-05 05:51:21',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-05 05:50:03',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(34,NULL,'8CL19G3',1,'8CL19G3',NULL,NULL,NULL,34,'Nokia 105 nidhi taneja to maitri\r\n\r\n',NULL,1,'2022-12-05 05:55:17','2022-12-05 05:55:18',1,NULL,4,0,NULL,0,NULL,0,4,NULL,NULL,'2022-12-05 05:55:17',NULL,1,'App\\Models\\User',NULL,NULL,4,0,1,0),(35,NULL,'1K97X93',1,'1K97X93',NULL,NULL,NULL,36,'i phone xr\r\n\r\nlaptop hanisha khatri to anuj bharadwaj',NULL,1,'2022-12-06 10:17:27','2022-12-06 10:17:29',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-06 10:17:28',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(36,NULL,'3706592957',8,'3706592957',NULL,NULL,NULL,37,'Surface Laptop 2 ',NULL,1,'2022-12-06 10:20:53','2022-12-06 10:20:53',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-06 10:20:53',NULL,NULL,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(37,NULL,'8NPP9G3 ',13,'8NPP9G3 ',NULL,NULL,NULL,39,NULL,NULL,1,'2022-12-06 10:25:00','2022-12-06 10:25:01',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-06 10:25:00',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(38,NULL,'HVK19G3',13,'HVK19G3',NULL,NULL,NULL,40,'mouse \r\n\r\n',NULL,1,'2022-12-06 10:28:36','2022-12-06 10:28:36',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-06 10:28:36',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(39,NULL,'4MVT9G3',13,'4MVT9G3',NULL,NULL,NULL,41,NULL,NULL,1,'2022-12-09 14:14:40','2022-12-09 14:14:40',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:14:40',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(40,NULL,'8MVT9G3',13,'8MVT9G3',NULL,NULL,NULL,42,'New laptop assigned to varsha',NULL,1,'2022-12-09 14:16:26','2022-12-09 14:16:26',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:16:26',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(41,NULL,'J3VT9G3',13,'J3VT9G3',NULL,NULL,NULL,44,'New Laptop to Venga',NULL,1,'2022-12-09 14:23:59','2022-12-09 14:24:00',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:23:59',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(42,NULL,'PF21VDHV',5,'PF21VDHV',NULL,NULL,NULL,45,'Yamag to Mohan .to poornima to sunil.',NULL,1,'2022-12-09 14:25:54','2022-12-09 14:25:54',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:25:54',NULL,2,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(43,NULL,'PF25QXQB',3,'PF25QXQB',NULL,NULL,NULL,46,'From Sonu Rana to manohar adabala',NULL,1,'2022-12-09 14:27:32','2022-12-09 14:27:32',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:27:32',NULL,2,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(44,NULL,'HF5DP93',1,'HF5DP93',NULL,NULL,NULL,47,'Payal to Anchita, neelu singh to ajay\r\nwebcam added',NULL,1,'2022-12-09 14:29:05','2022-12-09 14:41:30',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:29:05',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(45,NULL,'4DB0P93',1,'4DB0P93',NULL,NULL,NULL,48,'payal mam to jigar bhatia',NULL,1,'2022-12-09 14:30:26','2022-12-09 14:30:26',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:30:26',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(46,NULL,'1KVT9G3',13,'1KVT9G3',NULL,NULL,NULL,49,'Jai to Jatin another laptop to Jatin to sainath',NULL,1,'2022-12-09 14:32:23','2022-12-09 14:32:23',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:32:23',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(47,NULL,'PF1AHDH3',14,'PF1AHDH3',NULL,NULL,NULL,50,'Bittu to afzal .komal kumari ',NULL,1,'2022-12-09 14:34:27','2022-12-09 14:34:27',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:34:27',NULL,2,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(48,NULL,'7B1RVJ2',15,'7B1RVJ2',NULL,NULL,NULL,51,'anuj to akansha  \r\n\r\nkeyboard pannel change cost 4500 gst added\r\nbattery cost 1416 gst added',NULL,1,'2022-12-09 14:36:16','2022-12-09 14:39:11',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:36:16',NULL,1,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(49,NULL,'CND2411PXM',16,'CND2411PXM',NULL,NULL,NULL,52,'new laptop assign ',NULL,1,'2022-12-09 14:43:55','2022-12-09 14:43:55',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:43:55',NULL,3,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(50,NULL,'CND2411LL1',2,'CND2411LL1',NULL,NULL,NULL,53,'new laptop',NULL,1,'2022-12-09 14:45:46','2022-12-09 14:45:47',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:45:47',NULL,2,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(51,NULL,'CND2411P63',2,'CND2411P63',NULL,NULL,NULL,55,'new laptop',NULL,1,'2022-12-09 14:50:21','2022-12-09 14:50:21',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:50:21',NULL,3,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(52,NULL,'CND2400P9H',16,'CND2400P9H',NULL,NULL,NULL,56,'new laptop',NULL,1,'2022-12-09 14:51:59','2022-12-09 14:51:59',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:51:59',NULL,3,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(53,NULL,'CND2411PMH',2,'CND2411PMH',NULL,NULL,NULL,57,'new laptop',NULL,1,'2022-12-09 14:53:40','2022-12-09 14:53:41',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:53:41',NULL,3,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(54,NULL,'CND2411Q6Z',2,'CND2411Q6Z',NULL,NULL,NULL,58,'new laptop',NULL,1,'2022-12-09 14:55:10','2022-12-09 14:55:10',1,NULL,4,0,NULL,0,NULL,0,NULL,NULL,NULL,'2022-12-09 14:55:10',NULL,3,'App\\Models\\User',NULL,NULL,NULL,0,1,0),(55,NULL,'abcd',9,'26545465',NULL,NULL,NULL,NULL,NULL,NULL,2,'2022-12-09 15:41:05','2022-12-09 15:43:36',1,'2022-12-09 15:43:36',6,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,0,0,0);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `eula_text` longtext COLLATE utf8mb4_unicode_ci,
  `use_default_eula` tinyint(1) NOT NULL DEFAULT '0',
  `require_acceptance` tinyint(1) NOT NULL DEFAULT '0',
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'asset',
  `checkin_email` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Misc Software','2022-11-23 17:45:20','2022-11-23 17:45:20',NULL,NULL,NULL,0,0,'license',0,NULL),(2,'Laptop','2022-11-24 11:00:33','2022-11-24 11:00:33',1,NULL,NULL,0,0,'asset',0,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_acceptances`
--

DROP TABLE IF EXISTS `checkout_acceptances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout_acceptances` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `checkoutable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkoutable_id` bigint unsigned NOT NULL,
  `assigned_to_id` int DEFAULT NULL,
  `signature_filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `declined_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `stored_eula` text COLLATE utf8mb4_unicode_ci,
  `stored_eula_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_acceptances_checkoutable_type_checkoutable_id_index` (`checkoutable_type`,`checkoutable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_acceptances`
--

LOCK TABLES `checkout_acceptances` WRITE;
/*!40000 ALTER TABLE `checkout_acceptances` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_acceptances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_requests`
--

DROP TABLE IF EXISTS `checkout_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `requestable_id` int NOT NULL,
  `requestable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `fulfilled_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_requests_user_id_requestable_id_requestable_type` (`user_id`,`requestable_id`,`requestable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_requests`
--

LOCK TABLES `checkout_requests` WRITE;
/*!40000 ALTER TABLE `checkout_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Dell','2022-11-24 10:56:48','2022-11-24 10:56:48',NULL),(2,'Lenovo','2022-11-24 10:57:04','2022-11-24 10:57:04',NULL),(3,'HP','2022-11-24 10:57:12','2022-11-24 10:57:12',NULL),(4,'Acer','2022-11-24 10:57:20','2022-11-24 10:57:20',NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `min_amt` int DEFAULT NULL,
  `serial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `components_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components`
--

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
/*!40000 ALTER TABLE `components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_assets`
--

DROP TABLE IF EXISTS `components_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `assigned_qty` int DEFAULT '1',
  `component_id` int DEFAULT NULL,
  `asset_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_assets`
--

LOCK TABLES `components_assets` WRITE;
/*!40000 ALTER TABLE `components_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumables`
--

DROP TABLE IF EXISTS `consumables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `requestable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int unsigned DEFAULT NULL,
  `min_amt` int DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_id` int DEFAULT NULL,
  `item_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `consumables_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumables`
--

LOCK TABLES `consumables` WRITE;
/*!40000 ALTER TABLE `consumables` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumables_users`
--

DROP TABLE IF EXISTS `consumables_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumables_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `consumable_id` int DEFAULT NULL,
  `assigned_to` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumables_users`
--

LOCK TABLES `consumables_users` WRITE;
/*!40000 ALTER TABLE `consumables_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumables_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_custom_fieldset`
--

DROP TABLE IF EXISTS `custom_field_custom_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_field_custom_fieldset` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` int NOT NULL,
  `custom_fieldset_id` int NOT NULL,
  `order` int NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_custom_fieldset`
--

LOCK TABLES `custom_field_custom_fieldset` WRITE;
/*!40000 ALTER TABLE `custom_field_custom_fieldset` DISABLE KEYS */;
INSERT INTO `custom_field_custom_fieldset` VALUES (1,1,1,1,0);
/*!40000 ALTER TABLE `custom_field_custom_fieldset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `field_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `field_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `db_column` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help_text` text COLLATE utf8mb4_unicode_ci,
  `show_in_email` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) DEFAULT '0',
  `display_in_user_view` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (1,'MAC Address','regex:/^[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}:[a-fA-F0-9]{2}$/','text',NULL,'2022-11-23 17:44:41',NULL,NULL,0,'_snipeit_mac_address_1',NULL,0,0,0);
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fieldsets`
--

DROP TABLE IF EXISTS `custom_fieldsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fieldsets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fieldsets`
--

LOCK TABLES `custom_fieldsets` WRITE;
/*!40000 ALTER TABLE `custom_fieldsets` DISABLE KEYS */;
INSERT INTO `custom_fieldsets` VALUES (1,'Asset with MAC Address',NULL,NULL,NULL);
/*!40000 ALTER TABLE `custom_fieldsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depreciations`
--

DROP TABLE IF EXISTS `depreciations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depreciations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `months` int NOT NULL,
  `depreciation_min` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depreciations`
--

LOCK TABLES `depreciations` WRITE;
/*!40000 ALTER TABLE `depreciations` DISABLE KEYS */;
/*!40000 ALTER TABLE `depreciations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filesize` int NOT NULL,
  `import_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `header_row` text COLLATE utf8mb4_unicode_ci,
  `first_row` text COLLATE utf8mb4_unicode_ci,
  `field_map` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kits`
--

DROP TABLE IF EXISTS `kits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kits`
--

LOCK TABLES `kits` WRITE;
/*!40000 ALTER TABLE `kits` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kits_accessories`
--

DROP TABLE IF EXISTS `kits_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kits_accessories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `kit_id` int DEFAULT NULL,
  `accessory_id` int DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kits_accessories`
--

LOCK TABLES `kits_accessories` WRITE;
/*!40000 ALTER TABLE `kits_accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits_accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kits_consumables`
--

DROP TABLE IF EXISTS `kits_consumables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kits_consumables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `kit_id` int DEFAULT NULL,
  `consumable_id` int DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kits_consumables`
--

LOCK TABLES `kits_consumables` WRITE;
/*!40000 ALTER TABLE `kits_consumables` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits_consumables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kits_licenses`
--

DROP TABLE IF EXISTS `kits_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kits_licenses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `kit_id` int DEFAULT NULL,
  `license_id` int DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kits_licenses`
--

LOCK TABLES `kits_licenses` WRITE;
/*!40000 ALTER TABLE `kits_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kits_models`
--

DROP TABLE IF EXISTS `kits_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kits_models` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `kit_id` int DEFAULT NULL,
  `model_id` int DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kits_models`
--

LOCK TABLES `kits_models` WRITE;
/*!40000 ALTER TABLE `kits_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `kits_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_seats`
--

DROP TABLE IF EXISTS `license_seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_seats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `license_id` int DEFAULT NULL,
  `assigned_to` int DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `asset_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `license_seats_license_id_index` (`license_id`),
  KEY `license_seats_assigned_to_license_id_index` (`assigned_to`,`license_id`),
  KEY `license_seats_asset_id_license_id_index` (`asset_id`,`license_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_seats`
--

LOCK TABLES `license_seats` WRITE;
/*!40000 ALTER TABLE `license_seats` DISABLE KEYS */;
/*!40000 ALTER TABLE `license_seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seats` int NOT NULL DEFAULT '1',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `depreciation_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `license_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depreciate` tinyint(1) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `purchase_order` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `maintained` tinyint(1) DEFAULT NULL,
  `reassignable` tinyint(1) NOT NULL DEFAULT '1',
  `company_id` int unsigned DEFAULT NULL,
  `manufacturer_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `licenses_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_ou` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Devesh','Atrauli Aligarh',NULL,'IN','2022-11-24 11:08:53','2022-11-24 11:08:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'A-31 Atrauli','Aligarh',NULL,'IN','2022-11-24 11:09:34','2022-11-24 11:09:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'up','ambedkar nagar',NULL,'IN','2022-11-30 03:52:35','2022-11-30 03:52:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'delhi','delhi',NULL,'IN','2022-11-30 04:03:26','2022-11-30 04:03:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `successful` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` VALUES (1,'it','192.168.111.238','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-11-23 17:49:16',NULL),(2,'it','192.168.111.238','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-11-24 10:30:56',NULL),(3,'it','192.168.111.238','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-11-24 10:33:47',NULL),(4,'it','192.168.111.238','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36',1,'2022-11-24 10:43:51',NULL),(5,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',1,'2022-11-24 10:52:55',NULL),(6,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56',1,'2022-11-24 10:52:57',NULL),(7,'1\'or\'1\'=\'1','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56',0,'2022-11-24 11:17:47',NULL),(8,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56',1,'2022-11-24 11:18:29',NULL),(9,'Devesh','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',1,'2022-11-24 11:25:21',NULL),(10,'Devesh','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',1,'2022-11-24 11:27:07',NULL),(11,'Devesh','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',0,'2022-11-24 11:30:01',NULL),(12,'Devesh','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',1,'2022-11-24 11:30:14',NULL),(13,'it','192.168.111.36','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',1,'2022-11-24 11:57:00',NULL),(14,'it','192.168.111.36','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',1,'2022-11-25 10:32:57',NULL),(15,'it','192.168.111.238','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-11-28 12:31:48',NULL),(16,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',1,'2022-11-30 03:40:34',NULL),(17,'o.aslam','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',1,'2022-11-30 03:43:45',NULL),(18,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',1,'2022-11-30 03:44:31',NULL),(19,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56',1,'2022-11-30 03:45:47',NULL),(20,'o.aslam','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56',0,'2022-11-30 03:48:48',NULL),(21,'o.aslam','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56',1,'2022-11-30 03:48:58',NULL),(22,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56',1,'2022-11-30 03:50:22',NULL),(23,'o.aslam','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56',1,'2022-11-30 03:53:29',NULL),(24,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56',1,'2022-11-30 03:54:04',NULL),(25,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56',1,'2022-11-30 03:56:05',NULL),(26,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',1,'2022-11-30 04:04:15',NULL),(27,'manish.mishra','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-05 05:43:27',NULL),(28,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-05 05:44:20',NULL),(29,'payal.jain','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-05 05:46:59',NULL),(30,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-05 05:47:42',NULL),(31,'s.kushwaha','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-09 14:55:56',NULL),(32,'it','192.168.111.36','Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0',0,'2022-12-12 03:00:02',NULL),(33,'it','192.168.111.36','Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0',0,'2022-12-12 03:00:10',NULL),(34,'it','192.168.111.36','Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0',0,'2022-12-12 03:00:21',NULL),(35,'it','192.168.111.36','Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0',0,'2022-12-12 03:00:41',NULL),(36,'it','192.168.111.36','Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0',0,'2022-12-12 03:01:48',NULL),(37,'it@optimiserindia.com','192.168.111.36','Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0',0,'2022-12-12 03:01:59',NULL),(38,'it','192.168.111.36','Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0',0,'2022-12-12 06:25:08',NULL),(39,'afsar','192.168.111.36','Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0',0,'2022-12-12 06:25:20',NULL),(40,'it','192.168.111.238','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',0,'2022-12-12 06:46:21',NULL),(41,'it','192.168.111.238','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',0,'2022-12-13 10:46:40',NULL),(42,'it@optimiserindia.com','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',0,'2022-12-14 03:14:18',NULL),(43,'it@optimiserindia.com','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',0,'2022-12-14 03:14:24',NULL),(44,'it@optimiserindia.com','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',0,'2022-12-14 03:14:29',NULL),(45,'it@optimiserindia.com','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',0,'2022-12-14 03:14:41',NULL),(46,'manish.mishra','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-14 05:27:01',NULL),(47,'ankush.kumar','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-14 05:35:04',NULL),(48,'ankush.kumar','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-14 05:38:39',NULL),(49,'ravinder.kumar','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-14 05:39:46',NULL),(50,'s.gupta','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-14 06:16:26',NULL),(51,'payal.jain','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-14 06:47:14',NULL),(52,'k.sharma','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',0,'2022-12-14 08:50:00',NULL),(53,'k.sharma','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-14 08:50:26',NULL),(54,'k.karukaran','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46',0,'2022-12-14 08:52:45',NULL),(55,'k.karunakaran','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46',1,'2022-12-14 08:53:11',NULL),(56,'s.khan','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-14 09:00:01',NULL),(57,'k.kumari','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-14 10:08:45',NULL),(58,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',0,'2022-12-14 11:16:48',NULL),(59,'it','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-14 11:17:08',NULL),(60,'a.shamrao','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 OPR/93.0.0.0',1,'2022-12-14 13:29:13',NULL),(61,'a.anand','192.168.111.36','Mozilla/5.0 (Linux; Android 12; M2007J3SP) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36',1,'2022-12-14 15:48:29',NULL),(62,'maitri.mahajan','192.168.111.36','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',1,'2022-12-15 05:10:00',NULL);
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Dell','2022-11-24 10:59:43','2022-11-24 10:59:43',1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Lenovo','2022-11-24 10:59:53','2022-11-24 10:59:53',1,NULL,NULL,NULL,NULL,NULL,NULL),(3,'HP','2022-11-24 11:00:00','2022-11-24 11:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Acer','2022-11-24 11:00:08','2022-11-24 11:00:08',1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2012_12_06_225921_migration_cartalyst_sentry_install_users',1),(2,'2012_12_06_225929_migration_cartalyst_sentry_install_groups',1),(3,'2012_12_06_225945_migration_cartalyst_sentry_install_users_groups_pivot',1),(4,'2012_12_06_225988_migration_cartalyst_sentry_install_throttle',1),(5,'2013_03_23_193214_update_users_table',1),(6,'2013_11_13_075318_create_models_table',1),(7,'2013_11_13_075335_create_categories_table',1),(8,'2013_11_13_075347_create_manufacturers_table',1),(9,'2013_11_15_015858_add_user_id_to_categories',1),(10,'2013_11_15_112701_add_user_id_to_manufacturers',1),(11,'2013_11_15_190327_create_assets_table',1),(12,'2013_11_15_190357_create_temp_licenses_table',1),(13,'2013_11_15_201848_add_license_name_to_licenses',1),(14,'2013_11_16_040323_create_depreciations_table',1),(15,'2013_11_16_042851_add_depreciation_id_to_models',1),(16,'2013_11_16_084923_add_user_id_to_models',1),(17,'2013_11_16_103258_create_locations_table',1),(18,'2013_11_16_103336_add_location_id_to_assets',1),(19,'2013_11_16_103407_add_checkedout_to_to_assets',1),(20,'2013_11_16_103425_create_history_table',1),(21,'2013_11_17_054359_drop_licenses_table',1),(22,'2013_11_17_054526_add_physical_to_assets',1),(23,'2013_11_17_055126_create_settings_table',1),(24,'2013_11_17_062634_add_license_to_assets',1),(25,'2013_11_18_134332_add_contacts_to_users',1),(26,'2013_11_18_142847_add_info_to_locations',1),(27,'2013_11_18_152942_remove_location_id_from_asset',1),(28,'2013_11_18_164423_set_nullvalues_for_user',1),(29,'2013_11_19_013337_create_asset_logs_table',1),(30,'2013_11_19_061409_edit_added_on_asset_logs_table',1),(31,'2013_11_19_062250_edit_location_id_asset_logs_table',1),(32,'2013_11_20_055822_add_soft_delete_on_assets',1),(33,'2013_11_20_121404_add_soft_delete_on_locations',1),(34,'2013_11_20_123137_add_soft_delete_on_manufacturers',1),(35,'2013_11_20_123725_add_soft_delete_on_categories',1),(36,'2013_11_20_130248_create_status_labels',1),(37,'2013_11_20_130830_add_status_id_on_assets_table',1),(38,'2013_11_20_131544_add_status_type_on_status_labels',1),(39,'2013_11_20_134103_add_archived_to_assets',1),(40,'2013_11_21_002321_add_uploads_table',1),(41,'2013_11_21_024531_remove_deployable_boolean_from_status_labels',1),(42,'2013_11_22_075308_add_option_label_to_settings_table',1),(43,'2013_11_22_213400_edits_to_settings_table',1),(44,'2013_11_25_013244_recreate_licenses_table',1),(45,'2013_11_25_031458_create_license_seats_table',1),(46,'2013_11_25_032022_add_type_to_actionlog_table',1),(47,'2013_11_25_033008_delete_bad_licenses_table',1),(48,'2013_11_25_033131_create_new_licenses_table',1),(49,'2013_11_25_033534_add_licensed_to_licenses_table',1),(50,'2013_11_25_101308_add_warrantee_to_assets_table',1),(51,'2013_11_25_104343_alter_warranty_column_on_assets',1),(52,'2013_11_25_150450_drop_parent_from_categories',1),(53,'2013_11_25_151920_add_depreciate_to_assets',1),(54,'2013_11_25_152903_add_depreciate_to_licenses_table',1),(55,'2013_11_26_211820_drop_license_from_assets_table',1),(56,'2013_11_27_062510_add_note_to_asset_logs_table',1),(57,'2013_12_01_113426_add_filename_to_asset_log',1),(58,'2013_12_06_094618_add_nullable_to_licenses_table',1),(59,'2013_12_10_084038_add_eol_on_models_table',1),(60,'2013_12_12_055218_add_manager_to_users_table',1),(61,'2014_01_28_031200_add_qr_code_to_settings_table',1),(62,'2014_02_13_183016_add_qr_text_to_settings_table',1),(63,'2014_05_24_093839_alter_default_license_depreciation_id',1),(64,'2014_05_27_231658_alter_default_values_licenses',1),(65,'2014_06_19_191508_add_asset_name_to_settings',1),(66,'2014_06_20_004847_make_asset_log_checkedout_to_nullable',1),(67,'2014_06_20_005050_make_asset_log_purchasedate_to_nullable',1),(68,'2014_06_24_003011_add_suppliers',1),(69,'2014_06_24_010742_add_supplier_id_to_asset',1),(70,'2014_06_24_012839_add_zip_to_supplier',1),(71,'2014_06_24_033908_add_url_to_supplier',1),(72,'2014_07_08_054116_add_employee_id_to_users',1),(73,'2014_07_09_134316_add_requestable_to_assets',1),(74,'2014_07_17_085822_add_asset_to_software',1),(75,'2014_07_17_161625_make_asset_id_in_logs_nullable',1),(76,'2014_08_12_053504_alpha_0_4_2_release',1),(77,'2014_08_17_083523_make_location_id_nullable',1),(78,'2014_10_16_200626_add_rtd_location_to_assets',1),(79,'2014_10_24_000417_alter_supplier_state_to_32',1),(80,'2014_10_24_015641_add_display_checkout_date',1),(81,'2014_10_28_222654_add_avatar_field_to_users_table',1),(82,'2014_10_29_045924_add_image_field_to_models_table',1),(83,'2014_11_01_214955_add_eol_display_to_settings',1),(84,'2014_11_04_231416_update_group_field_for_reporting',1),(85,'2014_11_05_212408_add_fields_to_licenses',1),(86,'2014_11_07_021042_add_image_to_supplier',1),(87,'2014_11_20_203007_add_username_to_user',1),(88,'2014_11_20_223947_add_auto_to_settings',1),(89,'2014_11_20_224421_add_prefix_to_settings',1),(90,'2014_11_21_104401_change_licence_type',1),(91,'2014_12_09_082500_add_fields_maintained_term_to_licenses',1),(92,'2015_02_04_155757_increase_user_field_lengths',1),(93,'2015_02_07_013537_add_soft_deleted_to_log',1),(94,'2015_02_10_040958_fix_bad_assigned_to_ids',1),(95,'2015_02_10_053310_migrate_data_to_new_statuses',1),(96,'2015_02_11_044104_migrate_make_license_assigned_null',1),(97,'2015_02_11_104406_migrate_create_requests_table',1),(98,'2015_02_12_001312_add_mac_address_to_asset',1),(99,'2015_02_12_024100_change_license_notes_type',1),(100,'2015_02_17_231020_add_localonly_to_settings',1),(101,'2015_02_19_222322_add_logo_and_colors_to_settings',1),(102,'2015_02_24_072043_add_alerts_to_settings',1),(103,'2015_02_25_022931_add_eula_fields',1),(104,'2015_02_25_204513_add_accessories_table',1),(105,'2015_02_26_091228_add_accessories_user_table',1),(106,'2015_02_26_115128_add_deleted_at_models',1),(107,'2015_02_26_233005_add_category_type',1),(108,'2015_03_01_231912_update_accepted_at_to_acceptance_id',1),(109,'2015_03_05_011929_add_qr_type_to_settings',1),(110,'2015_03_18_055327_add_note_to_user',1),(111,'2015_04_29_234704_add_slack_to_settings',1),(112,'2015_05_04_085151_add_parent_id_to_locations_table',1),(113,'2015_05_22_124421_add_reassignable_to_licenses',1),(114,'2015_06_10_003314_fix_default_for_user_notes',1),(115,'2015_06_10_003554_create_consumables',1),(116,'2015_06_15_183253_move_email_to_username',1),(117,'2015_06_23_070346_make_email_nullable',1),(118,'2015_06_26_213716_create_asset_maintenances_table',1),(119,'2015_07_04_212443_create_custom_fields_table',1),(120,'2015_07_09_014359_add_currency_to_settings_and_locations',1),(121,'2015_07_21_122022_add_expected_checkin_date_to_asset_logs',1),(122,'2015_07_24_093845_add_checkin_email_to_category_table',1),(123,'2015_07_25_055415_remove_email_unique_constraint',1),(124,'2015_07_29_230054_add_thread_id_to_asset_logs_table',1),(125,'2015_07_31_015430_add_accepted_to_assets',1),(126,'2015_09_09_195301_add_custom_css_to_settings',1),(127,'2015_09_21_235926_create_custom_field_custom_fieldset',1),(128,'2015_09_22_000104_create_custom_fieldsets',1),(129,'2015_09_22_003321_add_fieldset_id_to_assets',1),(130,'2015_09_22_003413_migrate_mac_address',1),(131,'2015_09_28_003314_fix_default_purchase_order',1),(132,'2015_10_01_024551_add_accessory_consumable_price_info',1),(133,'2015_10_12_192706_add_brand_to_settings',1),(134,'2015_10_22_003314_fix_defaults_accessories',1),(135,'2015_10_23_182625_add_checkout_time_and_expected_checkout_date_to_assets',1),(136,'2015_11_05_061015_create_companies_table',1),(137,'2015_11_05_061115_add_company_id_to_consumables_table',1),(138,'2015_11_05_183749_image',1),(139,'2015_11_06_092038_add_company_id_to_accessories_table',1),(140,'2015_11_06_100045_add_company_id_to_users_table',1),(141,'2015_11_06_134742_add_company_id_to_licenses_table',1),(142,'2015_11_08_035832_add_company_id_to_assets_table',1),(143,'2015_11_08_222305_add_ldap_fields_to_settings',1),(144,'2015_11_15_151803_add_full_multiple_companies_support_to_settings_table',1),(145,'2015_11_26_195528_import_ldap_settings',1),(146,'2015_11_30_191504_remove_fk_company_id',1),(147,'2015_12_21_193006_add_ldap_server_cert_ignore_to_settings_table',1),(148,'2015_12_30_233509_add_timestamp_and_userId_to_custom_fields',1),(149,'2015_12_30_233658_add_timestamp_and_userId_to_custom_fieldsets',1),(150,'2016_01_28_041048_add_notes_to_models',1),(151,'2016_02_19_070119_add_remember_token_to_users_table',1),(152,'2016_02_19_073625_create_password_resets_table',1),(153,'2016_03_02_193043_add_ldap_flag_to_users',1),(154,'2016_03_02_220517_update_ldap_filter_to_longer_field',1),(155,'2016_03_08_225351_create_components_table',1),(156,'2016_03_09_024038_add_min_stock_to_tables',1),(157,'2016_03_10_133849_add_locale_to_users',1),(158,'2016_03_10_135519_add_locale_to_settings',1),(159,'2016_03_11_185621_add_label_settings_to_settings',1),(160,'2016_03_22_125911_fix_custom_fields_regexes',1),(161,'2016_04_28_141554_add_show_to_users',1),(162,'2016_05_16_164733_add_model_mfg_to_consumable',1),(163,'2016_05_19_180351_add_alt_barcode_settings',1),(164,'2016_05_19_191146_add_alter_interval',1),(165,'2016_05_19_192226_add_inventory_threshold',1),(166,'2016_05_20_024859_remove_option_keys_from_settings_table',1),(167,'2016_05_20_143758_remove_option_value_from_settings_table',1),(168,'2016_06_01_000001_create_oauth_auth_codes_table',1),(169,'2016_06_01_000002_create_oauth_access_tokens_table',1),(170,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(171,'2016_06_01_000004_create_oauth_clients_table',1),(172,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(173,'2016_06_01_140218_add_email_domain_and_format_to_settings',1),(174,'2016_06_22_160725_add_user_id_to_maintenances',1),(175,'2016_07_13_150015_add_is_ad_to_settings',1),(176,'2016_07_14_153609_add_ad_domain_to_settings',1),(177,'2016_07_22_003348_fix_custom_fields_regex_stuff',1),(178,'2016_07_22_054850_one_more_mac_addr_fix',1),(179,'2016_07_22_143045_add_port_to_ldap_settings',1),(180,'2016_07_22_153432_add_tls_to_ldap_settings',1),(181,'2016_07_27_211034_add_zerofill_to_settings',1),(182,'2016_08_02_124944_add_color_to_statuslabel',1),(183,'2016_08_04_134500_add_disallow_ldap_pw_sync_to_settings',1),(184,'2016_08_09_002225_add_manufacturer_to_licenses',1),(185,'2016_08_12_121613_add_manufacturer_to_accessories_table',1),(186,'2016_08_23_143353_add_new_fields_to_custom_fields',1),(187,'2016_08_23_145619_add_show_in_nav_to_status_labels',1),(188,'2016_08_30_084634_make_purchase_cost_nullable',1),(189,'2016_09_01_141051_add_requestable_to_asset_model',1),(190,'2016_09_02_001448_create_checkout_requests_table',1),(191,'2016_09_04_180400_create_actionlog_table',1),(192,'2016_09_04_182149_migrate_asset_log_to_action_log',1),(193,'2016_09_19_235935_fix_fieldtype_for_target_type',1),(194,'2016_09_23_140722_fix_modelno_in_consumables_to_string',1),(195,'2016_09_28_231359_add_company_to_logs',1),(196,'2016_10_14_130709_fix_order_number_to_varchar',1),(197,'2016_10_16_015024_rename_modelno_to_model_number',1),(198,'2016_10_16_015211_rename_consumable_modelno_to_model_number',1),(199,'2016_10_16_143235_rename_model_note_to_notes',1),(200,'2016_10_16_165052_rename_component_total_qty_to_qty',1),(201,'2016_10_19_145520_fix_order_number_in_components_to_string',1),(202,'2016_10_27_151715_add_serial_to_components',1),(203,'2016_10_27_213251_increase_serial_field_capacity',1),(204,'2016_10_29_002724_enable_2fa_fields',1),(205,'2016_10_29_082408_add_signature_to_acceptance',1),(206,'2016_11_01_030818_fix_forgotten_filename_in_action_logs',1),(207,'2016_11_13_020954_rename_component_serial_number_to_serial',1),(208,'2016_11_16_172119_increase_purchase_cost_size',1),(209,'2016_11_17_161317_longer_state_field_in_location',1),(210,'2016_11_17_193706_add_model_number_to_accessories',1),(211,'2016_11_24_160405_add_missing_target_type_to_logs_table',1),(212,'2016_12_07_173720_increase_size_of_state_in_suppliers',1),(213,'2016_12_19_004212_adjust_locale_length_to_10',1),(214,'2016_12_19_133936_extend_phone_lengths_in_supplier_and_elsewhere',1),(215,'2016_12_27_212631_make_asset_assigned_to_polymorphic',1),(216,'2017_01_09_040429_create_locations_ldap_query_field',1),(217,'2017_01_14_002418_create_imports_table',1),(218,'2017_01_25_063357_fix_utf8_custom_field_column_names',1),(219,'2017_03_03_154632_add_time_date_display_to_settings',1),(220,'2017_03_10_210807_add_fields_to_manufacturer',1),(221,'2017_05_08_195520_increase_size_of_field_values_in_custom_fields',1),(222,'2017_05_22_204422_create_departments',1),(223,'2017_05_22_233509_add_manager_to_locations_table',1),(224,'2017_06_14_122059_add_next_autoincrement_to_settings',1),(225,'2017_06_18_151753_add_header_and_first_row_to_importer_table',1),(226,'2017_07_07_191533_add_login_text',1),(227,'2017_07_25_130710_add_thumbsize_to_settings',1),(228,'2017_08_03_160105_set_asset_archived_to_zero_default',1),(229,'2017_08_22_180636_add_secure_password_options',1),(230,'2017_08_25_074822_add_auditing_tables',1),(231,'2017_08_25_101435_add_auditing_to_settings',1),(232,'2017_09_18_225619_fix_assigned_type_not_being_nulled',1),(233,'2017_10_03_015503_drop_foreign_keys',1),(234,'2017_10_10_123504_allow_nullable_depreciation_id_in_models',1),(235,'2017_10_17_133709_add_display_url_to_settings',1),(236,'2017_10_19_120002_add_custom_forgot_password_url',1),(237,'2017_10_19_130406_add_image_and_supplier_to_accessories',1),(238,'2017_10_20_234129_add_location_indices_to_assets',1),(239,'2017_10_25_202930_add_images_uploads_to_locations_manufacturers_etc',1),(240,'2017_10_27_180947_denorm_asset_locations',1),(241,'2017_10_27_192423_migrate_denormed_asset_locations',1),(242,'2017_10_30_182938_add_address_to_user',1),(243,'2017_11_08_025918_add_alert_menu_setting',1),(244,'2017_11_08_123942_labels_display_company_name',1),(245,'2017_12_12_010457_normalize_asset_last_audit_date',1),(246,'2017_12_12_033618_add_actionlog_meta',1),(247,'2017_12_26_170856_re_normalize_last_audit',1),(248,'2018_01_17_184354_add_archived_in_list_setting',1),(249,'2018_01_19_203121_add_dashboard_message_to_settings',1),(250,'2018_01_24_062633_add_footer_settings_to_settings',1),(251,'2018_01_24_093426_add_modellist_preferenc',1),(252,'2018_02_22_160436_add_remote_user_settings',1),(253,'2018_03_03_011032_add_theme_to_settings',1),(254,'2018_03_06_054937_add_default_flag_on_statuslabels',1),(255,'2018_03_23_212048_add_display_in_email_to_custom_fields',1),(256,'2018_03_24_030738_add_show_images_in_email_setting',1),(257,'2018_03_24_050108_add_cc_alerts',1),(258,'2018_03_29_053618_add_canceled_at_and_fulfilled_at_in_requests',1),(259,'2018_03_29_070121_add_drop_unique_requests',1),(260,'2018_03_29_070511_add_new_index_requestable',1),(261,'2018_04_02_150700_labels_display_model_name',1),(262,'2018_04_16_133902_create_custom_field_default_values_table',1),(263,'2018_05_04_073223_add_category_to_licenses',1),(264,'2018_05_04_075235_add_update_license_category',1),(265,'2018_05_08_031515_add_gdpr_privacy_footer',1),(266,'2018_05_14_215229_add_indexes',1),(267,'2018_05_14_223646_add_indexes_to_assets',1),(268,'2018_05_14_233638_denorm_counters_on_assets',1),(269,'2018_05_16_153409_add_first_counter_totals_to_assets',1),(270,'2018_06_21_134622_add_version_footer',1),(271,'2018_07_05_215440_add_unique_serial_option_to_settings',1),(272,'2018_07_17_005911_create_login_attempts_table',1),(273,'2018_07_24_154348_add_logo_to_print_assets',1),(274,'2018_07_28_023826_create_checkout_acceptances_table',1),(275,'2018_08_20_204842_add_depreciation_option_to_settings',1),(276,'2018_09_10_082212_create_checkout_acceptances_for_unaccepted_assets',1),(277,'2018_10_18_191228_add_kits_licenses_table',1),(278,'2018_10_19_153910_add_kits_table',1),(279,'2018_10_19_154013_add_kits_models_table',1),(280,'2018_12_05_211936_add_favicon_to_settings',1),(281,'2018_12_05_212119_add_email_logo_to_settings',1),(282,'2019_02_07_185953_add_kits_consumables_table',1),(283,'2019_02_07_190030_add_kits_accessories_table',1),(284,'2019_02_12_182750_add_actiondate_to_actionlog',1),(285,'2019_02_14_154310_change_auto_increment_prefix_to_nullable',1),(286,'2019_02_16_143518_auto_increment_back_to_string',1),(287,'2019_02_17_205048_add_label_logo_to_settings',1),(288,'2019_02_20_234421_make_serial_nullable',1),(289,'2019_02_21_224703_make_fields_nullable_for_integrity',1),(290,'2019_04_06_060145_add_user_skin_setting',1),(291,'2019_04_06_205355_add_setting_allow_user_skin',1),(292,'2019_06_12_184327_rename_groups_table',1),(293,'2019_07_23_140906_add_show_assigned_assets_to_settings',1),(294,'2019_08_20_084049_add_custom_remote_user_header',1),(295,'2019_12_04_223111_passport_upgrade',1),(296,'2020_02_04_172100_add_ad_append_domain_settings',1),(297,'2020_04_29_222305_add_saml_fields_to_settings',1),(298,'2020_08_11_200712_add_saml_key_rollover',1),(299,'2020_10_22_233743_move_accessory_checkout_note_to_join_table',1),(300,'2020_10_23_161736_fix_zero_values_for_locations',1),(301,'2020_11_18_214827_widen_license_serial_field',1),(302,'2020_12_14_233815_add_digit_separator_to_settings',1),(303,'2020_12_18_090026_swap_target_type_index_order',1),(304,'2020_12_21_153235_update_min_password',1),(305,'2020_12_21_210105_fix_bad_ldap_server_url_for_v5',1),(306,'2021_02_05_172502_add_provider_to_oauth_table',1),(307,'2021_03_18_184102_adds_several_ldap_fields',1),(308,'2021_04_07_001811_add_ldap_dept',1),(309,'2021_04_14_180125_add_ids_to_tables',1),(310,'2021_06_07_155421_add_serial_number_indexes',1),(311,'2021_06_07_155436_add_company_id_indexes',1),(312,'2021_07_28_031345_add_client_side_l_d_a_p_cert_to_settings',1),(313,'2021_07_28_040554_add_client_side_l_d_a_p_key_to_settings',1),(314,'2021_08_11_005206_add_depreciation_minimum_value',1),(315,'2021_08_24_124354_make_ldap_client_certs_nullable',1),(316,'2021_09_20_183216_change_default_label_to_nullable',1),(317,'2021_12_27_151849_change_supplier_address_length',1),(318,'2022_01_10_182548_add_license_id_index_to_license_seats',1),(319,'2022_02_03_214958_blank_out_ldap_active_flag',1),(320,'2022_02_16_152431_add_unique_constraint_to_custom_field',1),(321,'2022_03_03_225655_add_notes_to_accessories',1),(322,'2022_03_03_225754_add_notes_to_components',1),(323,'2022_03_03_225824_add_notes_to_consumables',1),(324,'2022_03_04_080836_add_remote_to_user',1),(325,'2022_03_09_001334_add_eula_to_checkout_acceptance',1),(326,'2022_03_10_175740_add_eula_to_action_logs',1),(327,'2022_03_21_162724_adds_ldap_manager',1),(328,'2022_04_05_135340_add_primary_key_to_custom_fields_pivot',1),(329,'2022_05_16_235350_remove_stored_eula_field',1),(330,'2022_06_23_164407_add_user_id_to_users',1),(331,'2022_06_28_234539_add_username_index_to_users',1),(332,'2022_07_07_010406_add_indexes_to_license_seats',1),(333,'2022_08_10_141328_add_notes_denorm_to_consumables_users',1),(334,'2022_09_29_040231_add_chart_type_to_settings',1),(335,'2022_10_05_163044_add_start_termination_date_to_users',1),(336,'2022_10_25_193823_add_externalid_to_users',1),(337,'2022_11_07_134348_add_display_to_user_in_custom_fields',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `models` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `depreciation_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `eol` int DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecated_mac_address` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `fieldset_id` int DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `requestable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,'Letitude 3510','3510',1,2,'2022-11-24 11:01:56','2022-11-24 11:01:56',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(2,'laptop','g8 notebook pc',3,2,'2022-11-30 03:47:06','2022-11-30 03:47:06',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(3,'laptop','v-15',2,2,'2022-11-30 04:00:53','2022-11-30 04:00:53',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(4,'v-130','v-130',2,2,'2022-11-30 04:07:48','2022-11-30 04:07:48',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(5,'lenovo','s-145',2,2,'2022-11-30 04:10:12','2022-11-30 04:10:12',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(6,'laptop','Inspiron 15 3511',1,2,'2022-11-30 04:14:31','2022-11-30 04:14:31',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(7,'dell','P75F910',1,2,'2022-11-30 04:18:27','2022-11-30 04:18:27',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(8,'Inspiron 15','Inspiron 15',1,2,'2022-11-30 05:23:52','2022-11-30 05:23:52',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(9,'laptop','N19C1D',4,2,'2022-12-01 05:37:02','2022-12-01 05:37:02',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(10,'laptop','dell vostro 3583',1,2,'2022-12-02 06:21:11','2022-12-02 06:21:11',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(11,'laptop','Slim I3',2,2,'2022-12-02 06:26:15','2022-12-02 06:26:15',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(12,'laptop','Inspiron 5458',1,2,'2022-12-05 05:13:38','2022-12-05 05:13:38',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(13,'laptop','Latitude3520',1,2,'2022-12-06 10:24:44','2022-12-06 10:24:44',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(14,'laptop','V14',2,2,'2022-12-09 14:34:09','2022-12-09 14:34:09',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(15,'laptop','Inspiron 15 3567',1,2,'2022-12-09 14:35:59','2022-12-09 14:35:59',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0),(16,'laptop','g8 notebook pc',3,2,'2022-12-09 14:43:39','2022-12-09 14:43:39',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models_custom_fields`
--

DROP TABLE IF EXISTS `models_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `models_custom_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_model_id` int NOT NULL,
  `custom_field_id` int NOT NULL,
  `default_value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models_custom_fields`
--

LOCK TABLES `models_custom_fields` WRITE;
/*!40000 ALTER TABLE `models_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `models_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Snipe-IT Personal Access Client','g6LO9yirgNK8cSqeAglJWBxE5oHSA0uVByU2HJX5',NULL,'http://localhost',1,0,0,'2022-11-23 17:46:00','2022-11-23 17:46:00'),(2,NULL,'Snipe-IT Password Grant Client','4hv66w4YaY8UoosL57gZw0PlaEP61X678G1IjUhs','users','http://localhost',0,1,0,'2022-11-23 17:46:00','2022-11-23 17:46:00');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2022-11-23 17:46:00','2022-11-23 17:46:00');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('it@optimiserindia.com','$2y$10$UiuSw3K68vgs1PzU0qSLHuZkdOtpoaOAyV9UCssoHIN5Mg4SMJVIK','2022-12-12 06:25:27',1);
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_groups`
--

DROP TABLE IF EXISTS `permission_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_groups`
--

LOCK TABLES `permission_groups` WRITE;
/*!40000 ALTER TABLE `permission_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requested_assets`
--

DROP TABLE IF EXISTS `requested_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requested_assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int NOT NULL,
  `user_id` int NOT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `denied_at` datetime DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requested_assets`
--

LOCK TABLES `requested_assets` WRITE;
/*!40000 ALTER TABLE `requested_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `requested_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `request_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `per_page` int NOT NULL DEFAULT '20',
  `site_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Snipe IT Asset Management',
  `qr_code` int DEFAULT NULL,
  `qr_text` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_asset_name` int DEFAULT NULL,
  `display_checkout_date` int DEFAULT NULL,
  `display_eol` int DEFAULT NULL,
  `auto_increment_assets` int NOT NULL DEFAULT '0',
  `auto_increment_prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `load_remote` tinyint(1) NOT NULL DEFAULT '1',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alert_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alerts_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `default_eula_text` longtext COLLATE utf8mb4_unicode_ci,
  `barcode_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'QRCODE',
  `slack_endpoint` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slack_channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slack_botname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_css` text COLLATE utf8mb4_unicode_ci,
  `brand` tinyint NOT NULL DEFAULT '1',
  `ldap_enabled` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_server` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_uname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_pword` longtext COLLATE utf8mb4_unicode_ci,
  `ldap_basedn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_filter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ldap_username_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'samaccountname',
  `ldap_lname_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'sn',
  `ldap_fname_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'givenname',
  `ldap_auth_filter_query` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'uid=',
  `ldap_version` int DEFAULT '3',
  `ldap_active_flag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_dept` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_emp_num` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_phone_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_jobtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_manager` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_multiple_companies_support` tinyint(1) NOT NULL DEFAULT '0',
  `ldap_server_cert_ignore` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `labels_per_page` tinyint NOT NULL DEFAULT '30',
  `labels_width` decimal(6,5) NOT NULL DEFAULT '2.62500',
  `labels_height` decimal(6,5) NOT NULL DEFAULT '1.00000',
  `labels_pmargin_left` decimal(6,5) NOT NULL DEFAULT '0.21975',
  `labels_pmargin_right` decimal(6,5) NOT NULL DEFAULT '0.21975',
  `labels_pmargin_top` decimal(6,5) NOT NULL DEFAULT '0.50000',
  `labels_pmargin_bottom` decimal(6,5) NOT NULL DEFAULT '0.50000',
  `labels_display_bgutter` decimal(6,5) NOT NULL DEFAULT '0.07000',
  `labels_display_sgutter` decimal(6,5) NOT NULL DEFAULT '0.05000',
  `labels_fontsize` tinyint NOT NULL DEFAULT '9',
  `labels_pagewidth` decimal(7,5) NOT NULL DEFAULT '8.50000',
  `labels_pageheight` decimal(7,5) NOT NULL DEFAULT '11.00000',
  `labels_display_name` tinyint NOT NULL DEFAULT '0',
  `labels_display_serial` tinyint NOT NULL DEFAULT '1',
  `labels_display_tag` tinyint NOT NULL DEFAULT '1',
  `alt_barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `alt_barcode_enabled` tinyint(1) DEFAULT '1',
  `alert_interval` int DEFAULT '30',
  `alert_threshold` int DEFAULT '5',
  `email_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'filastname',
  `username_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'filastname',
  `is_ad` tinyint(1) NOT NULL DEFAULT '0',
  `ad_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_port` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '389',
  `ldap_tls` tinyint(1) NOT NULL DEFAULT '0',
  `zerofill_count` int NOT NULL DEFAULT '5',
  `ldap_pw_sync` tinyint(1) NOT NULL DEFAULT '1',
  `two_factor_enabled` tinyint DEFAULT NULL,
  `require_accept_signature` tinyint(1) NOT NULL DEFAULT '0',
  `date_display_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y-m-d',
  `time_display_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'h:i A',
  `next_auto_tag_base` bigint NOT NULL DEFAULT '1',
  `login_note` text COLLATE utf8mb4_unicode_ci,
  `thumbnail_max_h` int DEFAULT '50',
  `pwd_secure_uncommon` tinyint(1) NOT NULL DEFAULT '0',
  `pwd_secure_complexity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pwd_secure_min` int NOT NULL DEFAULT '8',
  `audit_interval` int DEFAULT NULL,
  `audit_warning_days` int DEFAULT NULL,
  `show_url_in_emails` tinyint(1) NOT NULL DEFAULT '0',
  `custom_forgot_pass_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_alerts_in_menu` tinyint(1) NOT NULL DEFAULT '1',
  `labels_display_company_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_archived_in_list` tinyint(1) NOT NULL DEFAULT '0',
  `dashboard_message` text COLLATE utf8mb4_unicode_ci,
  `support_footer` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `modellist_displays` char(191) COLLATE utf8mb4_unicode_ci DEFAULT 'image,category,manufacturer,model_number',
  `login_remote_user_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `login_common_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `login_remote_user_custom_logout_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `skin` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_images_in_email` tinyint(1) NOT NULL DEFAULT '1',
  `admin_cc_email` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labels_display_model` tinyint(1) NOT NULL DEFAULT '0',
  `privacy_policy_link` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_footer` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `unique_serial` tinyint(1) NOT NULL DEFAULT '0',
  `logo_print_assets` tinyint(1) NOT NULL DEFAULT '0',
  `depreciation_method` char(10) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `favicon` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_logo` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_logo` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_user_skin` tinyint(1) NOT NULL DEFAULT '0',
  `show_assigned_assets` tinyint(1) NOT NULL DEFAULT '0',
  `login_remote_user_header_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ad_append_domain` tinyint(1) NOT NULL DEFAULT '0',
  `saml_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `saml_idp_metadata` text COLLATE utf8mb4_unicode_ci,
  `saml_attr_mapping_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saml_forcelogin` tinyint(1) NOT NULL DEFAULT '0',
  `saml_slo` tinyint(1) NOT NULL DEFAULT '0',
  `saml_sp_x509cert` text COLLATE utf8mb4_unicode_ci,
  `saml_sp_privatekey` text COLLATE utf8mb4_unicode_ci,
  `saml_custom_settings` text COLLATE utf8mb4_unicode_ci,
  `saml_sp_x509certNew` text COLLATE utf8mb4_unicode_ci,
  `digit_separator` char(191) COLLATE utf8mb4_unicode_ci DEFAULT '1,234.56',
  `ldap_client_tls_cert` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ldap_client_tls_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dash_chart_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'2022-11-23 17:49:17','2022-12-09 15:41:05',1,20,'Glotelligence India',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,'it@optimiserindia.com',1,NULL,'QRCODE',NULL,NULL,NULL,'1',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,'samaccountname','sn','givenname','uid=',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'en',30,2.62500,1.00000,0.21975,0.21975,0.50000,0.50000,0.07000,0.05000,9,8.50000,11.00000,0,1,1,'C128',1,30,5,'it@optimiserindia.com','filastname','filastname',0,NULL,'389',0,5,1,NULL,0,'Y-m-d','h:i A',56,NULL,50,0,NULL,10,NULL,NULL,0,NULL,1,0,0,NULL,'off','Glotelligence Limited','image,category,manufacturer,model_number',0,0,'','blue',1,'devesh.yadav@glotelligence.in',0,NULL,'on',0,0,'default',NULL,NULL,NULL,0,0,'',0,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,'1,234.56',NULL,NULL,'name');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_labels`
--

DROP TABLE IF EXISTS `status_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_labels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deployable` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_in_nav` tinyint(1) DEFAULT '0',
  `default_label` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_labels`
--

LOCK TABLES `status_labels` WRITE;
/*!40000 ALTER TABLE `status_labels` DISABLE KEYS */;
INSERT INTO `status_labels` VALUES (1,'Archived',1,NULL,'2022-12-09 14:02:28','2022-12-09 14:02:28',0,1,0,'These assets are not yet ready to be deployed, usually because of configuration or waiting on parts.',NULL,0,0),(2,'Ready to Deploy',1,NULL,'2022-12-09 14:02:48','2022-12-09 14:02:48',1,0,0,'These assets are ready to deploy.',NULL,0,0),(3,'Under Service',1,NULL,'2022-12-09 14:03:00','2022-12-09 14:03:00',0,1,0,'These assets are no longer in circulation or viable.','#deec07',0,0),(4,'In Use',NULL,'2022-11-24 11:02:35','2022-12-09 15:34:58',NULL,1,0,0,NULL,'#f4d805',1,1),(5,'Spare',NULL,'2022-11-24 11:02:56','2022-12-09 14:02:55','2022-12-09 14:02:55',1,0,0,NULL,'#0eef2e',0,0),(6,'Spare',2,'2022-12-09 14:15:07','2022-12-09 14:15:07',NULL,0,1,0,NULL,'#64e70e',1,1),(7,'Under Service',2,'2022-12-09 15:32:58','2022-12-09 15:33:07',NULL,0,0,0,NULL,'#f40f05',1,1),(8,'Archived',2,'2022-12-09 15:34:12','2022-12-09 15:34:20',NULL,0,0,1,NULL,'#848484',1,1);
/*!40000 ALTER TABLE `status_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Narendra Vendor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-24 11:10:20','2022-11-24 11:10:20',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `throttle`
--

DROP TABLE IF EXISTS `throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `throttle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `throttle`
--

LOCK TABLES `throttle` WRITE;
/*!40000 ALTER TABLE `throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gravatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `employee_num` text COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `company_id` int unsigned DEFAULT NULL,
  `remember_token` text COLLATE utf8mb4_unicode_ci,
  `ldap_import` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `show_in_list` tinyint(1) NOT NULL DEFAULT '1',
  `two_factor_secret` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_enrolled` tinyint(1) NOT NULL DEFAULT '0',
  `two_factor_optin` tinyint(1) NOT NULL DEFAULT '0',
  `department_id` int DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote` tinyint(1) DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `scim_externalid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`),
  KEY `users_company_id_index` (`company_id`),
  KEY `users_username_deleted_at_index` (`username`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'it@optimiserindia.com','$2y$10$4xox5ZPZICkktDbmzZlKNOkRU6gZc7cvQiJnsaoQJqkB75SuAFehe','{\"superuser\":\"1\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,NULL,NULL,NULL,'2022-12-14 11:17:08',NULL,NULL,'afsar','ansari','2022-11-23 17:49:16','2022-12-14 11:17:08',NULL,NULL,NULL,NULL,4,'8285550047','devops engineer',2,'8285550047',NULL,'it',NULL,3,'K4ZxUipkJ3FLc09tJ8OyrtBBewGN42KmcPGTPTcw1PlAk2DbFbLrU5zDHokV',0,'en',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(2,'devesh.yadav@optimiserindia.com','$2y$10$cENfL4KRzJhKL5wAJ8YPTuiOZz4PKleJZnNVxa9MXse0Cmvw8xQ4G','{\"superuser\":\"1\",\"admin\":\"1\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-11-24 11:30:14',NULL,NULL,'Devesh','Yadav','2022-11-24 10:54:49','2022-11-24 11:30:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Devesh',NULL,NULL,'qe785Br4DKF7l3eJeCVkP15WTZa9MnpzjpP7sNHM6esd5LiV2U5XUdC5uJus',0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(3,'','$2y$10$flhLQnaH50F9CgETSHS7vOx0dr3.1leWM0G//VBs6fYOix2EzpLFq','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-11-30 03:53:29',NULL,NULL,'obaid','aslam','2022-11-30 03:43:03','2022-11-30 03:53:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'o.aslam',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(4,'','$2y$10$YJJDQqZNm9e/Ntelr19mTuD47VOY95cmdYIQkV16db9xp6TTw4ClK','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-12-14 08:53:11',NULL,NULL,'karishma','karunakaran','2022-11-30 03:59:18','2022-12-14 08:55:28',NULL,NULL,NULL,NULL,NULL,'+919871855812',NULL,NULL,NULL,'avatar-ipEzvc61VHd0jI2dWg.jpg','k.karunakaran',NULL,NULL,NULL,0,'en-GB',1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(5,'','$2y$10$d0DhF/ZftkUVoUpk3RMvQeOcXkmBj8ru2C4tQTbuNh5zb8104zXs6','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'Arpan Sharma','sharma','2022-11-30 04:06:56','2022-11-30 04:06:56',NULL,NULL,NULL,NULL,4,NULL,'senior software engineer',NULL,NULL,NULL,'a.sharma',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(6,'','$2y$10$O/jJhQhOmx0uzYx2EMKM4uAgvg/3faBPtbZnEqA0io/oh9/ZLkl0K','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-12-14 08:50:26',NULL,NULL,'keshav','sharma','2022-11-30 04:09:17','2022-12-14 08:50:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'k.sharma',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(7,'','$2y$10$sajoATPZE.H.D2aoHL7kUuOsFoQl64flnZ12cJ/ipCDzZDf5iDfcu','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'nirbhay ','singh','2022-11-30 04:13:35','2022-11-30 04:13:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'n.singh',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(8,'','$2y$10$d2a4l7R6UKWS4wt465PTBOihdn6P8PnLWUD.2QGLhvXgHqtwekC/u','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'Shahzaib','mohd','2022-11-30 04:16:55','2022-11-30 04:16:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'m.shahzaib',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(9,'','$2y$10$d4b7yQBcOCXbH75eFoxOJ.YYXWaquZaEI2lILCiZ17ReWqjl8F9EC','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'Shalu','sharma','2022-11-30 05:19:58','2022-11-30 05:19:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.sharma',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(10,'','$2y$10$SExEFMrXVtTSjgs1Ifdj3u7uytbLesgEDXT/1m2MBrFYZxvTVXjTS','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'rohit ','negi','2022-11-30 05:22:57','2022-11-30 05:22:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'r.negi',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(11,'','$2y$10$CRBxOV3ukBnQKEftO/HbiuaASL/aGOVX7sexeDtGuszjlrlk3Pkda','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'chetan ','singh','2022-12-01 05:28:54','2022-12-01 05:28:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'c.singh',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(12,'','$2y$10$NmN1SCd0KROTI6PwgyrjReZHUscDxeXVPYp3pNad2UZ4H9YxWNL6C','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-12-14 09:00:01',NULL,NULL,'salman ','khan','2022-12-01 05:30:45','2022-12-14 09:00:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.khan',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(13,'','$2y$10$kEUApR.Zi9I7GFXtRJgPNOVimx98kykqEpA2rrXK6C1Ed9Z1dflku','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'sipra','rani','2022-12-01 05:32:30','2022-12-01 05:32:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.rani',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(14,'','$2y$10$9d4jq9eg6CsQ4T1Ho.8/yOuCJBqxwvrxX/PVxqjb.6oeMDfHw3fXa','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'laxmi','priya','2022-12-01 05:34:00','2022-12-01 05:34:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'l.priya',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(15,'','$2y$10$p89pyUzwPe3rpSwMTUupGOQYk6Y7lTpAb8JbbbPPN0QmJQpkdQa/e','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'satya','pal','2022-12-01 05:35:55','2022-12-02 06:17:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.pal',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(16,'','$2y$10$ziRqVuDgxgZnxFJHg115mOQPlFMH0gFoENRoE2CKIhJRxqQRBmwWq','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'Brijesh','kannojia','2022-12-02 06:18:18','2022-12-02 06:18:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'b.kannojia',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(17,'','$2y$10$3/FEZyEdq..pTCA9sNVohuRJhuCqArycT3EJkF/0JTLFTid/2wP8a','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'suraj','wasan','2022-12-02 06:20:06','2022-12-02 06:20:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.wasan',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(18,'','$2y$10$D.mOd68Dyamlhzxh1oDi8uAemFWkcy4wbXlWQan/ZC2uNGmu2saby','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'pratik','porwal','2022-12-02 06:22:03','2022-12-02 06:22:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p.porwal',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(19,'','$2y$10$yLUoLCRgcuAjtP.y6dDCvOeAW8N9y0NNDxiWdHDjyJ4mddVnuZ/Z6','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'shantanu','pathak','2022-12-02 06:25:31','2022-12-02 06:26:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.pathak',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(20,'','$2y$10$UQrnPYrSzV2GctA5Qr6Mie0Fm/uQE7X7DFqRK7VIjs/26J0SD9oe2','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'nirbhay','singh','2022-12-02 06:30:27','2022-12-02 06:30:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'n1.singh',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(21,'','$2y$10$euiJUJHL.A7PiCigQ.1bVOmhFbTj97qCNsG2k9vP4Qv6u77YIgU9a','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'varun','sarpal','2022-12-05 05:09:03','2022-12-05 05:09:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'v.sarpal',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(22,'','$2y$10$c4JrjD5MoNoaYsnjxPAvDObbZ24lzRi7DymOjVePaLlbWMBaK2KJ6','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'swati','grover','2022-12-05 05:10:24','2022-12-05 05:10:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.grover',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(23,'','$2y$10$HHaoPy4WY7yrVK698ul9gOHvhRsfz1CSQ0jZ.YxpxlO/xTq2j7pmO','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'saurabh','tiwari','2022-12-05 05:12:37','2022-12-05 05:12:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.tiwari',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(24,'','$2y$10$.QXGqcjuUK/K3pSBIFbEee15WpnawrNxzgqmgjbBzSW.HHOro1Dda','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'Rohit','Kumar','2022-12-05 05:16:55','2022-12-05 05:16:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'r.kumar',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(25,'','$2y$10$WWhKHFGzyqZvIYDw1QT8kuuydl.DuykF1C6/LzsnqgJIztG.zysTC','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'Jatin','Agrawal','2022-12-05 05:18:46','2022-12-05 05:18:46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'j.argawal',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(26,'','$2y$10$1TV9B9uOokz94rDmkMTDhu1lNorjCDZputtd76JN2lb2I0RVkreFa','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'satyam','pandey','2022-12-05 05:20:39','2022-12-05 05:20:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.pandey',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(27,'','$2y$10$fRQ1dN32MfSGVDkbi1MT6equsOrEZ4Qg.8c3xgUsoOhHYNd9U2ss.','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'Sipra','Nayak','2022-12-05 05:24:23','2022-12-05 05:24:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.nayak',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(28,'','$2y$10$NOGv/KyubwWSm.IqXi25g.8vJAmFSNXUSuMnjDSj9fOZlg2cG4mqy','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'dheeraj','yadav','2022-12-05 05:28:02','2022-12-05 05:28:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'d.yadav',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(29,'','$2y$10$VljFrGEEd/bILB2R0/05g.NB4JisGVMso6PzOXNt34Bpcvn5SX0Ie','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'Ishvar','Kharche','2022-12-05 05:32:22','2022-12-05 05:32:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'i.kharche',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(30,'','$2y$10$gRqfU0ggrVz2.aLbykbY8.sRaPpH1n/sBnc2dzlcfSUDYXrRmDZKi','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'Pragati','Ojha','2022-12-05 05:33:50','2022-12-05 05:33:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p.ojha',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(31,'','$2y$10$afCUN.trkAyluQLMT1/iau.HjKl.LQnGHA9zhnJtjjbepSu.uBplK','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-12-14 06:47:15',NULL,NULL,'payal','jain','2022-12-05 05:35:55','2022-12-14 06:47:15',NULL,NULL,'IN',NULL,4,'+917838134532','HEAD HUMAN RESOURCE OF GLOTELLIGENCE',NULL,'+917838134532',NULL,'payal.jain',NULL,NULL,'I5Wm353KgbXbtRMOUcGMwDRt4hsjYMEU5EXNDdfLyUhiFOcP3JxCu2jJV9yn',0,'en',1,NULL,0,0,NULL,'E-2-58, Sector-16, Rohini','india','del','110089',NULL,0,NULL,NULL,NULL),(32,'','$2y$10$jzRcQGCaubibgbnM7mIeVOmoOi.OmbQr/nvSc8luEGzBF8hYjQDKC','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-12-14 05:27:01',NULL,NULL,'Manish','Mishra','2022-12-05 05:38:20','2022-12-14 05:27:01',NULL,NULL,'IN',NULL,4,'+919999501066,+919999501066','CHIEF TECHNICAL OFFICER',NULL,NULL,NULL,'manish.mishra',NULL,NULL,NULL,0,'en',1,NULL,0,0,NULL,'House no:  T82/TF Area/ sector: Tuscan Floors, TDI City, Kundli Landmark:  City: Sonipat State: Haryana Pincode: 130228','india','del','110044',NULL,0,NULL,NULL,NULL),(33,'','$2y$10$Qd7GpNYJQ22AlBWbFNP.WuzVCA8uf4uMrA8Bnjz5yN6H2n7Y9K/mW','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'Sameer','Sheikh','2022-12-05 05:48:51','2022-12-05 05:51:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.sheikh',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(34,'','$2y$10$XZI5zOhZrIjuBvdVYpqybOsDWaXQr65ojAKegop9i0flZUqSEMKiu','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-12-15 05:10:00',NULL,NULL,'Maitri','Mahajan','2022-12-05 05:53:39','2022-12-15 05:10:00',NULL,NULL,NULL,NULL,4,'+918586012389','HUMAN RESOURCE',NULL,NULL,NULL,'maitri.mahajan',NULL,NULL,'Y1QEulDYJ7lUEmJGWeMmK5V1fSwm8xF0mNA03Ne9yL6dwJV8MkYbOuV6FxmI',0,NULL,1,NULL,0,0,NULL,'5/13,2nd Floor, Backside Entry, West Patel Nagar','india','del','110008',NULL,0,NULL,NULL,NULL),(35,'','$2y$10$uZE2QWtNW5nZvVg4ZWakketb8yXlM0yu3d79ATG7g1Oq0v/bK6JWW','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'pawan','singh','2022-12-05 06:06:03','2022-12-05 06:07:09','2022-12-05 06:07:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p.singh',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(36,'','$2y$10$PvRMquvTJaBL6zBOtj36Je2EJTMf.YsaRriutZCSmeQeB1uSxun5W','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'anuj','bhardwaj','2022-12-06 10:16:13','2022-12-06 10:16:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a.bharadwaj',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(37,'','$2y$10$VdKL6V0PmC1hO0JyIPMAQe4lOK3ZjBGRxT/hPQvglh4MKU/QJNfKW','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'Shaily','Kandpal','2022-12-06 10:18:52','2022-12-06 10:18:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.kandpal',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(38,'','$2y$10$SGR/eOZ46lj08X9n1XXbke5a2SZjRzq1rO6OmXCmu4Srx7aNbo2Dq','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'Pawan','singh','2022-12-06 10:21:32','2022-12-06 10:23:04','2022-12-06 10:23:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p.singh',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(39,'','$2y$10$iePEQNKeZ6eH0RtoiMGHze1axJiSiW7BPGRuqRtHbjPYpFfcexl9W','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'prince','sharma','2022-12-06 10:23:39','2022-12-06 10:23:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p.sharma',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(40,'','$2y$10$RY3cuo19h00.ICnA1uyx.eI95AFq.rRZVjSmh/f1vShjz3EasBGLu','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'nitesh','singh','2022-12-06 10:27:12','2022-12-06 10:27:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nitesh.singh',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(41,'','$2y$10$Q9emXfndGyp.ZtFkZZmUQOjXJrP5fHQqdw7QiswBNaXWnUt3wjlyu','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'sagar','chauhan','2022-12-09 14:13:44','2022-12-09 14:13:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.chauhan',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(42,'','$2y$10$BXf.1Zao6IGYbbK.HXtT6esPY79Znv0EtyVqo8rQxs4qC./w5Y7Mm','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'varsha','singh','2022-12-09 14:15:39','2022-12-09 14:15:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'v.singh',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(43,'','$2y$10$2f0vLVNLic5erMgHwog8FeyVJ2FwknsqoaYOeNiIze0ZzktoWWrVK','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'swati','grover','2022-12-09 14:17:46','2022-12-09 14:20:57','2022-12-09 14:20:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'swati.grover',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(44,'','$2y$10$zby9wHNUgXjYWF2amOlCsuBf9wTZ4LCDsqDNterRJPfsYVskEh8kC','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'s','venga','2022-12-09 14:22:18','2022-12-09 14:22:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.venga',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(45,'','$2y$10$c.hfLdZHLj.k7n.iugwTKuj56Viu7/If6BXWbvJvTUgoZbfmWmQve','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-12-09 14:55:56',NULL,NULL,'sunil','kushwaha','2022-12-09 14:24:56','2022-12-09 14:55:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.kushwaha',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(46,'','$2y$10$cHN91m.YW4.sy4AAbOWy6e2vvY2WngmkTabxLTpWg1KxpRhAJmWXe','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'Manohar','Adabala','2022-12-09 14:26:33','2022-12-09 14:26:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'m.adabala',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(47,'','$2y$10$kVoQejbarCIYgrtqz6unMuv0GDdFK23sgdO2TQ///bTGpQpxaZBhe','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'ajay','kumar','2022-12-09 14:28:03','2022-12-09 14:40:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a.kumar',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(48,'','$2y$10$6/BXSZrPJNKReJBsuAx8hegp.mf56g/S2SfFutUGWszEJHtsBFBH.','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'jigar','bhatia','2022-12-09 14:29:42','2022-12-09 14:29:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'j.bhatia',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(49,'','$2y$10$yBsrpvmO/U8PfG8JMCVLGeqxdjsaKXi/ZkW58MaJIbMzxXzPEJsji','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'sainath','galge','2022-12-09 14:31:26','2022-12-09 14:31:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.galge',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(50,'','$2y$10$Spw8BY8dnpiHcvmoxMeBMuRhtzJH/3uTav4AjAsNVmBUz0zgCaX02','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-12-14 10:08:45',NULL,NULL,'komal','kumari','2022-12-09 14:32:54','2022-12-14 10:08:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'k.kumari',NULL,NULL,'T4TdWcbEhggyZ6EZzaauLfQ61Qn3zyBDKAR4mWzCRuB4iJBHBblPHb60KIXs',0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(51,'','$2y$10$rdG7TqJ5NsoVbJ1ZRM6lfefEM/c4XZH1P0EHynFmNaTZaGmlSazea','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-12-14 15:48:29',NULL,NULL,'akanksha','anand','2022-12-09 14:35:09','2022-12-14 15:49:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a.anand',NULL,NULL,'49Uypmz2PakG7yfW4ZeKyCmW7CDbQxBa5xoilJ9CBldqw6BQ7MYM8R9XYwuo',0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(52,'','$2y$10$SnGqE5WpDXTFGO6o0KsrVOC06VjVMealdBoEM3APxF4y7ROoQw2qy','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-12-14 13:29:13',NULL,NULL,'akshay','shamrao','2022-12-09 14:43:00','2022-12-14 13:29:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a.shamrao',NULL,NULL,'DIJ6dYpb9xZznuUsrptftSyN1YEgIrQXC0pg4ffuz7ngaRFA6YU36E8N0bDS',0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(53,'','$2y$10$iS3Xr28sjPVZf3X2YHrliOeZfPSk2FhyDwFMBbnUBNEwbSm9MxXRa','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-12-14 05:39:46',NULL,NULL,'ravinder','kumar','2022-12-09 14:44:54','2022-12-14 05:39:46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ravinder.kumar',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(54,'','$2y$10$Ws/VXnpfnDWRYPK/k5L4R.idZQLeRzbTogAhtoXzWRrHtzDcQN8wu','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'obaid','aslam','2022-12-09 14:46:35','2022-12-09 14:48:36','2022-12-09 14:48:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'obaid.aslam',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(55,'','$2y$10$R/41k0ZUG/PNPGFa8V4fve8Zj0nibgh9nHV1kPM86B/Pnsp9IAJaS','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-12-14 06:16:26',NULL,NULL,'sunny','gupta','2022-12-09 14:49:35','2022-12-14 06:16:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.gupta',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(56,'','$2y$10$1HsvtII79vcaUDdDUm27HeiTnWtkBIT/mOTqyQSv.e13rRaafw/US','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,'2022-12-14 05:38:39',NULL,NULL,'ankush','kumar','2022-12-09 14:51:17','2022-12-14 05:38:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ankush.kumar',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(57,'','$2y$10$8V8Om.cbM5ptSj5uhzb1muFuBZ5if2JKaX7erv0ve2X.s7tbqlwsq','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'neelu','singh','2022-12-09 14:52:48','2022-12-09 14:52:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'neelu.singh',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(58,'','$2y$10$Nt3SpEyxfl0dN7mgEdOrxummV5JO2GLNqwbt9gy8ZEq/nty87Rwji','{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"accessories.files\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"consumables.files\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"licenses.files\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"components.files\":\"0\",\"kits.view\":\"0\",\"kits.create\":\"0\",\"kits.edit\":\"0\",\"kits.delete\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\",\"self.checkout_assets\":\"0\"}',1,1,NULL,NULL,NULL,NULL,NULL,'subhjyoti','panda','2022-12-09 14:54:12','2022-12-09 14:54:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s.panda',NULL,NULL,NULL,0,NULL,1,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groups` (
  `user_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-17 14:24:09
