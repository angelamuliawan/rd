/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.26 : Database - rd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rd` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `rd`;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `composition` */

insert  into `composition`(`CompositionID`,`CompositionName`,`AuditedActivity`,`AuditedTime`,`AuditedUser`,`CreatedTime`) values (1,'Beras','C','2015-12-03 10:49:14',1,NULL),(2,'Telur','C','2015-12-03 10:49:24',1,NULL),(3,'Ayam Broiler','C','2015-12-03 10:49:24',1,NULL),(4,'Ayam Kampung','C','2015-12-03 10:49:24',1,NULL),(5,'Daging Sapi','C','2015-12-03 10:49:24',1,NULL),(6,'Cumi','C','2015-12-03 10:49:24',1,NULL),(7,'Udang','C','2015-12-03 10:49:24',1,NULL),(8,'Sawi','C','2015-12-03 10:49:24',1,NULL),(9,'Bawang Putih','C','2015-12-03 10:49:24',1,NULL),(10,'Mie','C','2015-12-03 10:49:24',1,NULL),(11,'Bihun','C','2015-12-03 10:49:24',1,NULL),(12,'Soun','C','2015-12-03 10:49:24',1,NULL),(13,'Ayam Fillet','C','2015-12-03 10:49:24',1,NULL),(14,'Kaldu Ayam','C','2015-12-03 10:49:24',1,NULL),(15,'Telur Ayam','C','2015-12-18 20:07:50',1,'2015-12-18 20:07:50');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `cookmark` */

insert  into `cookmark`(`CookmarkID`,`UserID`,`RecipeID`,`CookmarkDate`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,1,2,NULL,'C','2015-12-03 11:25:00',1),(2,3,2,NULL,'C','2015-12-03 11:25:09',3),(3,3,1,NULL,'C','2015-12-03 11:25:19',3),(4,1,11,'2015-12-31 15:23:28','C','2015-12-31 15:23:28',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `foodcomment` */

insert  into `foodcomment`(`FoodCommentID`,`UserID`,`RecipeID`,`Comment`,`CommentDate`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,3,1,'wow mau coba dong sis','2015-12-02 11:27:04','C','2015-12-03 11:27:08',3),(2,2,1,'Boleh sis ayo di recook','2015-12-02 14:27:26','C','2015-12-03 11:27:33',NULL),(3,3,1,'coba lagi gan','2015-12-30 20:26:35','C','2015-12-30 20:26:35',3),(4,3,11,'oke gan','2015-12-30 22:49:59','C','2015-12-30 22:49:59',3),(5,1,1,'Enak Bingits ','2015-12-31 12:56:56','C','2015-12-31 12:56:56',1),(6,1,1,'Enak Bingits ','2015-12-31 12:57:27','C','2015-12-31 12:57:27',1),(7,1,1,'Enak Bingits ','2015-12-31 13:02:10','C','2015-12-31 13:02:10',1),(8,2,1,'boleh sis yuk coba yuk','2015-12-31 13:05:00','C','2015-12-31 13:05:00',2),(9,2,4,'Test Notif yg comment si angel harusnya kena admin','2015-12-31 13:17:47','C','2015-12-31 13:17:47',2),(10,2,4,'ke 2Test Notif yg comment si angel harusnya kena admin','2015-12-31 13:24:05','C','2015-12-31 13:24:05',2),(11,2,4,'ke 3 -Test Notif yg comment si angel harusnya kena admin','2015-12-31 13:24:39','C','2015-12-31 13:24:39',2),(12,2,4,'ke 4 deh -Test Notif yg comment si angel harusnya kena admin','2015-12-31 13:26:35','C','2015-12-31 13:26:35',2),(13,3,4,'ke 1 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:29:41','C','2015-12-31 13:29:41',3),(14,3,4,'ke 2 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:39:52','C','2015-12-31 13:39:52',3),(15,3,4,'ke 2 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:40:00','C','2015-12-31 13:40:00',3),(16,3,4,'ke 2 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:40:17','C','2015-12-31 13:40:17',3),(17,3,4,'ke 2 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:40:18','C','2015-12-31 13:40:18',3),(18,3,4,'ke 2 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:40:45','C','2015-12-31 13:40:45',3),(19,3,4,'ke 3 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:41:49','C','2015-12-31 13:41:49',3),(20,3,4,'ke 4 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:42:12','C','2015-12-31 13:42:12',3),(21,3,4,'ke 4 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:44:23','C','2015-12-31 13:44:23',3),(22,3,4,'ke 5 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:44:56','C','2015-12-31 13:44:56',3),(23,3,4,'ke 5 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:47:32','C','2015-12-31 13:47:32',3),(24,3,4,'ke 5 deh -Test Notif yg comment si brian harusnya kena admin, angel','2015-12-31 13:50:24','C','2015-12-31 13:50:24',3),(25,1,4,'ke 5 deh -Test Notif yg comment si admin harusnya kena brian, angel','2015-12-31 13:52:24','C','2015-12-31 13:52:24',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `foodcomposition` */

insert  into `foodcomposition`(`FoodCompositionID`,`FoodCompositionSeq`,`Measure`,`CompositionID`,`RecipeID`,`MeasureSizeID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,NULL,100,1,1,1,'C','2015-12-03 11:14:51',2),(2,NULL,1,2,1,4,'C','2015-12-03 11:14:52',2),(3,NULL,200,13,1,1,'C','2015-12-03 11:14:54',2),(4,NULL,9,9,1,1,'C','2015-12-03 11:14:55',2),(5,NULL,200,1,2,1,'C','2015-12-03 11:19:48',2),(6,NULL,1,2,2,4,'C','2015-12-03 11:19:50',2),(7,NULL,200,7,2,1,'C','2015-12-03 11:19:51',2),(8,NULL,100,10,3,1,'C','2015-12-03 23:12:14',3),(9,NULL,100,13,3,1,'C','2015-12-03 23:12:18',3),(10,NULL,200,14,3,6,'C','2015-12-03 23:12:21',3),(11,1,100,1,4,1,'C','2015-12-15 21:38:51',1),(12,2,100,15,4,4,'C','2015-12-18 20:07:50',1),(13,3,100,1,4,4,'C','2015-12-20 11:02:41',1),(14,1,100,0,5,5,'C','2015-12-21 22:00:54',1),(15,2,1,4,5,4,'C','2015-12-21 22:00:54',1),(16,1,12,5,6,5,'C','2015-12-30 22:05:00',3),(17,1,200,0,7,4,'C','2015-12-30 22:25:58',3),(18,2,300,0,7,4,'C','2015-12-30 22:25:58',3),(19,1,200,5,8,4,'C','2015-12-30 22:30:07',3),(20,2,300,2,8,4,'C','2015-12-30 22:30:07',3),(21,1,200,5,9,4,'C','2015-12-30 22:30:34',3),(22,2,300,2,9,4,'C','2015-12-30 22:30:34',3),(23,1,200,5,10,4,'C','2015-12-30 22:31:13',3),(24,2,300,2,10,4,'C','2015-12-30 22:31:13',3),(25,1,200,5,11,4,'C','2015-12-30 22:45:21',3),(26,2,300,15,11,4,'C','2015-12-30 22:45:22',3),(27,1,4545,5,12,5,'D','2015-12-30 23:59:51',3),(28,1,4545,5,13,5,'C','2015-12-30 23:42:30',3),(29,1,4545,5,12,5,'D','2015-12-30 23:59:51',3),(30,1,4545,5,12,5,'D','2015-12-30 23:59:51',3),(31,1,1111,5,12,3,'C','2015-12-30 23:59:51',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `foodcuisine` */

insert  into `foodcuisine`(`FoodCuisineID`,`CuisineID`,`RecipeID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,1,1,'C','2015-12-03 11:11:13',2),(2,17,1,'C','2015-12-03 11:11:24',2),(3,1,2,'C','2015-12-03 11:12:10',2),(4,5,2,'C','2015-12-03 11:12:11',2),(5,3,3,'C','2015-12-03 23:07:25',3),(6,5,3,'C','2015-12-03 23:07:29',3),(7,1,4,'C','2015-12-15 21:36:56',1),(8,2,4,'C','2015-12-15 21:36:56',1),(9,5,5,'C','2015-12-21 22:00:54',1),(10,1,6,'C','2015-12-30 22:05:00',3),(11,1,7,'C','2015-12-30 22:25:58',3),(12,1,8,'C','2015-12-30 22:30:07',3),(13,1,9,'C','2015-12-30 22:30:34',3),(14,1,10,'C','2015-12-30 22:31:13',3),(15,1,11,'C','2015-12-30 22:45:21',3),(16,2,11,'C','2015-12-30 22:45:21',3),(17,2,12,'D','2015-12-30 23:59:50',3),(18,3,12,'D','2015-12-30 23:59:50',3),(19,2,13,'C','2015-12-30 23:42:30',3),(20,3,13,'C','2015-12-30 23:42:30',3),(21,2,12,'D','2015-12-30 23:59:50',3),(22,3,12,'D','2015-12-30 23:59:50',3),(23,2,12,'D','2015-12-30 23:59:50',3),(24,3,12,'D','2015-12-30 23:59:50',3),(25,2,12,'D','2015-12-30 23:59:50',3),(26,3,12,'D','2015-12-30 23:59:50',3),(27,2,12,'C','2015-12-30 23:59:50',3),(28,3,12,'C','2015-12-30 23:59:50',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

/*Data for the table `foodstep` */

insert  into `foodstep`(`FoodStepID`,`FoodStepSequence`,`FoodStepName`,`FoodStepImage`,`RecipeID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,1,'Tumis bawang putih hingga harum',NULL,1,NULL,'2015-12-03 11:22:03',2),(2,2,'Masukkan telur ',NULL,1,'C','2015-12-03 11:22:05',2),(3,3,'masukan ayam',NULL,1,'C','2015-12-03 11:22:06',2),(4,4,'masukan nasi',NULL,1,'C','2015-12-03 11:22:08',2),(5,5,'bumbu secukupnya',NULL,1,'C','2015-12-03 11:22:09',2),(6,6,'nasi goreng siap disajikan',NULL,1,'C','2015-12-03 11:22:11',2),(7,1,'Tumis bawang putih hingga harum',NULL,2,'C','2015-12-03 11:22:11',2),(8,2,'Masukkan telur ',NULL,2,'C','2015-12-03 11:22:11',2),(9,3,'masukan UDANG',NULL,2,'C','2015-12-03 11:22:11',2),(10,4,'masukan nasi',NULL,2,'C','2015-12-03 11:22:11',2),(11,5,'bumbu secukupnya',NULL,2,'C','2015-12-03 11:22:11',2),(12,6,'nasi goreng siap disajikan',NULL,2,'C','2015-12-03 11:22:11',2),(13,1,'Rebus mi dengan kaldu ayam',NULL,3,'C','2015-12-03 23:13:18',3),(14,2,'masukkan ayam fillet',NULL,3,'C','2015-12-03 23:13:20',3),(15,3,'sajikan',NULL,3,'C','2015-12-03 23:13:23',3),(16,1,'masukkan panci','panci.jpg',4,'C','2015-12-15 21:39:34',1),(17,1,'cuci ayam & rebus sampai setengah matang',NULL,5,'C','2015-12-21 22:00:54',1),(18,2,'masukkan angka, rebus lagi kurang lebih 60 menit',NULL,5,'C','2015-12-21 22:00:55',1),(19,3,'ayam merah siap disajikan yeayy',NULL,5,'C','2015-12-21 22:00:55',1),(20,1,'okay lah',NULL,6,'C','2015-12-30 22:05:00',3),(21,1,'poopop','0',7,'C','2015-12-30 22:25:58',3),(22,2,'popop','0',7,'C','2015-12-30 22:25:58',3),(23,1,'poopop','20151230_22_25_03_95.png',8,'C','2015-12-30 22:30:07',3),(24,2,'popop',NULL,8,'C','2015-12-30 22:30:07',3),(25,1,'poopop','20151230_22_30_34_70.jpg',9,'C','2015-12-30 22:30:34',3),(26,2,'popop',NULL,9,'C','2015-12-30 22:30:34',3),(27,3,'step terakhir no image yah gan',NULL,9,'C','2015-12-30 22:30:34',3),(28,1,'poopop','20151230_22_31_13_27.jpg',10,'C','2015-12-30 22:31:13',3),(29,2,'popop',NULL,10,'C','2015-12-30 22:31:13',3),(30,3,'step terakhir no image yah gan',NULL,10,'C','2015-12-30 22:31:13',3),(31,1,'ok','20151230_22_43_56_46.jpg',11,'C','2015-12-30 22:45:22',3),(32,2,'popoopopopoopopop','20151230_22_43_56_1.png',11,'C','2015-12-30 22:45:22',3),(33,1,'tanggung amat yah hahahaha','20151230_23_24_49_39.jpg',12,'D','2015-12-30 23:59:51',3),(34,2,'tanggun nig','20151230_23_24_55_96.png',12,'D','2015-12-30 23:59:51',3),(35,1,'tanggung amat yah hahahaha','20151230_23_42_30_87.jpg',13,'C','2015-12-30 23:42:31',3),(36,2,'tanggun nig','20151230_23_24_55_96.png',13,'C','2015-12-30 23:42:31',3),(37,1,'tanggung amat yah hahahaha','20151230_23_24_49_39.jpg',12,'D','2015-12-30 23:59:51',3),(38,2,'tanggun nig','20151230_23_24_55_96.png',12,'D','2015-12-30 23:59:51',3),(39,1,'UPDATEEEEE','20151230_23_24_55_96.png',12,'D','2015-12-30 23:59:51',3),(40,2,'UPDATEEEEE','20151230_23_48_49_54.jpg',12,'D','2015-12-30 23:59:51',3),(41,1,'UPDATEEEEE','20151230_23_48_49_54.jpg',12,'C','2015-12-30 23:59:51',3),(42,2,'AFTER UPDATEEEEE','20151230_23_59_50_65.jpg',12,'C','2015-12-30 23:59:51',3),(43,3,'AFTER UPDATEEEEE BUBUUUUU','20151230_23_59_50_50.png',12,'C','2015-12-30 23:59:51',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `measuresize` */

insert  into `measuresize`(`MeasureSizeID`,`MeasureSizeName`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Gram','C','2015-12-03 11:17:12',1),(2,'Sdt','C','2015-12-03 11:17:12',1),(3,'Sdm','C','2015-12-03 11:17:12',1),(4,'Butir','C','2015-12-03 11:17:12',1),(5,'Kilogram','C','2015-12-03 11:17:12',1),(6,'ml','C','2015-12-03 23:10:29',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

/*Data for the table `notifications` */

insert  into `notifications`(`NotificationID`,`NotificationName`,`NotificationURL`,`ReceiverUserID`,`NotificationDate`,`isRead`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Brian Photo Recook Nasi Goreng Ayam','url image recooknya',2,'2015-12-03 11:45:05',0,'C','2015-12-03 11:45:16',3),(2,'Brian Comment ni','url halaman recipe ngarah comment',2,'2015-12-03 07:48:49',0,'C','2015-12-03 11:46:27',3),(3,'Angela Muliawan Commented on Recipe you comment on Nasi Goreng Ayam','url halaman recipe ngarah ke commentnya',3,'2015-12-03 11:48:48',0,'C','2015-12-03 11:47:08',2),(4,'Angela Muliawan (SC) Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2015-12-31 12:56:56',0,'C','2015-12-31 12:56:56',1),(5,'Angela Muliawan (SC) Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2015-12-31 12:57:27',0,'C','2015-12-31 12:57:27',1),(6,'Angela Muliawan (SC) Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2015-12-31 13:02:10',0,'C','2015-12-31 13:02:10',1),(7,'Brian Alexandro Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 13:02:10',0,'C','2015-12-31 13:02:10',1),(8,'Brian Alexandro Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 13:02:10',0,'C','2015-12-31 13:02:10',1),(10,'Brian Alexandro Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(11,'Brian Alexandro Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(12,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',1,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(13,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',1,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(14,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',1,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(17,'ResepDuniaAdmin1 (Cr) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:17:47',0,'C','2015-12-31 13:17:47',2),(18,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:24:05',0,'C','2015-12-31 13:24:05',2),(19,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:24:05',0,'C','2015-12-31 13:24:05',2),(21,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:24:39',0,'C','2015-12-31 13:24:39',2),(22,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:26:35',0,'C','2015-12-31 13:26:35',2),(23,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(24,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(26,'Angela Muliawan (SC) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(27,'Angela Muliawan (SC) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(28,'Angela Muliawan (SC) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(29,'Angela Muliawan (SC) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(33,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:39:52',0,'C','2015-12-31 13:39:52',3),(34,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:39:52',0,'C','2015-12-31 13:39:52',3),(36,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:00',0,'C','2015-12-31 13:40:00',3),(37,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:00',0,'C','2015-12-31 13:40:00',3),(39,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:17',0,'C','2015-12-31 13:40:17',3),(40,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:17',0,'C','2015-12-31 13:40:17',3),(42,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:18',0,'C','2015-12-31 13:40:18',3),(43,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:18',0,'C','2015-12-31 13:40:18',3),(45,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(46,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(48,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(49,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(50,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(51,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(55,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(56,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(58,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(59,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(60,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(61,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(65,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(66,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(68,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(69,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(70,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(71,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(75,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:44:23',0,'C','2015-12-31 13:44:23',3),(76,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:44:23',0,'C','2015-12-31 13:44:23',3),(78,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:44:23',0,'C','2015-12-31 13:44:23',3),(79,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:44:56',0,'C','2015-12-31 13:44:56',3),(80,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:44:56',0,'C','2015-12-31 13:44:56',3),(82,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:44:56',0,'C','2015-12-31 13:44:56',3),(83,'Angela Muliawan (SC) CANTIK Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:47:32',0,'C','2015-12-31 13:47:32',3),(84,'Brian Alexandro CANTIK Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:47:32',0,'C','2015-12-31 13:47:32',3),(86,'Brian Alexandro GANTENG Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:47:32',0,'C','2015-12-31 13:47:32',3),(87,'Angela Muliawan (SC) CR Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:50:24',0,'C','2015-12-31 13:50:24',3),(88,'Brian Alexandro CM Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:50:24',0,'C','2015-12-31 13:50:24',3),(89,'ResepDuniaAdmin1 (Cr) BB Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:52:24',0,'C','2015-12-31 13:52:24',1),(90,'ResepDuniaAdmin1 (Cr) BB Recipe Enak Yuhu','recipe/detail/4',3,'2015-12-31 13:52:24',0,'C','2015-12-31 13:52:24',1),(92,'ResepDuniaAdmin1 (Cr) Mengomentari cumi kusut AFTER UPDATEEEEE','recipe/detail/12',3,'2015-12-31 14:37:20',0,'C','2015-12-31 14:37:20',2),(93,'Angela Muliawan (SC) Ikut Mengomentari cumi kusut AFTER UPDATEEEEE','recipe/detail/12',1,'2015-12-31 14:37:20',0,'C','2015-12-31 14:37:20',2),(94,'Angela Muliawan (SC) Mengomentari cumi kusut AFTER UPDATEEEEE','recipe/detail/12',3,'2015-12-31 14:49:03',0,'C','2015-12-31 14:49:03',1),(95,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari cumi kusut AFTER UPDATEEEEE','recipe/detail/12',2,'2015-12-31 14:49:03',0,'C','2015-12-31 14:49:03',1),(96,'ResepDuniaAdmin1 (Cr) Menyimpan nasi apa aja deh','recipe/detail/11',3,'2015-12-31 15:23:28',0,'C','2015-12-31 15:23:28',1),(97,'ResepDuniaAdmin1 (Cr) Memasak nasi apa aja deh','recipe/detail/11',3,'2015-12-31 15:25:20',0,'C','2015-12-31 15:25:20',1);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pageviewlog` */

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `recipe` */

insert  into `recipe`(`RecipeID`,`RecipeName`,`RecipeIntro`,`FoodTypeID`,`PriceRangeID`,`EstPeopleID`,`FoodProcessID`,`TimeEst`,`PrimaryPhoto`,`CreatedDate`,`UserID`,`ContestID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Nasi Goreng Spesial Ayam Kampung','Ini data pertama angel ya',2,2,2,1,30,'nasigorengayam.jpg','2015-12-03 00:00:00',2,NULL,'C','2015-12-03 11:09:40',2),(2,'Nasi Goreng Udang Spesial','Enak banget buat sarapan nih',2,2,2,1,30,'nasigorengudang.jpg','2015-12-04 00:00:00',2,NULL,'C','2015-12-03 11:10:33',2),(3,'Bakmi Ayam','Enak banget loh',6,1,1,5,15,'3-bakmiayam.jpg','2015-11-04 00:00:00',3,NULL,'C','2015-12-03 23:06:14',3),(4,'Recipe Enak Yuhu','Buatan angel gagal mulu ye',1,1,1,1,100,'Angela.jpg','2015-12-15 00:00:00',1,NULL,'C','2015-12-15 21:36:56',1),(5,'Ayam Merah','kesukaan aku dong yeyeye',6,2,2,5,120,'20151221_16_00_54_7.jpg','2015-12-21 00:00:00',1,NULL,'C','2015-12-21 22:00:54',1),(6,'sample','sample',1,1,1,1,12,'20151230_22_02_56_61.jpg','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 22:05:00',3),(7,'nasi nasi an','sample cerita',1,1,1,1,15,'20151230_22_25_58_91.png','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 22:25:58',3),(8,'nasi nasi an popo','sample cerita',1,1,1,1,15,'20151230_22_25_58_91.png','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 22:30:07',3),(9,'nasi nasi an popo','sample cerita',1,1,1,1,15,'20151230_22_25_58_91.png','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 22:30:34',3),(10,'nasi nasi an popo','sample cerita',1,1,1,1,15,'20151230_22_25_58_91.png','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 22:31:13',3),(11,'nasi apa aja deh','cerita apa aja deh',1,1,1,1,80,'20151230_22_45_06_17.jpg','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 22:45:21',3),(12,'cumi kusut AFTER UPDATEEEEE','intro AFTER UPDATEEEEE',7,2,3,4,55,'20151230_23_33_10_14.jpg','2015-12-30 00:00:00',3,NULL,'U','2015-12-30 23:59:50',3),(13,'cumi asin','intro',5,3,2,4,45,'20151230_23_33_10_14.jpg','2015-12-30 00:00:00',3,NULL,'C','2015-12-30 23:42:30',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `recook` */

insert  into `recook`(`RecookID`,`UserID`,`RecipeID`,`RecookDesc`,`RecookPhoto`,`AuditedActivity`,`AuditedTime`,`AuditedUser`,`RecookDate`) values (1,3,1,'Resepnya simpel, enak dan semua suka :D ','recook1.jpg','C','2015-12-03 11:24:03',3,'2015-12-17 14:52:39'),(2,3,12,'Recook makanan sendiri ahhh','20151231_00_00_20_38.png','C','2015-12-31 00:00:26',3,'2015-12-31 00:00:26'),(3,1,11,'ahey','20151231_09_25_15_36.jpg','C','2015-12-31 15:25:20',1,'2015-12-31 15:25:20');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `recookcomment` */

insert  into `recookcomment`(`RecookCommentID`,`RecookCommentDesc`,`UserID`,`RecookID`,`CommentTime`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Enak ga ya',2,1,'2015-12-17 11:04:08','C','2015-12-17 11:04:27',1),(2,'ga enak',3,1,'2015-12-17 11:04:50','C','2015-12-17 11:04:29',1),(3,'Ke 1',1,2,'2015-12-31 14:05:08','C','2015-12-31 14:05:08',1),(4,'Ke 1',1,2,'2015-12-31 14:06:05','C','2015-12-31 14:06:05',1),(5,'Ke 1',1,2,'2015-12-31 14:06:07','C','2015-12-31 14:06:07',1),(6,'Ke 1',1,2,'2015-12-31 14:06:39','C','2015-12-31 14:06:39',1),(7,'Ke 1',1,2,'2015-12-31 14:07:00','C','2015-12-31 14:07:00',1),(8,'Ke 1',1,2,'2015-12-31 14:07:01','C','2015-12-31 14:07:01',1),(9,'Ke 1',1,2,'2015-12-31 14:07:49','C','2015-12-31 14:07:49',1),(10,'Ke 1',1,2,'2015-12-31 14:08:55','C','2015-12-31 14:08:55',1),(11,'Ke 1',1,2,'2015-12-31 14:09:26','C','2015-12-31 14:09:26',1),(12,'Ke 1',1,2,'2015-12-31 14:11:06','C','2015-12-31 14:11:06',1),(13,'Ke 1',1,2,'2015-12-31 14:11:36','C','2015-12-31 14:11:36',1),(14,'Ke 1',1,2,'2015-12-31 14:13:04','C','2015-12-31 14:13:04',1),(15,'Ke 1',1,2,'2015-12-31 14:19:54','C','2015-12-31 14:19:54',1),(16,'Ke 1',2,2,'2015-12-31 14:37:20','C','2015-12-31 14:37:20',2),(17,'mati lu',1,2,'2015-12-31 14:49:03','C','2015-12-31 14:49:03',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `searchlog` */

insert  into `searchlog`(`SearchLogID`,`Browser`,`BrowserVersion`,`IPAddress`,`AccessDate`,`Device`,`OS`,`PCuisineID`,`PFoodTypeID`,`PKeyword`,`PComposition`,`PFoodProcess`,`PPriceRange`,`PEstPeople`,`PUserID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Chrome',NULL,'10.2.200.900','2015-12-28 14:13:15','HP',NULL,'1','1','Nasi Goreng','1','1','4','3',1,'C','2015-12-28 14:13:15',1),(2,'Google Chrome','Google Chrome','192.168.43.249','2015-12-31 00:46:21','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'C','2015-12-31 00:46:21',3),(3,'Google Chrome','Google Chrome','192.168.43.249','2015-12-31 00:46:38','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2015-12-31 00:46:38',3),(4,'Google Chrome','Google Chrome','192.168.43.249','2015-12-31 00:47:08','Desktop','windows','2','1,2','',NULL,NULL,NULL,NULL,3,'C','2015-12-31 00:47:08',3),(5,'Google Chrome','Google Chrome','192.168.43.249','2015-12-31 00:47:43','Desktop','windows','2','1,2','',NULL,NULL,NULL,NULL,3,'C','2015-12-31 00:47:43',3),(6,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:45:52','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2015-12-31 08:45:52',0),(7,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:45:58','Desktop','windows',NULL,NULL,'lah',NULL,NULL,NULL,NULL,0,'C','2015-12-31 08:45:58',0),(8,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:46:05','Desktop','windows',NULL,NULL,'','1',NULL,NULL,NULL,0,'C','2015-12-31 08:46:05',0),(9,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:46:18','Desktop','windows',NULL,NULL,'','5',NULL,NULL,NULL,0,'C','2015-12-31 08:46:18',0),(10,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:23:40','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2015-12-31 12:23:40',0),(11,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:24:14','Desktop','windows',NULL,NULL,'','1,Ayam itik',NULL,NULL,NULL,0,'C','2015-12-31 12:24:14',0),(12,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:25:42','Desktop','windows',NULL,NULL,'','1,Ayam itik',NULL,NULL,NULL,1,'C','2015-12-31 12:25:42',1),(13,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:16:31','Desktop','windows',NULL,NULL,'resep enak',NULL,NULL,NULL,NULL,1,'C','2015-12-31 13:16:31',1),(14,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:16:36','Desktop','windows',NULL,NULL,'yuhu',NULL,NULL,NULL,NULL,1,'C','2015-12-31 13:16:36',1),(15,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:36','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 14:00:36',1),(16,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:44','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 14:00:44',1),(17,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:37:09','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 15:37:09',1),(18,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:15','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 16:18:15',1),(19,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:27','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 16:18:27',1),(20,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:42','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 16:18:42',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`UserID`,`UserName`,`UserEmail`,`CompanyName`,`UserPassword`,`UserRole`,`UserPhoto`,`CityName`,`CountryName`,`AuditedActivity`,`AuditedTime`,`AuditedUser`,`UserLevelID`) values (1,'ResepDuniaAdmin1','resepdunia@resepdunia.com',NULL,'d033e22ae348aeb5660fc2140aec35850c4da997',1,NULL,'Jakarta','Indonesia','U','2015-12-20 12:23:27',1,1),(2,'Angela Muliawan','amuliawan93@gmail.com',NULL,'d033e22ae348aeb5660fc2140aec35850c4da997',0,NULL,'Jakarta','Indonesia','C','2015-12-03 11:42:44',1,3),(3,'Brian Alexandro','alexandrobrian15@gmail.com',NULL,'d033e22ae348aeb5660fc2140aec35850c4da997',0,NULL,'Jakarta','Indonesia','C','2015-12-03 11:43:11',1,NULL),(4,'Blueband','blueband@unilever.com','PT Unilevel Indonesia','d033e22ae348aeb5660fc2140aec35850c4da997',2,'3-blueband.jpg','Jakarta','Indonesia','C','2015-12-03 11:43:58',1,NULL),(5,'Angela Muliawan','amuliawan93@gmailll.com',NULL,'asd',0,NULL,NULL,NULL,'C','2015-12-31 14:57:32',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

/*Data for the table `userlog` */

insert  into `userlog`(`UserLogID`,`Browser`,`BrowserVersion`,`IPAddress`,`AccessDate`,`Device`,`OS`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Firefox',NULL,'10.1.20.300','2015-12-18 20:38:55',NULL,NULL,'C','2015-12-18 20:38:55',1),(2,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:45:37','Desktop','windows','C','2015-12-31 08:45:37',0),(3,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:45:51','Desktop','windows','C','2015-12-31 08:45:51',0),(4,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:46:05','Desktop','windows','C','2015-12-31 08:46:05',0),(5,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:46:18','Desktop','windows','C','2015-12-31 08:46:18',0),(6,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:47:09','Desktop','windows','C','2015-12-31 08:47:09',0),(7,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:47:31','Desktop','windows','C','2015-12-31 08:47:31',0),(8,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:23:30','Desktop','windows','C','2015-12-31 12:23:30',0),(9,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:24:14','Desktop','windows','C','2015-12-31 12:24:14',0),(10,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:25:38','Desktop','windows','C','2015-12-31 12:25:38',0),(11,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:27:52','Desktop','windows','C','2015-12-31 12:27:52',1),(12,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:56:44','Desktop','windows','C','2015-12-31 12:56:44',1),(13,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:56:56','Desktop','windows','C','2015-12-31 12:56:56',1),(14,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:57:27','Desktop','windows','C','2015-12-31 12:57:27',1),(15,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:01:25','Desktop','windows','C','2015-12-31 13:01:25',1),(16,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:02:08','Desktop','windows','C','2015-12-31 13:02:08',1),(17,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:02:43','Desktop','windows','C','2015-12-31 13:02:43',1),(18,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:02:55','Desktop','windows','C','2015-12-31 13:02:55',0),(19,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:04:20','Desktop','windows','C','2015-12-31 13:04:20',2),(20,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:04:40','Desktop','windows','C','2015-12-31 13:04:40',2),(21,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:05:00','Desktop','windows','C','2015-12-31 13:05:00',2),(22,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:05:36','Desktop','windows','C','2015-12-31 13:05:36',2),(23,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:09:16','Desktop','windows','C','2015-12-31 13:09:16',2),(24,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:09:31','Desktop','windows','C','2015-12-31 13:09:31',2),(25,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:14:42','Desktop','windows','C','2015-12-31 13:14:42',1),(26,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:16:30','Desktop','windows','C','2015-12-31 13:16:30',1),(27,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:16:41','Desktop','windows','C','2015-12-31 13:16:41',1),(28,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:26:48','Desktop','windows','C','2015-12-31 13:26:48',1),(29,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:27:20','Desktop','windows','C','2015-12-31 13:27:20',1),(30,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:28:08','Desktop','windows','C','2015-12-31 13:28:08',1),(31,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:24','Desktop','windows','C','2015-12-31 14:00:24',1),(32,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:36','Desktop','windows','C','2015-12-31 14:00:36',1),(33,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:50','Desktop','windows','C','2015-12-31 14:00:50',1),(34,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:33:21','Desktop','windows','C','2015-12-31 14:33:21',1),(35,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:48:54','Desktop','windows','C','2015-12-31 14:48:54',1),(36,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:49:59','Desktop','windows','C','2015-12-31 14:49:59',1),(37,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:14:40','Desktop','windows','C','2015-12-31 15:14:40',0),(38,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:16:10','Desktop','windows','C','2015-12-31 15:16:10',0),(39,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:23:18','Desktop','windows','C','2015-12-31 15:23:18',0),(40,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:25:08','Desktop','windows','C','2015-12-31 15:25:08',1),(41,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:25:20','Desktop','windows','C','2015-12-31 15:25:20',1),(42,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:27:01','Desktop','windows','C','2015-12-31 15:27:01',1),(43,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:28:39','Desktop','windows','C','2015-12-31 15:28:39',1),(44,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:31:00','Desktop','windows','C','2015-12-31 15:31:00',1),(45,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:36:59','Desktop','windows','C','2015-12-31 15:36:59',1),(46,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:15','Desktop','windows','C','2015-12-31 16:18:15',1),(47,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:27','Desktop','windows','C','2015-12-31 16:18:27',1),(48,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:42','Desktop','windows','C','2015-12-31 16:18:42',1);

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
	SELECT DISTINCT y.RecipeID, y.RecipeName, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.CreatedDate, y.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT x.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, PrimaryPhoto, 
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
	(CASE WHEN ParamSorting=1 THEN CreatedDate END) ASC,
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
	SELECT r.RecipeID, rr.RecipeName, r.RecookID, RecookPhoto, RecookDesc,
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
	SELECT DISTINCT y.RecipeID, y.RecipeName, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.CreatedDate, y.NumberOfRecook, 
	CASE WHEN c.CookmarkID IS NOT NULL THEN 1 ELSE 0 END 'FlagCookmark',
	CASE WHEN r.RecookID IS NOT NULL THEN 1 ELSE 0 END 'FlagRecook',
	CASE WHEN y.UserID = ParamUserID THEN 1 ELSE 0 END 'FlagCreator',
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT x.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, PrimaryPhoto, 
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
	SELECT DISTINCT y.RecipeID, y.RecipeName, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT x.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, PrimaryPhoto, 
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
			SELECT r.RecipeID, RecipeName, RecipeIntro, PrimaryPhoto, 
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
			CONCAT('IDR ', pr.RangeStart,' - ', pr.RangeEnd) 'EstPrice',
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
	SELECT DISTINCT y.RecipeID, y.RecipeName, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.CreatedDate, y.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT x.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, PrimaryPhoto, 
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
	CONCAT(UserName, CASE WHEN LevelNickName IS NULL THEN '' ELSE  CONCAT(' (', LevelNickName, ')') END, ' Menyimpan ', RecipeName),
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
		SET @CompositionID = (SELECT CompositionID FROM Composition WHERE CompositionName=ParamFoodCompositionName LIMIT 1);
	ELSEIF ParamCompositionID IS NOT NULL THEN
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
	then select -1 as result;
	else 
		INSERt into `user` 
		(UserName, UserEmail, UserPassword, UserRole, AuditedActivity, AuditedTime, AuditedUser)
		VALUES
		(ParamUserName, ParamEmail, ParamUserPassword, 0, 'C', current_timestamp(), null);
		SELECT 1 as result;
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
	ELSEIF ParamCompositionID IS NOT NULL THEN
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
