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
  `ArticleTitle` varchar(100) DEFAULT NULL,
  `Slug` varchar(100) DEFAULT NULL,
  `ArticleImage` varchar(100) DEFAULT NULL,
  `ArticleDate` datetime DEFAULT NULL,
  `ArticleContent` longtext,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `article` */

insert  into `article`(`ArticleID`,`ArticleTitle`,`Slug`,`ArticleImage`,`ArticleDate`,`ArticleContent`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (8,'sasadfas','sasadfas','20160102_22_06_21_1.jpg','2016-01-02 22:06:21','<p class=\"fr-tag\">sdfsadfas</p>','C','2016-01-02 22:06:21',1),(9,'10 Resep Makanan Terpopuler Versi Google','10-resep-makanan-terpopuler-versi-google','20160103_04_39_28_61.jpg','2016-01-03 10:39:28','<p class=\"fr-tag\"><img class=\"fr-fin fr-tag\" alt=\"Image title\" src=\"http://localhost:1234/rd/resources/images/uploads/article/content/b06c03898c55cf339a246aefba035ef1daf0518f.jpg\" width=\"225\"></p><p style=\"text-align: center;\" class=\"fr-tag\">Jika ingin melihat makanan apa yang paling populer di tahun 2014, kita bisa mengecek daftar resep paling dicari di Google Indonesia. Kita akan melihat daftar makanan yang sebetulnya tidak terlalu mengejutkan. </p><p class=\"fr-tag\">Makanan sehari-hari yang biasa kita santap, tapi ternyata tidak semua orang mengerti cara memasaknya. Maka jangan heran jika nasi goreng menduduki daftar teratas resep yang paling dicari di Google Indonesia. </p><p class=\"fr-tag\">Pada tahun 2011, sebuah jajak pendapat internet yang diadakan oleh CNN Internasional, yang diikuti oleh 35 ribu orang, menempatkan nasi goreng dalam daftar 50 Makanan Terlezat di Dunia setelah rendang. Cukup mengagetkan, apalagi jika mengetahui betapa merakyatnya hidangan tersebut.</p><p class=\"fr-tag\">Nasi goreng adalah makanan sehari-hari, jajanan yang paling banyak bertebaran di setiap sudut kota. Namun, ada cita rasa berbeda ketika kita menikmati nasi goreng buatan sendiri dengan nasi goreng yang dijajakan di gerobak dorong atau restoran-restoran China. </p><p class=\"fr-tag\">Bau hangus khas dengan aroma minyak misterius yang tidak didapat ketika meraciknya sendiri. Barangkali itu sebabnya mengapa banyak orang begitu penasaran dengan resep nasi goreng. Kenikmatan sederhana, yang di dalamnya ada bumbu dan trik rahasia yang diburu para pencinta kuliner. </p><p class=\"fr-tag\">Di posisi kedua resep paling dicari versi Google Indonesia pada 2014 adalah bolu kukus. Rupanya banyak orang yang penasaran mengetahui resep bolu kukus. Saat menikmati bolu kukus di pasar atau toko-toko kue, beberapa akan terbuai oleh kelembutan bolu kukus. </p><p class=\"fr-tag\">Namun, membuat bolu kukus rupanya tidak semudah yang dibayangkan. Banyak yang gagal adonan bolu kukus lantaran bolu tidak mengembang. Saat ini, banyak pencinta kuliner yang hobi memasak berbagi tips memasak lewat blog mereka. Tidak hanya berbagi resep, tapi juga tips sukses sebuah masakan. </p><p class=\"fr-tag\">Di posisi ketiga dalam daftar resep paling dicari di Google Indonesia adalah donat kentang. Asal-usul donut sebetulnya masih diperdebatkan. Ada yang mengatakan, donut di bawa ke Amerika Utara oleh imigran Belanda. Ada pula cerita mengatakan, donut berbentuk cincin diciptakan oleh kapten kapal asal Denmark bernama Hanson Gregory. </p><p class=\"fr-tag\">Sang kapten harus menyetir kapal dengan kedua tangannya. Kue gorengan yang dimakannya ketika sedang menyetir lalu ditusukkan ke roda kemudi kapal sampai menjadi bolong. Kebetulan, bagian tengah kue juga sering tidak matang. Donat pun sengaja dibuat berlubang di tengah agar donut cepat matang. </p><p class=\"fr-tag\">Di Indonesia, barangkali kita sering menikmati donut kampung yang dijajakan berkeliling oleh pedagang asongan. Namun, di mal-mal demam donut mulai menjangkit dengan hadirnya produsen donut internasional. </p><p class=\"fr-tag\">Di dalam jajaran resep paling dicari, juga terdapat nama opor ayam. Opor adalah hidangan yang kaya akan bumbu rempah. Hidangan dengan kuah kental dari santan ini adalah masakan istimewa yang kerap dihidangkan pada perayaan Lebaran. </p><p class=\"fr-tag\">Maka tak heran jika resep opor menjadi salah satu buruan terbanyak. Penasaran, resep apa saja yang paling diburu orang di Google Indonesia pada 2014, berikut ini daftar 10 Resep Paling Dicari di Google Indonesia pada 2014. </p><p class=\"fr-tag\">1. Nasi goreng</p><p class=\"fr-tag\">2. Bolu kukus</p><p class=\"fr-tag\">3. Donat kentang</p><p class=\"fr-tag\">4. Pancake </p><p class=\"fr-tag\">5. Soto ayam</p><p class=\"fr-tag\">6. Opor ayam</p><p class=\"fr-tag\">7. Kue nastar</p><p class=\"fr-tag\">8. Brownies kukus </p><p class=\"fr-tag\">9. Martabak manis</p><p class=\"fr-tag\">10. Sayur asem</p><p class=\"fr-tag\"><br></p><p class=\"fr-tag\"><a rel=\"nofollow\" target=\"_blank\" href=\"http://www.cnnindonesia.com/gaya-hidup/20141231142851-262-21626/10-resep-makanan-terpopuler-2014-versi-google-indonesia/\">http://www.cnnindonesia.com/gaya-hidup/20141231142851-262-21626/10-resep-makanan-terpopuler-2014-versi-google-indonesia/</a><br></p>','C','2016-01-03 10:39:28',1);

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

/*Table structure for table `contactus` */

DROP TABLE IF EXISTS `contactus`;

CREATE TABLE `contactus` (
  `ContactUsID` int(11) NOT NULL AUTO_INCREMENT,
  `ContactUsName` varchar(100) DEFAULT NULL,
  `ContactUsEmail` varchar(100) DEFAULT NULL,
  `ContactUsMessage` varchar(200) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `IpAddress` varchar(100) DEFAULT NULL,
  `AuditedActivity` char(1) DEFAULT NULL,
  `AuditedTime` datetime DEFAULT NULL,
  `AuditedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`ContactUsID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `contactus` */

insert  into `contactus`(`ContactUsID`,`ContactUsName`,`ContactUsEmail`,`ContactUsMessage`,`CreatedDate`,`IpAddress`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Angela Muliawan','amuliawan93@gmail.com','Hai Test Contact Us','2016-01-03 12:52:37','10.2.300.50','C','2016-01-03 12:52:37',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `cookmark` */

insert  into `cookmark`(`CookmarkID`,`UserID`,`RecipeID`,`CookmarkDate`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,1,2,NULL,'C','2015-12-03 11:25:00',1),(2,3,2,NULL,'C','2015-12-03 11:25:09',3),(3,3,1,NULL,'C','2015-12-03 11:25:19',3),(4,1,11,'2015-12-31 15:23:28','C','2015-12-31 15:23:28',1),(5,2,13,'2015-12-31 23:06:43','C','2015-12-31 23:06:43',2),(6,2,14,'2015-12-31 23:06:52','C','2015-12-31 23:06:52',2),(7,2,11,'2016-01-02 08:44:40','C','2016-01-02 08:44:40',2);

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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

/*Data for the table `notifications` */

insert  into `notifications`(`NotificationID`,`NotificationName`,`NotificationURL`,`ReceiverUserID`,`NotificationDate`,`isRead`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Brian Photo Recook Nasi Goreng Ayam','url image recooknya',2,'2015-12-03 11:45:05',0,'C','2015-12-03 11:45:16',3),(2,'Brian Comment ni','url halaman recipe ngarah comment',2,'2015-12-03 07:48:49',0,'C','2015-12-03 11:46:27',3),(3,'Angela Muliawan Commented on Recipe you comment on Nasi Goreng Ayam','url halaman recipe ngarah ke commentnya',3,'2015-12-03 11:48:48',0,'C','2015-12-03 11:47:08',2),(4,'Angela Muliawan (SC) Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2015-12-31 12:56:56',0,'C','2015-12-31 12:56:56',1),(5,'Angela Muliawan (SC) Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2015-12-31 12:57:27',0,'C','2015-12-31 12:57:27',1),(6,'Angela Muliawan (SC) Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2015-12-31 13:02:10',0,'C','2015-12-31 13:02:10',1),(7,'Brian Alexandro Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 13:02:10',0,'C','2015-12-31 13:02:10',1),(8,'Brian Alexandro Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 13:02:10',0,'C','2015-12-31 13:02:10',1),(10,'Brian Alexandro Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(11,'Brian Alexandro Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(12,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',1,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(13,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',1,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(14,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',1,'2015-12-31 13:05:00',0,'C','2015-12-31 13:05:00',2),(17,'ResepDuniaAdmin1 (Cr) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:17:47',0,'C','2015-12-31 13:17:47',2),(18,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:24:05',0,'C','2015-12-31 13:24:05',2),(19,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:24:05',0,'C','2015-12-31 13:24:05',2),(21,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:24:39',0,'C','2015-12-31 13:24:39',2),(22,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:26:35',0,'C','2015-12-31 13:26:35',2),(23,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(24,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(26,'Angela Muliawan (SC) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(27,'Angela Muliawan (SC) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(28,'Angela Muliawan (SC) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(29,'Angela Muliawan (SC) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:29:41',0,'C','2015-12-31 13:29:41',3),(33,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:39:52',0,'C','2015-12-31 13:39:52',3),(34,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:39:52',0,'C','2015-12-31 13:39:52',3),(36,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:00',0,'C','2015-12-31 13:40:00',3),(37,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:00',0,'C','2015-12-31 13:40:00',3),(39,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:17',0,'C','2015-12-31 13:40:17',3),(40,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:17',0,'C','2015-12-31 13:40:17',3),(42,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:18',0,'C','2015-12-31 13:40:18',3),(43,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:18',0,'C','2015-12-31 13:40:18',3),(45,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(46,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(48,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(49,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(50,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(51,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:40:45',0,'C','2015-12-31 13:40:45',3),(55,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(56,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(58,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(59,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(60,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(61,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:41:49',0,'C','2015-12-31 13:41:49',3),(65,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(66,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(68,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(69,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(70,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(71,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:42:12',0,'C','2015-12-31 13:42:12',3),(75,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:44:23',0,'C','2015-12-31 13:44:23',3),(76,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:44:23',0,'C','2015-12-31 13:44:23',3),(78,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:44:23',0,'C','2015-12-31 13:44:23',3),(79,'Angela Muliawan (SC) Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:44:56',0,'C','2015-12-31 13:44:56',3),(80,'Brian Alexandro Mengomentari Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:44:56',0,'C','2015-12-31 13:44:56',3),(82,'Brian Alexandro Ikut Mengomentari Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:44:56',0,'C','2015-12-31 13:44:56',3),(83,'Angela Muliawan (SC) CANTIK Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:47:32',0,'C','2015-12-31 13:47:32',3),(84,'Brian Alexandro CANTIK Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:47:32',0,'C','2015-12-31 13:47:32',3),(86,'Brian Alexandro GANTENG Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:47:32',0,'C','2015-12-31 13:47:32',3),(87,'Angela Muliawan (SC) CR Recipe Enak Yuhu','recipe/detail/4',1,'2015-12-31 13:50:24',0,'C','2015-12-31 13:50:24',3),(88,'Brian Alexandro CM Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:50:24',0,'C','2015-12-31 13:50:24',3),(89,'ResepDuniaAdmin1 (Cr) BB Recipe Enak Yuhu','recipe/detail/4',2,'2015-12-31 13:52:24',0,'C','2015-12-31 13:52:24',1),(90,'ResepDuniaAdmin1 (Cr) BB Recipe Enak Yuhu','recipe/detail/4',3,'2015-12-31 13:52:24',0,'C','2015-12-31 13:52:24',1),(92,'ResepDuniaAdmin1 (Cr) Mengomentari cumi kusut AFTER UPDATEEEEE','recipe/detail/12',3,'2015-12-31 14:37:20',0,'C','2015-12-31 14:37:20',2),(93,'Angela Muliawan (SC) Ikut Mengomentari cumi kusut AFTER UPDATEEEEE','recipe/detail/12',1,'2015-12-31 14:37:20',0,'C','2015-12-31 14:37:20',2),(94,'Angela Muliawan (SC) Mengomentari cumi kusut AFTER UPDATEEEEE','recipe/detail/12',3,'2015-12-31 14:49:03',0,'C','2015-12-31 14:49:03',1),(95,'ResepDuniaAdmin1 (Cr) Ikut Mengomentari cumi kusut AFTER UPDATEEEEE','recipe/detail/12',2,'2015-12-31 14:49:03',0,'C','2015-12-31 14:49:03',1),(96,'ResepDuniaAdmin1 (Cr) Menyimpan nasi apa aja deh','recipe/detail/11',3,'2015-12-31 15:23:28',0,'C','2015-12-31 15:23:28',1),(97,'ResepDuniaAdmin1 (Cr) Memasak nasi apa aja deh','recipe/detail/11',3,'2015-12-31 15:25:20',0,'C','2015-12-31 15:25:20',1),(98,'Angela Muliawan (SC) Memasak Nasi Goreng Spesial Cookindo','recipe/detail/14',1,'2015-12-31 22:55:09',0,'C','2015-12-31 22:55:09',2),(99,'Angela Muliawan (SC) Memasak cumi asin','recipe/detail/13',3,'2015-12-31 22:55:36',0,'C','2015-12-31 22:55:36',2),(100,'Angela Muliawan (SC) Memasak Ayam Merah','recipe/detail/5',1,'2015-12-31 22:58:41',0,'C','2015-12-31 22:58:41',2),(101,'Angela Muliawan (SC) Memasak Bakmi Ayam','recipe/detail/3',3,'2015-12-31 23:00:53',0,'C','2015-12-31 23:00:53',2),(102,'Angela Muliawan (SC) Memasak cumi asin','recipe/detail/13',3,'2015-12-31 23:05:53',1,'U','2016-01-01 11:47:18',3),(103,'Angela Muliawan (SC) Menyimpan cumi asin','recipe/detail/13',3,'2015-12-31 23:06:43',1,'U','2016-01-01 11:08:18',3),(104,'Angela Muliawan (SC) Menyimpan Nasi Goreng Spesial Cookindo','recipe/detail/14',1,'2015-12-31 23:06:53',0,'C','2015-12-31 23:06:53',2),(105,'Angela Muliawan (SC) Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',3,'2015-12-31 23:07:49',1,'U','2016-01-02 08:19:03',3),(106,'Angela Muliawan (SC) Ikut Mengomentari Nasi Goreng Spesial Ayam Kampung','recipe/detail/1',1,'2015-12-31 23:07:49',0,'C','2015-12-31 23:07:49',2),(108,'Angela Muliawan (SC) Mengomentari Nasi  Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2016-01-01 10:22:41',0,'C','2016-01-01 10:22:41',3),(109,'ResepDuniaAdmin1 (Cr) Mengomentari Nasi  Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2016-01-01 10:22:41',0,'C','2016-01-01 10:22:41',3),(111,'Brian Alexandro Ikut Mengomentari Nasi  Goreng Spesial Ayam Kampung','recipe/detail/1',1,'2016-01-01 10:22:41',0,'C','2016-01-01 10:22:41',3),(112,'Brian Alexandro Ikut Mengomentari Nasi  Goreng Spesial Ayam Kampung','recipe/detail/1',2,'2016-01-01 10:22:48',0,'C','2016-01-01 10:22:48',3),(113,'Brian Alexandro Memasak Nasi Goreng Udang Spesial','recipe/detail/2',2,'2016-01-01 10:25:29',1,'U','2016-01-02 08:40:16',2),(114,'Brian Alexandro Memasak Recipe Enak Yuhu','recipe/detail/4',1,'2016-01-01 10:25:55',0,'C','2016-01-01 10:25:55',3),(115,'Brian Alexandro Memasak Nasi Goreng Spesial Cookindo','recipe/detail/14',1,'2016-01-02 08:20:55',0,'C','2016-01-02 08:20:55',3),(116,'Angela Muliawan (SC) Menandai nasi apa aja deh','/detail/11',3,'2016-01-02 08:44:40',1,'U','2016-01-02 13:05:48',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=970 DEFAULT CHARSET=latin1;

/*Data for the table `pageviewlog` */

insert  into `pageviewlog`(`PageViewLogID`,`PageURL`,`Browser`,`BrowserVersion`,`IPAddress`,`AccessDate`,`Device`,`OS`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'/rd/detail/13/cumi-asin','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:06:09','Desktop','windows','C','2016-01-01 11:06:09',0),(2,'/rd/detail/13/cumi-asin','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:07:37','Desktop','windows','C','2016-01-01 11:07:37',0),(3,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:07:51','Desktop','windows','C','2016-01-01 11:07:51',0),(4,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:07:54','Desktop','windows','C','2016-01-01 11:07:54',0),(5,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:00','Desktop','windows','C','2016-01-01 11:08:00',0),(6,'/rd/users/register','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:03','Desktop','windows','C','2016-01-01 11:08:03',0),(7,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:07','Desktop','windows','C','2016-01-01 11:08:07',0),(8,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:09','Desktop','windows','C','2016-01-01 11:08:09',3),(9,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:11','Desktop','windows','C','2016-01-01 11:08:11',3),(10,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:13','Desktop','windows','C','2016-01-01 11:08:13',3),(11,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:14','Desktop','windows','C','2016-01-01 11:08:14',3),(12,'/rd/users/read_notification/103','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:18','Desktop','windows','C','2016-01-01 11:08:18',3),(13,'/rd/recipe/detail/13','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:19','Desktop','windows','C','2016-01-01 11:08:19',3),(14,'/rd/detail/13/cumi-asin','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:20','Desktop','windows','C','2016-01-01 11:08:20',3),(15,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:29','Desktop','windows','C','2016-01-01 11:08:29',3),(16,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:30','Desktop','windows','C','2016-01-01 11:08:30',3),(17,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:31','Desktop','windows','C','2016-01-01 11:08:31',3),(18,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:42','Desktop','windows','C','2016-01-01 11:09:42',3),(19,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:43','Desktop','windows','C','2016-01-01 11:09:43',3),(20,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:44','Desktop','windows','C','2016-01-01 11:09:44',3),(21,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:45','Desktop','windows','C','2016-01-01 11:09:45',3),(22,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:52','Desktop','windows','C','2016-01-01 11:09:52',3),(23,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:53','Desktop','windows','C','2016-01-01 11:09:53',3),(24,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:55','Desktop','windows','C','2016-01-01 11:09:55',3),(25,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:56','Desktop','windows','C','2016-01-01 11:09:56',3),(26,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:57','Desktop','windows','C','2016-01-01 11:09:57',3),(27,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:11:30','Desktop','windows','C','2016-01-01 11:11:30',3),(28,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:11:59','Desktop','windows','C','2016-01-01 11:11:59',3),(29,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:12:03','Desktop','windows','C','2016-01-01 11:12:03',3),(30,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:13:01','Desktop','windows','C','2016-01-01 11:13:01',3),(31,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:14:09','Desktop','windows','C','2016-01-01 11:14:09',3),(32,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:14:51','Desktop','windows','C','2016-01-01 11:14:51',3),(33,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:19:56','Desktop','windows','C','2016-01-01 11:19:56',3),(34,'/rd/recipe/view_recook_item/2','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:20:02','Desktop','windows','C','2016-01-01 11:20:02',3),(35,'/rd/recipe/view_recook_item/1','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:20:10','Desktop','windows','C','2016-01-01 11:20:10',3),(36,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:20:18','Desktop','windows','C','2016-01-01 11:20:18',3),(37,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:27','Desktop','windows','C','2016-01-01 11:23:27',3),(38,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:29','Desktop','windows','C','2016-01-01 11:23:29',3),(39,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:34','Desktop','windows','C','2016-01-01 11:23:34',3),(40,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:48','Desktop','windows','C','2016-01-01 11:23:48',3),(41,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:50','Desktop','windows','C','2016-01-01 11:23:50',3),(42,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:11','Desktop','windows','C','2016-01-01 11:24:11',3),(43,'/rd/detail/4/recipe-enak-yuhu','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:16','Desktop','windows','C','2016-01-01 11:24:16',3),(44,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:18','Desktop','windows','C','2016-01-01 11:24:18',3),(45,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:26','Desktop','windows','C','2016-01-01 11:24:26',3),(46,'/rd/recipe/delete_recook_comment/24','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:35','Desktop','windows','C','2016-01-01 11:24:35',3),(47,'/rd/detail/4/recipe-enak-yuhu','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:25:07','Desktop','windows','C','2016-01-01 11:25:07',3),(48,'/rd/detail/4/recipe-enak-yuhu','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:25:33','Desktop','windows','C','2016-01-01 11:25:33',3),(49,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:25:56','Desktop','windows','C','2016-01-01 11:25:56',3),(50,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:29:25','Desktop','windows','C','2016-01-01 11:29:25',3),(51,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:29:43','Desktop','windows','C','2016-01-01 11:29:43',3),(52,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:29:51','Desktop','windows','C','2016-01-01 11:29:51',3),(53,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:30:06','Desktop','windows','C','2016-01-01 11:30:06',3),(54,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:30:26','Desktop','windows','C','2016-01-01 11:30:26',3),(55,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:31:40','Desktop','windows','C','2016-01-01 11:31:40',3),(56,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:31:53','Desktop','windows','C','2016-01-01 11:31:53',3),(57,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:05','Desktop','windows','C','2016-01-01 11:32:05',3),(58,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:35','Desktop','windows','C','2016-01-01 11:32:35',3),(59,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:56','Desktop','windows','C','2016-01-01 11:32:56',3),(60,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:33:06','Desktop','windows','C','2016-01-01 11:33:06',3),(61,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:33:19','Desktop','windows','C','2016-01-01 11:33:19',3),(62,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:34:27','Desktop','windows','C','2016-01-01 11:34:27',3),(63,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:35:14','Desktop','windows','C','2016-01-01 11:35:14',3),(64,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:36:23','Desktop','windows','C','2016-01-01 11:36:23',3),(65,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:36:58','Desktop','windows','C','2016-01-01 11:36:58',3),(66,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:26','Desktop','windows','C','2016-01-01 11:37:26',3),(67,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:35','Desktop','windows','C','2016-01-01 11:37:35',3),(68,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:48','Desktop','windows','C','2016-01-01 11:37:48',3),(69,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:12','Desktop','windows','C','2016-01-01 11:38:12',3),(70,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:27','Desktop','windows','C','2016-01-01 11:38:27',3),(71,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:34','Desktop','windows','C','2016-01-01 11:38:34',3),(72,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:45','Desktop','windows','C','2016-01-01 11:38:45',3),(73,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:55','Desktop','windows','C','2016-01-01 11:38:55',3),(74,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:05','Desktop','windows','C','2016-01-01 11:39:05',3),(75,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:10','Desktop','windows','C','2016-01-01 11:39:10',3),(76,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:17','Desktop','windows','C','2016-01-01 11:39:17',3),(77,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:40:40','Desktop','windows','C','2016-01-01 11:40:40',3),(78,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:40:55','Desktop','windows','C','2016-01-01 11:40:55',3),(79,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:21','Desktop','windows','C','2016-01-01 11:41:21',3),(80,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:34','Desktop','windows','C','2016-01-01 11:41:34',3),(81,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:56','Desktop','windows','C','2016-01-01 11:41:56',3),(82,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:42:51','Desktop','windows','C','2016-01-01 11:42:51',3),(83,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:43:15','Desktop','windows','C','2016-01-01 11:43:15',3),(84,'/rd/detail/12/cumi-kusut-after-updateeeee','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:43:23','Desktop','windows','C','2016-01-01 11:43:23',3),(85,'/rd/detail/12/cumi-kusut-after-updateeeee','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:07','Desktop','windows','C','2016-01-01 11:44:07',3),(86,'/rd/detail/12/cumi-kusut-after-updateeeee','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:38','Desktop','windows','C','2016-01-01 11:44:38',3),(87,'/rd/recipe/recipe_comment/12','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:46','Desktop','windows','C','2016-01-01 11:44:46',3),(88,'/rd/recipe/recipe_comment/12','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:55','Desktop','windows','C','2016-01-01 11:44:55',3),(89,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:45:02','Desktop','windows','C','2016-01-01 11:45:02',3),(90,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:45:20','Desktop','windows','C','2016-01-01 11:45:20',3),(91,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:45:46','Desktop','windows','C','2016-01-01 11:45:46',3),(92,'/rd/recipe/view_recook_item/10','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:45:57','Desktop','windows','C','2016-01-01 11:45:57',3),(93,'/rd/recipe/view_recook_item/9','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:02','Desktop','windows','C','2016-01-01 11:46:02',3),(94,'/rd/recipe/view_recook_item/1','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:06','Desktop','windows','C','2016-01-01 11:46:06',3),(95,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:26','Desktop','windows','C','2016-01-01 11:46:26',3),(96,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:46','Desktop','windows','C','2016-01-01 11:46:46',3),(97,'/rd/detail/1/nasi--goreng-spesial-ayam-kampung','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:54','Desktop','windows','C','2016-01-01 11:46:54',3),(98,'/rd/recipe/my_contest','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:05','Desktop','windows','C','2016-01-01 11:47:05',3),(99,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:12','Desktop','windows','C','2016-01-01 11:47:12',3),(100,'/rd/users/read_notification/102','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:18','Desktop','windows','C','2016-01-01 11:47:18',3),(101,'/rd/recipe/detail/13','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:19','Desktop','windows','C','2016-01-01 11:47:19',3),(102,'/rd/detail/13/cumi-asin','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:20','Desktop','windows','C','2016-01-01 11:47:20',3),(103,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:35','Desktop','windows','C','2016-01-01 11:47:35',3),(104,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:57:54','Desktop','windows','C','2016-01-01 11:57:54',3),(105,'/rd/recipe/edit/15','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:57:57','Desktop','windows','C','2016-01-01 11:57:57',3),(106,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:57:58','Desktop','windows','C','2016-01-01 11:57:58',3),(107,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:57:59','Desktop','windows','C','2016-01-01 11:57:59',3),(108,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:58:00','Desktop','windows','C','2016-01-01 11:58:00',3),(109,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 14:04:01','Desktop','windows','C','2016-01-01 14:04:01',0),(110,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 14:04:13','Desktop','windows','C','2016-01-01 14:04:13',0),(111,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 14:04:21','Desktop','windows','C','2016-01-01 14:04:21',0),(112,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 14:20:18','Desktop','windows','C','2016-01-01 14:20:18',0),(113,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 14:23:43','Desktop','windows','C','2016-01-01 14:23:43',0),(114,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 14:23:48','Desktop','windows','C','2016-01-01 14:23:48',0),(115,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-01 14:23:52','Desktop','windows','C','2016-01-01 14:23:52',0),(116,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:07:46','Desktop','windows','C','2016-01-01 16:07:46',0),(117,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:11:51','Desktop','windows','C','2016-01-01 16:11:51',0),(118,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:12:08','Desktop','windows','C','2016-01-01 16:12:08',0),(119,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:12:20','Desktop','windows','C','2016-01-01 16:12:20',0),(120,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:12:21','Desktop','windows','C','2016-01-01 16:12:21',3),(121,'/rd/detail/15/','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:12:25','Desktop','windows','C','2016-01-01 16:12:25',3),(122,'/rd/detail/15/resep-masak','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:12:27','Desktop','windows','C','2016-01-01 16:12:27',3),(123,'/rd/detail/13/cumi-asin','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:12:44','Desktop','windows','C','2016-01-01 16:12:44',3),(124,'/rd/detail/10/nasi-nasi-an-popo','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:12:51','Desktop','windows','C','2016-01-01 16:12:51',3),(125,'/rd/recipe/find?Sorting=1','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:12:57','Desktop','windows','C','2016-01-01 16:12:57',3),(126,'/rd/detail/15/','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:02','Desktop','windows','C','2016-01-01 16:13:02',3),(127,'/rd/detail/15/resep-masak','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:03','Desktop','windows','C','2016-01-01 16:13:03',3),(128,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:17','Desktop','windows','C','2016-01-01 16:13:17',3),(129,'/rd/detail/1/nasi--goreng-spesial-ayam-kampung','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:22','Desktop','windows','C','2016-01-01 16:13:22',3),(130,'/rd/detail/2/nasi-goreng-udang-spesial','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:27','Desktop','windows','C','2016-01-01 16:13:27',3),(131,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:34','Desktop','windows','C','2016-01-01 16:13:34',3),(132,'/rd/detail/10/nasi-nasi-an-popo','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:41','Desktop','windows','C','2016-01-01 16:13:41',3),(133,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:47','Desktop','windows','C','2016-01-01 16:13:47',3),(134,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:52','Desktop','windows','C','2016-01-01 16:13:52',3),(135,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:54','Desktop','windows','C','2016-01-01 16:13:54',3),(136,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:55','Desktop','windows','C','2016-01-01 16:13:55',3),(137,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:56','Desktop','windows','C','2016-01-01 16:13:56',3),(138,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:57','Desktop','windows','C','2016-01-01 16:13:57',3),(139,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:58','Desktop','windows','C','2016-01-01 16:13:58',3),(140,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:59','Desktop','windows','C','2016-01-01 16:13:59',3),(141,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:00','Desktop','windows','C','2016-01-01 16:14:00',3),(142,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:01','Desktop','windows','C','2016-01-01 16:14:01',3),(143,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:03','Desktop','windows','C','2016-01-01 16:14:03',3),(144,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:04','Desktop','windows','C','2016-01-01 16:14:04',3),(145,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:05','Desktop','windows','C','2016-01-01 16:14:05',3),(146,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:06','Desktop','windows','C','2016-01-01 16:14:06',3),(147,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:07','Desktop','windows','C','2016-01-01 16:14:07',3),(148,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:08','Desktop','windows','C','2016-01-01 16:14:08',3),(149,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:09','Desktop','windows','C','2016-01-01 16:14:09',3),(150,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:10','Desktop','windows','C','2016-01-01 16:14:10',3),(151,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:12','Desktop','windows','C','2016-01-01 16:14:12',3),(152,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:13','Desktop','windows','C','2016-01-01 16:14:13',3),(153,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:14','Desktop','windows','C','2016-01-01 16:14:14',3),(154,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:17:26','Desktop','windows','C','2016-01-01 16:17:26',3),(155,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:17:27','Desktop','windows','C','2016-01-01 16:17:27',3),(156,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:17:28','Desktop','windows','C','2016-01-01 16:17:28',3),(157,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:17:29','Desktop','windows','C','2016-01-01 16:17:29',3),(158,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:17:30','Desktop','windows','C','2016-01-01 16:17:30',3),(159,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:17:56','Desktop','windows','C','2016-01-01 16:17:56',3),(160,'/rd/detail/6/sample','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:18:01','Desktop','windows','C','2016-01-01 16:18:01',3),(161,'/rd/detail/5/ayam-merah','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:18:14','Desktop','windows','C','2016-01-01 16:18:14',3),(162,'/rd/recipe/recook_item/5','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:18:28','Desktop','windows','C','2016-01-01 16:18:28',3),(163,'/rd/users/logout','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:18:38','Desktop','windows','C','2016-01-01 16:18:38',3),(164,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:18:40','Desktop','windows','C','2016-01-01 16:18:40',0),(165,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:18:47','Desktop','windows','C','2016-01-01 16:18:47',0),(166,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:20:22','Desktop','windows','C','2016-01-01 16:20:22',0),(167,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:20:27','Desktop','windows','C','2016-01-01 16:20:27',0),(168,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:21:13','Desktop','windows','C','2016-01-01 16:21:13',0),(169,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:21:18','Desktop','windows','C','2016-01-01 16:21:18',0),(170,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:56:34','Desktop','windows','C','2016-01-01 16:56:34',0),(171,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 07:48:08','Desktop','windows','C','2016-01-02 07:48:08',0),(172,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 07:48:16','Desktop','windows','C','2016-01-02 07:48:16',0),(173,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 07:59:53','Desktop','windows','C','2016-01-02 07:59:53',0),(174,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 07:59:55','Desktop','windows','C','2016-01-02 07:59:55',0),(175,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:00:00','Desktop','windows','C','2016-01-02 08:00:00',0),(176,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:00:01','Desktop','windows','C','2016-01-02 08:00:01',3),(177,'/rd/users/logout','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:00:06','Desktop','windows','C','2016-01-02 08:00:06',3),(178,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:00:07','Desktop','windows','C','2016-01-02 08:00:07',0),(179,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:00:22','Desktop','windows','C','2016-01-02 08:00:22',0),(180,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:00:27','Desktop','windows','C','2016-01-02 08:00:27',0),(181,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:00:28','Desktop','windows','C','2016-01-02 08:00:28',3),(182,'/rd/users/logout','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:00:31','Desktop','windows','C','2016-01-02 08:00:31',3),(183,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:00:32','Desktop','windows','C','2016-01-02 08:00:32',0),(184,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:01:05','Desktop','windows','C','2016-01-02 08:01:05',0),(185,'/rd/detail/13/cumi-asin','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:01:08','Desktop','windows','C','2016-01-02 08:01:08',0),(186,'/rd/recipe/find?Sorting=1','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:01:13','Desktop','windows','C','2016-01-02 08:01:13',0),(187,'/rd/detail/15/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:01:26','Desktop','windows','C','2016-01-02 08:01:26',0),(188,'/rd/detail/15/resep-masak','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:01:27','Desktop','windows','C','2016-01-02 08:01:27',0),(189,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:01:41','Desktop','windows','C','2016-01-02 08:01:41',0),(190,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:01:46','Desktop','windows','C','2016-01-02 08:01:46',0),(191,'/rd/recipe/find?Sorting=1','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:01:47','Desktop','windows','C','2016-01-02 08:01:47',3),(192,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:02:05','Desktop','windows','C','2016-01-02 08:02:05',3),(193,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:05:05','Desktop','windows','C','2016-01-02 08:05:05',3),(194,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:06:09','Desktop','windows','C','2016-01-02 08:06:09',3),(195,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:06:17','Desktop','windows','C','2016-01-02 08:06:17',3),(196,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:07:39','Desktop','windows','C','2016-01-02 08:07:39',3),(197,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:08:56','Desktop','windows','C','2016-01-02 08:08:56',3),(198,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:09:42','Desktop','windows','C','2016-01-02 08:09:42',3),(199,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:10:27','Desktop','windows','C','2016-01-02 08:10:27',3),(200,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:12:25','Desktop','windows','C','2016-01-02 08:12:25',3),(201,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:13:41','Desktop','windows','C','2016-01-02 08:13:41',3),(202,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:14:55','Desktop','windows','C','2016-01-02 08:14:55',3),(203,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:18:53','Desktop','windows','C','2016-01-02 08:18:53',3),(204,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:18:58','Desktop','windows','C','2016-01-02 08:18:58',3),(205,'/rd/users/read_notification/105','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:19:03','Desktop','windows','C','2016-01-02 08:19:03',3),(206,'/rd/recipe/detail/1','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:19:04','Desktop','windows','C','2016-01-02 08:19:04',3),(207,'/rd/recipe/detail/1','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:02','Desktop','windows','C','2016-01-02 08:20:02',3),(208,'/rd/detail/15/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:17','Desktop','windows','C','2016-01-02 08:20:17',3),(209,'/rd/detail/15/resep-masak','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:18','Desktop','windows','C','2016-01-02 08:20:18',3),(210,'/rd/detail/10/nasi-nasi-an-popo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:25','Desktop','windows','C','2016-01-02 08:20:25',3),(211,'/rd/recipe/find?Sorting=1','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:30','Desktop','windows','C','2016-01-02 08:20:30',3),(212,'/rd/recipe/recook_item/14','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:45','Desktop','windows','C','2016-01-02 08:20:45',3),(213,'/rd/ajax/upload_image/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:50','Desktop','windows','C','2016-01-02 08:20:50',3),(214,'/rd/recipe/recook_item/14','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:54','Desktop','windows','C','2016-01-02 08:20:54',3),(215,'/rd/recipe/find?Sorting=1','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:56','Desktop','windows','C','2016-01-02 08:20:56',3),(216,'/rd/detail/14/nasi-goreng-spesial-cookindo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:59','Desktop','windows','C','2016-01-02 08:20:59',3),(217,'/rd/detail/14/nasi-goreng-spesial-cookindo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:21:24','Desktop','windows','C','2016-01-02 08:21:24',3),(218,'/rd/detail/14/nasi-goreng-spesial-cookindo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:21:31','Desktop','windows','C','2016-01-02 08:21:31',3),(219,'/rd/detail/14/nasi-goreng-spesial-cookindo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:23:00','Desktop','windows','C','2016-01-02 08:23:00',3),(220,'/rd/detail/14/nasi-goreng-spesial-cookindo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:24:14','Desktop','windows','C','2016-01-02 08:24:14',3),(221,'/rd/detail/14/nasi-goreng-spesial-cookindo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:27:59','Desktop','windows','C','2016-01-02 08:27:59',3),(222,'/rd/detail/14/nasi-goreng-spesial-cookindo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:31:48','Desktop','windows','C','2016-01-02 08:31:48',3),(223,'/rd/detail/14/nasi-goreng-spesial-cookindo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:31:56','Desktop','windows','C','2016-01-02 08:31:56',3),(224,'/rd/recipe/view_recook_item/4','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:32:29','Desktop','windows','C','2016-01-02 08:32:29',3),(225,'/rd/recipe/view_recook_item/4','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:32:43','Desktop','windows','C','2016-01-02 08:32:43',3),(226,'/rd/recipe/view_recook_item/11','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:32:46','Desktop','windows','C','2016-01-02 08:32:46',3),(227,'/rd/detail/14/nasi-goreng-spesial-cookindo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:35:27','Desktop','windows','C','2016-01-02 08:35:27',3),(228,'/rd/detail/14/nasi-goreng-spesial-cookindo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:35:27','Desktop','windows','C','2016-01-02 08:35:27',3),(229,'/rd/recipe/view_recook_item/11','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:35:29','Desktop','windows','C','2016-01-02 08:35:29',3),(230,'/rd/recipe/view_recook_item/4','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:35:32','Desktop','windows','C','2016-01-02 08:35:32',3),(231,'/rd/users/logout','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:35:39','Desktop','windows','C','2016-01-02 08:35:39',3),(232,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:35:40','Desktop','windows','C','2016-01-02 08:35:40',0),(233,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:35:45','Desktop','windows','C','2016-01-02 08:35:45',0),(234,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:35:55','Desktop','windows','C','2016-01-02 08:35:55',0),(235,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:35:56','Desktop','windows','C','2016-01-02 08:35:56',2),(236,'/rd/users/read_notification/113','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:36:01','Desktop','windows','C','2016-01-02 08:36:01',2),(237,'/rd/recipe/detail/2','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:36:02','Desktop','windows','C','2016-01-02 08:36:02',2),(238,'/rd/users/read_notification/113','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:37:53','Desktop','windows','C','2016-01-02 08:37:53',2),(239,'/rd/recipe/detail/2','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:37:54','Desktop','windows','C','2016-01-02 08:37:54',2),(240,'/rd/recipe/detail/2','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:38:14','Desktop','windows','C','2016-01-02 08:38:14',2),(241,'/rd/users/read_notification/113','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:39:07','Desktop','windows','C','2016-01-02 08:39:07',2),(242,'/rd/users/read_notification/113','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:39:54','Desktop','windows','C','2016-01-02 08:39:54',2),(243,'/rd/recipe/detail/2/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:39:56','Desktop','windows','C','2016-01-02 08:39:56',2),(244,'/rd/recipe/detail/2/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:40:10','Desktop','windows','C','2016-01-02 08:40:10',2),(245,'/rd/users/read_notification/113','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:40:16','Desktop','windows','C','2016-01-02 08:40:16',2),(246,'/rd/recipe/detail/2/-','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:40:17','Desktop','windows','C','2016-01-02 08:40:17',2),(247,'/rd/recipe/detail/2','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:40:29','Desktop','windows','C','2016-01-02 08:40:29',2),(248,'/rd/detail/2','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:40:40','Desktop','windows','C','2016-01-02 08:40:40',2),(249,'/rd/detail/2','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:41:00','Desktop','windows','C','2016-01-02 08:41:00',2),(250,'/rd/detail/2/nasi-goreng-udang-spesial','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:41:01','Desktop','windows','C','2016-01-02 08:41:01',2),(251,'/rd/detail/2/nasi-goreng-udang-spesial','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:44:05','Desktop','windows','C','2016-01-02 08:44:05',2),(252,'/rd/recipe/find?FoodTypeID=1&FoodTypeID%5B%5D=1&keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:44:31','Desktop','windows','C','2016-01-02 08:44:31',2),(253,'/rd/detail/11/nasi-apa-aja-deh','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:44:37','Desktop','windows','C','2016-01-02 08:44:37',2),(254,'/rd/recipe/cookmark_item/11/1','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:44:40','Desktop','windows','C','2016-01-02 08:44:40',2),(255,'/rd/recipe/recook_item/11','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:44:42','Desktop','windows','C','2016-01-02 08:44:42',2),(256,'/rd/detail/11/nasi-apa-aja-deh','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:06:36','Desktop','windows','C','2016-01-02 09:06:36',2),(257,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:06:39','Desktop','windows','C','2016-01-02 09:06:39',2),(258,'/rd/users/logout','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:06:44','Desktop','windows','C','2016-01-02 09:06:44',2),(259,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:06:45','Desktop','windows','C','2016-01-02 09:06:45',0),(260,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:06:47','Desktop','windows','C','2016-01-02 09:06:47',0),(261,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:06:50','Desktop','windows','C','2016-01-02 09:06:50',0),(262,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:07:08','Desktop','windows','C','2016-01-02 09:07:08',0),(263,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:07:10','Desktop','windows','C','2016-01-02 09:07:10',0),(264,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:13:28','Desktop','windows','C','2016-01-02 09:13:28',0),(265,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:13:31','Desktop','windows','C','2016-01-02 09:13:31',0),(266,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:16:14','Desktop','windows','C','2016-01-02 09:16:14',0),(267,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:16:16','Desktop','windows','C','2016-01-02 09:16:16',0),(268,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:16:45','Desktop','windows','C','2016-01-02 09:16:45',0),(269,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:16:48','Desktop','windows','C','2016-01-02 09:16:48',0),(270,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:16:51','Desktop','windows','C','2016-01-02 09:16:51',0),(271,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:20:35','Desktop','windows','C','2016-01-02 09:20:35',0),(272,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:20:38','Desktop','windows','C','2016-01-02 09:20:38',0),(273,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:20:41','Desktop','windows','C','2016-01-02 09:20:41',0),(274,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:21:50','Desktop','windows','C','2016-01-02 09:21:50',0),(275,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:21:52','Desktop','windows','C','2016-01-02 09:21:52',0),(276,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:24:26','Desktop','windows','C','2016-01-02 09:24:26',0),(277,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:24:29','Desktop','windows','C','2016-01-02 09:24:29',0),(278,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:24:34','Desktop','windows','C','2016-01-02 09:24:34',0),(279,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:24:36','Desktop','windows','C','2016-01-02 09:24:36',0),(280,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:08','Desktop','windows','C','2016-01-02 09:25:08',0),(281,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:11','Desktop','windows','C','2016-01-02 09:25:11',0),(282,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:12','Desktop','windows','C','2016-01-02 09:25:12',0),(283,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:20','Desktop','windows','C','2016-01-02 09:25:20',0),(284,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:22','Desktop','windows','C','2016-01-02 09:25:22',0),(285,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:30','Desktop','windows','C','2016-01-02 09:25:30',0),(286,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:32','Desktop','windows','C','2016-01-02 09:25:32',0),(287,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:50','Desktop','windows','C','2016-01-02 09:25:50',0),(288,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:52','Desktop','windows','C','2016-01-02 09:25:52',0),(289,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:59','Desktop','windows','C','2016-01-02 09:25:59',0),(290,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:26:01','Desktop','windows','C','2016-01-02 09:26:01',0),(291,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:26:06','Desktop','windows','C','2016-01-02 09:26:06',0),(292,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:26:07','Desktop','windows','C','2016-01-02 09:26:07',0),(293,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:26:12','Desktop','windows','C','2016-01-02 09:26:12',0),(294,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:26:14','Desktop','windows','C','2016-01-02 09:26:14',0),(295,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:26:21','Desktop','windows','C','2016-01-02 09:26:21',0),(296,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:26:23','Desktop','windows','C','2016-01-02 09:26:23',0),(297,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:26:34','Desktop','windows','C','2016-01-02 09:26:34',0),(298,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:27:05','Desktop','windows','C','2016-01-02 09:27:05',0),(299,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:27:34','Desktop','windows','C','2016-01-02 09:27:34',0),(300,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:27:37','Desktop','windows','C','2016-01-02 09:27:37',0),(301,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:27:50','Desktop','windows','C','2016-01-02 09:27:50',0),(302,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:27:52','Desktop','windows','C','2016-01-02 09:27:52',0),(303,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:29:25','Desktop','windows','C','2016-01-02 09:29:25',0),(304,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:29:27','Desktop','windows','C','2016-01-02 09:29:27',0),(305,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:29:45','Desktop','windows','C','2016-01-02 09:29:45',0),(306,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:29:52','Desktop','windows','C','2016-01-02 09:29:52',0),(307,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:29:56','Desktop','windows','C','2016-01-02 09:29:56',0),(308,'/rd/users/register','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:30:00','Desktop','windows','C','2016-01-02 09:30:00',0),(309,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:30:02','Desktop','windows','C','2016-01-02 09:30:02',0),(310,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:30:07','Desktop','windows','C','2016-01-02 09:30:07',0),(311,'/rd/detail/14/nasi-goreng-spesial-cookindo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:53:50','Desktop','windows','C','2016-01-02 09:53:50',0),(312,'/rd/detail/14/nasi-goreng-spesial-cookindo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:56:01','Desktop','windows','C','2016-01-02 09:56:01',0),(313,'/rd/recipe/find?keyword=recipe+enak','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:56:17','Desktop','windows','C','2016-01-02 09:56:17',0),(314,'/rd/detail/4/recipe-enak-yuhu','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:56:20','Desktop','windows','C','2016-01-02 09:56:20',0),(315,'/rd/detail/4/recipe-enak-yuhu','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:57:59','Desktop','windows','C','2016-01-02 09:57:59',0),(316,'/rd/detail/4/recipe-enak-yuhu','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:58:57','Desktop','windows','C','2016-01-02 09:58:57',0),(317,'/rd/detail/4/recipe-enak-yuhu','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:59:10','Desktop','windows','C','2016-01-02 09:59:10',0),(318,'/rd/detail/4/recipe-enak-yuhu','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:59:14','Desktop','windows','C','2016-01-02 09:59:14',0),(319,'/rd/detail/4/recipe-enak-yuhu','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:00:53','Desktop','windows','C','2016-01-02 10:00:53',0),(320,'/rd/detail/4/recipe-enak-yuhu','Apple Safari','Apple Safari','192.168.1.101','2016-01-02 10:01:33','Mobile','mac','C','2016-01-02 10:01:33',0),(321,'/rd/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:03:48','Mobile','linux','C','2016-01-02 10:03:48',0),(322,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:04:06','Desktop','windows','C','2016-01-02 10:04:06',0),(323,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:04:20','Desktop','windows','C','2016-01-02 10:04:20',0),(324,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:04:30','Desktop','windows','C','2016-01-02 10:04:30',0),(325,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:04:31','Desktop','windows','C','2016-01-02 10:04:31',3),(326,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:04:46','Desktop','windows','C','2016-01-02 10:04:46',3),(327,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:04:58','Desktop','windows','C','2016-01-02 10:04:58',3),(328,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:05:08','Desktop','windows','C','2016-01-02 10:05:08',3),(329,'/rd/recipe/my_contest','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:05:27','Desktop','windows','C','2016-01-02 10:05:27',3),(330,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:05:32','Desktop','windows','C','2016-01-02 10:05:32',3),(331,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:11:42','Desktop','windows','C','2016-01-02 10:11:42',3),(332,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:13:21','Desktop','windows','C','2016-01-02 10:13:21',3),(333,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:13:42','Desktop','windows','C','2016-01-02 10:13:42',3),(334,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:14:47','Desktop','windows','C','2016-01-02 10:14:47',3),(335,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:16:29','Desktop','windows','C','2016-01-02 10:16:29',3),(336,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:18:10','Desktop','windows','C','2016-01-02 10:18:10',3),(337,'/rd/users/','Apple Safari','Apple Safari','192.168.1.101','2016-01-02 10:20:44','Mobile','mac','C','2016-01-02 10:20:44',0),(338,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:21:11','Desktop','windows','C','2016-01-02 10:21:11',0),(339,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:21:16','Desktop','windows','C','2016-01-02 10:21:16',0),(340,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:21:17','Desktop','windows','C','2016-01-02 10:21:17',3),(341,'/rd/users/logout','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:23:12','Desktop','windows','C','2016-01-02 10:23:12',3),(342,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:23:13','Desktop','windows','C','2016-01-02 10:23:13',0),(343,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:23:16','Desktop','windows','C','2016-01-02 10:23:16',0),(344,'/rd/pages','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:24:32','Desktop','windows','C','2016-01-02 10:24:32',0),(345,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:24:37','Desktop','windows','C','2016-01-02 10:24:37',0),(346,'/rd/users/register','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:25:32','Desktop','windows','C','2016-01-02 10:25:32',0),(347,'/rd/recipe/find?Sorting=1','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:25:42','Desktop','windows','C','2016-01-02 10:25:42',0),(348,'/rd/recipe/find?Sorting=1','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:27:27','Desktop','windows','C','2016-01-02 10:27:27',0),(349,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:27:53','Desktop','windows','C','2016-01-02 10:27:53',0),(350,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:27:58','Desktop','windows','C','2016-01-02 10:27:58',0),(351,'/rd/recipe/find?Sorting=1','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:27:59','Desktop','windows','C','2016-01-02 10:27:59',3),(352,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:28:04','Desktop','windows','C','2016-01-02 10:28:04',3),(353,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:30:17','Desktop','windows','C','2016-01-02 10:30:17',3),(354,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:30:27','Desktop','windows','C','2016-01-02 10:30:27',3),(355,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:30:59','Desktop','windows','C','2016-01-02 10:30:59',3),(356,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:32:47','Desktop','windows','C','2016-01-02 10:32:47',3),(357,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:34:38','Desktop','windows','C','2016-01-02 10:34:38',3),(358,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:35:29','Desktop','windows','C','2016-01-02 10:35:29',3),(359,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:36:33','Desktop','windows','C','2016-01-02 10:36:33',3),(360,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:38:17','Desktop','windows','C','2016-01-02 10:38:17',3),(361,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:40:22','Desktop','windows','C','2016-01-02 10:40:22',3),(362,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:40:30','Desktop','windows','C','2016-01-02 10:40:30',3),(363,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:40:41','Desktop','windows','C','2016-01-02 10:40:41',3),(364,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:41:42','Desktop','windows','C','2016-01-02 10:41:42',3),(365,'/rd/ajax/upload_image/users','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:42:22','Desktop','windows','C','2016-01-02 10:42:22',3),(366,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:43:35','Desktop','windows','C','2016-01-02 10:43:35',3),(367,'/rd/ajax/upload_image/users','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:44:01','Desktop','windows','C','2016-01-02 10:44:01',3),(368,'/rd/users/update_photo','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:44:15','Desktop','windows','C','2016-01-02 10:44:15',3),(369,'/rd/users/','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:44:17','Desktop','windows','C','2016-01-02 10:44:17',3),(370,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:45:05','Desktop','windows','C','2016-01-02 10:45:05',3),(371,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:45:07','Desktop','windows','C','2016-01-02 10:45:07',3),(372,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:45:08','Desktop','windows','C','2016-01-02 10:45:08',3),(373,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:45:30','Desktop','windows','C','2016-01-02 10:45:30',3),(374,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:45:31','Desktop','windows','C','2016-01-02 10:45:31',3),(375,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:45:32','Desktop','windows','C','2016-01-02 10:45:32',3),(376,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:47:08','Desktop','windows','C','2016-01-02 10:47:08',3),(377,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:47:09','Desktop','windows','C','2016-01-02 10:47:09',3),(378,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:47:10','Desktop','windows','C','2016-01-02 10:47:10',3),(379,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:48:57','Desktop','windows','C','2016-01-02 10:48:57',3),(380,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:48:58','Desktop','windows','C','2016-01-02 10:48:58',3),(381,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:49:00','Desktop','windows','C','2016-01-02 10:49:00',3),(382,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:51:31','Desktop','windows','C','2016-01-02 10:51:31',3),(383,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:51:32','Desktop','windows','C','2016-01-02 10:51:32',3),(384,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:51:33','Desktop','windows','C','2016-01-02 10:51:33',3),(385,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:52:28','Desktop','windows','C','2016-01-02 10:52:28',3),(386,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:52:30','Desktop','windows','C','2016-01-02 10:52:30',3),(387,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:52:31','Desktop','windows','C','2016-01-02 10:52:31',3),(388,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:52:36','Desktop','windows','C','2016-01-02 10:52:36',3),(389,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:52:38','Desktop','windows','C','2016-01-02 10:52:38',3),(390,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:52:39','Desktop','windows','C','2016-01-02 10:52:39',3),(391,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:52:45','Desktop','windows','C','2016-01-02 10:52:45',3),(392,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:52:47','Desktop','windows','C','2016-01-02 10:52:47',3),(393,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:52:48','Desktop','windows','C','2016-01-02 10:52:48',3),(394,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:54:42','Desktop','windows','C','2016-01-02 10:54:42',3),(395,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:54:43','Desktop','windows','C','2016-01-02 10:54:43',3),(396,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:54:44','Desktop','windows','C','2016-01-02 10:54:44',3),(397,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:55:04','Desktop','windows','C','2016-01-02 10:55:04',3),(398,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:55:06','Desktop','windows','C','2016-01-02 10:55:06',3),(399,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:55:07','Desktop','windows','C','2016-01-02 10:55:07',3),(400,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:55:50','Desktop','windows','C','2016-01-02 10:55:50',3),(401,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:55:52','Desktop','windows','C','2016-01-02 10:55:52',3),(402,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:55:53','Desktop','windows','C','2016-01-02 10:55:53',3),(403,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:56:51','Desktop','windows','C','2016-01-02 10:56:51',3),(404,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:56:52','Desktop','windows','C','2016-01-02 10:56:52',3),(405,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:56:54','Desktop','windows','C','2016-01-02 10:56:54',3),(406,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:58:03','Desktop','windows','C','2016-01-02 10:58:03',3),(407,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:58:05','Desktop','windows','C','2016-01-02 10:58:05',3),(408,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:58:06','Desktop','windows','C','2016-01-02 10:58:06',3),(409,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:58:55','Desktop','windows','C','2016-01-02 10:58:55',3),(410,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:58:56','Desktop','windows','C','2016-01-02 10:58:56',3),(411,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:58:57','Desktop','windows','C','2016-01-02 10:58:57',3),(412,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:59:00','Desktop','windows','C','2016-01-02 10:59:00',3),(413,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:59:01','Desktop','windows','C','2016-01-02 10:59:01',3),(414,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:59:03','Desktop','windows','C','2016-01-02 10:59:03',3),(415,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:00:23','Desktop','windows','C','2016-01-02 11:00:23',3),(416,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:00:25','Desktop','windows','C','2016-01-02 11:00:25',3),(417,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:00:26','Desktop','windows','C','2016-01-02 11:00:26',3),(418,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:01:49','Desktop','windows','C','2016-01-02 11:01:49',3),(419,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:01:50','Desktop','windows','C','2016-01-02 11:01:50',3),(420,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:01:51','Desktop','windows','C','2016-01-02 11:01:51',3),(421,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:01:59','Desktop','windows','C','2016-01-02 11:01:59',3),(422,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:02:00','Desktop','windows','C','2016-01-02 11:02:00',3),(423,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:02:01','Desktop','windows','C','2016-01-02 11:02:01',3),(424,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:02:17','Desktop','windows','C','2016-01-02 11:02:17',3),(425,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:02:19','Desktop','windows','C','2016-01-02 11:02:19',3),(426,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:02:20','Desktop','windows','C','2016-01-02 11:02:20',3),(427,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:04:17','Desktop','windows','C','2016-01-02 11:04:17',3),(428,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:04:18','Desktop','windows','C','2016-01-02 11:04:18',3),(429,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:04:20','Desktop','windows','C','2016-01-02 11:04:20',3),(430,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:04:52','Desktop','windows','C','2016-01-02 11:04:52',3),(431,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:04:54','Desktop','windows','C','2016-01-02 11:04:54',3),(432,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:04:55','Desktop','windows','C','2016-01-02 11:04:55',3),(433,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:05:04','Desktop','windows','C','2016-01-02 11:05:04',3),(434,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:05:06','Desktop','windows','C','2016-01-02 11:05:06',3),(435,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:05:07','Desktop','windows','C','2016-01-02 11:05:07',3),(436,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:05:22','Desktop','windows','C','2016-01-02 11:05:22',3),(437,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:05:23','Desktop','windows','C','2016-01-02 11:05:23',3),(438,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:05:24','Desktop','windows','C','2016-01-02 11:05:24',3),(439,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:07:26','Desktop','windows','C','2016-01-02 11:07:26',3),(440,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:07:28','Desktop','windows','C','2016-01-02 11:07:28',3),(441,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:07:29','Desktop','windows','C','2016-01-02 11:07:29',3),(442,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:08:06','Desktop','windows','C','2016-01-02 11:08:06',3),(443,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:08:07','Desktop','windows','C','2016-01-02 11:08:07',3),(444,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:08:08','Desktop','windows','C','2016-01-02 11:08:08',3),(445,'/rd/recipe/my_contest','Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:08:20','Desktop','windows','C','2016-01-02 11:08:20',3),(446,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:20:54','Desktop','windows','C','2016-01-02 12:20:54',3),(447,'/rd/users/logout','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:24:06','Desktop','windows','C','2016-01-02 12:24:06',3),(448,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:24:07','Desktop','windows','C','2016-01-02 12:24:07',0),(449,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:24:13','Desktop','windows','C','2016-01-02 12:24:13',0),(450,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:25:19','Desktop','windows','C','2016-01-02 12:25:19',0),(451,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:26:55','Desktop','windows','C','2016-01-02 12:26:55',0),(452,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:32:00','Desktop','windows','C','2016-01-02 12:32:00',0),(453,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:32:32','Desktop','windows','C','2016-01-02 12:32:32',0),(454,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:32:48','Desktop','windows','C','2016-01-02 12:32:48',0),(455,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:33:09','Desktop','windows','C','2016-01-02 12:33:09',0),(456,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:33:24','Desktop','windows','C','2016-01-02 12:33:24',0),(457,'/rd/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:35:04','Mobile','mac','C','2016-01-02 12:35:04',0),(458,'/rd/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:36:27','Mobile','mac','C','2016-01-02 12:36:27',0),(459,'/rd/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:37:01','Mobile','mac','C','2016-01-02 12:37:01',0),(460,'/rd/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:37:49','Mobile','mac','C','2016-01-02 12:37:49',0),(461,'/rd/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:38:36','Mobile','mac','C','2016-01-02 12:38:36',0),(462,'/rd/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:40:30','Mobile','mac','C','2016-01-02 12:40:30',0),(463,'/rd/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:41:16','Mobile','mac','C','2016-01-02 12:41:16',0),(464,'/rd/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:41:57','Mobile','mac','C','2016-01-02 12:41:57',0),(465,'/rd/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:42:47','Mobile','mac','C','2016-01-02 12:42:47',0),(466,'/rd/recipe/find?keyword=','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:43:12','Mobile','mac','C','2016-01-02 12:43:12',0),(467,'/rd/recipe/find?keyword=','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:44:35','Mobile','mac','C','2016-01-02 12:44:35',0),(468,'/rd/recipe/find?keyword=','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:45:05','Mobile','mac','C','2016-01-02 12:45:05',0),(469,'/rd/recipe/find?keyword=','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:47:37','Mobile','mac','C','2016-01-02 12:47:37',0),(470,'/rd/recipe/find?keyword=','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:48:21','Mobile','mac','C','2016-01-02 12:48:21',0),(471,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:48:41','Desktop','windows','C','2016-01-02 12:48:41',0),(472,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:49:27','Desktop','windows','C','2016-01-02 12:49:27',0),(473,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:49:38','Desktop','windows','C','2016-01-02 12:49:38',0),(474,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:49:53','Desktop','windows','C','2016-01-02 12:49:53',0),(475,'/rd/users/login','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:51:32','Mobile','mac','C','2016-01-02 12:51:32',0),(476,'/rd/users/login','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:51:37','Mobile','mac','C','2016-01-02 12:51:37',0),(477,'/rd/recipe/find?keyword=','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:51:39','Mobile','mac','C','2016-01-02 12:51:39',3),(478,'/rd/recipe/recook','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:51:42','Mobile','mac','C','2016-01-02 12:51:42',3),(479,'/rd/recipe/cookmark','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:51:49','Mobile','mac','C','2016-01-02 12:51:49',3),(480,'/rd/recipe/cookmark','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:52:03','Mobile','mac','C','2016-01-02 12:52:03',3),(481,'/rd/recipe/cookmark','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:52:10','Mobile','mac','C','2016-01-02 12:52:10',3),(482,'/rd/recipe/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:52:13','Mobile','mac','C','2016-01-02 12:52:13',3),(483,'/rd/recipe/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:52:16','Mobile','mac','C','2016-01-02 12:52:16',3),(484,'/rd/recipe/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:54:23','Mobile','mac','C','2016-01-02 12:54:23',3),(485,'/rd/recipe/recook','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:54:44','Mobile','mac','C','2016-01-02 12:54:44',3),(486,'/rd/recipe/cookmark','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:54:54','Mobile','mac','C','2016-01-02 12:54:54',3),(487,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:55:21','Desktop','windows','C','2016-01-02 12:55:21',0),(488,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:55:26','Desktop','windows','C','2016-01-02 12:55:26',0),(489,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:55:31','Desktop','windows','C','2016-01-02 12:55:31',0),(490,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:55:33','Desktop','windows','C','2016-01-02 12:55:33',3),(491,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:55:54','Desktop','windows','C','2016-01-02 12:55:54',3),(492,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:55:58','Desktop','windows','C','2016-01-02 12:55:58',3),(493,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:56:27','Desktop','windows','C','2016-01-02 12:56:27',3),(494,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:56:33','Desktop','windows','C','2016-01-02 12:56:33',3),(495,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:59:11','Desktop','windows','C','2016-01-02 12:59:11',3),(496,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:01:19','Desktop','windows','C','2016-01-02 13:01:19',3),(497,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:01:59','Mobile','linux','C','2016-01-02 13:01:59',0),(498,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:02:07','Mobile','linux','C','2016-01-02 13:02:07',0),(499,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:02:11','Mobile','linux','C','2016-01-02 13:02:11',0),(500,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:02:12','Mobile','linux','C','2016-01-02 13:02:12',3),(501,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:02:21','Mobile','linux','C','2016-01-02 13:02:21',3),(502,'/rd/recipe/recook','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:02:34','Mobile','mac','C','2016-01-02 13:02:34',0),(503,'/rd/users/login','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:02:37','Mobile','mac','C','2016-01-02 13:02:37',0),(504,'/rd/users/login','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:02:42','Mobile','mac','C','2016-01-02 13:02:42',0),(505,'/rd/recipe/recook','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:02:43','Mobile','mac','C','2016-01-02 13:02:43',3),(506,'/rd/recipe/recook','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:02:55','Mobile','mac','C','2016-01-02 13:02:55',3),(507,'/rd/recipe/recook','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:03:03','Mobile','mac','C','2016-01-02 13:03:03',3),(508,'/rd/recipe/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:03:07','Mobile','mac','C','2016-01-02 13:03:07',3),(509,'/rd/recipe/cookmark','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:03:12','Mobile','mac','C','2016-01-02 13:03:12',3),(510,'/rd/recipe/recook','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:03:19','Mobile','mac','C','2016-01-02 13:03:19',3),(511,'/rd/recipe/find?keyword=','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:03:41','Mobile','mac','C','2016-01-02 13:03:41',3),(512,'/rd/recipe/find/2/?keyword=','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:03:52','Mobile','mac','C','2016-01-02 13:03:52',3),(513,'/rd/users/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:04:13','Mobile','mac','C','2016-01-02 13:04:13',3),(514,'/rd/','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:04:43','Mobile','mac','C','2016-01-02 13:04:43',3),(515,'/rd/users/read_notification/116','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:05:48','Desktop','windows','C','2016-01-02 13:05:48',0),(516,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:06:37','Desktop','windows','C','2016-01-02 13:06:37',0),(517,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:11:31','Desktop','windows','C','2016-01-02 13:11:31',0),(518,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:11:35','Desktop','windows','C','2016-01-02 13:11:35',0),(519,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:11:36','Desktop','windows','C','2016-01-02 13:11:36',3),(520,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:11:47','Desktop','windows','C','2016-01-02 13:11:47',3),(521,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:11:49','Desktop','windows','C','2016-01-02 13:11:49',3),(522,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:11:50','Desktop','windows','C','2016-01-02 13:11:50',3),(523,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:16:31','Desktop','windows','C','2016-01-02 13:16:31',3),(524,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:16:32','Desktop','windows','C','2016-01-02 13:16:32',3),(525,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:16:34','Desktop','windows','C','2016-01-02 13:16:34',3),(526,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:17:33','Desktop','windows','C','2016-01-02 13:17:33',3),(527,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:17:35','Desktop','windows','C','2016-01-02 13:17:35',3),(528,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:17:36','Desktop','windows','C','2016-01-02 13:17:36',3),(529,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:19:25','Desktop','windows','C','2016-01-02 13:19:25',3),(530,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:19:27','Desktop','windows','C','2016-01-02 13:19:27',3),(531,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:19:28','Desktop','windows','C','2016-01-02 13:19:28',3),(532,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:21:06','Desktop','windows','C','2016-01-02 13:21:06',3),(533,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:21:07','Desktop','windows','C','2016-01-02 13:21:07',3),(534,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:21:08','Desktop','windows','C','2016-01-02 13:21:08',3),(535,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:21:30','Desktop','windows','C','2016-01-02 13:21:30',3),(536,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:21:32','Desktop','windows','C','2016-01-02 13:21:32',3),(537,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:21:33','Desktop','windows','C','2016-01-02 13:21:33',3),(538,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:22:19','Desktop','windows','C','2016-01-02 13:22:19',3),(539,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:22:21','Desktop','windows','C','2016-01-02 13:22:21',3),(540,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:22:22','Desktop','windows','C','2016-01-02 13:22:22',3),(541,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:23:08','Desktop','windows','C','2016-01-02 13:23:08',3),(542,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:23:10','Desktop','windows','C','2016-01-02 13:23:10',3),(543,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:23:11','Desktop','windows','C','2016-01-02 13:23:11',3),(544,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:24:22','Desktop','windows','C','2016-01-02 13:24:22',3),(545,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:24:24','Desktop','windows','C','2016-01-02 13:24:24',3),(546,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:24:25','Desktop','windows','C','2016-01-02 13:24:25',3),(547,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:24:56','Desktop','windows','C','2016-01-02 13:24:56',3),(548,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:24:57','Desktop','windows','C','2016-01-02 13:24:57',3),(549,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:24:58','Desktop','windows','C','2016-01-02 13:24:58',3),(550,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:25:16','Desktop','windows','C','2016-01-02 13:25:16',3),(551,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:25:18','Desktop','windows','C','2016-01-02 13:25:18',3),(552,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:25:19','Desktop','windows','C','2016-01-02 13:25:19',3),(553,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:25:42','Desktop','windows','C','2016-01-02 13:25:42',3),(554,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:25:44','Desktop','windows','C','2016-01-02 13:25:44',3),(555,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:25:45','Desktop','windows','C','2016-01-02 13:25:45',3),(556,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:27:29','Desktop','windows','C','2016-01-02 13:27:29',3),(557,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:27:31','Desktop','windows','C','2016-01-02 13:27:31',3),(558,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:27:32','Desktop','windows','C','2016-01-02 13:27:32',3),(559,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:27:42','Desktop','windows','C','2016-01-02 13:27:42',3),(560,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:27:43','Desktop','windows','C','2016-01-02 13:27:43',3),(561,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:27:45','Desktop','windows','C','2016-01-02 13:27:45',3),(562,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:28:10','Desktop','windows','C','2016-01-02 13:28:10',3),(563,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:28:11','Desktop','windows','C','2016-01-02 13:28:11',3),(564,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:28:12','Desktop','windows','C','2016-01-02 13:28:12',3),(565,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:28:25','Desktop','windows','C','2016-01-02 13:28:25',3),(566,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:28:27','Desktop','windows','C','2016-01-02 13:28:27',3),(567,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:28:28','Desktop','windows','C','2016-01-02 13:28:28',3),(568,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:29:12','Desktop','windows','C','2016-01-02 13:29:12',3),(569,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:29:14','Desktop','windows','C','2016-01-02 13:29:14',3),(570,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:29:15','Desktop','windows','C','2016-01-02 13:29:15',3),(571,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:30:55','Desktop','windows','C','2016-01-02 13:30:55',3),(572,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:30:57','Desktop','windows','C','2016-01-02 13:30:57',3),(573,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:30:58','Desktop','windows','C','2016-01-02 13:30:58',3),(574,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:31:16','Desktop','windows','C','2016-01-02 13:31:16',3),(575,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:31:18','Desktop','windows','C','2016-01-02 13:31:18',3),(576,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:31:19','Desktop','windows','C','2016-01-02 13:31:19',3),(577,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:32:34','Desktop','windows','C','2016-01-02 13:32:34',3),(578,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:32:36','Desktop','windows','C','2016-01-02 13:32:36',3),(579,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:32:37','Desktop','windows','C','2016-01-02 13:32:37',3),(580,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:24','Desktop','windows','C','2016-01-02 13:33:24',3),(581,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:25','Desktop','windows','C','2016-01-02 13:33:25',3),(582,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:26','Desktop','windows','C','2016-01-02 13:33:26',3),(583,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:42','Desktop','windows','C','2016-01-02 13:33:42',3),(584,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:44','Desktop','windows','C','2016-01-02 13:33:44',3),(585,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:45','Desktop','windows','C','2016-01-02 13:33:45',3),(586,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:49','Desktop','windows','C','2016-01-02 13:33:49',3),(587,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:51','Desktop','windows','C','2016-01-02 13:33:51',3),(588,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:52','Desktop','windows','C','2016-01-02 13:33:52',3),(589,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:54','Desktop','windows','C','2016-01-02 13:33:54',3),(590,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:56','Desktop','windows','C','2016-01-02 13:33:56',3),(591,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:57','Desktop','windows','C','2016-01-02 13:33:57',3),(592,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:34:31','Desktop','windows','C','2016-01-02 13:34:31',3),(593,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:34:32','Desktop','windows','C','2016-01-02 13:34:32',3),(594,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:34:33','Desktop','windows','C','2016-01-02 13:34:33',3),(595,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:34:46','Desktop','windows','C','2016-01-02 13:34:46',3),(596,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:34:48','Desktop','windows','C','2016-01-02 13:34:48',3),(597,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:34:49','Desktop','windows','C','2016-01-02 13:34:49',3),(598,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:35:30','Desktop','windows','C','2016-01-02 13:35:30',3),(599,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:35:40','Desktop','windows','C','2016-01-02 13:35:40',3),(600,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:35:43','Desktop','windows','C','2016-01-02 13:35:43',3),(601,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:35:55','Desktop','windows','C','2016-01-02 13:35:55',3),(602,'/rd/recipe/my_contest','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:36:00','Desktop','windows','C','2016-01-02 13:36:00',3),(603,'/rd/users/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:36:05','Desktop','windows','C','2016-01-02 13:36:05',3),(604,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:40:05','Desktop','windows','C','2016-01-02 13:40:05',3),(605,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:44:55','Desktop','windows','C','2016-01-02 13:44:55',3),(606,'/rd/users/logout','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:45:21','Desktop','windows','C','2016-01-02 13:45:21',3),(607,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:45:22','Desktop','windows','C','2016-01-02 13:45:22',0),(608,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:45:25','Desktop','windows','C','2016-01-02 13:45:25',0),(609,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:45:33','Desktop','windows','C','2016-01-02 13:45:33',0),(610,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:45:43','Desktop','windows','C','2016-01-02 13:45:43',0),(611,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:45:44','Desktop','windows','C','2016-01-02 13:45:44',1),(612,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:45:50','Desktop','windows','C','2016-01-02 13:45:50',1),(613,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:09:02','Desktop','windows','C','2016-01-02 14:09:02',1),(614,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:09:04','Desktop','windows','C','2016-01-02 14:09:04',1),(615,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:09:05','Desktop','windows','C','2016-01-02 14:09:05',1),(616,'/rd/users/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:13:20','Desktop','windows','C','2016-01-02 14:13:20',1),(617,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:17:41','Desktop','windows','C','2016-01-02 14:17:41',1),(618,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:17:42','Desktop','windows','C','2016-01-02 14:17:42',1),(619,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:17:43','Desktop','windows','C','2016-01-02 14:17:43',1),(620,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:20:01','Desktop','windows','C','2016-01-02 14:20:01',1),(621,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:21:45','Desktop','windows','C','2016-01-02 14:21:45',1),(622,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:21:49','Desktop','windows','C','2016-01-02 14:21:49',1),(623,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:21:51','Desktop','windows','C','2016-01-02 14:21:51',1),(624,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:21:52','Desktop','windows','C','2016-01-02 14:21:52',1),(625,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:21:54','Desktop','windows','C','2016-01-02 14:21:54',1),(626,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:22:17','Desktop','windows','C','2016-01-02 14:22:17',1),(627,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:23:11','Desktop','windows','C','2016-01-02 14:23:11',1),(628,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:23:41','Desktop','windows','C','2016-01-02 14:23:41',1),(629,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:24:19','Desktop','windows','C','2016-01-02 14:24:19',1),(630,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:24:25','Desktop','windows','C','2016-01-02 14:24:25',1),(631,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:33:05','Desktop','windows','C','2016-01-02 14:33:05',1),(632,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:33:18','Desktop','windows','C','2016-01-02 14:33:18',1),(633,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:33:19','Desktop','windows','C','2016-01-02 14:33:19',1),(634,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:25:55','Desktop','windows','C','2016-01-02 17:25:55',0),(635,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:26:05','Desktop','windows','C','2016-01-02 17:26:05',0),(636,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:26:57','Desktop','windows','C','2016-01-02 17:26:57',0),(637,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:27:48','Desktop','windows','C','2016-01-02 17:27:48',0),(638,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:28:06','Desktop','windows','C','2016-01-02 17:28:06',0),(639,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:29:35','Desktop','windows','C','2016-01-02 17:29:35',0),(640,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:32:39','Desktop','windows','C','2016-01-02 17:32:39',0),(641,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:33:02','Desktop','windows','C','2016-01-02 17:33:02',0),(642,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:35:06','Desktop','windows','C','2016-01-02 17:35:06',0),(643,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:35:11','Desktop','windows','C','2016-01-02 17:35:11',0),(644,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:35:32','Desktop','windows','C','2016-01-02 17:35:32',0),(645,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:36:01','Desktop','windows','C','2016-01-02 17:36:01',0),(646,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:36:21','Desktop','windows','C','2016-01-02 17:36:21',0),(647,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:37:03','Desktop','windows','C','2016-01-02 17:37:03',0),(648,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:37:10','Desktop','windows','C','2016-01-02 17:37:10',0),(649,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:38:53','Desktop','windows','C','2016-01-02 17:38:53',0),(650,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:39:16','Desktop','windows','C','2016-01-02 17:39:16',0),(651,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:40:38','Desktop','windows','C','2016-01-02 17:40:38',0),(652,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:45:26','Desktop','windows','C','2016-01-02 17:45:26',0),(653,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:45:42','Desktop','windows','C','2016-01-02 17:45:42',0),(654,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:45:43','Desktop','windows','C','2016-01-02 17:45:43',0),(655,'/rd/ajax/upload_image_article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:45:48','Desktop','windows','C','2016-01-02 17:45:48',0),(656,'/rd/ajax/upload_image_article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:46:16','Desktop','windows','C','2016-01-02 17:46:16',0),(657,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:48:31','Desktop','windows','C','2016-01-02 17:48:31',0),(658,'/rd/ajax/upload_image_article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:48:36','Desktop','windows','C','2016-01-02 17:48:36',0),(659,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:49:32','Desktop','windows','C','2016-01-02 17:49:32',0),(660,'/rd/ajax/upload_image_article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:49:44','Desktop','windows','C','2016-01-02 17:49:44',0),(661,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:50:55','Desktop','windows','C','2016-01-02 17:50:55',0),(662,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:52:48','Desktop','windows','C','2016-01-02 17:52:48',0),(663,'/rd/ajax/upload_image_article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:52:52','Desktop','windows','C','2016-01-02 17:52:52',0),(664,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:53:36','Desktop','windows','C','2016-01-02 17:53:36',0),(665,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:53:51','Desktop','windows','C','2016-01-02 17:53:51',0),(666,'/rd/ajax/upload_image_article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:53:58','Desktop','windows','C','2016-01-02 17:53:58',0),(667,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:56:46','Desktop','windows','C','2016-01-02 17:56:46',0),(668,'/rd/ajax/upload_image_article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:56:57','Desktop','windows','C','2016-01-02 17:56:57',0),(669,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:57:04','Desktop','windows','C','2016-01-02 17:57:04',0),(670,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:57:12','Desktop','windows','C','2016-01-02 17:57:12',0),(671,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:02:23','Desktop','windows','C','2016-01-02 18:02:23',0),(672,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:02:29','Desktop','windows','C','2016-01-02 18:02:29',0),(673,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:02:44','Desktop','windows','C','2016-01-02 18:02:44',0),(674,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:03:11','Desktop','windows','C','2016-01-02 18:03:11',0),(675,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:03:42','Desktop','windows','C','2016-01-02 18:03:42',0),(676,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:03:45','Desktop','windows','C','2016-01-02 18:03:45',0),(677,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:03:48','Desktop','windows','C','2016-01-02 18:03:48',0),(678,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:03:58','Desktop','windows','C','2016-01-02 18:03:58',0),(679,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:04:20','Desktop','windows','C','2016-01-02 18:04:20',0),(680,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:04:42','Desktop','windows','C','2016-01-02 18:04:42',0),(681,'/rd/ajax/upload_image_article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:04:53','Desktop','windows','C','2016-01-02 18:04:53',0),(682,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:04:56','Desktop','windows','C','2016-01-02 18:04:56',0),(683,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:06:26','Desktop','windows','C','2016-01-02 18:06:26',0),(684,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:06:32','Desktop','windows','C','2016-01-02 18:06:32',0),(685,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:06:37','Desktop','windows','C','2016-01-02 18:06:37',0),(686,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:06:40','Desktop','windows','C','2016-01-02 18:06:40',0),(687,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:06:59','Desktop','windows','C','2016-01-02 18:06:59',0),(688,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:07:36','Desktop','windows','C','2016-01-02 18:07:36',0),(689,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:07:39','Desktop','windows','C','2016-01-02 18:07:39',0),(690,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:07:49','Desktop','windows','C','2016-01-02 18:07:49',0),(691,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:08:22','Desktop','windows','C','2016-01-02 18:08:22',0),(692,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:08:31','Desktop','windows','C','2016-01-02 18:08:31',0),(693,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:09:12','Desktop','windows','C','2016-01-02 18:09:12',0),(694,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:11:59','Desktop','windows','C','2016-01-02 18:11:59',0),(695,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:12:16','Desktop','windows','C','2016-01-02 18:12:16',0),(696,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:12:20','Desktop','windows','C','2016-01-02 18:12:20',0),(697,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:12:23','Desktop','windows','C','2016-01-02 18:12:23',0),(698,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:12:28','Desktop','windows','C','2016-01-02 18:12:28',0),(699,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:12:54','Desktop','windows','C','2016-01-02 18:12:54',0),(700,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:12:56','Desktop','windows','C','2016-01-02 18:12:56',0),(701,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:13:15','Desktop','windows','C','2016-01-02 18:13:15',0),(702,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:13:47','Desktop','windows','C','2016-01-02 18:13:47',0),(703,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:13:53','Desktop','windows','C','2016-01-02 18:13:53',0),(704,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:14:08','Desktop','windows','C','2016-01-02 18:14:08',0),(705,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:14:15','Desktop','windows','C','2016-01-02 18:14:15',0),(706,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:14:16','Desktop','windows','C','2016-01-02 18:14:16',0),(707,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:14:55','Desktop','windows','C','2016-01-02 18:14:55',0),(708,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:14:57','Desktop','windows','C','2016-01-02 18:14:57',0),(709,'/rd/ajax/upload_image_article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:15:07','Desktop','windows','C','2016-01-02 18:15:07',0),(710,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:15:19','Desktop','windows','C','2016-01-02 18:15:19',0),(711,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:15:20','Desktop','windows','C','2016-01-02 18:15:20',0),(712,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:21:12','Desktop','windows','C','2016-01-02 18:21:12',0),(713,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:22:07','Desktop','windows','C','2016-01-02 18:22:07',0),(714,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:23:01','Desktop','windows','C','2016-01-02 18:23:01',0),(715,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:29:58','Desktop','windows','C','2016-01-02 18:29:58',0),(716,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:30:00','Desktop','windows','C','2016-01-02 18:30:00',0),(717,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:45:06','Desktop','windows','C','2016-01-02 18:45:06',0),(718,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:45:27','Desktop','windows','C','2016-01-02 18:45:27',0),(719,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:47:45','Desktop','windows','C','2016-01-02 18:47:45',0),(720,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:48:41','Desktop','windows','C','2016-01-02 18:48:41',0),(721,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:49:10','Desktop','windows','C','2016-01-02 18:49:10',0),(722,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:53:48','Desktop','windows','C','2016-01-02 18:53:48',0),(723,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:54:21','Desktop','windows','C','2016-01-02 18:54:21',0),(724,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:55:09','Desktop','windows','C','2016-01-02 18:55:09',0),(725,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:57:14','Desktop','windows','C','2016-01-02 18:57:14',0),(726,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:01:23','Desktop','windows','C','2016-01-02 19:01:23',0),(727,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:03:05','Desktop','windows','C','2016-01-02 19:03:05',0),(728,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:03:14','Desktop','windows','C','2016-01-02 19:03:14',0),(729,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:03:16','Desktop','windows','C','2016-01-02 19:03:16',1),(730,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:03:20','Desktop','windows','C','2016-01-02 19:03:20',1),(731,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:03:42','Desktop','windows','C','2016-01-02 19:03:42',1),(732,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:03:43','Desktop','windows','C','2016-01-02 19:03:43',1),(733,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:03:48','Desktop','windows','C','2016-01-02 19:03:48',1),(734,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:04:51','Desktop','windows','C','2016-01-02 19:04:51',1),(735,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:05:16','Desktop','windows','C','2016-01-02 19:05:16',1),(736,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:05:17','Desktop','windows','C','2016-01-02 19:05:17',1),(737,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:05:19','Desktop','windows','C','2016-01-02 19:05:19',1),(738,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:08:03','Desktop','windows','C','2016-01-02 19:08:03',1),(739,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:08:08','Desktop','windows','C','2016-01-02 19:08:08',1),(740,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:08:53','Desktop','windows','C','2016-01-02 19:08:53',1),(741,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:09:22','Desktop','windows','C','2016-01-02 19:09:22',1),(742,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:12:23','Desktop','windows','C','2016-01-02 19:12:23',1),(743,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:12:57','Desktop','windows','C','2016-01-02 19:12:57',1),(744,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:20:58','Desktop','windows','C','2016-01-02 19:20:58',1),(745,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:22:08','Desktop','windows','C','2016-01-02 19:22:08',1),(746,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:27:02','Desktop','windows','C','2016-01-02 19:27:02',1),(747,'/rd/artikel/6/sipppssss','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:27:06','Desktop','windows','C','2016-01-02 19:27:06',1),(748,'/rd/artikel/6/sipppssss','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:27:17','Desktop','windows','C','2016-01-02 19:27:17',1),(749,'/rd/artikel/6/sipppssss','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:27:31','Desktop','windows','C','2016-01-02 19:27:31',1),(750,'/rd/artikel/6/sipppssss','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:27:58','Desktop','windows','C','2016-01-02 19:27:58',1),(751,'/rd/artikel/6/sipppssss','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:29:12','Desktop','windows','C','2016-01-02 19:29:12',1),(752,'/rd/artikel/5/hadeuh','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:29:22','Desktop','windows','C','2016-01-02 19:29:22',1),(753,'/rd/artikel/4/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:29:27','Desktop','windows','C','2016-01-02 19:29:27',1),(754,'/rd/artikel/4/resep-masak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:29:28','Desktop','windows','C','2016-01-02 19:29:28',1),(755,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:29:48','Desktop','windows','C','2016-01-02 19:29:48',1),(756,'/rd/ajax/upload_image_article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:31:19','Desktop','windows','C','2016-01-02 19:31:19',1),(757,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:33:29','Desktop','windows','C','2016-01-02 19:33:29',1),(758,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:33:30','Desktop','windows','C','2016-01-02 19:33:30',1),(759,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:33:33','Desktop','windows','C','2016-01-02 19:33:33',1),(760,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:33:42','Desktop','windows','C','2016-01-02 19:33:42',1),(761,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:33:46','Desktop','windows','C','2016-01-02 19:33:46',1),(762,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:35:18','Desktop','windows','C','2016-01-02 19:35:18',1),(763,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:37:58','Desktop','windows','C','2016-01-02 19:37:58',1),(764,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:39:28','Desktop','windows','C','2016-01-02 19:39:28',1),(765,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:39:54','Desktop','windows','C','2016-01-02 19:39:54',1),(766,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:40:09','Desktop','windows','C','2016-01-02 19:40:09',1),(767,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:40:30','Desktop','windows','C','2016-01-02 19:40:30',1),(768,'/rd/artikel/3/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:44:17','Desktop','windows','C','2016-01-02 19:44:17',1),(769,'/rd/artikel/3/resep-masak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:44:18','Desktop','windows','C','2016-01-02 19:44:18',1),(770,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:44:30','Desktop','windows','C','2016-01-02 19:44:30',1),(771,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:55:55','Desktop','windows','C','2016-01-02 19:55:55',1),(772,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:55:59','Desktop','windows','C','2016-01-02 19:55:59',1),(773,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:57:33','Desktop','windows','C','2016-01-02 19:57:33',1),(774,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:58:40','Desktop','windows','C','2016-01-02 19:58:40',1),(775,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:58:47','Desktop','windows','C','2016-01-02 19:58:47',1),(776,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:59:09','Desktop','windows','C','2016-01-02 19:59:09',1),(777,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:59:54','Desktop','windows','C','2016-01-02 19:59:54',1),(778,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:00:09','Desktop','windows','C','2016-01-02 20:00:09',1),(779,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:01:19','Desktop','windows','C','2016-01-02 20:01:19',1),(780,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:02:58','Desktop','windows','C','2016-01-02 20:02:58',1),(781,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:03:35','Desktop','windows','C','2016-01-02 20:03:35',1),(782,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:03:47','Desktop','windows','C','2016-01-02 20:03:47',1),(783,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:05:39','Desktop','windows','C','2016-01-02 20:05:39',1),(784,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:06:18','Desktop','windows','C','2016-01-02 20:06:18',1),(785,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:08:32','Desktop','windows','C','2016-01-02 20:08:32',1),(786,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:08:48','Desktop','windows','C','2016-01-02 20:08:48',1),(787,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:09:16','Desktop','windows','C','2016-01-02 20:09:16',1),(788,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:10:44','Desktop','windows','C','2016-01-02 20:10:44',1),(789,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:27:58','Desktop','windows','C','2016-01-02 20:27:58',1),(790,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:28:01','Desktop','windows','C','2016-01-02 20:28:01',1),(791,'/rd/pages/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:28:06','Desktop','windows','C','2016-01-02 20:28:06',1),(792,'/rd/pages/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:28:22','Desktop','windows','C','2016-01-02 20:28:22',1),(793,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:28:27','Desktop','windows','C','2016-01-02 20:28:27',1),(794,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:28:30','Desktop','windows','C','2016-01-02 20:28:30',1),(795,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:29:34','Desktop','windows','C','2016-01-02 20:29:34',1),(796,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:30:16','Desktop','windows','C','2016-01-02 20:30:16',1),(797,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:30:17','Desktop','windows','C','2016-01-02 20:30:17',1),(798,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:30:55','Desktop','windows','C','2016-01-02 20:30:55',1),(799,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:31:14','Desktop','windows','C','2016-01-02 20:31:14',1),(800,'/rd/users/edit_article.7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:31:15','Desktop','windows','C','2016-01-02 20:31:15',1),(801,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:31:22','Desktop','windows','C','2016-01-02 20:31:22',1),(802,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:31:23','Desktop','windows','C','2016-01-02 20:31:23',1),(803,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:31:34','Desktop','windows','C','2016-01-02 20:31:34',1),(804,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:31:35','Desktop','windows','C','2016-01-02 20:31:35',1),(805,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:31:40','Desktop','windows','C','2016-01-02 20:31:40',1),(806,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:31:44','Desktop','windows','C','2016-01-02 20:31:44',1),(807,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:32:41','Desktop','windows','C','2016-01-02 20:32:41',1),(808,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:41:52','Desktop','windows','C','2016-01-02 20:41:52',1),(809,'/rd/users/delete_article/4','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:42:13','Desktop','windows','C','2016-01-02 20:42:13',1),(810,'/rd/artikel/1/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:42:34','Desktop','windows','C','2016-01-02 20:42:34',1),(811,'/rd/artikel/1/resep-masak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:42:36','Desktop','windows','C','2016-01-02 20:42:36',1),(812,'/rd/users/delete_article/1','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:42:48','Desktop','windows','C','2016-01-02 20:42:48',1),(813,'/rd/users/edit_article/2','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:42:50','Desktop','windows','C','2016-01-02 20:42:50',1),(814,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:44:29','Desktop','windows','C','2016-01-02 20:44:29',1),(815,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:44:38','Desktop','windows','C','2016-01-02 20:44:38',1),(816,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:44:42','Desktop','windows','C','2016-01-02 20:44:42',1),(817,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:44:45','Desktop','windows','C','2016-01-02 20:44:45',1),(818,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:44:48','Desktop','windows','C','2016-01-02 20:44:48',1),(819,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:45:03','Desktop','windows','C','2016-01-02 20:45:03',1),(820,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:45:04','Desktop','windows','C','2016-01-02 20:45:04',1),(821,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:45:08','Desktop','windows','C','2016-01-02 20:45:08',1),(822,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:45:10','Desktop','windows','C','2016-01-02 20:45:10',1),(823,'/rd/users/logout','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:45:18','Desktop','windows','C','2016-01-02 20:45:18',1),(824,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:45:19','Desktop','windows','C','2016-01-02 20:45:19',0),(825,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:45:23','Desktop','windows','C','2016-01-02 20:45:23',0),(826,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:46:25','Desktop','windows','C','2016-01-02 20:46:25',0),(827,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:48:47','Desktop','windows','C','2016-01-02 20:48:47',0),(828,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:49:14','Desktop','windows','C','2016-01-02 20:49:14',0),(829,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:50:52','Desktop','windows','C','2016-01-02 20:50:52',0),(830,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:51:01','Desktop','windows','C','2016-01-02 20:51:01',0),(831,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:51:06','Desktop','windows','C','2016-01-02 20:51:06',0),(832,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:52:15','Desktop','windows','C','2016-01-02 20:52:15',0),(833,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:52:52','Desktop','windows','C','2016-01-02 20:52:52',0),(834,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:55:08','Desktop','windows','C','2016-01-02 20:55:08',0),(835,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:55:19','Desktop','windows','C','2016-01-02 20:55:19',0),(836,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:55:37','Desktop','windows','C','2016-01-02 20:55:37',0),(837,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:55:43','Desktop','windows','C','2016-01-02 20:55:43',0),(838,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:56:58','Desktop','windows','C','2016-01-02 20:56:58',0),(839,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:57:24','Desktop','windows','C','2016-01-02 20:57:24',0),(840,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:00:55','Mobile','linux','C','2016-01-02 21:00:55',0),(841,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:01:24','Desktop','windows','C','2016-01-02 21:01:24',0),(842,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:01:29','Desktop','windows','C','2016-01-02 21:01:29',0),(843,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:01:31','Desktop','windows','C','2016-01-02 21:01:31',1),(844,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:01:38','Desktop','windows','C','2016-01-02 21:01:38',1),(845,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:01:42','Desktop','windows','C','2016-01-02 21:01:42',1),(846,'/rd/ajax/upload_image_article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:01:55','Desktop','windows','C','2016-01-02 21:01:55',1),(847,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:02:01','Desktop','windows','C','2016-01-02 21:02:01',1),(848,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:02:03','Desktop','windows','C','2016-01-02 21:02:03',1),(849,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:02:05','Desktop','windows','C','2016-01-02 21:02:05',1),(850,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 21:02:12','Mobile','mac','C','2016-01-02 21:02:12',0),(851,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:02:28','Desktop','windows','C','2016-01-02 21:02:28',0),(852,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:02:37','Desktop','windows','C','2016-01-02 21:02:37',0),(853,'/rd/artikel/6/sipppssss','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:02:41','Desktop','windows','C','2016-01-02 21:02:41',0),(854,'/rd/artikel/2/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:02:47','Desktop','windows','C','2016-01-02 21:02:47',0),(855,'/rd/artikel/2/resep-masak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:02:48','Desktop','windows','C','2016-01-02 21:02:48',0),(856,'/rd/recipe/contest','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:03:17','Desktop','windows','C','2016-01-02 21:03:17',0),(857,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:03:19','Desktop','windows','C','2016-01-02 21:03:19',0),(858,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:03:24','Desktop','windows','C','2016-01-02 21:03:24',0),(859,'/rd/recipe/contest','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:03:25','Desktop','windows','C','2016-01-02 21:03:25',3),(860,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:03:28','Desktop','windows','C','2016-01-02 21:03:28',3),(861,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:03:35','Desktop','windows','C','2016-01-02 21:03:35',3),(862,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:04:15','Desktop','windows','C','2016-01-02 21:04:15',3),(863,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:04:47','Desktop','windows','C','2016-01-02 21:04:47',3),(864,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:07:03','Desktop','windows','C','2016-01-02 21:07:03',3),(865,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:07:54','Desktop','windows','C','2016-01-02 21:07:54',3),(866,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:08:07','Desktop','windows','C','2016-01-02 21:08:07',3),(867,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:08:21','Desktop','windows','C','2016-01-02 21:08:21',3),(868,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:08:35','Desktop','windows','C','2016-01-02 21:08:35',3),(869,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:08:44','Desktop','windows','C','2016-01-02 21:08:44',3),(870,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:09:01','Desktop','windows','C','2016-01-02 21:09:01',3),(871,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:09:17','Desktop','windows','C','2016-01-02 21:09:17',3),(872,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:09:25','Desktop','windows','C','2016-01-02 21:09:25',3),(873,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:09:29','Desktop','windows','C','2016-01-02 21:09:29',3),(874,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:10:53','Desktop','windows','C','2016-01-02 21:10:53',3),(875,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:12:46','Desktop','windows','C','2016-01-02 21:12:46',3),(876,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:14:24','Desktop','windows','C','2016-01-02 21:14:24',3),(877,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:14:32','Desktop','windows','C','2016-01-02 21:14:32',3),(878,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:14:38','Desktop','windows','C','2016-01-02 21:14:38',3),(879,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:14:56','Desktop','windows','C','2016-01-02 21:14:56',3),(880,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:15:08','Desktop','windows','C','2016-01-02 21:15:08',3),(881,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:16:05','Desktop','windows','C','2016-01-02 21:16:05',3),(882,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:16:16','Desktop','windows','C','2016-01-02 21:16:16',3),(883,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:16:50','Desktop','windows','C','2016-01-02 21:16:50',3),(884,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:17:27','Desktop','windows','C','2016-01-02 21:17:27',3),(885,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:17:39','Desktop','windows','C','2016-01-02 21:17:39',3),(886,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:17:50','Desktop','windows','C','2016-01-02 21:17:50',3),(887,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 21:18:26','Mobile','mac','C','2016-01-02 21:18:26',0),(888,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 21:18:33','Mobile','mac','C','2016-01-02 21:18:33',0),(889,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 21:18:47','Mobile','mac','C','2016-01-02 21:18:47',0),(890,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Apple Safari','Apple Safari','192.168.1.100','2016-01-02 21:19:09','Mobile','mac','C','2016-01-02 21:19:09',0),(891,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:20:30','Desktop','windows','C','2016-01-02 21:20:30',0),(892,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:21:50','Desktop','windows','C','2016-01-02 21:21:50',0),(893,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:02','Desktop','windows','C','2016-01-02 21:25:02',0),(894,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:06','Desktop','windows','C','2016-01-02 21:25:06',0),(895,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:12','Desktop','windows','C','2016-01-02 21:25:12',0),(896,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:13','Desktop','windows','C','2016-01-02 21:25:13',1),(897,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:17','Desktop','windows','C','2016-01-02 21:25:17',1),(898,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:23','Desktop','windows','C','2016-01-02 21:25:23',1),(899,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:26','Desktop','windows','C','2016-01-02 21:25:26',1),(900,'/rd/ajax/upload_image_article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:40','Desktop','windows','C','2016-01-02 21:25:40',1),(901,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:48','Desktop','windows','C','2016-01-02 21:25:48',1),(902,'/rd/users/edit_article/7','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:49','Desktop','windows','C','2016-01-02 21:25:49',1),(903,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:54','Desktop','windows','C','2016-01-02 21:25:54',1),(904,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:57','Desktop','windows','C','2016-01-02 21:25:57',1),(905,'/rd/artikel/7/cara-membuat-nasi-goreng-enak','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:26:19','Desktop','windows','C','2016-01-02 21:26:19',1),(906,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:27:16','Desktop','windows','C','2016-01-02 21:27:16',1),(907,'/rd/recipe/find?keyword=','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:27:42','Desktop','windows','C','2016-01-02 21:27:42',1),(908,'/rd/recipe/find?keyword=&CompositionID%5B%5D=4&hdnSuggestValue=%5B%7B%22id%22%3A%221%22%2C%22name%22','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:27:46','Desktop','windows','C','2016-01-02 21:27:46',1),(909,'/rd/detail/5/ayam-merah','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:27:48','Desktop','windows','C','2016-01-02 21:27:48',1),(910,'/rd/detail/5/ayam-merah','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:29:10','Desktop','windows','C','2016-01-02 21:29:10',1),(911,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:29:23','Desktop','windows','C','2016-01-02 21:29:23',1),(912,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:29:49','Desktop','windows','C','2016-01-02 21:29:49',1),(913,'/rd/users/logout','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:02','Desktop','windows','C','2016-01-02 21:31:02',1),(914,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:03','Desktop','windows','C','2016-01-02 21:31:03',0),(915,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:08','Desktop','windows','C','2016-01-02 21:31:08',0),(916,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:18','Desktop','windows','C','2016-01-02 21:31:18',0),(917,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:26','Desktop','windows','C','2016-01-02 21:31:26',0),(918,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:27','Desktop','windows','C','2016-01-02 21:31:27',3),(919,'/rd/recipe/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:30','Desktop','windows','C','2016-01-02 21:31:30',3),(920,'/rd/recipe/recook','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:44','Desktop','windows','C','2016-01-02 21:31:44',3),(921,'/rd/recipe/cookmark','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:48','Desktop','windows','C','2016-01-02 21:31:48',3),(922,'/rd/users/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:57','Desktop','windows','C','2016-01-02 21:31:57',3),(923,'/rd/recipe/add','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:32:01','Desktop','windows','C','2016-01-02 21:32:01',3),(924,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:32:02','Desktop','windows','C','2016-01-02 21:32:02',3),(925,'/rd/ajax/list_composition','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:32:04','Desktop','windows','C','2016-01-02 21:32:04',3),(926,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:32:05','Desktop','windows','C','2016-01-02 21:32:05',3),(927,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:33:07','Desktop','windows','C','2016-01-02 21:33:07',3),(928,'/rd/','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:33:10','Desktop','windows','C','2016-01-02 21:33:10',3),(929,'/rd/users/logout','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:38:15','Desktop','windows','C','2016-01-02 21:38:15',3),(930,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:38:17','Desktop','windows','C','2016-01-02 21:38:17',0),(931,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:38:20','Desktop','windows','C','2016-01-02 21:38:20',0),(932,'/rd/users/login','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:38:24','Desktop','windows','C','2016-01-02 21:38:24',0),(933,'/rd/pages','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:38:26','Desktop','windows','C','2016-01-02 21:38:26',1),(934,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:38:29','Desktop','windows','C','2016-01-02 21:38:29',1),(935,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:38:32','Desktop','windows','C','2016-01-02 21:38:32',1),(936,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:38:49','Desktop','windows','C','2016-01-02 21:38:49',1),(937,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:39:22','Desktop','windows','C','2016-01-02 21:39:22',1),(938,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:42:03','Desktop','windows','C','2016-01-02 21:42:03',1),(939,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:55:28','Desktop','windows','C','2016-01-02 21:55:28',1),(940,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 22:06:09','Desktop','windows','C','2016-01-02 22:06:09',1),(941,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 22:06:15','Desktop','windows','C','2016-01-02 22:06:15',1),(942,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 22:06:21','Desktop','windows','C','2016-01-02 22:06:21',1),(943,'/rd/users/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 22:06:22','Desktop','windows','C','2016-01-02 22:06:22',1),(944,'/rd/pages/article','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 22:06:25','Desktop','windows','C','2016-01-02 22:06:25',1),(945,'/rd/users/edit_article/8','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 22:06:28','Desktop','windows','C','2016-01-02 22:06:28',1),(946,'/rd/users/edit_article/8','Google Chrome','Google Chrome','192.168.1.100','2016-01-02 22:46:47','Desktop','windows','C','2016-01-02 22:46:47',1),(947,'/rd/pages','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:34:18','Desktop','windows','C','2016-01-03 10:34:18',0),(948,'/rd/pages/article','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:34:45','Desktop','windows','C','2016-01-03 10:34:45',0),(949,'/rd/artikel/8/sasadfas','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:34:50','Desktop','windows','C','2016-01-03 10:34:50',0),(950,'/rd/pages/article','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:34:55','Desktop','windows','C','2016-01-03 10:34:55',0),(951,'/rd/users/login','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:35:06','Desktop','windows','C','2016-01-03 10:35:06',0),(952,'/rd/users/login','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:35:18','Desktop','windows','C','2016-01-03 10:35:18',0),(953,'/rd/users/login','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:35:25','Desktop','windows','C','2016-01-03 10:35:25',0),(954,'/rd/pages/article','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:35:26','Desktop','windows','C','2016-01-03 10:35:26',1),(955,'/rd/users/article','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:35:43','Desktop','windows','C','2016-01-03 10:35:43',1),(956,'/rd/ajax/upload_image_article','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:36:53','Desktop','windows','C','2016-01-03 10:36:53',1),(957,'/rd/ajax/upload_image_article','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:37:00','Desktop','windows','C','2016-01-03 10:37:00',1),(958,'/rd/ajax/upload_image_article','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:37:07','Desktop','windows','C','2016-01-03 10:37:07',1),(959,'/rd/ajax/upload_image_article','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:37:12','Desktop','windows','C','2016-01-03 10:37:12',1),(960,'/rd/users/article','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:38:01','Desktop','windows','C','2016-01-03 10:38:01',1),(961,'/rd/ajax/upload_image_article','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:38:08','Desktop','windows','C','2016-01-03 10:38:08',1),(962,'/rd/users/article','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:39:27','Desktop','windows','C','2016-01-03 10:39:27',1),(963,'/rd/users/article','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:39:28','Desktop','windows','C','2016-01-03 10:39:28',1),(964,'/rd/pages/article','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:39:31','Desktop','windows','C','2016-01-03 10:39:31',1),(965,'/rd/artikel/9/10-resep-makanan-terpopuler-versi-google','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:39:36','Desktop','windows','C','2016-01-03 10:39:36',1),(966,'/rd/recipe/recook','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 11:52:52','Desktop','windows','C','2016-01-03 11:52:52',1),(967,'/rd/users/logout','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 12:30:15','Desktop','windows','C','2016-01-03 12:30:15',1),(968,'/rd/pages','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 12:30:15','Desktop','windows','C','2016-01-03 12:30:15',0),(969,'/rd/users/login','Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 12:30:17','Desktop','windows','C','2016-01-03 12:30:17',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `recook` */

insert  into `recook`(`RecookID`,`UserID`,`RecipeID`,`RecookDesc`,`RecookPhoto`,`AuditedActivity`,`AuditedTime`,`AuditedUser`,`RecookDate`) values (1,3,1,'Resepnya simpel, enak dan semua suka :D ','recook1.jpg','C','2015-12-03 11:24:03',3,'2015-12-17 14:52:39'),(2,3,12,'Recook makanan sendiri ahhh','20151231_00_00_20_38.png','C','2015-12-31 00:00:26',3,'2015-12-31 00:00:26'),(3,1,11,'ahey','20151231_09_25_15_36.jpg','C','2015-12-31 15:25:20',1,'2015-12-31 15:25:20'),(4,2,14,'Aku tambahin garam 5 BUNGKUS ASIN BANGET GA PENGEN CEPET NIKAH KOK','20151231_16_54_47_47.jpg','C','2015-12-31 22:55:09',2,'2015-12-31 22:55:09'),(8,2,13,'cumi goreng','20151231_17_05_45_11.jpg','C','2015-12-31 23:05:53',2,'2015-12-31 23:05:53'),(9,3,2,'recook nasgor yeah','20160101_10_25_23_79.jpg','C','2016-01-01 10:25:29',3,'2016-01-01 10:25:29'),(10,3,4,'yuhu','20160101_10_25_53_28.jpg','C','2016-01-01 10:25:55',3,'2016-01-01 10:25:55'),(11,3,14,'sips','20160102_08_20_50_27.jpg','C','2016-01-02 08:20:55',3,'2016-01-02 08:20:55');

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
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;

/*Data for the table `searchlog` */

insert  into `searchlog`(`SearchLogID`,`Browser`,`BrowserVersion`,`IPAddress`,`AccessDate`,`Device`,`OS`,`PCuisineID`,`PFoodTypeID`,`PKeyword`,`PComposition`,`PFoodProcess`,`PPriceRange`,`PEstPeople`,`PUserID`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Chrome',NULL,'10.2.200.900','2015-12-28 14:13:15','HP',NULL,'1','1','Nasi Goreng','1','1','4','3',1,'C','2015-12-28 14:13:15',1),(2,'Google Chrome','Google Chrome','192.168.43.249','2015-12-31 00:46:21','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'C','2015-12-31 00:46:21',3),(3,'Google Chrome','Google Chrome','192.168.43.249','2015-12-31 00:46:38','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2015-12-31 00:46:38',3),(4,'Google Chrome','Google Chrome','192.168.43.249','2015-12-31 00:47:08','Desktop','windows','2','1,2','',NULL,NULL,NULL,NULL,3,'C','2015-12-31 00:47:08',3),(5,'Google Chrome','Google Chrome','192.168.43.249','2015-12-31 00:47:43','Desktop','windows','2','1,2','',NULL,NULL,NULL,NULL,3,'C','2015-12-31 00:47:43',3),(6,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:45:52','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2015-12-31 08:45:52',0),(7,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:45:58','Desktop','windows',NULL,NULL,'lah',NULL,NULL,NULL,NULL,0,'C','2015-12-31 08:45:58',0),(8,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:46:05','Desktop','windows',NULL,NULL,'','1',NULL,NULL,NULL,0,'C','2015-12-31 08:46:05',0),(9,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:46:18','Desktop','windows',NULL,NULL,'','5',NULL,NULL,NULL,0,'C','2015-12-31 08:46:18',0),(10,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:23:40','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2015-12-31 12:23:40',0),(11,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:24:14','Desktop','windows',NULL,NULL,'','1,Ayam itik',NULL,NULL,NULL,0,'C','2015-12-31 12:24:14',0),(12,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:25:42','Desktop','windows',NULL,NULL,'','1,Ayam itik',NULL,NULL,NULL,1,'C','2015-12-31 12:25:42',1),(13,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:16:31','Desktop','windows',NULL,NULL,'resep enak',NULL,NULL,NULL,NULL,1,'C','2015-12-31 13:16:31',1),(14,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:16:36','Desktop','windows',NULL,NULL,'yuhu',NULL,NULL,NULL,NULL,1,'C','2015-12-31 13:16:36',1),(15,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:36','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 14:00:36',1),(16,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:44','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 14:00:44',1),(17,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:37:09','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 15:37:09',1),(18,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:15','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 16:18:15',1),(19,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:27','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 16:18:27',1),(20,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:42','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 16:18:42',1),(21,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:31:45','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'C','2015-12-31 21:31:45',0),(22,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:32:10','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'C','2015-12-31 21:32:10',1),(23,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:18:59','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2015-12-31 22:18:59',1),(24,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:47:49','Desktop','windows',NULL,NULL,'kodok',NULL,NULL,NULL,NULL,1,'C','2015-12-31 22:47:49',1),(25,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:48:15','Desktop','windows',NULL,NULL,'','kodok,kura,ayam',NULL,NULL,NULL,1,'C','2015-12-31 22:48:15',1),(26,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:48:41','Desktop','windows',NULL,NULL,'','kodok,kura,14',NULL,NULL,NULL,1,'C','2015-12-31 22:48:41',1),(27,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:49:12','Desktop','windows',NULL,NULL,'ayam merah','kodok,kura,14',NULL,NULL,NULL,1,'C','2015-12-31 22:49:12',1),(28,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:49:21','Desktop','windows',NULL,NULL,'ayam merah',NULL,NULL,NULL,NULL,1,'C','2015-12-31 22:49:21',1),(29,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:51:11','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,0,'C','2015-12-31 22:51:11',0),(30,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:52:15','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 22:52:15',2),(31,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:54:40','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 22:54:40',2),(32,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:55:09','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 22:55:09',2),(33,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:55:36','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 22:55:36',2),(34,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:58:41','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 22:58:41',2),(35,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:00:18','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:00:18',2),(36,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:00:53','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:00:53',2),(37,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:05:19','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:05:19',2),(38,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:05:24','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:05:24',2),(39,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:05:53','Desktop','windows',NULL,'2,3,5,6','',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:05:53',2),(40,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:21:27','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:21:27',2),(41,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:26:00','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:26:00',2),(42,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:26:10','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:26:10',2),(43,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:26:16','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:26:16',2),(44,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:26:23','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,2,'C','2015-12-31 23:26:23',2),(45,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:14:36','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:14:36',0),(46,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:15:22','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:15:22',0),(47,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:15:39','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:15:39',0),(48,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:15:43','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:15:43',0),(49,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:23:15','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:23:15',0),(50,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:24:04','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:24:04',0),(51,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:25:04','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:25:04',0),(52,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:25:18','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:25:18',0),(53,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:29:21','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:29:21',0),(54,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:30:18','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:30:18',0),(55,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:41:26','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:41:26',0),(56,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:52:26','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:52:26',0),(57,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:53:13','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:53:13',0),(58,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:54:49','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:54:49',0),(59,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:56:33','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 09:56:33',0),(60,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:00:44','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:00:44',0),(61,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:03:38','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:03:38',3),(62,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:10:14','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:10:14',3),(63,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:15:51','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:15:51',0),(64,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:19:51','Desktop','windows',NULL,'2,4','',NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:19:51',0),(65,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:23:02','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:23:02',3),(66,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:24:31','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:24:31',3),(67,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:00','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:25:00',3),(68,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:30','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:25:30',3),(69,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:40','Desktop','windows',NULL,NULL,'','1',NULL,NULL,NULL,3,'C','2016-01-01 10:25:40',3),(70,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:56','Desktop','windows',NULL,NULL,'','1',NULL,NULL,NULL,3,'C','2016-01-01 10:25:56',3),(71,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:26:07','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:26:07',3),(72,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:47','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 10:42:47',3),(73,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:57','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:42:57',0),(74,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:44:29','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:44:29',0),(75,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:45:39','Desktop','windows',NULL,NULL,'udang',NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:45:39',0),(76,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:50:55','Desktop','windows',NULL,NULL,'udang',NULL,NULL,NULL,NULL,0,'C','2016-01-01 10:50:55',0),(77,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:29:51','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:29:51',3),(78,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:30:06','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:30:06',3),(79,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:30:26','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:30:26',3),(80,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:31:40','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:31:40',3),(81,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:31:53','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:31:53',3),(82,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:05','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:32:05',3),(83,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:35','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:32:35',3),(84,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:56','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:32:56',3),(85,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:33:06','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:33:06',3),(86,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:33:19','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:33:19',3),(87,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:34:28','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:34:28',3),(88,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:35:14','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:35:14',3),(89,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:36:23','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:36:23',3),(90,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:36:59','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:36:59',3),(91,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:26','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:37:26',3),(92,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:35','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:37:35',3),(93,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:48','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:37:48',3),(94,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:12','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:38:12',3),(95,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:27','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:38:27',3),(96,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:34','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:38:34',3),(97,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:45','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:38:45',3),(98,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:55','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:38:55',3),(99,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:05','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:39:05',3),(100,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:10','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:39:10',3),(101,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:17','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:39:17',3),(102,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:40:40','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:40:40',3),(103,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:34','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:41:34',3),(104,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:56','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 11:41:56',3),(105,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 14:23:52','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-01 14:23:52',0),(106,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:12:57','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'C','2016-01-01 16:12:57',3),(107,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:47','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 16:13:47',3),(108,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:17:30','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 16:17:30',3),(109,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:17:56','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-01 16:17:56',3),(110,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:01:13','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'C','2016-01-02 08:01:13',0),(111,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:01:47','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'C','2016-01-02 08:01:47',3),(112,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:30','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'C','2016-01-02 08:20:30',3),(113,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:56','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'C','2016-01-02 08:20:56',3),(114,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:44:31','Desktop','windows',NULL,'1','',NULL,NULL,NULL,NULL,2,'C','2016-01-02 08:44:31',2),(115,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:56:17','Desktop','windows',NULL,NULL,'recipe enak',NULL,NULL,NULL,NULL,0,'C','2016-01-02 09:56:17',0),(116,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:04:06','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 10:04:06',0),(117,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:04:31','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-02 10:04:31',3),(118,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:25:42','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'C','2016-01-02 10:25:42',0),(119,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:27:27','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'C','2016-01-02 10:27:27',0),(120,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:27:59','Desktop','windows',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'C','2016-01-02 10:27:59',3),(121,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:32:48','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 12:32:48',0),(122,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:33:10','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 12:33:10',0),(123,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:33:24','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 12:33:24',0),(124,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:43:12','Mobile','mac',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 12:43:12',0),(125,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:44:35','Mobile','mac',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 12:44:35',0),(126,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:45:05','Mobile','mac',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 12:45:05',0),(127,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:47:38','Mobile','mac',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 12:47:38',0),(128,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:48:21','Mobile','mac',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 12:48:21',0),(129,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:48:41','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 12:48:41',0),(130,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:49:27','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 12:49:27',0),(131,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:49:39','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 12:49:39',0),(132,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:49:54','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 12:49:54',0),(133,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:51:39','Mobile','mac',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-02 12:51:39',3),(134,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:03:41','Mobile','mac',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-02 13:03:41',3),(135,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:03:52','Mobile','mac',NULL,NULL,'',NULL,NULL,NULL,NULL,3,'C','2016-01-02 13:03:52',3),(136,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:23:01','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 18:23:01',0),(137,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:45:27','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,0,'C','2016-01-02 18:45:27',0),(138,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:27:42','Desktop','windows',NULL,NULL,'',NULL,NULL,NULL,NULL,1,'C','2016-01-02 21:27:42',1),(139,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:27:46','Desktop','windows',NULL,NULL,'','4',NULL,NULL,NULL,1,'C','2016-01-02 21:27:46',1);

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

insert  into `user`(`UserID`,`UserName`,`UserEmail`,`CompanyName`,`UserPassword`,`UserRole`,`UserPhoto`,`CityName`,`CountryName`,`AuditedActivity`,`AuditedTime`,`AuditedUser`,`UserLevelID`) values (1,'ResepDuniaAdmin1','admin@cookindo.com',NULL,'d033e22ae348aeb5660fc2140aec35850c4da997',1,'20151231_16_43_50_18.png','Jakarta','Indonesia','U','2015-12-31 22:43:52',1,1),(2,'Angela Muliawan','amuliawan93@gmail.com',NULL,'d033e22ae348aeb5660fc2140aec35850c4da997',0,NULL,'Jakarta','Indonesia','C','2015-12-03 11:42:44',1,3),(3,'Brian Alexandro','alexandrobrian15@gmail.com',NULL,'d033e22ae348aeb5660fc2140aec35850c4da997',0,'20160102_10_44_01_5.jpg','Jakarta','Indonesia','U','2016-01-02 10:44:15',3,NULL),(4,'Blueband','blueband@unilever.com','PT Unilevel Indonesia','d033e22ae348aeb5660fc2140aec35850c4da997',2,'3-blueband.jpg','Jakarta','Indonesia','C','2015-12-03 11:43:58',1,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=802 DEFAULT CHARSET=latin1;

/*Data for the table `userlog` */

insert  into `userlog`(`UserLogID`,`Browser`,`BrowserVersion`,`IPAddress`,`AccessDate`,`Device`,`OS`,`AuditedActivity`,`AuditedTime`,`AuditedUser`) values (1,'Firefox',NULL,'10.1.20.300','2015-12-18 20:38:55',NULL,NULL,'C','2015-12-18 20:38:55',1),(2,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:45:37','Desktop','windows','C','2015-12-31 08:45:37',0),(3,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:45:51','Desktop','windows','C','2015-12-31 08:45:51',0),(4,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:46:05','Desktop','windows','C','2015-12-31 08:46:05',0),(5,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:46:18','Desktop','windows','C','2015-12-31 08:46:18',0),(6,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:47:09','Desktop','windows','C','2015-12-31 08:47:09',0),(7,'Google Chrome','Google Chrome','127.0.0.1','2015-12-31 08:47:31','Desktop','windows','C','2015-12-31 08:47:31',0),(8,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:23:30','Desktop','windows','C','2015-12-31 12:23:30',0),(9,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:24:14','Desktop','windows','C','2015-12-31 12:24:14',0),(10,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:25:38','Desktop','windows','C','2015-12-31 12:25:38',0),(11,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:27:52','Desktop','windows','C','2015-12-31 12:27:52',1),(12,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:56:44','Desktop','windows','C','2015-12-31 12:56:44',1),(13,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:56:56','Desktop','windows','C','2015-12-31 12:56:56',1),(14,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 12:57:27','Desktop','windows','C','2015-12-31 12:57:27',1),(15,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:01:25','Desktop','windows','C','2015-12-31 13:01:25',1),(16,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:02:08','Desktop','windows','C','2015-12-31 13:02:08',1),(17,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:02:43','Desktop','windows','C','2015-12-31 13:02:43',1),(18,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:02:55','Desktop','windows','C','2015-12-31 13:02:55',0),(19,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:04:20','Desktop','windows','C','2015-12-31 13:04:20',2),(20,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:04:40','Desktop','windows','C','2015-12-31 13:04:40',2),(21,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:05:00','Desktop','windows','C','2015-12-31 13:05:00',2),(22,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:05:36','Desktop','windows','C','2015-12-31 13:05:36',2),(23,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:09:16','Desktop','windows','C','2015-12-31 13:09:16',2),(24,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:09:31','Desktop','windows','C','2015-12-31 13:09:31',2),(25,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:14:42','Desktop','windows','C','2015-12-31 13:14:42',1),(26,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:16:30','Desktop','windows','C','2015-12-31 13:16:30',1),(27,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:16:41','Desktop','windows','C','2015-12-31 13:16:41',1),(28,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:26:48','Desktop','windows','C','2015-12-31 13:26:48',1),(29,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:27:20','Desktop','windows','C','2015-12-31 13:27:20',1),(30,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 13:28:08','Desktop','windows','C','2015-12-31 13:28:08',1),(31,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:24','Desktop','windows','C','2015-12-31 14:00:24',1),(32,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:36','Desktop','windows','C','2015-12-31 14:00:36',1),(33,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:00:50','Desktop','windows','C','2015-12-31 14:00:50',1),(34,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:33:21','Desktop','windows','C','2015-12-31 14:33:21',1),(35,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:48:54','Desktop','windows','C','2015-12-31 14:48:54',1),(36,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 14:49:59','Desktop','windows','C','2015-12-31 14:49:59',1),(37,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:14:40','Desktop','windows','C','2015-12-31 15:14:40',0),(38,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:16:10','Desktop','windows','C','2015-12-31 15:16:10',0),(39,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:23:18','Desktop','windows','C','2015-12-31 15:23:18',0),(40,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:25:08','Desktop','windows','C','2015-12-31 15:25:08',1),(41,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:25:20','Desktop','windows','C','2015-12-31 15:25:20',1),(42,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:27:01','Desktop','windows','C','2015-12-31 15:27:01',1),(43,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:28:39','Desktop','windows','C','2015-12-31 15:28:39',1),(44,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:31:00','Desktop','windows','C','2015-12-31 15:31:00',1),(45,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 15:36:59','Desktop','windows','C','2015-12-31 15:36:59',1),(46,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:15','Desktop','windows','C','2015-12-31 16:18:15',1),(47,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:27','Desktop','windows','C','2015-12-31 16:18:27',1),(48,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 16:18:42','Desktop','windows','C','2015-12-31 16:18:42',1),(49,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:26:32','Desktop','windows','C','2015-12-31 21:26:32',0),(50,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:27:45','Desktop','windows','C','2015-12-31 21:27:45',0),(51,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:30:15','Desktop','windows','C','2015-12-31 21:30:15',0),(52,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:31:30','Desktop','windows','C','2015-12-31 21:31:30',0),(53,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:31:45','Desktop','windows','C','2015-12-31 21:31:45',0),(54,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:32:01','Desktop','windows','C','2015-12-31 21:32:01',0),(55,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:32:14','Desktop','windows','C','2015-12-31 21:32:14',1),(56,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:37:44','Desktop','windows','C','2015-12-31 21:37:44',1),(57,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:41:56','Desktop','windows','C','2015-12-31 21:41:56',1),(58,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:44:47','Desktop','windows','C','2015-12-31 21:44:47',1),(59,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:45:08','Desktop','windows','C','2015-12-31 21:45:08',1),(60,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:48:52','Desktop','windows','C','2015-12-31 21:48:52',1),(61,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:49:30','Desktop','windows','C','2015-12-31 21:49:30',1),(62,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 21:52:37','Desktop','windows','C','2015-12-31 21:52:37',1),(63,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:00:20','Desktop','windows','C','2015-12-31 22:00:20',1),(64,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:04:37','Desktop','windows','C','2015-12-31 22:04:37',1),(65,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:07:48','Desktop','windows','C','2015-12-31 22:07:48',1),(66,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:10:52','Desktop','windows','C','2015-12-31 22:10:52',1),(67,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:18:59','Desktop','windows','C','2015-12-31 22:18:59',1),(68,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:21:10','Desktop','windows','C','2015-12-31 22:21:10',1),(69,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:28:39','Desktop','windows','C','2015-12-31 22:28:39',1),(70,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:28:57','Desktop','windows','C','2015-12-31 22:28:57',1),(71,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:42:33','Desktop','windows','C','2015-12-31 22:42:33',1),(72,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:42:48','Desktop','windows','C','2015-12-31 22:42:48',1),(73,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:43:50','Desktop','windows','C','2015-12-31 22:43:50',1),(74,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:44:44','Desktop','windows','C','2015-12-31 22:44:44',1),(75,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:45:18','Desktop','windows','C','2015-12-31 22:45:18',1),(76,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:45:29','Desktop','windows','C','2015-12-31 22:45:29',1),(77,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:45:29','Desktop','windows','C','2015-12-31 22:45:29',1),(78,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:45:29','Desktop','windows','C','2015-12-31 22:45:29',1),(79,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:46:23','Desktop','windows','C','2015-12-31 22:46:23',1),(80,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:47:41','Desktop','windows','C','2015-12-31 22:47:41',1),(81,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:48:15','Desktop','windows','C','2015-12-31 22:48:15',1),(82,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:48:41','Desktop','windows','C','2015-12-31 22:48:41',1),(83,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:48:58','Desktop','windows','C','2015-12-31 22:48:58',1),(84,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:49:12','Desktop','windows','C','2015-12-31 22:49:12',1),(85,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:49:28','Desktop','windows','C','2015-12-31 22:49:28',1),(86,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:49:42','Desktop','windows','C','2015-12-31 22:49:42',1),(87,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:49:55','Desktop','windows','C','2015-12-31 22:49:55',0),(88,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:50:06','Desktop','windows','C','2015-12-31 22:50:06',0),(89,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:51:11','Desktop','windows','C','2015-12-31 22:51:11',0),(90,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:52:01','Desktop','windows','C','2015-12-31 22:52:01',0),(91,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:52:15','Desktop','windows','C','2015-12-31 22:52:15',0),(92,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:52:49','Desktop','windows','C','2015-12-31 22:52:49',2),(93,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:53:02','Desktop','windows','C','2015-12-31 22:53:02',2),(94,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:53:14','Desktop','windows','C','2015-12-31 22:53:14',2),(95,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:53:25','Desktop','windows','C','2015-12-31 22:53:25',2),(96,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:53:41','Desktop','windows','C','2015-12-31 22:53:41',2),(97,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:54:40','Desktop','windows','C','2015-12-31 22:54:40',2),(98,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:55:09','Desktop','windows','C','2015-12-31 22:55:09',2),(99,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:55:25','Desktop','windows','C','2015-12-31 22:55:25',2),(100,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:55:36','Desktop','windows','C','2015-12-31 22:55:36',2),(101,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:55:51','Desktop','windows','C','2015-12-31 22:55:51',2),(102,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:56:26','Desktop','windows','C','2015-12-31 22:56:26',2),(103,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 22:58:33','Desktop','windows','C','2015-12-31 22:58:33',2),(104,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:00:18','Desktop','windows','C','2015-12-31 23:00:18',2),(105,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:00:46','Desktop','windows','C','2015-12-31 23:00:46',2),(106,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:05:19','Desktop','windows','C','2015-12-31 23:05:19',2),(107,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:05:43','Desktop','windows','C','2015-12-31 23:05:43',2),(108,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:06:43','Desktop','windows','C','2015-12-31 23:06:43',2),(109,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:07:26','Desktop','windows','C','2015-12-31 23:07:26',2),(110,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:07:49','Desktop','windows','C','2015-12-31 23:07:49',2),(111,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:08:03','Desktop','windows','C','2015-12-31 23:08:03',2),(112,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:09:58','Desktop','windows','C','2015-12-31 23:09:58',2),(113,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:10:08','Desktop','windows','C','2015-12-31 23:10:08',2),(114,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:10:28','Desktop','windows','C','2015-12-31 23:10:28',2),(115,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:10:42','Desktop','windows','C','2015-12-31 23:10:42',2),(116,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:14:33','Desktop','windows','C','2015-12-31 23:14:33',2),(117,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:14:44','Desktop','windows','C','2015-12-31 23:14:44',2),(118,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:15:22','Desktop','windows','C','2015-12-31 23:15:22',2),(119,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:21:27','Desktop','windows','C','2015-12-31 23:21:27',2),(120,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:21:39','Desktop','windows','C','2015-12-31 23:21:39',2),(121,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:22:43','Desktop','windows','C','2015-12-31 23:22:43',2),(122,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:24:01','Desktop','windows','C','2015-12-31 23:24:01',2),(123,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:24:21','Desktop','windows','C','2015-12-31 23:24:21',2),(124,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:25:43','Desktop','windows','C','2015-12-31 23:25:43',2),(125,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:26:00','Desktop','windows','C','2015-12-31 23:26:00',2),(126,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2015-12-31 23:26:16','Desktop','windows','C','2015-12-31 23:26:16',2),(127,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:02:43','Desktop','windows','C','2016-01-01 09:02:43',0),(128,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:14:36','Desktop','windows','C','2016-01-01 09:14:36',0),(129,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:14:48','Desktop','windows','C','2016-01-01 09:14:48',0),(130,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:15:22','Desktop','windows','C','2016-01-01 09:15:22',0),(131,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:15:39','Desktop','windows','C','2016-01-01 09:15:39',0),(132,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:16:29','Desktop','windows','C','2016-01-01 09:16:29',0),(133,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:17:04','Desktop','windows','C','2016-01-01 09:17:04',0),(134,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:18:05','Desktop','windows','C','2016-01-01 09:18:05',0),(135,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:18:23','Desktop','windows','C','2016-01-01 09:18:23',0),(136,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:18:44','Desktop','windows','C','2016-01-01 09:18:44',0),(137,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:19:07','Desktop','windows','C','2016-01-01 09:19:07',0),(138,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:19:18','Desktop','windows','C','2016-01-01 09:19:18',0),(139,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:21:51','Desktop','windows','C','2016-01-01 09:21:51',0),(140,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:22:26','Desktop','windows','C','2016-01-01 09:22:26',0),(141,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:23:13','Desktop','windows','C','2016-01-01 09:23:13',0),(142,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:24:04','Desktop','windows','C','2016-01-01 09:24:04',0),(143,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:25:04','Desktop','windows','C','2016-01-01 09:25:04',0),(144,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:25:17','Desktop','windows','C','2016-01-01 09:25:17',0),(145,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:29:21','Desktop','windows','C','2016-01-01 09:29:21',0),(146,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:30:17','Desktop','windows','C','2016-01-01 09:30:17',0),(147,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:41:26','Desktop','windows','C','2016-01-01 09:41:26',0),(148,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:42:50','Desktop','windows','C','2016-01-01 09:42:50',0),(149,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:43:41','Desktop','windows','C','2016-01-01 09:43:41',0),(150,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:43:57','Desktop','windows','C','2016-01-01 09:43:57',0),(151,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:44:17','Desktop','windows','C','2016-01-01 09:44:17',0),(152,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:44:28','Desktop','windows','C','2016-01-01 09:44:28',0),(153,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:45:24','Desktop','windows','C','2016-01-01 09:45:24',0),(154,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:45:50','Desktop','windows','C','2016-01-01 09:45:50',0),(155,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:46:02','Desktop','windows','C','2016-01-01 09:46:02',0),(156,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:46:40','Desktop','windows','C','2016-01-01 09:46:40',0),(157,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:46:58','Desktop','windows','C','2016-01-01 09:46:58',0),(158,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:48:43','Desktop','windows','C','2016-01-01 09:48:43',0),(159,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:49:21','Desktop','windows','C','2016-01-01 09:49:21',0),(160,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:50:14','Desktop','windows','C','2016-01-01 09:50:14',0),(161,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:51:00','Desktop','windows','C','2016-01-01 09:51:00',0),(162,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:51:20','Desktop','windows','C','2016-01-01 09:51:20',0),(163,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:51:59','Desktop','windows','C','2016-01-01 09:51:59',0),(164,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:52:26','Desktop','windows','C','2016-01-01 09:52:26',0),(165,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:53:04','Desktop','windows','C','2016-01-01 09:53:04',0),(166,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:53:46','Desktop','windows','C','2016-01-01 09:53:46',0),(167,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:54:37','Desktop','windows','C','2016-01-01 09:54:37',0),(168,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:54:49','Desktop','windows','C','2016-01-01 09:54:49',0),(169,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:55:03','Desktop','windows','C','2016-01-01 09:55:03',0),(170,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:56:33','Desktop','windows','C','2016-01-01 09:56:33',0),(171,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:56:52','Desktop','windows','C','2016-01-01 09:56:52',0),(172,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:57:03','Desktop','windows','C','2016-01-01 09:57:03',0),(173,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 09:58:43','Desktop','windows','C','2016-01-01 09:58:43',0),(174,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:00:44','Desktop','windows','C','2016-01-01 10:00:44',0),(175,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:01:16','Desktop','windows','C','2016-01-01 10:01:16',0),(176,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:03:12','Desktop','windows','C','2016-01-01 10:03:12',3),(177,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:03:23','Desktop','windows','C','2016-01-01 10:03:23',3),(178,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:03:35','Desktop','windows','C','2016-01-01 10:03:35',3),(179,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:03:58','Desktop','windows','C','2016-01-01 10:03:58',3),(180,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:04:21','Desktop','windows','C','2016-01-01 10:04:21',3),(181,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:04:32','Desktop','windows','C','2016-01-01 10:04:32',3),(182,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:06:19','Desktop','windows','C','2016-01-01 10:06:19',3),(183,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:06:40','Desktop','windows','C','2016-01-01 10:06:40',3),(184,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:07:11','Desktop','windows','C','2016-01-01 10:07:11',3),(185,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:07:34','Desktop','windows','C','2016-01-01 10:07:34',3),(186,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:08:11','Desktop','windows','C','2016-01-01 10:08:11',3),(187,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:08:27','Desktop','windows','C','2016-01-01 10:08:27',3),(188,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:09:59','Desktop','windows','C','2016-01-01 10:09:59',3),(189,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:10:14','Desktop','windows','C','2016-01-01 10:10:14',3),(190,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:11:38','Desktop','windows','C','2016-01-01 10:11:38',3),(191,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:12:42','Desktop','windows','C','2016-01-01 10:12:42',0),(192,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:12:54','Desktop','windows','C','2016-01-01 10:12:54',0),(193,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:13:06','Desktop','windows','C','2016-01-01 10:13:06',6),(194,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:13:18','Desktop','windows','C','2016-01-01 10:13:18',0),(195,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:15:45','Desktop','windows','C','2016-01-01 10:15:45',0),(196,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:15:56','Desktop','windows','C','2016-01-01 10:15:56',0),(197,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:16:31','Desktop','windows','C','2016-01-01 10:16:31',0),(198,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:17:35','Desktop','windows','C','2016-01-01 10:17:35',0),(199,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:18:19','Desktop','windows','C','2016-01-01 10:18:19',0),(200,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:18:33','Desktop','windows','C','2016-01-01 10:18:33',0),(201,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:18:50','Desktop','windows','C','2016-01-01 10:18:50',0),(202,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:19:05','Desktop','windows','C','2016-01-01 10:19:05',0),(203,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:19:20','Desktop','windows','C','2016-01-01 10:19:20',0),(204,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:19:31','Desktop','windows','C','2016-01-01 10:19:31',0),(205,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:19:51','Desktop','windows','C','2016-01-01 10:19:51',0),(206,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:20:05','Desktop','windows','C','2016-01-01 10:20:05',0),(207,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:20:17','Desktop','windows','C','2016-01-01 10:20:17',0),(208,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:21:52','Desktop','windows','C','2016-01-01 10:21:52',0),(209,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:22:41','Desktop','windows','C','2016-01-01 10:22:41',3),(210,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:22:55','Desktop','windows','C','2016-01-01 10:22:55',3),(211,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:24:31','Desktop','windows','C','2016-01-01 10:24:31',3),(212,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:00','Desktop','windows','C','2016-01-01 10:25:00',3),(213,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:20','Desktop','windows','C','2016-01-01 10:25:20',3),(214,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:40','Desktop','windows','C','2016-01-01 10:25:40',3),(215,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:25:53','Desktop','windows','C','2016-01-01 10:25:53',3),(216,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:26:07','Desktop','windows','C','2016-01-01 10:26:07',3),(217,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:26:42','Desktop','windows','C','2016-01-01 10:26:42',3),(218,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:27:15','Desktop','windows','C','2016-01-01 10:27:15',3),(219,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:29:06','Desktop','windows','C','2016-01-01 10:29:06',3),(220,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:29:53','Desktop','windows','C','2016-01-01 10:29:53',3),(221,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:30:04','Desktop','windows','C','2016-01-01 10:30:04',3),(222,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:30:16','Desktop','windows','C','2016-01-01 10:30:16',3),(223,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:31:10','Desktop','windows','C','2016-01-01 10:31:10',3),(224,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:31:46','Desktop','windows','C','2016-01-01 10:31:46',3),(225,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:32:08','Desktop','windows','C','2016-01-01 10:32:08',3),(226,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:33:29','Desktop','windows','C','2016-01-01 10:33:29',3),(227,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:34:19','Desktop','windows','C','2016-01-01 10:34:19',3),(228,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:34:34','Desktop','windows','C','2016-01-01 10:34:34',3),(229,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:35:12','Desktop','windows','C','2016-01-01 10:35:12',3),(230,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:35:35','Desktop','windows','C','2016-01-01 10:35:35',3),(231,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:36:15','Desktop','windows','C','2016-01-01 10:36:15',3),(232,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:37:06','Desktop','windows','C','2016-01-01 10:37:06',3),(233,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:37:23','Desktop','windows','C','2016-01-01 10:37:23',3),(234,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:37:34','Desktop','windows','C','2016-01-01 10:37:34',3),(235,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:38:24','Desktop','windows','C','2016-01-01 10:38:24',3),(236,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:38:37','Desktop','windows','C','2016-01-01 10:38:37',3),(237,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:40:26','Desktop','windows','C','2016-01-01 10:40:26',3),(238,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:41:27','Desktop','windows','C','2016-01-01 10:41:27',0),(239,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:41:40','Desktop','windows','C','2016-01-01 10:41:40',0),(240,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:03','Desktop','windows','C','2016-01-01 10:42:03',0),(241,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:15','Desktop','windows','C','2016-01-01 10:42:15',0),(242,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:26','Desktop','windows','C','2016-01-01 10:42:26',3),(243,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:41','Desktop','windows','C','2016-01-01 10:42:41',3),(244,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:42:53','Desktop','windows','C','2016-01-01 10:42:53',3),(245,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:43:48','Desktop','windows','C','2016-01-01 10:43:48',0),(246,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:44:06','Desktop','windows','C','2016-01-01 10:44:06',0),(247,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:44:18','Desktop','windows','C','2016-01-01 10:44:18',0),(248,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:44:29','Desktop','windows','C','2016-01-01 10:44:29',0),(249,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:44:42','Desktop','windows','C','2016-01-01 10:44:42',0),(250,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:44:54','Desktop','windows','C','2016-01-01 10:44:54',0),(251,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:45:06','Desktop','windows','C','2016-01-01 10:45:06',0),(252,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:45:17','Desktop','windows','C','2016-01-01 10:45:17',3),(253,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:45:28','Desktop','windows','C','2016-01-01 10:45:28',3),(254,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:45:39','Desktop','windows','C','2016-01-01 10:45:39',0),(255,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:47:14','Desktop','windows','C','2016-01-01 10:47:14',0),(256,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:48:00','Desktop','windows','C','2016-01-01 10:48:00',0),(257,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:48:11','Desktop','windows','C','2016-01-01 10:48:11',3),(258,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:50:04','Desktop','windows','C','2016-01-01 10:50:04',3),(259,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:50:37','Desktop','windows','C','2016-01-01 10:50:37',3),(260,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:50:51','Desktop','windows','C','2016-01-01 10:50:51',3),(261,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:51:43','Desktop','windows','C','2016-01-01 10:51:43',0),(262,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:52:47','Desktop','windows','C','2016-01-01 10:52:47',0),(263,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:53:34','Desktop','windows','C','2016-01-01 10:53:34',0),(264,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:54:14','Desktop','windows','C','2016-01-01 10:54:14',0),(265,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:54:34','Desktop','windows','C','2016-01-01 10:54:34',0),(266,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:54:49','Desktop','windows','C','2016-01-01 10:54:49',0),(267,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:55:01','Desktop','windows','C','2016-01-01 10:55:01',0),(268,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 10:55:22','Desktop','windows','C','2016-01-01 10:55:22',0),(269,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:05:26','Desktop','windows','C','2016-01-01 11:05:26',0),(270,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:06:09','Desktop','windows','C','2016-01-01 11:06:09',0),(271,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:07:37','Desktop','windows','C','2016-01-01 11:07:37',0),(272,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:07:51','Desktop','windows','C','2016-01-01 11:07:51',0),(273,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:03','Desktop','windows','C','2016-01-01 11:08:03',0),(274,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:14','Desktop','windows','C','2016-01-01 11:08:14',3),(275,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:08:29','Desktop','windows','C','2016-01-01 11:08:29',3),(276,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:42','Desktop','windows','C','2016-01-01 11:09:42',3),(277,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:09:53','Desktop','windows','C','2016-01-01 11:09:53',3),(278,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:11:30','Desktop','windows','C','2016-01-01 11:11:30',3),(279,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:11:59','Desktop','windows','C','2016-01-01 11:11:59',3),(280,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:13:01','Desktop','windows','C','2016-01-01 11:13:01',3),(281,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:14:09','Desktop','windows','C','2016-01-01 11:14:09',3),(282,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:14:51','Desktop','windows','C','2016-01-01 11:14:51',3),(283,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:19:57','Desktop','windows','C','2016-01-01 11:19:57',3),(284,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:20:10','Desktop','windows','C','2016-01-01 11:20:10',3),(285,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:27','Desktop','windows','C','2016-01-01 11:23:27',3),(286,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:23:48','Desktop','windows','C','2016-01-01 11:23:48',3),(287,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:11','Desktop','windows','C','2016-01-01 11:24:11',3),(288,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:24:26','Desktop','windows','C','2016-01-01 11:24:26',3),(289,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:25:07','Desktop','windows','C','2016-01-01 11:25:07',3),(290,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:25:33','Desktop','windows','C','2016-01-01 11:25:33',3),(291,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:25:56','Desktop','windows','C','2016-01-01 11:25:56',3),(292,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:29:25','Desktop','windows','C','2016-01-01 11:29:25',3),(293,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:29:43','Desktop','windows','C','2016-01-01 11:29:43',3),(294,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:30:06','Desktop','windows','C','2016-01-01 11:30:06',3),(295,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:30:26','Desktop','windows','C','2016-01-01 11:30:26',3),(296,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:31:40','Desktop','windows','C','2016-01-01 11:31:40',3),(297,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:31:53','Desktop','windows','C','2016-01-01 11:31:53',3),(298,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:05','Desktop','windows','C','2016-01-01 11:32:05',3),(299,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:35','Desktop','windows','C','2016-01-01 11:32:35',3),(300,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:32:56','Desktop','windows','C','2016-01-01 11:32:56',3),(301,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:33:19','Desktop','windows','C','2016-01-01 11:33:19',3),(302,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:34:28','Desktop','windows','C','2016-01-01 11:34:28',3),(303,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:35:14','Desktop','windows','C','2016-01-01 11:35:14',3),(304,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:36:23','Desktop','windows','C','2016-01-01 11:36:23',3),(305,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:36:59','Desktop','windows','C','2016-01-01 11:36:59',3),(306,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:26','Desktop','windows','C','2016-01-01 11:37:26',3),(307,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:37:48','Desktop','windows','C','2016-01-01 11:37:48',3),(308,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:12','Desktop','windows','C','2016-01-01 11:38:12',3),(309,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:27','Desktop','windows','C','2016-01-01 11:38:27',3),(310,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:38:45','Desktop','windows','C','2016-01-01 11:38:45',3),(311,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:05','Desktop','windows','C','2016-01-01 11:39:05',3),(312,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:39:17','Desktop','windows','C','2016-01-01 11:39:17',3),(313,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:40:40','Desktop','windows','C','2016-01-01 11:40:40',3),(314,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:40:55','Desktop','windows','C','2016-01-01 11:40:55',3),(315,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:21','Desktop','windows','C','2016-01-01 11:41:21',3),(316,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:34','Desktop','windows','C','2016-01-01 11:41:34',3),(317,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:41:56','Desktop','windows','C','2016-01-01 11:41:56',3),(318,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:42:52','Desktop','windows','C','2016-01-01 11:42:52',3),(319,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:43:15','Desktop','windows','C','2016-01-01 11:43:15',3),(320,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:07','Desktop','windows','C','2016-01-01 11:44:07',3),(321,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:38','Desktop','windows','C','2016-01-01 11:44:38',3),(322,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:44:55','Desktop','windows','C','2016-01-01 11:44:55',3),(323,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:45:20','Desktop','windows','C','2016-01-01 11:45:20',3),(324,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:45:47','Desktop','windows','C','2016-01-01 11:45:47',3),(325,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:02','Desktop','windows','C','2016-01-01 11:46:02',3),(326,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:27','Desktop','windows','C','2016-01-01 11:46:27',3),(327,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:46:46','Desktop','windows','C','2016-01-01 11:46:46',3),(328,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:05','Desktop','windows','C','2016-01-01 11:47:05',3),(329,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:18','Desktop','windows','C','2016-01-01 11:47:18',3),(330,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:47:35','Desktop','windows','C','2016-01-01 11:47:35',3),(331,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 11:57:54','Desktop','windows','C','2016-01-01 11:57:54',3),(332,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 14:04:01','Desktop','windows','C','2016-01-01 14:04:01',0),(333,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 14:04:13','Desktop','windows','C','2016-01-01 14:04:13',0),(334,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 14:20:18','Desktop','windows','C','2016-01-01 14:20:18',0),(335,'Google Chrome','Google Chrome','192.168.1.101','2016-01-01 14:23:43','Desktop','windows','C','2016-01-01 14:23:43',0),(336,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:07:46','Desktop','windows','C','2016-01-01 16:07:46',0),(337,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:11:51','Desktop','windows','C','2016-01-01 16:11:51',0),(338,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:12:08','Desktop','windows','C','2016-01-01 16:12:08',0),(339,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:12:20','Desktop','windows','C','2016-01-01 16:12:20',0),(340,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:12:44','Desktop','windows','C','2016-01-01 16:12:44',3),(341,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:12:57','Desktop','windows','C','2016-01-01 16:12:57',3),(342,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:17','Desktop','windows','C','2016-01-01 16:13:17',3),(343,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:34','Desktop','windows','C','2016-01-01 16:13:34',3),(344,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:47','Desktop','windows','C','2016-01-01 16:13:47',3),(345,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:13:58','Desktop','windows','C','2016-01-01 16:13:58',3),(346,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:14:09','Desktop','windows','C','2016-01-01 16:14:09',3),(347,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:17:26','Desktop','windows','C','2016-01-01 16:17:26',3),(348,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:17:56','Desktop','windows','C','2016-01-01 16:17:56',3),(349,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:18:14','Desktop','windows','C','2016-01-01 16:18:14',3),(350,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:18:29','Desktop','windows','C','2016-01-01 16:18:29',3),(351,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:18:40','Desktop','windows','C','2016-01-01 16:18:40',0),(352,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:20:23','Desktop','windows','C','2016-01-01 16:20:23',0),(353,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:21:13','Desktop','windows','C','2016-01-01 16:21:13',0),(354,'Google Chrome','Google Chrome','192.168.1.100','2016-01-01 16:56:34','Desktop','windows','C','2016-01-01 16:56:34',0),(355,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 07:48:08','Desktop','windows','C','2016-01-02 07:48:08',0),(356,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 07:59:53','Desktop','windows','C','2016-01-02 07:59:53',0),(357,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:00:06','Desktop','windows','C','2016-01-02 08:00:06',3),(358,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:00:22','Desktop','windows','C','2016-01-02 08:00:22',0),(359,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:01:06','Desktop','windows','C','2016-01-02 08:01:06',0),(360,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:01:26','Desktop','windows','C','2016-01-02 08:01:26',0),(361,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:01:41','Desktop','windows','C','2016-01-02 08:01:41',0),(362,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:02:05','Desktop','windows','C','2016-01-02 08:02:05',3),(363,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:05:05','Desktop','windows','C','2016-01-02 08:05:05',3),(364,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:06:09','Desktop','windows','C','2016-01-02 08:06:09',3),(365,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:07:39','Desktop','windows','C','2016-01-02 08:07:39',3),(366,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:08:57','Desktop','windows','C','2016-01-02 08:08:57',3),(367,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:09:42','Desktop','windows','C','2016-01-02 08:09:42',3),(368,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:10:27','Desktop','windows','C','2016-01-02 08:10:27',3),(369,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:12:25','Desktop','windows','C','2016-01-02 08:12:25',3),(370,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:13:41','Desktop','windows','C','2016-01-02 08:13:41',3),(371,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:14:55','Desktop','windows','C','2016-01-02 08:14:55',3),(372,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:18:53','Desktop','windows','C','2016-01-02 08:18:53',3),(373,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:19:04','Desktop','windows','C','2016-01-02 08:19:04',3),(374,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:02','Desktop','windows','C','2016-01-02 08:20:02',3),(375,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:17','Desktop','windows','C','2016-01-02 08:20:17',3),(376,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:30','Desktop','windows','C','2016-01-02 08:20:30',3),(377,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:45','Desktop','windows','C','2016-01-02 08:20:45',3),(378,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:20:56','Desktop','windows','C','2016-01-02 08:20:56',3),(379,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:21:24','Desktop','windows','C','2016-01-02 08:21:24',3),(380,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:23:01','Desktop','windows','C','2016-01-02 08:23:01',3),(381,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:24:14','Desktop','windows','C','2016-01-02 08:24:14',3),(382,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:27:59','Desktop','windows','C','2016-01-02 08:27:59',3),(383,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:31:48','Desktop','windows','C','2016-01-02 08:31:48',3),(384,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:32:29','Desktop','windows','C','2016-01-02 08:32:29',3),(385,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:32:43','Desktop','windows','C','2016-01-02 08:32:43',3),(386,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:35:27','Desktop','windows','C','2016-01-02 08:35:27',3),(387,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:35:39','Desktop','windows','C','2016-01-02 08:35:39',3),(388,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:35:55','Desktop','windows','C','2016-01-02 08:35:55',0),(389,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:37:53','Desktop','windows','C','2016-01-02 08:37:53',2),(390,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:38:14','Desktop','windows','C','2016-01-02 08:38:14',2),(391,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:39:07','Desktop','windows','C','2016-01-02 08:39:07',2),(392,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:39:54','Desktop','windows','C','2016-01-02 08:39:54',2),(393,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:40:10','Desktop','windows','C','2016-01-02 08:40:10',2),(394,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:40:29','Desktop','windows','C','2016-01-02 08:40:29',2),(395,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:40:40','Desktop','windows','C','2016-01-02 08:40:40',2),(396,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:41:00','Desktop','windows','C','2016-01-02 08:41:00',2),(397,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:44:05','Desktop','windows','C','2016-01-02 08:44:05',2),(398,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:44:31','Desktop','windows','C','2016-01-02 08:44:31',2),(399,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 08:44:42','Desktop','windows','C','2016-01-02 08:44:42',2),(400,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:06:36','Desktop','windows','C','2016-01-02 09:06:36',2),(401,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:06:47','Desktop','windows','C','2016-01-02 09:06:47',0),(402,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:07:08','Desktop','windows','C','2016-01-02 09:07:08',0),(403,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:13:28','Desktop','windows','C','2016-01-02 09:13:28',0),(404,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:16:14','Desktop','windows','C','2016-01-02 09:16:14',0),(405,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:16:46','Desktop','windows','C','2016-01-02 09:16:46',0),(406,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:20:35','Desktop','windows','C','2016-01-02 09:20:35',0),(407,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:21:50','Desktop','windows','C','2016-01-02 09:21:50',0),(408,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:24:26','Desktop','windows','C','2016-01-02 09:24:26',0),(409,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:08','Desktop','windows','C','2016-01-02 09:25:08',0),(410,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:20','Desktop','windows','C','2016-01-02 09:25:20',0),(411,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:32','Desktop','windows','C','2016-01-02 09:25:32',0),(412,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:25:50','Desktop','windows','C','2016-01-02 09:25:50',0),(413,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:26:01','Desktop','windows','C','2016-01-02 09:26:01',0),(414,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:26:12','Desktop','windows','C','2016-01-02 09:26:12',0),(415,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:26:23','Desktop','windows','C','2016-01-02 09:26:23',0),(416,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:26:34','Desktop','windows','C','2016-01-02 09:26:34',0),(417,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:27:05','Desktop','windows','C','2016-01-02 09:27:05',0),(418,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:27:34','Desktop','windows','C','2016-01-02 09:27:34',0),(419,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:27:50','Desktop','windows','C','2016-01-02 09:27:50',0),(420,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:29:25','Desktop','windows','C','2016-01-02 09:29:25',0),(421,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:29:45','Desktop','windows','C','2016-01-02 09:29:45',0),(422,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:29:56','Desktop','windows','C','2016-01-02 09:29:56',0),(423,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:30:07','Desktop','windows','C','2016-01-02 09:30:07',0),(424,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:53:50','Desktop','windows','C','2016-01-02 09:53:50',0),(425,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:56:01','Desktop','windows','C','2016-01-02 09:56:01',0),(426,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:56:17','Desktop','windows','C','2016-01-02 09:56:17',0),(427,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:57:59','Desktop','windows','C','2016-01-02 09:57:59',0),(428,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:58:57','Desktop','windows','C','2016-01-02 09:58:57',0),(429,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 09:59:10','Desktop','windows','C','2016-01-02 09:59:10',0),(430,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:00:53','Desktop','windows','C','2016-01-02 10:00:53',0),(431,'Apple Safari','Apple Safari','192.168.1.101','2016-01-02 10:01:33','Mobile','mac','C','2016-01-02 10:01:33',0),(432,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:03:48','Mobile','linux','C','2016-01-02 10:03:48',0),(433,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:04:06','Desktop','windows','C','2016-01-02 10:04:06',0),(434,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:04:20','Desktop','windows','C','2016-01-02 10:04:20',0),(435,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:04:31','Desktop','windows','C','2016-01-02 10:04:31',3),(436,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:04:46','Desktop','windows','C','2016-01-02 10:04:46',3),(437,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:04:58','Desktop','windows','C','2016-01-02 10:04:58',3),(438,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:05:27','Desktop','windows','C','2016-01-02 10:05:27',3),(439,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:11:42','Desktop','windows','C','2016-01-02 10:11:42',3),(440,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:13:22','Desktop','windows','C','2016-01-02 10:13:22',3),(441,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:13:42','Desktop','windows','C','2016-01-02 10:13:42',3),(442,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:14:47','Desktop','windows','C','2016-01-02 10:14:47',3),(443,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:16:29','Desktop','windows','C','2016-01-02 10:16:29',3),(444,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:18:10','Desktop','windows','C','2016-01-02 10:18:10',3),(445,'Apple Safari','Apple Safari','192.168.1.101','2016-01-02 10:20:44','Mobile','mac','C','2016-01-02 10:20:44',0),(446,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:21:11','Desktop','windows','C','2016-01-02 10:21:11',0),(447,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:23:12','Desktop','windows','C','2016-01-02 10:23:12',3),(448,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:24:32','Desktop','windows','C','2016-01-02 10:24:32',0),(449,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:25:32','Desktop','windows','C','2016-01-02 10:25:32',0),(450,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:27:27','Desktop','windows','C','2016-01-02 10:27:27',0),(451,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:27:53','Desktop','windows','C','2016-01-02 10:27:53',0),(452,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:28:05','Desktop','windows','C','2016-01-02 10:28:05',3),(453,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:30:17','Desktop','windows','C','2016-01-02 10:30:17',3),(454,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:30:59','Desktop','windows','C','2016-01-02 10:30:59',3),(455,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:32:47','Desktop','windows','C','2016-01-02 10:32:47',3),(456,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:34:38','Desktop','windows','C','2016-01-02 10:34:38',3),(457,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:35:29','Desktop','windows','C','2016-01-02 10:35:29',3),(458,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:36:33','Desktop','windows','C','2016-01-02 10:36:33',3),(459,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:38:17','Desktop','windows','C','2016-01-02 10:38:17',3),(460,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:40:22','Desktop','windows','C','2016-01-02 10:40:22',3),(461,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:40:41','Desktop','windows','C','2016-01-02 10:40:41',3),(462,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:41:42','Desktop','windows','C','2016-01-02 10:41:42',3),(463,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:42:22','Desktop','windows','C','2016-01-02 10:42:22',3),(464,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:43:35','Desktop','windows','C','2016-01-02 10:43:35',3),(465,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:44:01','Desktop','windows','C','2016-01-02 10:44:01',3),(466,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:44:15','Desktop','windows','C','2016-01-02 10:44:15',3),(467,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:45:05','Desktop','windows','C','2016-01-02 10:45:05',3),(468,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:45:30','Desktop','windows','C','2016-01-02 10:45:30',3),(469,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:47:08','Desktop','windows','C','2016-01-02 10:47:08',3),(470,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:48:57','Desktop','windows','C','2016-01-02 10:48:57',3),(471,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:51:31','Desktop','windows','C','2016-01-02 10:51:31',3),(472,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:52:29','Desktop','windows','C','2016-01-02 10:52:29',3),(473,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:52:45','Desktop','windows','C','2016-01-02 10:52:45',3),(474,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:54:42','Desktop','windows','C','2016-01-02 10:54:42',3),(475,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:55:05','Desktop','windows','C','2016-01-02 10:55:05',3),(476,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:55:50','Desktop','windows','C','2016-01-02 10:55:50',3),(477,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:56:51','Desktop','windows','C','2016-01-02 10:56:51',3),(478,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:58:03','Desktop','windows','C','2016-01-02 10:58:03',3),(479,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 10:58:55','Desktop','windows','C','2016-01-02 10:58:55',3),(480,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:00:23','Desktop','windows','C','2016-01-02 11:00:23',3),(481,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:01:49','Desktop','windows','C','2016-01-02 11:01:49',3),(482,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:02:00','Desktop','windows','C','2016-01-02 11:02:00',3),(483,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:02:17','Desktop','windows','C','2016-01-02 11:02:17',3),(484,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:04:17','Desktop','windows','C','2016-01-02 11:04:17',3),(485,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:04:52','Desktop','windows','C','2016-01-02 11:04:52',3),(486,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:05:04','Desktop','windows','C','2016-01-02 11:05:04',3),(487,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:05:22','Desktop','windows','C','2016-01-02 11:05:22',3),(488,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:07:27','Desktop','windows','C','2016-01-02 11:07:27',3),(489,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:08:06','Desktop','windows','C','2016-01-02 11:08:06',3),(490,'Google Chrome','Google Chrome','192.168.1.101','2016-01-02 11:08:20','Desktop','windows','C','2016-01-02 11:08:20',3),(491,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:20:55','Desktop','windows','C','2016-01-02 12:20:55',3),(492,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:24:06','Desktop','windows','C','2016-01-02 12:24:06',3),(493,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:25:19','Desktop','windows','C','2016-01-02 12:25:19',0),(494,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:26:56','Desktop','windows','C','2016-01-02 12:26:56',0),(495,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:32:00','Desktop','windows','C','2016-01-02 12:32:00',0),(496,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:32:32','Desktop','windows','C','2016-01-02 12:32:32',0),(497,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:32:48','Desktop','windows','C','2016-01-02 12:32:48',0),(498,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:33:10','Desktop','windows','C','2016-01-02 12:33:10',0),(499,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:33:24','Desktop','windows','C','2016-01-02 12:33:24',0),(500,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:35:04','Mobile','mac','C','2016-01-02 12:35:04',0),(501,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:36:27','Mobile','mac','C','2016-01-02 12:36:27',0),(502,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:37:01','Mobile','mac','C','2016-01-02 12:37:01',0),(503,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:37:49','Mobile','mac','C','2016-01-02 12:37:49',0),(504,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:38:36','Mobile','mac','C','2016-01-02 12:38:36',0),(505,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:40:30','Mobile','mac','C','2016-01-02 12:40:30',0),(506,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:41:16','Mobile','mac','C','2016-01-02 12:41:16',0),(507,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:41:57','Mobile','mac','C','2016-01-02 12:41:57',0),(508,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:42:47','Mobile','mac','C','2016-01-02 12:42:47',0),(509,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:43:12','Mobile','mac','C','2016-01-02 12:43:12',0),(510,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:44:35','Mobile','mac','C','2016-01-02 12:44:35',0),(511,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:45:05','Mobile','mac','C','2016-01-02 12:45:05',0),(512,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:47:38','Mobile','mac','C','2016-01-02 12:47:38',0),(513,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:48:21','Mobile','mac','C','2016-01-02 12:48:21',0),(514,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:48:41','Desktop','windows','C','2016-01-02 12:48:41',0),(515,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:49:27','Desktop','windows','C','2016-01-02 12:49:27',0),(516,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:49:38','Desktop','windows','C','2016-01-02 12:49:38',0),(517,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:49:54','Desktop','windows','C','2016-01-02 12:49:54',0),(518,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:51:32','Mobile','mac','C','2016-01-02 12:51:32',0),(519,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:51:49','Mobile','mac','C','2016-01-02 12:51:49',3),(520,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:52:03','Mobile','mac','C','2016-01-02 12:52:03',3),(521,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:52:17','Mobile','mac','C','2016-01-02 12:52:17',3),(522,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:54:24','Mobile','mac','C','2016-01-02 12:54:24',3),(523,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 12:54:45','Mobile','mac','C','2016-01-02 12:54:45',3),(524,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:55:21','Desktop','windows','C','2016-01-02 12:55:21',0),(525,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:55:32','Desktop','windows','C','2016-01-02 12:55:32',0),(526,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:55:55','Desktop','windows','C','2016-01-02 12:55:55',3),(527,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:56:27','Desktop','windows','C','2016-01-02 12:56:27',3),(528,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 12:59:11','Desktop','windows','C','2016-01-02 12:59:11',3),(529,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:01:19','Desktop','windows','C','2016-01-02 13:01:19',3),(530,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:01:59','Mobile','linux','C','2016-01-02 13:01:59',0),(531,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:02:11','Mobile','linux','C','2016-01-02 13:02:11',0),(532,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:02:34','Mobile','mac','C','2016-01-02 13:02:34',0),(533,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:02:55','Mobile','mac','C','2016-01-02 13:02:55',3),(534,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:03:07','Mobile','mac','C','2016-01-02 13:03:07',3),(535,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:03:19','Mobile','mac','C','2016-01-02 13:03:19',3),(536,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:03:41','Mobile','mac','C','2016-01-02 13:03:41',3),(537,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:03:52','Mobile','mac','C','2016-01-02 13:03:52',3),(538,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:04:13','Mobile','mac','C','2016-01-02 13:04:13',3),(539,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 13:04:43','Mobile','mac','C','2016-01-02 13:04:43',3),(540,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:05:48','Desktop','windows','C','2016-01-02 13:05:48',0),(541,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:06:37','Desktop','windows','C','2016-01-02 13:06:37',0),(542,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:11:31','Desktop','windows','C','2016-01-02 13:11:31',0),(543,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:11:47','Desktop','windows','C','2016-01-02 13:11:47',3),(544,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:16:31','Desktop','windows','C','2016-01-02 13:16:31',3),(545,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:17:33','Desktop','windows','C','2016-01-02 13:17:33',3),(546,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:19:25','Desktop','windows','C','2016-01-02 13:19:25',3),(547,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:21:06','Desktop','windows','C','2016-01-02 13:21:06',3),(548,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:21:30','Desktop','windows','C','2016-01-02 13:21:30',3),(549,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:22:19','Desktop','windows','C','2016-01-02 13:22:19',3),(550,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:23:08','Desktop','windows','C','2016-01-02 13:23:08',3),(551,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:24:22','Desktop','windows','C','2016-01-02 13:24:22',3),(552,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:24:56','Desktop','windows','C','2016-01-02 13:24:56',3),(553,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:25:16','Desktop','windows','C','2016-01-02 13:25:16',3),(554,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:25:42','Desktop','windows','C','2016-01-02 13:25:42',3),(555,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:27:29','Desktop','windows','C','2016-01-02 13:27:29',3),(556,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:27:42','Desktop','windows','C','2016-01-02 13:27:42',3),(557,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:28:10','Desktop','windows','C','2016-01-02 13:28:10',3),(558,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:28:26','Desktop','windows','C','2016-01-02 13:28:26',3),(559,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:29:12','Desktop','windows','C','2016-01-02 13:29:12',3),(560,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:30:55','Desktop','windows','C','2016-01-02 13:30:55',3),(561,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:31:16','Desktop','windows','C','2016-01-02 13:31:16',3),(562,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:32:35','Desktop','windows','C','2016-01-02 13:32:35',3),(563,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:24','Desktop','windows','C','2016-01-02 13:33:24',3),(564,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:43','Desktop','windows','C','2016-01-02 13:33:43',3),(565,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:33:54','Desktop','windows','C','2016-01-02 13:33:54',3),(566,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:34:31','Desktop','windows','C','2016-01-02 13:34:31',3),(567,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:34:46','Desktop','windows','C','2016-01-02 13:34:46',3),(568,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:35:30','Desktop','windows','C','2016-01-02 13:35:30',3),(569,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:35:43','Desktop','windows','C','2016-01-02 13:35:43',3),(570,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:35:55','Desktop','windows','C','2016-01-02 13:35:55',3),(571,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:40:05','Desktop','windows','C','2016-01-02 13:40:05',3),(572,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:44:55','Desktop','windows','C','2016-01-02 13:44:55',3),(573,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:45:21','Desktop','windows','C','2016-01-02 13:45:21',3),(574,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:45:33','Desktop','windows','C','2016-01-02 13:45:33',0),(575,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 13:45:44','Desktop','windows','C','2016-01-02 13:45:44',1),(576,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:09:03','Desktop','windows','C','2016-01-02 14:09:03',1),(577,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:13:20','Desktop','windows','C','2016-01-02 14:13:20',1),(578,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:17:41','Desktop','windows','C','2016-01-02 14:17:41',1),(579,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:20:02','Desktop','windows','C','2016-01-02 14:20:02',1),(580,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:21:45','Desktop','windows','C','2016-01-02 14:21:45',1),(581,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:22:17','Desktop','windows','C','2016-01-02 14:22:17',1),(582,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:23:11','Desktop','windows','C','2016-01-02 14:23:11',1),(583,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:23:42','Desktop','windows','C','2016-01-02 14:23:42',1),(584,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:24:19','Desktop','windows','C','2016-01-02 14:24:19',1),(585,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:33:06','Desktop','windows','C','2016-01-02 14:33:06',1),(586,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 14:33:18','Desktop','windows','C','2016-01-02 14:33:18',1),(587,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:25:55','Desktop','windows','C','2016-01-02 17:25:55',0),(588,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:26:06','Desktop','windows','C','2016-01-02 17:26:06',0),(589,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:26:57','Desktop','windows','C','2016-01-02 17:26:57',0),(590,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:27:48','Desktop','windows','C','2016-01-02 17:27:48',0),(591,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:28:06','Desktop','windows','C','2016-01-02 17:28:06',0),(592,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:29:35','Desktop','windows','C','2016-01-02 17:29:35',0),(593,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:32:39','Desktop','windows','C','2016-01-02 17:32:39',0),(594,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:33:02','Desktop','windows','C','2016-01-02 17:33:02',0),(595,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:35:06','Desktop','windows','C','2016-01-02 17:35:06',0),(596,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:35:32','Desktop','windows','C','2016-01-02 17:35:32',0),(597,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:36:01','Desktop','windows','C','2016-01-02 17:36:01',0),(598,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:36:21','Desktop','windows','C','2016-01-02 17:36:21',0),(599,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:37:03','Desktop','windows','C','2016-01-02 17:37:03',0),(600,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:38:53','Desktop','windows','C','2016-01-02 17:38:53',0),(601,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:39:16','Desktop','windows','C','2016-01-02 17:39:16',0),(602,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:40:38','Desktop','windows','C','2016-01-02 17:40:38',0),(603,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:45:26','Desktop','windows','C','2016-01-02 17:45:26',0),(604,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:45:42','Desktop','windows','C','2016-01-02 17:45:42',0),(605,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:46:16','Desktop','windows','C','2016-01-02 17:46:16',0),(606,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:48:31','Desktop','windows','C','2016-01-02 17:48:31',0),(607,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:49:32','Desktop','windows','C','2016-01-02 17:49:32',0),(608,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:49:44','Desktop','windows','C','2016-01-02 17:49:44',0),(609,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:50:55','Desktop','windows','C','2016-01-02 17:50:55',0),(610,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:52:48','Desktop','windows','C','2016-01-02 17:52:48',0),(611,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:53:36','Desktop','windows','C','2016-01-02 17:53:36',0),(612,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:53:51','Desktop','windows','C','2016-01-02 17:53:51',0),(613,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:56:46','Desktop','windows','C','2016-01-02 17:56:46',0),(614,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:56:57','Desktop','windows','C','2016-01-02 17:56:57',0),(615,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 17:57:12','Desktop','windows','C','2016-01-02 17:57:12',0),(616,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:02:23','Desktop','windows','C','2016-01-02 18:02:23',0),(617,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:02:44','Desktop','windows','C','2016-01-02 18:02:44',0),(618,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:03:11','Desktop','windows','C','2016-01-02 18:03:11',0),(619,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:03:42','Desktop','windows','C','2016-01-02 18:03:42',0),(620,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:03:58','Desktop','windows','C','2016-01-02 18:03:58',0),(621,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:04:20','Desktop','windows','C','2016-01-02 18:04:20',0),(622,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:04:42','Desktop','windows','C','2016-01-02 18:04:42',0),(623,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:04:53','Desktop','windows','C','2016-01-02 18:04:53',0),(624,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:06:26','Desktop','windows','C','2016-01-02 18:06:26',0),(625,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:06:37','Desktop','windows','C','2016-01-02 18:06:37',0),(626,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:06:59','Desktop','windows','C','2016-01-02 18:06:59',0),(627,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:07:36','Desktop','windows','C','2016-01-02 18:07:36',0),(628,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:07:50','Desktop','windows','C','2016-01-02 18:07:50',0),(629,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:08:22','Desktop','windows','C','2016-01-02 18:08:22',0),(630,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:09:12','Desktop','windows','C','2016-01-02 18:09:12',0),(631,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:11:59','Desktop','windows','C','2016-01-02 18:11:59',0),(632,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:12:16','Desktop','windows','C','2016-01-02 18:12:16',0),(633,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:12:28','Desktop','windows','C','2016-01-02 18:12:28',0),(634,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:12:54','Desktop','windows','C','2016-01-02 18:12:54',0),(635,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:13:15','Desktop','windows','C','2016-01-02 18:13:15',0),(636,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:13:48','Desktop','windows','C','2016-01-02 18:13:48',0),(637,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:14:08','Desktop','windows','C','2016-01-02 18:14:08',0),(638,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:14:55','Desktop','windows','C','2016-01-02 18:14:55',0),(639,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:15:08','Desktop','windows','C','2016-01-02 18:15:08',0),(640,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:15:19','Desktop','windows','C','2016-01-02 18:15:19',0),(641,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:21:12','Desktop','windows','C','2016-01-02 18:21:12',0),(642,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:22:07','Desktop','windows','C','2016-01-02 18:22:07',0),(643,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:23:01','Desktop','windows','C','2016-01-02 18:23:01',0),(644,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:29:58','Desktop','windows','C','2016-01-02 18:29:58',0),(645,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:45:06','Desktop','windows','C','2016-01-02 18:45:06',0),(646,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:45:27','Desktop','windows','C','2016-01-02 18:45:27',0),(647,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:47:46','Desktop','windows','C','2016-01-02 18:47:46',0),(648,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:48:41','Desktop','windows','C','2016-01-02 18:48:41',0),(649,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:49:10','Desktop','windows','C','2016-01-02 18:49:10',0),(650,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:53:48','Desktop','windows','C','2016-01-02 18:53:48',0),(651,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:54:21','Desktop','windows','C','2016-01-02 18:54:21',0),(652,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:55:09','Desktop','windows','C','2016-01-02 18:55:09',0),(653,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 18:57:14','Desktop','windows','C','2016-01-02 18:57:14',0),(654,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:01:23','Desktop','windows','C','2016-01-02 19:01:23',0),(655,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:03:05','Desktop','windows','C','2016-01-02 19:03:05',0),(656,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:03:16','Desktop','windows','C','2016-01-02 19:03:16',1),(657,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:03:42','Desktop','windows','C','2016-01-02 19:03:42',1),(658,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:04:51','Desktop','windows','C','2016-01-02 19:04:51',1),(659,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:05:16','Desktop','windows','C','2016-01-02 19:05:16',1),(660,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:08:03','Desktop','windows','C','2016-01-02 19:08:03',1),(661,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:08:53','Desktop','windows','C','2016-01-02 19:08:53',1),(662,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:09:22','Desktop','windows','C','2016-01-02 19:09:22',1),(663,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:12:23','Desktop','windows','C','2016-01-02 19:12:23',1),(664,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:12:57','Desktop','windows','C','2016-01-02 19:12:57',1),(665,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:20:58','Desktop','windows','C','2016-01-02 19:20:58',1),(666,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:22:08','Desktop','windows','C','2016-01-02 19:22:08',1),(667,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:27:03','Desktop','windows','C','2016-01-02 19:27:03',1),(668,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:27:17','Desktop','windows','C','2016-01-02 19:27:17',1),(669,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:27:31','Desktop','windows','C','2016-01-02 19:27:31',1),(670,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:27:58','Desktop','windows','C','2016-01-02 19:27:58',1),(671,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:29:13','Desktop','windows','C','2016-01-02 19:29:13',1),(672,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:29:27','Desktop','windows','C','2016-01-02 19:29:27',1),(673,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:29:49','Desktop','windows','C','2016-01-02 19:29:49',1),(674,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:31:19','Desktop','windows','C','2016-01-02 19:31:19',1),(675,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:33:29','Desktop','windows','C','2016-01-02 19:33:29',1),(676,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:33:42','Desktop','windows','C','2016-01-02 19:33:42',1),(677,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:35:18','Desktop','windows','C','2016-01-02 19:35:18',1),(678,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:37:58','Desktop','windows','C','2016-01-02 19:37:58',1),(679,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:39:28','Desktop','windows','C','2016-01-02 19:39:28',1),(680,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:39:54','Desktop','windows','C','2016-01-02 19:39:54',1),(681,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:40:09','Desktop','windows','C','2016-01-02 19:40:09',1),(682,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:40:31','Desktop','windows','C','2016-01-02 19:40:31',1),(683,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:44:17','Desktop','windows','C','2016-01-02 19:44:17',1),(684,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:44:30','Desktop','windows','C','2016-01-02 19:44:30',1),(685,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:55:55','Desktop','windows','C','2016-01-02 19:55:55',1),(686,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:57:33','Desktop','windows','C','2016-01-02 19:57:33',1),(687,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:58:40','Desktop','windows','C','2016-01-02 19:58:40',1),(688,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:59:09','Desktop','windows','C','2016-01-02 19:59:09',1),(689,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 19:59:54','Desktop','windows','C','2016-01-02 19:59:54',1),(690,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:00:09','Desktop','windows','C','2016-01-02 20:00:09',1),(691,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:01:19','Desktop','windows','C','2016-01-02 20:01:19',1),(692,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:02:58','Desktop','windows','C','2016-01-02 20:02:58',1),(693,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:03:35','Desktop','windows','C','2016-01-02 20:03:35',1),(694,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:03:47','Desktop','windows','C','2016-01-02 20:03:47',1),(695,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:05:39','Desktop','windows','C','2016-01-02 20:05:39',1),(696,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:06:18','Desktop','windows','C','2016-01-02 20:06:18',1),(697,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:08:32','Desktop','windows','C','2016-01-02 20:08:32',1),(698,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:08:48','Desktop','windows','C','2016-01-02 20:08:48',1),(699,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:09:16','Desktop','windows','C','2016-01-02 20:09:16',1),(700,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:10:45','Desktop','windows','C','2016-01-02 20:10:45',1),(701,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:27:58','Desktop','windows','C','2016-01-02 20:27:58',1),(702,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:28:22','Desktop','windows','C','2016-01-02 20:28:22',1),(703,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:29:34','Desktop','windows','C','2016-01-02 20:29:34',1),(704,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:30:16','Desktop','windows','C','2016-01-02 20:30:16',1),(705,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:30:55','Desktop','windows','C','2016-01-02 20:30:55',1),(706,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:31:14','Desktop','windows','C','2016-01-02 20:31:14',1),(707,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:31:34','Desktop','windows','C','2016-01-02 20:31:34',1),(708,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:32:41','Desktop','windows','C','2016-01-02 20:32:41',1),(709,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:41:52','Desktop','windows','C','2016-01-02 20:41:52',1),(710,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:42:13','Desktop','windows','C','2016-01-02 20:42:13',1),(711,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:42:35','Desktop','windows','C','2016-01-02 20:42:35',1),(712,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:42:48','Desktop','windows','C','2016-01-02 20:42:48',1),(713,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:44:30','Desktop','windows','C','2016-01-02 20:44:30',1),(714,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:44:42','Desktop','windows','C','2016-01-02 20:44:42',1),(715,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:45:03','Desktop','windows','C','2016-01-02 20:45:03',1),(716,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:45:18','Desktop','windows','C','2016-01-02 20:45:18',1),(717,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:46:25','Desktop','windows','C','2016-01-02 20:46:25',0),(718,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:48:47','Desktop','windows','C','2016-01-02 20:48:47',0),(719,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:49:14','Desktop','windows','C','2016-01-02 20:49:14',0),(720,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:50:52','Desktop','windows','C','2016-01-02 20:50:52',0),(721,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:51:06','Desktop','windows','C','2016-01-02 20:51:06',0),(722,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:52:15','Desktop','windows','C','2016-01-02 20:52:15',0),(723,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:52:52','Desktop','windows','C','2016-01-02 20:52:52',0),(724,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:55:08','Desktop','windows','C','2016-01-02 20:55:08',0),(725,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:55:19','Desktop','windows','C','2016-01-02 20:55:19',0),(726,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:55:38','Desktop','windows','C','2016-01-02 20:55:38',0),(727,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:56:58','Desktop','windows','C','2016-01-02 20:56:58',0),(728,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 20:57:24','Desktop','windows','C','2016-01-02 20:57:24',0),(729,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:00:55','Mobile','linux','C','2016-01-02 21:00:55',0),(730,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:01:24','Desktop','windows','C','2016-01-02 21:01:24',0),(731,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:01:38','Desktop','windows','C','2016-01-02 21:01:38',1),(732,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:01:55','Desktop','windows','C','2016-01-02 21:01:55',1),(733,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 21:02:12','Mobile','mac','C','2016-01-02 21:02:12',0),(734,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:02:28','Desktop','windows','C','2016-01-02 21:02:28',0),(735,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:02:41','Desktop','windows','C','2016-01-02 21:02:41',0),(736,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:03:17','Desktop','windows','C','2016-01-02 21:03:17',0),(737,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:03:28','Desktop','windows','C','2016-01-02 21:03:28',3),(738,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:04:15','Desktop','windows','C','2016-01-02 21:04:15',3),(739,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:04:47','Desktop','windows','C','2016-01-02 21:04:47',3),(740,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:07:03','Desktop','windows','C','2016-01-02 21:07:03',3),(741,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:07:54','Desktop','windows','C','2016-01-02 21:07:54',3),(742,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:08:07','Desktop','windows','C','2016-01-02 21:08:07',3),(743,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:08:21','Desktop','windows','C','2016-01-02 21:08:21',3),(744,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:08:35','Desktop','windows','C','2016-01-02 21:08:35',3),(745,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:09:01','Desktop','windows','C','2016-01-02 21:09:01',3),(746,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:09:17','Desktop','windows','C','2016-01-02 21:09:17',3),(747,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:09:29','Desktop','windows','C','2016-01-02 21:09:29',3),(748,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:10:53','Desktop','windows','C','2016-01-02 21:10:53',3),(749,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:12:46','Desktop','windows','C','2016-01-02 21:12:46',3),(750,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:14:24','Desktop','windows','C','2016-01-02 21:14:24',3),(751,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:14:38','Desktop','windows','C','2016-01-02 21:14:38',3),(752,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:14:56','Desktop','windows','C','2016-01-02 21:14:56',3),(753,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:15:08','Desktop','windows','C','2016-01-02 21:15:08',3),(754,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:16:05','Desktop','windows','C','2016-01-02 21:16:05',3),(755,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:16:16','Desktop','windows','C','2016-01-02 21:16:16',3),(756,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:16:50','Desktop','windows','C','2016-01-02 21:16:50',3),(757,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:17:27','Desktop','windows','C','2016-01-02 21:17:27',3),(758,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:17:39','Desktop','windows','C','2016-01-02 21:17:39',3),(759,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:17:50','Desktop','windows','C','2016-01-02 21:17:50',3),(760,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 21:18:26','Mobile','mac','C','2016-01-02 21:18:26',0),(761,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 21:18:47','Mobile','mac','C','2016-01-02 21:18:47',0),(762,'Apple Safari','Apple Safari','192.168.1.100','2016-01-02 21:19:09','Mobile','mac','C','2016-01-02 21:19:09',0),(763,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:20:30','Desktop','windows','C','2016-01-02 21:20:30',0),(764,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:21:50','Desktop','windows','C','2016-01-02 21:21:50',0),(765,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:02','Desktop','windows','C','2016-01-02 21:25:02',0),(766,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:13','Desktop','windows','C','2016-01-02 21:25:13',1),(767,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:26','Desktop','windows','C','2016-01-02 21:25:26',1),(768,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:40','Desktop','windows','C','2016-01-02 21:25:40',1),(769,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:25:54','Desktop','windows','C','2016-01-02 21:25:54',1),(770,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:26:19','Desktop','windows','C','2016-01-02 21:26:19',1),(771,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:27:16','Desktop','windows','C','2016-01-02 21:27:16',1),(772,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:27:42','Desktop','windows','C','2016-01-02 21:27:42',1),(773,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:29:10','Desktop','windows','C','2016-01-02 21:29:10',1),(774,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:29:23','Desktop','windows','C','2016-01-02 21:29:23',1),(775,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:29:49','Desktop','windows','C','2016-01-02 21:29:49',1),(776,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:02','Desktop','windows','C','2016-01-02 21:31:02',1),(777,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:18','Desktop','windows','C','2016-01-02 21:31:18',0),(778,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:30','Desktop','windows','C','2016-01-02 21:31:30',3),(779,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:44','Desktop','windows','C','2016-01-02 21:31:44',3),(780,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:31:57','Desktop','windows','C','2016-01-02 21:31:57',3),(781,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:33:07','Desktop','windows','C','2016-01-02 21:33:07',3),(782,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:38:16','Desktop','windows','C','2016-01-02 21:38:16',3),(783,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:38:29','Desktop','windows','C','2016-01-02 21:38:29',1),(784,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:38:49','Desktop','windows','C','2016-01-02 21:38:49',1),(785,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:39:22','Desktop','windows','C','2016-01-02 21:39:22',1),(786,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:42:03','Desktop','windows','C','2016-01-02 21:42:03',1),(787,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 21:55:28','Desktop','windows','C','2016-01-02 21:55:28',1),(788,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 22:06:09','Desktop','windows','C','2016-01-02 22:06:09',1),(789,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 22:06:21','Desktop','windows','C','2016-01-02 22:06:21',1),(790,'Google Chrome','Google Chrome','192.168.1.100','2016-01-02 22:46:47','Desktop','windows','C','2016-01-02 22:46:47',1),(791,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:34:19','Desktop','windows','C','2016-01-03 10:34:19',0),(792,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:34:45','Desktop','windows','C','2016-01-03 10:34:45',0),(793,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:35:06','Desktop','windows','C','2016-01-03 10:35:06',0),(794,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:35:18','Desktop','windows','C','2016-01-03 10:35:18',0),(795,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:35:43','Desktop','windows','C','2016-01-03 10:35:43',1),(796,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:36:53','Desktop','windows','C','2016-01-03 10:36:53',1),(797,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:37:07','Desktop','windows','C','2016-01-03 10:37:07',1),(798,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:38:02','Desktop','windows','C','2016-01-03 10:38:02',1),(799,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 10:39:28','Desktop','windows','C','2016-01-03 10:39:28',1),(800,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 11:52:53','Desktop','windows','C','2016-01-03 11:52:53',1),(801,'Mozilla Firefox','Mozilla Firefox','169.254.230.240','2016-01-03 12:30:15','Desktop','windows','C','2016-01-03 12:30:15',1);

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
	UPDATE `user`
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
	IF EXISTS (SELECT * FROM `user` WHERE UserEmail = ParamEmail AND UserPASSWORD = ParamPassword AND AuditedActivity <> 'D')
	THEN
		SELECT UserID, UserName, UserEmail, UserRole
		FROM `user`
		WHERE 
		UserEmail = ParamEmail 
		AND 
		UserPassword = ParamPassword 
		AND 
		AuditedActivity <> 'D';
	ELSE
		SELECT -1 'UserID';
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteArticle` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteArticle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteArticle`(
	IN ParamArticleID INT,
	IN ParamUserID INT
    )
BEGIN
	UPDATE 
		article
	SET 
		Auditedactivity = 'D',
		AuditedTime = CURRENT_TIMESTAMP(),
		AuditedUser = ParamUserID
	WHERE 
		ArticleID = ParamArticleID;
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
	UPDATE cookmark
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
		foodcomposition
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
	FROM cuisine 
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
	FROM foodprocess
	Where AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetAllFoodType` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetAllFoodType` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFoodType`()
BEGIN
	SELECT FoodTypeID, FoodTypeName
	FROM foodtype
	WHERE AuditedActivity <> 'D';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetAllMeasureSize` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetAllMeasureSize` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllMeasureSize`()
BEGIN
	SELECT MeasureSizeID, MeasureSizeName
	FROM measuresize
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
	FROM pricerange 
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
	SELECT DISTINCT yy.RecipeID, yy.RecipeName, yy.PrimaryPhoto, yy.UserID, yy.UserName, yy.CuisineName
	,yy.FoodTypeName, yy.RecipeIntro, yy.CreatedDate, yy.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT xx.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, PrimaryPhoto, 
			r.UserID,
			CONCAT(CAST(UserName AS CHAR),CAST(CASE WHEN UserLevelID <> NULL THEN '('+lu.LevelNickName+')' ELSE '' END AS CHAR)) AS 'UserName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			ft.FoodTypeName, CreatedDate,
			CONCAT(LEFT(RecipeIntro, 97),'...') AS 'RecipeIntro'
			FROM recipe r
			JOIN `user` u ON r.UserID = u.UserID AND u.AuditedActivity<> 'D'
			JOIN foodtype ft ON r.FoodTypeID=ft.FoodTypeID AND ft.AuditedActivity<> 'D'
			JOIN foodcuisine fc ON r.RecipeID=fc.RecipeID
			JOIN cuisine c ON fc.CuisineID=c.CuisineID
			JOIN foodcomposition fcs ON fcs.RecipeID=r.RecipeID
			JOIN composition cmp ON cmp.CompositionID=fcs.CompositionID
			LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
			GROUP BY r.RecipeID, RecipeName, PrimaryPhoto, r.UserID, UserName, UserLevelID, LevelNickName
				, FoodTypeName, RecipeIntro, CreatedDate, fcs.CompositionID
		) AS xx
		LEFT JOIN recook rck ON rck.RecipeID = xx.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY xx.RecipeID, xx.RecipeName, xx.PrimaryPhoto, xx.UserID, xx.UserName, xx.CuisineName
		,xx.FoodTypeName, xx.RecipeIntro, xx.CreatedDate
	) AS yy
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = yy.RecipeID AND fcmt.AuditedActivity<>'D'
	GROUP BY yy.RecipeID, yy.RecipeName, yy.PrimaryPhoto, yy.UserID, yy.UserName, yy.CuisineName
	,yy.FoodTypeName, yy.RecipeIntro, yy.NumberOfRecook, yy.CreatedDate
	) AS z
	LIMIT ParamLimitPage
	OFFSET ParamOffsetPage;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetArticle` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetArticle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetArticle`()
BEGIN
	SELECT 
		ArticleID, 
		ArticleTitle, 
		Slug, 
		ArticleImage, 
		DATE_FORMAT(ArticleDate,'%d %b %Y %h:%i %p') 'ArticleDate',
		ArticleContent 
	FROM article
	WHERE 
		AuditedActivity <> 'D' ORDER BY ArticleID DESC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GetArticleDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetArticleDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetArticleDetail`(
	ParamArticleID INT
    )
BEGIN
	SELECT 
		ArticleID, 
		ArticleTitle, 
		Slug, 
		ArticleImage, 
		DATE_FORMAT(ArticleDate,'%d %b %Y %h:%i %p') 'ArticleDate',
		ArticleContent 
	FROM article
	WHERE 
		AuditedActivity <> 'D' AND
		ArticleID = ParamArticleID;
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
	SELECT DISTINCT yy.CookmarkID, yy.RecipeID, yy.RecipeName, yy.Slug, yy.PrimaryPhoto, yy.UserID, yy.UserName, yy.CuisineName
	,yy.FoodTypeName, yy.RecipeIntro, yy.CreatedDate, yy.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT xx.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT cm.CookmarkID, r.RecipeID, RecipeName, r.Slug, PrimaryPhoto, 
			r.UserID,
			CONCAT(CAST(UserName AS CHAR),
			CAST(CASE WHEN UserLevelID is not NULL THEN CONCAT('(', lu.LevelNickName,')') ELSE '' END AS CHAR)) AS 'UserName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			ft.FoodTypeName, CreatedDate,
			CONCAT(LEFT(RecipeIntro, 97),'...') AS 'RecipeIntro'
			FROM recipe r
			JOIN `user` u ON r.UserID = u.UserID AND u.AuditedActivity<> 'D'
			JOIN foodtype ft ON r.FoodTypeID=ft.FoodTypeID AND ft.AuditedActivity<> 'D'
			JOIN foodcuisine fc ON r.RecipeID=fc.RecipeID AND fc.AuditedActivity<> 'D'
			JOIN cuisine c ON fc.CuisineID=c.CuisineID AND c.AuditedActivity<> 'D'
			JOIN foodcomposition fcs ON fcs.RecipeID=r.RecipeID AND fcs.AuditedActivity<> 'D'
			JOIN composition cmp ON cmp.CompositionID=fcs.CompositionID AND cmp.AuditedActivity<> 'D'
			JOIN cookmark cm on cm.RecipeID=r.RecipeID AND cm.AuditedActivity <> 'D'
			LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
			WHERE cm.UserID = ParamUserID
			GROUP BY r.RecipeID, RecipeName, PrimaryPhoto, r.UserID, UserName, UserLevelID, LevelNickName
				, FoodTypeName, RecipeIntro, CreatedDate, fcs.CompositionID, cm.CookmarkID
		) AS xx
		LEFT JOIN recook rck ON rck.RecipeID = xx.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY xx.RecipeID, xx.RecipeName, xx.PrimaryPhoto, xx.UserID, xx.UserName, xx.CuisineName
		,xx.FoodTypeName, xx.RecipeIntro, xx.CreatedDate, xx.CookmarkID
	) AS yy
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = yy.RecipeID AND fcmt.AuditedActivity<>'D'
	GROUP BY yy.RecipeID, yy.RecipeName, yy.PrimaryPhoto, yy.UserID, yy.UserName, yy.CuisineName
	,yy.FoodTypeName, yy.RecipeIntro, yy.NumberOfRecook, yy.CreatedDate, yy.CookmarkID
	) AS z
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
	SELECT DISTINCT yy.RecipeID, yy.RecipeName, yy.Slug, yy.PrimaryPhoto, yy.UserID, yy.UserName, yy.CuisineName
	,yy.FoodTypeName, yy.RecipeIntro, yy.CreatedDate, yy.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT xx.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, r.Slug, PrimaryPhoto, 
			r.UserID,
			CONCAT(CAST(UserName AS CHAR),CAST(CASE WHEN UserLevelID <> NULL THEN '('+lu.LevelNickName+')' ELSE '' END AS CHAR)) AS 'UserName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			ft.FoodTypeName, CreatedDate,
			CONCAT(LEFT(RecipeIntro, 97),'...') AS 'RecipeIntro'
			FROM recipe r
			JOIN `user` u ON r.UserID = u.UserID AND u.AuditedActivity<> 'D'
			JOIN foodtype ft ON r.FoodTypeID=ft.FoodTypeID AND ft.AuditedActivity<> 'D'
			JOIN foodcuisine fc ON r.RecipeID=fc.RecipeID AND fc.AuditedActivity<> 'D'
			JOIN cuisine c ON fc.CuisineID=c.CuisineID AND c.AuditedActivity<> 'D'
			JOIN foodcomposition fcs ON fcs.RecipeID=r.RecipeID AND fcs.AuditedActivity<> 'D'
			JOIN composition cmp ON cmp.CompositionID=fcs.CompositionID AND cmp.AuditedActivity<> 'D'
			LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
			WHERE r.UserID = ParamUserID
			GROUP BY r.RecipeID, RecipeName, PrimaryPhoto, r.UserID, UserName, UserLevelID, LevelNickName
				, FoodTypeName, RecipeIntro, CreatedDate, fcs.CompositionID
		) AS xx
		LEFT JOIN recook rck ON rck.RecipeID = xx.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY xx.RecipeID, xx.RecipeName, xx.PrimaryPhoto, xx.UserID, xx.UserName, xx.CuisineName
		,xx.FoodTypeName, xx.RecipeIntro, xx.CreatedDate
	) AS yy
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = yy.RecipeID AND fcmt.AuditedActivity<>'D'
	GROUP BY yy.RecipeID, yy.RecipeName, yy.PrimaryPhoto, yy.UserID, yy.UserName, yy.CuisineName
	,yy.FoodTypeName, yy.RecipeIntro, yy.NumberOfRecook, yy.CreatedDate
	) AS z
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
	FROM recook r
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
	SELECT DISTINCT yy.RecipeID, yy.RecipeName, yy.Slug, yy.PrimaryPhoto, yy.UserID, yy.UserName, yy.CuisineName
	,yy.FoodTypeName, yy.RecipeIntro, yy.CreatedDate, yy.NumberOfRecook, 
	CASE WHEN c.CookmarkID IS NOT NULL THEN 1 ELSE 0 END 'FlagCookmark',
	CASE WHEN r.RecookID IS NOT NULL THEN 1 ELSE 0 END 'FlagRecook',
	CASE WHEN yy.UserID = ParamUserID THEN 1 ELSE 0 END 'FlagCreator',
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT xx.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, r.Slug, PrimaryPhoto, 
			r.UserID, CreatedDate,
			CONCAT(CAST(UserName AS CHAR),CAST(CASE WHEN UserLevelID is not NULL THEN CONCAT('(',lu.LevelNickName,')') ELSE '' END AS CHAR)) AS 'UserName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			ft.FoodTypeName, 
			CONCAT(LEFT(RecipeIntro, 97),'...') AS 'RecipeIntro'
			FROM recipe r
			JOIN `user` u ON r.UserID = u.UserID AND u.AuditedActivity<> 'D'
			JOIN foodtype ft ON r.FoodTypeID=ft.FoodTypeID AND ft.AuditedActivity<> 'D'
			JOIN foodcuisine fc ON r.RecipeID=fc.RecipeID
			JOIN cuisine c ON fc.CuisineID=c.CuisineID
			LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
			GROUP BY r.RecipeID, RecipeName, PrimaryPhoto, r.UserID, UserName, UserLevelID, LevelNickName -- , CuisineName
				, FoodTypeName, RecipeIntro, CreatedDate
		) as xx
		LEFT JOIN recook rck ON rck.RecipeID = xx.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY xx.RecipeID, xx.RecipeName, xx.PrimaryPhoto, xx.UserID, xx.UserName, xx.CuisineName
		,xx.FoodTypeName, xx.RecipeIntro, xx.CreatedDate
	) yy
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = yy.RecipeID AND fcmt.AuditedActivity<>'D'
	LEFT JOIN recook r ON r.recipeId=yy.recipeid AND r.userid=ParamUserID AND r.AuditedActivity <> 'D'
	LEFT JOIN cookmark c ON c.recipeId=yy.recipeid AND c.userid=ParamUserID AND c.AuditedActivity <> 'D'
	GROUP BY yy.RecipeID, yy.RecipeName, yy.PrimaryPhoto, yy.UserID, yy.UserName, yy.CuisineName
	,yy.FoodTypeName, yy.RecipeIntro, yy.NumberOfRecook, yy.CreatedDate
	ORDER BY unix_timestamp(CreatedDate) DESC, yy.RecipeID DESC
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
	SELECT DISTINCT yy.RecipeID, yy.RecipeName, yy.Slug, yy.PrimaryPhoto, yy.UserID, yy.UserName, yy.CuisineName
	,yy.FoodTypeName, yy.RecipeIntro, yy.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT xx.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, r.Slug, PrimaryPhoto, 
			r.UserID,
			CONCAT(CAST(UserName AS CHAR),CAST(CASE WHEN UserLevelID is not NULL THEN CONCAT('(',lu.LevelNickName,')') ELSE '' END AS CHAR)) AS 'UserName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			ft.FoodTypeName, 
			CONCAT(LEFT(RecipeIntro, 97),'...') AS 'RecipeIntro'
			FROM recipe r
			JOIN `user` u ON r.UserID = u.UserID AND u.AuditedActivity<> 'D'
			JOIN foodtype ft ON r.FoodTypeID=ft.FoodTypeID AND ft.AuditedActivity<> 'D'
			JOIN foodcuisine fc ON r.RecipeID=fc.RecipeID
			JOIN cuisine c ON fc.CuisineID=c.CuisineID
			LEFT JOIN leveluser lu ON lu.LevelUserID=u.UserLevelID AND lu.AuditedActivity<> 'D'
			GROUP BY r.RecipeID, RecipeName, PrimaryPhoto, r.UserID, UserName, UserLevelID, LevelNickName -- , CuisineName
				, FoodTypeName, RecipeIntro
		) AS xx
		LEFT JOIN recook rck ON rck.RecipeID = xx.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY xx.RecipeID, xx.RecipeName, xx.PrimaryPhoto, xx.UserID, xx.UserName, xx.CuisineName
		,xx.FoodTypeName, xx.RecipeIntro
	) AS yy
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = yy.RecipeID AND fcmt.AuditedActivity<>'D'
	GROUP BY yy.RecipeID, yy.RecipeName, yy.PrimaryPhoto, yy.UserID, yy.UserName, yy.CuisineName
	,yy.FoodTypeName, yy.RecipeIntro, yy.NumberOfRecook
	) AS z
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
	SELECT DISTINCT yy.*, COUNT(fcmt.FoodCommentID) 'NumberOfComment',
	CASE WHEN c.CookmarkID IS NOT NULL THEN c.CookmarkID ELSE 0 END 'FlagCookmark',
	CASE WHEN r.RecookID IS NOT NULL THEN 1 ELSE 0 END 'FlagRecook',
	CASE WHEN yy.UserID = ParamUserID THEN 1 ELSE 0 END 'FlagCreator'
	FROM(
		SELECT DISTINCT xx.*, 
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
			FROM recipe r
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
		)  AS xx
		LEFT JOIN recook rck ON rck.RecipeID = xx.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY RecipeID, RecipeName, RecipeIntro, PrimaryPhoto, UserID, UserName, CuisineName,
			FoodTypeName, CreatedDate, FoodProcessName, estPeople,
			TimeEst, EstPrice
	) AS yy
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = yy.RecipeID AND fcmt.AuditedActivity<>'D'
	LEFT JOIN recook r ON r.recipeId = yy.RecipeID AND r.userid=ParamUserID AND r.AuditedActivity <> 'D'
	LEFT JOIN cookmark c ON c.recipeId = yy.RecipeID AND c.userid=ParamUserID AND c.AuditedActivity <> 'D'
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
	FROM recook
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
	FROM foodstep
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
	CASE WHEN c.CookmarkID is not null then c.CookmarkID else 0 end 'FlagCookmark',
	CASE WHEN r.RecookID IS NOT NULL THEN 1 ELSE 0 END 'FlagRecook',
	CASE WHEN z.UserID = ParamUserID then 1 else 0 end 'FlagCreator'
	FROM
	(
	SELECT DISTINCT yy.RecipeID, yy.RecipeName, yy.Slug, yy.PrimaryPhoto, yy.UserID, yy.UserName, yy.CuisineName
	,yy.FoodTypeName, yy.RecipeIntro, yy.CreatedDate, yy.NumberOfRecook, 
	COUNT(fcmt.FoodCommentID) 'NumberOfComment' 
	FROM(
		SELECT DISTINCT xx.*, 
		COUNT(rck.RecookID) 'NumberOfRecook'
		FROM(
			SELECT DISTINCT r.RecipeID, RecipeName, r.Slug, PrimaryPhoto, 
			r.UserID,
			CONCAT(CAST(UserName AS CHAR),CAST(CASE WHEN u.UserLevelID is not NULL THEN CONCAT('(', lu.LevelNickName,')') ELSE '' END AS CHAR)) AS 'UserName',
			CONVERT(GROUP_CONCAT(CAST(c.CuisineName AS CHAR) SEPARATOR ',') USING 'utf8') AS 'CuisineName',
			ft.FoodTypeName, CreatedDate,
			CONCAT(LEFT(RecipeIntro, 97),'...') AS 'RecipeIntro'
			FROM recipe r
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
					JOIN composition cmp on cmp.CompositionID=fcs.CompositionID AND cmp.AuditedActivity<> 'D'
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
		) AS xx
		LEFT JOIN recook rck ON rck.RecipeID = xx.RecipeID AND rck.AuditedActivity<>'D'
		GROUP BY xx.RecipeID, xx.RecipeName, xx.PrimaryPhoto, xx.UserID, xx.UserName, xx.CuisineName
		,xx.FoodTypeName, xx.RecipeIntro, xx.CreatedDate
	) AS yy
	LEFT JOIN foodcomment fcmt ON fcmt.RecipeID = yy.RecipeID AND fcmt.AuditedActivity<>'D'
	GROUP BY yy.RecipeID, yy.RecipeName, yy.PrimaryPhoto, yy.UserID, yy.UserName, yy.CuisineName
	,yy.FoodTypeName, yy.RecipeIntro, yy.NumberOfRecook, yy.CreatedDate
	) AS z
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
	FROM recook r
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
	FROM recook r
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
	FROM recook r
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
			FROM recipe r
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
					JOIN composition cmp ON cmp.CompositionID=fcs.CompositionID AND cmp.AuditedActivity<> 'D'
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
	SELECT yy.*, COUNT(cs.UserID) 'ActualContest' FROM(
		SELECT xx.*, COUNT(r.UserID) 'ActualRecook' FROM
		(
			SELECT u.UserID, UserName, UserEmail, CountryName, CityName,  UserPhoto, lu.LevelName, lu.LevelNickName, lu.LevelSeq,
			lud.LevelName 'NextLevelName', lud.LevelNickName 'NextLevelNickName', lud.LevelSeq 'NextLevelSeq',
			lud.NumberOfRecook, lud.NumberOfRecipe, lud.NumberOfWinContest, COUNT(r.UserID) 'ActualRecipe'
			FROM `user` u
			LEFT join leveluser lu ON lu.leveluserid=u.UserLevelID AND lu.AuditedActivity<> 'D'
			LEFT JOIN leveluser lud on lud.levelseq=(CASE WHEN u.UserLevelID is null then 1 else lu.levelSeq+1 end) AND lud.AuditedActivity<> 'D'
			LEFT JOIN recipe r on r.UserID= u.UserID AND r.AuditedActivity<>'D'
			WHERE u.userId = ParamUserID and u.AuditedActivity <> 'D'
			GROUP BY UserName, UserEmail, CountryName, CityName,  UserPhoto, lu.LevelName, lu.LevelNickName, lu.LevelSeq,
			lud.LevelName, lud.LevelNickName, lud.LevelSeq,
			lud.NumberOfRecook, lud.NumberOfRecipe, lud.NumberOfWinContest
		) AS xx
		LEFT JOIN recook r on xx.UserID=r.UserID AND r.AuditedActivity <> 'D'
		group by UserName, UserEmail, CountryName, CityName,  UserPhoto, LevelName, LevelNickName, LevelSeq,
			NextLevelName, NextLevelNickName, NextLevelSeq,
			NumberOfRecook, NumberOfRecipe, NumberOfWinContest, ActualRecipe
	) AS yy
	LEFT JOIN contestscore cs on cs.UserID=yy.userID 
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

/* Procedure structure for procedure `InsertArticle` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertArticle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertArticle`(
	ParamArticleImage VARCHAR(100),
	ParamArticleTitle VARCHAR(100),
	ParamArticleContent LONGTEXT,
	ParamUserID int
    )
BEGIN
	INSERT INTO article
	(ArticleTitle, Slug, ArticleImage, ArticleDate, ArticleContent, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamArticleTitle, REPLACE(LOWER(ParamArticleTitle), ' ', '-'), ParamArticleImage, CURRENT_TIMESTAMP(), ParamArticleContent, 'C', CURRENT_TIMESTAMP(), ParamUserID);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertContactUs` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertContactUs` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertContactUs`(
	In ParamContactUsName varchar(100),
	IN ParamContactUsEmail varchar(100),
	IN ParamContactUsMessage varchar(200),
	IN ParamUserID int,
	in ParamIPAddress varchar(100)
)
BEGIN
	INSERT INTO contactus
	(ContactUsName, ContactUsEmail, ContactUsMessage, CreatedDate, IpAddress, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamContactUsName, ParamContactUsEmail, ParamContactUsMessage, CURRENT_TIMESTAMP(), ParamIPAddress, 
	'C', CURRENT_TIMESTAMP(), ParamUserID);
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
	INSERT INTO cookmark
	(UserID, RecipeID, CookmarkDate, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamUserID, ParamRecipeID, CURRENT_TIMESTAMP(), 'C', CURRENT_TIMESTAMP(), ParamUserID);
	
	INSERT INTO notifications
	(NotificationName, NotificationURL, ReceiverUserID, NotificationDate, isRead, AuditedActivity, AuditedTime, AuditedUser)
	SELECT DISTINCT
	CONCAT(UserName, CASE WHEN LevelNickName IS NULL THEN '' ELSE  CONCAT(' (', LevelNickName, ')') END, ' Menandai ', RecipeName),
	CONCAT('detail/', c.RecipeID), r.UserID, CURRENT_TIMESTAMP(), 0, 
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
	INSERT INTO foodcomment
	(UserID, RecipeID, `Comment`, CommentDate, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamUserID, ParamRecipeID, ParamFoodComment, CURRENT_TIMESTAMP(), 'C', CURRENT_TIMESTAMP(), ParamUserID);
	
	-- notif buat creatornya kalo dia ga comment
	SET @CreatorUserID = (SELECT UserID From recipe WHERE RecipeID = ParamRecipeID AND AuditedActivity <> 'D' LIMIT 1);
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
	CONCAT('detail/', r.RecipeID) 'NotificationURL',
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
	
	IF EXISTS (SELECT * FROM composition WHERE LOWER(CompositionName)=LOWER(ParamFoodCompositionName)) THEN
		SET @CompositionID = (SELECT CompositionID FROM Composition WHERE LOWER(CompositionName)=LOWER(ParamFoodCompositionName) LIMIT 1);
	ELSEIF (ParamCompositionID IS NOT NULL OR ParamCompositionID <> '0' OR ParamCompositionID='') THEN
		SET @CompositionID = ParamCompositionID;
	ELSE 
		INSERT INTO composition 
		(CompositionName, AuditedActivity, AuditedTime, AuditedUser, CreatedTime)
		VALUES
		(ParamFoodCompositionName, 'C', CURRENT_TIMESTAMP(), ParamUserID, CURRENT_TIMESTAMP());
		SET @CompositionID = LAST_INSERT_ID();
	END IF;
	INSERT INTO foodcomposition
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
	INSERT INTO foodstep
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
	INSERT INTO recipe
	(RecipeName, RecipeIntro, Slug, FoodTypeID, PriceRangeID, EstPeopleID, FoodProcessID, TimeEst,
	PrimaryPhoto, CreatedDate, UserID, ContestID, Auditedactivity, AuditedTime, AuditedUser)
	VALUEs
	(ParamRecipeName, ParamRecipeIntro, REPLACE(LOWER(ParamRecipeName), ' ', '-'), ParamFoodTypeID, ParamPriceRangeID, ParamEstPeopleID, ParamFoodProcessID,
	ParamTimeEst, ParamPrimaryPhoto, CURRENT_TIMESTAMP(), ParamUserID, ParamContestID, 'C', CURRENT_TIMESTAMP(), ParamUserID);
	SET @LastID = LAST_INSERT_ID();
	
	INSERT INTO foodcuisine
	(CuisineID, RecipeID, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamCuisineID1, @LastID, 'C', CURRENT_TIMESTAMP(), ParamUserID);
	
	IF ParamCuisineID2 is not null
	THEN
	INSERT INTO foodcuisine
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
	CONCAT('detail/', c.RecipeID), r.UserID, CURRENT_TIMESTAMP(), 0, 
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
	SET @CreatorUserID = (SELECT UserID FROM recook WHERE RecookID = ParamRecookID AND AuditedActivity <> 'D' LIMIT 1);
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
	CONCAT('detail/', rr.RecipeID) 'NotificationURL',
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
	INSERT INTO searchlog
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
		(SELECT * FROM `user` WHERE UserEmail = ParamEmail AND AuditedActivity <> 'D')
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

/* Procedure structure for procedure `UpdateArticle` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateArticle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateArticle`(
	ParamArticleImage VARCHAR(100),
	ParamArticleTitle VARCHAR(100),
	ParamArticleContent LONGTEXT,
	ParamUserID INT,
	ParamArticleID INT
    )
BEGIN
	UPDATE
		article
	SET
		ArticleImage = ParamArticleImage,
		ArticleTitle = ParamArticleTitle,
		Slug = REPLACE(LOWER(ParamArticleTitle), ' ', '-'),
		ArticleDate = CURRENT_TIMESTAMP(),
		ArticleContent = ParamArticleContent,
		AuditedActivity = 'U',
		AuditedTime = CURRENT_TIMESTAMP(),
		AuditedUser = ParamUserID
	WHERE
		ArticleID = ParamArticleID;
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
	
	IF EXISTS (SELECT * FROM composition WHERE LOWER(CompositionName)=LOWER(ParamFoodCompositionName)) THEN
		SET @CompositionID = (SELECT CompositionID FROM composition WHERE CompositionName=ParamFoodCompositionName LIMIT 1);
	ELSEIF ParamCompositionID IS NOT NULL OR ParamCompositionID <> '0'  OR ParamCompositionID='' THEN
		SET @CompositionID = ParamCompositionID;
	ELSE 
		INSERT INTO composition 
		(CompositionName, AuditedActivity, AuditedTime, AuditedUser, CreatedTime)
		VALUES
		(ParamFoodCompositionName, 'C', CURRENT_TIMESTAMP(), ParamUserID, CURRENT_TIMESTAMP());
		SET @CompositionID = LAST_INSERT_ID();
	END IF;
	INSERT INTO foodcomposition
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
	
	INSERT INTO foodstep
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
	UPDATE recipe
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
	
	UPDATE foodcuisine
	SET 
	Auditedactivity = 'D',
	AuditedTime = CURRENT_TIMESTAMP(),
	AuditedUser = ParamUserID
	WHERE RecipeID = ParamRecipeID;
	
	INSERT INTO foodcuisine
	(CuisineID, RecipeID, AuditedActivity, AuditedTime, AuditedUser)
	VALUES
	(ParamCuisineID1, ParamRecipeID, 'C', CURRENT_TIMESTAMP(), ParamUserID);
	
	IF ParamCuisineID2 IS NOT NULL
	THEN
	INSERT INTO foodcuisine
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
