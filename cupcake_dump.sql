CREATE DATABASE  IF NOT EXISTS `cupcake` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cupcake`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cupcake
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `bottoms`
--

DROP TABLE IF EXISTS `bottoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bottoms` (
  `bottom_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`bottom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottoms`
--

LOCK TABLES `bottoms` WRITE;
/*!40000 ALTER TABLE `bottoms` DISABLE KEYS */;
INSERT INTO `bottoms` VALUES (1,'Chocolate',5),(2,'Vanilla',5),(3,'Nutmeg',5),(4,'Pistacio',6),(5,'Almond',7);
/*!40000 ALTER TABLE `bottoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `zipcode` int NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`zipcode`),
  UNIQUE KEY `zipcode_UNIQUE` (`zipcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_info` (
  `user_id` int NOT NULL,
  `address` varchar(45) NOT NULL,
  `zipcode` int NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_contact_info_city_idx` (`zipcode`),
  CONSTRAINT `fk_contact_info_city` FOREIGN KEY (`zipcode`) REFERENCES `city` (`zipcode`),
  CONSTRAINT `fk_contact_info_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_info`
--

LOCK TABLES `contact_info` WRITE;
/*!40000 ALTER TABLE `contact_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderline` (
  `order_id` int NOT NULL,
  `quantity` int NOT NULL,
  `topping_id` int NOT NULL,
  `bottom_id` int NOT NULL,
  PRIMARY KEY (`order_id`,`topping_id`,`bottom_id`),
  KEY `fk_orders_has_product_orders1_idx` (`order_id`),
  KEY `fk_orderline_toppings1_idx` (`topping_id`),
  KEY `fk_orderline_bottoms1_idx` (`bottom_id`),
  CONSTRAINT `fk_orderline_bottoms1` FOREIGN KEY (`bottom_id`) REFERENCES `bottoms` (`bottom_id`),
  CONSTRAINT `fk_orderline_toppings1` FOREIGN KEY (`topping_id`) REFERENCES `toppings` (`toppings_id`),
  CONSTRAINT `fk_orders_has_product_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total` double NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isDelivered` tinyint(1) NOT NULL DEFAULT '0',
  `isPaid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_users1_idx` (`user_id`),
  CONSTRAINT `fk_orders_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `toppings`
--

DROP TABLE IF EXISTS `toppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toppings` (
  `toppings_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`toppings_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toppings`
--

LOCK TABLES `toppings` WRITE;
/*!40000 ALTER TABLE `toppings` DISABLE KEYS */;
INSERT INTO `toppings` VALUES (1,'Chocolate',5),(2,'Blueberry',5),(3,'Rasberry',5),(4,'Crispy',6),(5,'Strawberry',6),(6,'Rum/Raisin',7),(7,'Orange',8),(8,'Lemon',8),(9,'Blue cheese',9);
/*!40000 ALTER TABLE `toppings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `balance` double NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user','1','customer',6857),(2,'admin','1','employee',5000);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-20 10:16:53
