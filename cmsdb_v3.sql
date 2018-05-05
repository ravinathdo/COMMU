/*
SQLyog Ultimate v8.55 
MySQL - 5.5.54 : Database - cmsdb
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

/*Table structure for table `cms_attendance` */

DROP TABLE IF EXISTS `cms_attendance`;

CREATE TABLE `cms_attendance` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) DEFAULT NULL,
  `member_id` varchar(10) DEFAULT NULL,
  `attend_datetime` varchar(50) DEFAULT NULL,
  `created_user` int(5) DEFAULT NULL,
  `created_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`event_name`,`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cms_attendance` */

insert  into `cms_attendance`(`id`,`event_name`,`member_id`,`attend_datetime`,`created_user`,`created_datetime`) values (1,'Sample Event','MEM14','2018-04-14T00:00',3,'2018-04-14 11:24:21');

/*Table structure for table `cms_election` */

DROP TABLE IF EXISTS `cms_election`;

CREATE TABLE `cms_election` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `electiontitle` varchar(150) DEFAULT NULL,
  `startdatetime` varchar(25) DEFAULT NULL,
  `enddatetime` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `usercreated` int(5) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_title` varchar(50) DEFAULT NULL,
  `winner` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cms_election_user` (`usercreated`),
  CONSTRAINT `FK_cms_election_user` FOREIGN KEY (`usercreated`) REFERENCES `cms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cms_election` */

insert  into `cms_election`(`id`,`electiontitle`,`startdatetime`,`enddatetime`,`status`,`usercreated`,`datecreated`,`post_title`,`winner`) values (1,'new precident 2017','2017-11-21','2017-11-22','OPEN',NULL,'2017-11-05 14:26:53','Tresury','MEM3'),(2,'sdsadsad','2017-11-21','2017-11-22','CLOSE',1,'2017-11-20 21:02:03','President','MEM6'),(3,'election test','2018-05-17','2018-05-17','CLOSE',1,'2018-05-05 00:22:41','Election','MEM5');

/*Table structure for table `cms_election_vote` */

DROP TABLE IF EXISTS `cms_election_vote`;

CREATE TABLE `cms_election_vote` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `electionid` int(5) DEFAULT NULL,
  `memberid` int(5) DEFAULT NULL,
  `vote` int(5) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_cms_election_vote_election` (`electionid`),
  KEY `FK_cms_election_vote_member` (`memberid`),
  CONSTRAINT `FK_cms_election_vote_election` FOREIGN KEY (`electionid`) REFERENCES `cms_election` (`id`),
  CONSTRAINT `FK_cms_election_vote_member` FOREIGN KEY (`memberid`) REFERENCES `cms_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `cms_election_vote` */

insert  into `cms_election_vote`(`id`,`electionid`,`memberid`,`vote`) values (1,1,2,6),(2,1,3,10),(3,2,6,15),(4,1,8,5),(5,1,9,0),(6,1,9,0),(7,1,6,0),(8,1,5,0),(9,3,7,0),(10,3,9,0),(11,3,5,1),(12,3,3,0);

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
  `createdtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cms_inventory_item` (`itemid`),
  KEY `FK_cms_inventory_member` (`memberid`),
  CONSTRAINT `FK_cms_inventory_item` FOREIGN KEY (`itemid`) REFERENCES `cms_item` (`id`),
  CONSTRAINT `FK_cms_inventory_member` FOREIGN KEY (`memberid`) REFERENCES `cms_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `cms_inventory` */

insert  into `cms_inventory`(`id`,`itemid`,`memberid`,`eventname`,`fromdate`,`todate`,`createduser`,`createdtime`,`status`,`qty`) values (1,2,3,'Smaple Event','2017-11-15','2017-11-20',3,'2017-11-20 18:25:52','OPEN',3),(2,2,6,'sdsadasd','2017-11-30','2017-11-30',6,'2017-11-20 19:53:00','OPEN',3),(3,1,6,'Wedding','2018-04-17','2018-04-15',6,'2018-04-13 23:32:20','OPEN',5),(4,2,6,'Wedding Sone','2018-04-25','2018-04-26',6,'2018-04-13 23:33:27','OPEN',3);

/*Table structure for table `cms_item` */

DROP TABLE IF EXISTS `cms_item`;

CREATE TABLE `cms_item` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(250) DEFAULT NULL,
  `qyt` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`itemname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `cms_item` */

insert  into `cms_item`(`id`,`itemname`,`qyt`) values (1,'hut',10),(2,'sadsadsa',3),(3,'Table',10),(4,'Chair',45);

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
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `autorizeby` int(5) DEFAULT NULL COMMENT 'cms_user',
  `role` varchar(50) DEFAULT NULL,
  `usercreated` int(5) DEFAULT NULL,
  `post_title` varchar(50) DEFAULT NULL,
  `mobileno` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `cms_member` */

insert  into `cms_member`(`id`,`firstname`,`lastname`,`nic`,`username`,`email`,`currentaddress`,`experticeid`,`permanentaddress`,`authstatus`,`datecreated`,`autorizeby`,`role`,`usercreated`,`post_title`,`mobileno`) values (1,'Thisara','Perera','8877887788V','admin','thisara@gmai',NULL,0,'Kadawatha','Authorized','2017-10-28 21:53:00',1,'ADMIN',NULL,NULL,'0715255447'),(2,'Gayan','Fernando','8788778878V','MEM2','gaya@gmail.com','cusrret,colombo',1,'gampaha','Authorized','2017-10-29 08:04:58',1,'MEMBER',NULL,'EB','0725233654'),(3,'Kamala','Mathu','8877665566V','MEM3','manager@gmail','manager,gampaha',1,'colombo','Authorized','2017-10-29 08:07:45',1,'MANAGER',NULL,NULL,'0458877445'),(4,'','','','MEM4','','',0,'','AUTHORIZED','2017-11-18 23:01:35',NULL,'',1,NULL,'0251557775'),(5,'sss','sss','333','MEM5','a@gmail.com',' dddd',0,' ggg','AUTHORIZED','2017-11-18 23:04:26',3,'MEMBER',1,NULL,'0255442247'),(6,'ssss','ddddd','wwwww','MEM6','we@dd.com','dfdfdf ',0,' sfdf','Authorized','2017-11-18 23:10:08',NULL,'MEMBER',1,NULL,'0715566552'),(7,'sadsad','sadsad','3213','MEM7','sadsad',' sfdsdfsd',1,' fdsfsdfsdf','AUTHORIZED','2017-11-20 16:30:39',3,'MEMBER',6,NULL,'0716688452'),(8,'ssadasd','sadsadsa','24234234','MEM8','ewrwerwe@sfd.fdg',' dsfsdf',1,' sdfsdf','AUTHORIZED','2017-11-20 16:43:32',1,'MEMBER',6,NULL,'0774555112'),(9,'sadasdsad','sadsad','24334234','MEM9','asdsad',' sadsad',1,' asdsad','Authorized','2017-11-20 17:03:31',3,'MEMBER',3,NULL,'0784545452'),(10,'sadsad','sadsad','sadsad','MEM10','sadsad',' sadsad',1,' sadsad','Authorized','2017-11-20 17:04:12',3,'MEMBER',3,NULL,'0714554587'),(11,'xxx','ddd','334234','MEM11','erewrwe',' sdfsdfsd',1,' sdfsdfsd','Authorized','2017-11-22 12:07:26',NULL,'MEMBER',1,NULL,'0715458787'),(12,'sdsdsd','sdsdsd','3234324','MEM12','xxx@ff.con',' dsfsdfsdf',1,' sdfsdf','Authorized','2017-11-22 12:17:40',NULL,'MEMBER',1,NULL,'0714548788'),(13,'sdsdsds','sdsdsd','3423423','MEM13','fsdfsdf@ggfd.com',' sdfsdf',1,' gfdgfd','Authorized','2017-11-22 12:18:29',NULL,'MEMBER',1,NULL,'0756656564'),(14,'Raviii','Ferrr','36552662','MEM14','ravinathdo@gmail.com','hdjfhjfhjdh ',1,'dfgkhgjhf ','AUTHORIZED','2017-11-23 09:39:10',1,'MEMBER',6,NULL,NULL),(15,'pp','pp','5522','','sadsad@fsd.fdgfd','4545 ',1,'4545 ','Authorized','2018-04-11 08:45:45',NULL,'VOLUNTEER',1,NULL,'022211'),(16,'dfsdfsd','fsdfds','3213213213','VOL16','sdfsd@fsd.hh',' gfd',1,' dsfsd','Authorized','2018-04-12 10:45:01',NULL,'VOLUNTEER',1,NULL,'212119'),(17,'dfsdfsd','fsdfds','3213213213','VOL17','sdfsd@fsd.hh',' gfd',1,' dsfsd','Authorized','2018-04-12 10:52:02',1,'VOLUNTEER',1,NULL,'212119'),(18,'Dinesh','Kumara','86351254V','VOL18','din@g.com',' ',1,' ','Authorized','2018-04-18 22:04:22',1,'VOLUNTEER',1,NULL,'0715833422'),(19,'Sample user1','Lastnamw','885544','MEM19','mcogmail@g.com',' raddoluwa',1,' ','Authorized','2018-05-05 08:09:25',1,'MEMBER',1,NULL,'+94715833470'),(20,'Kusuma','Kummm','8866542254V','MEM20','ku@gmail.com','Ku ',1,'Ku ','AUTHORIZED','2018-05-05 08:13:29',1,'MEMBER',19,NULL,NULL);

/*Table structure for table `cms_member_election` */

DROP TABLE IF EXISTS `cms_member_election`;

CREATE TABLE `cms_member_election` (
  `member_id` int(5) NOT NULL,
  `election_id` int(5) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`,`election_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_member_election` */

insert  into `cms_member_election`(`member_id`,`election_id`,`createtime`) values (6,1,'2017-11-22 10:53:06'),(19,3,'2018-05-05 08:12:11');

/*Table structure for table `cms_news` */

DROP TABLE IF EXISTS `cms_news`;

CREATE TABLE `cms_news` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `usercreated` int(5) DEFAULT NULL COMMENT 'cms_user',
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) DEFAULT 'ACTIVE' COMMENT 'ACT|DACT',
  PRIMARY KEY (`id`),
  KEY `FK_cms_news_user` (`usercreated`),
  CONSTRAINT `FK_cms_news_user` FOREIGN KEY (`usercreated`) REFERENCES `cms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `cms_news` */

insert  into `cms_news`(`id`,`news_title`,`description`,`usercreated`,`datecreated`,`status`) values (1,'sample news','gallery provide reset commands so that you can always restore the look of your document to the original contained in your current template.',1,'2017-11-20 14:00:00','CLOSE'),(2,'sample news 2','gallery provide reset commands so that you can always restore the look of your document to the original contained in your current template.',1,'2017-11-20 14:05:09','ACTIVE'),(3,'the big event','gallery provide reset commands so that you can always restore the look of your document to the original contained in your current tem',1,'2017-11-22 12:36:14','ACTIVE'),(4,'xxxxsdsad','nds so that you can always restore the look of your document to the original contained in your current te',1,'2017-11-22 12:38:31','ACTIVE'),(5,'sdfsdfsdf','sfsdfsdfsdfsdf',1,'2017-11-22 12:39:40','ACTIVE'),(6,'Sample','sadasdsadsa',1,'2018-04-12 11:07:58','ACTIVE'),(7,'sample news','News description',1,'2018-05-05 08:28:58','ACTIVE');

/*Table structure for table `cms_payment` */

DROP TABLE IF EXISTS `cms_payment`;

CREATE TABLE `cms_payment` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `year_pay` int(5) DEFAULT NULL,
  `payment_amount` decimal(10,5) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `member_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cms_payment` */

insert  into `cms_payment`(`id`,`year_pay`,`payment_amount`,`created_date`,`member_id`) values (1,1,'99999.99999','2017-11-22 22:48:25',1),(2,2017,'3009.00000','2017-11-23 14:51:57',6),(3,2018,'2500.00000','2018-04-18 22:06:48',6);

/*Table structure for table `cms_post` */

DROP TABLE IF EXISTS `cms_post`;

CREATE TABLE `cms_post` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `posttitle` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `plike` int(5) DEFAULT '0',
  `dislike` int(5) DEFAULT '0',
  `usercreated` int(5) DEFAULT NULL COMMENT 'cms_member',
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) DEFAULT 'PENDING' COMMENT 'PENDING|ACTIVE|CLOSE',
  PRIMARY KEY (`id`),
  KEY `FK_cms_post_member` (`usercreated`),
  CONSTRAINT `FK_cms_post_member` FOREIGN KEY (`usercreated`) REFERENCES `cms_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `cms_post` */

insert  into `cms_post`(`id`,`posttitle`,`description`,`plike`,`dislike`,`usercreated`,`datecreated`,`status`) values (1,'asdasd','asdasdsa',0,0,6,'2017-11-19 20:45:45','CLOSE'),(2,'Sample Post 1','On the Insert tab, the galleries include items that are designed to coordinate with the overall look of your document. You can use these galleries to insert tables, headers, footers, lists, cover pages, and other document building blocks',3,0,6,'2017-11-20 11:11:24','ACTIVE'),(3,'xxx','x',1,0,6,'2017-11-20 11:11:38','ACTIVE'),(4,'Sample Post 2','You can easily change the formatting of selected text in the document text by choosing a look for the selected text from the Quick Styles gallery on the Home tab. You can also format text directly by using the other controls on the Home tab. ',2,1,6,'2017-11-20 11:13:43','ACTIVE'),(5,'Sample Post 3','Most controls offer a choice of using the look from the current theme or using a format that you specify directly.',0,0,6,'2017-11-20 13:32:04','PENDING'),(6,'Sample Post 3','Most controls offer a choice of using the look from the current theme or using a format that you specify directly.',0,0,6,'2017-11-20 13:32:22','PENDING'),(7,'sdfsdf','sdfsdfsd',0,0,1,'2017-11-22 13:14:36','PENDING'),(8,'dsdfsdfsdf','sdfsdfsdf',0,0,1,'2017-11-22 13:14:50','PENDING'),(9,'','',0,0,1,'2017-11-22 13:15:00','PENDING'),(10,'','',0,0,1,'2017-11-22 13:15:01','PENDING'),(11,'sadasdsad','sadsadsad',0,0,1,'2017-11-22 13:15:45','PENDING'),(12,'sdfsdfsdf','sdfsdfsd',0,0,1,'2017-11-22 13:16:01','PENDING'),(13,'Sample Test','Post summary',0,0,1,'2018-04-12 14:37:56','PENDING'),(14,'Sample Test','Post summary',0,0,1,'2018-04-12 14:39:07','CLOSE'),(15,'sample post','sample post',0,0,1,'2018-05-05 08:30:03','ACTIVE');

/*Table structure for table `cms_post_vote` */

DROP TABLE IF EXISTS `cms_post_vote`;

CREATE TABLE `cms_post_vote` (
  `postid` int(5) NOT NULL,
  `memberid` int(5) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`postid`,`memberid`),
  KEY `FK_cms_post_vote_member` (`memberid`),
  CONSTRAINT `FK_cms_post_vote_member` FOREIGN KEY (`memberid`) REFERENCES `cms_member` (`id`),
  CONSTRAINT `FK_cms_post_vote_post` FOREIGN KEY (`postid`) REFERENCES `cms_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_post_vote` */

insert  into `cms_post_vote`(`postid`,`memberid`,`type`,`datecreated`) values (2,4,'LIKE','2018-04-18 22:16:45'),(2,6,'LIKE','2017-11-20 13:27:35'),(2,8,'LIKE','2018-04-18 22:17:38'),(3,6,'LIKE','2017-11-20 12:20:07'),(4,1,'LIKE','2018-03-22 17:31:28'),(4,6,'DISLIKE','2017-11-20 13:36:17');

/*Table structure for table `cms_training` */

DROP TABLE IF EXISTS `cms_training`;

CREATE TABLE `cms_training` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `document` varchar(200) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'ACTIVE',
  `created_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `cms_training` */

insert  into `cms_training`(`id`,`title`,`description`,`document`,`status`,`created_datetime`) values (1,'Smaple','Description ','paren_exam_reg_step1.PNG','CLOSE',NULL),(2,'Sample test','This is sample ','parent_registration.PNG','ACTIVE','2018-04-13 22:43:43'),(3,'Blood Donation','Sample Donation ','student_homexx.PNG','ACTIVE','2018-04-18 22:03:25'),(4,'trainng','training ','1524505642493..PNG','ACTIVE','2018-05-05 08:34:55'),(5,'sample traing','fgfgsfd ','assignment-submit.docx','ACTIVE','2018-05-05 08:37:39');

/*Table structure for table `cms_user` */

DROP TABLE IF EXISTS `cms_user`;

CREATE TABLE `cms_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` text,
  `role` varchar(25) DEFAULT NULL COMMENT 'ADMIN|TREASURY ',
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) DEFAULT 'ACT' COMMENT 'ACT|DACT',
  `member_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `cms_user` */

insert  into `cms_user`(`id`,`username`,`password`,`role`,`datecreated`,`status`,`member_id`) values (1,'admin','*667F407DE7C6AD07358FA38DAED7828A72014B4E','ADMIN','2017-10-28 22:03:51','ACT',1),(2,'mem','*667F407DE7C6AD07358FA38DAED7828A72014B4E','MEMBER','2017-10-29 08:05:25','ACT',2),(3,'manager','*667F407DE7C6AD07358FA38DAED7828A72014B4E','MANAGER','2017-10-29 08:06:10','ACT',3),(4,'MEM6','*09904C85991002D20EFCC43E9A02743A702C68C0','MEMBER','2017-11-18 23:10:08','ACT',6),(5,'MEM4','*0223C22D5A3A36F6ABC6BB8F664D0A74B526F239','MEMBER','2017-11-20 18:13:00','ACT',4),(6,'MEM5','*CF0BB34980D4A895952C3B7D066B67A91575FA42','MEMBER','2017-11-20 18:14:54','ACT',5),(7,'MEM7','*E8A37087210732DA9FA3B235B0AE18B81C751EB3','MEMBER','2017-11-22 11:57:32','ACT',7),(8,'MEM8','*C78DEFACBAB60A3C2AE3B6FCF8FDEB9C4CE60F48','MEMBER','2017-11-22 11:59:40','ACT',8),(9,'MEM11','*1D33CAE7DB8220ED1E85B3E32F89BA9FA915C572','MEMBER','2017-11-22 12:07:26','ACT',11),(10,'MEM12','*D8E9957D212B8229D635F66C6520FFEFA56CED17','MEMBER','2017-11-22 12:17:40','ACT',12),(11,'MEM13','*B5CC09437BF8C93B196080A2FC6218B1180DF663','MEMBER','2017-11-22 12:18:29','ACT',13),(12,'MEM14','*79BF68389752DF40A977C07F9F4A6D8E2791FA0C','MEMBER','2017-11-23 09:40:34','ACT',14),(13,'','','VOLUNTEER','2018-04-11 08:45:46','ACT',15),(14,'VOL16','*C5EAEE87A62A522EF8E1C3E7E01B9763A17F6951','VOLUNTEER','2018-04-12 10:45:02','ACT',16),(15,'VOL17','*4699B6ABC1F8DA078874C7985C52F2B39EAB4ACE','VOLUNTEER','2018-04-12 10:52:02','ACT',17),(16,'VOL18','*79BE06089C699CCA99870A9A34DCA5B0C9FB9819','VOLUNTEER','2018-04-18 22:04:25','ACT',18),(17,'MEM19','*4969C3EEABC54EBE7D159C1F4285ECEC5122B4FA','MEMBER','2018-05-05 08:09:27','ACT',19),(18,'MEM20','*12D774989A4E92416EAE5FB19D977E81DC7CD5F7','MEMBER','2018-05-05 08:20:36','ACT',20);

/*Table structure for table `ozekimessagein` */

DROP TABLE IF EXISTS `ozekimessagein`;

CREATE TABLE `ozekimessagein` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(30) DEFAULT NULL,
  `receiver` varchar(30) DEFAULT NULL,
  `msg` text,
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
  `msg` text,
  `senttime` varchar(100) DEFAULT NULL,
  `receivedtime` varchar(100) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `msgtype` varchar(160) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `errormsg` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

/*Data for the table `ozekimessageout` */

insert  into `ozekimessageout`(`id`,`sender`,`receiver`,`msg`,`senttime`,`receivedtime`,`reference`,`status`,`msgtype`,`operator`,`errormsg`) values (1,'0716483414','0715255447','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(2,'0716483414','0725233654','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(3,'0716483414','0458877445','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(4,'0716483414','0251557775','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(5,'0716483414','0255442247','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(6,'0716483414','0715566552','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(7,'0716483414','0716688452','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(8,'0716483414','0774555112','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(9,'0716483414','0784545452','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(10,'0716483414','0714554587','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(11,'0716483414','0715458787','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(12,'0716483414','0714548788','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(13,'0716483414','0756656564','COMMU News : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(14,'0716483414','0715255447','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(15,'0716483414','0725233654','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(16,'0716483414','0458877445','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(17,'0716483414','0251557775','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(18,'0716483414','0255442247','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(19,'0716483414','0715566552','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(20,'0716483414','0716688452','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(21,'0716483414','0774555112','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(22,'0716483414','0784545452','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(23,'0716483414','0714554587','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(24,'0716483414','0715458787','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(25,'0716483414','0714548788','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(26,'0716483414','0756656564','COMMU Post : sdfsdfsdf',NULL,NULL,NULL,'send',NULL,NULL,NULL),(27,'0716483414','022211',' Welcome to COMMU Your user id : is',NULL,NULL,NULL,'send',NULL,NULL,NULL),(28,'0716483414','212119',' Welcome to COMMU Your user id : isVOL16',NULL,NULL,NULL,'send',NULL,NULL,NULL),(29,'0716483414','212119',' Welcome to COMMU Your user id : isVOL17',NULL,NULL,NULL,'send',NULL,NULL,NULL),(30,'0716483414','0715255447','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(31,'0716483414','0725233654','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(32,'0716483414','0458877445','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(33,'0716483414','0251557775','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(34,'0716483414','0255442247','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(35,'0716483414','0715566552','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(36,'0716483414','0716688452','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(37,'0716483414','0774555112','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(38,'0716483414','0784545452','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(39,'0716483414','0714554587','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(40,'0716483414','0715458787','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(41,'0716483414','0714548788','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(42,'0716483414','0756656564','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(43,'0716483414','','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(44,'0716483414','022211','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(45,'0716483414','212119','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(46,'0716483414','212119','COMMU News : Sample',NULL,NULL,NULL,'send',NULL,NULL,NULL),(47,'0716483414','0715255447','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(48,'0716483414','0725233654','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(49,'0716483414','0458877445','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(50,'0716483414','0251557775','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(51,'0716483414','0255442247','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(52,'0716483414','0715566552','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(53,'0716483414','0716688452','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(54,'0716483414','0774555112','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(55,'0716483414','0784545452','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(56,'0716483414','0714554587','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(57,'0716483414','0715458787','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(58,'0716483414','0714548788','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(59,'0716483414','0756656564','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(60,'0716483414','','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(61,'0716483414','022211','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(62,'0716483414','212119','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(63,'0716483414','212119','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(64,'0716483414','0715255447','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(65,'0716483414','0725233654','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(66,'0716483414','0458877445','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(67,'0716483414','0251557775','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(68,'0716483414','0255442247','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(69,'0716483414','0715566552','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(70,'0716483414','0716688452','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(71,'0716483414','0774555112','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(72,'0716483414','0784545452','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(73,'0716483414','0714554587','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(74,'0716483414','0715458787','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(75,'0716483414','0714548788','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(76,'0716483414','0756656564','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(77,'0716483414','','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(78,'0716483414','022211','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(79,'0716483414','212119','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(80,'0716483414','212119','COMMU Post : Sample Test',NULL,NULL,NULL,'send',NULL,NULL,NULL),(81,'0716483414','0715833422',' Welcome to COMMU Your user id : isVOL18',NULL,NULL,NULL,'send',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
