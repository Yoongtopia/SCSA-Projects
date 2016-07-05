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
-- Table structure for table `simulation`
--

DROP TABLE IF EXISTS `simulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simulation` (
  `tradeSeq` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(200) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `oldPrice` bigint(20) DEFAULT NULL,
  `oldVolume` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`tradeSeq`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simulation`
--

LOCK TABLES `simulation` WRITE;
/*!40000 ALTER TABLE `simulation` DISABLE KEYS */;
INSERT INTO `simulation` VALUES (46,'anneshj@naver.com','005930','삼성전자',1415000,20,'2014-06-12'),(48,'anneshj@naver.com','004370','농심',307000,50,'2014-06-12'),(49,'anneshj@naver.com','000100','유한양행',172500,10,'2014-06-12'),(50,'anneshj@naver.com','002450','삼익악기',3780,10,'2014-06-12'),(57,'anneshj@naver.com','005930','삼성전자',1413000,10,'2014-06-12'),(58,'k@k.net','005930','삼성전자',1388000,10,'2014-06-13'),(80,'anneshj@naver.com','005930','삼성전자',1367000,10,'2014-06-14'),(112,'1@1.net','005930','삼성전자',1365000,50,'2014-06-17'),(157,'abc@abc.com','000520','삼일제약',6120,50,'2014-06-17'),(162,'hihihi@hi.net','005930','삼성전자',1368000,10,'2014-06-18'),(164,'scsa@scsa.com','031980','피에스케이',12050,100,'2014-06-18'),(165,'scsa@scsa.com','031980','피에스케이',12100,10,'2014-06-18'),(166,'scsa@scsa.com','031980','피에스케이',12100,10,'2014-06-18'),(167,'scsa@scsa.com','031980','피에스케이',12100,20,'2014-06-18'),(168,'scsa@scsa.com','031980','피에스케이',12100,30,'2014-06-18'),(169,'scsa2@scsa.com','005930','삼성전자',1369000,10,'2014-06-18'),(170,'scsa@samsung.net','009150','삼성전기',60700,10,'2014-06-18'),(171,'scsa@sds.com','009150','삼성전기',60600,30,'2014-06-18');
/*!40000 ALTER TABLE `simulation` ENABLE KEYS */;
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
