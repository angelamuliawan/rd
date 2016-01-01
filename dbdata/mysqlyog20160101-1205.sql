/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.36 : Database - rd
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
-- CREATE DATABASE /*!32312 IF NOT EXISTS*/`rd` /*!40100 DEFAULT CHARACTER SET latin1 */;

-- USE `rd`;

/*Table structure for table `album` */

DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
  `AlbumID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `AlbumName` varchar(200) NOT NULL,
  `AlbumDescription` varchar(200) NOT NULL,
  PRIMARY KEY (`AlbumID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `album` */

insert  into `album`(`AlbumID`,`UserID`,`AlbumName`,`AlbumDescription`) values (1,0,'Album Gereja','Deskripsi album gereja'),(3,0,'album baru','yihaaa');

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `ArticleID` int(11) NOT NULL AUTO_INCREMENT,
  `ArticleImage` varchar(100) DEFAULT NULL,
  `ArticleTitle` varchar(100) DEFAULT NULL,
  `ArticleDate` datetime DEFAULT NULL,
  `ArticleContent` longtext,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `article` */

/*Table structure for table `banner` */

DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner` (
  `ItemID` int(11) NOT NULL AUTO_INCREMENT,
  `Judul` varchar(300) NOT NULL,
  `URL` varchar(300) NOT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `banner` */

/*Table structure for table `composition` */

DROP TABLE IF EXISTS `composition`;

CREATE TABLE `composition` (
  `CompositionID` int(11) NOT NULL AUTO_INCREMENT,
  `CompositionName` varchar(100) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  `CreatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`CompositionID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `composition` */

insert  into `composition`(`CompositionID`,`CompositionName`,`AuditedActivity`,`AuditedTime`,`AuditedUser`,`CreatedTime`) values (1,'Beras','C','2015-12-03 10:49:14',1,NULL),(2,'Telur','C','2015-12-03 10:49:24',1,NULL),(3,'Ayam Broiler','C','2015-12-03 10:49:24',1,NULL),(4,'Ayam Kampung','C','2015-12-03 10:49:24',1,NULL),(5,'Daging Sapi','C','2015-12-03 10:49:24',1,NULL),(6,'Cumi','C','2015-12-03 10:49:24',1,NULL),(7,'Udang','C','2015-12-03 10:49:24',1,NULL),(8,'Sawi','C','2015-12-03 10:49:24',1,NULL),(9,'Bawang Putih','C','2015-12-03 10:49:24',1,NULL),(10,'Mie','C','2015-12-03 10:49:24',1,NULL),(11,'Bihun','C','2015-12-03 10:49:24',1,NULL),(12,'Soun','C','2015-12-03 10:49:24',1,NULL),(13,'Ayam Fillet','C','2015-12-03 10:49:24',1,NULL),(14,'Kaldu Ayam','C','2015-12-03 10:49:24',1,NULL),(15,'Telur Ayam','C','2015-12-18 20:07:50',1,'2015-12-18 20:07:50'),(16,'Bawang Merah','C','2015-12-31 21:52:17',1,'2015-12-31 21:52:17'),(17,'Telur Bebek','C','2015-12-31 22:01:22',1,'2015-12-31 22:01:22');

/*Table structure for table `contest` */

DROP TABLE IF EXISTS `contest`;

CREATE TABLE `contest` (
  `ContestID` int(11) NOT NULL AUTO_INCREMENT,
  `ContestName` varchar(100) DEFAULT NULL,
  `ContestDesc` longtext,
  `ContestBanner` varchar(100) DEFAULT NULL,
  `ContestStartDate` date DEFAULT NULL,
  `ContestEndDate` date DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`ContestID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contest` */

/*Table structure for table `contestscore` */

DROP TABLE IF EXISTS `contestscore`;

CREATE TABLE `contestscore` (
  `ContestScoreID` int(11) NOT NULL AUTO_INCREMENT,
  `RecipeID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `ContestID` int(11) DEFAULT NULL,
  `Score` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`ContestScoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contestscore` */

/*Table structure for table `contestwinner` */

DROP TABLE IF EXISTS `contestwinner`;

CREATE TABLE `contestwinner` (
  `ContestWinnerID` int(10) unsigned zerofill NOT NULL,
  `ContestWinnerSeq` int(11) DEFAULT NULL,
  `ContestScoreID` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`ContestWinnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contestwinner` */

/*Table structure for table `cookmark` */

DROP TABLE IF EXISTS `cookmark`;

CREATE TABLE `cookmark` (
  `CookmarkID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `RecipeID` int(11) DEFAULT NULL,
  `CookmarkDate` datetime DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`CookmarkID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `cookmark` */

insert  into `cookmark`(`CookmarkID`,`UserID`,`RecipeID`,`CookmarkDate`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,1,2,NULL,'C','2015-12-03 11:25:00',1),(2,3,2,NULL,'C','2015-12-03 11:25:09',3),(3,3,1,NULL,'C','2015-12-03 11:25:19',3),(4,1,11,'2015-12-31 15:23:28','C','2015-12-31 15:23:28',1),(5,2,13,'2015-12-31 23:06:43','C','2015-12-31 23:06:43',2),(6,2,14,'2015-12-31 23:06:52','C','2015-12-31 23:06:52',2);

/*Table structure for table `cuisine` */

DROP TABLE IF EXISTS `cuisine`;

CREATE TABLE `cuisine` (
  `CuisineID` int(11) NOT NULL AUTO_INCREMENT,
  `CuisineName` varchar(100) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`CuisineID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `cuisine` */

insert  into `cuisine`(`CuisineID`,`CuisineName`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Western','C','2015-12-03 10:53:12',1),(2,'Italian','C','2015-12-03 10:54:59',1),(3,'Asian','C','2015-12-03 10:55:00',1),(4,'Indian','C','2015-12-03 10:54:59',1),(5,'Chinese','C','2015-12-03 10:54:59',1),(6,'Japanese','C','2015-12-03 10:54:59',1),(7,'Vietnamese','C','2015-12-03 10:54:59',1),(8,'Thai','C','2015-12-03 10:54:59',1),(9,'French','C','2015-12-03 10:54:59',1),(10,'Korean','C','2015-12-03 10:54:59',1),(11,'Spanish','C','2015-12-03 10:54:59',1),(12,'Malaysian','C','2015-12-03 10:54:59',1),(13,'European','C','2015-12-03 10:54:59',1),(14,'Mexican','C','2015-12-03 10:54:59',1),(15,'Singaporean','C','2015-12-03 10:54:59',1),(16,'Arabian','C','2015-12-03 10:54:59',1),(17,'Indonesian','C','2015-12-03 10:54:59',1),(18,'African','C','2015-12-03 10:54:59',1);

/*Table structure for table `estpeople` */

DROP TABLE IF EXISTS `estpeople`;

CREATE TABLE `estpeople` (
  `EstPeopleID` float NOT NULL AUTO_INCREMENT,
  `EstPeopleStart` int(11) DEFAULT NULL,
  `EstPeopleEnd` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`EstPeopleID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `estpeople` */

insert  into `estpeople`(`EstPeopleID`,`EstPeopleStart`,`EstPeopleEnd`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,1,1,'C','2015-12-03 11:05:20',1),(2,2,5,'C','2015-12-03 11:05:20',1),(3,6,10,'C','2015-12-03 11:05:20',1),(4,11,20,'C','2015-12-03 11:05:20',1);

/*Table structure for table `foodcomment` */

DROP TABLE IF EXISTS `foodcomment`;

CREATE TABLE `foodcomment` (
  `FoodCommentID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `RecipeID` int(11) DEFAULT NULL,
  `Comment` varchar(200) DEFAULT NULL,
  `CommentDate` datetime DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`FoodCommentID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `foodcomment` */

insert  into `foodcomment`(`FoodCommentID`,`UserID`,`RecipeID`,`Comment`,`CommentDate`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,3,1,'wow mau coba dong sis','2015-12-02 11:27:04','C','2015-12-03 11:27:08',3),(2,2,1,'Boleh sis ayo di recook','2015-12-02 14:27:26','C','2015-12-03 11:27:33',NULL),(3,3,1,'coba lagi gan','2015-12-30 20:26:35','C','2015-12-30 20:26:35',3),(4,3,11,'oke gan','2015-12-30 22:49:59','C','2015-12-30 22:49:59',3),(5,1,1,'Enak Bingits ','2015-12-31 12:56:56','C','2015-12-31 12:56:56',1),(6,1,1,'Enak Bingits ','2015-12-31 12:57:27','C','2015-12-31 12:57:27',1),(7,1,1,'Enak Bingits ','2015-12-31 13:02:10','C','2015-12-31 13:02:10',1),(8,2,1,'boleh sis yuk coba yuk','2015-12-31 13:05:00','C','2015-12-31 13:05:00',2),(9,2,4,'Test Notif yg comment si angel harusnya kena admin','2015-12-31 13:17:47','C','2015-12-31 13:17:47',2),(10,2,4,'ke 2Test Notif yg comment si angel harusnya kena admin','2015-12-31 13:24:05','C','2015-12-31 13:24:05',2),(11,2,4,'ke 3 -Test Notif yg comment si angel harusnya kena admin','2015-12-31 13:24:39','C','2015-12-31 13:24:39',2),(12,2,4,'ke 4 deh -Test Notif yg comment si angel harusnya kena admin','2015-12-31 13:26:35','C','2015-12-31 13:26:35',2),(13,3,4,'ke 1 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:29:41','C','2015-12-31 13:29:41',3),(14,3,4,'ke 2 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:39:52','C','2015-12-31 13:39:52',3),(15,3,4,'ke 2 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:40:00','C','2015-12-31 13:40:00',3),(16,3,4,'ke 2 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:40:17','C','2015-12-31 13:40:17',3),(17,3,4,'ke 2 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:40:18','C','2015-12-31 13:40:18',3),(18,3,4,'ke 2 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:40:45','C','2015-12-31 13:40:45',3),(19,3,4,'ke 3 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:41:49','C','2015-12-31 13:41:49',3),(20,3,4,'ke 4 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:42:12','C','2015-12-31 13:42:12',3),(21,3,4,'ke 4 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:44:23','C','2015-12-31 13:44:23',3),(22,3,4,'ke 5 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:44:56','C','2015-12-31 13:44:56',3),(23,3,4,'ke 5 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:47:32','C','2015-12-31 13:47:32',3),(24,3,4,'ke 5 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:50:24','C','2015-12-31 13:50:24',3),(25,1,4,'ke 5 deh -Test Notif yg comment si admin harusnya kena brian, angel','2015-12-31 13:52:24','C','2015-12-31 13:52:24',1),(26,2,1,'ahayyy','2015-12-31 23:07:49','C','2015-12-31 23:07:49',2),(29,3,1,'okay deh','2016-01-01 10:22:41','C','2016-01-01 10:22:41',3),(30,3,12,'sample','2016-01-01 11:44:46','C','2016-01-01 11:44:46',3),(31,3,12,'terus','2016-01-01 11:44:56','C','2016-01-01 11:44:56',3);

/*Table structure for table `foodcomposition` */

DROP TABLE IF EXISTS `foodcomposition`;

CREATE TABLE `foodcomposition` (
  `FoodCompositionID` int(11) NOT NULL AUTO_INCREMENT,
  `FoodCompositionSeq` int(11) DEFAULT NULL,
  `Measure` float DEFAULT NULL,
  `CompositionID` int(11) DEFAULT NULL,
  `RecipeID` int(11) DEFAULT NULL,
  `MeasureSizeID` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`FoodCompositionID`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

/*Data for the table `foodcomposition` */

insert  into `foodcomposition`(`FoodCompositionID`,`FoodCompositionSeq`,`Measure`,`CompositionID`,`RecipeID`,`MeasureSizeID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,NULL,100,1,1,1,'C','2015-12-03 11:14:51',2),(2,NULL,1,2,1,4,'C','2015-12-03 11:14:52',2),(3,NULL,200,13,1,1,'C','2015-12-03 11:14:54',2),(4,NULL,9,9,1,1,'C','2015-12-03 11:14:55',2),(5,NULL,200,1,2,1,'C','2015-12-03 11:19:48',2),(6,NULL,1,2,2,4,'C','2015-12-03 11:19:50',2),(7,NULL,200,7,2,1,'C','2015-12-03 11:19:51',2),(8,NULL,100,10,3,1,'C','2015-12-03 23:12:14',3),(9,NULL,100,13,3,1,'C','2015-12-03 23:12:18',3),(10,NULL,200,14,3,6,'C','2015-12-03 23:12:21',3),(11,1,100,1,4,1,'C','2015-12-15 21:38:51',1),(12,2,100,15,4,4,'C','2015-12-18 20:07:50',1),(13,3,100,1,4,4,'C','2015-12-20 11:02:41',1),(14,1,100,0,5,5,'C','2015-12-21 22:00:54',1),(15,2,1,4,5,4,'C','2015-12-21 22:00:54',1),(16,1,12,5,6,5,'C','2015-12-30 22:05:00',3),(17,1,200,0,7,4,'C','2015-12-30 22:25:58',3),(18,2,300,0,7,4,'C','2015-12-30 22:25:58',3),(19,1,200,5,8,4,'C','2015-12-30 22:30:07',3),(20,2,300,2,8,4,'C','2015-12-30 22:30:07',3),(21,1,200,5,9,4,'C','2015-12-30 22:30:34',3),(22,2,300,2,9,4,'C','2015-12-30 22:30:34',3),(23,1,200,5,10,4,'C','2015-12-30 22:31:13',3),(24,2,300,2,10,4,'C','2015-12-30 22:31:13',3),(25,1,200,5,11,4,'C','2015-12-30 22:45:21',3),(26,2,300,15,11,4,'C','2015-12-30 22:45:22',3),(27,1,4545,5,12,5,'D','2015-12-30 23:59:51',3),(28,1,4545,5,13,5,'C','2015-12-30 23:42:30',3),(29,1,4545,5,12,5,'D','2015-12-30 23:59:51',3),(30,1,4545,5,12,5,'D','2015-12-30 23:59:51',3),(31,1,1111,5,12,3,'C','2015-12-30 23:59:51',3),(32,1,2,9,14,4,'D','2015-12-31 22:28:57',1),(33,2,3,0,14,4,'D','2015-12-31 22:28:57',1),(34,3,2,0,14,7,'D','2015-12-31 22:28:57',1),(35,4,1,15,14,4,'D','2015-12-31 22:28:57',1),(36,5,50,0,14,1,'D','2015-12-31 22:28:57',1),(37,6,3,0,14,3,'D','2015-12-31 22:28:57',1),(38,1,2,9,14,4,'D','2015-12-31 22:28:57',1),(39,2,1,15,14,4,'D','2015-12-31 22:28:57',1),(40,3,3,0,14,4,'D','2015-12-31 22:28:57',1),(41,1,2,9,14,4,'D','2015-12-31 22:28:57',1),(42,2,1,15,14,4,'D','2015-12-31 22:28:57',1),(43,3,3,0,14,4,'D','2015-12-31 22:28:57',1),(44,3,3,16,4,14,'C','2015-12-31 21:52:17',1),(45,3,3,16,4,14,'C','2015-12-31 21:52:49',1),(46,4,3,17,4,14,'C','2015-12-31 22:01:22',1),(47,4,3,16,14,4,'D','2015-12-31 22:28:57',1),(48,1,2,9,14,4,'D','2015-12-31 22:28:57',1),(49,2,1,15,14,4,'D','2015-12-31 22:28:57',1),(50,3,3,16,14,4,'D','2015-12-31 22:28:57',1),(51,4,1,0,14,8,'D','2015-12-31 22:28:57',1),(52,1,2,9,14,4,'D','2015-12-31 22:28:57',1),(53,2,1,15,14,4,'D','2015-12-31 22:28:57',1),(54,3,3,16,14,4,'D','2015-12-31 22:28:57',1),(55,4,1,0,14,8,'D','2015-12-31 22:28:57',1),(56,5,1,0,14,3,'D','2015-12-31 22:28:57',1),(57,1,2,9,14,4,'D','2015-12-31 22:28:57',1),(58,2,1,15,14,4,'D','2015-12-31 22:28:57',1),(59,3,3,16,14,4,'D','2015-12-31 22:28:57',1),(60,4,1,0,14,8,'D','2015-12-31 22:28:57',1),(61,5,1,0,14,3,'D','2015-12-31 22:28:57',1),(62,1,2,9,14,4,'C','2015-12-31 22:28:57',1),(63,2,1,15,14,4,'C','2015-12-31 22:28:57',1),(64,3,3,16,14,4,'C','2015-12-31 22:28:58',1),(65,4,1,0,14,8,'C','2015-12-31 22:28:58',1),(66,5,1,0,14,3,'C','2015-12-31 22:28:58',1),(67,1,34,5,15,5,'C','2016-01-01 11:09:52',3),(68,2,434,7,15,5,'C','2016-01-01 11:09:52',3);

/*Table structure for table `foodcuisine` */

DROP TABLE IF EXISTS `foodcuisine`;

CREATE TABLE `foodcuisine` (
  `FoodCuisineID` int(11) NOT NULL AUTO_INCREMENT,
  `CuisineID` int(11) DEFAULT NULL,
  `RecipeID` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`FoodCuisineID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

/*Data for the table `foodcuisine` */

insert  into `foodcuisine`(`FoodCuisineID`,`CuisineID`,`RecipeID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,1,1,'C','2015-12-03 11:11:13',2),(2,17,1,'C','2015-12-03 11:11:24',2),(3,1,2,'C','2015-12-03 11:12:10',2),(4,5,2,'C','2015-12-03 11:12:11',2),(5,3,3,'C','2015-12-03 23:07:25',3),(6,5,3,'C','2015-12-03 23:07:29',3),(7,1,4,'C','2015-12-15 21:36:56',1),(8,2,4,'C','2015-12-15 21:36:56',1),(9,5,5,'C','2015-12-21 22:00:54',1),(10,1,6,'C','2015-12-30 22:05:00',3),(11,1,7,'C','2015-12-30 22:25:58',3),(12,1,8,'C','2015-12-30 22:30:07',3),(13,1,9,'C','2015-12-30 22:30:34',3),(14,1,10,'C','2015-12-30 22:31:13',3),(15,1,11,'C','2015-12-30 22:45:21',3),(16,2,11,'C','2015-12-30 22:45:21',3),(17,2,12,'D','2015-12-30 23:59:50',3),(18,3,12,'D','2015-12-30 23:59:50',3),(19,2,13,'C','2015-12-30 23:42:30',3),(20,3,13,'C','2015-12-30 23:42:30',3),(21,2,12,'D','2015-12-30 23:59:50',3),(22,3,12,'D','2015-12-30 23:59:50',3),(23,2,12,'D','2015-12-30 23:59:50',3),(24,3,12,'D','2015-12-30 23:59:50',3),(25,2,12,'D','2015-12-30 23:59:50',3),(26,3,12,'D','2015-12-30 23:59:50',3),(27,2,12,'C','2015-12-30 23:59:50',3),(28,3,12,'C','2015-12-30 23:59:50',3),(29,5,14,'D','2015-12-31 22:28:57',1),(30,16,14,'D','2015-12-31 22:28:57',1),(31,5,14,'D','2015-12-31 22:28:57',1),(32,16,14,'D','2015-12-31 22:28:57',1),(33,5,14,'D','2015-12-31 22:28:57',1),(34,16,14,'D','2015-12-31 22:28:57',1),(35,5,14,'D','2015-12-31 22:28:57',1),(36,16,14,'D','2015-12-31 22:28:57',1),(37,5,14,'D','2015-12-31 22:28:57',1),(38,16,14,'D','2015-12-31 22:28:57',1),(39,5,14,'D','2015-12-31 22:28:57',1),(40,16,14,'D','2015-12-31 22:28:57',1),(41,5,14,'C','2015-12-31 22:28:57',1),(42,16,14,'C','2015-12-31 22:28:57',1),(43,1,15,'C','2016-01-01 11:09:52',3),(44,2,15,'C','2016-01-01 11:09:52',3);

/*Table structure for table `foodprocess` */

DROP TABLE IF EXISTS `foodprocess`;

CREATE TABLE `foodprocess` (
  `FoodProcessID` int(11) NOT NULL AUTO_INCREMENT,
  `FoodProcessName` varchar(100) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`FoodProcessID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `foodprocess` */

insert  into `foodprocess`(`FoodProcessID`,`FoodProcessName`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Goreng','C','2015-12-03 11:00:40',1),(2,'Panggang','C','2015-12-03 11:00:40',1),(3,'Kukus','C','2015-12-03 11:00:40',1),(4,'Tumis','C','2015-12-03 11:00:40',1),(5,'Rebus','C','2015-12-03 11:00:40',1),(6,'Tanpa Masak','C','2015-12-03 11:00:40',1);

/*Table structure for table `foodstep` */

DROP TABLE IF EXISTS `foodstep`;

CREATE TABLE `foodstep` (
  `FoodStepID` int(11) NOT NULL AUTO_INCREMENT,
  `FoodStepSequence` int(11) DEFAULT NULL,
  `FoodStepName` varchar(500) DEFAULT NULL,
  `FoodStepImage` varchar(100) DEFAULT NULL,
  `RecipeID` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`FoodStepID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

/*Data for the table `foodstep` */

insert  into `foodstep`(`FoodStepID`,`FoodStepSequence`,`FoodStepName`,`FoodStepImage`,`RecipeID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,1,'Tumis bawang putih hingga harum',NULL,1,NULL,'2015-12-03 11:22:03',2),(2,2,'Masukkan telur ',NULL,1,'C','2015-12-03 11:22:05',2),(3,3,'masukan ayam',NULL,1,'C','2015-12-03 11:22:06',2),(4,4,'masukan nasi',NULL,1,'C','2015-12-03 11:22:08',2),(5,5,'bumbu secukupnya',NULL,1,'C','2015-12-03 11:22:09',2),(6,6,'nasi goreng siap disajikan',NULL,1,'C','2015-12-03 11:22:11',2),(7,1,'Tumis bawang putih hingga harum',NULL,2,'C','2015-12-03 11:22:11',2),(8,2,'Masukkan telur ',NULL,2,'C','2015-12-03 11:22:11',2),(9,3,'masukan UDANG',NULL,2,'C','2015-12-03 11:22:11',2),(10,4,'masukan nasi',NULL,2,'C','2015-12-03 11:22:11',2),(11,5,'bumbu secukupnya',NULL,2,'C','2015-12-03 11:22:11',2),(12,6,'nasi goreng siap disajikan',NULL,2,'C','2015-12-03 11:22:11',2),(13,1,'Rebus mi dengan kaldu ayam',NULL,3,'C','2015-12-03 23:13:18',3),(14,2,'masukkan ayam fillet',NULL,3,'C','2015-12-03 23:13:20',3),(15,3,'sajikan',NULL,3,'C','2015-12-03 23:13:23',3),(16,1,'masukkan panci','panci.jpg',4,'C','2015-12-15 21:39:34',1),(17,1,'cuci ayam & rebus sampai setengah matang',NULL,5,'C','2015-12-21 22:00:54',1),(18,2,'masukkan angka, rebus lagi kurang lebih 60 menit',NULL,5,'C','2015-12-21 22:00:55',1),(19,3,'ayam merah siap disajikan yeayy',NULL,5,'C','2015-12-21 22:00:55',1),(20,1,'okay lah',NULL,6,'C','2015-12-30 22:05:00',3),(21,1,'poopop','0',7,'C','2015-12-30 22:25:58',3),(22,2,'popop','0',7,'C','2015-12-30 22:25:58',3),(23,1,'poopop','20151230_22_25_03_95.png',8,'C','2015-12-30 22:30:07',3),(24,2,'popop',NULL,8,'C','2015-12-30 22:30:07',3),(25,1,'poopop','20151230_22_30_34_70.jpg',9,'C','2015-12-30 22:30:34',3),(26,2,'popop',NULL,9,'C','2015-12-30 22:30:34',3),(27,3,'step terakhir no image yah gan',NULL,9,'C','2015-12-30 22:30:34',3),(28,1,'poopop','20151230_22_31_13_27.jpg',10,'C','2015-12-30 22:31:13',3),(29,2,'popop',NULL,10,'C','2015-12-30 22:31:13',3),(30,3,'step terakhir no image yah gan',NULL,10,'C','2015-12-30 22:31:13',3),(31,1,'ok','20151230_22_43_56_46.jpg',11,'C','2015-12-30 22:45:22',3),(32,2,'popoopopopoopopop','20151230_22_43_56_1.png',11,'C','2015-12-30 22:45:22',3),(33,1,'tanggung amat yah hahahaha','20151230_23_24_49_39.jpg',12,'D','2015-12-30 23:59:51',3),(34,2,'tanggun nig','20151230_23_24_55_96.png',12,'D','2015-12-30 23:59:51',3),(35,1,'tanggung amat yah hahahaha','20151230_23_42_30_87.jpg',13,'C','2015-12-30 23:42:31',3),(36,2,'tanggun nig','20151230_23_24_55_96.png',13,'C','2015-12-30 23:42:31',3),(37,1,'tanggung amat yah hahahaha','20151230_23_24_49_39.jpg',12,'D','2015-12-30 23:59:51',3),(38,2,'tanggun nig','20151230_23_24_55_96.png',12,'D','2015-12-30 23:59:51',3),(39,1,'UPDATEEEEE','20151230_23_24_55_96.png',12,'D','2015-12-30 23:59:51',3),(40,2,'UPDATEEEEE','20151230_23_48_49_54.jpg',12,'D','2015-12-30 23:59:51',3),(41,1,'UPDATEEEEE','20151230_23_48_49_54.jpg',12,'C','2015-12-30 23:59:51',3),(42,2,'AFTER UPDATEEEEE','20151230_23_59_50_65.jpg',12,'C','2015-12-30 23:59:51',3),(43,3,'AFTER UPDATEEEEE BUBUUUUU','20151230_23_59_50_50.png',12,'C','2015-12-30 23:59:51',3),(44,1,'Kocok telur hingga merata',NULL,14,'D','2015-12-31 22:28:58',1),(45,2,'Panaskan wajan dengan minyak secukupnya. Masukkan telur dan hancurkan telur hingga warnanya kekuning-kuningan, Angkat dan tiriskan.',NULL,14,'D','2015-12-31 22:28:58',1),(46,3,'Tumis bawang merah dan bawang putih hingga harum,',NULL,14,'D','2015-12-31 22:28:58',1),(47,4,'Campurkan telur dan nasi aduk hingga merata, Masukkan kecap manis dan garam secukupnya,',NULL,14,'D','2015-12-31 22:28:58',1),(48,5,'Nasi goreng siap disajikan.',NULL,14,'D','2015-12-31 22:28:58',1),(49,1,'Kocok telur hingga merata',NULL,14,'D','2015-12-31 22:28:58',1),(50,2,'Panaskan wajan dengan minyak secukupnya. Masukkan telur dan hancurkan telur hingga warnanya kekuning-kuningan, Angkat dan tiriskan.',NULL,14,'D','2015-12-31 22:28:58',1),(51,3,'Tumis bawang merah dan bawang putih hingga harum,',NULL,14,'D','2015-12-31 22:28:58',1),(52,4,'Campurkan telur dan nasi aduk hingga merata, Masukkan kecap manis dan garam secukupnya,',NULL,14,'D','2015-12-31 22:28:58',1),(53,5,'Nasi goreng siap disajikan.',NULL,14,'D','2015-12-31 22:28:58',1),(54,1,'Kocok telur hingga merata',NULL,14,'D','2015-12-31 22:28:58',1),(55,2,'Panaskan wajan dengan minyak secukupnya. Masukkan telur dan hancurkan telur hingga warnanya kekuning-kuningan, Angkat dan tiriskan.',NULL,14,'D','2015-12-31 22:28:58',1),(56,3,'Tumis bawang merah dan bawang putih hingga harum,',NULL,14,'D','2015-12-31 22:28:58',1),(57,4,'Campurkan telur dan nasi aduk hingga merata, Masukkan kecap manis dan garam secukupnya,',NULL,14,'D','2015-12-31 22:28:58',1),(58,5,'Nasi goreng siap disajikan.',NULL,14,'D','2015-12-31 22:28:58',1),(59,1,'Kocok telur hingga merata',NULL,14,'D','2015-12-31 22:28:58',1),(60,2,'Panaskan wajan dengan minyak secukupnya. Masukkan telur dan hancurkan telur hingga warnanya kekuning-kuningan, Angkat dan tiriskan.',NULL,14,'D','2015-12-31 22:28:58',1),(61,3,'Tumis bawang merah dan bawang putih hingga harum,',NULL,14,'D','2015-12-31 22:28:58',1),(62,4,'Campurkan telur dan nasi aduk hingga merata, Masukkan kecap manis dan garam secukupnya,',NULL,14,'D','2015-12-31 22:28:58',1),(63,5,'Nasi goreng siap disajikan.',NULL,14,'D','2015-12-31 22:28:58',1),(64,1,'Kocok telur hingga merata',NULL,14,'D','2015-12-31 22:28:58',1),(65,2,'Panaskan wajan dengan minyak secukupnya. Masukkan telur dan hancurkan telur hingga warnanya kekuning-kuningan, Angkat dan tiriskan.',NULL,14,'D','2015-12-31 22:28:58',1),(66,3,'Tumis bawang merah dan bawang putih hingga harum,',NULL,14,'D','2015-12-31 22:28:58',1),(67,4,'Campurkan telur dan nasi aduk hingga merata, Masukkan kecap manis dan garam secukupnya,',NULL,14,'D','2015-12-31 22:28:58',1),(68,5,'Nasi goreng siap disajikan.',NULL,14,'D','2015-12-31 22:28:58',1),(69,1,'Kocok telur hingga merata',NULL,14,'D','2015-12-31 22:28:58',1),(70,2,'Panaskan wajan dengan minyak secukupnya. Masukkan telur dan hancurkan telur hingga warnanya kekuning-kuningan, Angkat dan tiriskan.',NULL,14,'D','2015-12-31 22:28:58',1),(71,3,'Tumis bawang merah dan bawang putih hingga harum,',NULL,14,'D','2015-12-31 22:28:58',1),(72,4,'Campurkan telur dan nasi aduk hingga merata, Masukkan kecap manis dan garam secukupnya,',NULL,14,'D','2015-12-31 22:28:58',1),(73,5,'Nasi goreng siap disajikan.',NULL,14,'D','2015-12-31 22:28:58',1),(74,1,'Kocok telur hingga merata',NULL,14,'C','2015-12-31 22:28:58',1),(75,2,'Panaskan wajan dengan minyak secukupnya. Masukkan telur dan hancurkan telur hingga warnanya kekuning-kuningan, Angkat dan tiriskan.',NULL,14,'C','2015-12-31 22:28:58',1),(76,3,'Tumis bawang merah dan bawang putih hingga harum,',NULL,14,'C','2015-12-31 22:28:58',1),(77,4,'Campurkan telur dan nasi aduk hingga merata, Masukkan kecap manis dan garam secukupnya,',NULL,14,'C','2015-12-31 22:28:58',1),(78,5,'Nasi goreng siap disajikan.',NULL,14,'C','2015-12-31 22:28:58',1),(79,1,'wow',NULL,15,'C','2016-01-01 11:09:52',3);

/*Table structure for table `foodtype` */

DROP TABLE IF EXISTS `foodtype`;

CREATE TABLE `foodtype` (
  `FoodTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `FoodTypeName` varchar(100) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`FoodTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `foodtype` */

insert  into `foodtype`(`FoodTypeID`,`FoodTypeName`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Dessert','C','2015-12-03 10:59:09',1),(2,'Breakfast','C','2015-12-03 10:59:09',1),(3,'Coffee','C','2015-12-03 10:59:09',1),(4,'Bakes','C','2015-12-03 10:59:09',1),(5,'Healthy Food','C','2015-12-03 10:59:09',1),(6,'Main Course','C','2015-12-03 10:59:09',1),(7,'Fruit & Drink','C','2015-12-03 10:59:09',1),(8,'Appetizer','C','2015-12-03 10:59:09',1);

/*Table structure for table `leveluser` */

DROP TABLE IF EXISTS `leveluser`;

CREATE TABLE `leveluser` (
  `LevelUserID` int(11) NOT NULL AUTO_INCREMENT,
  `LevelName` varchar(100) DEFAULT NULL,
  `LevelNickName` varchar(2) DEFAULT NULL,
  `LevelSeq` int(11) DEFAULT NULL,
  `NumberOfRecook` int(11) DEFAULT NULL,
  `NumberOfRecipe` int(11) DEFAULT NULL,
  `NumberOfWinContest` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`LevelUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `leveluser` */

insert  into `leveluser`(`LevelUserID`,`LevelName`,`LevelNickName`,`LevelSeq`,`NumberOfRecook`,`NumberOfRecipe`,`NumberOfWinContest`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Special','Cr',6,6,1000,1000,'C','2015-12-03 11:51:50',1),(2,'Executive Chef','EC',5,5,300,3,'C','2015-12-03 11:51:09',1),(3,'Sous Chef','SC',4,4,200,1,'C','2015-12-03 11:51:11',1),(4,'Chef De Partie','CD',3,3,100,0,NULL,'2015-12-03 11:51:47',1),(5,'Commis','C',2,2,50,0,'C','2015-12-03 11:51:15',1),(6,'Cook Helper','CH',1,1,20,0,'C','2015-12-03 11:51:16',1);

/*Table structure for table `measuresize` */

DROP TABLE IF EXISTS `measuresize`;

CREATE TABLE `measuresize` (
  `MeasureSizeID` int(11) NOT NULL AUTO_INCREMENT,
  `MeasureSizeName` varchar(20) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`MeasureSizeID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `measuresize` */

insert  into `measuresize`(`MeasureSizeID`,`MeasureSizeName`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Gram','C','2015-12-03 11:17:12',1),(2,'Sdt','C','2015-12-03 11:17:12',1),(3,'Sdm','C','2015-12-03 11:17:12',1),(4,'Butir','C','2015-12-03 11:17:12',1),(5,'Kilogram','C','2015-12-03 11:17:12',1),(6,'ml','C','2015-12-03 23:10:29',1),(7,'Piring','C','2015-12-31 21:37:26',1),(8,'Sachet','C','2015-12-31 21:39:07',1);

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `NotificationID` int(11) NOT NULL AUTO_INCREMENT,
  `NotificationName` varchar(200) DEFAULT NULL,
  `NotificationURL` varchar(100) DEFAULT NULL,
  `ReceiverUserID` int(11) DEFAULT NULL,
  `NotificationDate` datetime DEFAULT NULL,
  `isRead` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`NotificationID`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;

/*Data for the table `notifications` */

insert  into `notifications`(`NotificationID`,`NotificationName`,`NotificationURL`,`ReceiverUserID`,`NotificationDate`,`isRead`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Brian Photo Recook Nasi Goreng Ayam','url image recooknya',2,'2015-12-03 11:45:05',0,'C','2015-12-03 11:45:16',3),(2,'Brian Comment ni','url halaman recipe ngarah comment',2,'2015-12-03 07:48:49',0,'C','2015-12-03 11:46:27',3),(3,'Angela Muliawan Commented on Recipe you comment on Nasi Goreng Ayam','url halaman recipe ngarah ke commentnya',3,'2015-12-03 11:48:48',0,'C','2015-12-03 11:47:08',2),(4,'Angela Muliawan (SC) Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2015-12-31 12:56:56',0,'C','2015-12-31 12:56:56',1),(5,'Angela Muliawan (SC) Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2015-12-31 12:57:27',0,'C','2015-12-31 12:57:27',1),(6,'Angela Muliawan (SC) Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2015-12-31 13:02:10',0,'C','2015-12-31 13:02:10',1),(7,'Brian Alexandro Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 13:02:10',0,'C','2015-12-31 13:02:10',1),(8,'Brian Alexandro Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 13:02:10',0,'C','2015-12-31 13:02:10',1),(10,'Brian Alexandro Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(11,'Brian Alexandro Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(12,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',1,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(13,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',1,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(14,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',1,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(17,'ResepDuniaAdmin1 (Cr) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:17:47',0,'C','2015-12-31 13:17:47',2),(18,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:24:05',0,'C','2015-12-31 13:24:05',2),(19,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:24:05',0,'C','2015-12-31 13:24:05',2),(21,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:24:39',0,'C','2015-12-31 13:24:39',2),(22,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:26:35',0,'C','2015-12-31 13:26:35',2),(23,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(24,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(26,'Angela Muliawan (SC) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(27,'Angela Muliawan (SC) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(28,'Angela Muliawan (SC) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(29,'Angela Muliawan (SC) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(33,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:39:52',0,'C','2015-12-31 13:39:52',3),(34,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:39:52',0,'C','2015-12-31 13:39:52',3),(36,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:00',0,'C','2015-12-31 13:40:00',3),(37,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:00',0,'C','2015-12-31 13:40:00',3),(39,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:17',0,'C','2015-12-31 13:40:17',3),(40,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:17',0,'C','2015-12-31 13:40:17',3),(42,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:18',0,'C','2015-12-31 13:40:18',3),(43,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:18',0,'C','2015-12-31 13:40:18',3),(45,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(46,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(48,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(49,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(50,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(51,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(55,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(56,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(58,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(59,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(60,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(61,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(65,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(66,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(68,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(69,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(70,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(71,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(75,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:44:23',0,'C','2015-12-31 13:44:23',3),(76,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:44:23',0,'C','2015-12-31 13:44:23',3),(78,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:44:23',0,'C','2015-12-31 13:44:23',3),(79,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:44:56',0,'C','2015-12-31 13:44:56',3),(80,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:44:56',0,'C','2015-12-31 13:44:56',3),(82,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:44:56',0,'C','2015-12-31 13:44:56',3),(83,'Angela Muliawan (SC) CANTIK Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:47:32',0,'C','2015-12-31 13:47:32',3),(84,'Brian Alexandro CANTIK Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:47:32',0,'C','2015-12-31 13:47:32',3),(86,'Brian Alexandro GANTENG Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:47:32',0,'C','2015-12-31 13:47:32',3),(87,'Angela Muliawan (SC) CR Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:50:24',0,'C','2015-12-31 13:50:24',3),(88,'Brian Alexandro CM Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:50:24',0,'C','2015-12-31 13:50:24',3),(89,'ResepDuniaAdmin1 (Cr) BB Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:52:24',0,'C','2015-12-31 13:52:24',1),(90,'ResepDuniaAdmin1 (Cr) BB Recipe Enak Yuhu','recipe/detail/4',3,'2015-12-31 13:52:24',0,'C','2015-12-31 13:52:24',1),(92,'ResepDuniaAdmin1 (Cr) Mengomentari cumi kusut AFTER UPDATEEEEE','recipe/detail/12',3,'2015-12-31 14:37:20',0,'C','2015-12-31 14:37:20',2),(93,'Angela Muliawan (SC) Ikut Mengomentari cumi kusut AFTER UPDATEEEEE','recipe/detail/12',1,'2015-12-31 14:37:20',0,'C','2015-12-31 14:37:20',2),(94,'Angela Muliawan (SC) Mengomentari cumi kusut AFTER UPDATEEEEE','recipe/detail/12',3,'2015-12-31 14:49:03',0,'C','2015-12-31 14:49:03',1),(95,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari cumi kusut AFTER UPDATEEEEE','recipe/detail/12',2,'2015-12-31 14:49:03',0,'C','2015-12-31 14:49:03',1),(96,'ResepDuniaAdmin1 (Cr) Menyimpan nasi apa aja deh','recipe/detail/11',3,'2015-12-31 15:23:28',0,'C','2015-12-31 15:23:28',1),(97,'ResepDuniaAdmin1 (Cr) Memasak nasi apa aja deh','recipe/detail/11',3,'2015-12-31 15:25:20',0,'C','2015-12-31 15:25:20',1),(98,'Angela Muliawan (SC) Memasak Nasi Goreng Spesial Cookindo','recipe/detail/14',1,'2015-12-31 22:55:09',0,'C','2015-12-31 22:55:09',2),(99,'Angela Muliawan (SC) Memasak cumi asin','recipe/detail/13',3,'2015-12-31 22:55:36',0,'C','2015-12-31 22:55:36',2),(100,'Angela Muliawan (SC) Memasak Ayam Merah','recipe/detail/5',1,'2015-12-31 22:58:41',0,'C','2015-12-31 22:58:41',2),(101,'Angela Muliawan (SC) Memasak Bakmi Ayam','recipe/detail/3',3,'2015-12-31 23:00:53',0,'C','2015-12-31 23:00:53',2),(102,'Angela Muliawan (SC) Memasak cumi asin','recipe/detail/13',3,'2015-12-31 23:05:53',1,'U','2016-01-01 11:47:18',3),(103,'Angela Muliawan (SC) Menyimpan cumi asin','recipe/detail/13',3,'2015-12-31 23:06:43',1,'U','2016-01-01 11:08:18',3),(104,'Angela Muliawan (SC) Menyimpan Nasi Goreng Spesial Cookindo','recipe/detail/14',1,'2015-12-31 23:06:53',0,'C','2015-12-31 23:06:53',2),(105,'Angela Muliawan (SC) Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 23:07:49',1,'U','2016-01-01 10:03:12',3),(106,'Angela Muliawan (SC) Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',1,'2015-12-31 23:07:49',0,'C','2015-12-31 23:07:49',2),(108,'Angela Muliawan (SC) Mengomentari Nasi  Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2016-01-01 10:22:41',0,'C','2016-01-01 10:22:41',3),(109,'ResepDuniaAdmin1 (Cr) Mengomentari Nasi  Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2016-01-01 10:22:41',0,'C','2016-01-01 10:22:41',3),(111,'Brian Alexandro Ikut Mengomentari Nasi  Goreng Spesial Ayam Kampung','recipe/detail/1',1,'2016-01-01 10:22:41',0,'C','2016-01-01 10:22:41',3),(112,'Brian Alexandro Ikut Mengomentari Nasi  Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2016-01-01 10:22:48',0,'C','2016-01-01 10:22:48',3),(113,'Brian Alexandro Memasak Nasi Goreng Udang Spesial','recipe/detail/2',2,'2016-01-01 10:25:29',0,'C','2016-01-01 10:25:29',3),(114,'Brian Alexandro Memasak Recipe Enak Yuhu','recipe/detail/4',1,'2016-01-01 10:25:55',0,'C','2016-01-01 10:25:55',3);

/*Table structure for table `pageviewlog` */

DROP TABLE IF EXISTS `pageviewlog`;

CREATE TABLE `pageviewlog` (
  `PageViewLogID` int(11) NOT NULL AUTO_INCREMENT,
  `PageURL` varchar(100) DEFAULT NULL,
  `Browser` varchar(100) DEFAULT NULL,
  `BrowserVersion` varchar(100) DEFAULT NULL,
  `IPAddress` varchar(100) DEFAULT NULL,
  `AccessDate` datetime DEFAULT NULL,
  `Device` varchar(100) DEFAULT NULL,
  `OS` varchar(40) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`PageViewLogID`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

/*Data for the table `pageviewlog` */

insert  into `pageviewlog`(`PageViewLogID`,`PageURL`,`Browser`,`BrowserVersion`,`IPAddress`,`AccessDate`,`Device`,`OS`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'/rd/detail/13/cumi-asin','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:06:09','Desktop','windows','C','2016-01-01 11:06:09',0),(2,'/rd/detail/13/cumi-asin','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:07:37','Desktop','windows','C','2016-01-01 11:07:37',0),(3,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:07:51','Desktop','windows','C','2016-01-01 11:07:51',0),(4,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:07:54','Desktop','windows','C','2016-01-01 11:07:54',0),(5,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:00','Desktop','windows','C','2016-01-01 11:08:00',0),(6,'/rd/users/register','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:03','Desktop','windows','C','2016-01-01 11:08:03',0),(7,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:07','Desktop','windows','C','2016-01-01 11:08:07',0),(8,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:09','Desktop','windows','C','2016-01-01 11:08:09',3),(9,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:11','Desktop','windows','C','2016-01-01 11:08:11',3),(10,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:13','Desktop','windows','C','2016-01-01 11:08:13',3),(11,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:14','Desktop','windows','C','2016-01-01 11:08:14',3),(12,'/rd/users/read_notification/103','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:18','Desktop','windows','C','2016-01-01 11:08:18',3),(13,'/rd/recipe/detail/13','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:19','Desktop','windows','C','2016-01-01 11:08:19',3),(14,'/rd/detail/13/cumi-asin','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:20','Desktop','windows','C','2016-01-01 11:08:20',3),(15,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:29','Desktop','windows','C','2016-01-01 11:08:29',3),(16,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:30','Desktop','windows','C','2016-01-01 11:08:30',3),(17,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:31','Desktop','windows','C','2016-01-01 11:08:31',3),(18,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:42','Desktop','windows','C','2016-01-01 11:09:42',3),(19,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:43','Desktop','windows','C','2016-01-01 11:09:43',3),(20,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:44','Desktop','windows','C','2016-01-01 11:09:44',3),(21,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:45','Desktop','windows','C','2016-01-01 11:09:45',3),(22,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:52','Desktop','windows','C','2016-01-01 11:09:52',3),(23,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:53','Desktop','windows','C','2016-01-01 11:09:53',3),(24,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:55','Desktop','windows','C','2016-01-01 11:09:55',3),(25,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:56','Desktop','windows','C','2016-01-01 11:09:56',3),(26,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:57','Desktop','windows','C','2016-01-01 11:09:57',3),(27,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:11:30','Desktop','windows','C','2016-01-01 11:11:30',3),(28,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:11:59','Desktop','windows','C','2016-01-01 11:11:59',3),(29,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:12:03','Desktop','windows','C','2016-01-01 11:12:03',3),(30,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:13:01','Desktop','windows','C','2016-01-01 11:13:01',3),(31,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:14:09','Desktop','windows','C','2016-01-01 11:14:09',3),(32,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:14:51','Desktop','windows','C','2016-01-01 11:14:51',3),(33,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:19:56','Desktop','windows','C','2016-01-01 11:19:56',3),(34,'/rd/recipe/view_recook_item/2','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:20:02','Desktop','windows','C','2016-01-01 11:20:02',3),(35,'/rd/recipe/view_recook_item/1','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:20:10','Desktop','windows','C','2016-01-01 11:20:10',3),(36,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:20:18','Desktop','windows','C','2016-01-01 11:20:18',3),(37,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:27','Desktop','windows','C','2016-01-01 11:23:27',3),(38,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:29','Desktop','windows','C','2016-01-01 11:23:29',3),(39,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:34','Desktop','windows','C','2016-01-01 11:23:34',3),(40,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:48','Desktop','windows','C','2016-01-01 11:23:48',3),(41,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:50','Desktop','windows','C','2016-01-01 11:23:50',3),(42,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:11','Desktop','windows','C','2016-01-01 11:24:11',3),(43,'/rd/detail/4/recipe-enak-yuhu','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:16','Desktop','windows','C','2016-01-01 11:24:16',3),(44,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:18','Desktop','windows','C','2016-01-01 11:24:18',3),(45,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:26','Desktop','windows','C','2016-01-01 11:24:26',3),(46,'/rd/recipe/delete_recook_comment/24','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:35','Desktop','windows','C','2016-01-01 11:24:35',3),(47,'/rd/detail/4/recipe-enak-yuhu','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:25:07','Desktop','windows','C','2016-01-01 11:25:07',3),(48,'/rd/detail/4/recipe-enak-yuhu','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:25:33','Desktop','windows','C','2016-01-01 11:25:33',3),(49,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:25:56','Desktop','windows','C','2016-01-01 11:25:56',3),(50,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:29:25','Desktop','windows','C','2016-01-01 11:29:25',3),(51,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:29:43','Desktop','windows','C','2016-01-01 11:29:43',3),(52,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:29:51','Desktop','windows','C','2016-01-01 11:29:51',3),(53,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:30:06','Desktop','windows','C','2016-01-01 11:30:06',3),(54,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:30:26','Desktop','windows','C','2016-01-01 11:30:26',3),(55,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:31:40','Desktop','windows','C','2016-01-01 11:31:40',3),(56,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:31:53','Desktop','windows','C','2016-01-01 11:31:53',3),(57,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:05','Desktop','windows','C','2016-01-01 11:32:05',3),(58,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:35','Desktop','windows','C','2016-01-01 11:32:35',3),(59,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:56','Desktop','windows','C','2016-01-01 11:32:56',3),(60,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:33:06','Desktop','windows','C','2016-01-01 11:33:06',3),(61,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:33:19','Desktop','windows','C','2016-01-01 11:33:19',3),(62,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:34:27','Desktop','windows','C','2016-01-01 11:34:27',3),(63,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:35:14','Desktop','windows','C','2016-01-01 11:35:14',3),(64,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:36:23','Desktop','windows','C','2016-01-01 11:36:23',3),(65,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:36:58','Desktop','windows','C','2016-01-01 11:36:58',3),(66,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:26','Desktop','windows','C','2016-01-01 11:37:26',3),(67,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:35','Desktop','windows','C','2016-01-01 11:37:35',3),(68,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:48','Desktop','windows','C','2016-01-01 11:37:48',3),(69,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:12','Desktop','windows','C','2016-01-01 11:38:12',3),(70,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:27','Desktop','windows','C','2016-01-01 11:38:27',3),(71,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:34','Desktop','windows','C','2016-01-01 11:38:34',3),(72,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:45','Desktop','windows','C','2016-01-01 11:38:45',3),(73,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:55','Desktop','windows','C','2016-01-01 11:38:55',3),(74,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:05','Desktop','windows','C','2016-01-01 11:39:05',3),(75,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:10','Desktop','windows','C','2016-01-01 11:39:10',3),(76,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:17','Desktop','windows','C','2016-01-01 11:39:17',3),(77,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:40:40','Desktop','windows','C','2016-01-01 11:40:40',3),(78,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:40:55','Desktop','windows','C','2016-01-01 11:40:55',3),(79,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:21','Desktop','windows','C','2016-01-01 11:41:21',3),(80,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:34','Desktop','windows','C','2016-01-01 11:41:34',3),(81,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:56','Desktop','windows','C','2016-01-01 11:41:56',3),(82,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:42:51','Desktop','windows','C','2016-01-01 11:42:51',3),(83,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:43:15','Desktop','windows','C','2016-01-01 11:43:15',3),(84,'/rd/detail/12/cumi-kusut-after-updateeeee','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:43:23','Desktop','windows','C','2016-01-01 11:43:23',3),(85,'/rd/detail/12/cumi-kusut-after-updateeeee','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:07','Desktop','windows','C','2016-01-01 11:44:07',3),(86,'/rd/detail/12/cumi-kusut-after-updateeeee','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:38','Desktop','windows','C','2016-01-01 11:44:38',3),(87,'/rd/recipe/recipe_comment/12','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:46','Desktop','windows','C','2016-01-01 11:44:46',3),(88,'/rd/recipe/recipe_comment/12','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:55','Desktop','windows','C','2016-01-01 11:44:55',3),(89,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:45:02','Desktop','windows','C','2016-01-01 11:45:02',3),(90,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:45:20','Desktop','windows','C','2016-01-01 11:45:20',3),(91,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:45:46','Desktop','windows','C','2016-01-01 11:45:46',3),(92,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:45:57','Desktop','windows','C','2016-01-01 11:45:57',3),(93,'/rd/recipe/view_recook_item/9','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:02','Desktop','windows','C','2016-01-01 11:46:02',3),(94,'/rd/recipe/view_recook_item/1','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:06','Desktop','windows','C','2016-01-01 11:46:06',3),(95,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:26','Desktop','windows','C','2016-01-01 11:46:26',3),(96,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:46','Desktop','windows','C','2016-01-01 11:46:46',3),(97,'/rd/detail/1/nasi--goreng-spesial-ayam-kampung','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:54','Desktop','windows','C','2016-01-01 11:46:54',3),(98,'/rd/recipe/my_contest','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:05','Desktop','windows','C','2016-01-01 11:47:05',3),(99,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:12','Desktop','windows','C','2016-01-01 11:47:12',3),(100,'/rd/users/read_notification/102','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:18','Desktop','windows','C','2016-01-01 11:47:18',3),(101,'/rd/recipe/detail/13','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:19','Desktop','windows','C','2016-01-01 11:47:19',3),(102,'/rd/detail/13/cumi-asin','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:20','Desktop','windows','C','2016-01-01 11:47:20',3),(103,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:35','Desktop','windows','C','2016-01-01 11:47:35',3),(104,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:57:54','Desktop','windows','C','2016-01-01 11:57:54',3),(105,'/rd/recipe/edit/15','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:57:57','Desktop','windows','C','2016-01-01 11:57:57',3),(106,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:57:58','Desktop','windows','C','2016-01-01 11:57:58',3),(107,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:57:59','Desktop','windows','C','2016-01-01 11:57:59',3),(108,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:58:00','Desktop','windows','C','2016-01-01 11:58:00',3);

/*Table structure for table `pricerange` */

DROP TABLE IF EXISTS `pricerange`;

CREATE TABLE `pricerange` (
  `PriceRangeID` int(11) NOT NULL AUTO_INCREMENT,
  `RangeStart` varchar(100) DEFAULT NULL,
  `RangeEnd` varchar(100) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`PriceRangeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `pricerange` */

insert  into `pricerange`(`PriceRangeID`,`RangeStart`,`RangeEnd`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'<','25,000','C','2015-12-03 11:02:31',1),(2,'25,000','75,000','C','2015-12-03 11:02:31',1),(3,'75,000','150,000','C','2015-12-03 11:02:31',1),(4,'150,000','>','C','2015-12-03 11:02:31',1);

/*Table structure for table `recipe` */

DROP TABLE IF EXISTS `recipe`;

CREATE TABLE `recipe` (
  `RecipeID` int(11) NOT NULL AUTO_INCREMENT,
  `RecipeName` varchar(100) DEFAULT NULL,
  `RecipeIntro` varchar(500) DEFAULT NULL,
  `Slug` varchar(100) DEFAULT NULL,
  `FoodTypeID` int(11) DEFAULT NULL,
  `PriceRangeID` int(11) DEFAULT NULL,
  `EstPeopleID` int(11) DEFAULT NULL,
  `FoodProcessID` int(11) DEFAULT NULL,
  `TimeEst` int(11) DEFAULT NULL,
  `PrimaryPhoto` varchar(100) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `ContestID` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`RecipeID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `recipe` */

insert  into `recipe`(`RecipeID`,`RecipeName`,`RecipeIntro`,`Slug`,`FoodTypeID`,`PriceRangeID`,`EstPeopleID`,`FoodProcessID`,`TimeEst`,`PrimaryPhoto`,`CreatedDate`,`UserID`,`ContestID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Nasi  Goreng Spesial Ayam Kampung','Ini data pertama angel ya','nasi--goreng-spesial-ayam-kampung',2,2,2,1,30,'nasigorengayam.jpg','2015-12-03 00:00:00',2,NULL,'C','2015-12-03 11:09:40',2),(2,'Nasi Goreng Udang Spesial','Enak banget buat sarapan nih','nasi-goreng-udang-spesial',2,2,2,1,30,'nasigorengudang.jpg','2015-12-04 00:00:00',2,NULL,'C','2015-12-03 11:10:33',2),(3,'Bakmi Ayam','Enak banget loh','bakmi-ayam',6,1,1,5,15,'3-bakmiayam.jpg','2015-11-04 00:00:00',3,NULL,'C','2015-12-03 23:06:14',3),(4,'Recipe Enak Yuhu','Buatan angel gagal mulu ye','recipe-enak-yuhu',1,1,1,1,100,'Angela.jpg','2015-12-15 00:00:00',1,NULL,'C','2015-12-15 21:36:56',1),(5,'Ayam Merah','kesukaan aku dong yeyeye','ayam-merah',6,2,2,5,120,'20151221_16_00_54_7.jpg','2015-12-21 00:00:00',1,NULL,'C','2015-12-21 22:00:54',1),(6,'sample','sample','sample',1,1,1,1,12,'20151230_22_02_56_61.jpg','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 22:05:00',3),(7,'nasi nasi an','sample cerita','nasi-nasi-an',1,1,1,1,15,'20151230_22_25_58_91.png','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 22:25:58',3),(8,'nasi nasi an popo','sample cerita','nasi-nasi-an-popo',1,1,1,1,15,'20151230_22_25_58_91.png','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 22:30:07',3),(9,'nasi nasi an popo','sample cerita','nasi-nasi-an-popo',1,1,1,1,15,'20151230_22_25_58_91.png','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 22:30:34',3),(10,'nasi nasi an popo','sample cerita','nasi-nasi-an-popo',1,1,1,1,15,'20151230_22_25_58_91.png','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 22:31:13',3),(11,'nasi apa aja deh','cerita apa aja deh','nasi-apa-aja-deh',1,1,1,1,80,'20151230_22_45_06_17.jpg','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 22:45:21',3),(12,'cumi kusut AFTER UPDATEEEEE','intro AFTER UPDATEEEEE','cumi-kusut-after-updateeeee',7,2,3,4,55,'20151230_23_33_10_14.jpg','2015-12-30 00:00:00',3,NULL,'U','2015-12-30 23:59:50',3),(13,'cumi asin','intro','cumi-asin',5,3,2,4,45,'20151230_23_33_10_14.jpg','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 23:42:30',3),(14,'Nasi Goreng Spesial Cookindo','Hai cookinders, kali ini aku mau share masakan rumahan yang paling gampang dibuat tetapi enaknya ga bohong. Resep ini warisan dari mamaku loh.','nasi-goreng-spesial-cookindo',2,1,2,1,-1,'20151231_15_41_57_13.jpg','2015-12-31 21:41:57',1,NULL,'U','2015-12-31 22:28:57',1),(15,'nasi cumi cabe kusut','nasi cumi cabe kusut',NULL,4,1,1,3,90,'20160101_11_09_42_90.jpg','2016-01-01 11:09:52',3,NULL,'C','2016-01-01 11:09:52',3);

/*Table structure for table `recook` */

DROP TABLE IF EXISTS `recook`;

CREATE TABLE `recook` (
  `RecookID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `RecipeID` int(11) DEFAULT NULL,
  `RecookDesc` varchar(500) DEFAULT NULL,
  `RecookPhoto` varchar(100) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  `RecookDate` datetime DEFAULT NULL,
  PRIMARY KEY (`RecookID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `recook` */

insert  into `recook`(`RecookID`,`UserID`,`RecipeID`,`RecookDesc`,`RecookPhoto`,`AuditedActivity`,`AuditedTime`,`AuditedUser`,`RecookDate`) values (1,3,1,'Resepnya simpel, enak dan semua suka :D ','recook1.jpg','C','2015-12-03 11:24:03',3,'2015-12-17 14:52:39'),(2,3,12,'Recook makanan sendiri ahhh','20151231_00_00_20_38.png','C','2015-12-31 00:00:26',3,'2015-12-31 00:00:26'),(3,1,11,'ahey','20151231_09_25_15_36.jpg','C','2015-12-31 15:25:20',1,'2015-12-31 15:25:20'),(4,2,14,'Aku tambahin garam 5 BUNGKUS ASIN BANGET GA PENGEN CEPET NIKAH KOK','20151231_16_54_47_47.jpg','C','2015-12-31 22:55:09',2,'2015-12-31 22:55:09'),(8,2,13,'cumi goreng','20151231_17_05_45_11.jpg','C','2015-12-31 23:05:53',2,'2015-12-31 23:05:53'),(9,3,2,'recook nasgor yeah','20160101_10_25_23_79.jpg','C','2016-01-01 10:25:29',3,'2016-01-01 10:25:29'),(10,3,4,'yuhu','20160101_10_25_53_28.jpg','C','2016-01-01 10:25:55',3,'2016-01-01 10:25:55');

/*Table structure for table `recookcomment` */

DROP TABLE IF EXISTS `recookcomment`;

CREATE TABLE `recookcomment` (
  `RecookCommentID` int(11) NOT NULL AUTO_INCREMENT,
  `RecookCommentDesc` varchar(200) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `RecookID` int(11) DEFAULT NULL,
  `CommentTime` datetime DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`RecookCommentID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `recookcomment` */

insert  into `recookcomment`(`RecookCommentID`,`RecookCommentDesc`,`UserID`,`RecookID`,`CommentTime`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Enak ga ya',2,1,'2015-12-17 11:04:08','C','2015-12-17 11:04:27',1),(2,'ga enak',3,1,'2015-12-17 11:04:50','C','2015-12-17 11:04:29',1),(3,'Ke 1',1,2,'2015-12-31 14:05:08','C','2015-12-31 14:05:08',1),(4,'Ke 1',1,2,'2015-12-31 14:06:05','C','2015-12-31 14:06:05',1),(5,'Ke 1',1,2,'2015-12-31 14:06:07','C','2015-12-31 14:06:07',1),(6,'Ke 1',1,2,'2015-12-31 14:06:39','C','2015-12-31 14:06:39',1),(7,'Ke 1',1,2,'2015-12-31 14:07:00','C','2015-12-31 14:07:00',1),(8,'Ke 1',1,2,'2015-12-31 14:07:01','C','2015-12-31 14:07:01',1),(9,'Ke 1',1,2,'2015-12-31 14:07:49','C','2015-12-31 14:07:49',1),(10,'Ke 1',1,2,'2015-12-31 14:08:55','C','2015-12-31 14:08:55',1),(11,'Ke 1',1,2,'2015-12-31 14:09:26','C','2015-12-31 14:09:26',1),(12,'Ke 1',1,2,'2015-12-31 14:11:06','C','2015-12-31 14:11:06',1),(13,'Ke 1',1,2,'2015-12-31 14:11:36','C','2015-12-31 14:11:36',1),(14,'Ke 1',1,2,'2015-12-31 14:13:04','C','2015-12-31 14:13:04',1),(15,'Ke 1',1,2,'2015-12-31 14:19:54','C','2015-12-31 14:19:54',1),(16,'Ke 1',2,2,'2015-12-31 14:37:20','C','2015-12-31 14:37:20',2),(17,'mati lu',1,2,'2015-12-31 14:49:03','C','2015-12-31 14:49:03',1),(20,'okay gan',3,1,'2016-01-01 10:22:48','C','2016-01-01 10:22:48',3),(21,'tes komen',3,9,'2016-01-01 10:45:28','C','2016-01-01 10:45:28',3),(22,'sample komen',3,9,'2016-01-01 10:45:32','C','2016-01-01 10:45:32',3),(23,'okay',3,9,'2016-01-01 10:50:46','C','2016-01-01 10:50:46',3),(24,'sample',3,10,'2016-01-01 11:24:26','D','2016-01-01 11:24:35',3);

/*Table structure for table `searchlog` */

DROP TABLE IF EXISTS `searchlog`;

CREATE TABLE `searchlog` (
  `SearchLogID` int(11) NOT NULL AUTO_INCREMENT,
  `Browser` varchar(100) DEFAULT NULL,
  `BrowserVersion` varchar(100) DEFAULT NULL,
  `IPAddress` varchar(100) DEFAULT NULL,
  `AccessDate` datetime DEFAULT NULL,
  `Device` varchar(100) DEFAULT NULL,
  `OS` varchar(40) DEFAULT NULL,
  `PCuisineID` varchar(200) DEFAULT NULL,
  `PFoodTypeID` varchar(200) DEFAULT NULL,
  `PKeyword` varchar(200) DEFAULT NULL,
  `PComposition` varchar(200) DEFAULT NULL,
  `PFoodProcess` varchar(200) DEFAULT NULL,
  `PPriceRange` varchar(200) DEFAULT NULL,
  `PEstPeople` varchar(200) DEFAULT NULL,
  `PUserID` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`SearchLogID`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

/*Data for the table `searchlog` */

insert  into `searchlog`(`SearchLogID`,`Browser`,`BrowserVersion`,`IPAddress`,`AccessDate`,`Device`,`OS`,`PCuisineID`,`PFoodTypeID`,`PKeyword`,`PComposition`,`PFoodProcess`,`PPriceRange`,`PEstPeople`,`PUserID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Chrome',NULL,'10.2.200.900','2015-12-28 14:13:15','HP',NULL,'1','1','Nasi Goreng','1','1','4','3',1,'C','2015-12-28 14:13:15',1),(2,'Google Chrome','Google Chrome','192.168.43.249','2015-12-31 00:46:21','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'C','2015-12-31 00:46:21',3),(3,'Google Chrome','Google Chrome','192.168.43.249','2015-12-31 00:46:38','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2015-12-31 00:46:38',3),(4,'Google Chrome','Google Chrome','192.168.43.249','2015-12-31 00:47:08','Desktop','windows','2','1,2','',NULL,NULL,NULL,NULL,3,'C','2015-12-31 00:47:08',3),(5,'Google Chrome','Google Chrome','192.168.43.249','2015-12-31 00:47:43','Desktop','windows','2','1,2','',NULL,NULL,NULL,NULL,3,'C','2015-12-31 00:47:43',3),(6,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:45:52','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2015-12-31 08:45:52',0),(7,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:45:58','Desktop','windows',NULL,NULL,'lah',NULL,NULL,NULL,NULL,0,'C','2015-12-31 08:45:58',0),(8,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:46:05','Desktop','windows',NULL,NULL,'','1',NULL,NULL,NULL,0,'C','2015-12-31 08:46:05',0),(9,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:46:18','Desktop','windows',NULL,NULL,'','5',NULL,NULL,NULL,0,'C','2015-12-31 08:46:18',0),(10,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:23:40','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2015-12-31 12:23:40',0),(11,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:24:14','Desktop','windows',NULL,NULL,'','1,Ayam itik',NULL,NULL,NULL,0,'C','2015-12-31 12:24:14',0),(12,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:25:42','Desktop','windows',NULL,NULL,'','1,Ayam itik',NULL,NULL,NULL,1,'C','2015-12-31 12:25:42',1),(13,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:16:31','Desktop','windows',NULL,NULL,'resep enak',NULL,NULL,NULL,NULL,1,'C','2015-12-31 13:16:31',1),(14,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:16:36','Desktop','windows',NULL,NULL,'yuhu',NULL,NULL,NULL,NULL,1,'C','2015-12-31 13:16:36',1),(15,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:36','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 14:00:36',1),(16,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:44','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 14:00:44',1),(17,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:37:09','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 15:37:09',1),(18,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:15','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 16:18:15',1),(19,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:27','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 16:18:27',1),(20,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:42','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 16:18:42',1),(21,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:31:45','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'C','2015-12-31 21:31:45',0),(22,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:32:10','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'C','2015-12-31 21:32:10',1),(23,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:18:59','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 22:18:59',1),(24,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:47:49','Desktop','windows',NULL,NULL,'kodok',NULL,NULL,NULL,NULL,1,'C','2015-12-31 22:47:49',1),(25,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:48:15','Desktop','windows',NULL,NULL,'','kodok,kura,ayam',NULL,NULL,NULL,1,'C','2015-12-31 22:48:15',1),(26,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:48:41','Desktop','windows',NULL,NULL,'','kodok,kura,14',NULL,NULL,NULL,1,'C','2015-12-31 22:48:41',1),(27,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:49:12','Desktop','windows',NULL,NULL,'ayam merah','kodok,kura,14',NULL,NULL,NULL,1,'C','2015-12-31 22:49:12',1),(28,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:49:21','Desktop','windows',NULL,NULL,'ayam merah',NULL,NULL,NULL,NULL,1,'C','2015-12-31 22:49:21',1),(29,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:51:11','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,0,'C','2015-12-31 22:51:11',0),(30,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:52:15','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 22:52:15',2),(31,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:54:40','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 22:54:40',2),(32,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:55:09','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 22:55:09',2),(33,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:55:36','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 22:55:36',2),(34,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:58:41','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 22:58:41',2),(35,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:00:18','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:00:18',2),(36,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:00:53','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:00:53',2),(37,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:05:19','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:05:19',2),(38,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:05:24','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:05:24',2),(39,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:05:53','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:05:53',2),(40,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:21:27','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:21:27',2),(41,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:26:00','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:26:00',2),(42,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:26:10','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:26:10',2),(43,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:26:16','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:26:16',2),(44,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:26:23','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:26:23',2),(45,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:14:36','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:14:36',0),(46,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:15:22','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:15:22',0),(47,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:15:39','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:15:39',0),(48,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:15:43','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:15:43',0),(49,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:23:15','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:23:15',0),(50,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:24:04','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:24:04',0),(51,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:25:04','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:25:04',0),(52,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:25:18','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:25:18',0),(53,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:29:21','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:29:21',0),(54,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:30:18','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:30:18',0),(55,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:41:26','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:41:26',0),(56,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:52:26','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:52:26',0),(57,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:53:13','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:53:13',0),(58,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:54:49','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:54:49',0),(59,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:56:33','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:56:33',0),(60,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:00:44','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:00:44',0),(61,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:03:38','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:03:38',3),(62,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:10:14','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:10:14',3),(63,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:15:51','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:15:51',0),(64,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:19:51','Desktop','windows',NULL,'2,4','',NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:19:51',0),(65,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:23:02','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:23:02',3),(66,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:24:31','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:24:31',3),(67,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:00','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:25:00',3),(68,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:30','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:25:30',3),(69,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:40','Desktop','windows',NULL,NULL,'','1',NULL,NULL,NULL,3,'C','2016-01-01 10:25:40',3),(70,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:56','Desktop','windows',NULL,NULL,'','1',NULL,NULL,NULL,3,'C','2016-01-01 10:25:56',3),(71,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:26:07','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:26:07',3),(72,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:47','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:42:47',3),(73,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:57','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:42:57',0),(74,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:44:29','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:44:29',0),(75,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:45:39','Desktop','windows',NULL,NULL,'udang',NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:45:39',0),(76,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:50:55','Desktop','windows',NULL,NULL,'udang',NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:50:55',0),(77,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:29:51','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:29:51',3),(78,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:30:06','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:30:06',3),(79,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:30:26','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:30:26',3),(80,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:31:40','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:31:40',3),(81,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:31:53','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:31:53',3),(82,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:05','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:32:05',3),(83,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:35','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:32:35',3),(84,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:56','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:32:56',3),(85,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:33:06','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:33:06',3),(86,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:33:19','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:33:19',3),(87,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:34:28','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:34:28',3),(88,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:35:14','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:35:14',3),(89,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:36:23','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:36:23',3),(90,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:36:59','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:36:59',3),(91,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:26','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:37:26',3),(92,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:35','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:37:35',3),(93,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:48','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:37:48',3),(94,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:12','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:38:12',3),(95,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:27','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:38:27',3),(96,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:34','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:38:34',3),(97,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:45','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:38:45',3),(98,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:55','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:38:55',3),(99,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:05','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:39:05',3),(100,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:10','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:39:10',3),(101,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:17','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:39:17',3),(102,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:40:40','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:40:40',3),(103,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:34','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:41:34',3),(104,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:56','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:41:56',3);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `UserEmail` varchar(100) DEFAULT NULL,
  `CompanyName` varchar(100) DEFAULT NULL,
  `UserPassword` varchar(200) DEFAULT NULL,
  `UserRole` int(11) DEFAULT NULL,
  `UserPhoto` varchar(100) DEFAULT NULL,
  `CityName` varchar(100) DEFAULT NULL,
  `CountryName` varchar(100) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  `UserLevelID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`UserID`,`UserName`,`UserEmail`,`CompanyName`,`UserPassword`,`UserRole`,`UserPhoto`,`CityName`,`CountryName`,`AuditedActivity`,`AuditedTime`,`AuditedUser`,`UserLevelID`) values (1,'ResepDuniaAdmin1','resepdunia@resepdunia.com',NULL,'d033e22ae348aeb5660fc2140aec35850c4da997',1,'20151231_16_43_50_18.png','Jakarta','Indonesia','U','2015-12-31 22:43:52',1,1),(2,'Angela Muliawan','amuliawan93@gmail.com',NULL,'d033e22ae348aeb5660fc2140aec35850c4da997',0,NULL,'Jakarta','Indonesia','C','2015-12-03 11:42:44',1,3),(3,'Brian Alexandro','alexandrobrian15@gmail.com',NULL,'d033e22ae348aeb5660fc2140aec35850c4da997',0,NULL,'Jakarta','Indonesia','C','2015-12-03 11:43:11',1,NULL),(4,'Blueband','blueband@unilever.com','PT Unilevel Indonesia','d033e22ae348aeb5660fc2140aec35850c4da997',2,'3-blueband.jpg','Jakarta','Indonesia','C','2015-12-03 11:43:58',1,NULL),(5,'Angela Muliawan','amuliawan93@gmailll.com',NULL,'asd',0,NULL,NULL,NULL,'C','2015-12-31 14:57:32',NULL,NULL);

/*Table structure for table `userlog` */

DROP TABLE IF EXISTS `userlog`;

CREATE TABLE `userlog` (
  `UserLogID` int(11) NOT NULL AUTO_INCREMENT,
  `Browser` varchar(100) DEFAULT NULL,
  `BrowserVersion` varchar(100) DEFAULT NULL,
  `IPAddress` varchar(100) DEFAULT NULL,
  `AccessDate` datetime DEFAULT NULL,
  `Device` varchar(100) DEFAULT NULL,
  `OS` varchar(40) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserLogID`)
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=latin1;

/*Data for the table `userlog` */

insert  into `userlog`(`UserLogID`,`Browser`,`BrowserVersion`,`IPAddress`,`AccessDate`,`Device`,`OS`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Firefox',NULL,'10.1.20.300','2015-12-18 20:38:55',NULL,NULL,'C','2015-12-18 20:38:55',1),(2,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:45:37','Desktop','windows','C','2015-12-31 08:45:37',0),(3,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:45:51','Desktop','windows','C','2015-12-31 08:45:51',0),(4,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:46:05','Desktop','windows','C','2015-12-31 08:46:05',0),(5,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:46:18','Desktop','windows','C','2015-12-31 08:46:18',0),(6,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:47:09','Desktop','windows','C','2015-12-31 08:47:09',0),(7,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:47:31','Desktop','windows','C','2015-12-31 08:47:31',0),(8,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:23:30','Desktop','windows','C','2015-12-31 12:23:30',0),(9,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:24:14','Desktop','windows','C','2015-12-31 12:24:14',0),(10,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:25:38','Desktop','windows','C','2015-12-31 12:25:38',0),(11,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:27:52','Desktop','windows','C','2015-12-31 12:27:52',1),(12,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:56:44','Desktop','windows','C','2015-12-31 12:56:44',1),(13,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:56:56','Desktop','windows','C','2015-12-31 12:56:56',1),(14,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:57:27','Desktop','windows','C','2015-12-31 12:57:27',1),(15,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:01:25','Desktop','windows','C','2015-12-31 13:01:25',1),(16,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:02:08','Desktop','windows','C','2015-12-31 13:02:08',1),(17,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:02:43','Desktop','windows','C','2015-12-31 13:02:43',1),(18,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:02:55','Desktop','windows','C','2015-12-31 13:02:55',0),(19,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:04:20','Desktop','windows','C','2015-12-31 13:04:20',2),(20,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:04:40','Desktop','windows','C','2015-12-31 13:04:40',2),(21,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:05:00','Desktop','windows','C','2015-12-31 13:05:00',2),(22,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:05:36','Desktop','windows','C','2015-12-31 13:05:36',2),(23,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:09:16','Desktop','windows','C','2015-12-31 13:09:16',2),(24,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:09:31','Desktop','windows','C','2015-12-31 13:09:31',2),(25,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:14:42','Desktop','windows','C','2015-12-31 13:14:42',1),(26,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:16:30','Desktop','windows','C','2015-12-31 13:16:30',1),(27,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:16:41','Desktop','windows','C','2015-12-31 13:16:41',1),(28,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:26:48','Desktop','windows','C','2015-12-31 13:26:48',1),(29,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:27:20','Desktop','windows','C','2015-12-31 13:27:20',1),(30,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:28:08','Desktop','windows','C','2015-12-31 13:28:08',1),(31,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:24','Desktop','windows','C','2015-12-31 14:00:24',1),(32,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:36','Desktop','windows','C','2015-12-31 14:00:36',1),(33,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:50','Desktop','windows','C','2015-12-31 14:00:50',1),(34,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:33:21','Desktop','windows','C','2015-12-31 14:33:21',1),(35,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:48:54','Desktop','windows','C','2015-12-31 14:48:54',1),(36,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:49:59','Desktop','windows','C','2015-12-31 14:49:59',1),(37,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:14:40','Desktop','windows','C','2015-12-31 15:14:40',0),(38,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:16:10','Desktop','windows','C','2015-12-31 15:16:10',0),(39,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:23:18','Desktop','windows','C','2015-12-31 15:23:18',0),(40,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:25:08','Desktop','windows','C','2015-12-31 15:25:08',1),(41,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:25:20','Desktop','windows','C','2015-12-31 15:25:20',1),(42,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:27:01','Desktop','windows','C','2015-12-31 15:27:01',1),(43,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:28:39','Desktop','windows','C','2015-12-31 15:28:39',1),(44,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:31:00','Desktop','windows','C','2015-12-31 15:31:00',1),(45,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:36:59','Desktop','windows','C','2015-12-31 15:36:59',1),(46,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:15','Desktop','windows','C','2015-12-31 16:18:15',1),(47,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:27','Desktop','windows','C','2015-12-31 16:18:27',1),(48,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:42','Desktop','windows','C','2015-12-31 16:18:42',1),(49,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:26:32','Desktop','windows','C','2015-12-31 21:26:32',0),(50,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:27:45','Desktop','windows','C','2015-12-31 21:27:45',0),(51,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:30:15','Desktop','windows','C','2015-12-31 21:30:15',0),(52,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:31:30','Desktop','windows','C','2015-12-31 21:31:30',0),(53,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:31:45','Desktop','windows','C','2015-12-31 21:31:45',0),(54,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:32:01','Desktop','windows','C','2015-12-31 21:32:01',0),(55,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:32:14','Desktop','windows','C','2015-12-31 21:32:14',1),(56,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:37:44','Desktop','windows','C','2015-12-31 21:37:44',1),(57,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:41:56','Desktop','windows','C','2015-12-31 21:41:56',1),(58,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:44:47','Desktop','windows','C','2015-12-31 21:44:47',1),(59,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:45:08','Desktop','windows','C','2015-12-31 21:45:08',1),(60,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:48:52','Desktop','windows','C','2015-12-31 21:48:52',1),(61,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:49:30','Desktop','windows','C','2015-12-31 21:49:30',1),(62,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:52:37','Desktop','windows','C','2015-12-31 21:52:37',1),(63,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:00:20','Desktop','windows','C','2015-12-31 22:00:20',1),(64,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:04:37','Desktop','windows','C','2015-12-31 22:04:37',1),(65,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:07:48','Desktop','windows','C','2015-12-31 22:07:48',1),(66,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:10:52','Desktop','windows','C','2015-12-31 22:10:52',1),(67,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:18:59','Desktop','windows','C','2015-12-31 22:18:59',1),(68,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:21:10','Desktop','windows','C','2015-12-31 22:21:10',1),(69,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:28:39','Desktop','windows','C','2015-12-31 22:28:39',1),(70,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:28:57','Desktop','windows','C','2015-12-31 22:28:57',1),(71,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:42:33','Desktop','windows','C','2015-12-31 22:42:33',1),(72,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:42:48','Desktop','windows','C','2015-12-31 22:42:48',1),(73,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:43:50','Desktop','windows','C','2015-12-31 22:43:50',1),(74,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:44:44','Desktop','windows','C','2015-12-31 22:44:44',1),(75,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:45:18','Desktop','windows','C','2015-12-31 22:45:18',1),(76,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:45:29','Desktop','windows','C','2015-12-31 22:45:29',1),(77,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:45:29','Desktop','windows','C','2015-12-31 22:45:29',1),(78,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:45:29','Desktop','windows','C','2015-12-31 22:45:29',1),(79,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:46:23','Desktop','windows','C','2015-12-31 22:46:23',1),(80,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:47:41','Desktop','windows','C','2015-12-31 22:47:41',1),(81,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:48:15','Desktop','windows','C','2015-12-31 22:48:15',1),(82,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:48:41','Desktop','windows','C','2015-12-31 22:48:41',1),(83,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:48:58','Desktop','windows','C','2015-12-31 22:48:58',1),(84,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:49:12','Desktop','windows','C','2015-12-31 22:49:12',1),(85,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:49:28','Desktop','windows','C','2015-12-31 22:49:28',1),(86,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:49:42','Desktop','windows','C','2015-12-31 22:49:42',1),(87,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:49:55','Desktop','windows','C','2015-12-31 22:49:55',0),(88,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:50:06','Desktop','windows','C','2015-12-31 22:50:06',0),(89,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:51:11','Desktop','windows','C','2015-12-31 22:51:11',0),(90,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:52:01','Desktop','windows','C','2015-12-31 22:52:01',0),(91,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:52:15','Desktop','windows','C','2015-12-31 22:52:15',0),(92,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:52:49','Desktop','windows','C','2015-12-31 22:52:49',2),(93,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:53:02','Desktop','windows','C','2015-12-31 22:53:02',2),(94,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:53:14','Desktop','windows','C','2015-12-31 22:53:14',2),(95,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:53:25','Desktop','windows','C','2015-12-31 22:53:25',2),(96,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:53:41','Desktop','windows','C','2015-12-31 22:53:41',2),(97,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:54:40','Desktop','windows','C','2015-12-31 22:54:40',2),(98,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:55:09','Desktop','windows','C','2015-12-31 22:55:09',2),(99,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:55:25','Desktop','windows','C','2015-12-31 22:55:25',2),(100,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:55:36','Desktop','windows','C','2015-12-31 22:55:36',2),(101,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:55:51','Desktop','windows','C','2015-12-31 22:55:51',2),(102,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:56:26','Desktop','windows','C','2015-12-31 22:56:26',2),(103,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:58:33','Desktop','windows','C','2015-12-31 22:58:33',2),(104,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:00:18','Desktop','windows','C','2015-12-31 23:00:18',2),(105,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:00:46','Desktop','windows','C','2015-12-31 23:00:46',2),(106,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:05:19','Desktop','windows','C','2015-12-31 23:05:19',2),(107,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:05:43','Desktop','windows','C','2015-12-31 23:05:43',2),(108,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:06:43','Desktop','windows','C','2015-12-31 23:06:43',2),(109,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:07:26','Desktop','windows','C','2015-12-31 23:07:26',2),(110,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:07:49','Desktop','windows','C','2015-12-31 23:07:49',2),(111,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:08:03','Desktop','windows','C','2015-12-31 23:08:03',2),(112,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:09:58','Desktop','windows','C','2015-12-31 23:09:58',2),(113,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:10:08','Desktop','windows','C','2015-12-31 23:10:08',2),(114,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:10:28','Desktop','windows','C','2015-12-31 23:10:28',2),(115,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:10:42','Desktop','windows','C','2015-12-31 23:10:42',2),(116,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:14:33','Desktop','windows','C','2015-12-31 23:14:33',2),(117,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:14:44','Desktop','windows','C','2015-12-31 23:14:44',2),(118,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:15:22','Desktop','windows','C','2015-12-31 23:15:22',2),(119,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:21:27','Desktop','windows','C','2015-12-31 23:21:27',2),(120,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:21:39','Desktop','windows','C','2015-12-31 23:21:39',2),(121,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:22:43','Desktop','windows','C','2015-12-31 23:22:43',2),(122,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:24:01','Desktop','windows','C','2015-12-31 23:24:01',2),(123,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:24:21','Desktop','windows','C','2015-12-31 23:24:21',2),(124,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:25:43','Desktop','windows','C','2015-12-31 23:25:43',2),(125,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:26:00','Desktop','windows','C','2015-12-31 23:26:00',2),(126,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:26:16','Desktop','windows','C','2015-12-31 23:26:16',2),(127,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:02:43','Desktop','windows','C','2016-01-01 09:02:43',0),(128,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:14:36','Desktop','windows','C','2016-01-01 09:14:36',0),(129,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:14:48','Desktop','windows','C','2016-01-01 09:14:48',0),(130,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:15:22','Desktop','windows','C','2016-01-01 09:15:22',0),(131,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:15:39','Desktop','windows','C','2016-01-01 09:15:39',0),(132,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:16:29','Desktop','windows','C','2016-01-01 09:16:29',0),(133,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:17:04','Desktop','windows','C','2016-01-01 09:17:04',0),(134,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:18:05','Desktop','windows','C','2016-01-01 09:18:05',0),(135,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:18:23','Desktop','windows','C','2016-01-01 09:18:23',0),(136,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:18:44','Desktop','windows','C','2016-01-01 09:18:44',0),(137,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:19:07','Desktop','windows','C','2016-01-01 09:19:07',0),(138,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:19:18','Desktop','windows','C','2016-01-01 09:19:18',0),(139,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:21:51','Desktop','windows','C','2016-01-01 09:21:51',0),(140,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:22:26','Desktop','windows','C','2016-01-01 09:22:26',0),(141,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:23:13','Desktop','windows','C','2016-01-01 09:23:13',0),(142,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:24:04','Desktop','windows','C','2016-01-01 09:24:04',0),(143,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:25:04','Desktop','windows','C','2016-01-01 09:25:04',0),(144,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:25:17','Desktop','windows','C','2016-01-01 09:25:17',0),(145,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:29:21','Desktop','windows','C','2016-01-01 09:29:21',0),(146,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:30:17','Desktop','windows','C','2016-01-01 09:30:17',0),(147,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:41:26','Desktop','windows','C','2016-01-01 09:41:26',0),(148,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:42:50','Desktop','windows','C','2016-01-01 09:42:50',0),(149,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:43:41','Desktop','windows','C','2016-01-01 09:43:41',0),(150,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:43:57','Desktop','windows','C','2016-01-01 09:43:57',0),(151,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:44:17','Desktop','windows','C','2016-01-01 09:44:17',0),(152,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:44:28','Desktop','windows','C','2016-01-01 09:44:28',0),(153,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:45:24','Desktop','windows','C','2016-01-01 09:45:24',0),(154,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:45:50','Desktop','windows','C','2016-01-01 09:45:50',0),(155,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:46:02','Desktop','windows','C','2016-01-01 09:46:02',0),(156,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:46:40','Desktop','windows','C','2016-01-01 09:46:40',0),(157,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:46:58','Desktop','windows','C','2016-01-01 09:46:58',0),(158,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:48:43','Desktop','windows','C','2016-01-01 09:48:43',0),(159,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:49:21','Desktop','windows','C','2016-01-01 09:49:21',0),(160,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:50:14','Desktop','windows','C','2016-01-01 09:50:14',0),(161,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:51:00','Desktop','windows','C','2016-01-01 09:51:00',0),(162,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:51:20','Desktop','windows','C','2016-01-01 09:51:20',0),(163,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:51:59','Desktop','windows','C','2016-01-01 09:51:59',0),(164,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:52:26','Desktop','windows','C','2016-01-01 09:52:26',0),(165,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:53:04','Desktop','windows','C','2016-01-01 09:53:04',0),(166,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:53:46','Desktop','windows','C','2016-01-01 09:53:46',0),(167,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:54:37','Desktop','windows','C','2016-01-01 09:54:37',0),(168,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:54:49','Desktop','windows','C','2016-01-01 09:54:49',0),(169,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:55:03','Desktop','windows','C','2016-01-01 09:55:03',0),(170,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:56:33','Desktop','windows','C','2016-01-01 09:56:33',0),(171,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:56:52','Desktop','windows','C','2016-01-01 09:56:52',0),(172,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:57:03','Desktop','windows','C','2016-01-01 09:57:03',0),(173,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:58:43','Desktop','windows','C','2016-01-01 09:58:43',0),(174,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:00:44','Desktop','windows','C','2016-01-01 10:00:44',0),(175,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:01:16','Desktop','windows','C','2016-01-01 10:01:16',0),(176,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:03:12','Desktop','windows','C','2016-01-01 10:03:12',3),(177,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:03:23','Desktop','windows','C','2016-01-01 10:03:23',3),(178,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:03:35','Desktop','windows','C','2016-01-01 10:03:35',3),(179,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:03:58','Desktop','windows','C','2016-01-01 10:03:58',3),(180,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:04:21','Desktop','windows','C','2016-01-01 10:04:21',3),(181,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:04:32','Desktop','windows','C','2016-01-01 10:04:32',3),(182,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:06:19','Desktop','windows','C','2016-01-01 10:06:19',3),(183,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:06:40','Desktop','windows','C','2016-01-01 10:06:40',3),(184,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:07:11','Desktop','windows','C','2016-01-01 10:07:11',3),(185,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:07:34','Desktop','windows','C','2016-01-01 10:07:34',3),(186,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:08:11','Desktop','windows','C','2016-01-01 10:08:11',3),(187,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:08:27','Desktop','windows','C','2016-01-01 10:08:27',3),(188,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:09:59','Desktop','windows','C','2016-01-01 10:09:59',3),(189,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:10:14','Desktop','windows','C','2016-01-01 10:10:14',3),(190,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:11:38','Desktop','windows','C','2016-01-01 10:11:38',3),(191,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:12:42','Desktop','windows','C','2016-01-01 10:12:42',0),(192,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:12:54','Desktop','windows','C','2016-01-01 10:12:54',0),(193,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:13:06','Desktop','windows','C','2016-01-01 10:13:06',6),(194,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:13:18','Desktop','windows','C','2016-01-01 10:13:18',0),(195,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:15:45','Desktop','windows','C','2016-01-01 10:15:45',0),(196,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:15:56','Desktop','windows','C','2016-01-01 10:15:56',0),(197,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:16:31','Desktop','windows','C','2016-01-01 10:16:31',0),(198,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:17:35','Desktop','windows','C','2016-01-01 10:17:35',0),(199,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:18:19','Desktop','windows','C','2016-01-01 10:18:19',0),(200,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:18:33','Desktop','windows','C','2016-01-01 10:18:33',0),(201,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:18:50','Desktop','windows','C','2016-01-01 10:18:50',0),(202,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:19:05','Desktop','windows','C','2016-01-01 10:19:05',0),(203,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:19:20','Desktop','windows','C','2016-01-01 10:19:20',0),(204,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:19:31','Desktop','windows','C','2016-01-01 10:19:31',0),(205,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:19:51','Desktop','windows','C','2016-01-01 10:19:51',0),(206,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:20:05','Desktop','windows','C','2016-01-01 10:20:05',0),(207,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:20:17','Desktop','windows','C','2016-01-01 10:20:17',0),(208,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:21:52','Desktop','windows','C','2016-01-01 10:21:52',0),(209,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:22:41','Desktop','windows','C','2016-01-01 10:22:41',3),(210,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:22:55','Desktop','windows','C','2016-01-01 10:22:55',3),(211,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:24:31','Desktop','windows','C','2016-01-01 10:24:31',3),(212,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:00','Desktop','windows','C','2016-01-01 10:25:00',3),(213,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:20','Desktop','windows','C','2016-01-01 10:25:20',3),(214,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:40','Desktop','windows','C','2016-01-01 10:25:40',3),(215,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:53','Desktop','windows','C','2016-01-01 10:25:53',3),(216,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:26:07','Desktop','windows','C','2016-01-01 10:26:07',3),(217,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:26:42','Desktop','windows','C','2016-01-01 10:26:42',3),(218,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:27:15','Desktop','windows','C','2016-01-01 10:27:15',3),(219,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:29:06','Desktop','windows','C','2016-01-01 10:29:06',3),(220,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:29:53','Desktop','windows','C','2016-01-01 10:29:53',3),(221,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:30:04','Desktop','windows','C','2016-01-01 10:30:04',3),(222,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:30:16','Desktop','windows','C','2016-01-01 10:30:16',3),(223,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:31:10','Desktop','windows','C','2016-01-01 10:31:10',3),(224,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:31:46','Desktop','windows','C','2016-01-01 10:31:46',3),(225,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:32:08','Desktop','windows','C','2016-01-01 10:32:08',3),(226,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:33:29','Desktop','windows','C','2016-01-01 10:33:29',3),(227,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:34:19','Desktop','windows','C','2016-01-01 10:34:19',3),(228,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:34:34','Desktop','windows','C','2016-01-01 10:34:34',3),(229,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:35:12','Desktop','windows','C','2016-01-01 10:35:12',3),(230,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:35:35','Desktop','windows','C','2016-01-01 10:35:35',3),(231,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:36:15','Desktop','windows','C','2016-01-01 10:36:15',3),(232,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:37:06','Desktop','windows','C','2016-01-01 10:37:06',3),(233,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:37:23','Desktop','windows','C','2016-01-01 10:37:23',3),(234,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:37:34','Desktop','windows','C','2016-01-01 10:37:34',3),(235,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:38:24','Desktop','windows','C','2016-01-01 10:38:24',3),(236,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:38:37','Desktop','windows','C','2016-01-01 10:38:37',3),(237,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:40:26','Desktop','windows','C','2016-01-01 10:40:26',3),(238,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:41:27','Desktop','windows','C','2016-01-01 10:41:27',0),(239,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:41:40','Desktop','windows','C','2016-01-01 10:41:40',0),(240,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:03','Desktop','windows','C','2016-01-01 10:42:03',0),(241,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:15','Desktop','windows','C','2016-01-01 10:42:15',0),(242,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:26','Desktop','windows','C','2016-01-01 10:42:26',3),(243,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:41','Desktop','windows','C','2016-01-01 10:42:41',3),(244,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:53','Desktop','windows','C','2016-01-01 10:42:53',3),(245,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:43:48','Desktop','windows','C','2016-01-01 10:43:48',0),(246,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:44:06','Desktop','windows','C','2016-01-01 10:44:06',0),(247,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:44:18','Desktop','windows','C','2016-01-01 10:44:18',0),(248,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:44:29','Desktop','windows','C','2016-01-01 10:44:29',0),(249,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:44:42','Desktop','windows','C','2016-01-01 10:44:42',0),(250,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:44:54','Desktop','windows','C','2016-01-01 10:44:54',0),(251,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:45:06','Desktop','windows','C','2016-01-01 10:45:06',0),(252,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:45:17','Desktop','windows','C','2016-01-01 10:45:17',3),(253,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:45:28','Desktop','windows','C','2016-01-01 10:45:28',3),(254,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:45:39','Desktop','windows','C','2016-01-01 10:45:39',0),(255,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:47:14','Desktop','windows','C','2016-01-01 10:47:14',0),(256,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:48:00','Desktop','windows','C','2016-01-01 10:48:00',0),(257,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:48:11','Desktop','windows','C','2016-01-01 10:48:11',3),(258,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:50:04','Desktop','windows','C','2016-01-01 10:50:04',3),(259,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:50:37','Desktop','windows','C','2016-01-01 10:50:37',3),(260,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:50:51','Desktop','windows','C','2016-01-01 10:50:51',3),(261,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:51:43','Desktop','windows','C','2016-01-01 10:51:43',0),(262,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:52:47','Desktop','windows','C','2016-01-01 10:52:47',0),(263,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:53:34','Desktop','windows','C','2016-01-01 10:53:34',0),(264,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:54:14','Desktop','windows','C','2016-01-01 10:54:14',0),(265,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:54:34','Desktop','windows','C','2016-01-01 10:54:34',0),(266,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:54:49','Desktop','windows','C','2016-01-01 10:54:49',0),(267,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:55:01','Desktop','windows','C','2016-01-01 10:55:01',0),(268,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:55:22','Desktop','windows','C','2016-01-01 10:55:22',0),(269,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:05:26','Desktop','windows','C','2016-01-01 11:05:26',0),(270,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:06:09','Desktop','windows','C','2016-01-01 11:06:09',0),(271,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:07:37','Desktop','windows','C','2016-01-01 11:07:37',0),(272,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:07:51','Desktop','windows','C','2016-01-01 11:07:51',0),(273,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:03','Desktop','windows','C','2016-01-01 11:08:03',0),(274,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:14','Desktop','windows','C','2016-01-01 11:08:14',3),(275,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:29','Desktop','windows','C','2016-01-01 11:08:29',3),(276,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:42','Desktop','windows','C','2016-01-01 11:09:42',3),(277,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:53','Desktop','windows','C','2016-01-01 11:09:53',3),(278,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:11:30','Desktop','windows','C','2016-01-01 11:11:30',3),(279,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:11:59','Desktop','windows','C','2016-01-01 11:11:59',3),(280,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:13:01','Desktop','windows','C','2016-01-01 11:13:01',3),(281,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:14:09','Desktop','windows','C','2016-01-01 11:14:09',3),(282,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:14:51','Desktop','windows','C','2016-01-01 11:14:51',3),(283,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:19:57','Desktop','windows','C','2016-01-01 11:19:57',3),(284,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:20:10','Desktop','windows','C','2016-01-01 11:20:10',3),(285,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:27','Desktop','windows','C','2016-01-01 11:23:27',3),(286,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:48','Desktop','windows','C','2016-01-01 11:23:48',3),(287,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:11','Desktop','windows','C','2016-01-01 11:24:11',3),(288,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:26','Desktop','windows','C','2016-01-01 11:24:26',3),(289,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:25:07','Desktop','windows','C','2016-01-01 11:25:07',3),(290,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:25:33','Desktop','windows','C','2016-01-01 11:25:33',3),(291,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:25:56','Desktop','windows','C','2016-01-01 11:25:56',3),(292,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:29:25','Desktop','windows','C','2016-01-01 11:29:25',3),(293,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:29:43','Desktop','windows','C','2016-01-01 11:29:43',3),(294,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:30:06','Desktop','windows','C','2016-01-01 11:30:06',3),(295,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:30:26','Desktop','windows','C','2016-01-01 11:30:26',3),(296,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:31:40','Desktop','windows','C','2016-01-01 11:31:40',3),(297,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:31:53','Desktop','windows','C','2016-01-01 11:31:53',3),(298,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:05','Desktop','windows','C','2016-01-01 11:32:05',3),(299,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:35','Desktop','windows','C','2016-01-01 11:32:35',3),(300,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:56','Desktop','windows','C','2016-01-01 11:32:56',3),(301,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:33:19','Desktop','windows','C','2016-01-01 11:33:19',3),(302,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:34:28','Desktop','windows','C','2016-01-01 11:34:28',3),(303,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:35:14','Desktop','windows','C','2016-01-01 11:35:14',3),(304,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:36:23','Desktop','windows','C','2016-01-01 11:36:23',3),(305,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:36:59','Desktop','windows','C','2016-01-01 11:36:59',3),(306,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:26','Desktop','windows','C','2016-01-01 11:37:26',3),(307,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:48','Desktop','windows','C','2016-01-01 11:37:48',3),(308,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:12','Desktop','windows','C','2016-01-01 11:38:12',3),(309,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:27','Desktop','windows','C','2016-01-01 11:38:27',3),(310,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:45','Desktop','windows','C','2016-01-01 11:38:45',3),(311,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:05','Desktop','windows','C','2016-01-01 11:39:05',3),(312,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:17','Desktop','windows','C','2016-01-01 11:39:17',3),(313,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:40:40','Desktop','windows','C','2016-01-01 11:40:40',3),(314,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:40:55','Desktop','windows','C','2016-01-01 11:40:55',3),(315,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:21','Desktop','windows','C','2016-01-01 11:41:21',3),(316,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:34','Desktop','windows','C','2016-01-01 11:41:34',3),(317,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:56','Desktop','windows','C','2016-01-01 11:41:56',3),(318,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:42:52','Desktop','windows','C','2016-01-01 11:42:52',3),(319,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:43:15','Desktop','windows','C','2016-01-01 11:43:15',3),(320,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:07','Desktop','windows','C','2016-01-01 11:44:07',3),(321,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:38','Desktop','windows','C','2016-01-01 11:44:38',3),(322,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:55','Desktop','windows','C','2016-01-01 11:44:55',3),(323,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:45:20','Desktop','windows','C','2016-01-01 11:45:20',3),(324,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:45:47','Desktop','windows','C','2016-01-01 11:45:47',3),(325,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:02','Desktop','windows','C','2016-01-01 11:46:02',3),(326,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:27','Desktop','windows','C','2016-01-01 11:46:27',3),(327,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:46','Desktop','windows','C','2016-01-01 11:46:46',3),(328,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:05','Desktop','windows','C','2016-01-01 11:47:05',3),(329,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:18','Desktop','windows','C','2016-01-01 11:47:18',3),(330,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:35','Desktop','windows','C','2016-01-01 11:47:35',3),(331,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:57:54','Desktop','windows','C','2016-01-01 11:57:54',3);

/* Procedure structure for procedure `ChangePassword` */

/*!50003 DROP PROCEDURE IF EXISTS  `ChangePassword` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangePassword`(
	IN ParamOldPassword varchar(200),
	IN ParamNewPassword varchar(200),
	in ParamUserID int
)
BEGIN
	IF EXISTS (SELECT * FROM `user` where `userpassword`=ParamOldPassword AND UserID=ParamUserID) THEn
	UPDATE `User`
	SET `UserPassword` = ParamNewPassword,
		AuditedActivity = 'U',
		AuditedUser = ParamUserID,
		AuditedTime = CURRENT_TIMESTAMP()
	WHERE `userpassword`= ParamOldPassword AND UserID = ParamUserID;
	SELECT ParamUserID AS result;
	ELSE 
	SELECT -1 as result;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ChangeUserData` */

/*!50003 DROP PROCEDURE IF EXISTS  `ChangeUserData` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangeUserData`(
	in ParamUserName varchar(100),
	IN ParamCurrentCity varchar(100),
	IN ParamCountryName varchar(100),
	IN ParamUserID int
)
BEGIN
	UPDATE `user`
	SET UserName = ParamUserName,
	CityName = ParamCurrentCity,
	CountryName = ParamCountryName,
	AuditedActivity ='U',
	AuditedUser = ParamUserID,
	AuditedTime = CURRENT_TIMESTAMP()
	WHERE UserID = ParamUserID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `CheckLogin` */

/*!50003 DROP PROCEDURE IF EXISTS  `CheckLogin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckLogin`(
	IN ParamEmail VARCHAR(100),
	IN ParamPassword VARCHAR(100)
)
BEGIN
	IF EXISTS (SELECT * FROM `User` WHERE UserEmail = ParamEmail AND UserPASSWORD = ParamPassword AND AuditedActivity <> 'D')
	THEN
		SELECT UserID, UserName, UserEmail, UserRole
		FROM `User`
		WHERE 
		UserEmail = ParamEmail 
		AND 
		UserPASSWORD = ParamPassword 
		AND 
		AuditedActivity <> 'D';
	ELSE
		SELECT -1 'UserID';
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteCookmark` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteCookmark` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCookmark`(
	IN ParamCookmarkID int,
	IN ParamUserID int
)
BEGIN
	UPDATE Cookmark
	SET AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE CookmarkID = ParamCookmarkID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteFoodComposition` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteFoodComposition` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFoodComposition`( 
	ParamRecipeID INT, 
	ParamUserID INT 
)
BEGIN
	UPDATE 
		FoodComposition
	SET 
		Auditedactivity = 'D',
		AuditedTime = CURRENT_TIMESTAMP(),
		AuditedUser = ParamUserID
	WHERE 
		RecipeID = ParamRecipeID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteFoodStep` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteFoodStep` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFoodStep`( 
	ParamRecipeID INT,
	ParamUserID INT	
)
BEGIN
	UPDATE FoodStep
	SET 
		Auditedactivity = 'D',
		AuditedTime = CURRENT_TIMESTAMP(),
		AuditedUser = ParamUserID
	WHERE 
		RecipeID = ParamRecipeID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteRecipe` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteRecipe` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteRecipe`(
	IN ParamRecipeID int,
	in ParamUserID int
)
BEGIN
	UPDATE Recipe
	SET AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecipeID = ParamRecipeID;
	
	UPDATE FoodComment
	SET AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecipeID = ParamRecipeID;
	
	UPDATE foodstep
	SET AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecipeID = ParamRecipeID;
	
	UPDATE foodcomposition
	SET AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecipeID = ParamRecipeID;
	
	UPDATE foodcuisine
	SET AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecipeID = ParamRecipeID;
	
	UPDATE cookmark
	SET AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecipeID = ParamRecipeID;
	
	UPDATE recook
	SET AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecipeID = ParamRecipeID;
	
	UPDATE recookcomment
	SET AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecipeID = ParamRecipeID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteRecipeComment` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteRecipeComment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteRecipeComment`(
	IN ParamCommentID int,
	IN ParamUserID int
)
BEGIN
	UPDATE foodcomment
	SET 
	Auditedactivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE FoodCommentID = ParamCommentID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteRecook` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteRecook` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteRecook`(
	IN ParamRecookID int,
	IN ParamUserID int
)
BEGIN
	UPDATE Recook
	SET AuditedUser = ParamUserID,
	AuditedActivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP()
	WHERE RecookID = ParamRecookID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteRecookComment` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteRecookComment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteRecookComment`(
	IN ParamCommentID INT,
	IN ParamUserID INT
)
BEGIN
	UPDATE recookcomment
	SET 
	Auditedactivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecookCommentID = ParamCommentID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `EditRecook` */

/*!50003 DROP PROCEDURE IF EXISTS  `EditRecook` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EditRecook`(
	ParamUserID INT,
	ParamRecookID INT,
	ParamRecookDesc VARCHAR(500),
	ParamRecookPhoto VARCHAR(100)
)
BEGIN
	UPDATE recook
	SET RecookDesc = ParamRecookDesc,
	RecookPhoto = RecookPhoto,
	AuditedActivity = 'U',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecookID = ParamRecookID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetAllComposition` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetAllComposition` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllComposition`()
BEGIN
	SELECT CompositionID, CompositionName FROM composition
	WHERE AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetAllCuisine` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetAllCuisine` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCuisine`()
BEGIN
	SELECT CuisineID, CuisineName
	FROM Cuisine 
	WHERE AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetAllEstPeople` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetAllEstPeople` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEstPeople`()
BEGIN
	SELECT 
	EstPeopleID, 
	CASE WHEN EstPeopleStart <> EstPeopleEnd THEN
		CONCAT(CAST(EstPeopleStart AS CHAR),' - ',CAST(EstPeopleEnd AS CHAR), ' Orang') 
	ELSE
		CONCAT(CAST(EstPeopleStart AS CHAR),' Orang') 
	END 'EstPeopleName'
	FROM estpeople 
	WHERE AuditedActivity <> 'D'; 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetAllFoodProcess` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetAllFoodProcess` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFoodProcess`()
BEGIN
	SElECT FoodProcessID, FoodProcessName
	FROM FoodProcess
	Where AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetAllFoodType` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetAllFoodType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFoodType`()
BEGIN
	SELECT FoodTypeID, FoodTypeName
	FROM FoodType
	WHERE AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetAllMeasureSize` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetAllMeasureSize` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllMeasureSize`()
BEGIN
	SELECT MeasureSizeID, MeasureSizeName
	FROM MeasureSize
	WHERE AuditedActivity <> 'D'
	Order BY MeasureSizeName;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetAllPriceRange` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetAllPriceRange` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPriceRange`()
BEGIN
	SELECT PriceRangeID, 
	CONCAT(CAST(RangeStart AS CHAR),
	CASE WHEN RangeStart in ('<', '>') OR RangeEnd IN ('<', '>') THEN '' ELSE ' - ' END,
	CAST(RangeEnd AS CHAR)) 'PriceRangeName' 
	FROM PriceRange 
	WHERE AuditedActivity <> 'D'; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `GetAllRecipe` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetAllRecipe` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllRecipe`(
	IN ParamLimitPage INT,
	IN ParamOffsetPage INT -- Param Offset Mulai dari 0
)
BEGIN
	SELECT DISTINCT z.*
	FROM
	(
	SELECT DISTINCT y.RecipeID, y.RecipeName, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.CreatedDate, y.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT x.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, PrimaryPhoto, 
			r.UserID,
			CONCAT(CAST(UserName AS CHAR),CAST(CASE WHEN UserLevelID <> NULL THEN '('+lu.LevelNickName+')' ELSE '' END AS CHAR)) AS 'UserName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			ft.FoodTypeName, CreatedDate,
			CONCAT(LEFT(RecipeIntro, 97),'...') AS 'RecipeIntro'
			FROM Recipe r
			JOIN `user` u ON r.UserID = u.UserID AND u.AuditedActivity<> 'D'
			JOIN foodtype ft ON r.FoodTypeID=ft.FoodTypeID AND ft.AuditedActivity<> 'D'
			JOIN foodcuisine fc ON r.RecipeID=fc.RecipeID
			JOIN cuisine c ON fc.CuisineID=c.CuisineID
			JOIN foodcomposition fcs ON fcs.RecipeID=r.RecipeID
			JOIN Composition cmp ON cmp.CompositionID=fcs.CompositionID
			LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
			GROUP BY r.RecipeID, RecipeName, PrimaryPhoto, r.UserID, UserName, UserLevelID, LevelNickName
				, FoodTypeName, RecipeIntro, CreatedDate, fcs.CompositionID
		) AS X
		LEFT JOIN recook rck ON rck.RecipeID = x.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY x.RecipeID, x.RecipeName, x.PrimaryPhoto, x.UserID, x.UserName, x.CuisineName
		,x.FoodTypeName, x.RecipeIntro, x.CreatedDate
	) AS Y
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = y.RecipeID AND fcmt.AuditedActivity<>'D'
	GROUP BY y.RecipeID, y.RecipeName, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.NumberOfRecook, y.CreatedDate
	) AS Z
	LIMIT ParamLimitPage
	OFFSET ParamOffsetPage;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetMyCookmark` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetMyCookmark` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMyCookmark`(
	IN ParamUserID int,
	IN ParamLimitPage INT,
	IN ParamOffsetPage INT
)
BEGIN
	SELECT DISTINCT z.*,
	CASE WHEN r.RecookID IS NOT NULL THEN 1 ELSE 0 END 'FlagRecook'
	FROM
	(
	SELECT DISTINCT y.RecipeID, y.RecipeName, y.Slug, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.CreatedDate, y.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT x.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, r.Slug, PrimaryPhoto, 
			r.UserID,
			CONCAT(CAST(UserName AS CHAR),
			CAST(CASE WHEN UserLevelID is not NULL THEN CONCAT('(', lu.LevelNickName,')') ELSE '' END AS CHAR)) AS 'UserName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			ft.FoodTypeName, CreatedDate,
			CONCAT(LEFT(RecipeIntro, 97),'...') AS 'RecipeIntro'
			FROM Recipe r
			JOIN `user` u ON r.UserID = u.UserID AND u.AuditedActivity<> 'D'
			JOIN foodtype ft ON r.FoodTypeID=ft.FoodTypeID AND ft.AuditedActivity<> 'D'
			JOIN foodcuisine fc ON r.RecipeID=fc.RecipeID AND fc.AuditedActivity<> 'D'
			JOIN cuisine c ON fc.CuisineID=c.CuisineID AND c.AuditedActivity<> 'D'
			JOIN foodcomposition fcs ON fcs.RecipeID=r.RecipeID AND fcs.AuditedActivity<> 'D'
			JOIN Composition cmp ON cmp.CompositionID=fcs.CompositionID AND cmp.AuditedActivity<> 'D'
			JOIN cookmark cm on cm.RecipeID=r.RecipeID AND cm.AuditedActivity <> 'D'
			LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
			WHERE cm.UserID = ParamUserID
			GROUP BY r.RecipeID, RecipeName, PrimaryPhoto, r.UserID, UserName, UserLevelID, LevelNickName
				, FoodTypeName, RecipeIntro, CreatedDate, fcs.CompositionID
		) AS X
		LEFT JOIN recook rck ON rck.RecipeID = x.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY x.RecipeID, x.RecipeName, x.PrimaryPhoto, x.UserID, x.UserName, x.CuisineName
		,x.FoodTypeName, x.RecipeIntro, x.CreatedDate
	) AS Y
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = y.RecipeID AND fcmt.AuditedActivity<>'D'
	GROUP BY y.RecipeID, y.RecipeName, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.NumberOfRecook, y.CreatedDate
	) AS Z
	LEFT JOIN recook r ON r.recipeId=z.recipeid AND r.userid=ParamUserID AND r.AuditedActivity <> 'D'
	LIMIT ParamLimitPage
	OFFSET ParamOffsetPage;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetMyRecipe` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetMyRecipe` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMyRecipe`(
	IN ParamUserID int,
	IN ParamSorting INT, -- 1 Newly, 2 Most Popular
	IN ParamLimitPage INT,
	IN ParamOffsetPage INT -- Param Offset Mulai dari 0
)
BEGIN
SELECT DISTINCT z.*
	FROM
	(
	SELECT DISTINCT y.RecipeID, y.RecipeName, y.Slug, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.CreatedDate, y.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT x.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, r.Slug, PrimaryPhoto, 
			r.UserID,
			CONCAT(CAST(UserName AS CHAR),CAST(CASE WHEN UserLevelID <> NULL THEN '('+lu.LevelNickName+')' ELSE '' END AS CHAR)) AS 'UserName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			ft.FoodTypeName, CreatedDate,
			CONCAT(LEFT(RecipeIntro, 97),'...') AS 'RecipeIntro'
			FROM Recipe r
			JOIN `user` u ON r.UserID = u.UserID AND u.AuditedActivity<> 'D'
			JOIN foodtype ft ON r.FoodTypeID=ft.FoodTypeID AND ft.AuditedActivity<> 'D'
			JOIN foodcuisine fc ON r.RecipeID=fc.RecipeID AND fc.AuditedActivity<> 'D'
			JOIN cuisine c ON fc.CuisineID=c.CuisineID AND c.AuditedActivity<> 'D'
			JOIN foodcomposition fcs ON fcs.RecipeID=r.RecipeID AND fcs.AuditedActivity<> 'D'
			JOIN Composition cmp ON cmp.CompositionID=fcs.CompositionID AND cmp.AuditedActivity<> 'D'
			LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
			WHERE r.UserID = ParamUserID
			GROUP BY r.RecipeID, RecipeName, PrimaryPhoto, r.UserID, UserName, UserLevelID, LevelNickName
				, FoodTypeName, RecipeIntro, CreatedDate, fcs.CompositionID
		) AS X
		LEFT JOIN recook rck ON rck.RecipeID = x.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY x.RecipeID, x.RecipeName, x.PrimaryPhoto, x.UserID, x.UserName, x.CuisineName
		,x.FoodTypeName, x.RecipeIntro, x.CreatedDate
	) AS Y
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = y.RecipeID AND fcmt.AuditedActivity<>'D'
	GROUP BY y.RecipeID, y.RecipeName, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.NumberOfRecook, y.CreatedDate
	) AS Z
	ORDER BY 
	(CASE WHEN ParamSorting=1 THEN CreatedDate END) DESC,
	(CASE WHEN ParamSorting=2 THEN NumberOfRecook ELSE FoodTypeName END) DESC,
	(CASE WHEN ParamSorting=2 THEN NumberOfComment ELSE FoodTypeName END) DESC
	LIMIT ParamLimitPage
	OFFSET ParamOffsetPage;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetMyRecook` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetMyRecook` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMyRecook`(
	IN ParamUserID int,
	IN ParamLimitPage INT,
	IN ParamOffsetPage INT -- Param Offset Mulai dari 0
)
BEGIN
	SELECT z.* FROM (
	SELECT r.RecipeID, rr.RecipeName, rr.Slug, r.RecookID, RecookPhoto, RecookDesc,
	CONCAT(u.UserName, CASE WHEN lu.LevelNickName IS NULL THEN '' ELSE  CONCAT(' (', lu.LevelNickName, ')') END) 'UserName',
	DATE_FORMAT(RecookDate,'%d %b %Y %h:%i %p') 'RecookDate',
	COUNT(rc.RecookCommentID) 'NumberOfComment'
	FROM Recook r
	JOIN recipe rr ON r.RecipeID=rr.RecipeID
	JOIN `user` u ON u.UserID = r.UserID AND u.AuditedActivity<> 'D'
	LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
	LEFT JOIN recookcomment rc on rc.recookid=r.recookid AND rc.AuditedActivity<> 'D'
	WHERE r.AuditedActivity <> 'D' AND r.UserID = ParamUserID
	GROUp by r.RecipeID, rr.RecipeName, r.RecookID, RecookPhoto, RecookDesc,u.UserName,lu.LevelNickName,RecookDate
	) AS z
	ORDER BY RecookID DESC
	LIMIT ParamLimitPage
	OFFSET ParamOffsetPage;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetNewlyCreatedRecipe` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetNewlyCreatedRecipe` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNewlyCreatedRecipe`(
	in ParamUserID int
)
BEGIN
	SELECT DISTINCT y.RecipeID, y.RecipeName, y.Slug, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.CreatedDate, y.NumberOfRecook, 
	CASE WHEN c.CookmarkID IS NOT NULL THEN 1 ELSE 0 END 'FlagCookmark',
	CASE WHEN r.RecookID IS NOT NULL THEN 1 ELSE 0 END 'FlagRecook',
	CASE WHEN y.UserID = ParamUserID THEN 1 ELSE 0 END 'FlagCreator',
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT x.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, r.Slug, PrimaryPhoto, 
			r.UserID, CreatedDate,
			CONCAT(CAST(UserName AS CHAR),CAST(CASE WHEN UserLevelID is not NULL THEN CONCAT('(',lu.LevelNickName,')') ELSE '' END AS CHAR)) AS 'UserName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			ft.FoodTypeName, 
			CONCAT(LEFT(RecipeIntro, 97),'...') AS 'RecipeIntro'
			FROM Recipe r
			JOIN `user` u ON r.UserID = u.UserID AND u.AuditedActivity<> 'D'
			JOIN foodtype ft ON r.FoodTypeID=ft.FoodTypeID AND ft.AuditedActivity<> 'D'
			JOIN foodcuisine fc ON r.RecipeID=fc.RecipeID
			JOIN cuisine c ON fc.CuisineID=c.CuisineID
			LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
			GROUP BY r.RecipeID, RecipeName, PrimaryPhoto, r.UserID, UserName, UserLevelID, LevelNickName -- , CuisineName
				, FoodTypeName, RecipeIntro, CreatedDate
		) AS X
		LEFT JOIN recook rck ON rck.RecipeID = x.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY x.RecipeID, x.RecipeName, x.PrimaryPhoto, x.UserID, x.UserName, x.CuisineName
		,x.FoodTypeName, x.RecipeIntro, x.CreatedDate
	) AS Y
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = y.RecipeID AND fcmt.AuditedActivity<>'D'
	LEFT JOIN recook r ON r.recipeId=y.recipeid AND r.userid=ParamUserID AND r.AuditedActivity <> 'D'
	LEFT JOIN cookmark c ON c.recipeId=y.recipeid AND c.userid=ParamUserID AND c.AuditedActivity <> 'D'
	GROUP BY y.RecipeID, y.RecipeName, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.NumberOfRecook, y.CreatedDate
	ORDER BY unix_timestamp(CreatedDate) DESC, y.RecipeID DESC
	LIMIT 6;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetNotifications` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetNotifications` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNotifications`(
	ParamUserID int
)
BEGIN
	SELECT NotificationID, NotificationName, NotificationURL,
	NotificationDate, isRead
	FROM notifications
	WHERE
	ReceiverUserID = ParamUserID
	AND
	AuditedActivity <> 'D'
	ORDER BY UNIX_TIMESTAMP(NotificationDate) DESC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetPopularRecipe` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetPopularRecipe` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPopularRecipe`(
	in ParamUserID int
)
BEGIN
	SELECT DISTINCT z.*,
	CASE WHEN c.CookmarkID IS NOT NULL THEN 1 ELSE 0 END 'FlagCookmark',
	CASE WHEN r.RecookID IS NOT NULL THEN 1 ELSE 0 END 'FlagRecook',
	CASE WHEN z.UserID = ParamUserID THEN 1 ELSE 0 END 'FlagCreator' FROM
	(
	SELECT DISTINCT y.RecipeID, y.RecipeName, y.Slug, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT x.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, r.Slug, PrimaryPhoto, 
			r.UserID,
			CONCAT(CAST(UserName AS CHAR),CAST(CASE WHEN UserLevelID is not NULL THEN CONCAT('(',lu.LevelNickName,')') ELSE '' END AS CHAR)) AS 'UserName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			ft.FoodTypeName, 
			CONCAT(LEFT(RecipeIntro, 97),'...') AS 'RecipeIntro'
			FROM Recipe r
			JOIN `user` u ON r.UserID = u.UserID AND u.AuditedActivity<> 'D'
			JOIN foodtype ft ON r.FoodTypeID=ft.FoodTypeID AND ft.AuditedActivity<> 'D'
			JOIN foodcuisine fc ON r.RecipeID=fc.RecipeID
			JOIN cuisine c ON fc.CuisineID=c.CuisineID
			LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
			GROUP BY r.RecipeID, RecipeName, PrimaryPhoto, r.UserID, UserName, UserLevelID, LevelNickName -- , CuisineName
				, FoodTypeName, RecipeIntro
		) AS X
		LEFT JOIN recook rck ON rck.RecipeID = x.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY x.RecipeID, x.RecipeName, x.PrimaryPhoto, x.UserID, x.UserName, x.CuisineName
		,x.FoodTypeName, x.RecipeIntro
	) AS Y
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = y.RecipeID AND fcmt.AuditedActivity<>'D'
	GROUP BY y.RecipeID, y.RecipeName, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.NumberOfRecook
	) AS Z
	LEFT JOIN recook r ON r.recipeId=z.recipeid AND r.userid=ParamUserID AND r.AuditedActivity <> 'D'
	LEFT JOIN cookmark c ON c.recipeId=z.recipeid AND c.userid=ParamUserID AND c.AuditedActivity <> 'D'
	ORDER BY NumberOfComment DESC, NumberOfRecook DESC
	limit 6
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetRecipeComment` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetRecipeComment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecipeComment`(
	IN ParamRecipeID int
)
BEGIN
	SELECT FoodCommentID, `Comment`, DATE_FORMAT(CommentDate,'%d %b %Y %h:%i %p') 'CommentDate', fc.UserID, u.UserName, u.UserPhoto
	FROM foodcomment fc
	JOIN `user` u on fc.UserID=u.UserID
	WHERE RecipeID=ParamRecipeID AND fc.AuditedActivity<>'D'
	ORDER BY unix_Timestamp(CommentDate) DESC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetRecipeDetailComposition` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetRecipeDetailComposition` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecipeDetailComposition`(
	IN ParamRecipeID int
)
BEGIN
	SELECT FoodCompositionID, FoodCompositionSeq, CONCAT(Measure, ' ', MeasureSizeName) 'Measure',
	CompositionName, Measure as 'MeasureValue', ms.MeasureSizeID, c.CompositionID
	FROM foodcomposition fc
	JOIN composition c on fc.CompositionID=c.CompositionID AND c.AuditedActivity <> 'D'
	JOIN measuresize ms on ms.MeasureSizeID = fc.MeasureSizeID AND ms.AuditedActivity <> 'D'
	WHERE fc.AuditedActivity <> 'D' AND fc.RecipeID=ParamRecipeID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetRecipeDetailHeader` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetRecipeDetailHeader` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecipeDetailHeader`(
	IN ParamRecipeID int,
	IN ParamUSerID int
)
BEGIN
	SELECT DISTINCT y.*, COUNT(fcmt.FoodCommentID) 'NumberOfComment',
	CASE WHEN c.CookmarkID IS NOT NULL THEN 1 ELSE 0 END 'FlagCookmark',
	CASE WHEN r.RecookID IS NOT NULL THEN 1 ELSE 0 END 'FlagRecook',
	CASE WHEN y.UserID = ParamUserID THEN 1 ELSE 0 END 'FlagCreator'
	FROM(
		SELECT DISTINCT x.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT r.RecipeID, RecipeName, r.Slug, RecipeIntro, PrimaryPhoto, 
			u.UserID,
			CONCAT(UserName, CASE WHEN LevelNickName is null then '' ELSE  CONCAT(' (', LevelNickName, ')') END) 'UserName',			
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineID AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineID',
			ft.FoodTypeName, 
			ft.FoodTypeID,
			DATE_FORMAT(CreatedDate,'%d %b %Y %h:%i %p') 'CreatedDate',
			fp.FoodProcessName,
			fp.FoodProcessID,
			CONCAT(ep.EstPeopleStart, CASE WHEN ep.EstPeopleStart = ep.EstPeopleEnd THEN 'Orang' ELSE CONCAT(' - ', ep.EstPeopleEnd, ' Orang') END) 'EstPeople',
			ep.EstPeopleID,			
			TimeEst,
			CONCAT('IDR ', CAST(pr.RangeStart AS CHAR),
			CASE WHEN pr.RangeStart IN ('<', '>') OR pr.RangeEnd IN ('<', '>') THEN '' ELSE ' - ' END,
			CAST(pr.RangeEnd AS CHAR)) 'EstPrice',
			
			pr.PriceRangeID
			FROM Recipe r
			JOIN `user` u on u.UserID = r.UserID AND u.AuditedActivity<> 'D'
			JOIN foodtype ft ON r.FoodTypeID=ft.FoodTypeID AND ft.AuditedActivity<> 'D'
			JOIN foodcuisine fc ON r.RecipeID=fc.RecipeID AND fc.AuditedActivity<> 'D'
			JOIN cuisine c ON fc.CuisineID=c.CuisineID AND c.AuditedActivity<> 'D'
			JOIN foodprocess fp on fp.FoodProcessID = r.FoodProcessID AND fp.AuditedActivity<> 'D'
			JOIN estpeople ep on ep.estpeopleid = r.estpeopleid AND ep.AuditedActivity<> 'D'
			JOIN pricerange pr on pr.PriceRangeID=r.PriceRangeID AND pr.AuditedActivity<> 'D'
			LEFT JOIN leveluser lu on lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
			WHERE r.RecipeID = ParamRecipeID
			GROUP BY r.RecipeID, RecipeName, RecipeIntro, PrimaryPhoto, u.UserID, UserName, LevelNickName,
			ft.FoodTypeName, CreatedDate, fp.FoodProcessName, ep.EstPeopleStart, ep.EstPeopleEnd,
			TimeEst, pr.RangeStart, pr.RangeEnd
		)  AS X
		LEFT JOIN recook rck ON rck.RecipeID = x.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY RecipeID, RecipeName, RecipeIntro, PrimaryPhoto, UserID, UserName, CuisineName,
			FoodTypeName, CreatedDate, FoodProcessName, estPeople,
			TimeEst, EstPrice
	) AS Y
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = y.RecipeID AND fcmt.AuditedActivity<>'D'
	LEFT JOIN recook r ON r.recipeId=y.recipeid AND r.userid=ParamUserID AND r.AuditedActivity <> 'D'
	LEFT JOIN cookmark c ON c.recipeId=y.recipeid AND c.userid=ParamUserID AND c.AuditedActivity <> 'D'
	GROUP BY RecipeID, RecipeName, RecipeIntro, PrimaryPhoto, UserID, UserName, CuisineName,
			FoodTypeName, CreatedDate, FoodProcessName, estPeople,
			TimeEst, EstPrice, NumberOfRecook
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetRecipeDetailRecook` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetRecipeDetailRecook` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecipeDetailRecook`(
	IN ParamRecipeID int
)
BEGIN
	SELECT RecookID, RecookPhoto
	FROM Recook
	WHERE RecipeID = ParamRecipeID AND AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetRecipeDetailStep` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetRecipeDetailStep` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecipeDetailStep`(
	IN ParamRecipeID int
)
BEGIN
	SELECT FoodStepID, FoodStepSequence, FoodStepName, FoodStepImage
	FROM FoodStep
	WHERE RecipeID = ParamRecipeID AND AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetRecipeSearchResult` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetRecipeSearchResult` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecipeSearchResult`(
	IN ParamCuisineID VARCHAR(200),
	IN ParamFoodTypeID VARCHAR(200),
	IN ParamKeyword VARCHAR(200),
	IN ParamComposition VARCHAR(200),
	IN ParamFoodProcess VARCHAR(200),
	IN ParamPriceRange VARCHAR(200),
	IN ParamEstPeople VARCHAR(200),
	IN ParamUserID int,
	IN ParamSorting INT, -- 0 Alphabet, 1 Newly, 2 Most Popular
	IN ParamLimitPage INT,
	IN ParamOffsetPage INT -- Param Offset Mulai dari 0
)
BEGIN
	SELECT DISTINCT z.*,
	CASE WHEN c.CookmarkID is not null then 1 else 0 end 'FlagCookmark',
	CASE WHEN r.RecookID IS NOT NULL THEN 1 ELSE 0 END 'FlagRecook',
	CASE WHEN z.UserID = ParamUserID then 1 else 0 end 'FlagCreator'
	FROM
	(
	SELECT DISTINCT y.RecipeID, y.RecipeName, y.Slug, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.CreatedDate, y.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT x.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, r.Slug, PrimaryPhoto, 
			r.UserID,
			CONCAT(CAST(UserName AS CHAR),CAST(CASE WHEN u.UserLevelID is not NULL THEN CONCAT('(', lu.LevelNickName,')') ELSE '' END AS CHAR)) AS 'UserName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			ft.FoodTypeName, CreatedDate,
			CONCAT(LEFT(RecipeIntro, 97),'...') AS 'RecipeIntro'
			FROM Recipe r
			JOIN `user` u ON r.UserID = u.UserID AND u.AuditedActivity<> 'D'
			JOIN foodtype ft ON r.FoodTypeID=ft.FoodTypeID AND ft.AuditedActivity<> 'D'
			JOIN foodcuisine fc ON r.RecipeID=fc.RecipeID AND fc.AuditedActivity<> 'D'
			JOIN cuisine c ON fc.CuisineID=c.CuisineID AND c.AuditedActivity<> 'D'
			LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
			WHERE 	(ParamCuisineID IS NULL OR fc.RecipeID IN (SELECT RecipeID FROM foodcuisine WHERE FIND_IN_SET(CuisineID, ParamCuisineID))) 
				-- why Param Cuisine By Recipe? to get all cuisine in same recipe even only 1 cuisine ID from parameter
			AND
				(ParamFoodTypeID IS NULL OR FIND_IN_SET(ft.FoodTypeID,ParamFoodTypeID))
			AND
				(
				ParamKeyword IS NULL OR 
				r.RecipeName LIKE CONCAT('%', ParamKeyword, '%') OR 
				r.RecipeIntro LIKE CONCAT('%',ParamKeyword, '%')
				)
			AND
				(
				ParamComposition IS NULL OR 
				r.RecipeID in (Select RecipeID from 
					foodcomposition fcs
					JOIN Composition cmp on cmp.CompositionID=fcs.CompositionID AND cmp.AuditedActivity<> 'D'
					WHERE FIND_IN_SET(cmp.CompositionID, ParamComposition) AND fcs.AuditedActivity<> 'D')
				)
			AND
				(
				ParamFoodProcess IS NULL OR 
				FIND_IN_SET(FoodProcessID, ParamFoodProcess)
				)
			AND
				(
				ParamPriceRange IS NULL OR 
				FIND_IN_SET(PriceRangeID, ParamPriceRange)
				)
			AND
				(
				ParamEstPeople IS NULL OR 
				FIND_IN_SET(EstPeopleID, ParamEstPeople)
				)
			GROUP BY r.RecipeID, RecipeName, PrimaryPhoto, r.UserID, UserName, UserLevelID, LevelNickName
				, FoodTypeName, RecipeIntro, CreatedDate-- , fcs.CompositionID
		) AS X
		LEFT JOIN recook rck ON rck.RecipeID = x.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY x.RecipeID, x.RecipeName, x.PrimaryPhoto, x.UserID, x.UserName, x.CuisineName
		,x.FoodTypeName, x.RecipeIntro, x.CreatedDate
	) AS Y
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = y.RecipeID AND fcmt.AuditedActivity<>'D'
	GROUP BY y.RecipeID, y.RecipeName, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.NumberOfRecook, y.CreatedDate
	) AS Z
	LEFT JOIN recook r on r.recipeId=z.recipeid and r.userid=ParamUserID AND r.AuditedActivity <> 'D'
	LEFT JOIN cookmark c ON c.recipeId=z.recipeid AND c.userid=ParamUserID AND c.AuditedActivity <> 'D'
	ORDER BY 
	(CASE WHEN ParamSorting=0 THEN RecipeName END) ASC,
	(CASE WHEN ParamSorting=1 THEN unix_timestamp(CreatedDate) END) DESC,
	(CASE WHEN ParamSorting=2 THEN NumberOfRecook END) DESC,
	(CASE WHEN ParamSorting=2 THEN NumberOfComment END) DESC
	LIMIT ParamLimitPage
	OFFSET ParamOffsetPage
	/*CALL GetRecipeSearchResult('17,3', '2,6', 'Ayam','Mie,Ayam Fillet', '5', NULL, NULL, 0,3,0)
	CALL GetRecipeSearchResult(NULL, NULL, NULL, 'Mie,Ayam Fillet', NULL, NULL,NULL, 0,3,0)*/
	;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetRecookComment` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetRecookComment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecookComment`(
	IN ParamRecookID INT
)
BEGIN
	SELECT RecookCommentID, r.RecipeID, rr.RecipeName, r.RecookID,
	RecookCommentDesc, DATE_FORMAT(CommentTime,'%d %b %Y %h:%i %p') 'RecookCommentTime',
	ru.UserID, CONCAT(ru.UserName, CASE WHEN rlu.LevelNickName IS NULL THEN '' ELSE  CONCAT(' (', rlu.LevelNickName, ')') END) 'RecookUserName',
	ru.UserPhoto
	FROM Recook r
	JOIN recipe rr ON r.RecipeID=rr.RecipeID
	JOIN recookcomment rc ON rc.RecookID = r.RecookID AND rc.AuditedActivity <> 'D'
	JOIN `user` ru ON ru.UserID = rc.UserID AND ru.AuditedActivity<> 'D'
	LEFT JOIN leveluser rlu ON rlu.LevelUserID=ru.UserLevelID AND rlu.AuditedActivity<> 'D'
	WHERE r.RecookID = ParamRecookID AND r.AuditedActivity <> 'D'
	ORDER by UNIX_TIMESTAMP(commenttime) DESC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetRecookHeader` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetRecookHeader` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecookHeader`(
	IN ParamRecookID INT
)
BEGIN
	SELECT r.RecipeID, rr.RecipeName, r.RecookID, RecookPhoto, RecookDesc,
	CONCAT(u.UserName, CASE WHEN lu.LevelNickName IS NULL THEN '' ELSE  CONCAT(' (', lu.LevelNickName, ')') END) 'UserName'
	FROM Recook r
	JOIN recipe rr ON r.RecipeID=rr.RecipeID
	JOIN `user` u ON u.UserID = r.UserID AND u.AuditedActivity<> 'D'
	LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
	WHERE r.RecookID = ParamRecookID AND r.AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetRecookInformation` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetRecookInformation` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecookInformation`(
	IN ParamRecookID int
)
BEGIN
	SELECT r.RecipeID, rr.RecipeName, r.RecookID, RecookPhoto, RecookDesc,
	CONCAT(u.UserName, CASE WHEN lu.LevelNickName IS NULL THEN '' ELSE  CONCAT(' (', lu.LevelNickName, ')') END) 'UserName',
	RecookCommentID, RecookCommentDesc, DATE_FORMAT(CommentTime,'%d %b %Y %h:%i %p') 'RecookCommentTime',
	ru.UserID, CONCAT(ru.UserName, CASE WHEN rlu.LevelNickName IS NULL THEN '' ELSE  CONCAT(' (', rlu.LevelNickName, ')') END) 'RecookUserName',
	ru.UserPhoto
	FROM Recook r
	JOIN recipe rr on r.RecipeID=rr.RecipeID
	JOIN `user` u ON u.UserID = r.UserID AND u.AuditedActivity<> 'D'
	LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
	LEFT JOIN recookcomment rc on rc.RecookID = r.RecookID
	LEFT JOIN `user` ru ON ru.UserID = rc.UserID AND ru.AuditedActivity<> 'D'
	LEFT JOIN leveluser rlu ON rlu.LevelUserID=ru.UserLevelID AND rlu.AuditedActivity<> 'D'
	WHERE r.RecookID = ParamRecookID AND r.AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetRowDataSearchResult` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetRowDataSearchResult` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRowDataSearchResult`(
    IN ParamCuisineID VARCHAR(200),
	IN ParamFoodTypeID VARCHAR(200),
	IN ParamKeyword VARCHAR(200),
	IN ParamComposition VARCHAR(200),
	IN ParamFoodProcess VARCHAR(200),
	IN ParamPriceRange VARCHAR(200),
	IN ParamEstPeople VARCHAR(200),
	IN ParamUserID INT
)
BEGIN
	SELECT COUNT(*)'RowData' FROM (
	   SELECT DISTINCT r.RecipeID, RecipeName, PrimaryPhoto, 
			r.UserID,
			CONCAT(CAST(UserName AS CHAR),CAST(CASE WHEN u.UserLevelID IS NOT NULL THEN CONCAT('(', lu.LevelNickName,')') ELSE '' END AS CHAR)) AS 'UserName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			ft.FoodTypeName, CreatedDate,
			CONCAT(LEFT(RecipeIntro, 97),'...') AS 'RecipeIntro'
			FROM Recipe r
			JOIN `user` u ON r.UserID = u.UserID AND u.AuditedActivity<> 'D'
			JOIN foodtype ft ON r.FoodTypeID=ft.FoodTypeID AND ft.AuditedActivity<> 'D'
			JOIN foodcuisine fc ON r.RecipeID=fc.RecipeID AND fc.AuditedActivity<> 'D'
			JOIN cuisine c ON fc.CuisineID=c.CuisineID AND c.AuditedActivity<> 'D'
			LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
			WHERE 	(ParamCuisineID IS NULL OR fc.RecipeID IN (SELECT RecipeID FROM foodcuisine WHERE FIND_IN_SET(CuisineID, ParamCuisineID))) 
				-- why Param Cuisine By Recipe? to get all cuisine in same recipe even only 1 cuisine ID from parameter
			AND
				(ParamFoodTypeID IS NULL OR FIND_IN_SET(ft.FoodTypeID,ParamFoodTypeID))
			AND
				(
				ParamKeyword IS NULL OR 
				r.RecipeName LIKE CONCAT('%', ParamKeyword, '%') OR 
				r.RecipeIntro LIKE CONCAT('%',ParamKeyword, '%')
				)
			AND
				(
				ParamComposition IS NULL OR 
				r.RecipeID IN (SELECT RecipeID FROM 
					foodcomposition fcs
					JOIN Composition cmp ON cmp.CompositionID=fcs.CompositionID AND cmp.AuditedActivity<> 'D'
					WHERE FIND_IN_SET(cmp.CompositionID, ParamComposition) AND fcs.AuditedActivity<> 'D')
				)
			AND
				(
				ParamFoodProcess IS NULL OR 
				FIND_IN_SET(FoodProcessID, ParamFoodProcess)
				)
			AND
				(
				ParamPriceRange IS NULL OR 
				FIND_IN_SET(PriceRangeID, ParamPriceRange)
				)
			AND
				(
				ParamEstPeople IS NULL OR 
				FIND_IN_SET(EstPeopleID, ParamEstPeople)
				)
			GROUP BY r.RecipeID, RecipeName, PrimaryPhoto, r.UserID, UserName, UserLevelID, LevelNickName
				, FoodTypeName, RecipeIntro, CreatedDate-- , fcs.CompositionID
	) AS X;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetSettingUserData` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetSettingUserData` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSettingUserData`(
	IN ParamUserID int
)
BEGIN
	SELECT y.*, COUNT(cs.UserID) 'ActualContest' FROM(
		SELECT x.*, COUNT(r.UserID) 'ActualRecook' FROM
		(
			SELECT u.UserID, UserName, UserEmail, CountryName, CityName,  UserPhoto, lu.LevelName, lu.LevelNickName, lu.LevelSeq,
			lud.LevelName 'NextLevelName', lud.LevelNickName 'NextLevelNickName', lud.LevelSeq 'NextLevelSeq',
			lud.NumberOfRecook, lud.NumberOfRecipe, lud.NumberOfWinContest, COUNT(r.UserID) 'ActualRecipe'
			FROM `user` u
			LEFT join leveluser lu ON lu.leveluserid=u.UserLevelID AND lu.AuditedActivity<> 'D'
			LEFT JOIN leveluser lud on lud.levelseq=(CASE WHEN u.UserLevelID is null then 1 else lu.levelSeq+1 end) AND lud.AuditedActivity<> 'D'
			LEFT JOIN Recipe r on r.UserID= u.UserID AND r.AuditedActivity<>'D'
			WHERE u.userId = ParamUserID and u.AuditedActivity <> 'D'
			GROUP BY UserName, UserEmail, CountryName, CityName,  UserPhoto, lu.LevelName, lu.LevelNickName, lu.LevelSeq,
			lud.LevelName, lud.LevelNickName, lud.LevelSeq,
			lud.NumberOfRecook, lud.NumberOfRecipe, lud.NumberOfWinContest
		) AS x
		LEFT JOIN Recook r on x.UserID=r.UserID AND r.AuditedActivity <> 'D'
		group by UserName, UserEmail, CountryName, CityName,  UserPhoto, LevelName, LevelNickName, LevelSeq,
			NextLevelName, NextLevelNickName, NextLevelSeq,
			NumberOfRecook, NumberOfRecipe, NumberOfWinContest, ActualRecipe
	) AS y
	LEFT JOIN contestscore cs on cs.UserID=y.userID 
	GROUP BY UserName, UserEmail, CountryName, CityName,  UserPhoto, LevelName, LevelNickName, LevelSeq,
	NextLevelName, NextLevelNickName, NextLevelSeq,
	NumberOfRecook, NumberOfRecipe, NumberOfWinContest, ActualRecipe, ActualRecook;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetUnreadNotifications` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetUnreadNotifications` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUnreadNotifications`(
	ParamUserID INT
)
BEGIN
	SELECT NotificationID, NotificationName, NotificationURL,
	NotificationDate -- , isRead
	FROM notifications
	WHERE
	ReceiverUserID = ParamUserID
	AND
	AuditedActivity <> 'D'
	AND isRead = 0
	ORDER BY UNIX_TIMESTAMP(NotificationDate) DESC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertCookmark` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertCookmark` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCookmark`(
	IN ParamUserID int,
	IN ParamRecipeID int
)
BEGIN
	INSERT INTO Cookmark
	(UserID, RecipeID, CookmarkDate, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamUserID, ParamRecipeID, CURRENT_TIMESTAMP(), 'C', CURRENT_TIMESTAMP(), ParamUserID);
	
	INSERT INTO notifications
	(NotificationName, NotificationURL, ReceiverUserID, NotificationDate, isRead, AuditedActivity, AuditedTime, AuditedUser)
	SELECT DISTINCT
	CONCAT(UserName, CASE WHEN LevelNickName IS NULL THEN '' ELSE  CONCAT(' (', LevelNickName, ')') END, ' Menandai ', RecipeName),
	CONCAT('recipe/detail/', c.RecipeID), r.UserID, CURRENT_TIMESTAMP(), 0, 
	'C', CURRENT_TIMESTAMP(), ParamUserID
	FROM cookmark c
	join recipe r on r.RecipeID=c.RecipeID AND r.AuditedActivity <>'D'
	JOIN `user` u ON u.UserID = c.UserID AND u.AuditedActivity<> 'D'
	LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
	WHERE c.UserID=ParamUserID AND c.RecipeID=ParamRecipeID AND c.AuditedActivity<>'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertFoodComment` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertFoodComment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertFoodComment`(
	ParamFoodComment varchar(200),
	ParamUserID int,
	ParamRecipeID int
)
BEGIN
	INSERT INTO FoodComment
	(UserID, RecipeID, `Comment`, CommentDate, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamUserID, ParamRecipeID, ParamFoodComment, CURRENT_TIMESTAMP(), 'C', CURRENT_TIMESTAMP(), ParamUserID);
	
	-- notif buat creatornya kalo dia ga comment
	SET @CreatorUserID = (SELECT UserID From Recipe WHERE RecipeID = ParamRecipeID AND AuditedActivity <> 'D' LIMIT 1);
	INSERT INTO notifications 
	(NotificationName, NotificationURL, ReceiverUserID, NotificationDate, isRead, AuditedActivity, AuditedTime, AuditedUser)
	SELECT DISTINCT CONCAT(UserName, CASE WHEN LevelNickName IS NULL THEN '' ELSE  CONCAT(' (', LevelNickName, ')') END, ' Mengomentari ', RecipeName),
	CONCAT('recipe/detail/', r.RecipeID),
	@CreatorUserID, CURRENT_TIMESTAMP(), 0, 'C', CURRENT_TIMESTAMP(), ParamUserID
	FROM foodcomment r
	JOIN recipe rr ON r.RecipeID = rr.RecipeID AND rr.AuditedActivity<>'D'
	JOIN `user` u ON u.UserID = r.UserID AND u.AuditedActivity<> 'D'
	LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
	WHERE r.RecipeID = ParamRecipeID AND r.AuditedActivity <> 'D'  AND rr.UserID <> ParamUserID AND r.UserID <> ParamUserID;
	
	-- notif buat org lain yg comment selain dia dan creator
	SET @CommenterName = (SELECT CONCAT(UserName, CASE WHEN LevelNickName IS NULL THEN '' ELSE  CONCAT(' (', LevelNickName, ')') END)
		from
		`user` u 
		LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
		where u.AuditedActivity<> 'D' AND u.USerID=ParamUserID
		LIMIt 1);
		
	INSERT INTO notifications
	(NotificationName, NotificationURL, ReceiverUserID, NotificationDate, isRead, AuditedActivity, AuditedTime, AuditedUser)
	SELECT DISTINCT
	CONCAT(@CommenterName, ' Ikut Mengomentari ', RecipeName) 'NotificationName',
	CONCAT('recipe/detail/', r.RecipeID) 'NotificationURL',
	r.UserID, CURRENT_TIMESTAMP(), 0, 'C', CURRENT_TIMESTAMP(), ParamUserID
	FROM foodcomment r
	JOIN recipe rr on r.RecipeID = rr.RecipeID AND rr.AuditedActivity<>'D' AND rr.UserID <> r.UserID
	JOIN `user` u ON u.UserID = r.UserID AND u.AuditedActivity<> 'D'
	WHERE r.RecipeID = ParamRecipeID AND r.AuditedActivity <> 'D'
	AND r.UserID <> ParamUserID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertFoodComposition` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertFoodComposition` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertFoodComposition`(
	ParamFoodCompositionSeq int,
	ParamFoodCompositionName varchar(100), 
	ParamMeasure float,
	ParamCompositionID int,
	ParamRecipeID int,
	ParamMeasureSizeID int,
	ParamUserID int
)
BEGIN
	
	IF EXISTS (SELECT * FROM Composition WHERE LOWER(CompositionName)=LOWER(ParamFoodCompositionName)) THEN
		SET @CompositionID = (SELECT CompositionID FROM Composition WHERE LOWER(CompositionName)=LOWER(ParamFoodCompositionName) LIMIT 1);
	ELSEIF (ParamCompositionID IS NOT NULL OR ParamCompositionID <> '0' OR ParamCompositionID='') THEN
		SET @CompositionID = ParamCompositionID;
	ELSE 
		INSERT INTO Composition 
		(CompositionName, AuditedActivity, AuditedTime, AuditedUser, CreatedTime)
		VALUES
		(ParamFoodCompositionName, 'C', CURRENT_TIMESTAMP(), ParamUserID, CURRENT_TIMESTAMP());
		SET @CompositionID = LAST_INSERT_ID();
	END IF;
	INSERT INTO FoodComposition
	(FoodCompositionSeq, Measure, CompositionID, RecipeID, MeasureSizeID, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamFoodCompositionSeq, ParamMeasure, @CompositionID, ParamRecipeID, ParamMeasureSizeID, 'C', CURRENT_TIMESTAMP(), ParamUserID);	
END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertFoodStep` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertFoodStep` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertFoodStep`(
	ParamFoodStepSeq INT,
	ParamFoodStepName varchar(500),
	ParamFoodStepImage varchar(100),
	ParamRecipeID int,
	ParamUserID int
)
BEGIN
	INSERT INTO FoodStep
	(FoodStepSequence, FoodStepName, FoodStepImage, RecipeID, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamFoodStepSeq, ParamFoodStepName, ParamFoodStepImage, ParamRecipeID, 'C', CURRENT_TIMESTAMP(), ParamUserID);
END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertPageViewLog` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertPageViewLog` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPageViewLog`(
	in ParamPageURL varchar(100),
	IN ParamBrowser VARCHAR(100),
	IN ParamBrowserVersion VARCHAR(100),
	IN ParamIPAddress VARCHAR(100),
	IN ParamDevice VARCHAR(100),
	IN ParamOS VARCHAR(40),
	IN ParamUserID INT
)
BEGIN
	INSERT INTO pageviewlog
	(PageURL, Browser, BrowserVersion, IPAddress, AccessDate, Device, OS, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamPageURL, ParamBrowser, ParamBrowserVersion, ParamIPAddress, CURRENT_TIMESTAMP(), ParamDevice, ParamOS, 'C', CURRENT_TIMESTAMP(), ParamUserID);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertRecipe` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertRecipe` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRecipe`(
	ParamRecipeName varchar(100),
	ParamRecipeIntro varchar(500),
	ParamFoodTypeID int,
	ParamFoodProcessID int,
	ParamEstPeopleID int,
	ParamPriceRangeID int,
	ParamTimeEst INT,
	ParamPrimaryPhoto varchar(100),
	ParamUserID int,
	ParamContestID int,
	ParamCuisineID1 int,
	ParamCuisineID2 int
)
BEGIN
	INSERT INTO Recipe
	(RecipeName, RecipeIntro, FoodTypeID, PriceRangeID, EstPeopleID, FoodProcessID, TimeEst,
	PrimaryPhoto, CreatedDate, UserID, ContestID, Auditedactivity, AuditedTime, AuditedUser)
	VALUEs
	(ParamRecipeName, ParamRecipeIntro, ParamFoodTypeID, ParamPriceRangeID, ParamEstPeopleID, ParamFoodProcessID,
	ParamTimeEst, ParamPrimaryPhoto, CURRENT_TIMESTAMP(), ParamUserID, ParamContestID, 'C', CURRENT_TIMESTAMP(), ParamUserID);
	SET @LastID = LAST_INSERT_ID();
	
	INSERT INTO FoodCuisine
	(CuisineID, RecipeID, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamCuisineID1, @LastID, 'C', CURRENT_TIMESTAMP(), ParamUserID);
	
	IF ParamCuisineID2 is not null
	THEN
	INSERT INTO FoodCuisine
	(CuisineID, RecipeID, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamCuisineID2, @LastID, 'C', CURRENT_TIMESTAMP(), ParamUserID);
	END IF;
	
	SELECT @LastID AS 'RecipeID';
END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertRecook` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertRecook` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRecook`(
	ParamUserID int,
	ParamRecipeID int,
	ParamRecookDesc varchar(500),
	ParamRecookPhoto varchar(100)
)
BEGIN
	INSERT INTO recook
	(UserID, RecipeID, RecookDesc, RecookPhoto, AuditedActivity, AuditedTime, AuditedUser, RecookDate)
	VALUES
	(ParamUserID, ParamRecipeID, ParamRecookDesc, ParamRecookPhoto, 'C', CURRENT_TIMESTAMP(), ParamUserID, CURRENT_TIMESTAMP());
	
	INSERT INTO notifications
	(NotificationName, NotificationURL, ReceiverUserID, NotificationDate, isRead, AuditedActivity, AuditedTime, AuditedUser)
	SELECT DISTINCT
	CONCAT(UserName, CASE WHEN LevelNickName IS NULL THEN '' ELSE  CONCAT(' (', LevelNickName, ')') END, ' Memasak ', RecipeName),
	CONCAT('recipe/detail/', c.RecipeID), r.UserID, CURRENT_TIMESTAMP(), 0, 
	'C', CURRENT_TIMESTAMP(), ParamUserID
	FROM recook c
	JOIN recipe r ON r.RecipeID=c.RecipeID AND r.AuditedActivity <>'D'
	JOIN `user` u ON u.UserID = c.UserID AND u.AuditedActivity<> 'D'
	LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
	WHERE c.UserID=ParamUserID AND c.RecipeID=ParamRecipeID AND c.AuditedActivity<>'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertRecookComment` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertRecookComment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRecookComment`(
	In ParamComment varchar(200),
	IN ParamUserID int,
	IN ParamRecookID int
)
BEGIN
	INSERT INTO recookcomment
	(RecookCommentDesc, UserID, RecookID, CommentTime, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamComment, ParamUserID, ParamRecookID, CURRENT_TIMESTAMP(), 'C', CURRENT_TIMESTAMP(), ParamUserID);
	
	
	-- notif buat creatornya kalo dia ga comment
	SET @CreatorUserID = (SELECT UserID FROM Recook WHERE RecookID = ParamRecookID AND AuditedActivity <> 'D' LIMIT 1);
	INSERT INTO notifications 
	(NotificationName, NotificationURL, ReceiverUserID, NotificationDate, isRead, AuditedActivity, AuditedTime, AuditedUser)
	SELECT DISTINCT CONCAT(UserName, CASE WHEN LevelNickName IS NULL THEN '' ELSE  CONCAT(' (', LevelNickName, ')') END, ' Mengomentari ', RecipeName),
	CONCAT('recipe/detail/', rr.RecipeID),
	@CreatorUserID, CURRENT_TIMESTAMP(), 0, 'C', CURRENT_TIMESTAMP(), ParamUserID
	FROM recookcomment r
	JOIN recook rr ON r.RecookID = rr.RecookID AND rr.AuditedActivity<>'D'
	join recipe rrr on rr.RecipeID = rrr.RecipeID AND rrr.AuditedActivity<>'D'
	JOIN `user` u ON u.UserID = r.UserID AND u.AuditedActivity<> 'D'
	LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
	WHERE r.RecookID = ParamRecookID AND r.AuditedActivity <> 'D' AND rr.UserID <> ParamUserID AND r.UserID <> ParamUserID;
	
	-- notif buat org lain yg comment selain dia dan creator
	SET @CommenterName = (SELECT CONCAT(UserName, CASE WHEN LevelNickName IS NULL THEN '' ELSE  CONCAT(' (', LevelNickName, ')') END)
		FROM
		`user` u 
		LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
		WHERE u.AuditedActivity<> 'D' AND u.USerID=ParamUserID
		LIMIT 1);
		
	INSERT INTO notifications
	(NotificationName, NotificationURL, ReceiverUserID, NotificationDate, isRead, AuditedActivity, AuditedTime, AuditedUser)
	SELECT DISTINCT
	CONCAT(@CommenterName, ' Ikut Mengomentari ', RecipeName) 'NotificationName',
	CONCAT('recipe/detail/', rr.RecipeID) 'NotificationURL',
	r.UserID, CURRENT_TIMESTAMP(), 0, 'C', CURRENT_TIMESTAMP(), ParamUserID
	FROM recookcomment r
	JOIN recook rr ON r.RecookID = rr.RecookID AND rr.AuditedActivity<>'D' AND rr.UserID <> r.UserID
	join recipe rrr ON rr.RecipeID = rrr.RecipeID AND rrr.AuditedActivity<>'D'
	JOIN `user` u ON u.UserID = r.UserID AND u.AuditedActivity<> 'D'
	WHERE r.RecookID = ParamRecookID AND r.AuditedActivity <> 'D'
	AND r.UserID <> ParamUserID;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertSearchLog` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertSearchLog` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertSearchLog`(
	IN ParamCuisineID VARCHAR(200),
	IN ParamFoodTypeID VARCHAR(200),
	IN ParamKeyword VARCHAR(200),
	IN ParamComposition VARCHAR(200),
	IN ParamFoodProcess VARCHAR(200),
	IN ParamPriceRange VARCHAR(200),
	IN ParamEstPeople VARCHAR(200),
	IN ParamUserID INT,
	IN ParamBrowser VARCHAR(100),
	IN ParamBrowserVersion VARCHAR(100),
	IN ParamIPAddress VARCHAR(100),
	IN ParamDevice VARCHAR(100),
	IN ParamOS VARCHAR(40)
    )
BEGIN
	INSERT INTO SearchLog
	(Browser, BrowserVersion, IPAddress, AccessDate, Device, OS, PCuisineID, PFoodTypeID, PKeyword,
	PComposition, PFoodProcess, PPriceRange, PEstPeople, PUserID,
	AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamBrowser, ParamBrowserVersion, ParamIPAddress, CURRENT_TIMESTAMP(), ParamDevice, ParamOS,
	ParamCuisineID, ParamFoodTypeID, ParamKeyword,
	ParamComposition, ParamFoodProcess, ParamPriceRange, ParamEstPeople, ParamUserID,
	'C', CURRENT_TIMESTAMP(), ParamUserID);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertUserLog` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertUserLog` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUserLog`(
	IN ParamBrowser varchar(100),
	IN ParamBrowserVersion VARCHAR(100),
	IN ParamIPAddress varchar(100),
	in ParamDevice varchar(100),
	IN ParamOS VARCHAR(40),
	IN ParamUserID int
)
BEGIN
	INSERT INTO userlog
	(Browser, BrowserVersion, IPAddress, AccessDate, Device, OS, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamBrowser, ParamBrowserVersion, ParamIPAddress, CURRENT_TIMESTAMP(), ParamDevice, ParamOS, 'C', CURRENT_TIMESTAMP(), ParamUserID);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ReadNotification` */

/*!50003 DROP PROCEDURE IF EXISTS  `ReadNotification` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadNotification`(
	IN ParamNotificationID int,
	IN ParamUserID int
)
BEGIN
	UPDATE notifications
	SET 	
		isread=1,
		AuditedActivity='U',
		AuditedUser = ParamUserID,
		AuditedTime = CURRENT_TIMESTAMP()
	WHERE notificationid=ParamNotificationID;
	
	SELECT NotificationURL from notifications where notificationid=ParamNotificationID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `RegisterUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `RegisterUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterUser`(
	IN ParamUserName varchar(100),
	in ParamEmail varchar(100),
	in ParamUserPassword varchar(200)
)
BEGIN
	IF EXISTS 
		(SELECT * FROM `User` WHERE UserEmail = ParamEmail AND AuditedActivity <> 'D')
	then select -1 AS 'UserID';
	else 
		INSERt into `user` 
		(UserName, UserEmail, UserPassword, UserRole, AuditedActivity, AuditedTime, AuditedUser)
		VALUES
		(ParamUserName, ParamEmail, ParamUserPassword, 0, 'C', current_timestamp(), null);
		
		SELECT LAST_INSERT_ID() AS 'UserID';
	END if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateFoodComposition` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateFoodComposition` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateFoodComposition`(
	ParamFoodCompositionSeq INT,
	ParamFoodCompositionName VARCHAR(100), 
	ParamMeasure FLOAT,
	ParamCompositionID INT,
	ParamRecipeID INT,
	ParamMeasureSizeID INT,
	ParamUserID INT
)
BEGIN
	/*UPDATE FoodComposition
	SET 
	Auditedactivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecipeID = ParamRecipeID;*/
	
	IF EXISTS (SELECT * FROM Composition WHERE LOWER(CompositionName)=LOWER(ParamFoodCompositionName)) THEN
		SET @CompositionID = (SELECT CompositionID FROM Composition WHERE CompositionName=ParamFoodCompositionName LIMIT 1);
	ELSEIF ParamCompositionID IS NOT NULL OR ParamCompositionID <> '0'  OR ParamCompositionID='' THEN
		SET @CompositionID = ParamCompositionID;
	ELSE 
		INSERT INTO Composition 
		(CompositionName, AuditedActivity, AuditedTime, AuditedUser, CreatedTime)
		VALUES
		(ParamFoodCompositionName, 'C', CURRENT_TIMESTAMP(), ParamUserID, CURRENT_TIMESTAMP());
		SET @CompositionID = LAST_INSERT_ID();
	END IF;
	INSERT INTO FoodComposition
	(FoodCompositionSeq, Measure, CompositionID, RecipeID, MeasureSizeID, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamFoodCompositionSeq, ParamMeasure, @CompositionID, ParamRecipeID, ParamMeasureSizeID, 'C', CURRENT_TIMESTAMP(), ParamUserID);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateFoodStep` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateFoodStep` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateFoodStep`(
	ParamFoodStepSeq INT,
	ParamFoodStepName VARCHAR(500),
	ParamFoodStepImage VARCHAR(100),
	ParamRecipeID INT,
	ParamUserID INT
    )
BEGIN
	/*UPDATE FoodStep
	SET 
	Auditedactivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecipeID = ParamRecipeID;*/
	
	INSERT INTO FoodStep
	(FoodStepSequence, FoodStepName, FoodStepImage, RecipeID, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamFoodStepSeq, ParamFoodStepName, ParamFoodStepImage, ParamRecipeID, 'C', CURRENT_TIMESTAMP(), ParamUserID);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateRecipe` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateRecipe` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateRecipe`(
	ParamRecipeID int,
	ParamRecipeName VARCHAR(100),
	ParamRecipeIntro VARCHAR(500),
	ParamFoodTypeID INT,
	ParamFoodProcessID INT,
	ParamEstPeopleID INT,
	ParamPriceRangeID INT,
	ParamTimeEst INT,
	ParamPrimaryPhoto VARCHAR(100),
	ParamUserID INT,
	ParamContestID INT,
	ParamCuisineID1 INT,
	ParamCuisineID2 INT
)
BEGIN
	UPDATE Recipe
	SET RecipeName = ParamRecipeName, 
	RecipeIntro = ParamRecipeIntro, 
	FoodTypeID = ParamFoodTypeID, 
	PriceRangeID = ParamPriceRangeID, 
	EstPeopleID = ParamEstPeopleID, 
	FoodProcessID = ParamFoodProcessID,
	TimeEst = ParamTimeEst,
	PrimaryPhoto = ParamPrimaryPhoto,
	UserID = ParamUserID,
	ContestID = ParamContestID,
	Auditedactivity = 'U',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecipeID = ParamRecipeID;
	
	UPDATE FoodCuisine
	SET 
	Auditedactivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecipeID = ParamRecipeID;
	
	INSERT INTO FoodCuisine
	(CuisineID, RecipeID, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamCuisineID1, ParamRecipeID, 'C', CURRENT_TIMESTAMP(), ParamUserID);
	
	IF ParamCuisineID2 IS NOT NULL
	THEN
	INSERT INTO FoodCuisine
	(CuisineID, RecipeID, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamCuisineID2, ParamRecipeID, 'C', CURRENT_TIMESTAMP(), ParamUserID);
	END IF;
	
	SELECT @LastID AS 'RecipeID';
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UploadNewProfilePhoto` */

/*!50003 DROP PROCEDURE IF EXISTS  `UploadNewProfilePhoto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UploadNewProfilePhoto`(
	IN ParamUserPhoto varchar(100),
	in ParamUserID int
)
BEGIN
	UPDATE `user`
	set UserPhoto = ParamUserPhoto,
	AuditedActivity = 'U',
	AuditedUser = ParamUserID,
	AuditedTime = CURRENT_TIMESTAMP()
	WHERE UserID=ParamUserID AND AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
