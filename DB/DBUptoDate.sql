CREATE DATABASE  IF NOT EXISTS `ael` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ael`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: ael
-- ------------------------------------------------------
-- Server version	5.5.20-log

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
-- Table structure for table `accountingcus`
--

DROP TABLE IF EXISTS `accountingcus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountingcus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator` bigint(20) DEFAULT NULL,
  `updator` bigint(20) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `refNo` varchar(45) DEFAULT NULL,
  `docsgeneral` bigint(20) DEFAULT NULL,
  `counting` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custodocgeneral_idx` (`docsgeneral`),
  CONSTRAINT `custodocgeneral` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountingcus`
--

LOCK TABLES `accountingcus` WRITE;
/*!40000 ALTER TABLE `accountingcus` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountingcus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountingcusdetail`
--

DROP TABLE IF EXISTS `accountingcusdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountingcusdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accountingcus` bigint(20) DEFAULT NULL,
  `generalVat` decimal(5,2) DEFAULT NULL,
  `description` bigint(20) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  `name` bigint(20) DEFAULT NULL,
  `invoice` varchar(1000) DEFAULT NULL,
  `quantity20` int(10) DEFAULT NULL,
  `quantity40` int(10) DEFAULT NULL,
  `quantityLCL` int(10) DEFAULT NULL,
  `total` decimal(20,2) DEFAULT NULL,
  `quantityOt` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nameDebit_idx` (`name`),
  KEY `toDescCon_idx` (`description`),
  KEY `acountingToDocs_idx` (`accountingcus`),
  CONSTRAINT `acountingToDocs` FOREIGN KEY (`accountingcus`) REFERENCES `accountingcus` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `nameDebit` FOREIGN KEY (`name`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toDescCon` FOREIGN KEY (`description`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountingcusdetail`
--

LOCK TABLES `accountingcusdetail` WRITE;
/*!40000 ALTER TABLE `accountingcusdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountingcusdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advancedetail`
--

DROP TABLE IF EXISTS `advancedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advancedetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `docs` bigint(20) DEFAULT NULL,
  `advanceForm` bigint(20) DEFAULT NULL,
  `amount` decimal(20,0) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `goodDes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toAdvane_idx` (`advanceForm`),
  KEY `toDocs_idx` (`docs`),
  CONSTRAINT `toAdvane` FOREIGN KEY (`advanceForm`) REFERENCES `advanceform` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `toDocs` FOREIGN KEY (`docs`) REFERENCES `docsgeneral` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advancedetail`
--

LOCK TABLES `advancedetail` WRITE;
/*!40000 ALTER TABLE `advancedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `advancedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advanceform`
--

DROP TABLE IF EXISTS `advanceform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advanceform` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee` bigint(20) DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  `updator` bigint(20) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `refNo` varchar(45) DEFAULT NULL,
  `timeRefund` datetime DEFAULT NULL,
  `doApproval` int(1) DEFAULT NULL,
  `payReason` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toOwner_idx` (`employee`),
  CONSTRAINT `toEmployeeAd` FOREIGN KEY (`employee`) REFERENCES `app_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advanceform`
--

LOCK TABLES `advanceform` WRITE;
/*!40000 ALTER TABLE `advanceform` DISABLE KEYS */;
/*!40000 ALTER TABLE `advanceform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postal_code` varchar(15) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `credentials_expired` bit(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `account_enabled` bit(1) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_hint` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (-3,'\0','\0','','Denver','US','80210','CO','\0','two_roles_user@appfuse.org','','Two Roles','User','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','Not a female kitty.','','trucking',2,'http://raibledesigns.com'),(-2,'\0','\0','','Denver','US','80210','CO','\0','matt@raibledesigns.com','','Matt','Raible','$2a$10$bH/ssqW8OhkTlIso9/yakubYODUOmh.6m5HEJvcBq3t3VdBh7ebqO','Not a female kitty.','','admin',1,'http://raibledesigns.com'),(-1,'\0','\0','','Denver','US','80210','CO','\0','matt_raible@yahoo.com','','Tomcat','User','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','A male kitty.','','accounting',2,'http://tomcat.apache.org'),(2,'\0','\0','','','','','','\0','tlinh2110@yahoo.com','','linh','vo','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','liv1hc','09090909','liv1hc',7,'adsdsad'),(4,'\0','\0','','','','','','\0','tlinh21110@yahoo.com','','Linh','Vo','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','from 1 to 9','0912344545','manifest',4,''),(5,'\0','\0','','','','','','\0','tlinh21q10@yahoo.com','','linh ','vo','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','liv1hc','','sales',6,'');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(250) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `offerPrice` bigint(20) DEFAULT NULL,
  `docsgeneral` bigint(20) DEFAULT NULL,
  `trucking` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filetosale_idx` (`offerPrice`),
  KEY `filetodoc_idx` (`docsgeneral`),
  KEY `filetoTruck_idx` (`trucking`),
  CONSTRAINT `filetodoc` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `filetosale` FOREIGN KEY (`offerPrice`) REFERENCES `offerprice` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `filetoTruck` FOREIGN KEY (`trucking`) REFERENCES `truckingservice` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` int(1) DEFAULT '1',
  `implyActions` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (-10,'Chi phí chi hộ',20,'Thông tin customs service',1,'{1}'),(-4,'Xuất',27,'',1,NULL),(-3,'Nhập',27,'',1,NULL),(-2,'LCL',7,NULL,1,NULL),(-1,'FCL',7,NULL,1,NULL),(60,'Công ty nước ngoài',4,'Thông tin customer',1,NULL),(61,'Công ty Việt Nam',4,'Thông tin customer',1,NULL),(62,'Công ty đầu tư nước ngoài',4,'Thông tin customer',1,NULL),(63,'Công ty liên doanh',4,'Thông tin customer',1,NULL),(64,'Doanh nghiệp chế xuất',4,'Thông tin customer',1,NULL),(65,'Văn phòng đại diện',4,'Thông tin customer',1,NULL),(66,'Vietnam',5,'Thông tin customer',1,NULL),(67,'Thailand',5,'Thông tin customer',1,NULL),(68,'Singapore',5,'Thông tin customer',1,NULL),(69,'Campodia',5,'Thông tin customer',1,NULL),(70,'Malaysia',5,'Thông tin customer',1,NULL),(71,'Indonesia',5,'Thông tin customer',1,NULL),(72,'Philippine',5,'Thông tin customer',1,NULL),(73,'Myanmar',5,'Thông tin customer',1,NULL),(74,'China',5,'Thông tin customer',1,NULL),(75,'Korea',5,'Thông tin customer',1,NULL),(76,'Japan',5,'Thông tin customer',1,NULL),(77,'Taiwan',5,'Thông tin customer',1,NULL),(78,'Hongkong',5,'Thông tin customer',1,NULL),(79,'Germany',5,'Thông tin customer',1,NULL),(80,'Denmark',5,'Thông tin customer',1,NULL),(81,'France',5,'Thông tin customer',1,NULL),(82,'England',5,'Thông tin customer',1,NULL),(83,'Nertherland',5,'Thông tin customer',1,NULL),(84,'Australia',5,'Thông tin customer',1,NULL),(85,'USA',5,'Thông tin customer',1,NULL),(86,'Dịch vụ hải quan',0,'Thông tin báo giá',1,NULL),(87,'Dịch vụ vận chuyển',0,'Thông tin báo giá',1,NULL),(88,'Dịch vụ hải quan và vận chuyển',0,'Thông tin báo giá',1,NULL),(89,'Dịch vụ triển lãm',0,'Thông tin báo giá',1,NULL),(90,'Dịch vụ đóng gói, lắp đặt',0,'Thông tin báo giá',1,NULL),(91,'VND',1,'Thông tin báo giá',1,NULL),(92,'USD',1,'Thông tin báo giá',1,NULL),(93,'SGD',1,'Thông tin báo giá',1,NULL),(94,'AUD',1,'Thông tin báo giá',1,NULL),(96,'Xuất kinh doanh',11,'Thông tin customs service',1,NULL),(97,'Xuất phi mậu dịch',11,'Thông tin customs service',1,NULL),(98,'Tạm xuất tái nhập',11,'Thông tin customs service',1,NULL),(99,'Nhập SXXK',11,'Thông tin customs service',1,NULL),(100,'Tái xuất',11,'Thông tin customs service',1,NULL),(101,'Xuất SXXK',11,'Thông tin customs service',1,NULL),(102,'Nhập kinh doanh',11,'Thông tin customs service',1,NULL),(103,'Nhập phi mậu dịch',11,'Thông tin customs service',1,NULL),(104,'Tạm nhập tái xuất',11,'Thông tin customs service',1,NULL),(105,'Đường không',6,'Thông tin customs service',1,NULL),(106,'Biển',6,'Thông tin customs service',1,NULL),(107,'NYK',12,'Thông tin customs service',1,NULL),(108,'APL',12,'Thông tin customs service',1,NULL),(109,'MOL',12,'Thông tin customs service',1,NULL),(110,'OOCL',12,'Thông tin customs service',1,NULL),(111,'COSCO',12,'Thông tin customs service',1,NULL),(112,'PIL',12,'Thông tin customs service',1,NULL),(113,'NAMSUNG',12,'Thông tin customs service',1,NULL),(114,'INTERASIA',12,'Thông tin customs service',1,NULL),(115,'TSLINE',12,'Thông tin customs service',1,NULL),(116,'MYANGMINH',12,'Thông tin customs service',1,NULL),(117,'SITC',12,'Thông tin customs service',1,NULL),(118,'RCL',12,'Thông tin customs service',1,NULL),(119,'KLINE',12,'Thông tin customs service',1,NULL),(120,'UASC',12,'Thông tin customs service',1,NULL),(121,'MAERSK',12,'Thông tin customs service',1,NULL),(122,'BIEN DONG',12,'Thông tin customs service',1,NULL),(123,'MARINA',12,'Thông tin customs service',1,NULL),(124,'VOSCO',12,'Thông tin customs service',1,NULL),(125,'SINOKOR',12,'Thông tin customs service',1,NULL),(126,'DHL',12,'Thông tin customs service',1,NULL),(127,'FEDEX',12,'Thông tin customs service',1,NULL),(128,'TNT',12,'Thông tin customs service',1,NULL),(129,'Quản lý hàng đầu tư HCM',13,'Thông tin customs service',1,NULL),(130,'Mỹ Phước 1',13,'Thông tin customs service',1,NULL),(131,'Cảng Bình Dương',13,'Thông tin customs service',1,NULL),(132,'VSIP',13,'Thông tin customs service',1,NULL),(133,'Biên Hoà',13,'Thông tin customs service',1,NULL),(134,'Long Bình Tân',13,'Thông tin customs service',1,NULL),(135,'Cảng Cát Lái',13,'Thông tin customs service',1,NULL),(136,'Khánh Hội',13,'Thông tin customs service',1,NULL),(155,'VICT',13,'Thông tin customs service',1,NULL),(156,'Bến Nghé',13,'Thông tin customs service',1,NULL),(157,'ICD TRANSIMEX',13,'Thông tin customs service',1,NULL),(158,'ICD Phước Long 1',13,'Thông tin customs service',1,NULL),(159,'ICD Phước Long 3',13,'Thông tin customs service',1,NULL),(160,'ICD TAMAMEXCO',13,'Thông tin customs service',1,NULL),(161,'ICD SOTRANS',13,'Thông tin customs service',1,NULL),(162,'Cảng Hải Phòng',13,'Thông tin customs service',1,NULL),(163,'Bắc Hà Nội',13,'Thông tin customs service',1,NULL),(164,'1',8,'GREEN',1,NULL),(165,'2',8,'YELLOW',1,NULL),(166,'3',8,'RED',1,NULL),(167,'20 DR',10,'Thông tin CONT',1,NULL),(168,'20 FR',10,'Thông tin CONT',1,NULL),(169,'20 OP',10,'Thông tin CONT',1,NULL),(170,'20 TK',10,'Thông tin CONT',1,NULL),(171,'40 DR',10,'Thông tin CONT',1,NULL),(172,'40 HQ',10,'Thông tin CONT',1,NULL),(173,'40 FR',10,'Thông tin CONT',1,NULL),(174,'40 OP',10,'Thông tin CONT',1,NULL),(175,'40 TK',10,'Thông tin CONT',1,NULL),(176,'45 HQ',10,'Thông tin CONT',1,NULL),(178,'Chi phí AEL',20,'Thông tin customs service',1,NULL),(180,'Khác',20,'Thông tin customs service',1,NULL),(181,'Cước vận chuyển nội địa',19,'Thông tin báo giá',1,NULL),(182,'Cước vận chuyển quốc tế',19,'Thông tin báo giá',1,NULL),(183,'Phí hạ',19,'Thông tin báo giá',1,NULL),(184,'Phí nâng',19,'Thông tin báo giá',1,NULL),(185,'Phí chứng từ',19,'Thông tin báo giá',1,NULL),(186,'Phí D/O',19,'Thông tin báo giá',1,NULL),(187,'Phí xếp dỡ',19,'Thông tin báo giá',1,NULL),(188,'Phí lưu bãi',19,'Thông tin báo giá',1,NULL),(189,'Phí lưu cont',19,'Thông tin báo giá',1,NULL),(190,'Phí lưu kho',19,'Thông tin báo giá',1,NULL),(191,'Phí vệ sinh',19,'Thông tin báo giá',1,NULL),(192,'Phí sữa chữa',19,'Thông tin báo giá',1,NULL),(193,'Phí kiểm dịch',19,'Thông tin báo giá',1,NULL),(194,'Chi phí hải quan',19,'Thông tin báo giá',1,NULL),(195,'Lệ phí hải quan',19,'Thông tin báo giá',1,NULL),(196,'Phí bốc hàng',19,'Thông tin báo giá',1,NULL),(197,'Phí ký chứng từ',19,'Thông tin báo giá',1,NULL),(198,'Phí thanh lý',19,'Thông tin báo giá',1,NULL),(199,'Hàng rời',7,'Thông tin Transportation Services',1,NULL),(200,'Xuất',14,'Thông tin Transportation Services',1,NULL),(201,'Nhập',14,'Thông tin Transportation Services',1,NULL),(202,'Chuyển kho',14,'Thông tin Transportation Services',1,NULL),(203,'Bắc - Nam',15,'Thông tin Transportation Services',1,NULL),(204,'Nam - Bắc',15,'Thông tin Transportation Services',1,NULL),(205,'Tạm xuất',17,'Thông tin exhibition',1,NULL),(206,'Tạm nhập',17,'Thông tin exhibition',1,NULL),(207,'Xuất KD',17,'Thông tin exhibition',1,NULL),(208,'Tái nhập',17,'Thông tin exhibition',1,NULL),(209,'Nhập sau',17,'Thông tin exhibition',1,NULL),(210,'Onsite',17,'Thông tin exhibition',1,NULL),(211,'Phí xin GP',21,'Thông tin exhibition',1,NULL),(212,'Local charge at depart',21,'Thông tin exhibition',1,NULL),(213,'Local charge at dest',21,'Thông tin exhibition',1,NULL),(214,'Phí onsite',21,'Thông tin exhibition',1,NULL),(215,'Phí XN - CN',21,'Thông tin exhibition',1,NULL),(216,'Phí giao nhận',21,'Thông tin exhibition',1,NULL),(217,'Phí OF',21,'Thông tin exhibition',1,NULL),(218,'Phí đại lý',21,'Thông tin exhibition',1,NULL),(219,'Tiền thuế XNK',21,'Thông tin exhibition',1,NULL),(220,'Phí khác',21,'Thông tin exhibition',1,NULL),(260,'Phí dịch vụ hải quan và vận chuyển',23,'',1,NULL),(261,'Customs clearance  & Transportation fee',24,'',1,NULL),(271,'Cái',3,NULL,1,NULL),(272,'Con',3,NULL,1,NULL),(274,'Lào',5,NULL,1,NULL),(279,'TEST_Ban tổ chức',22,NULL,1,NULL),(281,'TESTFE',26,NULL,1,NULL),(282,'TESTw',25,NULL,1,NULL),(283,'Inward handling',25,NULL,1,NULL),(284,'Outward',25,NULL,1,NULL),(285,'sfsd',26,NULL,1,NULL),(286,'Đường bộ',6,'',1,NULL),(287,'Loại khác',14,'',1,NULL);
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contseal`
--

DROP TABLE IF EXISTS `contseal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contseal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `docsgeneral` bigint(20) DEFAULT NULL,
  `noOfCont` varchar(255) DEFAULT NULL,
  `typeOfCont` bigint(20) DEFAULT NULL,
  `noOfPKGS` int(11) DEFAULT NULL,
  `noSeal` varchar(45) DEFAULT NULL,
  `weight` decimal(15,2) DEFAULT NULL,
  `depotDev` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toParentPackage` (`docsgeneral`),
  KEY `toContCOnt_idx` (`typeOfCont`),
  CONSTRAINT `toContCOnt` FOREIGN KEY (`typeOfCont`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toGenerals` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contseal`
--

LOCK TABLES `contseal` WRITE;
/*!40000 ALTER TABLE `contseal` DISABLE KEYS */;
/*!40000 ALTER TABLE `contseal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `taxno` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `companyType` bigint(20) DEFAULT NULL,
  `country` bigint(20) DEFAULT NULL,
  `code` varchar(45) NOT NULL,
  `creator` bigint(20) NOT NULL,
  `updator` bigint(20) NOT NULL,
  `createdDate` datetime DEFAULT NULL,
  `lastUpdateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `ownerUser_idx` (`creator`),
  KEY `companyConfig_idx` (`companyType`),
  KEY `FK600E7C55A11345A0` (`companyType`),
  KEY `FK600E7C553B176372` (`creator`),
  KEY `FK600E7C55F86957FF` (`country`),
  KEY `FK600E7C55EFCFC545` (`updator`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'DNTN MÁY VÀ THIẾT BỊ Á CHÂU','55/11B Tổ 55, khu phố 4, P. Tân Chánh Hiệp, Quận 12, Tp.HCM','30209008','','','55/11B Tổ 55, khu phố 4, P. Tân Chánh Hiệp, Quận 12, Tp.HCM','',63,84,'ACHAU-DNTN',-2,-2,'2015-03-13 00:00:00','2015-03-22 06:25:54'),(2,'CÔNG TY TNHH AGILITY LOGISTICS VIỆT NAM','364 Cộng Hòa, Phường 13, Quận Tân Bình, Tp.HCM','303588782','','','','empty@email.com',63,66,'AGILITY',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(3,'CÔNG TY TNHH AGILITY','Toà nhà ETOWN, 364 Cộng Hòa, Phường 13, Quận Tân Bình, Tp.HCM','305244593','','','','empty@email.com',63,66,'AGILITY 1',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(4,'CÔNG TY CỔ PHẦN THỰC PHẨM AGREX SAIGON','Lô H.01 - H.02, Đường Trung Tâm, Khu công nghiệp Long Hậu, Xã Long hậu, Huyện Cần Giuộc, Tỉnh Long An, Việt Nam','1100928386','','','','empty@email.com',63,66,'AGREX SAIGON',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(5,'CÔNG TY TNHH AKITA OIL SEAL VIỆT NAM','Lô A4, KCN Nomura Hải Phòng, An Dương, Hải Phòng','200653158','','','','empty@email.com',63,66,'AKITA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(6,'CÔNG TY TNHH ĐẦU TƯ PHÁT TRIỂN CÔNG NGHỆ ÁNH DƯƠNG','78/9A Ba Vân, Phường 14, Quận Tân Bình, TP HCM','311112122','','','','empty@email.com',63,66,'ANH DUONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(7,'CÔNG TY TNHH MTV THƯƠNG MẠI KỸ THUẬT ĐIỆN ÁNH SÁNG VIỆT','216 Âu Dương Lân, Phường 3, Quận 8, TP HCM.','304886686','','','','empty@email.com',63,66,'ANH SANG VIET',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(8,'CÔNG TY TNHH VIỄN THÔNG ANH KHÔI','42 Nguyễn Thái Bình, Phường Nguyễn Thái Bình, Quận 1, TP HCM','310964854','','','','empty@email.com',63,66,'ANHKHOI',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(9,'CÔNG TY CỔ PHẦN XUẤT NHẬP KHẨU THUỶ SẢN AN MỸ','Lô A2 - A3 Cụm CN Phú Hoà - Thị Trấn  Phú Hoà - Huyện  Thoại Sơn - An Giang','1600903460','','','','empty@email.com',63,66,'ANMY',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(10,'CÔNG TY TNHH ĐẦU TƯ XÂY DỰNG THƯƠNG MẠI VÀ DỊCH VỤ VẬN TẢI AN THỊNH','Số 4 Chợ Lũng, P. Đằng Hải, Q. Hải An, Hải Phòng','201166855','','','','empty@email.com',63,66,'ANTHINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(11,'CÔNG TY TNHH NUÔI TRỒNG THUỶ SẢN APOLLO','3 - 1B Lô H14, Đường P, Khu Phố Mỹ Cảnh, Trung Tâm Đô Thị mới Nam Sài Gòn, Phường Tân Phong, Quận 7, TP HCM.','311506663','','','','empty@email.com',63,66,'APOLLO',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(12,'CÔNG TY TNHH THƯƠNG MẠI ARTREND ( VIỆT NAM )','357 / 31 / 25 Tân Hòa Đông, Phường Bình Trị Đông, Quận Bình Tân, TP HCM','311771767','','','','empty@email.com',63,66,'ARTREND',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(13,'CÔNG TY TNHH BA HÁT','Ấp 1A, Xã An Phú, Thị Xã Thuận An, Tỉnh Bình Dương','3700669948','','','','empty@email.com',63,66,'BA HAT',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(14,'CÔNG TY TNHH MTV TM VÀ DV VẬN TẢI BẮC BÌNH','24K/3B KP Bình Đáng, P. Bình Hòa, TX Thuận An, Bình Dương','3702151781',' 072 3503 999','072 3866 999','','empty@email.com',63,66,'BACBINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(15,'CÔNG TY TNHH SX - XK HÀNG TCMN & TM BẮC NINH','Xóm 8B, xã Cổ Nhuế, Huyện Từ Liêm, Hà Nội','100968940','','','','empty@email.com',63,66,'BACNINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(16,'CÔNG TY TNHH BÌNH AN','Đường 10, Thượng Thôn, Xã Yên Tiến, Huyện Ý Yên, Nam Định','600341315','','','','empty@email.com',63,66,'BINHAN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(17,'CÔNG TY TNHH KỸ NGHỆ BÌNH NGUYÊN','838 Bạch Đằng, Hai Bà Trưng, Hà Nội','101072089','','','','empty@email.com',63,66,'BINHNGUYEN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(18,'CÔNG TY CỔ PHẦN ĐẦU TƯ XÂY DỰNG BMT','36 Võ Văn Tần, Phường 6, Quận 3, Tp.HCM','301449021','','','','empty@email.com',63,66,'BMT',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(19,'CÔNG TY TNHH CÁNH ĐỎ','65 Lê Trung Nghĩa, Phường 15, Quận Tân Bình, Tp.HCM','309718163','','','','empty@email.com',63,66,'CANHDO',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(20,'CÔNG TY TNHH TRE NỨA CUỐN MỸ NGHỆ CÁT ĐẰNG','Yên Tiến, Ý Yên, Nam Định','600518587','','','','empty@email.com',63,66,'CATDANG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(21,'CÔNG TY CP ĐẦU TƯ VÀ SẢN XUẤT VIỆT CNC','số 16, Ngách 10/11 Hoàng Ngọc Phách, Đống Đa, Hà Nội','104071319','','','','empty@email.com',63,66,'CNC',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(22,'DNTN CÔNG BÌNH','Ấp Bình Hòa, Xã Bình Tịnh, Huyện Tân Trụ, Tỉnh Long An','1100745375','','','','empty@email.com',63,66,'CONGBINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(23,'CÔNG TY TNHH CÔNG NGHIỆP SẮT THÉP CONNEX-AIKO','Lô C-8D-CN, Khu Công Nghiệp Mỹ Phước 3, Huyện Bến Cát, Tỉnh Bình Dương','3700806270','','','','empty@email.com',63,66,'CONNEX',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(24,'CÔNG TY CỔ PHẦN CONTINENTIAL LOGISTICS','1/26 Thăng Long, Phường 4, Quận Tân Bình, TP.HCM','312153097','','','','empty@email.com',63,66,'CONTINENTIAL LOGISTICS',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(25,'CÔNG TY TNHH COSTAR VIỆT NAM','588/72 Tỉnh Lộ 10, P. Bình Trị Đông, Q. Bình Tân, Tp HCM.','311933545','','','','empty@email.com',63,66,'COSTAR',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(26,'CROWN VAN LINE','4-4FL, No. 165 Sec. 5, MIN SHENG E.RD, TAIPEI, TAIWAN','','','','','empty@email.com',63,66,'CROWN VAN LINE',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(27,'CÔNG TY TNHH CỬA ĐỎ','Số 212 Nguyễn Sơn, Phường Bồ Đề, Quận Long Biên, TP Hà Nội','101455557','','','','empty@email.com',63,66,'CUADO',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(28,'CÔNG TY TNHH MỘT THÀNH VIÊN DADU VIỆT NAM','Lô số 14-16-18-20, Đường số 3, KCN Tân Đức, Xã Đức Hòa Hạ, Huyện Đức Hòa, Tỉnh Long An','1101723536','','','','empty@email.com',63,66,'DADU',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(29,'CÔNG TY TNHH MTV TM-DV ĐÀI BẮC','Số 31, đường số 6, tổ 8, Ấp Bàu Sim, ã Tân Thông Hội, Huyện Củ Chi, TP HCM','308617099','','','','empty@email.com',63,66,'DAIBAC',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(30,'CÔNG TY CỔ PHẦN ĐẠI ĐỒNG TIẾN','216 Tân Thành, Phường 15, Quận 5, TP HCM.','304690411','','','','empty@email.com',63,66,'DAIDONGTIEN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(31,'CN CÔNG TY CỔ PHẦN CƠ KHÍ VẬN TẢI THƯƠNG MẠI ĐẠI HƯNG TẠI BÌNH DƯƠNG','Tổ 12, KP Ngãi Thắng, P. Bình Thắng, TX. Dĩ An, Tỉnh Bình Dương','0200426067-005','','','','empty@email.com',63,66,'DAIHUNG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(32,'CÔNG TY TNHH TM DV XUẤT NHẬP KHẨU ĐẠI KHANG','122/15/36 Bùi Tư Toàn, KP 4, P. An Lạc, Quận Bình Tân','312149608','','','','empty@email.com',63,66,'DAIKHANG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(33,'CÔNG TY TNHH ĐẠI TÂN','Khu A, Lô G.27C - 28 B, đường số 8, KCX Tân Thuận, P.Tân Thuận Đông, Quận 7, TP HCM','300757288','','','','empty@email.com',63,66,'DAITAN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(34,'CÔNG TY TNHH ĐẠI THÀNH','Ấp Đông Hòa, Xã Song Thuận, Huyện Châu Thành, Tỉnh Tiền Giang','1200631935','','','','empty@email.com',63,66,'DAITHANH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(35,'DOANH NGHIỆP TƯ NHÂN ĐẠI TUẤN','850/22 Đường 30/4, P. 11, Tp Vũng Tàu','3500671869','','','','empty@email.com',63,66,'DAITUAN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(36,'CÔNG TY TNHH MỘT THÀNH VIÊN ĐẠI TUẤN ĐỒNG','Số 2, Lô C1, làng chuyên gia Rubyland, Thị Trấn Mỹ Phước, huyện Bến Cát, Tỉnh Bình Dương.','3701944548','','','','empty@email.com',63,66,'DAITUANDONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(37,'CÔNG TY CỔ PHẦN ĐẠI TƯỜNG PHÁT','18 An Dương Vương, Phường 9, Quận 5, TP HCM','310524074','','','','empty@email.com',63,66,'DAITUONGPHAT',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(38,'CÔNG TY TNHH XUẤT KHẨU THỦ CÔNG MỸ NGHỆ ĐẠI VIỆT','Thôn Thái Hòa, Xã Bình Phú, Huyện Thạch Thất, TP Hà Nội','500465532','','','','empty@email.com',63,66,'DAIVIET',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(39,'CÔNG TY CỔ PHẦN ĐÁ LAM ĐỒNG','Lô DM1, KCN Lộc Sơn, Phường Lộc Sơn, Bảo lộc, Lâm Đồng','5800966560','','','','empty@email.com',63,66,'DALAMDONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(40,'CÔNG TY DÂY DẪN KIM LOẠI VIỆT NAM','Phước Thái, Long Thành, Đồng Nai','3600359477','','','','empty@email.com',63,66,'DAYDANKLVN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(41,'CÔNG TY TNHH ĐẾ LONG','3A/42 Ấp Bình Đức, Xã Bình Hòa, Huyện Thuận An, Bình Dương','3701711173','','','','empty@email.com',63,66,'DELONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(42,'CÔNG TY TNHH DEWX VIETNAM','Tầng 3, số 45 Trần Thái Tông, C3-D2 Khu đô thị mới Cầu Giấy, phường Dịch Vọng Hậu, quận Cầu Giấy, Tp Hà Nội','106098700','','','','empty@email.com',63,66,'DEWX',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(43,'CÔNG TY TNHH GIAO NHẬN DƯƠNG MINH TOÀN CẦU','127/137 Điện Biên Phủ, Phường Đa Kao, Quận 1, TP HCM','303645374','','','','empty@email.com',63,66,'DM TOANCAU',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(44,'DOANH NGHIỆP TƯ NHÂN THANH TUẤN','Thôn Đồi 3, Xã Đông Phương Yên, Huyện Chương Mỹ, Hà Nội','500444074','','','','empty@email.com',63,66,'DN THANHTUAN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(45,'CÔNG TY TNHH MÁY ĐO ĐẠC THÁI BÌNH DƯƠNG','213 Điện Biên Phủ, Phường 15, Quận Bình Thạnh, TP HCM','310708258','','','','empty@email.com',63,66,'?O ??C TBD',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(46,'CÔNG TY LIÊN DOANH ĐỒ GỖ QUỐC TẾ','14 -16- 18 Song Hành, KCN Tân Tạo, Quận Bình Tân, TP HCM','301892603','','','','empty@email.com',63,66,'DO GO QUOC TE',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(47,'CÔNG TY TNHH MỘT THÀNH VIÊN DOÃN NHẬT','208 Nguyễn Thị Minh Khai, KP 8, P.Phú  Hòa, TP Thủ Dầu Một, Tỉnh Bình Dương','3701792581','','','','empty@email.com',63,66,'DOANNHAT',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(48,'DNTN ĐÔ THÀNH','137A, Tân Bình, Tân Phú, Dĩ An, Bình Dương.','3700520401','','','','empty@email.com',63,66,'DOTHANH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(49,'CÔNG TY CỔ PHẦN ĐẦU TƯ CÁT ĐẰNG','Xóm Đông Thịnh, Thôn Cát Đằng, Xã Yên Tiến, Huyện Ý Yên, Tỉnh Nam Định','600355205','','','','empty@email.com',63,66,'?T CAT DANG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(50,'CÔNG TY TNHH XUẤT KHẨU HÀNG TCMN DUY THÀNH','Lô A5-5, A5-6 khu Đảo Xanh, P. Hòa Cường Bắc, Hải Châu, Đà Nẵng','400411879','','','','empty@email.com',63,66,'DUYTHANH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(51,'CÔNG TY CỔ PHẦN FECON MILTEC','Lô NX- D2, KCN Long Hậu, Xã Long Hậu, Huyện Cần Giuộc,  Long An','1101436813','','','','empty@email.com',63,66,'FECON MILTEC',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(52,'CÔNG TY CỔ PHẦN TIẾP VẬN FIAN','Phòng TH6, Lầu 3, Số 02 Phùng Khắc Khoan, P.Đa Kao, Quận 1, TP HCM','312353868','','','','empty@email.com',63,66,'FIAN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(53,'CÔNG TY TNHH CN FUSHENG VIỆT NAM','Số 6, đường 3A, Khu CN Biên Hòa II, Đồng Nai','3600259881','','','','empty@email.com',63,66,'FUSHENG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(54,'CÔNG TY TNHH GEA REFRIGERATION VIỆT NAM','3G Phổ Quang, Phường 2, Q. Tân Bình, Tp.HCM','305510654','','','','empty@email.com',63,66,'GEA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(55,'CÔNG TY TNHH THƯƠNG MẠI GIA BẢO KHANH','347 Bình Lợi , Phường 13, Quận Bình Thạnh, TP HCM','303846024','','','','empty@email.com',63,66,'GIA BAO KHANH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(56,'CÔNG TY TNHH GLOBE EXPRESS VIỆT NAM','P.102, Lấu 01, Số 43 Mạc Đĩnh Chi, Quân 1, TP HCM','304489600','','','','empty@email.com',63,66,'GLOBE EXPRESS',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(57,'CHI NHÁNH CÔNG TY CP GIAO NHẬN VẬN TẢI VÀ THƯƠNG MẠI','Tầng 6, Số 14 Láng Hạ, P. Thành Công, Q. Ba Đình, Hà Nội.','0301776205-001','','','','empty@email.com',63,66,'GNVT & TM-HN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(58,'CÔNG TY TNHH GIẢI PHÁP TÀI NĂNG','117B Nguyễn Đình Chính, P. 15, Q. Phú Nhuận, Tp HCM','308923843','','','','empty@email.com',63,66,'GP TAI NANG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(59,'CÔNG TY TNHH GRUNDFOS VIỆT NAM','Số 15, Đường 9B, Phường An Phú, Quận 2, Tp HCM','306557849','','','','empty@email.com',63,66,'GRUNDFOS VN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(60,'CÔNG TY TNHH HÓA CHẤT H & T','B45 lê Thị Hồng, Phường 17, Quận Gò Vấp, Tp.HCM','311234057','','','','empty@email.com',63,66,'H&T',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(61,'CHI NHÁNH DOANH NGHIỆP TƯ NHÂN HA SA','Số 20/23 Khu Phố Bình Phước A, Phường Bình Chuẩn, Thị Xã Thuận An, Tỉnh Bình Dương','0303237907-002','','','','empty@email.com',63,66,'HA SA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(62,'CÔNG TY TNHH THƯƠNG MẠI -DỊCH VỤ -VẬN TẢI HẢI TIẾN','59/29/1 Phạm Văn Chiêu, P. 14, Q. Gò Vấp, TP HCM','305988553','','','','empty@email.com',63,66,'HAI TIEN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(63,'CÔNG TY CP SẢN XUẤT - THƯƠNG MẠI XUẤT NHẬP KHẨU VỚ HẠNH TRANG','106/26 Tôn Thất Hiệp, Phường 13, Quận 11, Tp. Hồ Chí Minh','312969569','','','','empty@email.com',63,66,'HANHTRANG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(64,'CÔNGTY TNHH SX-TM HÁN THÀNH','288 đường Bình Long, P. Phú Thạnh, Q. Tân Phú, Tp.HCM','302383937','','','','empty@email.com',63,66,'HANTHANH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(65,'DOANH NGHIỆP TƯ NHÂN HIỀN UYÊN VI','22C/4 đường 672, P.Phước Long B, Quận 9, TP HCM','1200757053','','','','empty@email.com',63,66,'HIEN UYEN VI',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(66,'CÔNG TY TNHH KINH DOANH XNK HOÀNG BẢO','Số 06 Man Thiện, Phường Hoà Thuận Tây, Quận Hải Châu, Tp. Đà Nẵng','400441665','','','','empty@email.com',63,66,'HOANGBAO',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(67,'CÔNG TY TNHH KỸ THUẬT TỰ ĐỘNG HOÀNG TRANG','15A Nguyễn Trung Trực, P. 5, Q. Bình Thạnh, Tp HCM.','304992130','','','','empty@email.com',63,66,'HOANGTRANG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(68,'CÔNG TY TNHH XK MÂY TRE MỸ NGHỆ HỘI AN','454/4 Nguyễn Tri Phương, P.Hòa Thuận Tây, Q.Hải Châu, TP Đà Nẵng, Việt Nam','400437316','','','','empty@email.com',63,66,'HOIAN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(69,'CÔNG TY TNHH TMDV HOMY','144 Đường D1, Phường 25, Quận Bình Thạnh, Tp.HCM','310937064','','','','empty@email.com',63,66,'HOMY',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(70,'CÔNG TY TNHH HỐ NAI','Khu phố 8, phường Long Bình, Biên Hòa, Đồng Nai,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,','3600276005','','','','empty@email.com',63,66,'HONAI',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(71,'CÔNG TY TNHH XUẤT NHẬP KHẨU HỢP THÀNH','Đội 2 Thôn Ngọc Động, Huyện Duy Tiên, Tỉnh Hà Nam','700272880','','','','empty@email.com',63,66,'HOPTHANH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(72,'CÔNG TY TNHH ZENG HSING INDUSTRIAL','20A VSIP, Đường số 6, KCN VSIP, TX Thuận An, Tỉnh Bình Dương','3700619760','','','','empty@email.com',63,66,'HSING INDUSTRIAL',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(73,'CÔNG TY TNHH THỦ CÔNG MỸ NGHỆ HT','189 Thôn 6, Song Phương, Hoài Đức, Hà Nội.','105384120','','','','empty@email.com',63,66,'HT',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(74,'CÔNG TY TNHH TM DV VÀ VẬN TẢI HTC VN','Số 7/9 Khu Phố 1, P Trung Mỹ Tây, Quận 12, TP HCM','312279276','','','','empty@email.com',63,66,'HTC VN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(75,'CÔNG TY CỔ PHẦN HUỆ MINH','Phòng 908 - Tòa nhà 17T7 khu đô thị Trung Hòa, Nhân Chính, Thanh Xuân, Hà Nội','101269631','','','','empty@email.com',63,66,'HUEMINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(76,'CÔNG TY TNHH HÙNG CÁ','Cụm CN Thanh Bình, Ấp Bình Chánh, Xã Bình Thành, Huyện Thanh Bình, Tỉnh Đồng Tháp.','1400528082','','','','empty@email.com',63,66,'HUNGCA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(77,'CÔNG TY TNHH SƠN MÀI HÙNG HÀ','thôn Phúc An, xã Duyên Thái, huyện Thường Tín, Tp. Hà Nội','105221750','','','','empty@email.com',63,66,'HUNGHA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(78,'CÔNG TY TNHH GIAO NHẬN HƯNG LONG THỊNH','442/4/3/14D Nguyễn Thái Sơn, Phường 5, Quận Gò Vấp, TP HCM','312973607','','','','empty@email.com',63,66,'HUNGLONGTHINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(79,'CÔNG TY TNHH XNK VIỆT NAM HÙNG THÁI','931 Quốc lộ 1A, P. An Phú Đông, Quận 12, Tp.HCM','310473616','','','','empty@email.com',63,66,'HUNGTHAI',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(80,'INFORUS VIETNAM CO.,LTD','12 Mạc Đỉnh Chi, P. Đa Kao, Quận 1, Tp.HCM','304842657','','','','empty@email.com',63,66,'INFORUS',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(81,'ISHIDA CO., LTD - VN REPRESENTATIVE OFFICE','SA1-1 Mỹ Khang Complex, Phú Mỹ Hưng, P. Tân Phú, Quận 7, Tp.HCM','','','','','empty@email.com',63,66,'ISHIDA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(82,'CÔNG TY TNHH ISHIDA VIỆT NAM','R4 - 51 Hưng Phước 4, Phường Tân Phong, Quận 7, TP HCM','311764939','','','','empty@email.com',63,66,'ISHIDA VN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(83,'CÔNG TY TNHH DỊCH VỤ HÀNG HẢI JARDINE(VIỆT NAM)','Phòng 304, Lầu 3, Số 2 Bis 4-6 Lê Thánh Tôn, Phường Bến Nghé, Quận 1, TP HCM','304147893','','','','empty@email.com',63,66,'JARDINE',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(84,'CÔNG TY CP CÔNG NGHIỆP JK VIỆT NAM','Thôn Đồng Du, Xã Hợp Đồng, Huyện Chương Mỹ, TP Hà Nội','500556620','','','','empty@email.com',63,66,'JK VN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(85,'CÔNG TY TNHH MTV JORDAN MANUFACTURING VIỆT NAM','Lô IV, 16A-16B, Nhóm Công Nghiệp IV, KCN Tân Bình, P.Tây Thạnh, Q.Tân Phú, TP HCM','309621179','','','','empty@email.com',63,66,'JORDAN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(86,'CÔNG TY TNHH TM - DV KIM ÁNH','157/1 khu phố Long Thới, P.Lái Thiêu, TX. Thuận An, Bình Dương','3701636381','','','','empty@email.com',63,66,'KIMANH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(87,'CÔNG TY TNHH THƯƠNG MẠI MÁY MÓC THIẾT BỊ KIM CƯƠNG','158/1 Hoàng Hoa Thám, Phường 12, Quận Tân Bình, Tp HCM','310762079','','','','empty@email.com',63,66,'KIMCUONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(88,'CÔNG TY TNHH TMDV KIM ĐẠI HẢI','62 Đường số 8, Bình Trị Đông B, Quận Bình Tân, TP HCM','303357961','','','','empty@email.com',63,66,'KIMDAIHAI',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(89,'CÔNG TY TNHH CÔNG NGHIỆP KING TAI','Đường 7A, KCN Nhơn Trạch 2, Huyện Nhơn Trạch, Tỉnh Đồng Nai.','3600938788','','','','empty@email.com',63,66,'KING TAI',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(90,'CÔNG TY TNHH VẬN TẢI QUỐC TẾ KẾT NỐI THÔNG MINH','51 Đường số 9, Khu dân cư Him Lam, Phường Tân Hưng, Quận 7, TP HCM','310383930','','','','empty@email.com',63,66,'KN THONGMINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(91,'KOREA GLS, INC','1F JIN BLDG., YANGJAE-DONG, SEOCHO-GU, SEOUL 137-30, KOREA','','','','','empty@email.com',63,66,'KOREA GLS',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(92,'CÔNG TY CP TIN HỌC LẠC TIÊN','43 Vĩnh Nam, Phường 1, Quận 8, Tp.HCM','306261785','','','','empty@email.com',63,66,'LACTIEN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(93,'CÔNG TY CP THƯƠNG MẠI LA GIANG','16 Trương Định, Phường 6, Quận 3, Tp.HCM','301415417','','','','empty@email.com',63,66,'LAGIANG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(94,'CÔNG TY TNHH LÂM CHÂU HÀ','18 Đường số 1, Tổ 1, KP 3, P. Phước Long A, Q. 9, TP HCM.','304252739','','','','empty@email.com',63,66,'LAMCHAUHA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(95,'CÔNG TY TNHH MỸ NGHỆ LÂM SƠN','Thôn Cát Đằng, Xã Yên Tiến, Hyện Ý Yên, Tỉnh Nam Định','600955072','','','','empty@email.com',63,66,'LAMSON',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(96,'CÔNG TY TNHH MÁY CÔNG CỤ LIÊN MINH','50/2 Khu Phố 4, Nguyễn Văn Quá, P. Đông Hưng Thuận, Q. 12, TP HCM.','304542205','','','','empty@email.com',63,66,'LIENMINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(97,'CÔNG TY TNHH TM - DV QUỐC TẾ LIÊN THẮNG','38/27 Chế Lan Viên, Phường Tây Thạnh, Quận Tân Phú, TP HCM','310731539','','','','empty@email.com',63,66,'LIENTHANG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(98,'CÔNG TY TNHH LIÊN TRUNG','Số 397B/A2, Ấp Nhị Hòa, Xã Hiệp Hòa, TP Biên Hòa, Đồng Nai','3600975211','','','','empty@email.com',63,66,'LIENTRUNG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(99,'CÔNG TY CỔ PHẦN LP VIỆT NAM','Cổ Nhuế, Từ Liêm, Hà Nội','102987730','','','','empty@email.com',63,66,'LP VIETNAM',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(100,'CÔNG TY TNHH LUCKY STAR PLAST','Số 5, đường số 15A, KCN Biên Hòa 2, Đồng Nai','3600262362','','','','empty@email.com',63,66,'LUCKY STAR',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(101,'CÔNG TY TNHH MAI CO','216/5 Khu Phố 4, Phường An Phú, Thị Xã Thuận An, Tỉnh Bình Dương.','3700308324','','','','empty@email.com',63,66,'MAICO',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(102,'CÔNG TY TNHH THƯƠNG MẠI SẢN XUẤT BAO BÌ MAI THƯ','24 Trương Quốc Dung, Phường 8, Quận Phú Nhuận, TP HCM','302177349','','','','empty@email.com',63,66,'MAITHU',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(103,'CÔNG TY TNHH MẦM XANH VIỆT','198/39 Thoại Ngọc Hầu, Phường Phú Thạnh, Quận Tân Phú, TP HCM.','311615888','','','','empty@email.com',63,66,'MAMXANHVIET',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(104,'CÔNG TY TNHH GỐM MẠNH DẦN','89B Giang Cao, Bát Tràng, Gia Lâm, Hà Nội','102816799','','','','empty@email.com',63,66,'MANHDAN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(105,'VPĐD MAREL FOOD SYSTEMS LTD. TẠI TP.HCM','10 Hưng Phước 3, Tân Phong, Quận 7','304670535','','','','empty@email.com',63,66,'MAREL FOOD',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(106,'CÔNG TY TNHH MARINE FARMS ASA VIỆT NAM','31 Đặng Tất - Nha Trang - Khánh Hoà','4200538297','','','','empty@email.com',63,66,'MARINE FARMS',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(107,'CÔNG TY TNHH HÙNG VƯƠNG MASCATO','Lô 41-42 Khu Công Nghiệp Mỹ Tho, Tiền Giang','1201283261','','','','empty@email.com',63,66,'MASCATO',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(108,'CÔNG TY TNHH MÂY TRE ĐAN PHÚC THỊNH','Thôn Lưu Thượng, Xã Phú Túc, Huyện Phú Xuyên, TP Hà Nội','105484830','','','','empty@email.com',63,66,'MAYTRE PHUCTHINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(109,'CÔNG TY TNHH MÂY TRE THÀNH PHÁT','Thôn Yên Trường, Xã Trường Yên, Huyện Chương Mỹ, Hà Nội','104826915','','','','empty@email.com',63,66,'MAYTRE THANHPHAT',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(110,'CÔNG TY CỔ PHẦN HÀNG HẢI MERMAID VIỆT NAM','Đường 12, Khu Công Nghiệp Đông Xuyên , Phường Rạch Dừa, Thành Phố  Vũng Tàu, Tỉnh Bà Rịa Vũng Tàu.','3500674108','','','','empty@email.com',63,66,'MERMAID',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(111,'CÔNG TY TNHH CƠ KHÍ CHÍNH XÁC MIEN HUA','KM 1954, QL 1A, Phường Tân Khánh, Thành Phố Tân An, Tỉnh Long An','1100499578','','','','empty@email.com',63,66,'MIENHUA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(112,'CÔNG TY TNHH THƯƠNG MẠI MIỀN NAM','235 Cộng Hoà - P. 13 - Q. Tân Bình - TP HCM','304787893','','','','empty@email.com',63,66,'MIENNAM',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(113,'CÔNG TY CP ĐẦU TƯ VÀ PHÁT TRIỂN VIỄN THÔNG MIỀN TÂY','40 Hoàng Việt, Phường 4, Quận Tân Bình, Tp.HCM','304405664','','','','empty@email.com',63,66,'MIENTAY',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(114,'CÔNG TY TNHH VẬN TẢI MINH AN','153/14 Điện Biên Phủ, Phường 15, Quận Bình Thạnh, TP HCM','310030903','','','','empty@email.com',63,66,'MINH AN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(115,'CÔNG TY TNHH VẬN TẢI QUỐC TẾ MINH LONG','36L Đường Miếu Nổi , KDC Miếu Nổi , P. 3, Q. Bình Thạnh, TP HCM.','305247964','','','','empty@email.com',63,66,'MINH LONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(116,'CÔNG TY TNHH QUỐC TẾ MINH ANH','36 Trần Văn Quang, Phường 10, Quận Tân Bình, Tp. HCM','304525979','','','','empty@email.com',63,66,'MINHANH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(117,'DOANH NGHIỆP TƯ NHÂN MINH DŨNG','1A, khu phố Trung Lương, Phướng 10, Tp. Mỹ Tho, tỉnh Tiền Giang','1200328262','','','','empty@email.com',63,66,'MINHDUNG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(118,'CÔNG TY TNHH XUẤT NHẬP KHẨU MINH HẢI','Cụm tiểu thủ CN Kim Bình, Kim Bằng, Hà Nam','700253091','','','','empty@email.com',63,66,'MINHHAI',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(119,'CÔNG TY TNHH TM DV VẬN TẢI MINH HƯNG','31/19 Hoàng Hoa Thám, Phường 13, Quận Tân Bình, Tp HCM','312330684','','','','empty@email.com',63,66,'MINHHUNG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(120,'CÔNG TY TNHH MINH KÔN','Thôn Trung, Xã Chuyên Mỹ, Huyện Phú Xuyên, Hà Nội','104349765','','','','empty@email.com',63,66,'MINHKON',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(121,'CÔNG TY CỔ PHẦN THƯƠNG MẠI MINH THỊNH','số 47A/358 Đoạn Xá 1, P. Đông Hải 1, Q. Hải An, Tp. Hải Phòng','200830960','','','','empty@email.com',63,66,'MINHTHINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(122,'CÔNG TY TNHH MKP SHIPPING','52 Đường 239, Cư Xá Bùi Minh Trực, Phường 5, Quận 8, TP HCM','312122116','','','','empty@email.com',63,66,'MKP',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(123,'CÔNG TY CỔ PHẦN MỸ NGHỆ THÀNH NAM','Đường 10, Yên Tiến, Ý Yên, Nam Định','600802284','','','','empty@email.com',63,66,'MN THANHNAM',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(124,'CÔNG TY TNHH THƯƠNG MẠI & DỊCH VỤ MND','2 Ngô Đức Kế, Phường Bến Nghé, Quận 1, TP HCM','310348277','','','','empty@email.com',63,66,'MND',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(125,'CÔNG TY CP TẬP ĐOÀN MUỐI MIỀN NAM','173 Hai Bà Trưng, Phường 6, Quận 3, Tp.HCM','300547185','','','','empty@email.com',63,66,'MUOIMIENNAM',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(126,'CHI NHÁNH CÔNG TY CỔ PHẦN QUANG & MỸ NGHỆ XUẤT KHẨU','Mạo Khê, Đông Triều, Quảng Ninh','0101157889-001','','','','empty@email.com',63,66,'MYNGHEXK',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(127,'CÔNG TY TNH SX & XK HÀNG TCMN MỸ THÁI','Thôn Hạ Thái, xã Duyên Thái, H. Thường Tín, Hà Nội','500467307','','','','empty@email.com',63,66,'MYTHAI',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(128,'CÔNG TY TNHH NĂM HAI NĂM','Số 12, Đường DC 7, Phường Sơn Kỳ, Quận Tân Phú, TP HCM','304943567','','','','empty@email.com',63,66,'NAMHAINAM',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(129,'CÔNG TY TNHH KỸ THUẬT NAM PHONG','910 Lầu 9, 4/9/32 Hoàng Long Building, P. Nhi Đồng, Dĩ An, Bình Dương','3700769685','','','','empty@email.com',63,66,'NAMPHONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(130,'CÔNG TY TNHH NHỰA NAM VIỆT','Đường 2A/1 Khu Công Nghiệp Đồng An, Thuận An, Bình Dương','3700263962','','','','empty@email.com',63,66,'NAMVIET-BD',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(131,'CÔNG TY TNHH THƯƠNG MẠI DỊCH VỤ KỸ THUẬT NĂNG LƯỢNG SẠCH','91/1B Nguyễn Ảnh Thủ, Ấp Tây Lân, Xã Bà Điểm, Huyện Hóc Môn, Tp HCM','306274417','','','','empty@email.com',63,66,'NANGLUONGSACH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(132,'CÔNG TY TNHH TM - DV NGHỊ TÍN','61 Tạ Uyên, Phường 15, Quận 5, TP HCM','303381160','','','','empty@email.com',63,66,'NGHITIN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(133,'CÔNG TY TNHH CHẾ BIẾN THỰC PHẨM THƯƠNG MẠI NGỌC HÀ','Ấp Hội, Xã Kim Sơn, Huyện Châu Thành, Tỉnh Tiền Giang','1200536671','','','','empty@email.com',63,66,'NGOCHA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(134,'CÔNG TY TNHH VẬN TẢI NGUYÊN THÀNH','63A An Phú Đông 27, Phường An Phú Đông, Quận 12, Tp.HCM','310369446','','','','empty@email.com',63,66,'NGUYENTHANH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(135,'CÔNG TY TNHH XUẤT NHẬP KHẨU NGUYỄN XUÂN','42 Ngõ 158, Tổ 25, Phường Ngọc Hà, Q.Ba Đình, TP Hà Nội','105043681','','','','empty@email.com',63,66,'NGUYENXUAN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(136,'CÔNG TY CỔ PHẦN ĐẦU TƯ NHÀ BÈ','Khu phố 3, Bến Nghé, Phường Tân Thuận Đông, Quận 7, TP HCM','3700574051','','','','empty@email.com',63,66,'NHABE',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(137,'CÔNG TY TNHH DỊCH VỤ - THƯƠNG MẠI NHẬT CƯỜNG','352 Trần Văn Kiểu, Phường 11, Quận 6, TP HCM','302560181','','','','empty@email.com',63,66,'NHATCUONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(138,'CÔNG TY CP GIẢI PHÁP CÔNG NGHỆ MÔI TRƯỜNG NHẤT TINH','17/12N, Phan Huy Ích, P.12, Q.Gò Vấp, TP HCM','306885800','','','','empty@email.com',63,66,'NHATTINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(139,'CÔNG TY TNHH CÔNG NGHỆ GỐM SỨ OHIO','Khu Công Nghiệp Tiền Hải, Xã Đông Cơ, Huyện Tiền Hải, Tỉnh Thái Bình','1000317753','','','','empty@email.com',63,66,'OHIO',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(140,'CÔNG TY TNHH OKAMURA VIỆT NAM','Số 111D Lý Chính Thắng, Phường 7, Quận 3, TP HCM','312503707','','','','empty@email.com',63,66,'OKAMURA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(141,'CÔNG TY TNHH THỰC PHẨM ORION VINA','Khu Công Nghiệp Mỹ Phước 2, Huyện Bến Cát, Tỉnh Bình Dương','3700667933','','','','empty@email.com',63,66,'ORION VINA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(142,'CÔNG TY TNHH NHÀ THÉP PEB','Khu công nghiệp Đông Xuyên, Phường Rạch Dừa, Thành phố Vũng Tàu, Tỉnh Bà Rịa - Vũng Tàu.','3500684522','(08) 3933 0148','','','empty@email.com',63,66,'PEB',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(143,'CÔNG TY TNHH PENTAX VIỆT NAM','Số 76 Ngõ Vạn Ứng, Đường Khâm Thiên, Phường Trung Phụng, Quận Đống đa, Hà Nội','106402534','','','','empty@email.com',63,66,'PENTAX VN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(144,'CÔNG TY TNHH TM PHONG CÁCH SỐNG','16A Đường 5A, Khu Đô Thị Mới An Phú - An Khánh, Phường An Phú, Quận 2, TP HCM','3602447270','','','','empty@email.com',63,66,'PHONGCACHSONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(145,'CÔNG TY TNHH THƯƠNG MẠI PHÚ BANG','134/2B Thành Thái, Phường 12, Quận 10, TP HCM','303384429','','','','empty@email.com',63,66,'PHUBANG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(146,'CÔNG TY TNHH THƯƠNG MẠI - DỊCH VỤ PHÚ ĐẠI LỢI','114/2 Yên Thế, Phường 2, Quận Tân Bình, Tp.HCM','303241170','','','','empty@email.com',63,66,'PHUDAILOI',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(147,'CÔNG TY TNHH TM - XNK PHÚ LỘC TRƯỜNG','D2/483, Ấp 4, Xã Bình Lợi, Huyện Bình Chánh, TP HCM','309311138','','','','empty@email.com',63,66,'PHULOCTRUONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(148,'DNTN XĂNG DẦU PHƯỚC THẠNH','Ấp Mây Đắng, Xã Phước Thạnh, Huyện Củ Chi, TP HCM','301446503','','','','empty@email.com',63,66,'PHUOC THANH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(149,'CÔNG TY TNHH CẢNG PHƯỚC LONG','Lầu 19, Germadept Tower, 2Bis-4-6 Lê Thánh Tôn, Phường Bến Nghé, Quận 1, Tp.HCM','304791385','','','','empty@email.com',63,66,'PHUOCLONGICD',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(150,'CÔNG TY TNHH TM & DV GIAO NHẬN VẬN TẢI PHƯƠNG NHUNG','193/2D Bùi Thị Xuân, Phường 1, Quận Tân Bình, TP HCM','312347198','','','','empty@email.com',63,66,'PHUONG NHUNG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(151,'CÔNG TY TNHH THUỶ SẢN PHƯƠNG ĐÔNG','Lô 17D, Đường số 5, KCN Trà Nóc, Q. Bình Thuỷ, TP Cần Thơ.','1800405254','','','','empty@email.com',63,66,'PHUONGDONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(152,'CÔNG TY TNHH MTV THÉP PHÚ THẮNG','Ấp 4, xã Hiệp Phước, Huyện Nhơn Trạch, Đồng Nai','3602153753','','','','empty@email.com',63,66,'PHUTHANG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(153,'CÔNG TY CP PIN ẮC QUY MIỀN NAM','321 Trần Hưng Đạo, Quận 1, TP HCM','300405462','','','','empty@email.com',63,66,'PIN ACQUY',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(154,'CÔNG TY TNHH PLG VIỆT NAM','P.701, Lầu 7, Tòa nhà Hà Phan, Số 5 Phan Xích Long, Phường 2, Quận Phú Nhuận,Tp HCM','312103963','','','','empty@email.com',63,66,'PLG VIETNAM',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(155,'CÔNG TY CỔ PHẦN TƯ VẤN ĐẦU TƯ QUỐC TẾ PROMANA','193-203 Trần Hưng Đạo, Phường Cô Giang, Quận 1, Tp HCM','305479309','','','','empty@email.com',63,66,'PROMANA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(156,'CÔNG TY TNHH QST VIỆT NAM','Đơn vị 3A, Tòa nhà Xưởng Tiêu Chuấn, Đường 14, KCX Tân Thuận, Q.7, TP HCM','310854675','','','','empty@email.com',63,66,'QST',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(157,'CÔNG TY TNHH QUỐC TẾ Z.C (VIỆT NAM)','Khu C, Lô S, Đường 19, KCX Tân Thuận, Phường Tân Thuận Đông, Quận 7, TP HCM','300761728','','','','empty@email.com',63,66,'QT Z.C',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(158,'CÔNG TY CP GIAO NHẬN TIẾP VẬN QUỐC TẾ','Tầng 5, Tòa nhà cảng Sài Gòn, 03 Nguyễn tất Thành, P.12, Quận 4, Tp.HCM','303957341','','','','empty@email.com',63,66,'QUOCTE',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(159,'CÔNG TY TNHH RINNAI VIỆT NAM','Đường số 2, KCN Đồng An, Thuận An,  Bình Dương','3700300974','','','','empty@email.com',63,66,'RINNAI',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(160,'CÔNG TY TNHH TM VẬT LIỆU MÁY IN SANXIN','Tầng trệt và Lầu 1, 21 Công Trường An Đông, P. 9, Q. 5, Tp HCM','305445821','','','','empty@email.com',63,66,'SANXIN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(161,'CÔNG TY CỔ PHẦN SAO Á','Số 5 Lý Tự Trọng, P. Minh Khai, Q. Hồng Bàng, TP Hải Phòng','200504188','','','','empty@email.com',63,66,'SAOA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(162,'CÔNG TY TNHH SATO-SANGYO VIỆT NAM','37 Đường số 6, KCN VSIP, Huyện Thuận An, tỉnh Bình Dương','3700635868','','','','empty@email.com',63,66,'SATO-SANGYO',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(163,'CÔNG TY TNHH SCG TRADING VIỆT NAM','117 - 119 Lý Chính Thắng, Phường 7, Quận 3, Tp.HCM','304189477','','','','empty@email.com',63,66,'SCG-TRADING',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(164,'CÔNG TY TNHH SX - TM SÀI GÒN RIVER VIỆT NAM','0589/E Hóa Nhựt, Tân Vĩnh Hiệp, Tân Uyên, Bình Dương','3700579483','','','','empty@email.com',63,66,'SG RIVER VN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(165,'CÔNG TY TNHH SHOWA VALVE VIỆT NAM','KCN Tân Trường, Huyện Cẩm Giàng, Tỉnh Hải Dương','801040780','','','','empty@email.com',63,66,'SHOWA VALVE VN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(166,'CÔNG TY TNHH DỊCH VỤ GIAO NHẬN VẬN CHUYỂN - THƯƠNG MẠI SIÊU KỶ','4/9C Nguyễn Thị Minh Khai, P. Đa Kao, Q. 1, TP HCM.','305327754','','','','empty@email.com',63,66,'SIEUKY',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(167,'CÔNG TY CỔ PHẦN SINH LỘC PHÁT','11B3 Hà Huy Giáp, Khu Biệt Thự Thạnh Xuân, P.Thạnh Xuân, Quận 12, TP HCM','309708870','','','','empty@email.com',63,66,'SINHLOCPHAT',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(168,'CÔNG TY TNHH TM VÀ DV SONG MÃ','Số 229 Km 87 - Quốc Lộ 5 mới, Nam Sơn, An Dương, Hải Phòng','200689958','','','','empty@email.com',63,66,'SONGMA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(169,'CÔNG TY TNHH TM& DV KT SONG PHƯƠNG MINH','45/10 Liên khu 16-18 Bình Trị Đông, Bình Tân, Tp.HCM','304122842','','','','empty@email.com',63,66,'SONGPHUONGMINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(170,'CÔNG TY TNHH THẾ GIỚI SƠN MÀI','788 La Thành, Phường Giảng Võ, Quận Ba Đình, Tp Hà Nội, Việt Nam','101058101','','','','empty@email.com',63,66,'SONMAI',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(171,'CÔNG TY TNHH NỘI THẤT - SƠN MÀI VIỆT','Thôn Bối Khê, Xã Chuyên Mỹ, Huyện Phú xuyên, Hà Nội','104191976','','','','empty@email.com',63,66,'SONMAI VIET',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(172,'CÔNG TY TNHH SURINT OMYA VIỆT NAM','khu công nghiệp Gò dầu, Long Thành, Đồng Nai','3600749484','','','','empty@email.com',63,66,'SURINT',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(173,'CÔNG TY TNHH GIAO NHẬN T.A.C','2A Nguyễn Thị Minh Khai, P. Đa Kao, Quận 1, Tp.HCM','310273423','','','','empty@email.com',63,66,'TAC',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(174,'CÔNG TY CỔ PHẦN Á CHÂU TÀI NGUYÊN','37 Hoàng Văn Thụ, P. 15, Q. Phú Nhuận,Tp.HCM','302749620','','','','empty@email.com',63,66,'TAINGUYEN  ',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(175,'CÔNG TY ĐIỆN VÀ ĐIỆN TỬ TCL (VIỆT NAM)','Phường Tân Biên, Thành phố Biên Hòa, Tỉnh Đồng Nai','3600243296','','','','empty@email.com',63,66,'TCL',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(176,'CÔNG TY CỔ PHẦN THÁI LINH','Hạ Thái, Duyên Thái, Thường Tín, Hà Nội','500467025','','','','empty@email.com',63,66,'THAILINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(177,'CÔNG TY CP SẢN XUẤT VÀ XUẤT KHẨU MỸ NGHỆ THĂNG LONG','D14-TT14 Khu Đô Thị Văn Quán, Phường Văn Quán, Quận Hà Đông, Hà Nội','104164771','','','','empty@email.com',63,66,'TH?NG LONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(178,'CÔNG TY TNHH VẬN TẢI BIỂN THẮNG LỢI','37 Hoàng Diệu, Phường 12, Quận Tân Bình, Tp.HCM','304777581','','','','empty@email.com',63,66,'THANGLOI',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(179,'CÔNG TY TNHH MTV PKĐK THANH QUAN','54 Nguyễn Thiện Thuật, Phường 2, Quận 3, Tp.HCM','309201826','','','','empty@email.com',63,66,'THANH QUANG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(180,'CÔNG TY TNHH THƯƠNG MẠI DỊCH VỤ THÀNH TUẤN','1444 Hoàng Văn Thụ, Phường 4, Quận Tân Bình, TP HCM','304223311','','','','empty@email.com',63,66,'THANH TUAN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(181,'DNTN THÀNH ĐÔ','137C, Khu B, Tân Thắng, Tân Bình, Dĩ An, Bình Dương.','3700598687','','','','empty@email.com',63,66,'THANHDO',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(182,'CÔNG TY CỔ PHẦN THÀNH ĐỒNG ','Bình Dương, Đông Triều, Quảng Ninh','5700428488','','','','empty@email.com',63,66,'THANHDONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(183,'CÔNG TY TNHH THIẾT KẾ QUẬN TÁM','343-345 Bến Bình Đông, P. 11, Q. 8, TP HCM','310502722','','','','empty@email.com',63,66,'THIETKE Q8',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(184,'CÔNG TY TNHH DỊCH VỤ HÀNG HÓA THÔNG MINH','Phòng 203, Lầu 2, Tòa nhà Thăng Long, Số 6 Thăng Long, Phường 4, Quận Tân Bình, Tp HCM','304980801','','','','empty@email.com',63,66,'THONGMINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(185,'CÔNG TY TNHH XE Ô TÔ THUẬN PHONG PHÁT','261 Tùng Thiện Vương, Phường 11, Quận 8, TP HCM','312367934','','','','empty@email.com',63,66,'THUAN PHONG PHAT',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(186,'CÔNG TY TNHH TM TÍCH LŨY','131/6 Thích Quảng Đức, Phường 4, Q. Phú Nhuận, Tp.HCM','302911538','','','','empty@email.com',63,66,'TICHLUY',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(187,'CÔNG TY CỔ PHẦN QUỐC TẾ TICO','Số 1, ngách 165/53 Đường Cầu Giấy, Phường Dịch Vọng, Quận Cầu Giấy, TP.Hà Nội','105837677','','','','empty@email.com',63,66,'TICO',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(188,'CHI NHÁNH CÔNG TY CỔ PHẦN QUỐC TẾ TICO tại HẢI PHÒNG','Số 3 Lê Thánh Tông, Phường Máy Tơ, Quận Ngô Quyền, TP Hải Phòng','0105837677-001','','','','empty@email.com',63,66,'TICO HAI PHONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(189,'CÔNG TY TNHH VẬN TẢI BIỂN TÍN NGHĨA','386-388 Hoàng Diệu, Phường 5, Quận 4, Tp.HCM','302783692','','','','empty@email.com',63,66,'TINNGHIA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(190,'CÔNG TY TNHH MTV THƯƠNG MẠI DỊCH VỤ MỸ NGHỆ TRẦM HƯƠNG BA TRUNG PHƯỚC','17/22 Gò Dầu, Phường Tân Quý, Quận Tân Phú, TP HCM','309455235','','','','empty@email.com',63,66,'TRAMHUONGBA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(191,'CÔNG TY CỔ PHẦN TRUNG ĐÔNG','Cụm Công Nghiệp Tam Phước 1, Xã Tam Phước, TP Biên Hòa, Tỉnh Đồng Nai','3600669165','','','','empty@email.com',63,66,'TRUNGDONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(192,'CÔNG TY TNHH THƯƠNG MẠI VÀ KỸ THUẬT TRƯƠNG NGUYỆT','319-A7 Lý Thường Kiệt, Phường 15, Quận 11, TP HCM','303716385','','','','empty@email.com',63,66,'TRUONGNGUYET',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(193,'TRUNG TÂM KHUYẾN CÔNG VÀ TƯ VẤN PHÁT TRIỂN CÔNG NGHIỆP','176 Quang Trung, Hà Đông, Hà Nội','500472956','','','','empty@email.com',63,66,'TT KC & TV PT CN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(194,'TRUNG TÂM SÁCH PHÁP LUẬT TÀI CHÍNH','51/18F Chu Văn An, Phường 12, Quận Bình Thạnh, TP HCM','307997680','','','','empty@email.com',63,66,'TT SACH PLTC',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(195,'CÔNG TY CỔ PHẦN VẬN TẢI QUỐC TẾ TIẾN TỚI THÀNH CÔNG','Phòng 65, tầng 3, 49 Hoàng Văn Thụ, Phường 15, Quận Phú Nhuận, TP HCM','310526272','','','','empty@email.com',63,66,'TT THANHCONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(196,'CÔNG TY TNHH TM-DV TUẤN HIỆP','96/18 hẻm 96, KP4, Đường Tây Hòa, P. Phước Long A, Quận 9, Tp.HCM','303848180','','','','empty@email.com',63,66,'TUANHIEP',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(197,'CÔNG TY TNHH MỘT THÀNH VIÊN TUẤN MÃ','38 Đường số 14B, P.Bình Hưng Hòa A, Q.Bình Tân, TP HCM','305124578','','','','empty@email.com',63,66,'TUANMA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(198,'CÔNG TY TNHH CHẾ BIẾN THỦY HẢI SẢN VÀ NƯỚC ĐÁ TUNG KONG','KCN Nhơn Trạch 3, Nhơn Trạch, Đồng Nai','3600602273','','','','empty@email.com',63,66,'TUNGKONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(199,'CÔNG TY CP XNK NAM HÀ - UDOMXAY','số 5, Hàng Tiện, Tp. Nam Định, Nam Định','600159842','','','','empty@email.com',63,66,'UDOMXAY',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(200,'CÔNG TY TNHH U-HOUSE ENTERPRISE','Lô B7, Khu Công Nghiệp Đại Đăng, TP Thủ Dầu Một, Tỉnh Bình Dương','3700776516','','','','empty@email.com',63,66,'U-HOUSE ENTERPRISE',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(201,'TRUNG TÂM ĐÀO TẠO VÀ XÚC TIẾN THƯƠNG MẠI VASEP','Số 10, Nguyễn Công Hoan, Quận Ba Đình, Hà Nội','102322542','','','','empty@email.com',63,66,'VASEP',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(202,'CÔNG TY CP VẬT LIỆU TỰ DÍNH VIỆT NAM','Lô 2/10 KCN Phan Thiết, Tp. Phan Thiết, tỉnh Bình Thuận, Việt Nam','3400446309','','','','empty@email.com',63,66,'VATLIEUVN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(203,'CÔNG TY TNHH THƯƠNG MẠI VẬT TƯ KHOA HỌC KỸ THUẬT','12 Hàng Đường, Hoàn Kiếm, Hà Nội','100236496','','','','empty@email.com',63,66,'VATTUKHKT',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(204,'CÔNG TY TNHH ĐẦU TƯ ỨNG DỤNG SẢN XUẤT BAO BÌ VIỆT','Đường D1, KCN Phố Nối A, Xã Giai Phạm, Huyện Yên Mỹ, Tỉnh Hưng Yên','900254328','','','','empty@email.com',63,66,'VENUS PLASTIC',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(205,'VPĐD CTY VEOLIA WATER SYSTEMS SOUTH ASIA SDN . , BHD','Phòng 9.2B Lầu 9, Toà Nhà ETOWN 1, 364 Cộng Hoà, Phường 13, Quận Tân Bình, TP HCM','304644334','','','','empty@email.com',63,66,'VEOLIA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(206,'VIỆN LOGISTIC VIỆT NAM','Số 5, Nguyễn Gia Thiều, P. 6, Q. 3, TP HCM','305524329','','','','empty@email.com',63,66,'VIEN LOGISTIC',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(207,'CÔNG TY CP PHÁT TRIỂN HÀNG HẢI VIỄN ĐÔNG','84/4 Tôn Thất Thuyết, Phường 16, Quận 4, Tp.HCM','310693481','','','','empty@email.com',63,66,'VIENDONG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(208,'CÔNG TY TNHH VIỄN TÂY','121 Yersin, Phường Phạm Ngũ Lão, Quận 1, TP HCM','303941736','','','','empty@email.com',63,66,'VIENTAY',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(209,'CÔNG TY  TNHH VIÊN THÀNH','123 Lê Lợi, Phường Bến Nghé, Quận 1, Tp.Hồ Chí Minh','301909543','','','','empty@email.com',63,66,'VIENTHANH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(210,'CÔNG TY TNHH DU LỊCH - SỰ KIỆN VIỆT SAO Á','50 Bis Yersin, P. Phương Sài, Nha Trang','4201552311','','','','empty@email.com',63,66,'VIET SAO A',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(211,'CÔNG TY TNHH VIỆT THĂNG','307/10 Nguyễn Văn Trỗi, Phường 1, Quận Tân Bình, TP HCM','302615708','','','','empty@email.com',63,66,'VIET THANG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(212,'CÔNG TY TNHH ĐT & SX VIỆT TÍN','338C Nơ Trang Long, Phường 13, Quận Bình Thạnh, TP HCM','310281047','','','','empty@email.com',63,66,'VIET TIN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(213,'CÔNG TY TNHH KỸ THUẬT VÀ XÂY DỰNG VIỆT THIÊN','242/106 Nguyễn Thiện Thuật, Phường 3, Quận 3, TP HCM','312534198','','','','empty@email.com',63,66,'VIETTHIEN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(214,'CÔNG TY TNHH ĐẦU TƯ & SẢN XUẤT VIỆT TÍN','388C Nơ Trang Long, Phường 13, Quận Bình Thạnh, Tp.HCM','310281047','','','','empty@email.com',63,66,'VIIETTIN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(215,'CÔNG TY CỔ PHẦN VẬN TẢI VINAFCO','Số 33C Cát Linh, P. Cát Linh, Q. Đống Đa, TP Hà Nội','105275178','','','','empty@email.com',63,66,'VINAFCO',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(216,'CN CÔNG TY CP GIAO NHẬN VẬN TẢI VÀ THƯƠNG MẠI','Tầng 6, Số 14 Láng Hạ, P. Thành Công, Q. Ba Đình, Hà Nội','0301776205-001','','','','empty@email.com',63,66,'VINALINK-HN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(217,'CÔNG TY TNHH VINA TAK','Đường Số 4B, KCN Nhơn Trạch 1, Nhơn Trạch, Đồng Nai.','3602703358','','','','empty@email.com',63,66,'VINATAK',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(218,'CÔNG TY TNHH MỘT THÀNH VIÊN VĨNH HƯNG','Thôn 5, Xã Vĩnh Hưng, Huyện Vĩnh Lộc, Tỉnh Thanh Hóa','2801560173','','','','empty@email.com',63,66,'VINHHUNG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(219,'CÔNG TY TNHH SX TM VINH TRÀ','693/A2 Xô Viết Nghệ Tĩnh, Phường 27, Quận Bình Thạnh, Tp.HCM','302950745','','','','empty@email.com',63,66,'VINHTRA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(220,'CÔNG TY CỔ PHẦN VẬN TẢI BIỂN VIỆT NAM','215 Lạch Tray, P. Đằng Giang, Q. Ngô Quyền, Hải Phòng','200106490','','','','empty@email.com',63,66,'VOSCO VN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(221,'VĂN PHÒNG ĐẠI DIỆN DAMFASSS INDUSTRIES PTE LTD','P 10.2 lầu 10, Etown1, 364 Cộng Hòa, P.13, Quận Tân Bình, Tp.HCM','','','','','empty@email.com',63,66,'VP?D DANFOSS',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(222,'VĂN PHÒNG TỔNG CỤC DẠY NGHỀ','37B Nguyễn Bỉnh Khiêm, Hai Bà Trưng, Hà Nội','','84 31 3733580','84 31 3731930','','empty@email.com',63,66,'VPTONGCUCDAYNGHE',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(223,'CÔNG TY CP HÀNG HẢI VSICO','Số 9 ngõ 84 phố Ngọc Khánh, P. Giảng Võ, Quận Ba Đình, Tp. Hà Nội.','102195421','','','','empty@email.com',63,66,'VSICO',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(224,'CÔNG TY TNHH WILO VIỆT NAM','P.1C, Lầu 3, Tòa Nhà ETOWN 1, 364 Cộng Hòa, Phường 13, Quận Tân Bình, Tp HCM','311056767','','','','empty@email.com',63,66,'WILO VN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(225,'CÔNG TY TNHH WOLSUNG VINA','lô 10-1 Cụm CN Tp. Đẹp, ấp Đông, Tân Hiệp, H. Tân Uyên, Bình Dương','3700388841','4.7711089','4.7711094','','empty@email.com',63,66,'WOLSUNG',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(226,'CÔNG TY CP XÂY DỰNG VÀ KINH DOANH ĐỊA ỐC HÒA BÌNH','235 Võ Thị Sáu, Phường 7, Quận 3, TP HCM','302158498','','','','empty@email.com',63,66,'XD HOABINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(227,'CÔNG TY TNHH XUẤT NHẬP KHẨU GIA HUY','Số 5 Trần Quang Diệu, Phường 13, Quận 3, TP HCM','311896438','','','','empty@email.com',63,66,'XNK GIAHUY',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(228,'CÔNG TY TNHH XUẤT NHẬP KHẨU PHÚ TUẤN','Thôn Lưu Thượng, Xã Phú Túc, Huyện Phú Xuyên, TP Hà Nội','500452685','','','','empty@email.com',63,66,'XNK PHUTUAN',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(229,'CÔNG TY TNHH MỘT THÀNH VIÊN NỘI THẤT XUÂN HÒA','Phường Xuân Hòa, Thị xã Phúc Yên, Vĩnh Phúc','2500161922','','','','empty@email.com',63,66,'XUANHOA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(230,'CÔNG TY TNHH MTV TM VD XNK XUÂN TÍNH','101T Trần Văn Đang, Phường 9, Quận 3, Tp.HCM','310849481','','','','empty@email.com',63,66,'XUANTINH',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(231,'CÔNG TY TNHH YANG MING VIỆT NAM','Lầu 19, Toà nhà Ree Tower, Số 9 Đoàn Văn Bơ, P. 12, Q. 4, TP HCM.','303419992','','','','empty@email.com',63,66,'YANGMING',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(232,'CÔNG TY TNHH YANTAI MOON ( VIỆT NAM )','Lô 55, KCX - CN Linh Trung III, H. Trảng Bàng, Tây Ninh.','3900392299','','','','empty@email.com',63,66,'YANTAI MOON',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(233,'CÔNG TY TNHH YCH-PROTRADE - CHI NHÁNH TẠI TP. HÀ NỘI','Phòng 301, Tầng 3, Toà nhà 30 Nguyễn Du, P. Bùi Thị Xuân,  Q. Hai Bà Trưng, Hà Nội','3701654454-001','','','','empty@email.com',63,66,'YCH-PROTRADE',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(234,'CÔNG TY TNHH YNG HUA VIỆT NAM','Lô 24, KCN Biên Hòa 2, P.An Bình, TP Biên Hòa, Đồng Nai','3600255340','0838 116 110','','','empty@email.com',63,66,'YNG HUA',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(235,'CÔNG TY TNHH YUSEN LOGISTICS QUỐC TẾ (VIỆT NAM)','2A-4A Tôn Đức Thắng, Phường Bến Nghé, Quận 1, TP HCM','303467869','','','','empty@email.com',63,66,'YUSEN LOGISTICS QUOCTE',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52'),(254,'sss','','','','','','sadsd@ere.com',63,84,'test',-2,-2,'2015-03-13 23:37:52','2015-03-13 16:37:52');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docservices`
--

DROP TABLE IF EXISTS `docservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docservices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nameOfServices` bigint(20) DEFAULT NULL,
  `regDate` datetime DEFAULT NULL,
  `revDate` datetime DEFAULT NULL,
  `docsgeneral` bigint(20) DEFAULT NULL,
  `regNo` varchar(45) DEFAULT NULL,
  `getDate` datetime DEFAULT NULL,
  `typeCO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toPackageFromService_idx` (`docsgeneral`),
  CONSTRAINT `docsGeneralFromServices` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docservices`
--

LOCK TABLES `docservices` WRITE;
/*!40000 ALTER TABLE `docservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `docservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docsgeneral`
--

DROP TABLE IF EXISTS `docsgeneral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docsgeneral` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer` bigint(20) DEFAULT NULL,
  `jobNo` varchar(45) DEFAULT NULL,
  `processingStaff` bigint(20) DEFAULT NULL,
  `typeOfPackage` bigint(20) DEFAULT NULL,
  `typeOfContainer` bigint(20) DEFAULT NULL,
  `noOfPkgs` int(11) DEFAULT NULL,
  `weigth` decimal(15,2) DEFAULT NULL,
  `cmb` int(11) DEFAULT NULL,
  `placeEmptyDown` varchar(255) DEFAULT NULL,
  `placeEmptyUp` varchar(255) DEFAULT NULL,
  `placeDelivery` varchar(255) DEFAULT NULL,
  `placeRev` varchar(255) DEFAULT NULL,
  `docReceiveDate` datetime DEFAULT NULL,
  `shippingLine` bigint(20) DEFAULT NULL,
  `typeOfDocs` int(10) DEFAULT NULL,
  `contactDelivery` varchar(255) DEFAULT NULL,
  `infoInvoice` varchar(255) DEFAULT NULL,
  `placeRev1` varchar(45) DEFAULT NULL,
  `placeDelivery1` varchar(45) DEFAULT NULL,
  `doDelivery` int(1) DEFAULT NULL,
  `doAccounting` int(1) DEFAULT NULL,
  `portPutCont` varchar(255) DEFAULT NULL,
  `placeGetCont` varchar(255) DEFAULT NULL,
  `productDescription` varchar(2000) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  `typeOfImport` bigint(20) DEFAULT NULL,
  `contactReceive` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobNo_UNIQUE` (`jobNo`),
  KEY `docsCustomer_idx` (`customer`),
  KEY `docsStaff_idx` (`processingStaff`),
  KEY `docsTypeOfService_idx` (`typeOfPackage`),
  KEY `docsTypeOfContainer_idx` (`typeOfContainer`),
  KEY `docsShippingline_idx` (`shippingLine`),
  CONSTRAINT `docsCustmer` FOREIGN KEY (`customer`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `docsStaff` FOREIGN KEY (`processingStaff`) REFERENCES `app_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `docsTypeOfContainer` FOREIGN KEY (`typeOfContainer`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `docsTypeOfService` FOREIGN KEY (`typeOfPackage`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docsgeneral`
--

LOCK TABLES `docsgeneral` WRITE;
/*!40000 ALTER TABLE `docsgeneral` DISABLE KEYS */;
/*!40000 ALTER TABLE `docsgeneral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exfeetable`
--

DROP TABLE IF EXISTS `exfeetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exfeetable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` bigint(20) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  `docsgeneral` bigint(20) DEFAULT NULL,
  `masterFee` bigint(20) DEFAULT NULL,
  `truckingdetail` bigint(20) DEFAULT NULL,
  `exhibition` bigint(20) DEFAULT NULL,
  `approved` int(1) DEFAULT NULL,
  `dateChange` datetime DEFAULT NULL,
  `invoiceNo` varchar(45) DEFAULT NULL,
  `checkByAdmin` int(1) DEFAULT NULL,
  `total` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nameOfFee_idx` (`name`),
  KEY `feeToexhibition_idx` (`docsgeneral`),
  KEY `toMasterFee_idx` (`masterFee`),
  KEY `totruckingdetail_idx` (`id`,`truckingdetail`),
  KEY `totruckingdetail_idx1` (`truckingdetail`),
  KEY `fromfeetoexh_idx` (`exhibition`),
  CONSTRAINT `feeToexhibition` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fromfeetoexh` FOREIGN KEY (`exhibition`) REFERENCES `exhibition` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `nameOfFee` FOREIGN KEY (`name`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toMasterFee` FOREIGN KEY (`masterFee`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `totruckingdetail` FOREIGN KEY (`truckingdetail`) REFERENCES `truckingdetail` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exfeetable`
--

LOCK TABLES `exfeetable` WRITE;
/*!40000 ALTER TABLE `exfeetable` DISABLE KEYS */;
/*!40000 ALTER TABLE `exfeetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibition`
--

DROP TABLE IF EXISTS `exhibition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exhibition` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `docsgeneral` bigint(10) DEFAULT NULL,
  `exName` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `typeOfEx` bigint(10) DEFAULT NULL,
  `openDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `devDate` datetime DEFAULT NULL,
  `exhibitor` varchar(255) DEFAULT NULL,
  `exhPlace` varchar(255) DEFAULT NULL,
  `operator` bigint(10) DEFAULT NULL,
  `etd` datetime DEFAULT NULL,
  `eta` datetime DEFAULT NULL,
  `pol` varchar(255) DEFAULT NULL,
  `poa` varchar(255) DEFAULT NULL,
  `demdet` varchar(255) DEFAULT NULL,
  `tkhqNo` varchar(255) DEFAULT NULL,
  `tkhqDate` datetime DEFAULT NULL,
  `cusDept` bigint(10) DEFAULT NULL,
  `updator` bigint(20) DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `doRecDocs` int(1) DEFAULT '0',
  `doPrepareDocs` int(1) DEFAULT '0',
  `doRequestDocs` int(1) DEFAULT '0',
  `doBooking` int(1) DEFAULT '0',
  `doTrans` int(1) DEFAULT '0',
  `doCus` int(1) DEFAULT '0',
  `doPacking` int(1) DEFAULT '0',
  `albwNo` varchar(255) DEFAULT NULL,
  `counting` bigint(20) DEFAULT NULL,
  `mode` bigint(20) DEFAULT NULL,
  `dateRe` datetime DEFAULT NULL,
  `accountNo` varchar(45) DEFAULT NULL,
  `attn` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `extodocgeneral_idx` (`docsgeneral`),
  KEY `typeOfEx_idx` (`typeOfEx`),
  KEY `operatorConf_idx` (`operator`),
  KEY `toCusDept_idx` (`cusDept`),
  CONSTRAINT `extodocgeneral` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `operatorConf` FOREIGN KEY (`operator`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toCusDept` FOREIGN KEY (`cusDept`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `typeOfEx` FOREIGN KEY (`typeOfEx`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibition`
--

LOCK TABLES `exhibition` WRITE;
/*!40000 ALTER TABLE `exhibition` DISABLE KEYS */;
/*!40000 ALTER TABLE `exhibition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extendfeeacc`
--

DROP TABLE IF EXISTS `extendfeeacc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extendfeeacc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` bigint(20) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `invoice` varchar(1000) DEFAULT NULL,
  `feeowner` bigint(20) DEFAULT NULL,
  `accountingcus` bigint(20) DEFAULT NULL,
  `quantity20` int(10) DEFAULT NULL,
  `quantity40` int(10) DEFAULT NULL,
  `quantityLCL` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toFee_idx` (`feeowner`),
  KEY `toCounting_idx` (`accountingcus`),
  KEY `tofeedebit_idx` (`description`),
  CONSTRAINT `toCounting` FOREIGN KEY (`accountingcus`) REFERENCES `accountingcus` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `toFee` FOREIGN KEY (`feeowner`) REFERENCES `exfeetable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tofeedebit` FOREIGN KEY (`description`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extendfeeacc`
--

LOCK TABLES `extendfeeacc` WRITE;
/*!40000 ALTER TABLE `extendfeeacc` DISABLE KEYS */;
/*!40000 ALTER TABLE `extendfeeacc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inland`
--

DROP TABLE IF EXISTS `inland`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inland` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typeOfInland` bigint(20) DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  `updator` bigint(20) DEFAULT NULL,
  `docsgeneral` bigint(20) DEFAULT NULL,
  `counting` int(10) DEFAULT NULL,
  `nameOfPack` varchar(45) DEFAULT NULL,
  `otherInfo` varchar(45) DEFAULT NULL,
  `refNo` varchar(45) DEFAULT NULL,
  `dateRecPack` datetime DEFAULT NULL,
  `dateDevPack` datetime DEFAULT NULL,
  `dateCutOff` datetime DEFAULT NULL,
  `dateExpired` datetime DEFAULT NULL,
  `isInland` int(1) DEFAULT '1',
  `route` bigint(20) DEFAULT NULL,
  `nameVehicle` varchar(255) DEFAULT NULL,
  `etd` datetime DEFAULT NULL,
  `eta` datetime DEFAULT NULL,
  `freeTimeInHCM` int(10) DEFAULT NULL,
  `freeTimeInHP` int(10) DEFAULT NULL,
  `attachServices` varchar(1000) DEFAULT NULL,
  `accountingPrice` decimal(20,2) DEFAULT NULL,
  `otherFees` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeOfInland_idx` (`typeOfInland`),
  KEY `toCreator_idx` (`creator`),
  KEY `inlandToGeneral_idx` (`docsgeneral`),
  KEY `routeToConf_idx` (`route`),
  KEY `priceItemAcc_idx` (`accountingPrice`),
  CONSTRAINT `inlandToGeneral` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `routeToConf` FOREIGN KEY (`route`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toCreator` FOREIGN KEY (`creator`) REFERENCES `app_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `typeOfInland` FOREIGN KEY (`typeOfInland`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inland`
--

LOCK TABLES `inland` WRITE;
/*!40000 ALTER TABLE `inland` DISABLE KEYS */;
/*!40000 ALTER TABLE `inland` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inlandsize`
--

DROP TABLE IF EXISTS `inlandsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inlandsize` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deep` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `height` int(10) DEFAULT NULL,
  `docsgeneral` bigint(20) DEFAULT NULL,
  `kg` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toInlandFCL_idx` (`docsgeneral`),
  CONSTRAINT `toInland` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inlandsize`
--

LOCK TABLES `inlandsize` WRITE;
/*!40000 ALTER TABLE `inlandsize` DISABLE KEYS */;
/*!40000 ALTER TABLE `inlandsize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multitypes`
--

DROP TABLE IF EXISTS `multitypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multitypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` bigint(20) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `docsgeneral` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `multiToDocs_idx` (`docsgeneral`),
  CONSTRAINT `multiToDocs` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multitypes`
--

LOCK TABLES `multitypes` WRITE;
/*!40000 ALTER TABLE `multitypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `multitypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhathau`
--

DROP TABLE IF EXISTS `nhathau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nhathau` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contactName` varchar(45) DEFAULT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `taxNo` varchar(45) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhathau`
--

LOCK TABLES `nhathau` WRITE;
/*!40000 ALTER TABLE `nhathau` DISABLE KEYS */;
INSERT INTO `nhathau` VALUES (1,'anh Hùng','An Hòa','0915640077','',0,'','1'),(2,'A Hòa','AN LONG TRƯỜNG - CTY CP AN LONG TRƯỜNG','0912.146839','3010271497',0,NULL,'2'),(3,'','NYK','','',1,NULL,'3'),(5,'','APL','',NULL,1,NULL,'5'),(6,'','MOL','',NULL,1,NULL,'6'),(7,'','OOCL','',NULL,1,NULL,'7'),(8,'','COSCO','',NULL,1,NULL,'8'),(9,'','PIL','',NULL,1,NULL,'9'),(10,'','NAMSUNG','',NULL,1,NULL,'10'),(11,'','INTERASIA','',NULL,1,NULL,'11'),(12,'','TSLINE','',NULL,1,NULL,'12'),(13,'','MYANGMINH','',NULL,1,NULL,'13'),(14,'','SITC','',NULL,1,NULL,'14'),(15,'','RCL','',NULL,1,NULL,'15'),(16,'','KLINE','',NULL,1,NULL,'16'),(17,'','UASC','',NULL,1,NULL,'17'),(18,'','MAERSK','',NULL,1,NULL,'18'),(19,'','BIEN DONG','',NULL,1,NULL,'19'),(20,'','MARINA','',NULL,1,NULL,'20'),(21,'','VOSCO','',NULL,1,NULL,'21'),(22,'','SINOKOR','',NULL,1,NULL,'22'),(23,'','DHL','',NULL,1,NULL,'23'),(24,'','FEDEX','',NULL,1,NULL,'24'),(25,'','TNT','',NULL,1,NULL,'25'),(26,'','EMS','',NULL,1,NULL,'26'),(27,'','UPS','',NULL,1,NULL,'27'),(28,'','INTER LOGISTICS','',NULL,1,NULL,'28'),(29,'','KONOIKE','',NULL,1,NULL,'29'),(30,'','SUPERSTAR','',NULL,1,NULL,'30'),(31,'','VINATRANS','',NULL,1,NULL,'31'),(32,'','DACHSER','',NULL,1,NULL,'32'),(33,'','ANC','',NULL,1,NULL,'33'),(34,'','LOGITEM','',NULL,1,NULL,'34'),(35,'','NNR','',NULL,1,NULL,'35'),(36,'','THAMI','',NULL,1,NULL,'36'),(37,'','EVERGREEN','',NULL,1,NULL,'37'),(38,'','EVERICH','',NULL,1,NULL,'38'),(39,'','P&O','',NULL,1,NULL,'39'),(40,'','PT SHIPPING','',NULL,1,NULL,'40'),(41,'','KHAI MINH','',NULL,1,NULL,'41'),(42,'','SCHENKER','',NULL,1,NULL,'42'),(43,'','AGILITY','',NULL,1,NULL,'43'),(45,'','ANH LINH','','',0,NULL,'45'),(46,'A Nam','ANH NAM','0919518468','',0,NULL,'46'),(47,'A Truong','ANH TRƯỜNG','0909295249','',0,NULL,'47'),(48,'A Vuong','ANH VƯƠNG','0917192206','',0,NULL,'48'),(49,'A THUONG',' CTY TNHH SX TM DV ĐÔNG NGÀN','0906.369.499','303417956',0,NULL,'49'),(50,'A DONG','CTY TNHH - VT ĐÔNG TÚ ','0909.919.667','307412162',0,NULL,'50'),(51,'C.THUY','CTY TNHH TM DV VẬN TẢI ĐỨC TRUYỀN','0938.29.57.67','311812124',0,NULL,'51'),(52,' A Hoang','HOÀNG KHANH','0918.369159','',0,NULL,'52'),(53,'A TOÁN','CTY TNHH TM DV VẬN TẢI HỒNG TOÁN','0908.21.21.36','305605264',0,NULL,'53'),(54,'A TOÀN','CTY CP GIAO NHẬN VÀ VẬN CHUYỂN IN DO TRẦN -ITL','0984.70.14.15','301909173',0,NULL,'54'),(55,'A Cuong','KIEN CUONG','0908200200','',0,NULL,'55'),(56,'A Vinh','CTY TNHH VẬN TẢI LÂM VINH ','0903728551','909988360',0,NULL,'56'),(57,'Mr. Lượng','LIÊN TRUNG','0983888289 ','',0,NULL,'57'),(58,'A NHẬT','CTY TNHH TM DV VẬN TẢI LONG PHÚ','0914.052.488','311947409',0,NULL,'58'),(59,'A Nghia','MINH NGHĨA','083807491','',0,NULL,'59'),(60,'A SON','CTY TNHH GIẢI PHÁP VẬN CHUYỂN NAM LONG','0914.722.246','311857799',0,NULL,'60'),(61,'Mr BÁU ','NGỌC BÁU','0903 704 837 ','',0,NULL,'61'),(62,'A THUAN','CTY TNHH VẬN TẢI NGỌC PHÚ','0919.17.17.13','308982214',0,NULL,'62'),(63,'A NHUT','DNTN VẬN TẢI NHỰT QUANG','01244.907.778','3601221915',0,NULL,'63'),(64,'A Thịnh','PHÚ MỸ','0913.856667','',0,NULL,'64'),(65,' A Phương','Phương Nhung','0909576486','',0,NULL,'65'),(66,'ANH ÂN','CTY TNHH MTV VẬN TẢI QUỐC NGHĨA','0906396289','3702070606',0,NULL,'66'),(67,'A Phuong ','SONG HÀ','0989847879 ','',0,NULL,'67'),(68,'A TÂN','CTY TNHH VẬN TẢI XUẤT KHẨU SONG LONG','0938.411.087','312864573',0,NULL,'68'),(69,'A TUNG','CTY TNHH GIAO NHẬN VẬN TẢI T.A.M','0916.699.634','310906475',0,NULL,'69'),(70,'Ms.VÂN','THUẬN HIẾU','0937.331.078 ','',0,NULL,'70'),(71,'A Hung','CTY CP GIAO NHẬN VẬN TẢI THUẬN PHONG','0982442522','312038383',0,NULL,'71'),(72,' A Bình','CONG TY TNHH GIAO NHAN VAN TAI TRAN BINH','0902731711','',0,NULL,'72'),(73,'','TRUNG VIỆT','','',0,NULL,'73'),(74,'','CTY TNHH TM VÀ DỊCH VỤ VẬN TẢI TRUNG NGHĨA','','200781872',0,NULL,'74'),(75,'A NGHIA','CTY TNHH DỊCH VỤ VẬN TẢI TRƯỞNG LỢI','0918.066..764','3039911960',0,NULL,'75'),(76,' A CHUNG','Việt Hoa = NAM VÂN','0983 799 072','',0,NULL,'76'),(77,'ANH HẢI','VINATRA','0906368177 ','',0,NULL,'77'),(78,'','CTY CP VẬN TẢI THƯƠNG MẠI PHƯƠNG LÂM','','200744976',0,NULL,'78'),(79,'','CTY CP VẬT TƯ CÔNG NGHIỆP BÌNH MINH','','200763993',0,NULL,'79'),(80,'','V & T','','',0,NULL,'80'),(81,'','DOANH NGHIỆP TƯ NHÂN CẨM HẠNH','','3900313219',0,NULL,'81');
/*!40000 ALTER TABLE `nhathau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offeritem`
--

DROP TABLE IF EXISTS `offeritem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offeritem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nameOfService` bigint(20) DEFAULT NULL,
  `feeWithVAT` decimal(20,2) DEFAULT NULL,
  `feeNoVAT` decimal(20,2) DEFAULT NULL,
  `feeUnit` bigint(20) DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  `updator` bigint(20) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `offerPrice` bigint(20) NOT NULL,
  `currency` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offerPriceLink_idx` (`offerPrice`),
  KEY `configNameServices_idx` (`nameOfService`),
  KEY `configCurrency_idx` (`currency`),
  KEY `configFeeUnit_idx` (`feeUnit`),
  KEY `FKEB549B6FFEFFB3C` (`nameOfService`),
  KEY `FKEB549B6FE19DF07A` (`currency`),
  KEY `FKEB549B6FBABD227` (`offerPrice`),
  KEY `FKEB549B6F852D3273` (`feeUnit`),
  CONSTRAINT `configCurrency` FOREIGN KEY (`currency`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `configFeeUnit` FOREIGN KEY (`feeUnit`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `configNameServices` FOREIGN KEY (`nameOfService`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `offerPriceLink` FOREIGN KEY (`offerPrice`) REFERENCES `offerprice` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offeritem`
--

LOCK TABLES `offeritem` WRITE;
/*!40000 ALTER TABLE `offeritem` DISABLE KEYS */;
/*!40000 ALTER TABLE `offeritem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offerprice`
--

DROP TABLE IF EXISTS `offerprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offerprice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typeOfService` bigint(20) DEFAULT NULL,
  `dateOffer` datetime DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  `updator` bigint(20) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `customer` bigint(20) NOT NULL,
  `isValid` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeOfService_idx` (`typeOfService`),
  KEY `owner_idx` (`customer`),
  KEY `FK7FA09C6DECE1D869` (`customer`),
  CONSTRAINT `owner` FOREIGN KEY (`customer`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offerprice`
--

LOCK TABLES `offerprice` WRITE;
/*!40000 ALTER TABLE `offerprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `offerprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packageinfo`
--

DROP TABLE IF EXISTS `packageinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packageinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shipper` varchar(255) DEFAULT NULL,
  `typeOfTransport` bigint(20) DEFAULT NULL,
  `consignee` varchar(255) DEFAULT NULL,
  `po` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `nameVehicle` varchar(255) DEFAULT NULL,
  `noVehicle` int(11) DEFAULT NULL,
  `billOfLading` varchar(255) DEFAULT NULL,
  `etd` datetime DEFAULT NULL,
  `eta` datetime DEFAULT NULL,
  `portOfLoading` varchar(255) DEFAULT NULL,
  `portOfArrival` varchar(255) DEFAULT NULL,
  `freeDemDate` int(11) DEFAULT NULL,
  `freeDetDate` int(11) DEFAULT NULL,
  `wareHouseNo` varchar(255) DEFAULT NULL,
  `cusDecOnNo` varchar(255) DEFAULT NULL,
  `customsDate` datetime DEFAULT NULL,
  `colourApplying` bigint(20) DEFAULT NULL,
  `customsDept` bigint(20) DEFAULT NULL,
  `doRecFullDocs` int(1) DEFAULT NULL,
  `doSendDecDraft` int(1) DEFAULT NULL,
  `doConDec` int(1) DEFAULT NULL,
  `doRecOriginalDocs` int(1) DEFAULT NULL,
  `doPreDecDoc` int(1) DEFAULT NULL,
  `doGetDO` int(1) DEFAULT NULL,
  `doGetTaxDec` int(1) DEFAULT NULL,
  `doRegAcc` int(1) DEFAULT NULL,
  `doCheckPack` int(1) DEFAULT NULL,
  `doRelease` int(1) DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  `updator` bigint(20) DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `docsGeneral` bigint(20) DEFAULT NULL,
  `counting` bigint(10) NOT NULL DEFAULT '0',
  `imExMode` bigint(20) DEFAULT NULL,
  `dateSendGood` datetime DEFAULT NULL,
  `dateCloseGood` datetime DEFAULT NULL,
  `closingTime` datetime DEFAULT NULL,
  `closingPlace` varchar(500) DEFAULT NULL,
  `bookingNo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `docsGeneral1_idx` (`docsGeneral`),
  KEY `toColorApplying_idx` (`colourApplying`),
  KEY `toTypeOfTransp_idx` (`typeOfTransport`),
  KEY `toCustDept_idx` (`customsDept`),
  KEY `exEmnk_idx` (`imExMode`),
  CONSTRAINT `exEmnk` FOREIGN KEY (`imExMode`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toColorApplying` FOREIGN KEY (`colourApplying`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toCustDept` FOREIGN KEY (`customsDept`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toDocsGeneral` FOREIGN KEY (`docsGeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `toTypeOfTransp` FOREIGN KEY (`typeOfTransport`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packageinfo`
--

LOCK TABLES `packageinfo` WRITE;
/*!40000 ALTER TABLE `packageinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `packageinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payform`
--

DROP TABLE IF EXISTS `payform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payform` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(20,2) DEFAULT NULL,
  `reason` varchar(1000) DEFAULT NULL,
  `employee` bigint(20) DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  `updator` bigint(20) DEFAULT NULL,
  `createdDate` varchar(45) DEFAULT NULL,
  `lastUpdateDate` varchar(45) DEFAULT NULL,
  `toAdvance` bigint(20) DEFAULT NULL,
  `refNo` varchar(45) DEFAULT NULL,
  `book` varchar(45) DEFAULT NULL,
  `ourRef` varchar(45) DEFAULT NULL,
  `doPay` int(1) DEFAULT NULL,
  `attachment` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payform`
--

LOCK TABLES `payform` WRITE;
/*!40000 ALTER TABLE `payform` DISABLE KEYS */;
/*!40000 ALTER TABLE `payform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planservice`
--

DROP TABLE IF EXISTS `planservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planservice` (
  `id` bigint(20) NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `deparment` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `arrival` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `noCont` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `seal` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `bidder` bigint(20) DEFAULT NULL,
  `numOfCar` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `feeTrans` decimal(20,2) DEFAULT NULL,
  `upDown` decimal(20,2) DEFAULT NULL,
  `extend` decimal(20,2) DEFAULT NULL,
  `repair` decimal(20,2) DEFAULT NULL,
  `others` decimal(20,2) DEFAULT NULL,
  `updator` bigint(20) DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planservice`
--

LOCK TABLES `planservice` WRITE;
/*!40000 ALTER TABLE `planservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `planservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realattachment`
--

DROP TABLE IF EXISTS `realattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realattachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `attachment` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toAtt_idx` (`attachment`),
  CONSTRAINT `toAtt` FOREIGN KEY (`attachment`) REFERENCES `attachment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realattachment`
--

LOCK TABLES `realattachment` WRITE;
/*!40000 ALTER TABLE `realattachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `realattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee` bigint(20) DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  `updator` bigint(20) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `doApproval` int(1) DEFAULT NULL,
  `payReason` varchar(255) DEFAULT NULL,
  `refNo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `torefundemployee_idx` (`employee`),
  CONSTRAINT `torefundemployee` FOREIGN KEY (`employee`) REFERENCES `app_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunddetail`
--

DROP TABLE IF EXISTS `refunddetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refunddetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `docs` bigint(20) DEFAULT NULL,
  `refundForm` bigint(20) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `oAmount` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rorefund_idx` (`refundForm`),
  KEY `refundtodocs_idx` (`docs`),
  CONSTRAINT `refundtodocs` FOREIGN KEY (`docs`) REFERENCES `docsgeneral` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rorefund` FOREIGN KEY (`refundForm`) REFERENCES `refund` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunddetail`
--

LOCK TABLES `refunddetail` WRITE;
/*!40000 ALTER TABLE `refunddetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunddetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (-2,'Default role for all Users','ROLE_USER'),(-1,'Administrator role (can edit Users)','ROLE_ADMIN'),(1,'Sales','ROLE_SALES'),(2,'Docs','ROLE_DOCS'),(3,'Trucking','ROLE_TRUCK'),(4,'Accounting','ROLE_ACCOUNTING');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truckingdetail`
--

DROP TABLE IF EXISTS `truckingdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `truckingdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `consteal` bigint(20) DEFAULT NULL,
  `trucking` bigint(20) DEFAULT NULL,
  `vehicleNo` varchar(45) DEFAULT NULL,
  `noOfVehicle` int(10) DEFAULT NULL,
  `nhathau` bigint(20) DEFAULT NULL,
  `dateDev` datetime DEFAULT NULL,
  `deliveryPlace` varchar(500) DEFAULT NULL,
  `phuthau1` bigint(20) DEFAULT NULL,
  `phuthau2` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toContealtrucking_idx` (`consteal`),
  KEY `toTruckingFD_idx` (`trucking`),
  KEY `toNhathauDe_idx` (`nhathau`),
  KEY `phuthau1` (`phuthau1`),
  KEY `phuthau2` (`phuthau2`),
  CONSTRAINT `truckingdetail_ibfk_2` FOREIGN KEY (`phuthau2`) REFERENCES `nhathau` (`id`),
  CONSTRAINT `toContealtrucking` FOREIGN KEY (`consteal`) REFERENCES `contseal` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `toNhathauDe` FOREIGN KEY (`nhathau`) REFERENCES `nhathau` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toTruckingFD` FOREIGN KEY (`trucking`) REFERENCES `truckingservice` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `truckingdetail_ibfk_1` FOREIGN KEY (`phuthau1`) REFERENCES `nhathau` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truckingdetail`
--

LOCK TABLES `truckingdetail` WRITE;
/*!40000 ALTER TABLE `truckingdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `truckingdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truckingservice`
--

DROP TABLE IF EXISTS `truckingservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `truckingservice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `departure` varchar(255) DEFAULT NULL,
  `arrival` varchar(255) DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  `updator` bigint(20) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `docsgeneral` bigint(20) DEFAULT NULL,
  `doRecInfo` int(1) DEFAULT NULL,
  `doPlaning` int(1) DEFAULT NULL,
  `doBooking` int(1) DEFAULT NULL,
  `doDelivery` int(1) DEFAULT NULL,
  `doDoneDeli` int(1) DEFAULT NULL,
  `doDonePack` int(1) DEFAULT NULL,
  `doCollectInfo` int(1) DEFAULT NULL,
  `doAccounting` int(1) DEFAULT NULL,
  `contactDelivery` varchar(255) DEFAULT NULL,
  `infoInvoice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `truckingdocs_idx` (`docsgeneral`),
  CONSTRAINT `truckingdocs` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truckingservice`
--

LOCK TABLES `truckingservice` WRITE;
/*!40000 ALTER TABLE `truckingservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `truckingservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK143BF46A4FD90D75` (`role_id`),
  KEY `FK143BF46AF503D155` (`user_id`),
  CONSTRAINT `FK143BF46A4FD90D75` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK143BF46AF503D155` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (-3,-2),(-1,-2),(2,-2),(4,-2),(5,-2),(-2,-1),(2,1),(5,1),(2,2),(4,2),(-3,3),(2,3),(-1,4),(2,4);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-06  1:13:27
