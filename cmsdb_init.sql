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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_attendance` */

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
  CONSTRAINT `FK_cms_election_user` FOREIGN KEY (`usercreated`) REFERENCES `cms_user_backup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_election` */

/*Table structure for table `cms_election_vote` */

DROP TABLE IF EXISTS `cms_election_vote`;

CREATE TABLE `cms_election_vote` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `electionid` int(5) DEFAULT NULL,
  `memberid` int(5) DEFAULT NULL,
  `vote` int(5) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_cms_election_vote_election` (`electionid`),
  KEY `FK_cms_election_vote_member` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_election_vote` */

/*Table structure for table `cms_expertise` */

DROP TABLE IF EXISTS `cms_expertise`;

CREATE TABLE `cms_expertise` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `expertise` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cms_expertise` */

insert  into `cms_expertise`(`id`,`expertise`) values (1,'Software Engineer');

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
  KEY `FK_cms_inventory_member` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_inventory` */

/*Table structure for table `cms_item` */

DROP TABLE IF EXISTS `cms_item`;

CREATE TABLE `cms_item` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(250) DEFAULT NULL,
  `qyt` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`itemname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_item` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cms_member` */

insert  into `cms_member`(`id`,`firstname`,`lastname`,`nic`,`username`,`email`,`currentaddress`,`experticeid`,`permanentaddress`,`authstatus`,`datecreated`,`autorizeby`,`role`,`usercreated`,`post_title`,`mobileno`) values (1,'Thisara','Perera','86512541V','admin','info@commulk.com','Commu,Colombo 7',1,'Colombo 7','Authorized','2018-05-05 12:53:20',1,'ADMIN',1,NULL,'+947856540');

/*Table structure for table `cms_member_backup` */

DROP TABLE IF EXISTS `cms_member_backup`;

CREATE TABLE `cms_member_backup` (
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

/*Data for the table `cms_member_backup` */

insert  into `cms_member_backup`(`id`,`firstname`,`lastname`,`nic`,`username`,`email`,`currentaddress`,`experticeid`,`permanentaddress`,`authstatus`,`datecreated`,`autorizeby`,`role`,`usercreated`,`post_title`,`mobileno`) values (1,'Thisara','Perera','8877887788V','admin','thisara@gmai',NULL,0,'Kadawatha','Authorized','2017-10-28 21:53:00',1,'ADMIN',NULL,NULL,'0715255447'),(2,'Gayan','Fernando','8788778878V','MEM2','gaya@gmail.com','cusrret,colombo',1,'gampaha','Authorized','2017-10-29 08:04:58',1,'MEMBER',NULL,'EB','0725233654'),(3,'Kamala','Mathu','8877665566V','MEM3','manager@gmail','manager,gampaha',1,'colombo','Authorized','2017-10-29 08:07:45',1,'MANAGER',NULL,NULL,'0458877445'),(4,'','','','MEM4','','',0,'','AUTHORIZED','2017-11-18 23:01:35',NULL,'',1,NULL,'0251557775'),(5,'sss','sss','333','MEM5','a@gmail.com',' dddd',0,' ggg','AUTHORIZED','2017-11-18 23:04:26',3,'MEMBER',1,NULL,'0255442247'),(6,'ssss','ddddd','wwwww','MEM6','we@dd.com','dfdfdf ',0,' sfdf','Authorized','2017-11-18 23:10:08',NULL,'MEMBER',1,NULL,'0715566552'),(7,'sadsad','sadsad','3213','MEM7','sadsad',' sfdsdfsd',1,' fdsfsdfsdf','AUTHORIZED','2017-11-20 16:30:39',3,'MEMBER',6,NULL,'0716688452'),(8,'ssadasd','sadsadsa','24234234','MEM8','ewrwerwe@sfd.fdg',' dsfsdf',1,' sdfsdf','AUTHORIZED','2017-11-20 16:43:32',1,'MEMBER',6,NULL,'0774555112'),(9,'sadasdsad','sadsad','24334234','MEM9','asdsad',' sadsad',1,' asdsad','Authorized','2017-11-20 17:03:31',3,'MEMBER',3,NULL,'0784545452'),(10,'sadsad','sadsad','sadsad','MEM10','sadsad',' sadsad',1,' sadsad','Authorized','2017-11-20 17:04:12',3,'MEMBER',3,NULL,'0714554587'),(11,'xxx','ddd','334234','MEM11','erewrwe',' sdfsdfsd',1,' sdfsdfsd','Authorized','2017-11-22 12:07:26',NULL,'MEMBER',1,NULL,'0715458787'),(12,'sdsdsd','sdsdsd','3234324','MEM12','xxx@ff.con',' dsfsdfsdf',1,' sdfsdf','Authorized','2017-11-22 12:17:40',NULL,'MEMBER',1,NULL,'0714548788'),(13,'sdsdsds','sdsdsd','3423423','MEM13','fsdfsdf@ggfd.com',' sdfsdf',1,' gfdgfd','Authorized','2017-11-22 12:18:29',NULL,'MEMBER',1,NULL,'0756656564'),(14,'Raviii','Ferrr','36552662','MEM14','ravinathdo@gmail.com','hdjfhjfhjdh ',1,'dfgkhgjhf ','AUTHORIZED','2017-11-23 09:39:10',1,'MEMBER',6,NULL,NULL),(15,'pp','pp','5522','','sadsad@fsd.fdgfd','4545 ',1,'4545 ','Authorized','2018-04-11 08:45:45',NULL,'VOLUNTEER',1,NULL,'022211'),(16,'dfsdfsd','fsdfds','3213213213','VOL16','sdfsd@fsd.hh',' gfd',1,' dsfsd','Authorized','2018-04-12 10:45:01',NULL,'VOLUNTEER',1,NULL,'212119'),(17,'dfsdfsd','fsdfds','3213213213','VOL17','sdfsd@fsd.hh',' gfd',1,' dsfsd','Authorized','2018-04-12 10:52:02',1,'VOLUNTEER',1,NULL,'212119'),(18,'Dinesh','Kumara','86351254V','VOL18','din@g.com',' ',1,' ','Authorized','2018-04-18 22:04:22',1,'VOLUNTEER',1,NULL,'0715833422'),(19,'Sample user1','Lastnamw','885544','MEM19','mcogmail@g.com',' raddoluwa',1,' ','Authorized','2018-05-05 08:09:25',1,'MEMBER',1,NULL,'+94715833470'),(20,'Kusuma','Kummm','8866542254V','MEM20','ku@gmail.com','Ku ',1,'Ku ','AUTHORIZED','2018-05-05 08:13:29',1,'MEMBER',19,NULL,NULL);

/*Table structure for table `cms_member_election` */

DROP TABLE IF EXISTS `cms_member_election`;

CREATE TABLE `cms_member_election` (
  `member_id` int(5) NOT NULL,
  `election_id` int(5) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`,`election_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_member_election` */

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
  CONSTRAINT `FK_cms_news_user` FOREIGN KEY (`usercreated`) REFERENCES `cms_user_backup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_news` */

/*Table structure for table `cms_payment` */

DROP TABLE IF EXISTS `cms_payment`;

CREATE TABLE `cms_payment` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `year_pay` int(5) DEFAULT NULL,
  `payment_amount` decimal(10,5) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `member_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_payment` */

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
  KEY `FK_cms_post_member` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_post` */

/*Table structure for table `cms_post_vote` */

DROP TABLE IF EXISTS `cms_post_vote`;

CREATE TABLE `cms_post_vote` (
  `postid` int(5) NOT NULL,
  `memberid` int(5) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`postid`,`memberid`),
  KEY `FK_cms_post_vote_member` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_post_vote` */

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_training` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cms_user` */

insert  into `cms_user`(`id`,`username`,`password`,`role`,`datecreated`,`status`,`member_id`) values (1,'admin','*667F407DE7C6AD07358FA38DAED7828A72014B4E','ADMIN','2018-05-05 12:55:47','ACT',1);

/*Table structure for table `cms_user_backup` */

DROP TABLE IF EXISTS `cms_user_backup`;

CREATE TABLE `cms_user_backup` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` text,
  `role` varchar(25) DEFAULT NULL COMMENT 'ADMIN|TREASURY ',
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) DEFAULT 'ACT' COMMENT 'ACT|DACT',
  `member_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `cms_user_backup` */

insert  into `cms_user_backup`(`id`,`username`,`password`,`role`,`datecreated`,`status`,`member_id`) values (1,'admin','*667F407DE7C6AD07358FA38DAED7828A72014B4E','ADMIN','2017-10-28 22:03:51','ACT',1),(2,'mem','*667F407DE7C6AD07358FA38DAED7828A72014B4E','MEMBER','2017-10-29 08:05:25','ACT',2),(3,'manager','*667F407DE7C6AD07358FA38DAED7828A72014B4E','MANAGER','2017-10-29 08:06:10','ACT',3),(4,'MEM6','*09904C85991002D20EFCC43E9A02743A702C68C0','MEMBER','2017-11-18 23:10:08','ACT',6),(5,'MEM4','*0223C22D5A3A36F6ABC6BB8F664D0A74B526F239','MEMBER','2017-11-20 18:13:00','ACT',4),(6,'MEM5','*CF0BB34980D4A895952C3B7D066B67A91575FA42','MEMBER','2017-11-20 18:14:54','ACT',5),(7,'MEM7','*E8A37087210732DA9FA3B235B0AE18B81C751EB3','MEMBER','2017-11-22 11:57:32','ACT',7),(8,'MEM8','*C78DEFACBAB60A3C2AE3B6FCF8FDEB9C4CE60F48','MEMBER','2017-11-22 11:59:40','ACT',8),(9,'MEM11','*1D33CAE7DB8220ED1E85B3E32F89BA9FA915C572','MEMBER','2017-11-22 12:07:26','ACT',11),(10,'MEM12','*D8E9957D212B8229D635F66C6520FFEFA56CED17','MEMBER','2017-11-22 12:17:40','ACT',12),(11,'MEM13','*B5CC09437BF8C93B196080A2FC6218B1180DF663','MEMBER','2017-11-22 12:18:29','ACT',13),(12,'MEM14','*79BF68389752DF40A977C07F9F4A6D8E2791FA0C','MEMBER','2017-11-23 09:40:34','ACT',14),(13,'','','VOLUNTEER','2018-04-11 08:45:46','ACT',15),(14,'VOL16','*C5EAEE87A62A522EF8E1C3E7E01B9763A17F6951','VOLUNTEER','2018-04-12 10:45:02','ACT',16),(15,'VOL17','*4699B6ABC1F8DA078874C7985C52F2B39EAB4ACE','VOLUNTEER','2018-04-12 10:52:02','ACT',17),(16,'VOL18','*79BE06089C699CCA99870A9A34DCA5B0C9FB9819','VOLUNTEER','2018-04-18 22:04:25','ACT',18),(17,'MEM19','*4969C3EEABC54EBE7D159C1F4285ECEC5122B4FA','MEMBER','2018-05-05 08:09:27','ACT',19),(18,'MEM20','*12D774989A4E92416EAE5FB19D977E81DC7CD5F7','MEMBER','2018-05-05 08:20:36','ACT',20);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ozekimessageout` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
