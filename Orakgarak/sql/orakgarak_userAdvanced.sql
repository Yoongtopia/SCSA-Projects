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
-- Table structure for table `userAdvanced`
--

DROP TABLE IF EXISTS `userAdvanced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userAdvanced` (
  `userId` varchar(200) NOT NULL,
  `evaluatedAsset` bigint(20) DEFAULT NULL,
  `remainCash` bigint(20) DEFAULT NULL,
  `originalAsset` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userAdvanced`
--

LOCK TABLES `userAdvanced` WRITE;
/*!40000 ALTER TABLE `userAdvanced` DISABLE KEYS */;
INSERT INTO `userAdvanced` VALUES ('11@11.com',0,100000000,0),('123@abc.com',0,100000000,0),('12@12.net',0,100000000,0),('1@1.com',0,100000000,0),('1@1.net',0,31750000,0),('a@a.com',0,100000000,0),('a@a.net',63720000,99840000,63720000),('abc@abc.com',306000,99694000,306000),('admin@orak3garak.com',0,100000000,0),('admin@orakgarak.com',0,99698000,0),('anneshj@naver.com',78557800,12467200,0),('asd@asd.net',0,100000000,0),('cgie@ahsd.com',100000000,100000000,0),('choi2@naver.com',100000000,100000000,0),('choi@gmail.com',0,100000000,0),('choi@naver.com',100000000,100000000,0),('djkwjl@sdjklsdjlf.com',0,100000000,NULL),('fg@han.ner',0,100000000,0),('go_leafs_go8707@hotmail.com',20369500,99217500,0),('guest@guest.net',0,100000000,0),('hi@hi.net',0,100000000,0),('hihi@hi.net',0,100000000,0),('hihihi@hi.net',13680000,86320000,13680000),('hiiii@hi.net',0,100000000,0),('hyoungks21@naver.com',16500,16500,16500),('k@k.net',0,86120000,0),('kohry123123@naver.com',0,100000000,0),('ksy@seoulnori.com',0,100000000,NULL),('o@o.net',100000000,100000000,0),('opop@opop.net',0,100000000,0),('scsa2@scsa.com',13690000,86310000,13690000),('scsa@samsung.net',607000,99393000,607000),('scsa@scsa.com',2052000,97948000,2052000),('scsa@sds.com',1818000,98182000,1818000),('seunghwa23@naver.com',100000000,100000000,0),('seunghwan23@naver.com',0,100000000,0);
/*!40000 ALTER TABLE `userAdvanced` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-17 23:35:40
