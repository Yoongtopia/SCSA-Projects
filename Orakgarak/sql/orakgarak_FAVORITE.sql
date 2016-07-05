CREATE DATABASE  IF NOT EXISTS `orakgarak` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `orakgarak`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 14.52.4.160    Database: orakgarak
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.14.04.1

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
-- Table structure for table `FAVORITE`
--

DROP TABLE IF EXISTS `FAVORITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FAVORITE` (
  `userId` varchar(200) NOT NULL,
  `codeForFav` varchar(200) NOT NULL,
  PRIMARY KEY (`userId`,`codeForFav`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FAVORITE`
--

LOCK TABLES `FAVORITE` WRITE;
/*!40000 ALTER TABLE `FAVORITE` DISABLE KEYS */;
INSERT INTO `FAVORITE` VALUES ('11@11.com','007310'),('11@11.com','031980'),('12@12.net','005930'),('12@12.net','006660'),('12@12.net','009150'),('a@a.net','005930'),('abc@abc.com','000520'),('abc@abc.com','005930'),('abc@abc.com','009150'),('abc@abc.com','014580'),('admin@orak3garak.com','005930'),('admin@orakgarak.com','005930'),('anneshj@naver.com','006660'),('anneshj@naver.com','006730'),('asd@asd.net','005710'),('asd@asd.net','005930'),('guest@guest.net','005930'),('hi@hi.net','002220'),('hi@hi.net','009150'),('hihi@hi.net','001000'),('hihi@hi.net','009150'),('hihi@hi.net','011720'),('o@o.net','005930'),('opop@opop.net','005930'),('opop@opop.net','009150'),('scsa2@scsa.com','005930'),('scsa@samsung.net','005930'),('scsa@samsung.net','009150'),('scsa@scsa.com','031980'),('scsa@sds.com','005930'),('scsa@sds.com','009150');
/*!40000 ALTER TABLE `FAVORITE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-17 23:35:36
