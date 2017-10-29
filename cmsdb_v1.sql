/*
SQLyog Ultimate v8.55 
MySQL - 5.5.5-10.1.21-MariaDB : Database - cmsdb
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
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_cms_election_user` (`usercreated`),
  CONSTRAINT `FK_cms_election_user` FOREIGN KEY (`usercreated`) REFERENCES `cms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_election` */

/*Table structure for table `cms_election_vote` */

DROP TABLE IF EXISTS `cms_election_vote`;

CREATE TABLE `cms_election_vote` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `electionid` int(5) DEFAULT NULL,
  `memberid` int(5) DEFAULT NULL,
  `vote` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cms_election_vote_election` (`electionid`),
  KEY `FK_cms_election_vote_member` (`memberid`),
  CONSTRAINT `FK_cms_election_vote_election` FOREIGN KEY (`electionid`) REFERENCES `cms_election` (`id`),
  CONSTRAINT `FK_cms_election_vote_member` FOREIGN KEY (`memberid`) REFERENCES `cms_member` (`id`)
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
  PRIMARY KEY (`id`),
  KEY `FK_cms_inventory_item` (`itemid`),
  KEY `FK_cms_inventory_member` (`memberid`),
  CONSTRAINT `FK_cms_inventory_item` FOREIGN KEY (`itemid`) REFERENCES `cms_item` (`id`),
  CONSTRAINT `FK_cms_inventory_member` FOREIGN KEY (`memberid`) REFERENCES `cms_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_inventory` */

/*Table structure for table `cms_item` */

DROP TABLE IF EXISTS `cms_item`;

CREATE TABLE `cms_item` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(250) DEFAULT NULL,
  `qyt` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `cms_item` */

insert  into `cms_item`(`id`,`itemname`,`qyt`) values (1,'hut',10);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cms_member` */

insert  into `cms_member`(`id`,`firstname`,`lastname`,`nic`,`username`,`email`,`currentaddress`,`experticeid`,`permanentaddress`,`authstatus`,`datecreated`,`autorizeby`) values (1,'Thisara','Perera','8877887788V','admin','thisara@gmai',NULL,0,'Kadawatha','Authorized','2017-10-28 09:23:00',1),(2,'Gayan','Fernando','8788778878V','mem','gaya@gmail.com','cusrret,colombo',1,'gampaha','Authorized','2017-10-28 19:34:58',1),(3,'Kamala','Mathu','8877665566V','manager','manager@gmail','manager,gampaha',1,'colombo','Authorized','2017-10-28 19:37:45',1);

/*Table structure for table `cms_news` */

DROP TABLE IF EXISTS `cms_news`;

CREATE TABLE `cms_news` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `photopath` varchar(250) DEFAULT NULL,
  `usercreated` int(5) DEFAULT NULL COMMENT 'cms_user',
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(5) DEFAULT NULL COMMENT 'ACT|DACT',
  PRIMARY KEY (`id`),
  KEY `FK_cms_news_user` (`usercreated`),
  CONSTRAINT `FK_cms_news_user` FOREIGN KEY (`usercreated`) REFERENCES `cms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_news` */

/*Table structure for table `cms_post` */

DROP TABLE IF EXISTS `cms_post`;

CREATE TABLE `cms_post` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `posttitle` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `like` int(5) DEFAULT NULL,
  `dislike` int(5) DEFAULT NULL,
  `usercreated` int(5) DEFAULT NULL COMMENT 'cms_member',
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) DEFAULT NULL COMMENT 'ACT|DACT',
  PRIMARY KEY (`id`),
  KEY `FK_cms_post_member` (`usercreated`),
  CONSTRAINT `FK_cms_post_member` FOREIGN KEY (`usercreated`) REFERENCES `cms_member` (`id`)
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
  KEY `FK_cms_post_vote_member` (`memberid`),
  CONSTRAINT `FK_cms_post_vote_member` FOREIGN KEY (`memberid`) REFERENCES `cms_member` (`id`),
  CONSTRAINT `FK_cms_post_vote_post` FOREIGN KEY (`postid`) REFERENCES `cms_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cms_post_vote` */

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cms_user` */

insert  into `cms_user`(`id`,`username`,`password`,`role`,`datecreated`,`status`,`member_id`) values (1,'admin','*667F407DE7C6AD07358FA38DAED7828A72014B4E','ADMIN','2017-10-28 09:33:51','ACT',1),(2,'mem','*667F407DE7C6AD07358FA38DAED7828A72014B4E','MEMBER','2017-10-28 19:35:25','ACT',2),(3,'manager','*667F407DE7C6AD07358FA38DAED7828A72014B4E','MANAGER','2017-10-28 19:36:10','ACT',3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
