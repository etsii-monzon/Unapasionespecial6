start transaction;

drop database if exists `Acme-Conference`;

create database `Acme-Conference`;

use `Acme-Conference`;



grant select, insert, update, delete 
	on `Acme-Conference`.* to 'acme-user'@'%';

grant select, insert, update, delete, create, drop, references, index, alter, 
        create temporary tables, lock tables, create view, create routine, 
        alter routine, execute, trigger, show view
    on `Acme-Conference`.* to 'acme-manager'@'%';

-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Conference
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `activity_optionalattachments`
--

DROP TABLE IF EXISTS `activity_optionalattachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_optionalattachments` (
  `Activity_id` int(11) NOT NULL,
  `optionalAttachments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_optionalattachments`
--

LOCK TABLES `activity_optionalattachments` WRITE;
/*!40000 ALTER TABLE `activity_optionalattachments` DISABLE KEYS */;
INSERT INTO `activity_optionalattachments` VALUES (630,'http://attachment1.com'),(630,'http://attachment2.com'),(630,'http://attachment3.com');
/*!40000 ALTER TABLE `activity_optionalattachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_speakers`
--

DROP TABLE IF EXISTS `activity_speakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_speakers` (
  `Activity_id` int(11) NOT NULL,
  `speakers` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_speakers`
--

LOCK TABLES `activity_speakers` WRITE;
/*!40000 ALTER TABLE `activity_speakers` DISABLE KEYS */;
INSERT INTO `activity_speakers` VALUES (628,'José Luis'),(629,'José Vicente'),(630,'José Vicente'),(630,'María Luisa'),(630,'Omar Montes');
/*!40000 ALTER TABLE `activity_speakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activitycomment`
--

DROP TABLE IF EXISTS `activitycomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activitycomment` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activitycomment`
--

LOCK TABLES `activitycomment` WRITE;
/*!40000 ALTER TABLE `activitycomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `activitycomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_message`
--

DROP TABLE IF EXISTS `actor_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_message` (
  `Actor_id` int(11) NOT NULL,
  `messages_id` int(11) NOT NULL,
  KEY `FK_qwro2cfqr03juk8plid0aj8u1` (`messages_id`),
  CONSTRAINT `FK_qwro2cfqr03juk8plid0aj8u1` FOREIGN KEY (`messages_id`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_message`
--

LOCK TABLES `actor_message` WRITE;
/*!40000 ALTER TABLE `actor_message` DISABLE KEYS */;
INSERT INTO `actor_message` VALUES (613,627),(621,627);
/*!40000 ALTER TABLE `actor_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `optionalPhoto` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `finder_id` int(11) NOT NULL,
  `userAccount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jf3y8x99xj20f87s88j70u82d` (`finder_id`),
  KEY `FK_idt4b4u259p6vs4pyr9lax4eg` (`userAccount_id`),
  CONSTRAINT `FK_idt4b4u259p6vs4pyr9lax4eg` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`),
  CONSTRAINT `FK_jf3y8x99xj20f87s88j70u82d` FOREIGN KEY (`finder_id`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (599,0,'Monzón 28','admin@','Marín Mateos','Juan José','','+34 675359045','Marín Mateos',592,550),(600,0,'Monzón 29','admin2@','María','José','','+34 675359045','Marquez',597,555),(601,0,'Monzón 29','admin3@','','Manola','','+34 675359045','Del Pino Fuentes',598,556);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator_conference`
--

DROP TABLE IF EXISTS `administrator_conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator_conference` (
  `Administrator_id` int(11) NOT NULL,
  `conferences_id` int(11) NOT NULL,
  UNIQUE KEY `UK_fqeyr8n7xv7cq9ja1m0etsko7` (`conferences_id`),
  KEY `FK_n08sswx5kaxcdg7cexc0bmofg` (`Administrator_id`),
  CONSTRAINT `FK_n08sswx5kaxcdg7cexc0bmofg` FOREIGN KEY (`Administrator_id`) REFERENCES `administrator` (`id`),
  CONSTRAINT `FK_fqeyr8n7xv7cq9ja1m0etsko7` FOREIGN KEY (`conferences_id`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator_conference`
--

LOCK TABLES `administrator_conference` WRITE;
/*!40000 ALTER TABLE `administrator_conference` DISABLE KEYS */;
INSERT INTO `administrator_conference` VALUES (599,602),(599,603),(599,604),(599,605),(599,606),(599,607),(599,608),(599,609),(599,610),(599,611),(599,612);
/*!40000 ALTER TABLE `administrator_conference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `optionalPhoto` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `finder_id` int(11) NOT NULL,
  `userAccount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_e3vycrwvs7v6n3fweq3e6wmkb` (`finder_id`),
  KEY `FK_g9r6idksespv276wsu4a9e6y9` (`userAccount_id`),
  CONSTRAINT `FK_g9r6idksespv276wsu4a9e6y9` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`),
  CONSTRAINT `FK_e3vycrwvs7v6n3fweq3e6wmkb` FOREIGN KEY (`finder_id`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (613,0,'Monzón 28','author1@hotmail.com','Ayacuch','Manuel','','+34 602145205','Saez yure',593,551),(620,0,'Barqueta 4','author2@hotmail.com','','José','','+34 602145204','López Retamino',594,554);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_registration`
--

DROP TABLE IF EXISTS `author_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_registration` (
  `Author_id` int(11) NOT NULL,
  `registrations_id` int(11) NOT NULL,
  UNIQUE KEY `UK_tr7t8srogtcya3ya67baaqynd` (`registrations_id`),
  KEY `FK_7r1u51j5v207fbpkb18g0tdkb` (`Author_id`),
  CONSTRAINT `FK_7r1u51j5v207fbpkb18g0tdkb` FOREIGN KEY (`Author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `FK_tr7t8srogtcya3ya67baaqynd` FOREIGN KEY (`registrations_id`) REFERENCES `registration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_registration`
--

LOCK TABLES `author_registration` WRITE;
/*!40000 ALTER TABLE `author_registration` DISABLE KEYS */;
INSERT INTO `author_registration` VALUES (613,619);
/*!40000 ALTER TABLE `author_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_submission`
--

DROP TABLE IF EXISTS `author_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_submission` (
  `Author_id` int(11) NOT NULL,
  `submissions_id` int(11) NOT NULL,
  UNIQUE KEY `UK_o4iodrx26lrurvbuu7apjwx16` (`submissions_id`),
  KEY `FK_bdgyc9gidj18x46mbh8ef7vgm` (`Author_id`),
  CONSTRAINT `FK_bdgyc9gidj18x46mbh8ef7vgm` FOREIGN KEY (`Author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `FK_o4iodrx26lrurvbuu7apjwx16` FOREIGN KEY (`submissions_id`) REFERENCES `submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_submission`
--

LOCK TABLES `author_submission` WRITE;
/*!40000 ALTER TABLE `author_submission` DISABLE KEYS */;
INSERT INTO `author_submission` VALUES (613,614),(613,615),(613,617),(620,616),(620,618);
/*!40000 ALTER TABLE `author_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `englishTitle` varchar(255) DEFAULT NULL,
  `spanishTitle` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_p6elut499cl32in8b8j8sy2n4` (`parent_id`),
  CONSTRAINT `FK_p6elut499cl32in8b8j8sy2n4` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (572,0,'CONFERENCE','CONFERENCIA',NULL),(573,0,'Computer Science','Informática',572),(574,0,'Physics','Física',572),(575,0,'Biology','Biología',572),(576,0,'Artificial Intelligence','Inteligencia Artificial',573),(577,0,'Software Engineering','Ingeniería Software',573),(578,0,'Deep Learning','Aprendizaje Profundo',576),(579,0,'Instance-based learning','Aprendizaje basado en instancias',576),(580,0,'Regression','Regresión',576),(581,0,'Big Data','Big Data',577),(582,0,'Big Processing','Big Processing',577),(583,0,'Methods','Métodos',577),(584,0,'Tools','Herramientas',577),(585,0,'Cinematic','Cinemática',574),(586,0,'Electicity','Electricidad',574),(587,0,'Electronic','Electrónica',574),(588,0,'Animals','Animales',575),(589,0,'Plants','Plantas',575),(590,0,'Fungi','Hongos',575);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_category`
--

DROP TABLE IF EXISTS `category_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_category` (
  `Category_id` int(11) NOT NULL,
  `children_id` int(11) NOT NULL,
  UNIQUE KEY `UK_hdiqhrmu52ndndxgg87iq6anb` (`children_id`),
  KEY `FK_90tievw3x18jv9f0n4ma0ethu` (`Category_id`),
  CONSTRAINT `FK_90tievw3x18jv9f0n4ma0ethu` FOREIGN KEY (`Category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_hdiqhrmu52ndndxgg87iq6anb` FOREIGN KEY (`children_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_category`
--

LOCK TABLES `category_category` WRITE;
/*!40000 ALTER TABLE `category_category` DISABLE KEYS */;
INSERT INTO `category_category` VALUES (572,573),(572,574),(572,575),(573,576),(573,577),(574,585),(574,586),(574,587),(575,588),(575,589),(575,590),(576,578),(576,579),(576,580),(577,581),(577,582),(577,583),(577,584);
/*!40000 ALTER TABLE `category_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (568,0,'Anonymous','2019-02-02 20:00:00','Muy buena conferencía,recomendable.','Good Conference!'),(569,0,'Anonymous','2019-02-02 20:00:00','Muy buena conferencía.','Recomendado 100%'),(570,0,'Anonymous','2019-02-02 20:00:00','Muy buena conferencía,recomendable.','Good Presentation'),(571,0,'Antonio','2019-02-03 20:00:00','Muy buena conferencía.','Recomendado 100%');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commententity_comment`
--

DROP TABLE IF EXISTS `commententity_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commententity_comment` (
  `CommentEntity_id` int(11) NOT NULL,
  `comments_id` int(11) NOT NULL,
  UNIQUE KEY `UK_pwmildirrhj1bkhenob4vguwb` (`comments_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commententity_comment`
--

LOCK TABLES `commententity_comment` WRITE;
/*!40000 ALTER TABLE `commententity_comment` DISABLE KEYS */;
INSERT INTO `commententity_comment` VALUES (611,568),(611,569),(630,570),(630,571);
/*!40000 ALTER TABLE `commententity_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conference`
--

DROP TABLE IF EXISTS `conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  `cameraDeadline` datetime DEFAULT NULL,
  `draftMode` bit(1) NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `notificationDeadline` datetime DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `submissionDeadline` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kprxk12nmyis1h3gnvk40sxwv` (`category_id`),
  CONSTRAINT `FK_kprxk12nmyis1h3gnvk40sxwv` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference`
--

LOCK TABLES `conference` WRITE;
/*!40000 ALTER TABLE `conference` DISABLE KEYS */;
INSERT INTO `conference` VALUES (602,0,'LU','2020-03-06 00:00:00','\0','2020-05-06 20:00:00',24.99,'2020-02-06 00:00:00','2020-05-06 16:00:00','2020-02-01 14:04:00','ETSII','Learn Unity','ETSII',576),(603,0,'HACK','2020-09-20 00:00:00','\0','2020-10-06 20:00:00',249.99,'2020-09-17 00:00:00','2020-10-06 16:00:00','2020-09-15 14:04:00','Reina Mercedes','Hacking','Reina Mercedes',578),(604,0,'A4','2020-01-20 00:00:00','\0','2020-02-10 20:00:00',9.99,'2020-01-17 00:00:00','2020-02-06 16:00:00','2020-01-15 14:04:00','Cartuja','Andr4All','Cartuja',581),(605,0,'BD','2019-06-20 00:00:00','\0','2019-09-20 20:00:00',599,'2019-06-17 00:00:00','2019-07-01 16:00:00','2019-06-15 14:04:00','Reina Sofia','BigData','Reina Sofia',582),(606,0,'J10','2019-06-20 00:00:00','\0','2020-07-01 20:00:00',359,'2019-06-17 00:00:00','2019-07-01 16:00:00','2019-06-15 14:04:00','Fibes','Java 10','Fibes',581),(607,0,'PD','2019-06-20 00:00:00','\0','2019-09-15 20:00:00',199.99,'2019-04-12 00:00:00','2019-07-01 16:00:00','2018-06-10 14:04:00','Sant    Patrick','Pyhton and Django','Sant Patrick',581),(608,0,'LearDj','2019-10-20 00:00:00','\0','2020-11-10 20:00:00',15,'2019-10-01 00:00:00','2020-11-01 16:00:00','2018-12-12 14:04:00','Plantinar','Learn Django','Plantinar',582),(609,0,'MD','2019-10-20 00:00:00','\0','2020-11-10 20:00:00',150,'2019-10-01 00:00:00','2020-11-01 16:00:00','2018-12-12 14:04:00','summary','Metadatos','ETSII',583),(610,0,'LA3','2019-10-20 00:00:00','\0','2020-11-10 20:00:00',250,'2019-10-01 00:00:00','2020-11-01 16:00:00','2018-12-12 14:04:00','summary','Learn Angular3','ETSII',583),(611,0,'Cr','2018-10-20 00:00:00','\0','2019-01-02 20:00:00',80,'2018-10-01 00:00:00','2019-01-01 16:00:00','2017-12-12 14:04:00','summary','Criptografia','ETSII',584),(612,0,'DcK','2019-10-20 00:00:00','\0','2020-11-10 20:00:00',158,'2019-10-01 00:00:00','2020-11-01 16:00:00','2018-12-12 14:04:00','sumamry','Learn Dockers','ETSII',579);
/*!40000 ALTER TABLE `conference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `bannerURL` varchar(255) DEFAULT NULL,
  `countryCode` varchar(255) DEFAULT NULL,
  `sistemName` varchar(255) DEFAULT NULL,
  `welcomeEN` varchar(255) DEFAULT NULL,
  `welcomeSP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (591,0,'https://i.ibb.co/GVpZCtM/acme-conference.png','34','Acme Conference','Welcome to Acme Conference! Your scientific event manager','¡Bienvenidos a Acme Conference! Su gestor de eventos científicos');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_makes`
--

DROP TABLE IF EXISTS `configuration_makes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_makes` (
  `Configuration_id` int(11) NOT NULL,
  `makes` varchar(255) DEFAULT NULL,
  KEY `FK_fqn39tfqgvfkwm46fuei6acvw` (`Configuration_id`),
  CONSTRAINT `FK_fqn39tfqgvfkwm46fuei6acvw` FOREIGN KEY (`Configuration_id`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_makes`
--

LOCK TABLES `configuration_makes` WRITE;
/*!40000 ALTER TABLE `configuration_makes` DISABLE KEYS */;
INSERT INTO `configuration_makes` VALUES (591,'VISA'),(591,'MASTER'),(591,'DINNERS'),(591,'AMEX');
/*!40000 ALTER TABLE `configuration_makes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_topic`
--

DROP TABLE IF EXISTS `configuration_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_topic` (
  `Configuration_id` int(11) NOT NULL,
  `topics_id` int(11) NOT NULL,
  UNIQUE KEY `UK_nq59c5cnuepm8mniea0xt9ffa` (`topics_id`),
  KEY `FK_sm6vxchbkdy6rt9ccjeayv43c` (`Configuration_id`),
  CONSTRAINT `FK_sm6vxchbkdy6rt9ccjeayv43c` FOREIGN KEY (`Configuration_id`) REFERENCES `configuration` (`id`),
  CONSTRAINT `FK_nq59c5cnuepm8mniea0xt9ffa` FOREIGN KEY (`topics_id`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_topic`
--

LOCK TABLES `configuration_topic` WRITE;
/*!40000 ALTER TABLE `configuration_topic` DISABLE KEYS */;
INSERT INTO `configuration_topic` VALUES (591,563),(591,564),(591,565),(591,566),(591,567);
/*!40000 ALTER TABLE `configuration_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditcard` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `cvv` int(11) NOT NULL,
  `expMonth` int(11) NOT NULL,
  `expYear` int(11) NOT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
INSERT INTO `creditcard` VALUES (562,0,'VISA',123,10,22,'Manuel','4111111111111111');
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder`
--

DROP TABLE IF EXISTS `finder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aooiblceyn0pqnbn26i3ayghg` (`category_id`),
  CONSTRAINT `FK_aooiblceyn0pqnbn26i3ayghg` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder`
--

LOCK TABLES `finder` WRITE;
/*!40000 ALTER TABLE `finder` DISABLE KEYS */;
INSERT INTO `finder` VALUES (592,0,NULL,NULL,NULL,NULL,NULL),(593,0,NULL,NULL,NULL,NULL,NULL),(594,0,NULL,NULL,NULL,NULL,NULL),(595,0,NULL,NULL,NULL,NULL,NULL),(596,0,NULL,NULL,NULL,NULL,NULL),(597,0,NULL,NULL,NULL,NULL,NULL),(598,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `finder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder_conference`
--

DROP TABLE IF EXISTS `finder_conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder_conference` (
  `Finder_id` int(11) NOT NULL,
  `conferences_id` int(11) NOT NULL,
  KEY `FK_hhu15rhu69p33dc4qrq5g2qrh` (`conferences_id`),
  KEY `FK_cypn39wi7x8bdt1m6pjqbg1ia` (`Finder_id`),
  CONSTRAINT `FK_cypn39wi7x8bdt1m6pjqbg1ia` FOREIGN KEY (`Finder_id`) REFERENCES `finder` (`id`),
  CONSTRAINT `FK_hhu15rhu69p33dc4qrq5g2qrh` FOREIGN KEY (`conferences_id`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder_conference`
--

LOCK TABLES `finder_conference` WRITE;
/*!40000 ALTER TABLE `finder_conference` DISABLE KEYS */;
/*!40000 ALTER TABLE `finder_conference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (627,0,'TEST','2019-01-06 00:00:00','IMPORTANT','OTHER',613);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_actor`
--

DROP TABLE IF EXISTS `message_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_actor` (
  `Message_id` int(11) NOT NULL,
  `recipients_id` int(11) NOT NULL,
  KEY `FK_2340xdahcha0b5cyr6bxhq6ji` (`Message_id`),
  CONSTRAINT `FK_2340xdahcha0b5cyr6bxhq6ji` FOREIGN KEY (`Message_id`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_actor`
--

LOCK TABLES `message_actor` WRITE;
/*!40000 ALTER TABLE `message_actor` DISABLE KEYS */;
INSERT INTO `message_actor` VALUES (627,621);
/*!40000 ALTER TABLE `message_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panel`
--

DROP TABLE IF EXISTS `panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panel` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `endMoment` datetime DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `startMoment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `conference_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g91hilmjav0i3tecvqs0qu832` (`conference_id`),
  CONSTRAINT `FK_g91hilmjav0i3tecvqs0qu832` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panel`
--

LOCK TABLES `panel` WRITE;
/*!40000 ALTER TABLE `panel` DISABLE KEYS */;
INSERT INTO `panel` VALUES (628,0,'2019-01-01 16:30:00','room1','2019-01-01 16:01:00','summary1','Panel',611);
/*!40000 ALTER TABLE `panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES (557,0,'http://bibing.us.es/proyectos/abreproy/11247/fichero/Memoria%252F6-Conceptos+previos.pdf','Summary','paper title'),(558,0,'http://bibing.us.es/proyectos/abreproy/11247/fichero/Memoria%252F6-Conceptos+previos.pdf','Summary','paper title'),(559,0,'http://bibing.us.es/proyectos/abreproy/11247/fichero/Memoria%252F6-Conceptos+previos.pdf','Summary','paper1'),(560,0,'http://bibing.us.es/proyectos/abreproy/11247/fichero/Memoria%252F6-Conceptos+previos.pdf','Summary','PAPER'),(561,0,'http://bibing.us.es/proyectos/abreproy/11247/fichero/Memoria%252F6-Conceptos+previos.pdf','Summary','paper10');
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper_author`
--

DROP TABLE IF EXISTS `paper_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper_author` (
  `Paper_id` int(11) NOT NULL,
  `authors_id` int(11) NOT NULL,
  KEY `FK_99x0cn02pmhohqofpv5nyxksa` (`authors_id`),
  KEY `FK_8svx5vves4cfnwk93mp7t6u7a` (`Paper_id`),
  CONSTRAINT `FK_8svx5vves4cfnwk93mp7t6u7a` FOREIGN KEY (`Paper_id`) REFERENCES `paper` (`id`),
  CONSTRAINT `FK_99x0cn02pmhohqofpv5nyxksa` FOREIGN KEY (`authors_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_author`
--

LOCK TABLES `paper_author` WRITE;
/*!40000 ALTER TABLE `paper_author` DISABLE KEYS */;
INSERT INTO `paper_author` VALUES (557,620),(558,613),(559,613),(560,613),(560,620),(561,620);
/*!40000 ALTER TABLE `paper_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentation`
--

DROP TABLE IF EXISTS `presentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presentation` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `endMoment` datetime DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `startMoment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `conference_id` int(11) DEFAULT NULL,
  `submission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_si9tawtpirx49j4o0jt0vvc41` (`submission_id`),
  KEY `FK_1jrucw76t3f379ll4645ru9wr` (`conference_id`),
  CONSTRAINT `FK_1jrucw76t3f379ll4645ru9wr` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`),
  CONSTRAINT `FK_si9tawtpirx49j4o0jt0vvc41` FOREIGN KEY (`submission_id`) REFERENCES `submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentation`
--

LOCK TABLES `presentation` WRITE;
/*!40000 ALTER TABLE `presentation` DISABLE KEYS */;
INSERT INTO `presentation` VALUES (630,0,'2019-01-01 17:00:00','room1','2019-01-01 16:45:00','summary conference','presentation1',611,618);
/*!40000 ALTER TABLE `presentation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `conference_id` int(11) DEFAULT NULL,
  `creditCard_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_i1fkxnsc98af7fa2o0c5qdppo` (`conference_id`),
  KEY `FK_tftgl1o0det0h3kl1jr71kui9` (`creditCard_id`),
  CONSTRAINT `FK_tftgl1o0det0h3kl1jr71kui9` FOREIGN KEY (`creditCard_id`) REFERENCES `creditcard` (`id`),
  CONSTRAINT `FK_i1fkxnsc98af7fa2o0c5qdppo` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (619,0,602,562);
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `decision` varchar(255) DEFAULT NULL,
  `originality` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `readability` int(11) DEFAULT NULL,
  `submission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3nrxtsjsgy56nwq9wu50hmu3l` (`submission_id`),
  CONSTRAINT `FK_3nrxtsjsgy56nwq9wu50hmu3l` FOREIGN KEY (`submission_id`) REFERENCES `submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (623,0,'No comments.','ACCEPT',8,7,5,617),(624,0,'No comments.','ACCEPT',8,8,7,614),(625,0,'No comments.','ACCEPT',7,10,7,615),(626,0,'No comments.','ACCEPT',7,10,7,618);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer`
--

DROP TABLE IF EXISTS `reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `optionalPhoto` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `finder_id` int(11) NOT NULL,
  `userAccount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_d2986qcjbxy8easpe0e3ysl15` (`finder_id`),
  KEY `FK_4f9r9kvay9mbl2b40kxrg29jj` (`userAccount_id`),
  CONSTRAINT `FK_4f9r9kvay9mbl2b40kxrg29jj` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`),
  CONSTRAINT `FK_d2986qcjbxy8easpe0e3ysl15` FOREIGN KEY (`finder_id`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer`
--

LOCK TABLES `reviewer` WRITE;
/*!40000 ALTER TABLE `reviewer` DISABLE KEYS */;
INSERT INTO `reviewer` VALUES (621,0,'Sol 28','reviewer1@hotmail.com','','Ana','','+34 620148002','Gómez',595,552),(622,0,'Gran Via 28','anagon@hotmail.com','','Anastasia','','+34 633148002','Gónzalez',596,553);
/*!40000 ALTER TABLE `reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_keywords`
--

DROP TABLE IF EXISTS `reviewer_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewer_keywords` (
  `Reviewer_id` int(11) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  KEY `FK_cce83gist8vjnlxsmrkfmc86c` (`Reviewer_id`),
  CONSTRAINT `FK_cce83gist8vjnlxsmrkfmc86c` FOREIGN KEY (`Reviewer_id`) REFERENCES `reviewer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_keywords`
--

LOCK TABLES `reviewer_keywords` WRITE;
/*!40000 ALTER TABLE `reviewer_keywords` DISABLE KEYS */;
INSERT INTO `reviewer_keywords` VALUES (621,'submission1'),(621,'Learn'),(622,'Python'),(622,'Plantinar');
/*!40000 ALTER TABLE `reviewer_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_report`
--

DROP TABLE IF EXISTS `reviewer_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewer_report` (
  `Reviewer_id` int(11) NOT NULL,
  `reports_id` int(11) NOT NULL,
  UNIQUE KEY `UK_t598wurv4astccupmr2bm5lm9` (`reports_id`),
  KEY `FK_8rfpu529b92vi5hmluvfgt7iw` (`Reviewer_id`),
  CONSTRAINT `FK_8rfpu529b92vi5hmluvfgt7iw` FOREIGN KEY (`Reviewer_id`) REFERENCES `reviewer` (`id`),
  CONSTRAINT `FK_t598wurv4astccupmr2bm5lm9` FOREIGN KEY (`reports_id`) REFERENCES `report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_report`
--

LOCK TABLES `reviewer_report` WRITE;
/*!40000 ALTER TABLE `reviewer_report` DISABLE KEYS */;
INSERT INTO `reviewer_report` VALUES (621,623),(621,626),(622,624),(622,625);
/*!40000 ALTER TABLE `reviewer_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tutorial_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2xsbgo7ewa2p36m7q7svxi3cg` (`tutorial_id`),
  CONSTRAINT `FK_2xsbgo7ewa2p36m7q7svxi3cg` FOREIGN KEY (`tutorial_id`) REFERENCES `tutorial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (631,0,'summary1','section1',629);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_optionalpictures`
--

DROP TABLE IF EXISTS `section_optionalpictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_optionalpictures` (
  `Section_id` int(11) NOT NULL,
  `optionalPictures` varchar(255) DEFAULT NULL,
  KEY `FK_cffsfvyjy7ud56l43gjy2kuty` (`Section_id`),
  CONSTRAINT `FK_cffsfvyjy7ud56l43gjy2kuty` FOREIGN KEY (`Section_id`) REFERENCES `section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_optionalpictures`
--

LOCK TABLES `section_optionalpictures` WRITE;
/*!40000 ALTER TABLE `section_optionalpictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `section_optionalpictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission`
--

DROP TABLE IF EXISTS `submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `cameraReady` bit(1) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `conference_id` int(11) DEFAULT NULL,
  `paper_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_eo0uw4evjwgn80h1sh2gho4ft` (`ticker`),
  KEY `FK_fh4c3gb4lrqtg2i460d9odyqn` (`conference_id`),
  KEY `FK_iy3ke3778fryfva48l6nqth93` (`paper_id`),
  CONSTRAINT `FK_iy3ke3778fryfva48l6nqth93` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`id`),
  CONSTRAINT `FK_fh4c3gb4lrqtg2i460d9odyqn` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
INSERT INTO `submission` VALUES (614,0,'\0','2019-01-06 00:00:00','ACCEPTED','MAS-8K8Q',609,560),(615,0,'','2019-01-06 00:00:00','ACCEPTED','MAS-5L2B',610,558),(616,0,'\0','2019-01-06 00:00:00','UNDER-REVIEW','JXL-8K7L',612,557),(617,0,'\0','2019-01-06 00:00:00','UNDER-REVIEW','MAS-8K6L',608,559),(618,0,'','2019-01-06 00:00:00','ACCEPTED','JXL-213L',611,561);
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_reviewer`
--

DROP TABLE IF EXISTS `submission_reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_reviewer` (
  `Submission_id` int(11) NOT NULL,
  `reviewers_id` int(11) NOT NULL,
  KEY `FK_muyi2dby1y0pxmry59mao464k` (`reviewers_id`),
  KEY `FK_dm2uyw06gtiw6ur1917pm7q8h` (`Submission_id`),
  CONSTRAINT `FK_dm2uyw06gtiw6ur1917pm7q8h` FOREIGN KEY (`Submission_id`) REFERENCES `submission` (`id`),
  CONSTRAINT `FK_muyi2dby1y0pxmry59mao464k` FOREIGN KEY (`reviewers_id`) REFERENCES `reviewer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_reviewer`
--

LOCK TABLES `submission_reviewer` WRITE;
/*!40000 ALTER TABLE `submission_reviewer` DISABLE KEYS */;
INSERT INTO `submission_reviewer` VALUES (614,622),(615,622),(617,621),(618,621);
/*!40000 ALTER TABLE `submission_reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `englishName` varchar(255) DEFAULT NULL,
  `spanishName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (563,0,'INQUIRY','INVESTIGACIÓN'),(564,0,'REBUTTAL','REFUTACIÓN'),(565,0,'TOPICS','TEMAS'),(566,0,'REGISTRATION','REGISTRO'),(567,0,'OTHER','OTRO');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorial`
--

DROP TABLE IF EXISTS `tutorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorial` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `endMoment` datetime DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `startMoment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `conference_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c8vb4fwcxjasyddbco6rrvxtb` (`conference_id`),
  CONSTRAINT `FK_c8vb4fwcxjasyddbco6rrvxtb` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorial`
--

LOCK TABLES `tutorial` WRITE;
/*!40000 ALTER TABLE `tutorial` DISABLE KEYS */;
INSERT INTO `tutorial` VALUES (629,0,'2019-01-01 16:45:00','room1','2019-01-01 16:30:00','summary1','tutorial1',611);
/*!40000 ALTER TABLE `tutorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (550,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(551,0,'b312ba4ffd5245fa2a1ab819ec0d0347','author1'),(552,0,'6ce19528a40dde9521d97cf7ba264eca','reviewer1'),(553,0,'2693b57f0f59df94caacefb811e99851','reviewer2'),(554,0,'9bd97baef2b853ec00cc3cffd269f679','author2'),(555,0,'d5cee333abe432891a0de57d0ee38713','administrator1'),(556,0,'82954495ff7e2a735ed2192c35b2cd00','administrator2');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (550,'ADMIN'),(551,'AUTHOR'),(552,'REVIEWER'),(553,'REVIEWER'),(554,'AUTHOR'),(555,'ADMIN'),(556,'ADMIN');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-21 16:55:13
commit;