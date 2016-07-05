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
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `email` varchar(70) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('11@11.com','11','정민철',11,'11111',NULL),('123@abc.com','123','개인투자자',29,'010-3212-1232',NULL),('12@12.net','123456','김민수',30,'010-1234-5678',NULL),('1@1.com','1234','어라잉',25,'213123',NULL),('abc@abc.com','123456','김하이',30,'012-010-0101',NULL),('admin@orakgarak.com','123456','관리자',28,'010-2624-2872','제주'),('anneshj@naver.com','123456','최현진',26,'010-9843-7755',NULL),('asd@asd.net','123456','김하잇',30,'010-6779-1444',NULL),('go_leafs_go8707@hotmail.com','wjdalscjf','Donkey',28,'010-9259-1401',NULL),('guest@guest.net','123456','김철수',30,'010-1234-5678',NULL),('hihihi@hi.net','123456','김용용',30,'010-1234-5678',NULL),('hiiii@hi.net','123456','김승최',30,'010-777-7777',NULL),('kohry123123@naver.com','dkrlffpf','김락윤',20,'010-3333-4444',NULL),('opop@opop.net','123456','김락락',30,'010-4444-4444',NULL),('scsa2@scsa.com','123','이삼성',30,'010-1234-5678',NULL),('scsa@samsung.net','123','삼성',30,'010-1234-5678',NULL),('scsa@sds.com','123','사회초년생',30,'010-1234-5678',NULL),('seunghwan23@naver.com','123','올라프',29,'010-4767-2352',NULL);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-17 23:35:50
