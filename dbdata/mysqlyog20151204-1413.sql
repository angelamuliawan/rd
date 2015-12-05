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

/*Table structure for table `composition` */

DROP TABLE IF EXISTS `composition`;

CREATE TABLE `composition` (
  `CompositionID` int(11) NOT NULL AUTO_INCREMENT,
  `CompositionName` varchar(100) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`CompositionID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `composition` */

insert  into `composition`(`CompositionID`,`CompositionName`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Beras','C','2015-12-03 10:49:14',1),(2,'Telur','C','2015-12-03 10:49:24',1),(3,'Ayam Broiler','C','2015-12-03 10:49:24',1),(4,'Ayam Kampung','C','2015-12-03 10:49:24',1),(5,'Daging Sapi','C','2015-12-03 10:49:24',1),(6,'Cumi','C','2015-12-03 10:49:24',1),(7,'Udang','C','2015-12-03 10:49:24',1),(8,'Sawi','C','2015-12-03 10:49:24',1),(9,'Bawang Putih','C','2015-12-03 10:49:24',1),(10,'Mie','C','2015-12-03 10:49:24',1),(11,'Bihun','C','2015-12-03 10:49:24',1),(12,'Soun','C','2015-12-03 10:49:24',1),(13,'Ayam Fillet','C','2015-12-03 10:49:24',1),(14,'Kaldu Ayam','C','2015-12-03 10:49:24',1);

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
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`CookmarkID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cookmark` */

insert  into `cookmark`(`CookmarkID`,`UserID`,`RecipeID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,1,2,'C','2015-12-03 11:25:00',1),(2,3,2,'C','2015-12-03 11:25:09',3),(3,3,1,'C','2015-12-03 11:25:19',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `foodcomment` */

insert  into `foodcomment`(`FoodCommentID`,`UserID`,`RecipeID`,`Comment`,`CommentDate`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,3,1,'wow mau coba dong sis','2015-12-02 11:27:04','C','2015-12-03 11:27:08',3),(2,2,1,'Boleh sis ayo di recook','2015-12-02 14:27:26','C','2015-12-03 11:27:33',NULL);

/*Table structure for table `foodcomposition` */

DROP TABLE IF EXISTS `foodcomposition`;

CREATE TABLE `foodcomposition` (
  `FoodCompositionID` int(11) NOT NULL AUTO_INCREMENT,
  `Measure` float DEFAULT NULL,
  `CompositionID` int(11) DEFAULT NULL,
  `RecipeID` int(11) DEFAULT NULL,
  `MeasureSizeID` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`FoodCompositionID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `foodcomposition` */

insert  into `foodcomposition`(`FoodCompositionID`,`Measure`,`CompositionID`,`RecipeID`,`MeasureSizeID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,100,1,1,1,'C','2015-12-03 11:14:51',2),(2,1,2,1,4,'C','2015-12-03 11:14:52',2),(3,200,13,1,1,'C','2015-12-03 11:14:54',2),(4,9,9,1,1,'C','2015-12-03 11:14:55',2),(5,200,1,2,1,'C','2015-12-03 11:19:48',2),(6,1,2,2,4,'C','2015-12-03 11:19:50',2),(7,200,7,2,1,'C','2015-12-03 11:19:51',2),(8,100,10,3,1,'C','2015-12-03 23:12:14',3),(9,100,13,3,1,'C','2015-12-03 23:12:18',3),(10,200,14,3,6,'C','2015-12-03 23:12:21',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `foodcuisine` */

insert  into `foodcuisine`(`FoodCuisineID`,`CuisineID`,`RecipeID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,1,1,'C','2015-12-03 11:11:13',2),(2,17,1,'C','2015-12-03 11:11:24',2),(3,1,2,'C','2015-12-03 11:12:10',2),(4,5,2,'C','2015-12-03 11:12:11',2),(5,3,3,'C','2015-12-03 23:07:25',3),(6,5,3,'C','2015-12-03 23:07:29',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `foodstep` */

insert  into `foodstep`(`FoodStepID`,`FoodStepSequence`,`FoodStepName`,`FoodStepImage`,`RecipeID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,1,'Tumis bawang putih hingga harum',NULL,1,NULL,'2015-12-03 11:22:03',2),(2,2,'Masukkan telur ',NULL,1,'C','2015-12-03 11:22:05',2),(3,3,'masukan ayam',NULL,1,'C','2015-12-03 11:22:06',2),(4,4,'masukan nasi',NULL,1,'C','2015-12-03 11:22:08',2),(5,5,'bumbu secukupnya',NULL,1,'C','2015-12-03 11:22:09',2),(6,6,'nasi goreng siap disajikan',NULL,1,'C','2015-12-03 11:22:11',2),(7,1,'Tumis bawang putih hingga harum',NULL,2,'C','2015-12-03 11:22:11',2),(8,2,'Masukkan telur ',NULL,2,'C','2015-12-03 11:22:11',2),(9,3,'masukan UDANG',NULL,2,'C','2015-12-03 11:22:11',2),(10,4,'masukan nasi',NULL,2,'C','2015-12-03 11:22:11',2),(11,5,'bumbu secukupnya',NULL,2,'C','2015-12-03 11:22:11',2),(12,6,'nasi goreng siap disajikan',NULL,2,'C','2015-12-03 11:22:11',2),(13,1,'Rebus mi dengan kaldu ayam',NULL,3,'C','2015-12-03 23:13:18',3),(14,2,'masukkan ayam fillet',NULL,3,'C','2015-12-03 23:13:20',3),(15,3,'sajikan',NULL,3,'C','2015-12-03 23:13:23',3);

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
  `NumberOfRecook` int(11) DEFAULT NULL,
  `NumberOfRecipe` int(11) DEFAULT NULL,
  `NumberOfWinContest` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`LevelUserID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `leveluser` */

insert  into `leveluser`(`LevelUserID`,`LevelName`,`LevelNickName`,`NumberOfRecook`,`NumberOfRecipe`,`NumberOfWinContest`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Special','Cr',1000,1000,1000,'C','2015-12-03 11:51:50',1),(2,'Executive Chef','EC',200,300,3,'C','2015-12-03 11:51:09',1),(3,'Sous Chef','SC',100,200,1,'C','2015-12-03 11:51:11',1),(4,'Chef De Partie','CD',50,100,0,NULL,'2015-12-03 11:51:47',1),(5,'Commis','C',20,50,0,'C','2015-12-03 11:51:15',1),(6,'Cook Helper','CH',5,20,0,'C','2015-12-03 11:51:16',1);

/*Table structure for table `measuresize` */

DROP TABLE IF EXISTS `measuresize`;

CREATE TABLE `measuresize` (
  `MeasureSizeID` int(11) NOT NULL AUTO_INCREMENT,
  `MeasureSizeName` varchar(20) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`MeasureSizeID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `notifications` */

insert  into `notifications`(`NotificationID`,`NotificationName`,`NotificationURL`,`ReceiverUserID`,`NotificationDate`,`isRead`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Brian Photo Recook Nasi Goreng Ayam','url image recooknya',2,'2015-12-03 11:45:05',0,'C','2015-12-03 11:45:16',3),(2,NULL,NULL,2,'2015-12-03 07:48:49',0,'C','2015-12-03 11:46:27',3),(3,'Angela Muliawan Commented on Recipe you comment on Nasi Goreng Ayam','url halaman recipe ngarah ke commentnya',NULL,'2015-12-03 11:48:48',0,'C','2015-12-03 11:47:08',2);

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
  `CreatedDate` date DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `ContestID` int(11) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`RecipeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `recipe` */

insert  into `recipe`(`RecipeID`,`RecipeName`,`RecipeIntro`,`FoodTypeID`,`PriceRangeID`,`EstPeopleID`,`FoodProcessID`,`TimeEst`,`PrimaryPhoto`,`CreatedDate`,`UserID`,`ContestID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Nasi Goreng Spesial Ayam Kampung','Ini data pertama angel ya',2,2,2,1,30,'nasigorengayam.jpg','2015-12-03',2,NULL,'C','2015-12-03 11:09:40',2),(2,'Nasi Goreng Udang Spesial','Enak banget buat sarapan nih',2,2,2,1,30,'nasigorengudang.jpg','2015-12-04',2,NULL,'C','2015-12-03 11:10:33',2),(3,'Bakmi Ayam','Enak banget loh',6,1,1,5,15,'3-bakmiayam.jpg','2015-11-04',3,NULL,'C','2015-12-03 23:06:14',3);

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
  PRIMARY KEY (`RecookID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `recook` */

insert  into `recook`(`RecookID`,`UserID`,`RecipeID`,`RecookDesc`,`RecookPhoto`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,3,1,'Resepnya simpel, enak dan semua suka :D ','recook1.jpg','C','2015-12-03 11:24:03',3);

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
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  `UserLevelID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`UserID`,`UserName`,`UserEmail`,`CompanyName`,`UserPassword`,`UserRole`,`UserPhoto`,`AuditedActivity`,`AuditedTime`,`AuditedUser`,`UserLevelID`) values (1,'ResepDuniaAdmin1','resepdunia@resepdunia.com',NULL,'d033e22ae348aeb5660fc2140aec35850c4da997',1,NULL,'C','2015-12-03 11:42:18',1,1),(2,'Angela Muliawan','amuliawan93@gmail.com',NULL,'d033e22ae348aeb5660fc2140aec35850c4da997',0,NULL,'C','2015-12-03 11:42:44',1,NULL),(3,'Brian Alexandro','alexandrobrian15@gmail.com',NULL,'d033e22ae348aeb5660fc2140aec35850c4da997',0,NULL,'C','2015-12-03 11:43:11',1,NULL),(4,'Blueband','blueband@unilever.com','PT Unilevel Indonesia','d033e22ae348aeb5660fc2140aec35850c4da997',2,'3-blueband.jpg','C','2015-12-03 11:43:58',1,NULL);

/*Table structure for table `userlog` */

DROP TABLE IF EXISTS `userlog`;

CREATE TABLE `userlog` (
  `UserLogID` int(11) NOT NULL AUTO_INCREMENT,
  `Browser` varchar(100) DEFAULT NULL,
  `IPAdress` varchar(100) DEFAULT NULL,
  `AccessDate` datetime DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserLogID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userlog` */

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
	SELECT EstPeopleID, EstPeopleStart, EstPeopleEnd
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

/* Procedure structure for procedure `GetAllPriceRange` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetAllPriceRange` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPriceRange`()
BEGIN
	SELECT PriceRangeID, CONCAT(CAST(RangeStart AS CHAR),' - ',CAST(RangeEnd AS CHAR))
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

/* Procedure structure for procedure `GetNewlyCreatedRecipe` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetNewlyCreatedRecipe` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNewlyCreatedRecipe`()
BEGIN
	SELECT DISTINCT y.RecipeID, y.RecipeName, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.CreatedDate, y.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT x.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, PrimaryPhoto, 
			r.UserID, CreatedDate,
			CONCAT(CAST(UserName AS CHAR),CAST(CASE WHEN UserLevelID <> NULL THEN '('+lu.LevelNickName+')' ELSE '' END AS CHAR)) AS 'UserName',
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
	GROUP BY y.RecipeID, y.RecipeName, y.PrimaryPhoto, y.UserID, y.UserName, y.CuisineName
	,y.FoodTypeName, y.RecipeIntro, y.NumberOfRecook, y.CreatedDate
	ORDER BY CAST(CreatedDate AS DATE) DESC
	LIMIT 5;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetPopularRecipe` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetPopularRecipe` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPopularRecipe`()
BEGIN
	SELECT DISTINCT z.* FROM
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
			CONCAT(CAST(UserName AS CHAR),CAST(CASE WHEN UserLevelID <> NULL THEN '('+lu.LevelNickName+')' ELSE '' END AS CHAR)) AS 'UserName',
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
	ORDER BY NumberOfComment DESC, NumberOfRecook DESC
	;
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
	IN ParamSorting INT, -- 0 Alphabet, 1 Newly, 2 Most Popular
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
			JOIN Composition cmp on cmp.CompositionID=fcs.CompositionID
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
				FIND_IN_SET(CompositionName, ParamComposition)
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
	(CASE WHEN ParamSorting=0 THEN RecipeName WHEN ParamSorting=1 THEN CreatedDate END) ASC,
	(CASE WHEN ParamSorting=2 THEN NumberOfRecook ELSE FoodTypeName END) DESC,
	(CASE WHEN ParamSorting=2 THEN NumberOfComment ELSE FoodTypeName END) DESC
	LIMIT ParamLimitPage
	OFFSET ParamOffsetPage
	/*CALL GetRecipeSearchResult('17,3', '2,6', 'Ayam','Mie,Ayam Fillet', '5', NULL, NULL, 0,3,0)
	CALL GetRecipeSearchResult(NULL, NULL, NULL, 'Mie,Ayam Fillet', NULL, NULL,NULL, 0,3,0)*/
	;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
