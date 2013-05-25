-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: aitopics_newsfinder
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.13.04.1

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
-- Table structure for table `cat_corpus`
--

DROP TABLE IF EXISTS `cat_corpus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_corpus` (
  `urlid` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1000) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `content` text NOT NULL,
  `adminrate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`urlid`)
) ENGINE=MyISAM AUTO_INCREMENT=6952 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_corpus_cats`
--

DROP TABLE IF EXISTS `cat_corpus_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_corpus_cats` (
  `urlid` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  KEY `urlid` (`urlid`),
  KEY `category` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_corpus_cats_single`
--

DROP TABLE IF EXISTS `cat_corpus_cats_single`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_corpus_cats_single` (
  `urlid` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `urlid` mediumint(9) NOT NULL,
  `category` varchar(255) NOT NULL,
  KEY `urlid_index` (`urlid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crawled`
--

DROP TABLE IF EXISTS `crawled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crawled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dup`
--

DROP TABLE IF EXISTS `dup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dup` (
  `dupid` int(11) NOT NULL AUTO_INCREMENT,
  `centroid` int(11) DEFAULT NULL,
  `comment` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`dupid`),
  UNIQUE KEY `centroid` (`centroid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dupurl`
--

DROP TABLE IF EXISTS `dupurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dupurl` (
  `dupid` int(11) NOT NULL,
  `urlid` int(11) NOT NULL,
  UNIQUE KEY `urlid` (`urlid`),
  KEY `dupid` (`dupid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(400) CHARACTER SET utf8 NOT NULL,
  `parser` varchar(100) NOT NULL,
  `description` varchar(32) NOT NULL,
  `status` int(1) NOT NULL,
  `relevance` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `textwordurl`
--

DROP TABLE IF EXISTS `textwordurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `textwordurl` (
  `urlid` mediumint(9) NOT NULL,
  `wordid` mediumint(9) NOT NULL,
  `freq` smallint(8) NOT NULL,
  KEY `wordidx` (`urlid`,`wordid`),
  KEY `locidx` (`urlid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `urllist`
--

DROP TABLE IF EXISTS `urllist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urllist` (
  `urlid` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(512) CHARACTER SET ascii NOT NULL COMMENT 'news URL address',
  `pubdate` date DEFAULT NULL COMMENT 'news published date',
  `crawldate` date DEFAULT NULL COMMENT 'news crawled date',
  `source` varchar(256) DEFAULT NULL COMMENT 'news source',
  `title` varchar(256) DEFAULT NULL COMMENT 'news title',
  `content` text,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `supervised` tinyint(1) NOT NULL DEFAULT '0',
  `summary` text CHARACTER SET latin1 NOT NULL,
  `publishable` tinyint(1) NOT NULL DEFAULT '0',
  `tfpn` char(2) CHARACTER SET latin1 NOT NULL DEFAULT 'xx',
  `image_url` varchar(512) CHARACTER SET ascii DEFAULT NULL,
  `source_id` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `source_relevance` int(11) DEFAULT NULL,
  PRIMARY KEY (`urlid`),
  KEY `crawldate` (`crawldate`,`pubdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wordlist`
--

DROP TABLE IF EXISTS `wordlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wordlist` (
  `rowid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `word` varchar(300) CHARACTER SET utf8 NOT NULL,
  `dftext` int(11) NOT NULL DEFAULT '0' COMMENT 'text doc freq',
  PRIMARY KEY (`rowid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wordlist_eval`
--

DROP TABLE IF EXISTS `wordlist_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wordlist_eval` (
  `rowid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `word` varchar(300) CHARACTER SET utf8 NOT NULL,
  `dftext` int(11) NOT NULL DEFAULT '0' COMMENT 'text doc freq',
  PRIMARY KEY (`rowid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-25 13:26:59
