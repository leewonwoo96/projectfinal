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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machines`
--

LOCK TABLES `machines` WRITE;
/*!40000 ALTER TABLE `machines` DISABLE KEYS */;
INSERT INTO `machines` VALUES (1,'m1','m1_img',1,'2022-11-09','m1-info','m1-detail'),(2,'m2','m2_img',2,'2022-11-08','m2-info','m2-detail'),(3,'m3','m3_img',3,'2022-11-07','m3-info','m3-detail'),(4,'m4','m4_img',4,'2022-11-06','m4-info','m4-detail'),(5,'m5','m5_img',5,'2022-11-05','m5-info','m5-detail'),(6,'m6','m6_img',6,'2022-11-04','m6-info','m6-detail'),(7,'m7','m7_img',7,'2022-11-03','m7-info','m7-detail'),(8,'m8','m8_img',8,'2022-11-02','m8-info','m8-detail');
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
  CONSTRAINT `matching_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`) ON DELETE CASCADE ON UPDATE CASCADE
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
  CONSTRAINT `matching_comments_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matching_comments_ibfk_2` FOREIGN KEY (`mat_num`) REFERENCES `matching` (`mat_num`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `prod_name` varchar(20) NOT NULL,
  `period` tinyint NOT NULL,
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
INSERT INTO `product` VALUES ('1개월',1,0,0),('1개월+PT',1,1,5),('3개월',3,0,0),('3개월+PT',3,1,10),('6개월',6,0,0),('6개월+PT',6,1,20);
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
  CONSTRAINT `pt_reserv_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Temporary view structure for view `rankingview`
--

DROP TABLE IF EXISTS `rankingview`;
/*!50001 DROP VIEW IF EXISTS `rankingview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rankingview` AS SELECT 
 1 AS `user_email`,
 1 AS `ranking`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `recommend`
--

DROP TABLE IF EXISTS `recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommend` (
  `rec_num` int NOT NULL AUTO_INCREMENT,
  `rec_title` text NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `rec_content` text NOT NULL,
  `views` int DEFAULT '0',
  `rec_comments` int DEFAULT '0',
  `rec_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `mod_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rec_num`),
  KEY `user_email` (`user_email`),
  CONSTRAINT `recommend_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommend`
--

LOCK TABLES `recommend` WRITE;
/*!40000 ALTER TABLE `recommend` DISABLE KEYS */;
INSERT INTO `recommend` VALUES (2,'123','kang0825@naver.com','1234',9,0,'2022-11-10 03:04:38','2022-11-10 03:04:38');
/*!40000 ALTER TABLE `recommend` ENABLE KEYS */;
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
  CONSTRAINT `recommend_comments_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recommend_comments_ibfk_2` FOREIGN KEY (`rec_num`) REFERENCES `recommend` (`rec_num`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `trainer` varchar(10) DEFAULT NULL,
  `squat` smallint DEFAULT '0',
  `benchpress` smallint DEFAULT '0',
  `deadlift` smallint DEFAULT '0',
  PRIMARY KEY (`user_email`),
  UNIQUE KEY `user_tel` (`user_tel`),
  KEY `prod_name` (`prod_name`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`prod_name`) REFERENCES `product` (`prod_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('kang0825@naver.com','qwer1234','강현무','M','01021298198','A',NULL,NULL,NULL,90,70,110),('trainer1@naver.com','0000','트레이너1','M','01022220001','T',NULL,NULL,NULL,180,150,220),('trainer2@naver.com','0000','트레이너2','F','01022220002','T',NULL,NULL,NULL,70,40,80),('user1@naver.com','0000','일반유저1','M','01011110001','U','3개월','2022-09-05','트레이너1',70,45,75),('user2@naver.com','0000','일반유저2','F','01011110002','U','6개월+PT','2022-06-23','트레이너1',60,30,70),('user3@naver.com','0000','일반유저3','M','01011110003','U','1개월','2022-10-29',NULL,250,190,285),('user4@naver.com','0000','일반유저4','M','01011110004','U','3개월+PT','2022-11-09','트레이너2',50,30,80);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_view`
--

DROP TABLE IF EXISTS `user_view`;
/*!50001 DROP VIEW IF EXISTS `user_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_view` AS SELECT 
 1 AS `user_email`,
 1 AS `user_name`,
 1 AS `gender`,
 1 AS `user_tel`,
 1 AS `prod_name`,
 1 AS `buy_date`,
 1 AS `remain`,
 1 AS `trainer`,
 1 AS `days`,
 1 AS `big3`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `rankingview`
--

/*!50001 DROP VIEW IF EXISTS `rankingview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rankingview` AS select `user`.`user_email` AS `user_email`,rank() OVER (ORDER BY ((`user`.`squat` + `user`.`benchpress`) + `user`.`deadlift`) desc )  AS `ranking` from `user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_view`
--

/*!50001 DROP VIEW IF EXISTS `user_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_view` AS select `user`.`user_email` AS `user_email`,`user`.`user_name` AS `user_name`,`user`.`gender` AS `gender`,`user`.`user_tel` AS `user_tel`,`user`.`prod_name` AS `prod_name`,`user`.`buy_date` AS `buy_date`,(to_days((`user`.`buy_date` + interval (`product`.`period` * 30) day)) - to_days(now())) AS `remain`,`user`.`trainer` AS `trainer`,`product`.`days` AS `days`,((`user`.`squat` + `user`.`benchpress`) + `user`.`deadlift`) AS `big3` from (`user` left join `product` on((`user`.`prod_name` = `product`.`prod_name`))) where (`user`.`user_type` = 'U') order by `user`.`user_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-11 19:21:19
