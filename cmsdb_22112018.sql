/*
SQLyog Ultimate v8.55 
MySQL - 5.5.5-10.2.7-MariaDB : Database - cmsdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cmsdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cmsdb`;

/*Table structure for table `cms_election` */

DROP TABLE IF EXISTS `cms_election`;

CREATE TABLE `cms_election` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `electiontitle` varchar(150) DEFAULT NULL,
  `startdatetime` varchar(25) DEFAULT NULL,
  `enddatetime` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `usercreated` int(5) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `post_title` varchar(50) DEFAULT NULL,
  `winner` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cms_election_user` (`usercreated`),
  CONSTRAINT `FK_cms_election_user` FOREIGN KEY (`usercreated`) REFERENCES `cms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `cms_election` */

insert  into `cms_election`(`id`,`electiontitle`,`startdatetime`,`enddatetime`,`status`,`usercreated`,`datecreated`,`post_title`,`winner`) values (1,'new precident 2017','2017-11-21','2017-11-22','OPEN',NULL,'2017-11-05 14:26:53','Tresury','MEM3'),(2,'sdsadsad','2017-11-21','2017-11-22','CLOSE',1,'2017-11-20 21:02:03','President','MEM6');

/*Table structure for table `cms_election_vote` */

DROP TABLE IF EXISTS `cms_election_vote`;

CREATE TABLE `cms_election_vote` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `electionid` int(5) DEFAULT NULL,
  `memberid` int(5) DEFAULT NULL,
  `vote` int(5) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_cms_election_vote_election` (`electionid`),
  KEY `FK_cms_election_vote_member` (`memberid`),
  CONSTRAINT `FK_cms_election_vote_election` FOREIGN KEY (`electionid`) REFERENCES `cms_election` (`id`),
  CONSTRAINT `FK_cms_election_vote_member` FOREIGN KEY (`memberid`) REFERENCES `cms_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `cms_election_vote` */

insert  into `cms_election_vote`(`id`,`electionid`,`memberid`,`vote`) values (1,1,2,6),(2,1,3,10),(3,2,6,15),(4,1,8,5),(5,1,9,0),(6,1,9,0),(7,1,6,0),(8,1,5,0);

/*Table structure for table `cms_expertise` */

DROP TABLE IF EXISTS `cms_expertise`;

CREATE TABLE `cms_expertise` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `expertise` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cms_expertise` */

insert  into `cms_expertise`(`id`,`expertise`) values (1,'SE');

/*Table structure for table `cms_inventory` */

DROP TABLE IF EXISTS `cms_inventory`;

CREATE TABLE `cms_inventory` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `itemid` int(5) DEFAULT NULL,
  `memberid` int(5) DEFAULT NULL,
  `eventname` varchar(100) DEFAULT NULL,
  `fromdate` varchar(25) DEFAULT NULL,
  `todate` varchar(25) DEFAULT NULL,
  `createduser` int(5) DEFAULT NULL,
  `createdtime` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cms_inventory_item` (`itemid`),
  KEY `FK_cms_inventory_member` (`memberid`),
  CONSTRAINT `FK_cms_inventory_item` FOREIGN KEY (`itemid`) REFERENCES `cms_item` (`id`),
  CONSTRAINT `FK_cms_inventory_member` FOREIGN KEY (`memberid`) REFERENCES `cms_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `cms_inventory` */

insert  into `cms_inventory`(`id`,`itemid`,`memberid`,`eventname`,`fromdate`,`todate`,`createduser`,`createdtime`,`status`,`qty`) values (1,2,3,'Smaple Event','2017-11-15','2017-11-20',3,'2017-11-20 18:25:52','OPEN',3),(2,2,6,'sdsadasd','2017-11-30','2017-11-30',6,'2017-11-20 19:53:00','OPEN',3);

/*Table structure for table `cms_item` */

DROP TABLE IF EXISTS `cms_item`;

CREATE TABLE `cms_item` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(250) DEFAULT NULL,
  `qyt` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cms_item` */

insert  into `cms_item`(`id`,`itemname`,`qyt`) values (1,'hut',10),(2,'sadsadsa',3),(3,'Table',10);

/*Table structure for table `cms_member` */

DROP TABLE IF EXISTS `cms_member`;

CREATE TABLE `cms_member` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `nic` varchar(12) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `currentaddress` varchar(250) DEFAULT NULL,
  `experticeid` int(5) DEFAULT NULL,
  `permanentaddress` varchar(250) DEFAULT NULL,
  `authstatus` varchar(10) DEFAULT NULL COMMENT 'PND|AUTH|DACT',
  `datecreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `autorizeby` int(5) DEFAULT NULL COMMENT 'cms_user',
  `role` varchar(50) DEFAULT NULL,
  `usercreated` int(5) DEFAULT NULL,
  `post_title` varchar(50) DEFAULT NULL,
  `mobileno` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `cms_member` */

insert  into `cms_member`(`id`,`firstname`,`lastname`,`nic`,`username`,`email`,`currentaddress`,`experticeid`,`permanentaddress`,`authstatus`,`datecreated`,`autorizeby`,`role`,`usercreated`,`post_title`,`mobileno`) values (1,'Thisara','Perera','8877887788V','admin','thisara@gmai',NULL,0,'Kadawatha','Authorized','2017-10-28 21:53:00',1,'ADMIN',NULL,NULL,'0715255447'),(2,'Gayan','Fernando','8788778878V','MEM2','gaya@gmail.com','cusrret,colombo',1,'gampaha','Authorized','2017-10-29 08:04:58',1,'MEMBER',NULL,'EB','0725233654'),(3,'Kamala','Mathu','8877665566V','MEM3','manager@gmail','manager,gampaha',1,'colombo','Authorized','2017-10-29 08:07:45',1,'MANAGER',NULL,NULL,'0458877445'),(4,'','','','MEM4','','',0,'','AUTHORIZED','2017-11-18 23:01:35',NULL,'',1,NULL,'0251557775'),(5,'sss','sss','333','MEM5','a@gmail.com',' dddd',0,' ggg','AUTHORIZED','2017-11-18 23:04:26',3,'MEMBER',1,NULL,'0255442247'),(6,'ssss','ddddd','wwwww','MEM6','we@dd.com','dfdfdf ',0,' sfdf','Authorized','2017-11-18 23:10:08',NULL,'MEMBER',1,NULL,'0715566552'),(7,'sadsad','sadsad','3213','MEM7','sadsad',' sfdsdfsd',1,' fdsfsdfsdf','AUTHORIZED','2017-11-20 16:30:39',3,'MEMBER',6,NULL,'0716688452'),(8,'ssadasd','sadsadsa','24234234','MEM8','ewrwerwe@sfd.fdg',' dsfsdf',1,' sdfsdf','AUTHORIZED','2017-11-20 16:43:32',1,'MEMBER',6,NULL,'0774555112'),(9,'sadasdsad','sadsad','24334234','MEM9','asdsad',' sadsad',1,' asdsad','Authorized','2017-11-20 17:03:31',3,'MEMBER',3,NULL,'0784545452'),(10,'sadsad','sadsad','sadsad','MEM10','sadsad',' sadsad',1,' sadsad','Authorized','2017-11-20 17:04:12',3,'MEMBER',3,NULL,'0714554587'),(11,'xxx','ddd','334234','MEM11','erewrwe',' sdfsdfsd',1,' sdfsdfsd','Authorized','2017-11-22 12:07:26',NULL,'MEMBER',1,NULL,'0715458787'),(12,'sdsdsd','sdsdsd','3234324','MEM12','xxx@ff.con',' dsfsdfsdf',1,' sdfsdf','Authorized','2017-11-22 12:17:40',NULL,'MEMBER',1,NULL,'0714548788'),(13,'sdsdsds','sdsdsd','3423423','MEM13','fsdfsdf@ggfd.com',' sdfsdf',1,' gfdgfd','Authorized','2017-11-22 12:18:29',NULL,'MEMBER',1,NULL,'0756656564'),(14,'Raviii','Ferrr','36552662','MEM14','ravinathdo@gmail.com','hdjfhjfhjdh ',1,'dfgkhgjhf ','AUTHORIZED','2017-11-23 09:39:10',1,'MEMBER',6,NULL,NULL);

/*Table structure for table `cms_member_attend` */

DROP TABLE IF EXISTS `cms_member_attend`;

CREATE TABLE `cms_member_attend` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `memberid` int(5) DEFAULT NULL,
  `attend_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `cms_member_attend` */

insert  into `cms_member_attend`(`id`,`memberid`,`attend_date`) values (1,0,'2017-11-21 17:00:41'),(2,0,'2017-11-22 17:00:45');

/*Table structure for table `cms_member_election` */

DROP TABLE IF EXISTS `cms_member_election`;

CREATE TABLE `cms_member_election` (
  `member_id` int(5) NOT NULL,
  `election_id` int(5) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`member_id`,`election_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_member_election` */

insert  into `cms_member_election`(`member_id`,`election_id`,`createtime`) values (6,1,'2017-11-22 10:53:06');

/*Table structure for table `cms_news` */

DROP TABLE IF EXISTS `cms_news`;

CREATE TABLE `cms_news` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `usercreated` int(5) DEFAULT NULL COMMENT 'cms_user',
  `datecreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) DEFAULT 'ACTIVE' COMMENT 'ACT|DACT',
  PRIMARY KEY (`id`),
  KEY `FK_cms_news_user` (`usercreated`),
  CONSTRAINT `FK_cms_news_user` FOREIGN KEY (`usercreated`) REFERENCES `cms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `cms_news` */

insert  into `cms_news`(`id`,`news_title`,`description`,`usercreated`,`datecreated`,`status`) values (1,'sample news','gallery provide reset commands so that you can always restore the look of your document to the original contained in your current template.',1,'2017-11-20 14:00:00','CLOSE'),(2,'sample news 2','gallery provide reset commands so that you can always restore the look of your document to the original contained in your current template.',1,'2017-11-20 14:05:09','ACTIVE'),(3,'the big event','gallery provide reset commands so that you can always restore the look of your document to the original contained in your current tem',1,'2017-11-22 12:36:14','ACTIVE'),(4,'xxxxsdsad','nds so that you can always restore the look of your document to the original contained in your current te',1,'2017-11-22 12:38:31','ACTIVE'),(5,'sdfsdfsdf','sfsdfsdfsdfsdf',1,'2017-11-22 12:39:40','ACTIVE');

/*Table structure for table `cms_payment` */

DROP TABLE IF EXISTS `cms_payment`;

CREATE TABLE `cms_payment` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `year_pay` int(5) DEFAULT NULL,
  `payment_amount` decimal(10,5) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `member_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `cms_payment` */

insert  into `cms_payment`(`id`,`year_pay`,`payment_amount`,`created_date`,`member_id`) values (1,1,'99999.99999','2017-11-22 22:48:25',1),(2,2017,'3009.00000','2017-11-23 14:51:57',6);

/*Table structure for table `cms_post` */

DROP TABLE IF EXISTS `cms_post`;

CREATE TABLE `cms_post` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `posttitle` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `plike` int(5) DEFAULT 0,
  `dislike` int(5) DEFAULT 0,
  `usercreated` int(5) DEFAULT NULL COMMENT 'cms_member',
  `datecreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) DEFAULT 'PENDING' COMMENT 'PENDING|ACTIVE|CLOSE',
  PRIMARY KEY (`id`),
  KEY `FK_cms_post_member` (`usercreated`),
  CONSTRAINT `FK_cms_post_member` FOREIGN KEY (`usercreated`) REFERENCES `cms_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `cms_post` */

insert  into `cms_post`(`id`,`posttitle`,`description`,`plike`,`dislike`,`usercreated`,`datecreated`,`status`) values (1,'asdasd','asdasdsa',0,0,6,'2017-11-19 20:45:45','CLOSE'),(2,'Sample Post 1','On the Insert tab, the galleries include items that are designed to coordinate with the overall look of your document. You can use these galleries to insert tables, headers, footers, lists, cover pages, and other document building blocks',1,0,6,'2017-11-20 11:11:24','ACTIVE'),(3,'xxx','x',0,1,6,'2017-11-20 11:11:38','ACTIVE'),(4,'Sample Post 2','You can easily change the formatting of selected text in the document text by choosing a look for the selected text from the Quick Styles gallery on the Home tab. You can also format text directly by using the other controls on the Home tab. ',1,1,6,'2017-11-20 11:13:43','ACTIVE'),(5,'Sample Post 3','Most controls offer a choice of using the look from the current theme or using a format that you specify directly.',0,0,6,'2017-11-20 13:32:04','PENDING'),(6,'Sample Post 3','Most controls offer a choice of using the look from the current theme or using a format that you specify directly.',0,0,6,'2017-11-20 13:32:22','PENDING'),(7,'sdfsdf','sdfsdfsd',0,0,1,'2017-11-22 13:14:36','PENDING'),(8,'dsdfsdfsdf','sdfsdfsdf',0,0,1,'2017-11-22 13:14:50','PENDING'),(9,'','',0,0,1,'2017-11-22 13:15:00','PENDING'),(10,'','',0,0,1,'2017-11-22 13:15:01','PENDING'),(11,'sadasdsad','sadsadsad',0,0,1,'2017-11-22 13:15:45','PENDING'),(12,'sdfsdfsdf','sdfsdfsd',0,0,1,'2017-11-22 13:16:01','PENDING');

/*Table structure for table `cms_post_vote` */

DROP TABLE IF EXISTS `cms_post_vote`;

CREATE TABLE `cms_post_vote` (
  `postid` int(5) NOT NULL,
  `memberid` int(5) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`postid`,`memberid`),
  KEY `FK_cms_post_vote_member` (`memberid`),
  CONSTRAINT `FK_cms_post_vote_member` FOREIGN KEY (`memberid`) REFERENCES `cms_member` (`id`),
  CONSTRAINT `FK_cms_post_vote_post` FOREIGN KEY (`postid`) REFERENCES `cms_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_post_vote` */

insert  into `cms_post_vote`(`postid`,`memberid`,`type`,`datecreated`) values (2,6,'LIKE','2017-11-20 13:27:35'),(3,6,'DISLIKE','2017-11-20 12:20:07'),(4,6,'DISLIKE','2017-11-20 13:36:17');

/*Table structure for table `cms_user` */

DROP TABLE IF EXISTS `cms_user`;

CREATE TABLE `cms_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `role` varchar(25) DEFAULT NULL COMMENT 'ADMIN|TREASURY ',
  `datecreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) DEFAULT 'ACT' COMMENT 'ACT|DACT',
  `member_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `cms_user` */

insert  into `cms_user`(`id`,`username`,`password`,`role`,`datecreated`,`status`,`member_id`) values (1,'admin','*667F407DE7C6AD07358FA38DAED7828A72014B4E','ADMIN','2017-10-28 22:03:51','ACT',1),(2,'mem','*667F407DE7C6AD07358FA38DAED7828A72014B4E','MEMBER','2017-10-29 08:05:25','ACT',2),(3,'manager','*667F407DE7C6AD07358FA38DAED7828A72014B4E','MANAGER','2017-10-29 08:06:10','ACT',3),(4,'MEM6','*09904C85991002D20EFCC43E9A02743A702C68C0','MEMBER','2017-11-18 23:10:08','ACT',6),(5,'MEM4','*0223C22D5A3A36F6ABC6BB8F664D0A74B526F239','MEMBER','2017-11-20 18:13:00','ACT',4),(6,'MEM5','*CF0BB34980D4A895952C3B7D066B67A91575FA42','MEMBER','2017-11-20 18:14:54','ACT',5),(7,'MEM7','*E8A37087210732DA9FA3B235B0AE18B81C751EB3','MEMBER','2017-11-22 11:57:32','ACT',7),(8,'MEM8','*C78DEFACBAB60A3C2AE3B6FCF8FDEB9C4CE60F48','MEMBER','2017-11-22 11:59:40','ACT',8),(9,'MEM11','*1D33CAE7DB8220ED1E85B3E32F89BA9FA915C572','MEMBER','2017-11-22 12:07:26','ACT',11),(10,'MEM12','*D8E9957D212B8229D635F66C6520FFEFA56CED17','MEMBER','2017-11-22 12:17:40','ACT',12),(11,'MEM13','*B5CC09437BF8C93B196080A2FC6218B1180DF663','MEMBER','2017-11-22 12:18:29','ACT',13),(12,'MEM14','*79BF68389752DF40A977C07F9F4A6D8E2791FA0C','MEMBER','2017-11-23 09:40:34','ACT',14);

/*Table structure for table `ozekimessagein` */

DROP TABLE IF EXISTS `ozekimessagein`;

CREATE TABLE `ozekimessagein` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(30) DEFAULT NULL,
  `receiver` varchar(30) DEFAULT NULL,
  `msg` text DEFAULT NULL,
  `senttime` varchar(100) DEFAULT NULL,
  `receivedtime` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `msgtype` varchar(160) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ozekimessagein` */

/*Table structure for table `ozekimessageout` */

DROP TABLE IF EXISTS `ozekimessageout`;

CREATE TABLE `ozekimessageout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(30) DEFAULT NULL,
  `receiver` varchar(30) DEFAULT NULL,
  `msg` text DEFAULT NULL,
  `senttime` varchar(100) DEFAULT NULL,
  `receivedtime` varchar(100) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `msgtype` varchar(160) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `errormsg` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `ozekimessageout` */

insert  into `ozekimessageout`(`id`,`sender`,`receiver`,`msg`,`senttime`,`receivedtime`,`reference`,`status`,`msgtype`,`operator`,`errormsg`) values (1,'0716483414','0715255447','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(2,'0716483414','0725233654','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(3,'0716483414','0458877445','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(4,'0716483414','0251557775','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(5,'0716483414','0255442247','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(6,'0716483414','0715566552','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(7,'0716483414','0716688452','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(8,'0716483414','0774555112','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(9,'0716483414','0784545452','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(10,'0716483414','0714554587','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(11,'0716483414','0715458787','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(12,'0716483414','0714548788','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(13,'0716483414','0756656564','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(14,'0716483414','0715255447','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(15,'0716483414','0725233654','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(16,'0716483414','0458877445','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(17,'0716483414','0251557775','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(18,'0716483414','0255442247','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(19,'0716483414','0715566552','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(20,'0716483414','0716688452','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(21,'0716483414','0774555112','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(22,'0716483414','0784545452','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(23,'0716483414','0714554587','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(24,'0716483414','0715458787','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(25,'0716483414','0714548788','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(26,'0716483414','0756656564','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
