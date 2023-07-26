-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project7
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `bankaccounts`
--
-- @block Users and Company and Address

DROP TABLE IF EXISTS `bankaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankaccounts` (
  `bankaccount_id` int NOT NULL AUTO_INCREMENT,
  `moneyamount` decimal(10,2) DEFAULT NULL,
  `property_id` int DEFAULT NULL,
  PRIMARY KEY (`bankaccount_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `bankaccounts_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankaccounts`
--

LOCK TABLES `bankaccounts` WRITE;
/*!40000 ALTER TABLE `bankaccounts` DISABLE KEYS */;
INSERT INTO `bankaccounts` VALUES (1,1500.50,11),(2,3000.75,13),(3,2000.00,16),(4,5000.25,18),(5,1000.50,19),(6,4000.00,21);
/*!40000 ALTER TABLE `bankaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basepayment`
--

DROP TABLE IF EXISTS `basepayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basepayment` (
  `property_id` int NOT NULL,
  `base_payment_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`property_id`),
  CONSTRAINT `basepayment_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basepayment`
--

LOCK TABLES `basepayment` WRITE;
/*!40000 ALTER TABLE `basepayment` DISABLE KEYS */;
INSERT INTO `basepayment` VALUES (11,800.00),(12,700.00),(13,500.00),(14,900.00),(15,200.00),(16,350.00),(17,550.00),(18,650.00),(19,360.00),(20,740.00);
/*!40000 ALTER TABLE `basepayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elevators`
--

DROP TABLE IF EXISTS `elevators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elevators` (
  `code` int NOT NULL AUTO_INCREMENT,
  `number_of_passengers` int DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `operating_cost` int DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `manufacturer_must_exist` (`manufacturer`),
  CONSTRAINT `manufacturer_must_exist` FOREIGN KEY (`manufacturer`) REFERENCES `elevators_manufacturer` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elevators`
--

LOCK TABLES `elevators` WRITE;
/*!40000 ALTER TABLE `elevators` DISABLE KEYS */;
INSERT INTO `elevators` VALUES (11,4,'Manufacturer 1',1000),(12,6,'Manufacturer 2',1200),(13,8,'Manufacturer 3',1500),(14,5,'Manufacturer 1',1100),(15,7,'Manufacturer 2',1300),(16,9,'Manufacturer 3',1600),(17,6,'Manufacturer 1',1200),(18,8,'Manufacturer 2',1400),(19,10,'Manufacturer 3',1700),(20,7,'Manufacturer 1',1300);
/*!40000 ALTER TABLE `elevators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elevators_manufacturer`
--

DROP TABLE IF EXISTS `elevators_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elevators_manufacturer` (
  `name` varchar(255) NOT NULL,
  `phone` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elevators_manufacturer`
--

LOCK TABLES `elevators_manufacturer` WRITE;
/*!40000 ALTER TABLE `elevators_manufacturer` DISABLE KEYS */;
INSERT INTO `elevators_manufacturer` VALUES ('Manufacturer 1',12345678,'manufacturer1@example.com'),('Manufacturer 2',98765432,'manufacturer2@example.com'),('Manufacturer 3',56789012,'manufacturer3@example.com'),('Manufacturer 4',12345878,'manufacturer4@example.com'),('Manufacturer 5',98123432,'manufacturer5@example.com');
/*!40000 ALTER TABLE `elevators_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extrapayment`
--

DROP TABLE IF EXISTS `extrapayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extrapayment` (
  `extra_payment_id` int NOT NULL AUTO_INCREMENT,
  `property_id` int DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `extra_payment_description` varchar(100) DEFAULT NULL,
  `extra_payment_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`extra_payment_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `extrapayment_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extrapayment`
--

LOCK TABLES `extrapayment` WRITE;
/*!40000 ALTER TABLE `extrapayment` DISABLE KEYS */;
INSERT INTO `extrapayment` VALUES (1,11,'July','Maintenance Fee',100.00),(2,12,'July','Maintenance Fee',100.00),(3,13,'July','Maintenance Fee',100.00),(4,14,'July','Maintenance Fee',100.00),(5,15,'July','Maintenance Fee',100.00),(6,16,'July','Maintenance Fee',100.00);
/*!40000 ALTER TABLE `extrapayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garbageremoval`
--

DROP TABLE IF EXISTS `garbageremoval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garbageremoval` (
  `garbage_id` int NOT NULL AUTO_INCREMENT,
  `property_id` int DEFAULT NULL,
  `day_of_week` varchar(20) DEFAULT NULL,
  `collection_time` time DEFAULT NULL,
  PRIMARY KEY (`garbage_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `garbageremoval_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garbageremoval`
--

LOCK TABLES `garbageremoval` WRITE;
/*!40000 ALTER TABLE `garbageremoval` DISABLE KEYS */;
INSERT INTO `garbageremoval` VALUES (1,11,'Wednesday','08:00:00'),(2,12,'Sunday','10:00:00'),(3,13,'Monday','09:00:00'),(4,14,'Tuesday','13:00:00'),(5,15,'Wednesday','15:00:00'),(6,16,'Thursday','07:00:00'),(7,17,'Sunday','08:00:00'),(8,18,'Monday','11:00:00'),(9,19,'Thursday','12:00:00');
/*!40000 ALTER TABLE `garbageremoval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenancefaults`
--

DROP TABLE IF EXISTS `maintenancefaults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenancefaults` (
  `fault_id` int NOT NULL,
  `property_id` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_reported` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fault_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `maintenancefaults_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenancefaults`
--

LOCK TABLES `maintenancefaults` WRITE;
/*!40000 ALTER TABLE `maintenancefaults` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenancefaults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `manager_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`manager_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (1,'John Doe',5365478,'john.doe@example.com','hashed_password_1'),(2,'Jane Smith',5214569,'jane.smith@example.com','hashed_password_2'),(3,'Manager Name',54658745,'manager@example.com','hashed_password_3');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwords`
--

DROP TABLE IF EXISTS `passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passwords` (
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `passwords_ibfk_1` FOREIGN KEY (`email`) REFERENCES `tenants` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwords`
--

LOCK TABLES `passwords` WRITE;
/*!40000 ALTER TABLE `passwords` DISABLE KEYS */;
INSERT INTO `passwords` VALUES (' 2@','cc'),('@cc','1212'),('dd@ddeee','1212'),('dd@ddeeedd','1212'),('ee@dd','1212'),('ee@ddee','1212'),('ee@ff','1212'),('fdcx@sf.fd','1212'),('ff@ff','1212'),('janejohnson@example.com','1212'),('johnsmith@example.com','1245'),('kobi@gmail.com','xx'),('michaelbrown@example.com','111'),('safs@sgfs','1414'),('sgdfgb@dgb','1212'),('vv@vv','1212'),('ww@ww','1212'),('wwee@ww','1212'),('xx@xxxxx','1212'),('xxxx@xxx','1212'),('zz@zz','1212');
/*!40000 ALTER TABLE `passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `card_type` varchar(20) DEFAULT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `card_holder_name` varchar(100) DEFAULT NULL,
  `expiration_month` varchar(2) DEFAULT NULL,
  `expiration_year` varchar(4) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (2,1,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',800.00),(3,12,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',700.00),(4,13,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',600.00),(5,7,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',500.00),(6,15,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',400.00),(7,16,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',300.00),(8,17,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',500.00),(9,17,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',600.00),(10,17,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',700.00),(11,18,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',200.00),(12,6,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',300.00),(13,20,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',200.00),(15,1,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',800.00),(16,12,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',700.00),(17,13,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',600.00),(18,7,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',500.00),(19,15,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',400.00),(20,16,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',300.00),(21,17,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',500.00),(22,17,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',600.00),(23,17,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',700.00),(24,18,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',200.00),(25,6,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',300.00),(26,20,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',200.00),(27,5,'July 2023','Rent payment','Visa','**** **** **** 1234','John Doe','07','2025',300.00);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `number_of_apartments` int DEFAULT NULL,
  `contact` int DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_properties_address` (`address`,`city`),
  KEY `fk_property_manager` (`manager_id`),
  CONSTRAINT `fk_property_manager` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (11,'123 Main St','City A',5,1234567,1),(12,'456 Elm St','City B',8,9876543,2),(13,'789 Oak St','City C',10,5555555,1),(14,'321 Pine St','City D',4,7777777,2),(15,'654 Maple St','City E',6,9999999,1),(16,'987 Cedar St','City F',12,1111111,2),(17,'234 Walnut St','City G',9,2222222,1),(18,'567 Birch St','City H',7,3333333,3),(19,'890 Spruce St','City I',11,4444444,3),(20,'432 Cherry St','City J',3,6666666,3),(21,'xx','xx',9,50000,3);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyelevators`
--

DROP TABLE IF EXISTS `propertyelevators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyelevators` (
  `property_id` int NOT NULL,
  `elevator_code` int NOT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`property_id`,`elevator_code`),
  KEY `elevator_code` (`elevator_code`),
  CONSTRAINT `propertyelevators_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`),
  CONSTRAINT `propertyelevators_ibfk_2` FOREIGN KEY (`elevator_code`) REFERENCES `elevators` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyelevators`
--

LOCK TABLES `propertyelevators` WRITE;
/*!40000 ALTER TABLE `propertyelevators` DISABLE KEYS */;
INSERT INTO `propertyelevators` VALUES (12,15,2),(13,13,2),(14,12,2),(15,16,2),(17,17,2),(18,18,2),(19,11,2),(20,11,2);
/*!40000 ALTER TABLE `propertyelevators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenantpayments`
--

DROP TABLE IF EXISTS `tenantpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenantpayments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `tenantpayments_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenantpayments`
--

LOCK TABLES `tenantpayments` WRITE;
/*!40000 ALTER TABLE `tenantpayments` DISABLE KEYS */;
INSERT INTO `tenantpayments` VALUES (2,1,'2023-07-23',1200.00,'Credit Card'),(3,12,'2023-07-23',200.00,'Credit Card'),(4,12,'2023-07-23',200.00,'Cash'),(6,15,'2023-07-23',500.00,'Bank Transfer');
/*!40000 ALTER TABLE `tenantpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `apartment` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address` (`address`,`city`),
  KEY `idx_tenants_email` (`email`),
  CONSTRAINT `tenants_ibfk_1` FOREIGN KEY (`address`, `city`) REFERENCES `properties` (`address`, `city`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
INSERT INTO `tenants` VALUES (1,'John Smith','1234567890','johnsmith@example.com','123 Main St','City A',1),(2,'Jane -- Johnson','9876543210','janejohnson@example.com','456 Elm St','City B',2),(3,'Michael Brown','5555555555','michaelbrown@example.com','789 Oak St','City C',3),(4,'Emily Davis','7777777777','emilydavis@example.com','321 Pine St','City D',4),(5,'Robert Wilson','9999999999','robertwilson@example.com','654 Maple St','City E',1),(6,'Sarah Thompson','1111111111','sarahthompson@example.com','987 Cedar St','City F',2),(7,'David Anderson','2222222222','davidanderson@example.com','234 Walnut St','City G',3),(8,'Jessica Clark','3333333333','jessicaclark@example.com','567 Birch St','City H',4),(9,'Kevin Lee','4444444444','kevinlee@example.com','890 Spruce St','City I',2),(10,'Amy Turner','6666666666','amyturner@example.com','432 Cherry St','City J',3),(12,'xx','1234','kobi@gmail.com','432 Cherry St','City J',1),(13,'kk','kk','fdcx@sf.fd','123 Main St','City A',3),(15,'kk','kk','sgdfgb@dgb','123 Main St','City A',3),(16,'bb','bb','xxxx@xxx','456 Elm St','City B',4),(17,'qq','qq','zz@zz','432 Cherry St','City J',3),(18,'cc','cc','ww@ww','432 Cherry St','City J',3),(20,'cc','cc','wwee@ww','432 Cherry St','City J',5),(21,'hkgk','ssfvf','safs@sgfs','321 Pine St','City D',3),(22,'rrrrrr','rrrr','ff@ff','789 Oak St','City C',4),(23,'cccc','ccccc','vv@vv','321 Pine St','City D',5),(24,'ee','eee','ee@ff','987 Cedar St','City F',5),(25,'zz','zz','ee@dd','890 Spruce St','City I',4),(26,'cc','cc','ee@ddee','432 Cherry St','City J',2),(27,'xx','xx','xx@xxxxx','xx','xx',1),(28,'ss','ss',' 2@','xx','xx',2),(29,'ss','ss','dd@ddeee','xx','xx',3),(30,'ss','ss','dd@ddeeedd','xx','xx',4),(31,'ee','ee','@cc','xx','xx',5);
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-26 13:03:30
