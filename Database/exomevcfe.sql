-- MySQL dump 10.15  Distrib 10.0.35-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: exomevcfe
-- ------------------------------------------------------
-- Server version	10.0.35-MariaDB

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `idcomment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsnv` int(11) unsigned NOT NULL,
  `idsample` int(11) unsigned NOT NULL,
  `reason` varchar(45) NOT NULL,
  `chrom` varchar(45) NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `refallele` varchar(255) NOT NULL,
  `altallele` varchar(255) NOT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `checked` varchar(45) DEFAULT NULL,
  `confirmed` varchar(45) DEFAULT NULL,
  `genotype` varchar(45) DEFAULT NULL,
  `inheritance` varchar(45) DEFAULT NULL,
  `confirmedcomment` varchar(255) DEFAULT NULL,
  `gene` varchar(45) DEFAULT NULL,
  `disease` varchar(45) DEFAULT NULL,
  `diseasecomment` blob,
  `user` varchar(100) NOT NULL,
  `indate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `changedate` timestamp NULL DEFAULT NULL,
  `pathocomment` varchar(255) DEFAULT NULL,
  `patho` enum('unknown','pathogenic','likely pathogenic','unknown significance','likely benign','benign') NOT NULL,
  `clinvardate` date NOT NULL DEFAULT '0000-00-00',
  `clinvarscv` char(12) NOT NULL DEFAULT '',
  `clinvarlocalkey` char(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`idcomment`),
  UNIQUE KEY `idsample_idsnv_idx` (`idsnv`,`idsample`),
  UNIQUE KEY `comment_idsample_variant` (`idsample`,`chrom`,`start`,`refallele`,`altallele`),
  KEY `chromstart_idx` (`chrom`,`start`),
  KEY `refallele` (`refallele`),
  KEY `altallele` (`altallele`)
) ENGINE=InnoDB AUTO_INCREMENT=21377 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conclusion`
--

DROP TABLE IF EXISTS `conclusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conclusion` (
  `idconclusion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsample` int(11) unsigned NOT NULL,
  `solved` int(11) NOT NULL,
  `genesymbol` varchar(150) NOT NULL,
  `conclusion` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `user` varchar(100) NOT NULL,
  `indate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `changedate` timestamp NULL DEFAULT NULL,
  `omimphenotype` varchar(10) NOT NULL DEFAULT '',
  `pmid` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`idconclusion`),
  UNIQUE KEY `idsample_conclusion_idx` (`idsample`)
) ENGINE=InnoDB AUTO_INCREMENT=4864 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hpo`
--

DROP TABLE IF EXISTS `hpo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hpo` (
  `idsample` int(11) unsigned NOT NULL,
  `samplename` varchar(45) NOT NULL,
  `hpo` char(10) DEFAULT '',
  `symptoms` varchar(255) DEFAULT '',
  `lastuser` varchar(45) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `dateentered` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `hpoidsample` (`idsample`),
  KEY `hpohpo` (`hpo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loginold`
--

DROP TABLE IF EXISTS `loginold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginold` (
  `idlogin` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `succeeded_all` int(10) unsigned NOT NULL DEFAULT '0',
  `failed_all` int(10) unsigned NOT NULL DEFAULT '0',
  `failed_last` int(10) unsigned NOT NULL DEFAULT '0',
  `lastlogin` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`idlogin`),
  UNIQUE KEY `idlogin_UNIQUE` (`idlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `iduser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `yubikey` varchar(45) NOT NULL DEFAULT '',
  `igvport` varchar(45) NOT NULL DEFAULT '',
  `cooperations` varchar(255) NOT NULL DEFAULT '',
  `projects` varchar(255) NOT NULL DEFAULT '',
  `succeeded_all` int(10) NOT NULL DEFAULT '0',
  `failed_all` int(10) NOT NULL DEFAULT '0',
  `failed_last` int(10) NOT NULL DEFAULT '0',
  `role` varchar(45) NOT NULL DEFAULT '',
  `edit` int(1) DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `genesearch` tinyint(4) DEFAULT '0',
  `genesearchcount` int(11) DEFAULT '0',
  `lastlogin` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-25 13:57:14
