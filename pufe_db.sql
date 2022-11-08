CREATE DATABASE  IF NOT EXISTS `pufe_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pufe_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: pufe_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `machines`
--

DROP TABLE IF EXISTS `machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machines` (
  `mch_num` int NOT NULL AUTO_INCREMENT,
  `mch_name` varchar(20) NOT NULL,
  `mch_img` varchar(60) NOT NULL,
  `mch_serial` int NOT NULL,
  `mch_date` date NOT NULL,
  `mch_info` varchar(60) NOT NULL,
  `mch_detail` text NOT NULL,
  PRIMARY KEY (`mch_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machines`
--

LOCK TABLES `machines` WRITE;
/*!40000 ALTER TABLE `machines` DISABLE KEYS */;
/*!40000 ALTER TABLE `machines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matching`
--

DROP TABLE IF EXISTS `matching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matching` (
  `mat_num` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(30) NOT NULL,
  `part` char(6) NOT NULL,
  `mat_date` date NOT NULL,
  `mat_time` time NOT NULL,
  `gender` char(1) NOT NULL,
  `mat_complete` tinyint(1) NOT NULL,
  PRIMARY KEY (`mat_num`),
  KEY `user_email` (`user_email`),
  CONSTRAINT `matching_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matching`
--

LOCK TABLES `matching` WRITE;
/*!40000 ALTER TABLE `matching` DISABLE KEYS */;
/*!40000 ALTER TABLE `matching` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matching_comments`
--

DROP TABLE IF EXISTS `matching_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matching_comments` (
  `mat_com_num` int NOT NULL AUTO_INCREMENT,
  `mat_num` int NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `mat_text` text NOT NULL,
  `mat_date` date NOT NULL,
  PRIMARY KEY (`mat_com_num`),
  KEY `user_email` (`user_email`),
  KEY `mat_num` (`mat_num`),
  CONSTRAINT `matching_comments_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`),
  CONSTRAINT `matching_comments_ibfk_2` FOREIGN KEY (`mat_num`) REFERENCES `matching` (`mat_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matching_comments`
--

LOCK TABLES `matching_comments` WRITE;
/*!40000 ALTER TABLE `matching_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `matching_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prod_name` varchar(10) NOT NULL,
  `period` date NOT NULL,
  `PT` tinyint NOT NULL,
  `days` tinyint DEFAULT NULL,
  PRIMARY KEY (`prod_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pt_reserv`
--

DROP TABLE IF EXISTS `pt_reserv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pt_reserv` (
  `pt_num` int NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `pt_date` date NOT NULL,
  `pt_time` time NOT NULL,
  `pt_booked` tinyint(1) NOT NULL,
  PRIMARY KEY (`pt_num`),
  KEY `user_email` (`user_email`),
  CONSTRAINT `pt_reserv_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pt_reserv`
--

LOCK TABLES `pt_reserv` WRITE;
/*!40000 ALTER TABLE `pt_reserv` DISABLE KEYS */;
/*!40000 ALTER TABLE `pt_reserv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommend_boarder`
--

DROP TABLE IF EXISTS `recommend_boarder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommend_boarder` (
  `rec_num` int NOT NULL AUTO_INCREMENT,
  `rec_title` varchar(40) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `views` int NOT NULL,
  `rec_comments` int NOT NULL,
  `rec_date` date NOT NULL,
  PRIMARY KEY (`rec_num`),
  KEY `user_email` (`user_email`),
  CONSTRAINT `recommend_boarder_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommend_boarder`
--

LOCK TABLES `recommend_boarder` WRITE;
/*!40000 ALTER TABLE `recommend_boarder` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommend_boarder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommend_comments`
--

DROP TABLE IF EXISTS `recommend_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommend_comments` (
  `rec_com_num` int NOT NULL AUTO_INCREMENT,
  `rec_num` int NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `com_text` text NOT NULL,
  `com_date` date NOT NULL,
  PRIMARY KEY (`rec_com_num`),
  KEY `user_email` (`user_email`),
  KEY `rec_num` (`rec_num`),
  CONSTRAINT `recommend_comments_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`),
  CONSTRAINT `recommend_comments_ibfk_2` FOREIGN KEY (`rec_num`) REFERENCES `recommend_boarder` (`rec_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommend_comments`
--

LOCK TABLES `recommend_comments` WRITE;
/*!40000 ALTER TABLE `recommend_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommend_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_email` varchar(30) NOT NULL,
  `user_pw` varchar(20) NOT NULL,
  `user_name` varchar(10) NOT NULL,
  `gender` char(1) NOT NULL,
  `user_tel` char(11) NOT NULL,
  `user_type` char(1) NOT NULL,
  `prod_name` varchar(10) DEFAULT NULL,
  `buy_date` date DEFAULT NULL,
  `squat` smallint DEFAULT '0',
  `benchpress` smallint DEFAULT '0',
  `deadlift` smallint DEFAULT '0',
  PRIMARY KEY (`user_email`),
  UNIQUE KEY `user_tel` (`user_tel`),
  KEY `prod_name` (`prod_name`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`prod_name`) REFERENCES `product` (`prod_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('kang0825@naver.com','qwer1234','강현무','M','01021298198','A',NULL,NULL,10,10,10),('trainer1@naver.com','0000','트레이너1','M','01022220001','T',NULL,NULL,0,0,0),('trainer2@naver.com','0000','트레이너2','F','01022220002','T',NULL,NULL,0,0,0),('user1@naver.com','0000','일반유저1','M','01011110001','U',NULL,NULL,0,0,0),('user2@naver.com','0000','일반유저2','F','01011110002','U',NULL,NULL,0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-07 22:22:08
