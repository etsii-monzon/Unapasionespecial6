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
-- Table structure for table `activity_optional_attachments`
--

DROP TABLE IF EXISTS `activity_optional_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_optional_attachments` (
  `activity` int(11) NOT NULL,
  `optional_attachments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_optional_attachments`
--

LOCK TABLES `activity_optional_attachments` WRITE;
/*!40000 ALTER TABLE `activity_optional_attachments` DISABLE KEYS */;
INSERT INTO `activity_optional_attachments` VALUES (680,'http://attachment1.com'),(680,'http://attachment2.com'),(680,'http://attachment3.com');
/*!40000 ALTER TABLE `activity_optional_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_speakers`
--

DROP TABLE IF EXISTS `activity_speakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_speakers` (
  `activity` int(11) NOT NULL,
  `speakers` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_speakers`
--

LOCK TABLES `activity_speakers` WRITE;
/*!40000 ALTER TABLE `activity_speakers` DISABLE KEYS */;
INSERT INTO `activity_speakers` VALUES (678,'José Luis'),(679,'José Vicente'),(680,'José Vicente'),(680,'María Luisa'),(680,'Omar Montes');
/*!40000 ALTER TABLE `activity_speakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_messages`
--

DROP TABLE IF EXISTS `actor_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_messages` (
  `actor` int(11) NOT NULL,
  `messages` int(11) NOT NULL,
  KEY `FK_b1336eo2tc3f26b38f2drhyk8` (`messages`),
  CONSTRAINT `FK_b1336eo2tc3f26b38f2drhyk8` FOREIGN KEY (`messages`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_messages`
--

LOCK TABLES `actor_messages` WRITE;
/*!40000 ALTER TABLE `actor_messages` DISABLE KEYS */;
INSERT INTO `actor_messages` VALUES (663,677),(671,677);
/*!40000 ALTER TABLE `actor_messages` ENABLE KEYS */;
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
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `optional_photo` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `finder` int(11) NOT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5yk18fb3vpgubbtu0jiroyqf0` (`finder`),
  KEY `FK_7ohwsa2usmvu0yxb44je2lge` (`user_account`),
  CONSTRAINT `FK_7ohwsa2usmvu0yxb44je2lge` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_5yk18fb3vpgubbtu0jiroyqf0` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (644,0,'Monzón 28','admin@','Marín Mateos','Juan José','','+34 675359045','Marín Mateos',637,595),(645,0,'Monzón 29','admin2@','María','José','','+34 675359045','Marquez',642,600),(646,0,'Monzón 29','admin3@','','Manola','','+34 675359045','Del Pino Fuentes',643,601);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator_conferences`
--

DROP TABLE IF EXISTS `administrator_conferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator_conferences` (
  `administrator` int(11) NOT NULL,
  `conferences` int(11) NOT NULL,
  UNIQUE KEY `UK_kfr3bekrhuxd2ohuob3fjheaf` (`conferences`),
  KEY `FK_16ersqgmu3tr2twfl5d2qopwq` (`administrator`),
  CONSTRAINT `FK_16ersqgmu3tr2twfl5d2qopwq` FOREIGN KEY (`administrator`) REFERENCES `administrator` (`id`),
  CONSTRAINT `FK_kfr3bekrhuxd2ohuob3fjheaf` FOREIGN KEY (`conferences`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator_conferences`
--

LOCK TABLES `administrator_conferences` WRITE;
/*!40000 ALTER TABLE `administrator_conferences` DISABLE KEYS */;
INSERT INTO `administrator_conferences` VALUES (644,647),(644,648),(644,649),(644,650),(644,651),(644,652),(644,653),(644,654),(644,655),(644,656),(644,657),(644,658),(644,659),(644,660),(644,661),(644,662);
/*!40000 ALTER TABLE `administrator_conferences` ENABLE KEYS */;
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
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `optional_photo` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `finder` int(11) NOT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ng8tt0uu0j791w837h00d4owq` (`finder`),
  KEY `FK_rjptsoy3q9dcfysbnmy1g0g31` (`user_account`),
  CONSTRAINT `FK_rjptsoy3q9dcfysbnmy1g0g31` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_ng8tt0uu0j791w837h00d4owq` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (663,0,'Monzón 28','author1@hotmail.com','Ayacuch','Manuel','','+34 602145205','Saez yure',638,596),(670,0,'Barqueta 4','author2@hotmail.com','','José','','+34 602145204','López Retamino',639,599);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_registrations`
--

DROP TABLE IF EXISTS `author_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_registrations` (
  `author` int(11) NOT NULL,
  `registrations` int(11) NOT NULL,
  UNIQUE KEY `UK_c0vuhrx3s27xuoewhb3vmw4sb` (`registrations`),
  KEY `FK_lstxi2foerupd6qx5y5a261fo` (`author`),
  CONSTRAINT `FK_lstxi2foerupd6qx5y5a261fo` FOREIGN KEY (`author`) REFERENCES `author` (`id`),
  CONSTRAINT `FK_c0vuhrx3s27xuoewhb3vmw4sb` FOREIGN KEY (`registrations`) REFERENCES `registration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_registrations`
--

LOCK TABLES `author_registrations` WRITE;
/*!40000 ALTER TABLE `author_registrations` DISABLE KEYS */;
INSERT INTO `author_registrations` VALUES (663,669);
/*!40000 ALTER TABLE `author_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_submissions`
--

DROP TABLE IF EXISTS `author_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_submissions` (
  `author` int(11) NOT NULL,
  `submissions` int(11) NOT NULL,
  UNIQUE KEY `UK_grc9vgcyg4jjkwhl4dafxcmlj` (`submissions`),
  KEY `FK_2xnw7y3dujt70ni7ykr27cyx5` (`author`),
  CONSTRAINT `FK_2xnw7y3dujt70ni7ykr27cyx5` FOREIGN KEY (`author`) REFERENCES `author` (`id`),
  CONSTRAINT `FK_grc9vgcyg4jjkwhl4dafxcmlj` FOREIGN KEY (`submissions`) REFERENCES `submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_submissions`
--

LOCK TABLES `author_submissions` WRITE;
/*!40000 ALTER TABLE `author_submissions` DISABLE KEYS */;
INSERT INTO `author_submissions` VALUES (663,664),(663,665),(663,667),(670,666),(670,668);
/*!40000 ALTER TABLE `author_submissions` ENABLE KEYS */;
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
  `english_title` varchar(255) DEFAULT NULL,
  `spanish_title` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d285hl23ejq8efmum8hbvqrt2` (`parent`),
  CONSTRAINT `FK_d285hl23ejq8efmum8hbvqrt2` FOREIGN KEY (`parent`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (617,0,'CONFERENCE','CONFERENCIA',NULL),(618,0,'Computer Science','Informática',617),(619,0,'Physics','Física',617),(620,0,'Biology','Biología',617),(621,0,'Artificial Intelligence','Inteligencia Artificial',618),(622,0,'Software Engineering','Ingeniería Software',618),(623,0,'Deep Learning','Aprendizaje Profundo',621),(624,0,'Instance-based learning','Aprendizaje basado en instancias',621),(625,0,'Regression','Regresión',621),(626,0,'Big Data','Big Data',622),(627,0,'Big Processing','Big Processing',622),(628,0,'Methods','Métodos',622),(629,0,'Tools','Herramientas',622),(630,0,'Cinematic','Cinemática',619),(631,0,'Electicity','Electricidad',619),(632,0,'Electronic','Electrónica',619),(633,0,'Animals','Animales',620),(634,0,'Plants','Plantas',620),(635,0,'Fungi','Hongos',620);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_children`
--

DROP TABLE IF EXISTS `category_children`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_children` (
  `category` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  UNIQUE KEY `UK_f2qj9o6wv2lqhj7laybb4ugqd` (`children`),
  KEY `FK_xmmu562pvrtdfgx52dok07o4` (`category`),
  CONSTRAINT `FK_xmmu562pvrtdfgx52dok07o4` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_f2qj9o6wv2lqhj7laybb4ugqd` FOREIGN KEY (`children`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_children`
--

LOCK TABLES `category_children` WRITE;
/*!40000 ALTER TABLE `category_children` DISABLE KEYS */;
INSERT INTO `category_children` VALUES (617,618),(617,619),(617,620),(618,621),(618,622),(619,630),(619,631),(619,632),(620,633),(620,634),(620,635),(621,623),(621,624),(621,625),(622,626),(622,627),(622,628),(622,629);
/*!40000 ALTER TABLE `category_children` ENABLE KEYS */;
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
INSERT INTO `comment` VALUES (613,0,'Anonymous','2019-02-02 20:00:00','Muy buena conferencía,recomendable.','Good Conference!'),(614,0,'Anonymous','2019-02-02 20:00:00','Muy buena conferencía.','Recomendado 100%'),(615,0,'Anonymous','2019-02-02 20:00:00','Muy buena conferencía,recomendable.','Good Presentation'),(616,0,'Antonio','2019-02-03 20:00:00','Muy buena conferencía.','Recomendado 100%');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_entity_comments`
--

DROP TABLE IF EXISTS `comment_entity_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_entity_comments` (
  `comment_entity` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  UNIQUE KEY `UK_cjlfuonansf2bhrjuqw1k50ox` (`comments`),
  CONSTRAINT `FK_cjlfuonansf2bhrjuqw1k50ox` FOREIGN KEY (`comments`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_entity_comments`
--

LOCK TABLES `comment_entity_comments` WRITE;
/*!40000 ALTER TABLE `comment_entity_comments` DISABLE KEYS */;
INSERT INTO `comment_entity_comments` VALUES (656,613),(656,614),(680,615),(680,616);
/*!40000 ALTER TABLE `comment_entity_comments` ENABLE KEYS */;
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
  `camera_deadline` datetime DEFAULT NULL,
  `draft_mode` bit(1) NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `notification_deadline` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `submission_deadline` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ldxxtwdsnf262yu1ctl1awe02` (`category`),
  CONSTRAINT `FK_ldxxtwdsnf262yu1ctl1awe02` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference`
--

LOCK TABLES `conference` WRITE;
/*!40000 ALTER TABLE `conference` DISABLE KEYS */;
INSERT INTO `conference` VALUES (647,0,'LU','2020-03-06 00:00:00','\0','2020-05-06 20:00:00',24.99,'2020-02-06 00:00:00','2020-05-06 16:00:00','2020-02-01 14:04:00','ETSII','Learn Unity','ETSII',621),(648,0,'HACK','2020-09-20 00:00:00','\0','2020-10-06 20:00:00',249.99,'2020-09-17 00:00:00','2020-10-06 16:00:00','2020-09-15 14:04:00','Reina Mercedes','Hacking','Reina Mercedes',623),(649,0,'A4','2020-01-20 00:00:00','\0','2020-02-10 20:00:00',9.99,'2020-01-17 00:00:00','2020-02-06 16:00:00','2020-01-15 14:04:00','Cartuja','Andr4All','Cartuja',626),(650,0,'BD','2019-06-20 00:00:00','\0','2019-09-20 20:00:00',599,'2019-06-17 00:00:00','2019-07-01 16:00:00','2019-06-15 14:04:00','Reina Sofia','BigData','Reina Sofia',627),(651,0,'J10','2019-06-20 00:00:00','\0','2020-07-01 20:00:00',359,'2019-06-17 00:00:00','2019-07-01 16:00:00','2019-06-15 14:04:00','Fibes','Java 10','Fibes',626),(652,0,'PD','2019-06-20 00:00:00','\0','2019-09-15 20:00:00',199.99,'2019-04-12 00:00:00','2019-07-01 16:00:00','2018-06-10 14:04:00','Sant    Patrick','Pyhton and Django','Sant Patrick',626),(653,0,'LearDj','2019-10-20 00:00:00','\0','2020-11-10 20:00:00',15,'2019-10-01 00:00:00','2020-11-01 16:00:00','2018-12-12 14:04:00','Plantinar','Learn Django','Plantinar',627),(654,0,'MD','2019-10-20 00:00:00','\0','2020-11-10 20:00:00',150,'2019-10-01 00:00:00','2020-11-01 16:00:00','2018-12-12 14:04:00','summary','Metadatos','ETSII',628),(655,0,'LA3','2019-10-20 00:00:00','\0','2020-11-10 20:00:00',250,'2019-10-01 00:00:00','2020-11-01 16:00:00','2018-12-12 14:04:00','summary','Learn Angular3','ETSII',628),(656,0,'Cr','2018-10-20 00:00:00','\0','2019-01-02 20:00:00',80,'2018-10-01 00:00:00','2019-01-01 16:00:00','2017-12-12 14:04:00','summary','Criptografia','ETSII',629),(657,0,'DcK','2019-10-20 00:00:00','\0','2020-11-10 20:00:00',158,'2019-10-01 00:00:00','2020-11-01 16:00:00','2018-12-12 14:04:00','sumamry','Learn Dockers','ETSII',624),(658,0,'M+','2019-09-07 00:00:00','\0','2019-09-09 20:00:00',200,'2019-09-06 00:00:00','2019-09-08 16:00:00','2019-09-05 14:04:00','sumamry','Math','ETSII',621),(659,0,'Anac','2019-09-12 00:00:00','\0','2019-09-14 20:00:00',25,'2019-09-11 00:00:00','2019-09-13 16:00:00','2019-09-10 14:04:00','sumamry','Anaconda','ETSII',617),(660,0,'CandF','2019-09-17 00:00:00','\0','2019-09-19 20:00:00',15,'2019-09-16 00:00:00','2019-09-18 16:00:00','2019-09-15 14:04:00','sumamry','Computer and Football','ETSII',617),(661,0,'Comp','2019-09-22 00:00:00','\0','2019-09-24 20:00:00',50,'2019-09-21 00:00:00','2019-09-23 16:00:00','2019-09-20 14:04:00','sumamry','Create a company','ETSII',617),(662,0,'App','2019-09-27 00:00:00','\0','2019-09-29 20:00:00',10,'2019-09-26 00:00:00','2019-09-28 16:00:00','2019-09-25 14:04:00','sumamry','Create an application','ETSII',617);
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
  `bannerurl` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `sistem_name` varchar(255) DEFAULT NULL,
  `welcomeen` varchar(255) DEFAULT NULL,
  `welcomesp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (636,0,'https://i.ibb.co/GVpZCtM/acme-conference.png','34','Acme Conference','Welcome to Acme Conference! Your scientific event manager','¡Bienvenidos a Acme Conference! Su gestor de eventos científicos');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_makes`
--

DROP TABLE IF EXISTS `configuration_makes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_makes` (
  `configuration` int(11) NOT NULL,
  `makes` varchar(255) DEFAULT NULL,
  KEY `FK_eanjwa8s4wiomnti3yklql7j` (`configuration`),
  CONSTRAINT `FK_eanjwa8s4wiomnti3yklql7j` FOREIGN KEY (`configuration`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_makes`
--

LOCK TABLES `configuration_makes` WRITE;
/*!40000 ALTER TABLE `configuration_makes` DISABLE KEYS */;
INSERT INTO `configuration_makes` VALUES (636,'VISA'),(636,'MASTER'),(636,'DINNERS'),(636,'AMEX');
/*!40000 ALTER TABLE `configuration_makes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_topics`
--

DROP TABLE IF EXISTS `configuration_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_topics` (
  `configuration` int(11) NOT NULL,
  `topics` int(11) NOT NULL,
  UNIQUE KEY `UK_15rwnumgy8c5gey29g7gp9gft` (`topics`),
  KEY `FK_b14m7pu8cx4hl898wk8dj4txs` (`configuration`),
  CONSTRAINT `FK_b14m7pu8cx4hl898wk8dj4txs` FOREIGN KEY (`configuration`) REFERENCES `configuration` (`id`),
  CONSTRAINT `FK_15rwnumgy8c5gey29g7gp9gft` FOREIGN KEY (`topics`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_topics`
--

LOCK TABLES `configuration_topics` WRITE;
/*!40000 ALTER TABLE `configuration_topics` DISABLE KEYS */;
INSERT INTO `configuration_topics` VALUES (636,608),(636,609),(636,610),(636,611),(636,612);
/*!40000 ALTER TABLE `configuration_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `cvv` int(11) NOT NULL,
  `exp_month` int(11) NOT NULL,
  `exp_year` int(11) NOT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES (607,0,'VISA',123,10,22,'Manuel','4111111111111111');
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
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
  `end_date` datetime DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_n9t1ayk0x7h5vrsfuhygo043j` (`category`),
  CONSTRAINT `FK_n9t1ayk0x7h5vrsfuhygo043j` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder`
--

LOCK TABLES `finder` WRITE;
/*!40000 ALTER TABLE `finder` DISABLE KEYS */;
INSERT INTO `finder` VALUES (637,0,NULL,NULL,NULL,NULL,NULL),(638,0,NULL,NULL,NULL,NULL,NULL),(639,0,NULL,NULL,NULL,NULL,NULL),(640,0,NULL,NULL,NULL,NULL,NULL),(641,0,NULL,NULL,NULL,NULL,NULL),(642,0,NULL,NULL,NULL,NULL,NULL),(643,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `finder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder_conferences`
--

DROP TABLE IF EXISTS `finder_conferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder_conferences` (
  `finder` int(11) NOT NULL,
  `conferences` int(11) NOT NULL,
  KEY `FK_nfuvovuvbk05r9vbyg5mbstxx` (`conferences`),
  KEY `FK_k666b9rxu2vqkol7uc9ostni9` (`finder`),
  CONSTRAINT `FK_k666b9rxu2vqkol7uc9ostni9` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`),
  CONSTRAINT `FK_nfuvovuvbk05r9vbyg5mbstxx` FOREIGN KEY (`conferences`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder_conferences`
--

LOCK TABLES `finder_conferences` WRITE;
/*!40000 ALTER TABLE `finder_conferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `finder_conferences` ENABLE KEYS */;
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
INSERT INTO `hibernate_sequences` VALUES ('domain_entity',1);
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
  `sender` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (677,0,'TEST','2019-01-06 00:00:00','IMPORTANT','OTHER',663);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_recipients`
--

DROP TABLE IF EXISTS `message_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_recipients` (
  `message` int(11) NOT NULL,
  `recipients` int(11) NOT NULL,
  KEY `FK_1odmg2n3n487tvhuxx5oyyya2` (`message`),
  CONSTRAINT `FK_1odmg2n3n487tvhuxx5oyyya2` FOREIGN KEY (`message`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_recipients`
--

LOCK TABLES `message_recipients` WRITE;
/*!40000 ALTER TABLE `message_recipients` DISABLE KEYS */;
INSERT INTO `message_recipients` VALUES (677,671);
/*!40000 ALTER TABLE `message_recipients` ENABLE KEYS */;
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
  `end_moment` datetime DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `start_moment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `conference` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g9jn8oaylcvixfdbmtesav3c3` (`conference`),
  CONSTRAINT `FK_g9jn8oaylcvixfdbmtesav3c3` FOREIGN KEY (`conference`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panel`
--

LOCK TABLES `panel` WRITE;
/*!40000 ALTER TABLE `panel` DISABLE KEYS */;
INSERT INTO `panel` VALUES (678,0,'2019-01-01 16:30:00','room1','2019-01-01 16:01:00','summary1','Panel',656);
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
INSERT INTO `paper` VALUES (602,0,'http://bibing.us.es/proyectos/abreproy/11247/fichero/Memoria%252F6-Conceptos+previos.pdf','Summary','paper title'),(603,0,'http://bibing.us.es/proyectos/abreproy/11247/fichero/Memoria%252F6-Conceptos+previos.pdf','Summary','paper title'),(604,0,'http://bibing.us.es/proyectos/abreproy/11247/fichero/Memoria%252F6-Conceptos+previos.pdf','Summary','paper1'),(605,0,'http://bibing.us.es/proyectos/abreproy/11247/fichero/Memoria%252F6-Conceptos+previos.pdf','Summary','PAPER'),(606,0,'http://bibing.us.es/proyectos/abreproy/11247/fichero/Memoria%252F6-Conceptos+previos.pdf','Summary','paper10');
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper_authors`
--

DROP TABLE IF EXISTS `paper_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper_authors` (
  `paper` int(11) NOT NULL,
  `authors` int(11) NOT NULL,
  KEY `FK_9h4r7lf49uxxsgsmf9tgh1m5k` (`authors`),
  KEY `FK_ae9a28ln0ji506i8uoqhv563h` (`paper`),
  CONSTRAINT `FK_ae9a28ln0ji506i8uoqhv563h` FOREIGN KEY (`paper`) REFERENCES `paper` (`id`),
  CONSTRAINT `FK_9h4r7lf49uxxsgsmf9tgh1m5k` FOREIGN KEY (`authors`) REFERENCES `author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_authors`
--

LOCK TABLES `paper_authors` WRITE;
/*!40000 ALTER TABLE `paper_authors` DISABLE KEYS */;
INSERT INTO `paper_authors` VALUES (602,670),(603,663),(604,663),(605,663),(605,670),(606,670);
/*!40000 ALTER TABLE `paper_authors` ENABLE KEYS */;
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
  `end_moment` datetime DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `start_moment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `conference` int(11) DEFAULT NULL,
  `submission` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e9qf4qdrd5q4paa06xkv4q1by` (`submission`),
  KEY `FK_fu56gussuaw8r8865h3x4cvq0` (`conference`),
  CONSTRAINT `FK_fu56gussuaw8r8865h3x4cvq0` FOREIGN KEY (`conference`) REFERENCES `conference` (`id`),
  CONSTRAINT `FK_e9qf4qdrd5q4paa06xkv4q1by` FOREIGN KEY (`submission`) REFERENCES `submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentation`
--

LOCK TABLES `presentation` WRITE;
/*!40000 ALTER TABLE `presentation` DISABLE KEYS */;
INSERT INTO `presentation` VALUES (680,0,'2019-01-01 17:00:00','room1','2019-01-01 16:45:00','summary conference','presentation1',656,668);
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
  `conference` int(11) DEFAULT NULL,
  `credit_card` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lc3odbpd5lgo7qc3w33ugwafj` (`conference`),
  KEY `FK_o81sqbmy1blyga0cbtlhbho4d` (`credit_card`),
  CONSTRAINT `FK_o81sqbmy1blyga0cbtlhbho4d` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`),
  CONSTRAINT `FK_lc3odbpd5lgo7qc3w33ugwafj` FOREIGN KEY (`conference`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (669,0,647,607);
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
  `submission` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a0lt5jqh9b7s1gw3q77nywxxn` (`submission`),
  CONSTRAINT `FK_a0lt5jqh9b7s1gw3q77nywxxn` FOREIGN KEY (`submission`) REFERENCES `submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (673,0,'No comments.','ACCEPT',8,7,5,667),(674,0,'No comments.','ACCEPT',8,8,7,664),(675,0,'No comments.','ACCEPT',7,10,7,665),(676,0,'No comments.','ACCEPT',7,10,7,668);
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
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `optional_photo` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `finder` int(11) NOT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1wsbx4vhaxhkixxv3ej7vrrr3` (`finder`),
  KEY `FK_ite8gbxlfjyy7g7wqqiyjhkmn` (`user_account`),
  CONSTRAINT `FK_ite8gbxlfjyy7g7wqqiyjhkmn` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_1wsbx4vhaxhkixxv3ej7vrrr3` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer`
--

LOCK TABLES `reviewer` WRITE;
/*!40000 ALTER TABLE `reviewer` DISABLE KEYS */;
INSERT INTO `reviewer` VALUES (671,0,'Sol 28','reviewer1@hotmail.com','','Ana','','+34 620148002','Gómez',640,597),(672,0,'Gran Via 28','anagon@hotmail.com','','Anastasia','','+34 633148002','Gónzalez',641,598);
/*!40000 ALTER TABLE `reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_keywords`
--

DROP TABLE IF EXISTS `reviewer_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewer_keywords` (
  `reviewer` int(11) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  KEY `FK_d1mpqlt4vmfyn53hbyt5la0uv` (`reviewer`),
  CONSTRAINT `FK_d1mpqlt4vmfyn53hbyt5la0uv` FOREIGN KEY (`reviewer`) REFERENCES `reviewer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_keywords`
--

LOCK TABLES `reviewer_keywords` WRITE;
/*!40000 ALTER TABLE `reviewer_keywords` DISABLE KEYS */;
INSERT INTO `reviewer_keywords` VALUES (671,'submission1'),(671,'Learn'),(672,'Python'),(672,'Plantinar');
/*!40000 ALTER TABLE `reviewer_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_reports`
--

DROP TABLE IF EXISTS `reviewer_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewer_reports` (
  `reviewer` int(11) NOT NULL,
  `reports` int(11) NOT NULL,
  UNIQUE KEY `UK_r8qpqj6gasde6rksm6tbgcl2p` (`reports`),
  KEY `FK_qor8s232mxdvee2o59fyro0gn` (`reviewer`),
  CONSTRAINT `FK_qor8s232mxdvee2o59fyro0gn` FOREIGN KEY (`reviewer`) REFERENCES `reviewer` (`id`),
  CONSTRAINT `FK_r8qpqj6gasde6rksm6tbgcl2p` FOREIGN KEY (`reports`) REFERENCES `report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_reports`
--

LOCK TABLES `reviewer_reports` WRITE;
/*!40000 ALTER TABLE `reviewer_reports` DISABLE KEYS */;
INSERT INTO `reviewer_reports` VALUES (671,673),(671,676),(672,674),(672,675);
/*!40000 ALTER TABLE `reviewer_reports` ENABLE KEYS */;
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
  `tutorial` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6tcpk427cxiaiglbxvybc9fjh` (`tutorial`),
  CONSTRAINT `FK_6tcpk427cxiaiglbxvybc9fjh` FOREIGN KEY (`tutorial`) REFERENCES `tutorial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (681,0,'summary1','section1',679);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_optional_pictures`
--

DROP TABLE IF EXISTS `section_optional_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_optional_pictures` (
  `section` int(11) NOT NULL,
  `optional_pictures` varchar(255) DEFAULT NULL,
  KEY `FK_tfmblg8pibi86yess3ndl868g` (`section`),
  CONSTRAINT `FK_tfmblg8pibi86yess3ndl868g` FOREIGN KEY (`section`) REFERENCES `section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_optional_pictures`
--

LOCK TABLES `section_optional_pictures` WRITE;
/*!40000 ALTER TABLE `section_optional_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `section_optional_pictures` ENABLE KEYS */;
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
  `camera_ready` bit(1) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `conference` int(11) DEFAULT NULL,
  `paper` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9ayhftkow8judgm0cblwdb9mi` (`ticker`),
  KEY `FK_1vynnfw6cw1l40c8e342st672` (`conference`),
  KEY `FK_3osm3qjvt3r41xau9xwf5nkdt` (`paper`),
  CONSTRAINT `FK_3osm3qjvt3r41xau9xwf5nkdt` FOREIGN KEY (`paper`) REFERENCES `paper` (`id`),
  CONSTRAINT `FK_1vynnfw6cw1l40c8e342st672` FOREIGN KEY (`conference`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
INSERT INTO `submission` VALUES (664,0,'\0','2019-01-06 00:00:00','ACCEPTED','MAS-8K8Q',654,605),(665,0,'','2019-01-06 00:00:00','ACCEPTED','MAS-5L2B',655,603),(666,0,'\0','2019-01-06 00:00:00','UNDER-REVIEW','JXL-8K7L',657,602),(667,0,'\0','2019-01-06 00:00:00','UNDER-REVIEW','MAS-8K6L',653,604),(668,0,'','2019-01-06 00:00:00','ACCEPTED','JXL-213L',656,606);
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_reviewers`
--

DROP TABLE IF EXISTS `submission_reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_reviewers` (
  `submission` int(11) NOT NULL,
  `reviewers` int(11) NOT NULL,
  KEY `FK_rx31lgg0k67efoplhxv8len0c` (`reviewers`),
  KEY `FK_iwsj2ioiue7vmn5bnhxb2oatb` (`submission`),
  CONSTRAINT `FK_iwsj2ioiue7vmn5bnhxb2oatb` FOREIGN KEY (`submission`) REFERENCES `submission` (`id`),
  CONSTRAINT `FK_rx31lgg0k67efoplhxv8len0c` FOREIGN KEY (`reviewers`) REFERENCES `reviewer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_reviewers`
--

LOCK TABLES `submission_reviewers` WRITE;
/*!40000 ALTER TABLE `submission_reviewers` DISABLE KEYS */;
INSERT INTO `submission_reviewers` VALUES (664,672),(665,672),(667,671),(668,671);
/*!40000 ALTER TABLE `submission_reviewers` ENABLE KEYS */;
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
  `english_name` varchar(255) DEFAULT NULL,
  `spanish_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (608,0,'INQUIRY','INVESTIGACIÓN'),(609,0,'REBUTTAL','REFUTACIÓN'),(610,0,'TOPICS','TEMAS'),(611,0,'REGISTRATION','REGISTRO'),(612,0,'OTHER','OTRO');
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
  `end_moment` datetime DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `start_moment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `conference` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gd8wor872gtoqt1siaw2k4din` (`conference`),
  CONSTRAINT `FK_gd8wor872gtoqt1siaw2k4din` FOREIGN KEY (`conference`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorial`
--

LOCK TABLES `tutorial` WRITE;
/*!40000 ALTER TABLE `tutorial` DISABLE KEYS */;
INSERT INTO `tutorial` VALUES (679,0,'2019-01-01 16:45:00','room1','2019-01-01 16:30:00','summary1','tutorial1',656);
/*!40000 ALTER TABLE `tutorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_castjbvpeeus0r8lbpehiu0e4` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (595,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(596,0,'b312ba4ffd5245fa2a1ab819ec0d0347','author1'),(597,0,'6ce19528a40dde9521d97cf7ba264eca','reviewer1'),(598,0,'2693b57f0f59df94caacefb811e99851','reviewer2'),(599,0,'9bd97baef2b853ec00cc3cffd269f679','author2'),(600,0,'d5cee333abe432891a0de57d0ee38713','administrator1'),(601,0,'82954495ff7e2a735ed2192c35b2cd00','administrator2');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account_authorities`
--

DROP TABLE IF EXISTS `user_account_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account_authorities` (
  `user_account` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_pao8cwh93fpccb0bx6ilq6gsl` (`user_account`),
  CONSTRAINT `FK_pao8cwh93fpccb0bx6ilq6gsl` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account_authorities`
--

LOCK TABLES `user_account_authorities` WRITE;
/*!40000 ALTER TABLE `user_account_authorities` DISABLE KEYS */;
INSERT INTO `user_account_authorities` VALUES (595,'ADMIN'),(596,'AUTHOR'),(597,'REVIEWER'),(598,'REVIEWER'),(599,'AUTHOR'),(600,'ADMIN'),(601,'ADMIN');
/*!40000 ALTER TABLE `user_account_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-26 17:09:48
