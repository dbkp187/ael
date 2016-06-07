-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: ael
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
  `goodDes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toAdvane_idx` (`advanceForm`),
  KEY `toDocs_idx` (`docs`),
  CONSTRAINT `toAdvane` FOREIGN KEY (`advanceForm`) REFERENCES `advanceform` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `toDocs` FOREIGN KEY (`docs`) REFERENCES `docsgeneral` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advancedetail`
--

LOCK TABLES `advancedetail` WRITE;
/*!40000 ALTER TABLE `advancedetail` DISABLE KEYS */;
INSERT INTO `advancedetail` VALUES (1,47,1,19500000,'cược ','giấy cuộn 13 cont'),(2,47,1,6890000,'nâng ','giấy cuộn'),(3,47,1,1300000,'phí làm hàng','giấy cuộn'),(4,47,2,2000000,'GIA HẠN','F358 13C TÂN Á');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advanceform`
--

LOCK TABLES `advanceform` WRITE;
/*!40000 ALTER TABLE `advanceform` DISABLE KEYS */;
INSERT INTO `advanceform` VALUES (1,18,18,18,'2015-04-23 11:44:05','2015-04-23 11:44:05','2015-04-23 00:00:00',NULL,NULL,0,''),(2,18,18,18,'2015-04-24 13:40:27','2015-04-24 13:40:27',NULL,NULL,NULL,0,'');
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
  `city` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `country` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `postal_code` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `province` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `credentials_expired` bit(1) NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `account_enabled` bit(1) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `password_hint` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `username` varchar(50) CHARACTER SET latin1 NOT NULL,
  `version` int(11) DEFAULT NULL,
  `website` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (-2,'\0','\0','','Denver','US','80210','CO','\0','matt@raibledesigns.com','','Matt','Raible','$2a$10$bH/ssqW8OhkTlIso9/yakubYODUOmh.6m5HEJvcBq3t3VdBh7ebqO','Not a female kitty.','','admin',2,'http://raibledesigns.com'),(1,'\0','\0','BAN GIÁM ĐỐC','','','','','\0','yen@aelvn.com','','Hoàng Thị Hải','Yến','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','BGD01',3,''),(2,'\0','\0','BAN GIÁM ĐỐC','','','','','\0','truongpq@aelvn.com','','Phạm Quang','Trưởng','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','BGD02',2,''),(3,'\0','\0','PHÒNG KẾ TOÁN','','','','','\0','account@aelvn.com','','Hoàng Hải','Vân','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','KT01',2,''),(4,'\0','\0','PHÒNG VẬN TẢI','','','','','\0','vtnd@aelvn.com','','Võ Văn','Tuấn','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','VT01',1,''),(5,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','khoilm@aelvn.com','','Lê Minh','Khôi','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','TH01',3,''),(6,'\0','\0','PHÒNG KẾ TOÁN','','','','','\0','account1@aelvn.com','','Lê Thị','Phượng','$2a$10$Ajo7/aaQabtz8bv6JCZWFODu.nJPLjiqrlFUmPFQr18SYdK.QMzPK','admin','','KT02',3,''),(7,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','sales@aelvn.com','','Phan Chinh','Trúc','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','TH02',2,''),(8,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','log01@aelvn.com','','Trần Tuấn','Anh','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','TH03',2,''),(9,'\0','\0','PHÒNG KẾ TOÁN','','','','','\0','admin@aelvn.com','','Lê Thị Hương','Giang','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','KT03',2,''),(10,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','cbd@aelvn.com','','Huỳnh Thanh','Tân','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','TH04',2,''),(12,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','docs@aelvn.com','','Phạm Thị Lệ','Hà','$2a$10$04HIsGPYxVY.7276E6peCusMwvQkvlqCsjMc8jMBcWNizrtxLRPF.','admin','','TH06',3,''),(14,'\0','\0','PHÒNG VẬN TẢI','','','','','\0','import@aelvn.com','','Hứa Phi','Kỳ','$2a$10$lEuymkrGDWJnwfdcww4t4e/hLpCUN2TNaLInLbr1YGrY1Bk80rZ.a','admin','','VT02',4,''),(15,'\0','\0','PHÒNG VẬN TẢI','','','','','\0','export@aelvn.com','','Hoàng','Tuấn','$2a$10$LK.i7NvuPEkEEP5e6jdKbOXHyurcu4zgrxKIxD670kYdW8sh6GkAK','admin','','VT03',3,''),(16,'\0','\0','PHÒNG VẬN TẢI','','','','','\0','ops@aelvn.com','','Nguyễn Thị Hải','Vân','$2a$10$yKUts1AIQCgFaycJCcOdFOPi.6uswRGUbB.nt6YaT8mu.vd32KpiS','admin','','HAVA',4,''),(17,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','cbd@aelvn.com','','Tran Dung','Chinh','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','TH07',3,''),(18,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','cbd@aelvn.com','','Dương Thanh','Giàu','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','01666497978','TH05',4,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES (47,'','',NULL,33,NULL),(48,'','',NULL,34,NULL),(49,'','',NULL,35,NULL),(50,'','',NULL,36,NULL),(51,'','',NULL,37,NULL),(52,'','',NULL,38,NULL),(53,'','',NULL,39,NULL),(54,'','',NULL,40,NULL),(55,'','',NULL,41,NULL),(56,'','',NULL,42,NULL),(57,'','',NULL,43,NULL),(58,'','',NULL,44,NULL),(59,'','',NULL,45,NULL),(60,'','',NULL,46,NULL),(61,'hóa đơn nâng','phí nâng',NULL,47,NULL),(62,'','',NULL,48,NULL),(63,'','',NULL,49,NULL),(64,'','',NULL,50,NULL),(65,'','',NULL,51,NULL),(66,'','',NULL,52,NULL),(67,'','',NULL,53,NULL),(68,'','',NULL,54,NULL),(69,'','',NULL,55,NULL),(70,'','',NULL,56,NULL),(71,'','',NULL,57,NULL),(72,'','',NULL,58,NULL),(73,'','',NULL,59,NULL),(74,'','',NULL,60,NULL),(75,'','',NULL,61,NULL),(76,'','',NULL,62,NULL),(77,'','',NULL,63,NULL),(78,'','',NULL,64,NULL),(79,'','',NULL,65,NULL),(80,'','',NULL,66,NULL),(81,'','',NULL,67,NULL),(82,'','',NULL,68,NULL),(83,'','',NULL,69,NULL),(84,'','',NULL,70,NULL),(85,'','',NULL,71,NULL),(86,'','',NULL,72,NULL),(87,'','',NULL,73,NULL),(88,'','',NULL,74,NULL),(89,'','',NULL,75,NULL),(90,'','',NULL,76,NULL),(91,'','',NULL,77,NULL),(92,'','',NULL,78,NULL),(93,'','',NULL,79,NULL),(94,'','',NULL,80,NULL),(95,'','',NULL,81,NULL),(96,'','',NULL,82,NULL),(97,'','',NULL,83,NULL),(98,'','',NULL,84,NULL),(99,'','',NULL,85,NULL),(100,'','',NULL,86,NULL),(101,'','',NULL,87,NULL),(102,'','',NULL,88,NULL),(103,'','',NULL,89,NULL),(104,'','',NULL,90,NULL),(105,'','',NULL,91,NULL),(106,'','',NULL,92,NULL),(107,'','',NULL,93,NULL),(108,'','',NULL,94,NULL),(109,'','',NULL,95,NULL),(110,'','',NULL,96,NULL),(111,'','',NULL,97,NULL),(112,'','',NULL,98,NULL),(113,'','',NULL,99,NULL),(114,'','',NULL,100,NULL),(115,'','',NULL,101,NULL),(116,'','',NULL,102,NULL),(117,'','',NULL,103,NULL),(118,'','',NULL,104,NULL),(119,'','',NULL,105,NULL),(120,'','',NULL,106,NULL),(121,'','',NULL,107,NULL),(122,'','',NULL,108,NULL),(123,'','',NULL,109,NULL),(124,'','',NULL,110,NULL),(125,'','',NULL,111,NULL),(126,'','',NULL,112,NULL),(127,'','',NULL,113,NULL),(128,'','',NULL,114,NULL),(129,'','',NULL,115,NULL),(130,'','',NULL,116,NULL),(131,'','',NULL,117,NULL),(132,'','',NULL,118,NULL),(133,'','',NULL,119,NULL),(134,'','',NULL,120,NULL),(135,'','',NULL,121,NULL),(136,'','',NULL,122,NULL),(137,'','',NULL,123,NULL),(138,'','',NULL,124,NULL),(139,'HD luu bai','phí lưu bãi',NULL,47,NULL),(140,'','',NULL,125,NULL),(141,'','',NULL,126,NULL),(142,'','',NULL,127,NULL),(145,'','',NULL,130,NULL),(146,'','',NULL,131,NULL),(147,'','',NULL,132,NULL),(148,'','',NULL,133,NULL),(149,'','',NULL,134,NULL),(150,'','',NULL,135,NULL),(151,'','',NULL,136,NULL),(152,'','',NULL,137,NULL),(153,'','',NULL,138,NULL),(154,'','',NULL,139,NULL),(155,'','',NULL,140,NULL),(156,'','',NULL,141,NULL),(157,'','',NULL,142,NULL),(158,'','',NULL,143,NULL),(159,'','',NULL,144,NULL),(160,'','',NULL,145,NULL),(161,'','',NULL,146,NULL),(162,'','',NULL,147,NULL),(163,'','',NULL,148,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (-10,'Chi phí chi hộ',20,'Thông tin customs service',1,'{1}'),(-6,'Hàng rời',7,'Thông tin Transportation Services',1,NULL),(-5,'Biển',6,'Thông tin customs service',0,NULL),(-4,'Xuất',27,'',1,NULL),(-3,'Nhập',27,'',1,NULL),(-2,'LCL',7,NULL,1,NULL),(-1,'FCL',7,NULL,1,NULL),(60,'Công ty nước ngoài',4,'Thông tin customer',1,NULL),(61,'Công ty Việt Nam',4,'Thông tin customer',1,NULL),(62,'Công ty đầu tư nước ngoài',4,'Thông tin customer',1,NULL),(63,'Công ty liên doanh',4,'Thông tin customer',1,NULL),(64,'Doanh nghiệp chế xuất',4,'Thông tin customer',1,NULL),(65,'Văn phòng đại diện',4,'Thông tin customer',1,NULL),(66,'Vietnam',5,'Thông tin customer',1,NULL),(67,'Thailand',5,'Thông tin customer',1,NULL),(68,'Singapore',5,'Thông tin customer',1,NULL),(69,'Campodia',5,'Thông tin customer',1,NULL),(70,'Malaysia',5,'Thông tin customer',1,NULL),(71,'Indonesia',5,'Thông tin customer',1,NULL),(72,'Philippine',5,'Thông tin customer',1,NULL),(73,'Myanmar',5,'Thông tin customer',1,NULL),(74,'China',5,'Thông tin customer',1,NULL),(75,'Korea',5,'Thông tin customer',1,NULL),(76,'Japan',5,'Thông tin customer',1,NULL),(77,'Taiwan',5,'Thông tin customer',1,NULL),(78,'Hongkong',5,'Thông tin customer',1,NULL),(79,'Germany',5,'Thông tin customer',1,NULL),(80,'Denmark',5,'Thông tin customer',1,NULL),(81,'France',5,'Thông tin customer',1,NULL),(82,'England',5,'Thông tin customer',1,NULL),(83,'Nertherland',5,'Thông tin customer',1,NULL),(84,'Australia',5,'Thông tin customer',1,NULL),(85,'USA',5,'Thông tin customer',1,NULL),(86,'Dịch vụ hải quan',0,'Thông tin báo giá',1,NULL),(87,'Dịch vụ vận chuyển',0,'Thông tin báo giá',1,NULL),(88,'Dịch vụ hải quan và vận chuyển',0,'Thông tin báo giá',1,NULL),(89,'Dịch vụ triển lãm',0,'Thông tin báo giá',1,NULL),(90,'Dịch vụ đóng gói, lắp đặt',0,'Thông tin báo giá',1,NULL),(91,'VND',1,'Thông tin báo giá',1,NULL),(92,'USD',1,'Thông tin báo giá',1,NULL),(93,'SGD',1,'Thông tin báo giá',1,NULL),(94,'AUD',1,'Thông tin báo giá',1,NULL),(96,'Xuất kinh doanh',11,'Thông tin customs service',1,NULL),(97,'Xuất phi mậu dịch',11,'Thông tin customs service',1,NULL),(98,'Tạm xuất tái nhập',11,'Thông tin customs service',1,NULL),(99,'Nhập SXXK',11,'Thông tin customs service',1,NULL),(100,'Tái xuất',11,'Thông tin customs service',1,NULL),(101,'Xuất SXXK',11,'Thông tin customs service',1,NULL),(102,'Nhập kinh doanh',11,'Thông tin customs service',1,NULL),(103,'Nhập phi mậu dịch',11,'Thông tin customs service',1,NULL),(104,'Tạm nhập tái xuất',11,'Thông tin customs service',1,NULL),(105,'Đường không',6,'Thông tin customs service',1,NULL),(107,'NYK',12,'Thông tin customs service',1,NULL),(108,'APL',12,'Thông tin customs service',1,NULL),(109,'MOL',12,'Thông tin customs service',1,NULL),(110,'OOCL',12,'Thông tin customs service',1,NULL),(111,'COSCO',12,'Thông tin customs service',1,NULL),(112,'PIL',12,'Thông tin customs service',1,NULL),(113,'NAMSUNG',12,'Thông tin customs service',1,NULL),(114,'INTERASIA',12,'Thông tin customs service',1,NULL),(115,'TSLINE',12,'Thông tin customs service',1,NULL),(116,'MYANGMINH',12,'Thông tin customs service',1,NULL),(117,'SITC',12,'Thông tin customs service',1,NULL),(118,'RCL',12,'Thông tin customs service',1,NULL),(119,'KLINE',12,'Thông tin customs service',1,NULL),(120,'UASC',12,'Thông tin customs service',1,NULL),(121,'MAERSK',12,'Thông tin customs service',1,NULL),(122,'BIEN DONG',12,'Thông tin customs service',1,NULL),(123,'MARINA',12,'Thông tin customs service',1,NULL),(124,'VOSCO',12,'Thông tin customs service',1,NULL),(125,'SINOKOR',12,'Thông tin customs service',1,NULL),(126,'DHL',12,'Thông tin customs service',1,NULL),(127,'FEDEX',12,'Thông tin customs service',1,NULL),(128,'TNT',12,'Thông tin customs service',1,NULL),(129,'Quản lý hàng đầu tư HCM',13,'Thông tin customs service',1,NULL),(130,'Mỹ Phước 1',13,'Thông tin customs service',1,NULL),(131,'Cảng Bình Dương',13,'Thông tin customs service',1,NULL),(132,'VSIP',13,'Thông tin customs service',1,NULL),(133,'Biên Hoà',13,'Thông tin customs service',1,NULL),(134,'Long Bình Tân',13,'Thông tin customs service',1,NULL),(135,'Cảng Cát Lái',13,'Thông tin customs service',1,NULL),(136,'Khánh Hội',13,'Thông tin customs service',1,NULL),(155,'VICT',13,'Thông tin customs service',1,NULL),(156,'Bến Nghé',13,'Thông tin customs service',1,NULL),(157,'ICD TRANSIMEX',13,'Thông tin customs service',1,NULL),(158,'ICD Phước Long 1',13,'Thông tin customs service',1,NULL),(159,'ICD Phước Long 3',13,'Thông tin customs service',1,NULL),(160,'ICD TAMAMEXCO',13,'Thông tin customs service',1,NULL),(161,'ICD SOTRANS',13,'Thông tin customs service',1,NULL),(162,'Cảng Hải Phòng',13,'Thông tin customs service',1,NULL),(163,'Bắc Hà Nội',13,'Thông tin customs service',1,NULL),(164,'1',8,'GREEN',1,NULL),(165,'2',8,'YELLOW',1,NULL),(166,'3',8,'RED',1,NULL),(167,'20 DR',10,'Thông tin CONT',1,NULL),(168,'20 FR',10,'Thông tin CONT',1,NULL),(169,'20 OP',10,'Thông tin CONT',1,NULL),(170,'20 TK',10,'Thông tin CONT',1,NULL),(171,'40 DR',10,'Thông tin CONT',1,NULL),(172,'40 HQ',10,'Thông tin CONT',1,NULL),(173,'40 FR',10,'Thông tin CONT',1,NULL),(174,'40 OP',10,'Thông tin CONT',1,NULL),(175,'40 TK',10,'Thông tin CONT',1,NULL),(176,'45 HQ',10,'Thông tin CONT',1,NULL),(178,'Chi phí AEL',20,'Thông tin customs service',1,NULL),(180,'Khác',20,'Thông tin customs service',1,NULL),(200,'Xuất',14,'Thông tin Transportation Services',1,NULL),(201,'Nhập',14,'Thông tin Transportation Services',1,NULL),(202,'Chuyển kho',14,'Thông tin Transportation Services',1,NULL),(203,'Bắc - Nam',15,'Thông tin Transportation Services',1,NULL),(204,'Nam - Bắc',15,'Thông tin Transportation Services',1,NULL),(205,'Tạm xuất',17,'Thông tin exhibition',1,NULL),(206,'Tạm nhập',17,'Thông tin exhibition',1,NULL),(207,'Xuất KD',17,'Thông tin exhibition',1,NULL),(208,'Tái nhập',17,'Thông tin exhibition',1,NULL),(209,'Nhập sau',17,'Thông tin exhibition',1,NULL),(210,'Onsite',17,'Thông tin exhibition',1,NULL),(211,'Phí xin GP',21,'Thông tin exhibition',1,NULL),(212,'Local charge at depart',21,'Thông tin exhibition',1,NULL),(213,'Local charge at dest',21,'Thông tin exhibition',1,NULL),(214,'Phí onsite',21,'Thông tin exhibition',1,NULL),(215,'Phí XN - CN',21,'Thông tin exhibition',1,NULL),(216,'Phí giao nhận',21,'Thông tin exhibition',1,NULL),(217,'Phí OF',21,'Thông tin exhibition',1,NULL),(218,'Phí đại lý',21,'Thông tin exhibition',1,NULL),(219,'Tiền thuế XNK',21,'Thông tin exhibition',1,NULL),(220,'Phí khác',21,'Thông tin exhibition',1,NULL),(260,'Phí dịch vụ hải quan và vận chuyển',23,'',1,NULL),(261,'Customs clearance  & Transportation fee',24,'',1,NULL),(271,'Cái',3,NULL,1,NULL),(272,'Con',3,NULL,1,NULL),(274,'Lào',5,NULL,1,NULL),(283,'Inward handling',25,NULL,1,NULL),(284,'Outward',25,NULL,1,NULL),(286,'Đường bộ',6,'',1,NULL),(287,'Loại khác',14,'',1,NULL),(288,'Loại khác',0,NULL,1,NULL),(289,'Mua tài sản',19,'',1,''),(290,'Mua công cụ dụng cụ',19,'',1,''),(291,'value',0,'description',0,'implyActions'),(292,'Thanh toán cho người lao động',19,'',1,''),(293,'Tiền lương',19,'',1,''),(294,'Tiền thưởng',19,'',1,''),(295,'Tiền phụ cấp',19,'',1,''),(296,'Chi phí dịch vụ mua ngoài',19,'',1,''),(297,'Tiền điện',19,'',1,''),(298,'Tiền nước',19,'',1,''),(299,'Tiền điện thoại',19,'',1,''),(300,'Tiền thuê văn phòng, cửa hàng, thuê tài sản',19,'',1,''),(301,'Thuê bốc dỡ, vận chuyển',19,'',1,''),(302,'Tiền hoa hồng đại lý',19,'',1,''),(303,'Tiền thuê sửa chữa TSCĐ',19,'',1,''),(304,'Chi phí bằng tiền khác',19,'',1,''),(305,'Văn phòng phẩm',19,'',1,''),(306,'Công tác phí',19,'',1,''),(307,'Đào tạo cán bộ',19,'',1,''),(308,'Hội nghị',19,'',1,''),(309,'Tiếp khách',19,'',1,''),(310,'Tuyển dụng',19,'',1,''),(311,'Chi phí quảng cáo, giới thiệu sản phẩm, hàng hóa',19,'',1,''),(312,'Chi phí mua hàng',19,'',1,''),(313,'Cước vận chuyển',19,'',1,''),(314,'Cước vận chuyển nội địa',19,'',1,''),(315,'Cước vận chuyển quốc tế',19,'',1,''),(316,'Chi phí nâng hạ',19,'',1,''),(317,'Phát sinh',19,'',1,''),(318,'Phí hạ',19,'',1,''),(319,'Phí nâng',19,'',1,''),(320,'Phí lấy lệnh',19,'',1,''),(321,'Phí chứng từ',19,'',1,''),(322,'Phí D/O',19,'',1,''),(323,'Phí xếp dỡ',19,'',1,''),(324,'Phí lưu con, lưu bãi, lưu kho',19,'',1,''),(325,'Phí lưu bãi',19,'',1,''),(326,'Phí lưu cont',19,'',1,''),(327,'Phí lưu kho',19,'',1,''),(328,'Phí vệ sinh',19,'',1,''),(329,'Phí sữa chữa',19,'',1,''),(330,'Phí kiểm dịch',19,'',1,''),(331,'Chi phí hải quan',19,'',1,''),(332,'Chi phí khác',19,'',1,''),(333,'Lệ phí hải quan',19,'',1,''),(334,'Phí bốc hàng',19,'',1,''),(335,'Phí ký chứng từ',19,'',1,''),(336,'Phí làm kiểm dịch',19,'',1,''),(337,'Phí thanh lý',19,'',1,''),(338,'Chi phí xe cont, xe tải',19,'',1,''),(339,'Chi phí xe cont',19,'',1,''),(340,'CP khoán xe cont',19,'',1,''),(341,'Dầu DO xe cont',19,'',1,''),(342,'Lương tài xế',19,'',1,''),(343,'Nâng hạ, bốc xếp, cầu đường',19,'',1,''),(344,'Chi phí xe tải',19,'',1,''),(345,'Chi phí khoán xe tải',19,'',1,''),(346,'Chi phí dầu DO xe tải',19,'',1,''),(347,'value',0,'description',0,'implyActions'),(348,'CHANCHAO',22,NULL,1,NULL);
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
  `noOfCont` varchar(45) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contseal`
--

LOCK TABLES `contseal` WRITE;
/*!40000 ALTER TABLE `contseal` DISABLE KEYS */;
INSERT INTO `contseal` VALUES (22,33,'CCLU7713807',172,NULL,'AA052153',0.00,'ĐÔNG XUYÊN'),(23,33,'CCLU7117198',172,NULL,'AA052169',0.00,'ĐÔNG XUYÊN'),(25,35,'GESU5454206',172,NULL,'AA052162',0.00,'ĐÔNG XUYÊN'),(28,38,'BISU 6824313',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(31,40,'TCLU5649860',171,0,'ML-TH2706432',0.00,NULL),(32,40,'MRKU2236072',171,0,'ML-TH2706307',0.00,NULL),(33,40,'MRKU5287746',171,0,'ML-TH2706347',0.00,NULL),(34,40,'MSKU1821834',171,0,'ML-TH2706305',0.00,NULL),(35,41,'RFCU5022409',171,0,'SITR796060',0.00,NULL),(36,41,'RFCU5072349',171,NULL,'SITR796050',NULL,NULL),(37,41,'SEGU4643278',171,NULL,'SITR796045',NULL,NULL),(38,41,'SITU9041841',171,NULL,'SITR796181',NULL,NULL),(39,41,'SITU9066182',171,NULL,'SITR796182',NULL,NULL),(40,41,'TEMU6140108',171,NULL,'SITR796057',NULL,NULL),(41,41,'TEMU6338407',171,NULL,'SITR796055',NULL,NULL),(42,41,'TGHU6554033',171,NULL,'SITR795912',NULL,NULL),(43,42,'BISU 6820730',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(44,43,'SEGU4750105',171,0,'SITR795967',0.00,NULL),(45,43,'SITU9068436',171,NULL,'SITR796030',NULL,NULL),(46,43,'UETU5293454',171,NULL,'SITR792719',NULL,NULL),(47,43,'SEGU4643196',171,NULL,'SITR792805',NULL,NULL),(48,43,'SITU9068307',171,NULL,'SITR796117',NULL,NULL),(49,45,'GLDU 7371529',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(55,47,'EITU1143632',172,0,'EMCCEQ8454',0.00,NULL),(56,47,'DRYU9447040',172,0,'EMCCEM9234',0.00,NULL),(57,47,'BMOU4799793',172,0,'EMCCEM9224',0.00,NULL),(58,47,'EGSU9090193',172,0,'EMCCEQ8744',0.00,NULL),(59,47,'BMOU4822933',172,0,'EMCCEQ8474',0.00,NULL),(60,47,'EISU9387354',172,0,'EMCCEM1024',0.00,NULL),(61,47,'EMCU9851101',172,0,'EMCCEM1194',0.00,NULL),(62,47,'EGSU9110561',172,0,'EMCCEM1064',0.00,NULL),(63,47,'HMCU9174087',172,0,'EMCCEM1134',0.00,NULL),(64,47,'TGHU6937449',172,0,'EMCCEQ8484',0.00,NULL),(65,47,'TEMU6095755',172,0,'EMCCEQ8664',0.00,NULL),(66,47,'DFSU6898689',172,0,'EMCCEM9154',0.00,NULL),(67,47,'EITU1003435',172,0,'EMCCEM1124',0.00,NULL),(68,53,'OOLU7721599',167,0,'OOLDDV0477',0.00,NULL),(69,53,'TCKU4529800',167,NULL,'OOLDLJ9410',NULL,NULL),(70,53,'TGHU5158172',167,NULL,'OOLDDV0257',NULL,NULL),(71,56,'MRKU3729900',167,0,'ML-TH2811375',0.00,NULL),(72,56,'MRKU3342309',167,NULL,'ML-TH2811369',NULL,NULL),(73,56,'MRKU4229597',167,NULL,'ML-TH2811365',NULL,NULL),(74,56,'MSKU8835486',167,NULL,'ML-TH2811345',NULL,NULL),(75,56,'MIEU0055120',167,NULL,'ML-TH2811367',NULL,NULL),(76,56,'MSKU9474979',167,NULL,'ML-TH2811364',NULL,NULL),(77,56,'MSKU0378296',167,NULL,'ML-TH2811374',NULL,NULL),(78,56,'MSKU1011140',167,NULL,'ML-TH2843458',NULL,NULL),(79,56,'MRKU4715161',167,NULL,'ML-TH2844570',NULL,NULL),(80,56,'MRKU2002984',167,NULL,'ML-TH2811348',NULL,NULL),(81,56,'MSKU9107546',167,NULL,'ML-TH2811368',NULL,NULL),(82,56,'MRKU3196971',167,NULL,'ML-TH2811363',NULL,NULL),(83,56,'MRKU5300344',167,NULL,'ML-TH2811372',NULL,NULL),(84,56,'MRKU2725690',167,NULL,'ML-TH2811371',NULL,NULL),(85,56,'MRKU0560930',167,NULL,'ML-TH2844550',NULL,NULL),(86,56,'MRKU2590065',167,NULL,'ML-TH2811361',NULL,NULL),(87,56,'MSKU0314840',167,NULL,'ML-TH2811230',NULL,NULL),(88,56,'MRKU2791434',167,NULL,'ML-TH2811370',NULL,NULL),(89,56,'MSKU8896476',167,NULL,'ML-TH2811366',NULL,NULL),(90,56,'PONU1237055',167,NULL,'ML-TH2811362',NULL,NULL),(91,60,'TRLU 7393967',171,NULL,'',0.00,'VINAFCO'),(92,61,'TCNU 9732440',171,NULL,'',0.00,'VINAFCO'),(93,64,'EOLU 4588760',171,NULL,'',0.00,''),(94,64,'BLZU4170159',171,NULL,'',0.00,''),(95,64,'EOLU 4589196',171,NULL,'',0.00,''),(96,64,'EOLU4974741',171,NULL,'',0.00,''),(97,65,'OOLU7809416',167,0,'OOLCZA7910',0.00,NULL),(98,65,'OOLU7822589',167,0,'OOLCZA8059',0.00,NULL),(99,65,'OOLU7384712',167,0,'OOLCZA7872',0.00,NULL),(100,65,'OOLU7675451',167,0,'OOLCZA7964',0.00,NULL),(101,65,'OOLU7753512',167,0,'OOLCZA7909',0.00,NULL),(102,65,'OOLU7850600',167,0,'OOLCZA7995',0.00,NULL),(103,65,'OOLU7261770',167,0,'OOLCZA7832',0.00,NULL),(104,65,'OOLU7402570',167,0,'OOLCZA7891',0.00,NULL),(105,65,'OOLU7996209',167,0,'OOLCZA6047',0.00,NULL),(106,65,'OOLU7330803',167,0,'OOLCZA5995',0.00,NULL),(107,65,'OOLU7340057',167,0,'OOLCZA5865',0.00,NULL),(108,64,'GATU 8742704',171,NULL,'',0.00,''),(109,64,'CLHU 8630142',171,NULL,'',0.00,''),(110,64,'CRSU 9090974',171,NULL,'',0.00,''),(111,64,'RFCU 4000010',171,NULL,'',0.00,''),(112,64,'TEMU7213446',171,NULL,'',0.00,''),(113,64,'TCNU 5243436',171,NULL,'',0.00,''),(114,64,'GLDU0836136',171,NULL,'',0.00,''),(115,64,'TEMU6740355',171,NULL,'',0.00,''),(116,64,'RFCU4002558',171,NULL,'',0.00,''),(117,64,'RFCU 4003240',171,NULL,'',0.00,''),(118,64,'RFCU 4000160',171,NULL,'',0.00,''),(119,64,'TGHU 9142575',171,NULL,'',0.00,''),(120,64,'GESU5336501',171,NULL,'',0.00,''),(121,64,'TEMU7694280',171,NULL,'',0.00,''),(122,64,'BSIU927290',171,NULL,'',0.00,''),(123,64,'KMTU 9307779',171,NULL,'',0.00,''),(124,64,'KMTU9304609',171,NULL,'',0.00,''),(125,64,'GLDU7603671',171,NULL,'',0.00,''),(126,64,'TEMU6890627',171,NULL,'',0.00,''),(127,64,'FCIU 8489731',171,NULL,'',0.00,''),(128,67,'MRKU4301984',171,NULL,'',0.00,''),(129,67,'MSKU9805531',171,NULL,'',0.00,''),(130,67,'GATU8366525',171,NULL,'',0.00,''),(131,67,'MRKU3200916',171,NULL,'',0.00,''),(132,68,'GESU6554576',171,NULL,'',0.00,''),(133,68,'TSTU0524747',171,NULL,'',NULL,''),(134,69,'YMLU 8013395',171,NULL,'',0.00,'VINAFCO'),(135,71,'NYKU 5427972',171,NULL,'',0.00,'VINAFCO'),(136,72,'BISU 6823810',171,NULL,'',0.00,'VINAFCO'),(137,73,'BISU 6824632',171,NULL,'',0.00,'VINAFCO'),(138,75,'TEMU5028407',167,NULL,'',0.00,''),(139,76,'DFSU 6731794',171,NULL,'',0.00,''),(140,76,'ECMU9337812',171,NULL,'',NULL,''),(141,77,'OOLU1295351',167,NULL,'',0.00,''),(142,78,'MSKU 3241898',167,NULL,'',0.00,''),(143,78,'MSKU 8771041',171,NULL,'',0.00,''),(144,78,'TGHU6304137',171,NULL,'',0.00,''),(145,78,'BMOU 5277047',171,NULL,'',0.00,''),(146,78,'CMAU5249541',171,NULL,'1749950',0.00,''),(147,78,'FCIU8447844',171,NULL,'',0.00,''),(148,78,'TCNU8612219',171,NULL,'',0.00,''),(149,78,'EMCU 9724200',171,NULL,'D.7085971',0.00,''),(150,79,'TCLU8735767',167,0,'MOL916847G',0.00,NULL),(151,79,'TCNU6818469',167,0,'MOL916780G',0.00,NULL),(152,79,'TCNU5018986',167,0,'MOL836029H',0.00,NULL),(153,79,'TGHU9291178',167,0,'MOL916823G',0.00,NULL),(154,79,'TCLU5592852',167,0,'MOL405526H',0.00,NULL),(155,79,'TCLU9649283',167,0,'MOL916873G',0.00,NULL),(156,79,'TEMU7303576',167,0,'MOL836030H',0.00,NULL),(157,79,'TCLU8512700',167,0,'MOL916834G',0.00,NULL),(158,79,'TGHU6210845',167,0,'MOL916954G',0.00,NULL),(159,79,'TCNU7434508',167,0,'MOL916921G',0.00,NULL),(160,79,'TCNU5799019',167,0,'MOL405512H',0.00,NULL),(161,79,'TCNU5794228',167,0,'MOL837662H',0.00,NULL),(162,79,'TGHU6586093',167,0,'MOL405602H',0.00,NULL),(163,79,'TGHU6835262',167,0,'MOL837703H',0.00,NULL),(164,79,'CXDU1162347',167,0,'MOL837698H',0.00,NULL),(165,79,'TCLU6275256',167,0,'MOL837714H',0.00,NULL),(166,79,'TEMU7493990',167,0,'MOL807750H',0.00,NULL),(167,79,'TGHU6061398',167,0,'MOL837642H',0.00,NULL),(168,79,'TCNU5633136',167,0,'MOL837540H',0.00,NULL),(169,79,'FCIU9764709',167,0,'MOL836100H',0.00,NULL),(170,79,'CAIU8604333',167,0,'MOL837630H',0.00,NULL),(171,79,'TCLU8875310',167,0,'MOL916776G',0.00,NULL),(172,79,'TCLU1650668',167,0,'MOL837554H',0.00,NULL),(173,79,'TGHU6620412',167,0,'MOL837652H',0.00,NULL),(174,80,'WFHU1448679',167,NULL,'',0.00,''),(175,80,'CRSU 1400815',167,NULL,'',NULL,''),(176,80,'KKTU 8039660',167,NULL,'',NULL,''),(177,81,'CAIU 9196350',171,NULL,'',0.00,''),(178,81,'MOTU 0669860',171,NULL,'',NULL,''),(179,81,'TRLU6854426',171,NULL,'',NULL,''),(180,82,'MSKU7742007',167,0,'ML-TW2211422',0.00,NULL),(181,82,'MSKU7691276',167,0,'ML-TW2211388',0.00,NULL),(182,82,'MRKU7648935',167,0,'ML-TW2211438',0.00,NULL),(183,82,'MSKU5949530',167,0,'ML-TW2219250',0.00,NULL),(184,83,'HLXU 3323740',167,NULL,'',0.00,''),(185,83,'FSCU 3479750',167,NULL,'',0.00,''),(186,83,'HLXU 3486650',167,NULL,'',0.00,''),(187,83,'GATU 1350234',167,NULL,'',0.00,''),(188,83,'CAXU 2992700',167,NULL,'',0.00,''),(189,83,'CPSU 1729155',167,NULL,'',0.00,''),(190,83,'HLBU 1232216',167,NULL,'',0.00,''),(191,83,'ITAU 2169667',167,NULL,'',0.00,''),(192,83,'TCKU 2633009',167,NULL,'',0.00,''),(193,83,'HLBU 1236443',167,NULL,'',0.00,''),(194,84,'CPSU1825082',167,NULL,'',0.00,''),(195,84,'GVCU2040951',167,NULL,'',NULL,''),(196,85,'BHCU 4927514',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(197,86,'FSCU 3965011',167,NULL,'',0.00,''),(198,86,'FSCU 3398880',167,NULL,'',0.00,''),(199,86,'HLXU 1408257',167,NULL,'',0.00,''),(200,86,'GATU 0014955',167,NULL,'',0.00,''),(201,87,'BISU 6824313',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(202,88,'BISU 6820730',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(203,89,'GLDU 7371529',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(204,91,'GLDU 0732194',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(205,92,'TCNU 9083070',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(206,93,'DRYU 9917164',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(207,94,'TCNU 9437152',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(208,95,'BISU 6821778',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(210,96,'BISU 6821058',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(211,97,'BISU 6820663',172,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(212,98,'VSCU 4500648',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(213,99,'BISU 6823934',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(214,100,'BISU 6823301',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(215,101,'BISU 6824437',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(216,102,'BISU 6825304',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(217,103,'BISU 6825156',171,NULL,'',0.00,'PHỐ NỐI-HƯNG YÊN'),(218,104,'CAIU8391691',171,NULL,'',0.00,''),(219,106,'TCKU3928690',167,NULL,'',0.00,''),(220,106,'DRYU9336811',171,NULL,'',NULL,''),(221,106,'TCNU6674802',171,NULL,'',NULL,''),(222,107,'TCKU3928690',167,NULL,'',0.00,''),(223,107,'DRYU9336811',171,NULL,'',0.00,''),(224,107,'TCNU6674802',171,NULL,'',0.00,''),(225,109,'',171,NULL,'',0.00,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'CÔNG TY TNHH AGILITY','364 Cộng Hòa, Phường 13, Quận Tân Bình, Tp.HCM','0000','','','364 Cộng Hòa, Phường 13, Quận Tân Bình, Tp.HCM','empty@email.com',63,66,'AGILITY',-2,-2,NULL,NULL),(2,'CÔNG TY TNHH AGILITY LOGISTICS VIỆT NAM','364 Đường Cộng Hòa, Phường 13, Quận Tân Bình, Tp.HCM','0000','','','364 Đường Cộng Hòa, Phường 13, Quận Tân Bình, Tp.HCM','empty@email.com',63,66,'AGILITY LOGISTIC',-2,-2,NULL,NULL),(3,'CÔNG TY TNHH NUÔI TRỒNG THUỶ SẢN APOLLO','3 - 1B Lô H14, Đường P, Khu Phố Mỹ Cảnh, Trung tâm đô thị mới Nam Sài Gòn, P. Tân Phong, Q. 7, TP HCM.','0000','','','3 - 1B Lô H14, Đường P, Khu Phố Mỹ Cảnh, Trung tâm đô thị mới Nam Sài Gòn, P. Tân Phong, Q. 7, TP HCM.','empty@email.com',63,66,'APOLLO',-2,-2,NULL,NULL),(4,'CÔNG TY TNHH THƯƠNG MẠI ARTREND ( VIỆT NAM )','357 / 31 / 25 Tân Hòa Đông, Phường Bình Trị Đông, Quận Bình Tân, TP HCM','0000','','','357 / 31 / 25 Tân Hòa Đông, Phường Bình Trị Đông, Quận Bình Tân, TP HCM','empty@email.com',63,66,'ARTREND',-2,-2,NULL,NULL),(5,'CÔNG TY TNHH BA HÁT','Ấp 1A, Xã An Phú, Thị Xã Thuận An, Tỉnh Bình Dương','0000','','','Ấp 1A, Xã An Phú, Thị Xã Thuận An, Tỉnh Bình Dương','empty@email.com',63,66,'BA HAT',-2,-2,NULL,NULL),(6,'CÔNG TY TNHH SX - XK HÀNG TCMN & TM BẮC NINH','Nhà số 5, ngách 43/98, đường Cổ Nhuế, Phường Cổ Nhuế 2, Quận Bắc Từ Liêm, TP Hà Nội','0000','','','Nhà số 5, ngách 43/98, đường Cổ Nhuế, Phường Cổ Nhuế 2, Quận Bắc Từ Liêm, TP Hà Nội','empty@email.com',63,66,'BACNINH',-2,-2,NULL,NULL),(7,'CÔNG TY CỔ PHẦN ĐẦU TƯ CẢNG CÁI LÂN','Số 1 đường Cái Lân, Tp Hạ Long, Tỉnh Quảng Ninh','0000','','','Số 1 đường Cái Lân, Tp Hạ Long, Tỉnh Quảng Ninh','empty@email.com',63,66,'CANGCAILAN',-2,-2,NULL,NULL),(8,'CÔNG TY TNHH TRE NỨA CUỐN MỸ NGHỆ CÁT ĐẰNG','Yên Tiến, Ý Yên, Nam Định','0000','','','Yên Tiến, Ý Yên, Nam Định','empty@email.com',63,66,'CATDANG',-2,-2,NULL,NULL),(9,'CN CTY CP VẬN ATRI VÀ TIẾP VẬN CHÂU Á THÁI BÌNH DƯƠNG (TP HN)','07 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP HCM','0000','','','07 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP HCM','empty@email.com',63,66,'CHAU A TBD',-2,-2,NULL,NULL),(10,'CÔNG TY TNHH CÔNG NGHIỆP SẮT THÉP CONNEX-AIKO','Lô C-8D-CN, Khu Công Nghiệp Mỹ Phước 3, Huyện Bến Cát, Tỉnh Bình Dương','0000','','','Lô C-8D-CN, Khu Công Nghiệp Mỹ Phước 3, Huyện Bến Cát, Tỉnh Bình Dương','empty@email.com',63,66,'CONNEX-AIKO',-2,-2,NULL,NULL),(11,'CÔNG TY TNHH CỬA ĐỎ','212 Nguyễn Sơn, Phường Bồ Đề, Quận Long Biên, Hà Nội','0000','','','212 Nguyễn Sơn, Phường Bồ Đề, Quận Long Biên, Hà Nội','empty@email.com',63,66,'CUADO',-2,-2,NULL,NULL),(12,'CÔNG TY TNHH MỘT THÀNH VIÊN DADU VIỆT NAM','Lô số 14-16-18-20, Đường số 3, KCN Tân Đức, Xã Đức Hòa Hạ, Huyện Đức Hóa, Tỉnh Long An','0000','','','Lô số 14-16-18-20, Đường số 3, KCN Tân Đức, Xã Đức Hòa Hạ, Huyện Đức Hóa, Tỉnh Long An','empty@email.com',63,66,'DADU',-2,-2,NULL,NULL),(13,'CÔNG TY TNHH MTV TM-DV ĐÀI BẮC','Số 31, đường số 6, tổ 8, Ấp Bàu Sim, ã Tân Thông Hội, Huyện Củ Chi, TP HCM','0000','','','Số 31, đường số 6, tổ 8, Ấp Bàu Sim, ã Tân Thông Hội, Huyện Củ Chi, TP HCM','empty@email.com',63,66,'DAIBAC',-2,-2,NULL,NULL),(14,'CÔNG TY CỔ PHẦN ĐẠI ĐỒNG TIẾN','216 Tân Thành, P. 15, Q. 5, TP HCM.','0000','','','216 Tân Thành, P. 15, Q. 5, TP HCM.','empty@email.com',63,66,'DAIDONGTIEN',-2,-2,NULL,NULL),(15,'CÔNG TY TNHH ĐẠI TÂN','Khu A, Lô G.27C - 28B, đường số 8, KCX Tân Thuận, P. Tân Thuận Đông, Quận 7, TP HCM','0000','','','Khu A, Lô G.27C - 28B, đường số 8, KCX Tân Thuận, P. Tân Thuận Đông, Quận 7, TP HCM','empty@email.com',63,66,'DAITAN',-2,-2,NULL,NULL),(16,'CTY TNHH ĐẠI THÀNH','Ấp Đông Hòa, Xã Song Thuận, Huyện Châu Thành, Tỉnh Tiền Giang','0000','','','Ấp Đông Hòa, Xã Song Thuận, Huyện Châu Thành, Tỉnh Tiền Giang','empty@email.com',63,66,'DAITHANH',-2,-2,NULL,NULL),(17,'CÔNG TY TNHH XUẤT KHẨU THỦ CÔNG MỸ NGHỆ ĐẠI VIỆT','Thôn Thái Hòa, Xã Bình Phú, Huyện Thạch Thất, TP Hà Nội','0000','','','Thôn Thái Hòa, Xã Bình Phú, Huyện Thạch Thất, TP Hà Nội','empty@email.com',63,66,'DAIVIET',-2,-2,NULL,NULL),(18,'CTY TNHH TB DẦU KHÍ SCHOELLER BLECKMANN VN','Lô B2.6, đường D3, KCN Đông An 2, TP Thủ Dầu Một, Tỉnh Bình Dương, VN','0000','','','Lô B2.6, đường D3, KCN Đông An 2, TP Thủ Dầu Một, Tỉnh Bình Dương, VN','empty@email.com',63,66,'DAUKHI SB',-2,-2,NULL,NULL),(19,'CHI NHÁNH CÔNG TY TNHH QUỐC TẾ DELTA TẠI BÌNH DƯƠNG','Số 1/497, Tổ 4, KP Hòa Lân 2, P. Thuận Giao, TX. Thuận An, Tỉnh Bình Dương','0000','','','Số 1/497, Tổ 4, KP Hòa Lân 2, P. Thuận Giao, TX. Thuận An, Tỉnh Bình Dương','empty@email.com',63,66,'DELTA',-2,-2,NULL,NULL),(20,'CÔNG TY LIÊN DOANH ĐỒ GỖ QUỐC TẾ','14 -16- 18 Song Hành, KCN Tân Tạo, Quận Bình Tân, TP HCM','0000','','','14 -16- 18 Song Hành, KCN Tân Tạo, Quận Bình Tân, TP HCM','empty@email.com',63,66,'DO GO QUOC TE',-2,-2,NULL,NULL),(21,'CÔNG TY TNHH XUẤT KHẨU HÀNG TCMN DUY THÀNH','Lô A5-5, A5-6 khu Đảo Xanh, p. Hòa Cường Bắc, Hải Châu, Đà Nẵng','0000','','','Lô A5-5, A5-6 khu Đảo Xanh, p. Hòa Cường Bắc, Hải Châu, Đà Nẵng','empty@email.com',63,66,'DUYTHANH',-2,-2,NULL,NULL),(22,'CÔNG TY CỔ PHẦN FECON MILTEC','Lô NX_D2, KCN Long Hậu, Long Hậu, Cần Giuộc, Long An.','0000','','','Lô NX_D2, KCN Long Hậu, Long Hậu, Cần Giuộc, Long An.','empty@email.com',63,66,'FECON MILTEC',-2,-2,NULL,NULL),(23,'CÔNG TY CỔ PHẦN TIẾP VẬN FIAN','Phòng TH6, Lầu 3, Số 02 Phùng Khắc Khoan, P.Đa Kao, Quận 1, TP HCM','0000','','','Phòng TH6, Lầu 3, Số 02 Phùng Khắc Khoan, P.Đa Kao, Quận 1, TP HCM','empty@email.com',63,66,'FIAN',-2,-2,NULL,NULL),(24,'CÔNG TY TNHH GEA REFRIGERATION VIỆT NAM','3G Phổ Quang, Phường 2, Q. Tân Bình, Tp.HCM','0000','','','3G Phổ Quang, Phường 2, Q. Tân Bình, Tp.HCM','empty@email.com',63,66,'GEA',-2,-2,NULL,NULL),(25,'CÔNG TY TNHH GLOBE EXPRESS VIỆT NAM','P.102, Lầu 01, Số 43 Mạc Đĩnh Chi, Quân 1, TP HCM','0000','','','P.102, Lầu 01, Số 43 Mạc Đĩnh Chi, Quân 1, TP HCM','empty@email.com',63,66,'GLOBE EXPRESS',-2,-2,NULL,NULL),(26,'CÔNG TY CP SẢN XUẤT - THƯƠNG MẠI XUẤT NHẬP KHẨU VỚ HẠNH TRANG','106/26 Tôn Thất Hiệp, Phường 13, Quận 11, TP CHM','0000','','','106/26 Tôn Thất Hiệp, Phường 13, Quận 11, TP CHM','empty@email.com',63,66,'HANHTRANG',-2,-2,NULL,NULL),(27,'DOANH NGHIỆP TƯ NHÂN HIỀN UYÊN VI','22C/4 đường 672, P.Phước Long B, Quận 9, TP HCM','0000','','','22C/4 đường 672, P.Phước Long B, Quận 9, TP HCM','empty@email.com',63,66,'HIEN UYEN VI',-2,-2,NULL,NULL),(28,'CÔNG TY TNHH HITACHI TRANSPORT SYSTEM','Số 20, đường Sông Thao, phường 2, Quận Tân Bình, TP HCM','0000','','','Số 20, đường Sông Thao, phường 2, Quận Tân Bình, TP HCM','empty@email.com',63,66,'HITACHI ',-2,-2,NULL,NULL),(29,'CÔNG TY TNHH GIAO NHẬN VẬN TẢI QUỐC TẾ HOÀNG MẠNH LONG','218/28 Tô Ngọc Vân, Phường Linh Đông, Quận Thủ Đức, TP HCM','0000','','','218/28 Tô Ngọc Vân, Phường Linh Đông, Quận Thủ Đức, TP HCM','empty@email.com',63,66,'HOANG MANH LONG',-2,-2,NULL,NULL),(30,'CÔNG TY TNHH TMDV HOMY','144 Đường D1, Phường 25, Quận Bình Thạnh, Tp.HCM','0000','','','144 Đường D1, Phường 25, Quận Bình Thạnh, Tp.HCM','empty@email.com',63,66,'HOMY',-2,-2,NULL,NULL),(31,'CÔNG TY TNHH HỐ NAI','Khu phố 8, phường Long Bình, Biên Hòa, Đồng Nai','0000','','','Khu phố 8, phường Long Bình, Biên Hòa, Đồng Nai','empty@email.com',63,66,'HONAI',-2,-2,NULL,NULL),(32,'CÔNG TY TNHH ISHIDA VIỆT NAM','R4 - 51 Hưng Phước 4, Phường Tân Phong, Quận 7, TP HCM.','0000','','','R4 - 51 Hưng Phước 4, Phường Tân Phong, Quận 7, TP HCM.','empty@email.com',63,66,'ISHIDA',-2,-2,NULL,NULL),(33,'CÔNG TY TNHH DỊCH VỤ HÀNG HẢI JARDINE (VIỆT NAM)','Phòng 304, Lầu 3, Số 2 Bis 4-6 Lê Thánh Tôn, Phường Bến Nghé, Quận 1, TP HCM','0000','','','Phòng 304, Lầu 3, Số 2 Bis 4-6 Lê Thánh Tôn, Phường Bến Nghé, Quận 1, TP HCM','empty@email.com',63,66,'JARDINE',-2,-2,NULL,NULL),(34,'CÔNG TY TNHH MTV JORDAN MANUFACTURING VIỆT NAM','Lô IV, 16A-16B, Nhóm Công Nghiệp IV, KCN Tân Bình, P.Tây Thạnh, Q.Tân Phú, TP HCM','0000','','','Lô IV, 16A-16B, Nhóm Công Nghiệp IV, KCN Tân Bình, P.Tây Thạnh, Q.Tân Phú, TP HCM','empty@email.com',63,66,'JORDAN',-2,-2,NULL,NULL),(35,'CÔNG TY TNHH GIAO NHẬN VẬN TẢI DẦU KHÍ KIM LIÊN','99 Lê Văn Lương, Xã Phước Kiển, Huyện Nhà Bè, Tp HCM','0000','','','99 Lê Văn Lương, Xã Phước Kiển, Huyện Nhà Bè, Tp HCM','empty@email.com',63,66,'KIMLIEN',-2,-2,NULL,NULL),(36,'CÔNG TY TNHH VẬN TẢI LÂM VINH','448B Nguyễn Tất Thành, Phường 18, Quận 4, Tp.HCM','0000','','','448B Nguyễn Tất Thành, Phường 18, Quận 4, Tp.HCM','empty@email.com',63,66,'LAMVINH',-2,-2,NULL,NULL),(37,'CTY TNHH DV VT LONG PHÚ LIBERTY','236/3 Điện Biên Phủ, P.17, Q.Bình Thạnh, TP HCM','0000','','','236/3 Điện Biên Phủ, P.17, Q.Bình Thạnh, TP HCM','empty@email.com',63,66,'LONGPHU',-2,-2,NULL,NULL),(38,'CÔNG TY TNHH MAICO','216/5 KP 4, P. An Phú, TX. Thuận An, Bình Dương.','0000','','','216/5 KP 4, P. An Phú, TX. Thuận An, Bình Dương.','empty@email.com',63,66,'MAICO',-2,-2,NULL,NULL),(39,'CÔNG TY TNHH MẦM XANH VIỆT','28/1/29 Đường số 10, khu phố 3, P.Linh Trung, Q.Thủ Đức, Tp HCM','0000','','','28/1/29 Đường số 10, khu phố 3, P.Linh Trung, Q.Thủ Đức, Tp HCM','empty@email.com',63,66,'MAMXANHVIET',-2,-2,NULL,NULL),(40,'VPĐD MAREL FOOD SYSTEMS LTD.TẠI TP.HCM','10 Hưng Phước 3, Tân Phong, Quận 7, TP HCM','0000','','','10 Hưng Phước 3, Tân Phong, Quận 7, TP HCM','empty@email.com',63,66,'MAREL FOOD SYSTEM',-2,-2,NULL,NULL),(41,'CÔNG TY TNHH CƠ KHÍ CHÍNH XÁC MIEN HUA','Quốc Lộ 1A, P.Tân Khánh, TP Tân An, Long An','0000','','','Quốc Lộ 1A, P.Tân Khánh, TP Tân An, Long An','empty@email.com',63,66,'MIENHUA',-2,-2,NULL,NULL),(42,'CÔNG TY TNHH QUỐC TẾ MINH ANH','36 Trần Văn Quang, Phường 10, Quận Tân Bình, Tp HCM','0000','','','36 Trần Văn Quang, Phường 10, Quận Tân Bình, Tp HCM','empty@email.com',63,66,'MINHANH',-2,-2,NULL,NULL),(43,'CÔNG TY TNHH MKP SHIPPING','52 Đường 239, Cư Xá Bùi Minh Trực, Phường 5, Quận 8, TP HCM','0000','','','52 Đường 239, Cư Xá Bùi Minh Trực, Phường 5, Quận 8, TP HCM','empty@email.com',63,66,'MKP',-2,-2,NULL,NULL),(44,'CÔNG TY CP TẬP ĐÒAN MUỐI MIỀN NAM','173 Hai Bà Trưng, Phường 6, Quận 3, Tp.HCM','0000','','','173 Hai Bà Trưng, Phường 6, Quận 3, Tp.HCM','empty@email.com',63,66,'MUOIMIENNAM',-2,-2,NULL,NULL),(45,'CÔNG TY TNHH VẬN TẢI NGUYÊN THÀNH','63A An Phú Đông 27, Phường An Phú Đông, Quận 12, Tp.HCM','0000','','','63A An Phú Đông 27, Phường An Phú Đông, Quận 12, Tp.HCM','empty@email.com',63,66,'NGUYENTHANH',-2,-2,NULL,NULL),(46,'CÔNG TY CỔ PHẦN ĐẦU TƯ NHÀ BÈ','Khu phố 3, Bến Nghé, Phường Tân Thuận Đông, Quận 7, TP HCM','0000','','','Khu phố 3, Bến Nghé, Phường Tân Thuận Đông, Quận 7, TP HCM','empty@email.com',63,66,'NHABE',-2,-2,NULL,NULL),(47,'CÔNG TY CỔ PHẦN OTRAN LOGISTICS','Đường số 4, KCN Phú Mỹ 1, Thị Trấn Phú Mỹ, Huyện Tân Thành, Bà Rịa - Vũng Tàu','0000','','','Đường số 4, KCN Phú Mỹ 1, Thị Trấn Phú Mỹ, Huyện Tân Thành, Bà Rịa - Vũng Tàu','empty@email.com',63,66,'OTRAN LOGISTICS',-2,-2,NULL,NULL),(48,'CÔNG TY TNHH NHÀ THÉP PEB','KCN Đông Xuyên, P. Rạch Dừa, TP Vũng Tàu','0000','','','KCN Đông Xuyên, P. Rạch Dừa, TP Vũng Tàu','empty@email.com',63,66,'PEB',-2,-2,NULL,NULL),(49,'CÔNG TY TNHH TM & DV GIAO NHẬN VẬN TẢI PHƯƠNG NHUNG','193/2D Bùi Thị xuân, Phường 1, Quận tân Bình, TP HCM','0000','','','193/2D Bùi Thị xuân, Phường 1, Quận tân Bình, TP HCM','empty@email.com',63,66,'PHUONGNHUNG',-2,-2,NULL,NULL),(50,'CÔNG TY CỔ PHẦN TƯ VẤN ĐẦU TƯ QUỐC TẾ PROMANA','193-203 Trần Hưng Đạo, Phường Cô Giang, Quận 1, TP HCM','0000','','','193-203 Trần Hưng Đạo, Phường Cô Giang, Quận 1, TP HCM','empty@email.com',63,66,'PROMANA',-2,-2,NULL,NULL),(51,'CÔNG TY TNHH SCG TRADING VIỆT NAM','117 - 119 Lý Chính Thắng, Phường 7, Quận 3, Tp.HCM','0000','','','117 - 119 Lý Chính Thắng, Phường 7, Quận 3, Tp.HCM','empty@email.com',63,66,'SCG-TRADING',-2,-2,NULL,NULL),(52,'CÔNG TY CỔ PHẦN QUỐC TẾ SƠN HÀ','Lô CN1- Cụm Công Nghiệp Từ Liêm , Phường Minh Khai, quận Bắc Từ Liêm, TP Hà Nội, Việt Nam','0000','','','Lô CN1- Cụm Công Nghiệp Từ Liêm , Phường Minh Khai, quận Bắc Từ Liêm, TP Hà Nội, Việt Nam','empty@email.com',63,66,'SON HA',-2,-2,NULL,NULL),(53,'CÔNG TY SONG LONG','','0000','','','','empty@email.com',63,66,'SONGLONG',-2,-2,NULL,NULL),(54,'CÔNG TY TNHH THẾ GIỚI SƠN MÀI','788 La Thành, Phường Giảng Võ, Quận Ba Đình, Tp Hà Nội, Việt Nam','0000','','','788 La Thành, Phường Giảng Võ, Quận Ba Đình, Tp Hà Nội, Việt Nam','empty@email.com',63,66,'SONMAI',-2,-2,NULL,NULL),(55,'CÔNG TY TNHH NỘI THẤT - SƠN MÀI VIỆT','Thôn Bối Khê, Xã Chuyên Mỹ, Huyện Phú xuyên, Hà Nội','0000','','','Thôn Bối Khê, Xã Chuyên Mỹ, Huyện Phú xuyên, Hà Nội','empty@email.com',63,66,'SONMAI VIET',-2,-2,NULL,NULL),(56,'CÔNG TY TNHH SURINT OMYA VIET NAM','khu công nghiệp Gò dầu, Long Thành, Đồng Nai','0000','','','khu công nghiệp Gò dầu, Long Thành, Đồng Nai','empty@email.com',63,66,'SURINT',-2,-2,NULL,NULL),(57,'CÔNG TY TNHH DỊCH VỤ GIAO NHẬN T & A','49 Phòng 05 tầng trệt, Trường Sơn, Phường 2, Quận Tân Bình, Tp HCM, Việt Nam','0000','','','49 Phòng 05 tầng trệt, Trường Sơn, Phường 2, Quận Tân Bình, Tp HCM, Việt Nam','empty@email.com',63,66,'T & A',-2,-2,NULL,NULL),(58,'CÔNG TY TNHH GIAO NHẬN VẬN TẢI T.A.M','649/40 Điện Biên Phủ, Phường 25, Q. Bình Thạnh, Tp. Hồ Chí Minh','0000','','','649/40 Điện Biên Phủ, Phường 25, Q. Bình Thạnh, Tp. Hồ Chí Minh','empty@email.com',63,66,'T.A.M',-2,-2,NULL,NULL),(59,'CÔNG TY TNHH T.M VINA','Lô H1- H2, KCN Minh Hưng, Xã Minh Hưng, Huyện Chơn Thành, Bình Phước','0000','','','Lô H1- H2, KCN Minh Hưng, Xã Minh Hưng, Huyện Chơn Thành, Bình Phước','empty@email.com',63,66,'T.M VINA',-2,-2,NULL,NULL),(60,'CÔNG TY TNHH GIAO NHẬN T.A.C','2A Nguyễn Thị Minh Khai, P. Đa Kao, Quận 1, Tp.HCM','0000','','','2A Nguyễn Thị Minh Khai, P. Đa Kao, Quận 1, Tp.HCM','empty@email.com',63,66,'TAC',-2,-2,NULL,NULL),(61,'CÔNG TY ĐIỆN VÀ ĐIỆN TỬ TCL (VIỆT NAM)','Phường Tân Biên, Thành phố Biên Hòa, Tỉnh Đồng Nai','0000','','','Phường Tân Biên, Thành phố Biên Hòa, Tỉnh Đồng Nai','empty@email.com',63,66,'TCL',-2,-2,NULL,NULL),(62,'CÔNG TY CỔ PHẦN THÀNH ĐỒNG','Bình Dương, Đông Triều, Quảng Ninh','0000','','','Bình Dương, Đông Triều, Quảng Ninh','empty@email.com',63,66,'THANHDONG',-2,-2,NULL,NULL),(63,'CÔNG TY TNHH THIẾT KẾ QUẬN TÁM','343-345 Bến Bình Đông, P. 11, Q. 8, TP HCM','0000','','','343-345 Bến Bình Đông, P. 11, Q. 8, TP HCM','empty@email.com',63,66,'THIETKE Q8',-2,-2,NULL,NULL),(64,'CÔNG TY CỔ PHẦN QUỐC TẾ TICO','Số 1, ngách 165/53 Đường Cầu Giấy, Phường Dịch Vọng, Quận Cầu Giấy, TP.Hà Nội','0000','','','Số 1, ngách 165/53 Đường Cầu Giấy, Phường Dịch Vọng, Quận Cầu Giấy, TP.Hà Nội','empty@email.com',63,66,'TICO',-2,-2,NULL,NULL),(65,'CÔNG TY CỔ PHẦN THÔNG QUAN ĐẠI TÍN','Số 06 Lê Văn Thiêm, Pường Tân Phong, Quận 7, TP HCM','0000','','','Số 06 Lê Văn Thiêm, Pường Tân Phong, Quận 7, TP HCM','empty@email.com',63,66,'TQ DAITIN',-2,-2,NULL,NULL),(66,'CÔNG TY CỔ PHẦN VẬN TẢI QUỐC TẾ TIẾN TỚI THÀNH CÔNG','Phòng 65, tầng 3, 49 Hoàng Văn Thụ, Phường 15, Quận Phú Nhuận, TP HCM','0000','','','Phòng 65, tầng 3, 49 Hoàng Văn Thụ, Phường 15, Quận Phú Nhuận, TP HCM','empty@email.com',63,66,'TT THANHCONG',-2,-2,NULL,NULL),(67,'VĂN PHÒNG TỔNG CỤC DẠY NGHỀ','37B Nguyễn Bỉnh Khiêm, Hai Bà Trưng, Hà Nội','0000','','','37B Nguyễn Bỉnh Khiêm, Hai Bà Trưng, Hà Nội','empty@email.com',63,66,'VPTONGCUCDAYNGHE',-2,-2,NULL,NULL),(68,'CÔNG TY TNHH YNG HUA VIỆT NAM','Lô 24, KCN Biên Hòa 2, P.An Bình, TP Biên Hòa, Đồng Nai','0000','','','Lô 24, KCN Biên Hòa 2, P.An Bình, TP Biên Hòa, Đồng Nai','empty@email.com',63,66,'YNG HUA',-2,-2,NULL,'2015-04-21 18:37:55'),(259,'CONG TY TNHH SCG TRADING VIETNAM','117 - 119 Lý Chính Thắng, Phường 7, Quận 3, TP HCM','0304189477','','','info@scg.com.vn','',63,66,'SCG-TANA',1,1,'2015-04-22 00:00:00','2015-04-22 08:01:58'),(260,'CONG TY TNHH SCG TRADING  VIETNAM','117 - 119 Lý Chính Thắng, Phường 7, Quận 3, TP HCM','0304189477','','','info@scg.com','',63,66,'SCG-VKPC',1,1,'2015-04-22 00:00:00','2015-04-22 08:02:19'),(261,'COÂNG TY TNHH SCG TRADING VIETNAM','117 - 119 Lý Chính Thắng, Phường 7, Quận 3, TP HCM','0304189477','','','info@scg.com','',63,66,'SCG-ALCAMAX',1,1,'2015-04-22 00:00:00','2015-04-22 08:02:39'),(262,'CONG TY TNHH SCG TRADING VIETNAM','117 - 119 Lý Chính Thắng, Phường 7, Quận 3, TP HCM','0304189477','','','info@scg.com','',63,66,'SCG-PACKAMEX',1,1,'2015-04-22 15:03:52','2015-04-22 08:03:52'),(263,'CÔNG TY TNHH NHÀ THÉP PEB','KCN Đông Xuyên, Phường Rạch Dừa, TP. Vũng Tàu','3 5 0 0 6 8 4 5 2 2','0932.099.807','','Mr Thanh','nqt@pebsteel.com.vn',63,66,'PEB ND',-2,-2,'2015-04-24 09:30:59','2015-04-24 02:30:59'),(264,'CÔNG TY TNHH AGILITY','364 Cộng Hoà, P.13, Q. Tân Bình. HCM','0305244593','','','Mr Trung','votrung@agility.com',63,84,'AGI ND',-2,-2,'2015-04-24 09:32:25','2015-04-24 02:32:25'),(267,'CÔNG TY CỔ PHẦN FECON MILTEC','Lô NX-D2, KCN Long Hậu, Xã Long Hậu, Huyện Cần Giuộc, Long An    ','1101436813','0937.786.313','','Mr Thưởng','thuonghq1989@gmail.com',63,66,'FECON ND',-2,-2,'2015-04-24 09:37:00','2015-04-24 02:37:00'),(268,'CÔNG TY TNHH SCG TRADING VIỆT NAM','117-119, LÝ CHÍNH THẮNG, P.7, QUẬN 3, TP HCM','0304189477','01225777500','','Mr Hiệp','hieptran@scg.co.th',60,66,'SCG ND',-2,-2,'2015-04-24 09:50:20','2015-04-24 02:50:20'),(269,'CÔNG TY CỔ PHẦN HOÀNG NGUYỄN','2222 QL1A - P.TÂN CHÁNH HIỆP - QUẬN 12','0303697936','08-38 911 422','','NGUYÊN VĂN THÚY - 0903815740','',61,66,'HOANG NGUYEN',-2,-2,'2015-04-24 15:48:40','2015-04-24 08:48:40'),(270,'KINGSMEN CLOPLUS EXPO','30, Bongensa-ro, 82 gil Gangam-gu, Seoul, Korea 135-090','000001','','','mr Trưởng','',60,75,'KINGSMEN',-2,-2,'2015-04-25 15:35:26','2015-04-25 08:35:26'),(271,'TRANSIT AIR CARGO PTE LTD','111 NEYTHAL ROADSINGAPORE 625898','000002','','','MR TÚ','',60,68,'TAC/SINGAPORE',-2,-2,'2015-04-25 15:41:19','2015-04-25 08:41:19'),(272,'CROWN VAN LINES CO,. LTD','4-4FL, NO 165, MIN SHENG E.ROAD, SEC 5, TAIPEI TAIWAN','000003','','','MR KHOI','',60,77,'CROWN VAN LINES',-2,-2,'2015-04-25 15:47:17','2015-04-25 08:47:17'),(273,'NY INTERNATONAL LOGISTICS CO., LTD','1010, 10F KOTON DIGITAL TOWER BLDG, #106-6 YANGPYEONG-DONG 5-GA YEONGDEUNGPO, SEOUL, KOREA','00004','','','MR KHOI','',60,75,'NY',-2,-2,'2015-04-25 15:51:28','2015-04-25 08:51:28');
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
INSERT INTO `docservices` VALUES (1,86,NULL,NULL,47,'',NULL,''),(2,86,NULL,NULL,79,'',NULL,'');
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
  `noOfPkgs` int(10) DEFAULT NULL,
  `weigth` decimal(15,2) DEFAULT NULL,
  `cmb` int(10) DEFAULT NULL,
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
  `docsgeneralcol` varchar(45) DEFAULT NULL,
  `sochuyen` varchar(45) DEFAULT NULL,
  `nameVehicle` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docsgeneral`
--

LOCK TABLES `docsgeneral` WRITE;
/*!40000 ALTER TABLE `docsgeneral` DISABLE KEYS */;
INSERT INTO `docsgeneral` VALUES (33,48,'PEBVTT0001',14,NULL,-1,0,0.00,0,NULL,NULL,'CÁT LÁI','ĐÔNG XUYÊN','0015-04-01 00:00:00',NULL,4,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'HÀNG XUẤT - STEEL','J1562 /14  ( 5 CONT ) ',NULL,NULL,NULL,NULL,NULL),(34,1,'AGILITYVTT0001',-2,NULL,-1,0,0.00,0,NULL,NULL,'BẮC NINH','GÒ DẦU','2015-04-03 00:00:00',38,5,NULL,NULL,NULL,NULL,1,0,'BẾN NGHÉ','BẾN NGHÉ','DẦU NHỚT','',NULL,NULL,NULL,'\'508','BIEN DONG FREIGHTER'),(35,48,'PEBVTT0002',14,NULL,-1,0,0.00,0,NULL,NULL,'CÁT LÁI','','0015-04-01 00:00:00',NULL,4,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'HÀNG XUẤT - STEEL','J1488/14-2-2 ( 20 CONT )',NULL,NULL,NULL,NULL,NULL),(36,1,'AGILITYVTT0002',-2,NULL,-1,0,0.00,0,NULL,NULL,'BẮC NINH','GÒ DẦU','2015-04-09 00:00:00',43,5,NULL,NULL,NULL,NULL,1,0,'BẾN NGHÉ','GREEN LOGS','DẦU NHỚT','',NULL,NULL,NULL,'9','PACIFIC GLORIA'),(37,48,'PEBVTT0003',-2,NULL,-1,0,0.00,0,NULL,NULL,'BẮC NINH','GÒ DẦU','2015-04-01 00:00:00',38,5,NULL,NULL,NULL,NULL,1,0,'BẾN NGHÉ','BẾN NGHÉ','SẮT HÌNH`','',NULL,NULL,NULL,'509','BIEN DONG STAR'),(38,48,'PEBVTT0004',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-02 00:00:00',38,5,NULL,NULL,NULL,NULL,1,0,'BẾN NGHÉ','BẾN NGHÉ','','',NULL,NULL,NULL,'509','BIEN DONG STAR'),(39,259,'SCG-TANACUS0001',12,NULL,-2,2,3400.00,3,NULL,NULL,'Kho Bình Chiểu','','2015-04-02 00:00:00',85,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Lô trục cán sóng của dàn máy sản xuất bao bì carton (trục B 2500mm, 1 bộ gồm 02 trục)','',-3,NULL,NULL,'','OOCL BANGKOK'),(40,259,'SCG-TANACUS0002',12,NULL,-1,55,96355.00,0,NULL,NULL,'Kho Bình Chiểu','','2015-04-03 00:00:00',86,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'Giấy cuộn sản xuất bao bì carton định lượng 170GSM (WS170) làm từ bột giấy tái chế, mới 100%','',-3,NULL,NULL,'157N','KUO TAI'),(41,259,'SCG-TANACUS0003',12,NULL,-1,149,186809.00,0,NULL,NULL,'Kho Bình Chiểu','','2015-04-03 00:00:00',87,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'PR105 #& Giấy cuộn sản xuất bao bì carton 105 GSM','',-3,NULL,NULL,'1508S','SAIGON BRIGDE '),(42,48,'PEBVTT0005',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-02 00:00:00',38,5,NULL,NULL,NULL,NULL,1,0,'BẾN NGHÉ','BẾN NGHÉ','','',NULL,NULL,NULL,'509','BIEN DONG STAR'),(43,259,'SCG-TANACUS0004',12,NULL,-1,88,127672.00,0,NULL,NULL,'Kho Bình Chiểu','','2015-04-07 00:00:00',87,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'PR105#&Giấy cuộn sản xuất bao bì carton 105 GSM','',-3,NULL,NULL,'','SITC SHANDONG 1508S'),(44,259,'SCG-TANACUS0005',12,NULL,-2,1,1.60,0,NULL,NULL,'Kho Bình Chiểu','','2015-04-09 00:00:00',88,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Vòng bi bằng hợp kim dùng cho dao cắt của máy sản xuất bao bì carton, P/N:9626044,  mới 100%','',-3,NULL,NULL,'',''),(45,48,'PEBVTT0006',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-02 00:00:00',37,5,NULL,NULL,NULL,NULL,1,0,'BẾN NGHÉ','BẾN NGHÉ','','',NULL,NULL,NULL,'1,509','PIONEER'),(46,259,'SCG-TANACUS0006',12,NULL,-2,2,2.60,0,NULL,NULL,'Kho Bình Chiểu','','2015-04-09 00:00:00',88,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Card điện dùng cho dàn ra giấy của máy sản xuất bao bì carton, P/N: 9917471, mới 100%','',-3,NULL,NULL,'',''),(47,259,'SCG-TANACUS0007',12,NULL,-1,133,319219.00,0,NULL,NULL,'Kho Bình Chiểu','','2015-04-20 00:00:00',89,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,' PR140#&Giấy cuộn sản xuất bao bì carton loại nhiều lớp, chưa tráng phủ, định lượng 140 GSM','lô hàng này có phát sinh phí lưu bãi',-3,NULL,NULL,'','HANJIN PORT ADELAIDE 0124W'),(48,259,'SCG-TANACUS0008',12,NULL,-2,170,40.14,0,NULL,NULL,'','','2015-04-09 00:00:00',-1,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Bao bì carton Nike','10 Mã',-4,NULL,NULL,'',''),(49,259,'SCG-TANACUS0009',12,NULL,-2,158,40.52,0,NULL,NULL,'','','2015-04-09 00:00:00',-1,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Bao bì carton Nike','',-4,NULL,NULL,'',''),(50,259,'SCG-TANACUS0010',12,NULL,-2,170,40.41,0,NULL,NULL,'','','2015-04-09 00:00:00',-1,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Bao bì carton Nike','',-4,NULL,NULL,'',''),(51,259,'SCG-TANACUS0011',12,NULL,-2,170,36.63,0,NULL,NULL,'','','2015-04-09 00:00:00',-1,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Bao bì carton Nike','',-4,NULL,NULL,'',''),(52,259,'SCG-TANACUS0012',12,NULL,-2,138,39.55,0,NULL,NULL,'','','2015-04-15 00:00:00',-1,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Bao bì carton Nike','',-4,NULL,NULL,'',''),(53,260,'SCG-VKPCCUS0001',8,NULL,-1,41,70764.00,0,NULL,NULL,'KCN Mỹ Phước 3','',NULL,-1,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Giấy cuộn sản xuất bao bì carton lớp mặt - TEST LINER PAPER, định lượng 140GSM (KS140) làm từ bột giấy, bề rộng khổ giấy từ 1900 mm đến 2200 mm, mới 100%\r\nGiấy cuộn sản xuất bao bì carton lớp mặt - TEST LINER PAPER, định lượng 170GSM (KS170) làm từ bột giấy, bề rộng khổ giấy từ 1700 mm đến 1950 mm, mới 100%','',-3,NULL,NULL,'015E','MOL CONTINUITY'),(54,260,'SCG-VKPCCUS0002',8,NULL,-2,1,1.80,1,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-03-31 00:00:00',90,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Thiết bị mã hóa chuyển động quay trong máy giấy (thiết bị điện tử), model :TRD-J30-RZVW ,mới 100%','',-3,NULL,NULL,'01APR','VN0301'),(55,260,'SCG-VKPCCUS0003',8,NULL,-2,1,88.00,1,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-02 00:00:00',91,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',-3,NULL,NULL,'02APR','CI5235'),(56,260,'SCG-VKPCCUS0004',8,NULL,-1,375,443589.00,0,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-02 00:00:00',86,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Giấy cuộn sản xuất bao bì carton lớp sóng - MEDIUM PAPER, định lượng 105GSM (CAI105) làm từ bột giấy, bề rộng khổ giấy từ 1320 mm đến 1860 mm, mới 100%\r\nGiấy cuộn sản xuất bao bì carton lớp sóng - MEDIUM PAPER, định lượng 185GSM (CAI185) làm từ bột giấy, bề rộng khổ giấy từ 1320 mm đến 1800 mm, mới 100%','7 DET',-3,NULL,NULL,'157N','KUO TAI'),(57,260,'SCG-VKPCCUS0005',8,NULL,-2,1,15.30,1,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-08 00:00:00',92,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',-3,NULL,NULL,'06APR','EY0002'),(58,260,'SCG-VKPCCUS0006',8,NULL,-2,2,745.00,6,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-02 00:00:00',93,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Bạt vải lưới TOP WIRE: FUJI-50XT WSB 3.0L, kích thước 5,950 MM(W) x 25,480MM(L), trọng lượng trên 650g/m2 (dùng trong sản xuất giấy), mới 100%\r\nBạt vải lưới UNDER TOP WIRE: FUJI-30XT WSB 3.0L, kích thước 5,950 MM(W) x 24,300MM(L), trọng lượng trên 650g/m2 (dùng trong sản xuất giấy), mới 100%','',-3,NULL,NULL,'V. A 147N','PENANG BRIDGE'),(59,260,'SCG-VKPCCUS0007',8,NULL,-2,1,5.50,1,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-06 00:00:00',94,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',-3,NULL,NULL,'','FEDEX'),(60,264,'AGI NDVTT0001',-2,NULL,-1,0,0.00,0,NULL,NULL,'BẮC NINH','GÒ DẦU','2015-04-03 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','BẾN NGHÉ','DẦU NHỚT','',NULL,NULL,NULL,'508','BIEN DONG FREIGHTER'),(61,264,'AGI NDVTT0002',-2,NULL,-1,0,0.00,0,NULL,NULL,'BẮC NINH','GÒ DẦU','2015-04-02 00:00:00',43,5,NULL,NULL,NULL,NULL,1,1,'','','','',NULL,NULL,NULL,'9','GPACIFIC GLORIA '),(62,260,'SCG-VKPCCUS0008',8,NULL,-2,3,310.00,1,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-03-31 00:00:00',95,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Bộ cảm biến tốc độ tải than trong lò hơi ( bộ phận của thiết bị đo và điều chỉnh tốc độ trong lò hơi), Model EL40A600S5/28P6S6PR 5-30VDC, mới 100%\r\nBộ cảm ứng điện từ dùng trong lò hơi, Model: 9355K, mới 100%','',-3,NULL,NULL,'V.S002','VAN MANILA '),(63,260,'SCG-VKPCCUS0009',8,NULL,-2,3,406.00,1,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-03-31 00:00:00',96,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Phớt làm kín cơ khí AVS-500, vật liệu: thép không gỉ và cao su, 1 bộ =  1 cái,  mới 100%','',-3,NULL,NULL,'S002','VAN MANILA '),(64,22,'FECON MILTECVTT0001',15,NULL,-1,0,0.00,0,NULL,NULL,'CÁT LÁI','KCN LONG HẬU',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(65,260,'SCG-VKPCCUS0010',8,NULL,-1,242,237090.00,0,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-01 00:00:00',97,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','14 DET\r\n14 DEM + STO',-3,NULL,NULL,'086S','OOCL BUSAN '),(66,260,'SCG-VKPCCUS0011',8,NULL,-2,2,275.00,1,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-09 00:00:00',99,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Lồng sàng bột giấy ,kích thước khe :0.2mm, vật liệu: thép không gỉ ( bộ phận của máy sản xuất giấy), mới 100%','',-3,NULL,NULL,'','CV7405/12APR'),(67,22,'FECON MILTECVTT0002',15,NULL,-1,0,0.00,0,NULL,NULL,'KCN LONG HẬU','CÁT LÁI',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(68,12,'DADUVTT0001',-2,NULL,-1,0,0.00,0,NULL,NULL,'KCN TÂN ĐỨC','CÁT LÁI',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','Hạ Sóng Thần ',NULL,NULL,NULL,NULL,NULL),(69,264,'AGI NDVTT0003',-2,NULL,-1,0,0.00,0,NULL,NULL,'BẮC NINH','GÒ DẦU','2015-04-10 00:00:00',40,5,NULL,NULL,NULL,NULL,1,0,'LOTUS','LOTUS','DẦU NHỚT','',NULL,NULL,NULL,'268','LINER 1'),(70,260,'SCG-VKPCCUS0012',8,NULL,-2,1,3.90,1,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-10 00:00:00',90,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Cảm biến đo áp suất, Model: VLC-50KNG471M2, Nhà SX: VALCOM (Japan), mới 100%','',-3,NULL,NULL,'','VN0301/12APR'),(71,264,'AGI NDVTT0004',-2,NULL,-1,0,0.00,0,NULL,NULL,'BẮC NINH','GÒ DẦU','2015-04-10 00:00:00',40,5,NULL,NULL,NULL,NULL,1,0,'LOTUS','LOTUS','DẦU NHỚT','',NULL,NULL,NULL,'268','LINER 1'),(72,264,'AGI NDVTT0005',-2,NULL,-1,0,0.00,0,NULL,NULL,'BẮC NINH','GÒ DẦU','2015-04-17 00:00:00',38,5,NULL,NULL,NULL,NULL,1,0,'ASACO THỦ ĐƯC','CÁT LÁI','DẦU NHỚT','',NULL,NULL,NULL,'510','BIEN DONG STAR'),(73,264,'AGI NDVTT0006',-2,NULL,-1,0,0.00,0,NULL,NULL,'BẮC NINH','GÒ DẦU','2015-04-17 00:00:00',38,5,NULL,NULL,NULL,NULL,1,0,'BẾN NGHÉ','CÁT LÁI','DẦU NHỚT','',NULL,NULL,NULL,'510','BIEN DONG STAR'),(74,260,'SCG-VKPCCUS0013',8,NULL,-2,1,448.00,1,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-03-30 00:00:00',96,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Bộ đĩa nghiền côn phía trong, kiểu ACD36 (bộ phận của máy nghiền bột cho máy sản xuất giấy), 1 bộ gồm: 1 đĩa tĩnh,1 đĩa động, mới 100%\r\n','',-3,NULL,NULL,'192S','SUMIRE '),(75,25,'GLOBE EXPRESSVTT0001',15,NULL,-1,0,0.00,0,NULL,NULL,'KCN ĐỒNG AN 1','CÁT LÁI',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(76,64,'TICOVTT0001',-2,NULL,-1,0,0.00,0,NULL,NULL,'BÙNG BINH DÂN CHỦ','CÁT LÁI',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(77,19,'DELTAVTT0001',15,NULL,-1,0,0.00,0,NULL,NULL,'VSIP 1','CÁT LÁI',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(78,19,'DELTAVTT0002',15,NULL,-1,0,0.00,0,NULL,NULL,'CÁT LÁI','KCN VĨNH LỘC',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(79,260,'SCG-VKPCCUS0014',8,NULL,-1,542,537750.00,0,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-01 00:00:00',100,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Giấy phế liệu vụn làm nguyên liệu sản xuất (JOCC - RE103070010 WASTE PAPER)','6 DET\r\n6 LIFT ON LEVEL 1',-3,NULL,NULL,'0158S','MOL ATTRACTION '),(80,53,'SONGLONGVTT0001',15,NULL,-1,0,0.00,0,NULL,NULL,'TÔ KÝ','CÁT LÁI',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(81,47,'OTRAN LOGISTICSVTT0001',15,NULL,-1,0,0.00,0,NULL,NULL,'BẮC TÂN UYÊN','CÁT LÁI',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','6350-Hạ trái tuyến Solog\r\n9860-Hạ trái tuyến Solog\r\n4426-Hạ Sóng Thần-Neo xe',NULL,NULL,NULL,NULL,NULL),(82,260,'SCG-VKPCCUS0015',8,NULL,-1,336,73920.00,0,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-08 00:00:00',101,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','6 DET',-3,NULL,NULL,'V-1508','JOANNA '),(83,47,'OTRAN LOGISTICSVTT0002',15,NULL,-1,0,0.00,0,NULL,NULL,'DỐC 47','CÁT LÁI',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(84,47,'OTRAN LOGISTICSVTT0003',15,NULL,-1,0,0.00,0,NULL,NULL,'AN LẠC','CÁT LÁI',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(85,263,'PEB NDVTT0001',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-01 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','BẾN NGHÉ','SẮT HÌNH','',NULL,NULL,NULL,'509','BIEN DONG STAR'),(86,47,'OTRAN LOGISTICSVTT0004',15,NULL,-1,0,0.00,0,NULL,NULL,'LŨY BÁN BÍCH','CÁT LÁI',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(87,263,'PEB NDVTT0002',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-02 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','BẾN NGHÉ','SẮT HÌNH','',NULL,NULL,NULL,'509','BIEN DONG STAR'),(88,263,'PEB NDVTT0003',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-02 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','BẾN NGHÉ','SẮT HÌNH','',NULL,NULL,NULL,'509','BIEN DONG STAR'),(89,263,'PEB NDVTT0004',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-02 00:00:00',37,5,NULL,NULL,NULL,NULL,1,1,'VICT','VICT','SẮT HÌNH','',NULL,NULL,NULL,'1,509','PIONEER'),(90,263,'PEB NDVTT0005',-2,NULL,-1,0,0.00,0,NULL,NULL,'','','2015-04-03 00:00:00',-1,5,NULL,NULL,NULL,NULL,0,0,'','','SẮT HÌNH','',NULL,NULL,NULL,'0',''),(91,263,'PEB NDVTT0006',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-03 00:00:00',42,5,NULL,NULL,NULL,NULL,1,1,'HTN','BẾN','SẮT HÌNH','',NULL,NULL,NULL,'509','BIEN DONG STAR'),(92,263,'PEB NDVTT0007',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-03 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','BẾN NGHÉ','SẮT HÌNH','LƯU CONT 6 NGÀY',NULL,NULL,NULL,'10','HAI AN PARK'),(93,263,'PEB NDVTT0008',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-04 00:00:00',37,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','VICT','SẮT HÌNH','LƯU CONT 6 NGÀY',NULL,NULL,NULL,'1,511','PROPER'),(94,263,'PEB NDVTT0009',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-06 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'VICT','VICT','SẮT HÌNH','LƯU CONT 6 NGÀY',NULL,NULL,NULL,'10','HAI AN PARK'),(95,263,'PEB NDVTT0010',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-06 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','BẾN NGHÉ','SẮT HÌNH','LƯU CONT 2 NGÀY',NULL,NULL,NULL,'508','BIEN DONG FREIGHTER'),(96,263,'PEB NDVTT0011',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-07 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','BẾN NGHÉ','SẮT HÌNH','LƯU CONT 2 NGÀY',NULL,NULL,NULL,'508','BIEN DONG FREIGHTER'),(97,263,'PEB NDVTT0012',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-03-07 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','BẾN NGHÉ','SẮT HÌNH','LƯU CONT 2 NGÀY',NULL,NULL,NULL,'508','BIEN DONG FREIGHTER'),(98,263,'PEB NDVTT0013',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-08 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'VICT','VICT','SẮT HÌNH','LƯU CONT 3 NGÀY',NULL,NULL,NULL,'1,510','PIONEER'),(99,263,'PEB NDVTT0014',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-08 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','BẾN NGHÉ','SẮT HÌNH','LƯU CONT 4 NGÀY',NULL,NULL,NULL,'508','BIEN DONG FREIGHTER'),(100,263,'PEB NDVTT0015',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-09 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','BẾN NGHÉ','SẮT HÌNH','',NULL,NULL,NULL,'508','VAN HUNG'),(101,263,'PEB NDVTT0016',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-09 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','BẾN NGHÉ','SẮT HÌNH','',NULL,NULL,NULL,'508','VAN HUNG'),(102,263,'PEB NDVTT0017',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-10 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','BẾN NGHÉ','SẮT HÌNH`','',NULL,NULL,NULL,'508','VAN HUNG'),(103,263,'PEB NDVTT0018',-2,NULL,-1,0,0.00,0,NULL,NULL,'HƯNG YÊN','ĐÔNG XUYÊN','2015-04-13 00:00:00',38,5,NULL,NULL,NULL,NULL,1,1,'BẾN NGHÉ','BẾN NGHÉ','SẮT HÌNH``','',NULL,NULL,NULL,'508','VAN HUNG'),(104,2,'AGILITY LOGISTICVTT0001',-2,NULL,-1,0,0.00,0,NULL,NULL,'KCN VIỆT HƯƠNG','CÁT LÁI',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','DI LÝ SÓNG THẦN - NEO XE',NULL,NULL,NULL,NULL,NULL),(105,2,'AGILITY LOGISTICVTT0002',-2,NULL,-2,0,0.00,0,NULL,NULL,'MỸ XUÂN','SÂN BAY',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','Xe 1,5T',NULL,NULL,NULL,NULL,NULL),(106,2,'AGILITY LOGISTICVTT0003',-2,NULL,-1,0,0.00,0,NULL,NULL,'TRANSIMEX','CÁT LÁI',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(107,2,'AGILITY LOGISTICVTT0004',-2,NULL,-1,0,0.00,0,NULL,NULL,'NAM TÂN UYÊN','TRANSIMEX',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(108,2,'AGILITY LOGISTICVTT0005',-2,NULL,-2,0,0.00,0,NULL,NULL,'QUẬN 7','LOTUS',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','XE 2,5T',NULL,NULL,NULL,NULL,NULL),(109,2,'AGILITY LOGISTICVTT0006',-2,NULL,-1,0,0.00,0,NULL,NULL,'CÁT LÁI','KCN TÂN BÌNH',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(110,2,'AGILITY LOGISTICVTT0007',-2,NULL,-2,0,0.00,0,NULL,NULL,'CÁT LÁI','NAM TÂN UYÊN',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(111,61,'TCLVTT0001',-2,NULL,-2,0,0.00,0,NULL,NULL,'CÀ MAU','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(112,61,'TCLVTT0002',-2,NULL,-2,0,0.00,0,NULL,NULL,'TP.HCM','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(113,61,'TCLVTT0003',-2,NULL,-2,0,0.00,0,NULL,NULL,'TP.HCM','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(114,61,'TCLVTT0004',-2,NULL,-2,0,0.00,0,NULL,NULL,'BÌNH PHƯỚC','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(115,61,'TCLVTT0005',-2,NULL,-2,0,0.00,0,NULL,NULL,'CÀ MAU','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(116,61,'TCLVTT0006',-2,NULL,-2,0,0.00,0,NULL,NULL,'TP.HCM','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(117,61,'TCLVTT0007',-2,NULL,-2,0,0.00,0,NULL,NULL,'ĐỒNG THÁP','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(118,61,'TCLVTT0008',-2,NULL,-2,0,0.00,0,NULL,NULL,'TP.HCM','BIÊN HÒA ',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(119,61,'TCLVTT0009',-2,NULL,-2,0,0.00,0,NULL,NULL,'TP.HCM','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(120,61,'TCLVTT0010',-2,NULL,-2,0,0.00,0,NULL,NULL,'BÌNH DƯƠNG','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(121,61,'TCLVTT0011',-2,NULL,-2,0,0.00,0,NULL,NULL,'TP.HCM','BIÊN HÒA ',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(122,61,'TCLVTT0012',-2,NULL,-2,0,0.00,0,NULL,NULL,'VŨNG TÀU','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(123,60,'TACVTT0001',-2,NULL,-2,0,0.00,0,NULL,NULL,'CÁT LÁI','TÂN PHÚ',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(124,60,'TACVTT0002',-2,NULL,-2,0,0.00,0,NULL,NULL,'BÌNH TÂN','CÁT LÁI',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(125,260,'SCG-VKPCCUS0016',8,NULL,-2,4,4800.00,10,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-14 00:00:00',103,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Xích băng tải, model: P200F R88 W46, bằng thép, 1 bộ =  6 cái, mới 100%\r\nRay đỡ xích tải, kích thước: 12x75x3000 mm, làm bằng thép ( dùng để đỡ xích tải), bộ phận của băng tải xích, mới 100%','',-3,NULL,NULL,'V.A120N','JAKARTA BRIDGE '),(126,260,'SCG-VKPCCUS0017',8,NULL,-1,1,1350.00,0,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-13 00:00:00',104,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Đầu phun khí JTS 150 ( bộ phận của máy phun khí - dùng trong xử lý nước thải ), mới 100%','',-3,NULL,NULL,'V.1508S','SITC FUJIAN '),(127,260,'SCG-VKPCCUS0018',8,NULL,-2,6,1122.00,1,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-17 00:00:00',96,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Bộ đĩa nghiền dạng phẳng, kiểu AWN38 DDR (bộ phận của máy sản xuất giấy), 1 bộ = 4 cái, mới 100%','',-3,NULL,NULL,' 266 S339','WAN HAI'),(130,260,'SCG-VKPCCUS0019',8,NULL,-2,1,13.80,1,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-18 00:00:00',-1,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Thân bơm, bộ phận của máy bơm màng, mới 100%\r\nNút thông hơi của bơm màng, vật liệu: nhựa, mới 100%\r\nBulông của bơm màng, vật liệu: inox, mới 100%\r\nVan điều khiển bằng khí nén DN20, vật liệu: nhựa, mới 100%','',-3,NULL,NULL,'/14APR','AF0258'),(131,260,'SCG-VKPCCUS0020',8,NULL,-2,4,82.00,1,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-21 00:00:00',105,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'Dao cắt cho phần quay, vật liệu: thép, kích thước: 55 x 55 x 20mm ( dùng để cắt rác trong máy sản xuất giấy), (1 bộ = 120 cái), mới 100%','',-3,NULL,NULL,'/22APR','JL0759'),(132,260,'SCG-VKPCCUS0021',8,NULL,-2,1,4.30,1,NULL,NULL,'KCN MỸ PHƯỚC 3','','2015-04-17 00:00:00',90,0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',-3,NULL,NULL,'/18APR','VN0301'),(133,61,'TCLVTT0013',-2,NULL,-2,0,0.00,0,NULL,NULL,'TP.HCM','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(134,61,'TCLVTT0014',-2,NULL,-2,0,0.00,0,NULL,NULL,'CÀ MAU','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(135,61,'TCLVTT0015',-2,NULL,-2,0,0.00,0,NULL,NULL,'BẾN TRE','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(136,61,'TCLVTT0016',-2,NULL,-2,0,0.00,0,NULL,NULL,'TP.HCM','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(137,61,'TCLVTT0017',-2,NULL,-2,0,0.00,0,NULL,NULL,'TRÀ VINH','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(138,61,'TCLVTT0018',-2,NULL,-2,0,0.00,0,NULL,NULL,'TÂY NINH','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(139,61,'TCLVTT0019',-2,NULL,-2,0,0.00,0,NULL,NULL,'BẠC LIÊU','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(140,61,'TCLVTT0020',-2,NULL,-2,0,0.00,0,NULL,NULL,'TP.HCM','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(141,61,'TCLVTT0021',-2,NULL,-2,0,0.00,0,NULL,NULL,'TP.HCM','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(142,61,'TCLVTT0022',-2,NULL,-2,0,0.00,0,NULL,NULL,'SÓC TRĂNG','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(143,61,'TCLVTT0023',-2,NULL,-2,0,0.00,0,NULL,NULL,'KIÊN GIANG','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(144,61,'TCLVTT0024',-2,NULL,-2,0,0.00,0,NULL,NULL,'BẾN TRE','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(145,61,'TCLVTT0025',-2,NULL,-2,0,0.00,0,NULL,NULL,'CÀ MAU','BIÊN HÒA',NULL,NULL,4,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL),(146,273,'NYEXH0001',NULL,NULL,-2,4,680.00,0,NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,NULL,NULL,1,0,NULL,NULL,'','',-3,NULL,NULL,NULL,NULL),(147,273,'NYEXH0002',NULL,NULL,-2,4,888.00,0,NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,NULL,NULL,0,0,NULL,NULL,'MÁY ','GLOBAL TECH/ ASUMG / FAMZIC/ SMI',-3,NULL,NULL,NULL,NULL),(148,271,'TAC/SINGAPOREEXH0001',NULL,NULL,-1,45,5900.00,0,NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,NULL,NULL,0,0,NULL,NULL,'BÀN ĂN','XUẤT PMD',-4,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exfeetable`
--

LOCK TABLES `exfeetable` WRITE;
/*!40000 ALTER TABLE `exfeetable` DISABLE KEYS */;
INSERT INTO `exfeetable` VALUES (187,313,4900000.00,10.00,NULL,178,55,NULL,NULL,NULL,'',NULL,5390000.00),(188,313,4900000.00,10.00,NULL,178,56,NULL,NULL,NULL,'',NULL,5390000.00),(205,319,6027272.73,10.00,47,-10,NULL,NULL,NULL,NULL,'194533',NULL,6630000.00),(206,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(207,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(209,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(210,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(211,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(212,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(215,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(216,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(217,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(218,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(219,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(220,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(225,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(226,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(227,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(228,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(231,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(232,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(233,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(234,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(235,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(236,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(237,314,12000000.00,10.00,NULL,178,90,NULL,NULL,NULL,'',NULL,13200000.00),(238,313,3900000.00,10.00,NULL,178,91,NULL,NULL,NULL,'',NULL,4290000.00),(239,313,4000000.00,10.00,NULL,178,92,NULL,NULL,NULL,'',NULL,4400000.00),(240,314,12181818.18,10.00,NULL,178,93,NULL,NULL,NULL,'0000105',NULL,13400000.00),(241,313,3900000.00,10.00,NULL,178,94,NULL,NULL,NULL,'',NULL,4290000.00),(242,313,4000000.00,10.00,NULL,178,95,NULL,NULL,NULL,'',NULL,4400000.00),(243,314,11363636.36,10.00,NULL,178,96,NULL,NULL,NULL,'',NULL,12500000.00),(244,313,3900000.00,10.00,NULL,178,97,NULL,NULL,NULL,'',NULL,4290000.00),(245,304,0.00,0.00,NULL,178,98,NULL,NULL,NULL,'',NULL,0.00),(246,314,11363637.00,10.00,NULL,178,99,NULL,NULL,NULL,'',NULL,12500000.70),(247,313,3900000.00,10.00,NULL,178,100,NULL,NULL,NULL,'',NULL,4290000.00),(248,304,0.00,0.00,NULL,178,101,NULL,NULL,NULL,'',NULL,0.00),(249,304,0.00,0.00,NULL,178,102,NULL,NULL,NULL,'',NULL,0.00),(250,304,0.00,0.00,NULL,178,103,NULL,NULL,NULL,'',NULL,0.00),(251,304,0.00,0.00,NULL,178,104,NULL,NULL,NULL,'',NULL,0.00),(252,304,0.00,0.00,NULL,178,105,NULL,NULL,NULL,'',NULL,0.00),(253,304,0.00,0.00,NULL,178,106,NULL,NULL,NULL,'',NULL,0.00),(254,304,0.00,0.00,NULL,178,107,NULL,NULL,NULL,'',NULL,0.00),(255,304,0.00,0.00,NULL,178,108,NULL,NULL,NULL,'',NULL,0.00),(256,304,0.00,0.00,NULL,178,109,NULL,NULL,NULL,'',NULL,0.00),(257,304,0.00,0.00,NULL,178,110,NULL,NULL,NULL,'',NULL,0.00),(258,304,0.00,0.00,NULL,178,111,NULL,NULL,NULL,'',NULL,0.00),(259,304,0.00,0.00,NULL,178,112,NULL,NULL,NULL,'',NULL,0.00),(260,304,0.00,0.00,NULL,178,113,NULL,NULL,NULL,'',NULL,0.00),(261,304,0.00,0.00,NULL,178,114,NULL,NULL,NULL,'',NULL,0.00),(262,304,0.00,0.00,NULL,178,115,NULL,NULL,NULL,'',NULL,0.00),(263,304,0.00,0.00,NULL,178,116,NULL,NULL,NULL,'',NULL,0.00),(268,304,0.00,0.00,NULL,178,121,NULL,NULL,NULL,'',NULL,0.00),(269,304,0.00,0.00,NULL,178,122,NULL,NULL,NULL,'',NULL,0.00),(270,304,0.00,0.00,NULL,178,123,NULL,NULL,NULL,'',NULL,0.00),(271,304,0.00,0.00,NULL,178,124,NULL,NULL,NULL,'',NULL,0.00),(272,304,0.00,0.00,NULL,178,125,NULL,NULL,NULL,'',NULL,0.00),(273,304,0.00,0.00,NULL,178,126,NULL,NULL,NULL,'',NULL,0.00),(274,304,0.00,0.00,NULL,178,127,NULL,NULL,NULL,'',NULL,0.00),(275,304,0.00,0.00,NULL,178,128,NULL,NULL,NULL,'',NULL,0.00),(276,304,0.00,0.00,NULL,178,129,NULL,NULL,NULL,'',NULL,0.00),(277,304,0.00,0.00,NULL,178,130,NULL,NULL,NULL,'',NULL,0.00),(278,304,0.00,0.00,NULL,178,131,NULL,NULL,NULL,'',NULL,0.00),(279,304,0.00,0.00,NULL,178,132,NULL,NULL,NULL,'',NULL,0.00),(280,304,0.00,0.00,NULL,178,133,NULL,NULL,NULL,'',NULL,0.00),(281,304,0.00,0.00,NULL,178,134,NULL,NULL,NULL,'',NULL,0.00),(282,304,0.00,0.00,NULL,178,135,NULL,NULL,NULL,'',NULL,0.00),(283,304,0.00,0.00,NULL,178,136,NULL,NULL,NULL,'',NULL,0.00),(284,304,0.00,0.00,NULL,178,137,NULL,NULL,NULL,'',NULL,0.00),(285,304,0.00,0.00,NULL,178,138,NULL,NULL,NULL,'',NULL,0.00),(286,304,0.00,0.00,NULL,178,139,NULL,NULL,NULL,'',NULL,0.00),(287,304,0.00,0.00,NULL,178,140,NULL,NULL,NULL,'',NULL,0.00),(288,304,0.00,0.00,NULL,178,141,NULL,NULL,NULL,'',NULL,0.00),(289,304,0.00,0.00,NULL,178,142,NULL,NULL,NULL,'',NULL,0.00),(290,304,0.00,0.00,NULL,178,143,NULL,NULL,NULL,'',NULL,0.00),(291,304,0.00,0.00,NULL,178,144,NULL,NULL,NULL,'',NULL,0.00),(292,304,0.00,0.00,NULL,178,145,NULL,NULL,NULL,'',NULL,0.00),(293,304,0.00,0.00,NULL,178,146,NULL,NULL,NULL,'',NULL,0.00),(294,304,0.00,0.00,NULL,178,147,NULL,NULL,NULL,'',NULL,0.00),(295,304,0.00,0.00,NULL,178,148,NULL,NULL,NULL,'',NULL,0.00),(296,304,0.00,0.00,NULL,178,149,NULL,NULL,NULL,'',NULL,0.00),(297,304,0.00,0.00,NULL,178,150,NULL,NULL,NULL,'',NULL,0.00),(298,304,0.00,0.00,NULL,178,151,NULL,NULL,NULL,'',NULL,0.00),(299,304,0.00,0.00,NULL,178,152,NULL,NULL,NULL,'',NULL,0.00),(300,304,0.00,0.00,NULL,178,153,NULL,NULL,NULL,'',NULL,0.00),(301,304,0.00,0.00,NULL,178,154,NULL,NULL,NULL,'',NULL,0.00),(302,304,0.00,0.00,NULL,178,155,NULL,NULL,NULL,'',NULL,0.00),(303,304,0.00,0.00,NULL,178,156,NULL,NULL,NULL,'',NULL,0.00),(304,304,0.00,0.00,NULL,178,157,NULL,NULL,NULL,'',NULL,0.00),(305,304,0.00,0.00,NULL,178,158,NULL,NULL,NULL,'',NULL,0.00),(306,304,0.00,0.00,NULL,178,159,NULL,NULL,NULL,'',NULL,0.00),(307,304,0.00,0.00,NULL,178,160,NULL,NULL,NULL,'',NULL,0.00),(308,304,0.00,0.00,NULL,178,161,NULL,NULL,NULL,'',NULL,0.00),(309,304,0.00,0.00,NULL,178,162,NULL,NULL,NULL,'',NULL,0.00),(310,304,0.00,0.00,NULL,178,163,NULL,NULL,NULL,'',NULL,0.00),(311,304,0.00,0.00,NULL,178,164,NULL,NULL,NULL,'',NULL,0.00),(312,304,0.00,0.00,NULL,178,165,NULL,NULL,NULL,'',NULL,0.00),(313,314,12272727.27,10.00,NULL,178,166,NULL,NULL,NULL,'0002618',NULL,13500000.00),(314,313,4900000.00,10.00,NULL,178,167,NULL,NULL,NULL,'',NULL,5390000.00),(315,304,3600000.00,10.00,NULL,178,168,NULL,NULL,NULL,'',NULL,3960000.00),(316,314,12272727.27,10.00,NULL,178,169,NULL,NULL,NULL,'0002618',NULL,13500000.00),(317,313,3600000.00,10.00,NULL,178,170,NULL,NULL,NULL,'',NULL,3960000.00),(318,313,12272727.27,10.00,NULL,178,171,NULL,NULL,NULL,'0002618',NULL,13500000.00),(319,304,3600000.00,10.00,NULL,178,172,NULL,NULL,NULL,'',NULL,3960000.00),(320,314,13300000.00,10.00,NULL,178,173,NULL,NULL,NULL,'0012984',NULL,14630000.00),(321,313,4900000.00,10.00,NULL,178,174,NULL,NULL,NULL,'',NULL,5390000.00),(322,313,3600000.00,10.00,NULL,178,175,NULL,NULL,NULL,'',NULL,3960000.00),(323,304,0.00,0.00,NULL,178,176,NULL,NULL,NULL,'',NULL,0.00),(324,304,0.00,0.00,NULL,178,177,NULL,NULL,NULL,'',NULL,0.00),(325,304,0.00,0.00,NULL,178,178,NULL,NULL,NULL,'',NULL,0.00),(326,314,12454545.45,10.00,NULL,178,179,NULL,NULL,NULL,'0000698',NULL,13700000.00),(327,313,4900000.00,10.00,NULL,178,180,NULL,NULL,NULL,'',NULL,5390000.00),(328,313,3600000.00,10.00,NULL,178,181,NULL,NULL,NULL,'',NULL,3960000.00),(329,314,12272727.27,10.00,NULL,178,182,NULL,NULL,NULL,'',NULL,13500000.00),(330,313,3600000.00,10.00,NULL,178,183,NULL,NULL,NULL,'',NULL,3960000.00),(331,304,0.00,0.00,NULL,178,184,NULL,NULL,NULL,'',NULL,0.00),(332,304,0.00,0.00,NULL,178,185,NULL,NULL,NULL,'',NULL,0.00),(333,304,0.00,0.00,NULL,178,186,NULL,NULL,NULL,'',NULL,0.00),(334,304,0.00,0.00,NULL,178,187,NULL,NULL,NULL,'',NULL,0.00),(335,304,0.00,0.00,NULL,178,188,NULL,NULL,NULL,'',NULL,0.00),(336,304,0.00,0.00,NULL,178,189,NULL,NULL,NULL,'',NULL,0.00),(337,304,0.00,0.00,NULL,178,190,NULL,NULL,NULL,'',NULL,0.00),(338,304,0.00,0.00,NULL,178,191,NULL,NULL,NULL,'',NULL,0.00),(339,304,0.00,0.00,NULL,178,192,NULL,NULL,NULL,'',NULL,0.00),(340,304,0.00,0.00,NULL,178,193,NULL,NULL,NULL,'',NULL,0.00),(341,314,13300000.00,10.00,NULL,178,194,NULL,NULL,NULL,'0013021',NULL,14630000.00),(342,313,4900000.00,10.00,NULL,178,195,NULL,NULL,NULL,'',NULL,5390000.00),(343,313,3600000.00,10.00,NULL,178,196,NULL,NULL,NULL,'',NULL,3960000.00),(344,304,0.00,0.00,NULL,178,197,NULL,NULL,NULL,'',NULL,0.00),(345,304,0.00,0.00,NULL,178,198,NULL,NULL,NULL,'',NULL,0.00),(346,314,1272728.00,10.00,NULL,178,199,NULL,NULL,NULL,'',NULL,1400000.80),(347,304,NULL,NULL,NULL,178,200,NULL,NULL,NULL,'',NULL,NULL),(348,304,NULL,NULL,NULL,178,201,NULL,NULL,NULL,'',NULL,NULL),(349,304,0.00,0.00,NULL,178,202,NULL,NULL,NULL,'',NULL,0.00),(350,304,0.00,0.00,NULL,178,203,NULL,NULL,NULL,'',NULL,0.00),(351,304,0.00,0.00,NULL,178,204,NULL,NULL,NULL,'',NULL,0.00),(352,304,0.00,0.00,NULL,178,205,NULL,NULL,NULL,'',NULL,0.00),(353,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(354,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(355,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(356,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(357,314,12000000.00,10.00,NULL,178,208,NULL,NULL,NULL,'',NULL,13200000.00),(358,304,NULL,NULL,NULL,178,209,NULL,NULL,NULL,'',NULL,NULL),(359,304,NULL,NULL,NULL,178,210,NULL,NULL,NULL,'',NULL,NULL),(360,314,12000000.00,10.00,NULL,178,211,NULL,NULL,NULL,'',NULL,13200000.00),(361,304,NULL,NULL,NULL,178,212,NULL,NULL,NULL,'',NULL,NULL),(362,304,NULL,NULL,NULL,178,213,NULL,NULL,NULL,'',NULL,NULL),(363,314,12000000.00,10.00,NULL,178,214,NULL,NULL,NULL,'',NULL,13200000.00),(364,304,NULL,NULL,NULL,178,215,NULL,NULL,NULL,'',NULL,NULL),(365,314,13300000.00,10.00,NULL,178,216,NULL,NULL,NULL,'0013070',NULL,14630000.00),(366,304,NULL,NULL,NULL,178,217,NULL,NULL,NULL,'',NULL,NULL),(367,304,0.00,0.00,NULL,178,218,NULL,NULL,NULL,'',NULL,0.00),(368,314,12000000.00,10.00,NULL,178,219,NULL,NULL,NULL,'',NULL,13200000.00),(369,304,NULL,NULL,NULL,178,220,NULL,NULL,NULL,'',NULL,NULL),(370,304,0.00,NULL,NULL,178,221,NULL,NULL,NULL,'',NULL,NULL),(371,304,0.00,0.00,NULL,178,222,NULL,NULL,NULL,'',NULL,0.00),(372,314,12000000.00,10.00,NULL,178,223,NULL,NULL,NULL,'',NULL,13200000.00),(373,304,NULL,NULL,NULL,178,224,NULL,NULL,NULL,'',NULL,NULL),(374,304,0.00,0.00,NULL,178,225,NULL,NULL,NULL,'',NULL,0.00),(375,304,0.00,0.00,NULL,178,226,NULL,NULL,NULL,'',NULL,0.00),(376,304,0.00,0.00,NULL,178,227,NULL,NULL,NULL,'',NULL,0.00),(377,314,12000000.00,10.00,NULL,178,228,NULL,NULL,NULL,'',NULL,13200000.00),(378,304,0.00,0.00,NULL,178,229,NULL,NULL,NULL,'',NULL,0.00),(379,304,0.00,0.00,NULL,178,230,NULL,NULL,NULL,'',NULL,0.00),(380,304,0.00,0.00,NULL,178,231,NULL,NULL,NULL,'',NULL,0.00),(381,304,0.00,0.00,NULL,178,232,NULL,NULL,NULL,'',NULL,0.00),(382,314,12000000.00,10.00,NULL,178,233,NULL,NULL,NULL,'',NULL,13200000.00),(383,304,0.00,0.00,NULL,178,234,NULL,NULL,NULL,'',NULL,0.00),(384,304,0.00,0.00,NULL,178,235,NULL,NULL,NULL,'',NULL,0.00),(385,304,0.00,0.00,NULL,178,236,NULL,NULL,NULL,'',NULL,0.00),(386,314,12000000.00,10.00,NULL,178,237,NULL,NULL,NULL,'',NULL,13200000.00),(387,304,0.00,NULL,NULL,178,238,NULL,NULL,NULL,'',NULL,NULL),(388,304,0.00,0.00,NULL,178,239,NULL,NULL,NULL,'',NULL,0.00),(392,304,0.00,0.00,NULL,178,243,NULL,NULL,NULL,'',NULL,0.00),(393,304,NULL,NULL,NULL,178,244,NULL,NULL,NULL,'',NULL,NULL),(394,304,NULL,NULL,NULL,178,245,NULL,NULL,NULL,'',NULL,NULL),(395,304,0.00,0.00,NULL,178,246,NULL,NULL,NULL,'',NULL,0.00),(396,304,0.00,0.00,NULL,178,247,NULL,NULL,NULL,'',NULL,0.00),(397,304,0.00,0.00,NULL,178,248,NULL,NULL,NULL,'',NULL,0.00),(398,304,0.00,0.00,NULL,178,249,NULL,NULL,NULL,'',NULL,0.00),(401,304,0.00,0.00,NULL,178,252,NULL,NULL,NULL,'',NULL,0.00),(403,304,0.00,0.00,NULL,178,254,NULL,NULL,NULL,'',NULL,0.00),(405,304,0.00,0.00,NULL,178,256,NULL,NULL,NULL,'',NULL,0.00),(406,304,0.00,0.00,NULL,178,257,NULL,NULL,NULL,'',NULL,0.00),(411,319,354545.45,10.00,NULL,-10,55,NULL,NULL,NULL,'0000317',NULL,390000.00),(412,318,440909.09,10.00,NULL,178,55,NULL,NULL,NULL,'0082724',NULL,485000.00),(413,318,354545.45,10.00,NULL,-10,56,NULL,NULL,NULL,'0000366',NULL,390000.00),(414,319,440909.09,10.00,NULL,-10,56,NULL,NULL,NULL,'0083999',NULL,485000.00),(415,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(416,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(417,313,4900000.00,10.00,NULL,178,259,NULL,NULL,NULL,'123366',NULL,5390000.00),(418,319,400000.00,10.00,NULL,-10,259,NULL,NULL,NULL,'256985',NULL,440000.00),(419,318,4400000.00,10.00,NULL,-10,259,NULL,NULL,NULL,'266885',NULL,4840000.00),(420,325,1596500.00,0.00,47,-10,NULL,NULL,NULL,NULL,'38597',NULL,1596500.00),(421,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(422,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(423,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(424,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(427,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(428,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(429,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(430,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(431,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),(432,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL),(433,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibition`
--

LOCK TABLES `exhibition` WRITE;
/*!40000 ALTER TABLE `exhibition` DISABLE KEYS */;
INSERT INTO `exhibition` VALUES (1,146,'COSMO BEAUTE VIETNAM 2015','SCSC',206,'2015-04-09 00:00:00','2015-04-11 00:00:00','2015-04-08 00:00:00','A1','E01',348,NULL,'2015-03-18 00:00:00','BUSAN','CÁT LÁI','','',NULL,136,-2,-2,'2015-04-25 16:39:25','2015-04-25 00:00:00',1,1,1,1,1,1,0,'ULSSGN15020058',1,NULL,NULL,NULL,NULL),(2,147,'COSMO BEAUTE VIETNAM 2015','SCSC',209,'2015-04-09 00:00:00','2015-04-11 00:00:00','2015-04-08 00:00:00','','',348,NULL,'2015-03-18 00:00:00','','','','',NULL,136,-2,-2,'2015-04-25 16:39:48','2015-04-25 00:00:00',1,1,1,0,1,1,0,'',2,NULL,NULL,NULL,NULL),(3,148,'IFFS 2015','SINGAPORE',207,'2015-03-13 00:00:00','2015-03-16 00:00:00','2015-03-12 00:00:00','','',348,NULL,NULL,'CAT LAI','SINGAPORE','','',NULL,136,-2,-2,'2015-04-25 16:48:13','2015-04-25 00:00:00',0,0,0,0,0,0,0,'',1,NULL,NULL,NULL,NULL);
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
  `etd` datetime DEFAULT NULL,
  `eta` datetime DEFAULT NULL,
  `freeTimeInHCM` int(10) DEFAULT NULL,
  `freeTimeInHP` int(10) DEFAULT NULL,
  `attachServices` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeOfInland_idx` (`typeOfInland`),
  KEY `toCreator_idx` (`creator`),
  KEY `inlandToGeneral_idx` (`docsgeneral`),
  KEY `routeToConf_idx` (`route`),
  CONSTRAINT `inlandToGeneral` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `routeToConf` FOREIGN KEY (`route`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toCreator` FOREIGN KEY (`creator`) REFERENCES `app_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `typeOfInland` FOREIGN KEY (`typeOfInland`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inland`
--

LOCK TABLES `inland` WRITE;
/*!40000 ALTER TABLE `inland` DISABLE KEYS */;
INSERT INTO `inland` VALUES (4,200,'2015-04-22 09:23:11','2015-04-22 00:00:00',14,14,33,1,NULL,'','',NULL,NULL,'2015-04-03 00:00:00',NULL,1,NULL,NULL,NULL,NULL,NULL,''),(5,NULL,'2015-04-25 12:18:39','2015-04-22 00:00:00',16,16,34,1,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-12 00:00:00','2015-04-15 00:00:00',0,5,''),(6,200,'2015-04-22 11:00:52','2015-04-22 11:00:52',14,14,35,2,NULL,'','',NULL,NULL,'0015-04-03 00:00:00',NULL,1,NULL,NULL,NULL,NULL,NULL,''),(7,NULL,'2015-04-24 09:59:59','2015-04-22 00:00:00',16,16,36,2,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-13 00:00:00','2015-04-17 00:00:00',0,5,''),(8,NULL,'2015-04-24 11:08:08','2015-04-22 00:00:00',16,14,37,3,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-07 00:00:00','2015-04-10 00:00:00',0,5,''),(9,NULL,'2015-04-22 16:16:01','2015-04-22 00:00:00',16,16,38,4,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-07 00:00:00','2015-04-10 00:00:00',0,5,''),(10,NULL,'2015-04-22 16:47:40','2015-04-22 16:47:40',16,16,42,5,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-07 00:00:00','2015-04-10 00:00:00',0,5,''),(11,NULL,'2015-04-22 16:51:52','2015-04-22 16:51:52',16,16,45,6,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-05 00:00:00','2015-04-09 00:00:00',0,5,''),(12,NULL,'2015-04-24 10:20:18','2015-04-24 10:20:18',16,16,60,1,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-12 00:00:00','2015-04-15 00:00:00',0,5,''),(13,NULL,'2015-04-24 10:22:17','2015-04-24 10:22:17',16,16,61,2,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-13 00:00:00','2015-04-17 00:00:00',0,5,''),(14,200,'2015-04-24 11:23:10','2015-04-24 00:00:00',15,15,64,1,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(15,201,'2015-04-24 11:23:30','2015-04-24 00:00:00',15,15,67,2,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(16,201,'2015-04-24 11:05:19','2015-04-24 11:05:19',15,15,68,1,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(17,NULL,'2015-04-24 11:07:41','2015-04-24 11:07:41',16,16,69,3,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-20 00:00:00','2015-04-25 00:00:00',0,5,''),(18,NULL,'2015-04-24 11:09:19','2015-04-24 11:09:19',16,16,71,4,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-20 00:00:00','2015-04-25 00:00:00',0,5,''),(19,NULL,'2015-04-24 11:11:14','2015-04-24 11:11:14',16,16,72,5,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-23 00:00:00',NULL,0,5,''),(20,NULL,'2015-04-24 11:12:56','2015-04-24 11:12:56',16,16,73,6,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-23 00:00:00',NULL,0,5,''),(21,201,'2015-04-24 11:14:42','2015-04-24 00:00:00',15,15,75,1,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(22,201,'2015-04-24 11:15:45','2015-04-24 11:15:45',15,15,76,1,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(23,201,'2015-04-24 11:16:54','2015-04-24 11:16:54',15,15,77,1,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(24,200,'2015-04-24 11:20:11','2015-04-24 00:00:00',15,15,78,2,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(25,200,'2015-04-24 11:22:40','2015-04-24 11:22:40',15,15,80,1,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(26,201,'2015-04-24 11:28:03','2015-04-24 11:28:03',15,15,81,1,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(27,201,'2015-04-24 11:40:12','2015-04-24 00:00:00',15,15,83,2,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(28,201,'2015-04-24 11:42:11','2015-04-24 11:42:11',15,15,84,3,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(29,NULL,'2015-04-24 11:42:40','2015-04-24 11:42:40',16,16,85,1,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-07 00:00:00','2015-04-10 00:00:00',0,5,''),(30,201,'2015-04-24 14:19:07','2015-04-24 00:00:00',15,-2,86,4,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(31,NULL,'2015-04-24 11:44:20','2015-04-24 11:44:20',16,16,87,2,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-07 00:00:00','2015-04-10 00:00:00',0,5,''),(32,NULL,'2015-04-24 11:47:31','2015-04-24 11:47:31',16,16,88,3,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-07 00:00:00','2015-04-10 00:00:00',0,5,''),(33,NULL,'2015-04-24 11:49:05','2015-04-24 11:49:05',16,16,89,4,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-05 00:00:00','2015-04-09 00:00:00',0,5,''),(34,NULL,'2015-04-24 11:50:02','2015-04-24 11:50:02',16,16,90,5,NULL,'',NULL,NULL,NULL,NULL,NULL,0,203,'2015-04-08 00:00:00','2015-04-10 00:00:00',0,0,''),(35,NULL,'2015-04-24 11:54:55','2015-04-24 11:54:55',16,16,91,6,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-08 00:00:00','2015-04-10 00:00:00',0,5,''),(36,NULL,'2015-04-24 11:56:48','2015-04-24 11:56:48',16,16,92,7,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-09 00:00:00','2015-04-12 00:00:00',0,5,''),(37,NULL,'2015-04-24 11:58:34','2015-04-24 11:58:34',16,16,93,8,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-08 00:00:00','2015-04-11 00:00:00',0,5,''),(38,NULL,'2015-04-24 13:11:04','2015-04-24 00:00:00',16,16,94,9,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-09 00:00:00','2015-04-12 00:00:00',0,5,''),(39,NULL,'2015-04-24 13:13:22','2015-04-24 13:13:22',16,16,95,10,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-12 00:00:00','2015-04-15 00:00:00',0,5,''),(40,NULL,'2015-04-24 13:16:10','2015-04-24 13:16:10',16,16,96,11,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-12 00:00:00','2015-04-15 00:00:00',0,5,''),(41,NULL,'2015-04-24 13:18:12','2015-04-24 13:18:12',16,16,97,12,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-13 00:00:00','2015-04-15 00:00:00',0,5,''),(42,NULL,'2015-04-24 13:20:13','2015-04-24 13:20:13',16,16,98,13,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-13 00:00:00','2015-04-16 00:00:00',0,5,''),(43,NULL,'2015-04-24 13:21:56','2015-04-24 13:21:56',16,16,99,14,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-12 00:00:00','2015-04-15 00:00:00',0,5,''),(44,NULL,'2015-04-24 13:25:45','2015-04-24 13:25:45',16,16,100,15,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-16 00:00:00','2015-04-19 00:00:00',0,5,''),(45,NULL,'2015-04-24 13:29:05','2015-04-24 13:29:05',16,16,101,16,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-16 00:00:00','2015-04-19 00:00:00',0,5,''),(46,NULL,'2015-04-24 13:31:48','2015-04-24 00:00:00',16,16,102,17,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-16 00:00:00','2015-04-19 00:00:00',0,5,''),(47,NULL,'2015-04-24 13:34:34','2015-04-24 00:00:00',16,16,103,18,NULL,'',NULL,NULL,NULL,NULL,NULL,0,204,'2015-04-16 00:00:00','2015-04-19 00:00:00',0,5,''),(48,201,'2015-04-24 14:33:14','2015-04-24 14:33:14',-2,-2,104,1,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(49,201,'2015-04-24 14:37:34','2015-04-24 00:00:00',-2,-2,105,2,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(50,202,'2015-04-24 14:37:13','2015-04-24 14:37:13',-2,-2,106,3,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(51,202,'2015-04-24 14:44:11','2015-04-24 00:00:00',-2,-2,107,4,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(52,202,'2015-04-24 14:41:22','2015-04-24 14:41:22',-2,-2,108,5,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(53,202,'2015-04-24 14:42:33','2015-04-24 14:42:33',-2,-2,109,6,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(54,202,'2015-04-24 14:43:09','2015-04-24 14:43:09',-2,-2,110,7,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(55,202,'2015-04-25 11:58:18','2015-04-24 00:00:00',-2,15,111,1,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(56,202,'2015-04-25 11:58:45','2015-04-24 00:00:00',-2,15,112,2,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(57,202,'2015-04-25 11:59:13','2015-04-24 00:00:00',-2,15,113,3,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(58,202,'2015-04-25 12:00:11','2015-04-24 00:00:00',-2,15,114,4,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(59,202,'2015-04-25 12:00:29','2015-04-24 00:00:00',-2,15,115,5,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(60,202,'2015-04-25 12:02:06','2015-04-24 00:00:00',-2,15,116,6,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(61,202,'2015-04-25 12:03:08','2015-04-24 00:00:00',-2,15,117,7,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(62,202,'2015-04-25 12:03:35','2015-04-24 00:00:00',-2,15,118,8,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(63,202,'2015-04-25 12:03:56','2015-04-24 00:00:00',-2,15,119,9,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(64,202,'2015-04-25 12:04:13','2015-04-24 00:00:00',-2,15,120,10,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(65,202,'2015-04-25 12:04:35','2015-04-24 00:00:00',-2,15,121,11,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(66,202,'2015-04-25 12:05:51','2015-04-24 00:00:00',-2,15,122,12,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(67,200,'2015-04-24 15:32:45','2015-04-24 15:32:45',-2,-2,123,1,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(68,202,'2015-04-24 15:33:10','2015-04-24 15:33:10',-2,-2,124,2,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(69,202,'2015-04-25 12:10:46','2015-04-25 00:00:00',15,15,133,13,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(70,202,'2015-04-25 12:10:57','2015-04-25 00:00:00',15,15,134,14,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(71,202,'2015-04-25 12:11:09','2015-04-25 00:00:00',15,15,135,15,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(72,202,'2015-04-25 12:11:21','2015-04-25 00:00:00',15,15,136,16,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(73,202,'2015-04-25 12:11:32','2015-04-25 00:00:00',15,15,137,17,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(74,202,'2015-04-25 12:11:45','2015-04-25 00:00:00',15,15,138,18,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(75,202,'2015-04-25 12:11:57','2015-04-25 00:00:00',15,15,139,19,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(76,202,'2015-04-25 12:12:17','2015-04-25 00:00:00',15,15,140,20,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(77,202,'2015-04-25 12:12:55','2015-04-25 00:00:00',15,15,141,21,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(78,202,'2015-04-25 12:13:27','2015-04-25 00:00:00',15,15,142,22,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(79,202,'2015-04-25 12:13:38','2015-04-25 00:00:00',15,15,143,23,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(80,202,'2015-04-25 12:13:51','2015-04-25 00:00:00',15,15,144,24,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,''),(81,202,'2015-04-25 12:14:05','2015-04-25 00:00:00',15,15,145,25,NULL,'','',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `info` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhathau`
--

LOCK TABLES `nhathau` WRITE;
/*!40000 ALTER TABLE `nhathau` DISABLE KEYS */;
INSERT INTO `nhathau` VALUES (-1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(1,'0915640077 Mr  Hùng','An Hòa',NULL,'',0,'Địa chỉ: A26/17B Ấp 1, Xã Bình Hưng, Huyện Bì','ANHOA',''),(2,'0912.146839 Mr Hòa','AN LONG TRƯỜNG',NULL,'',0,'','TAI_ALT','CTY CP AN LONG TRƯỜNG MST 03010271497'),(3,'','ANH LINH',NULL,'',0,'','TAI_ALINH','XE MỒ CÔI - ANH  LINH'),(4,'0919518468 Mr Nam','ANH NAM',NULL,'',0,'','TAI_ANAM','XE MỒ CÔI - ANH NAM'),(5,'0917192206 Mr Vương','ANH VƯƠNG',NULL,'',0,'','TAI_AVUONG','XE MỒ CÔI - ANH VUONG'),(6,'0904 204 234 Mr Thao','BÌNH MINH',NULL,'',0,'Số 414 Lê Thánh Tông,P. Máy Chai,Q.Ngô Quy','BINHMINH','CTY CP VẬT TƯ CÔNG NGHIỆP BÌNH MINH MST 0200763993'),(7,'','CẨM HẠNH',NULL,'',0,' 998 Ấp Tường Huệ xã Trường Tây Huyện Hòa Thà','CAMHANH','DOANH NGHIỆP TƯ NHÂN CẨM HẠNH MST 3900313219'),(8,'0906.369.499 Mr Thương','ĐÔNG NGÀN',NULL,'',0,'51 Ngô Gia Tự, P.2, Q.10, TP. HCM','DONGNGAN','CTY TNHH SX TM DV ĐÔNG NGÀN MST 0303417956'),(9,'0909.919.667 Mr Đông','ĐÔNG TÚ',NULL,'',0,'672 Điện Biên Phủ, P.22, Q. Bình Thạnh, TP.HC','DONGTU','CTY TNHH - VT ĐÔNG TÚ MST 0307412162'),(10,'0938.29.57.67 Mrs Thủy','ĐỨC TRUYỀN',NULL,'',0,'13 Hồ Bá Phấn, KP4, P. Phước Long A, Q.9, TP.','DUCTRUYEN','CTY TNHH TM DV VẬN TẢI ĐỨC TRUYỀN MST 0311812124'),(11,'0918.369.159 Mr Hoàng','HOÀNG KHANH',NULL,'',0,'','HOANGKHANH',''),(12,'0908.21.21.36 Mr Toán','HỒNG TOÁN',NULL,'',0,'15 đường số 6A,  Phường phước bình, Q.9, TP. ','HONGTOAN','CTY TNHH TM DV VẬN TẢI HỒNG TOÁN MST 0305605264'),(13,'0984.70.14.15 Mr Toàn','ITL',NULL,'',0,'52-54-56 Trường Sơn, P.2, Q. Bình Thạnh, TP. ','ITL','CTY CP GIAO NHẬN VÀ VẬN CHUYỂN IN DO TRẦN MST 0301909173'),(14,'0908200200 Mr Cường','KIEN CUONG',NULL,'',0,'','CAU_KIENCUONG',''),(15,'0903728551 Mr Vinh','LÂM VINH',NULL,'',0,' 448B Nguyễn Tất Thành, Phường 14, Quận 4, Tp','LAMVINH','CTY TNHH VẬN TẢI LÂM VINH MST 0909988360'),(16,'0914.052.488 Mr Nhật','LONG PHÚ',NULL,'',0,'','LONGPHU','CTY TNHH TM DV VẬN TẢI LONG PHÚ MST 0311947409'),(17,'0903.807.491Mr Nghĩa','MINH NGHĨA',NULL,'',0,'','CAU_MINHNGHIA',''),(18,'0914.722.246 Mr Sơn','NAM LONG',NULL,'',0,'Phòng 301, Số 33 Lê Quốc Hưng, P.12, Q.4, TP.','NAMLONG','CTY TNHH GIẢI PHÁP VẬN CHUYỂN NAM LONG MST 0311857799'),(19,'0903 704 837 Mr Báu','NGỌC BÁU',NULL,'',0,'','NGOCBAU',''),(20,'0919.17.17.13 A THUAN','NGỌC PHÚ',NULL,'',0,'143/3D Ung Văn Khiêm, P.25, Q. Bình Thạnh, TP','NGOCPHU','CTY TNHH VẬN TẢI NGỌC PHÚ MST 0308982214'),(21,'0913.856667 A Thịnh','PHÚ MỸ',NULL,'',0,'','PHUMY',''),(22,'0904.867.869 Mr Duy','PHƯƠNG LÂM',NULL,'',0,'137 Bình Kiều 2, P. Đông Hải 2, Q. Hải An, TP','PHUONGLAM','CTY CP VẬN TẢI THƯƠNG MẠI PHƯƠNG LÂM MST 0200744976'),(23,'0909576486  A Phương','PHƯƠNG NHUNG',NULL,'',0,'','PHUONGNHUNG',''),(24,'0906396289 Mr Ẩn','QUỐC NGHĨA',NULL,'',0,'39/20B KB Đông Chiêu, P. Tân Đông Hiệp, TX. D','QUOCNGHIA','CTY TNHH MTV VẬN TẢI QUỐC NGHĨA MST 3702070606'),(25,' 0989847879 Mr Phương','SONG HÀ',NULL,'',0,' 11Đường D3, Phường 25, Quận Bình Thạnh, HCM','SONGHA','CÔNG TY TNHH DỊCH VỤ VẬN TẢI SONG HÀ'),(26,'','SONG LONG',NULL,'',0,'867A Lê Văn Lương - Xã Nhơn Đức - Huyện Nhà B','SONGLONG','CTY TNHH VẬN TẢI XUẤT KHẨU SONG LONG MST 0312864573'),(27,'0916.699.634 Mr Tùng','TAM ',NULL,'',0,'649/40 Điện Biên Phủ, P.25, Q.Bình Thạnh, TP.','TAM','CTY TNHH GIAO NHẬN VẬN TẢI T.A.M MST 0310906475'),(28,'0937.331.078 Ms Vân','THUẬN HIẾU',NULL,'',0,'','THUANHIEU',''),(29,'0982442522 Mr Hùng','THUẬN PHONG',NULL,'',0,'','THUANPHONG','CTY CP GIAO NHẬN VẬN TẢI THUẬN PHONG MST 0312038383'),(30,'0902731711 Mr Bình','TRẦN BÌNH',NULL,'',0,'286 đường 10, KP. 5, P. Phước Bình, Q.9, TP.H','TAI_TRANBINH','\nCÔNG TY TNHH GIAO NHẬN VẬN TẢI TRẦN BÌNH'),(31,'0907.082.069 Mr Nghĩa','TRUNG NGHĨA',NULL,'',0,'Thôn 6, Do nha, Tân Tiến, An Dương, Hải Phòng','TRUNGNGHIA','CTY TNHH TM VÀ DỊCH VỤ VẬN TẢI TRUNG NGHĨA MST 0200781872'),(32,'','TRUNG VIỆT',NULL,'',0,'','TRUNGVIET',''),(33,'0918.066.764 Mr Nghĩa','TRUONG LOI',NULL,'',0,'1051/41/21 Hậu Giang, Phường 11, Quận 6, TP.H','TRUONGLOI','CTY TNHH DỊCH VỤ VẬN TẢI TRƯỞNG LỢI MST 03039911960'),(34,'0983.188.233 Mr Hùng','V & T',NULL,'',0,'39/23 Đoạn Xá, P. Đông Hải 1, Q. Hải An, Hải ','V&T','CTY CỔ PHẨN V&T'),(35,'0906368177 Mr Hải','VINATRA',NULL,'',0,'','VINATRA','XE MỒ CÔI'),(36,'0902791618 Mr Phòng','TiẾP VẬN MiỀN TRUNG',NULL,'',0,'Tầng 5 tòa nhà TD Business Center- Lô 20A, Lê','TVMT','CÔNG TY CỔ PHẦN KHOÁNG SẢN & TiẾP VẬN MiỀN TRUNG'),(37,'','VSICO',NULL,'',1,'0905.765.324 Ms Luyến','HT_ VSICO','CÔNG TY CỔ PHẦN HÀNG HẢI VSICO'),(38,'','BÌNH MINH',NULL,'',1,'0917.835.837 Mr Thanh','HT_ BINH MINH','CÔNG TY CP ĐẦU TƯ & VẬN TẢI BiỂN BÌNH MINH'),(39,'','COLLYER',NULL,'',1,'0986.238.995/ 0908.176.081 Mr Thiện or Mr Hùn','HT_ COLLYER','CÔNG TY TNHH VẬN TẢI BiỂN ĐỒNG SỰ THANH NIÊN PHƯƠNG ĐÔNG '),(40,'','THẮNG LỢI',NULL,'',1,'0949.828.430 Ms Hằng','HT_ THANG LOI','CÔNG TY TNHH VẬN TẢI BiỂN THẮNG LỢI'),(41,'','VIỄN ĐÔNG',NULL,'',1,'0908.502.804 Ms Lan','HT_ VIEN DONG','CÔNG TY CỔ PHẦN ĐẦU TƯ HÀNG HẢI ViỂN ĐÔNG'),(42,'','VGP',NULL,'',1,'0906.676.117 Ms Diễm','HT_ VGP','CÔNG TY CỔ PHẦN CẢNG RAU QuẢ'),(43,'','SCL',NULL,'',1,'0919.195.375 Ms Ánh','HT_SCL','CÔNG TY TNHH TIÊP VẬN SCL'),(44,'','VINALINE',NULL,'',1,'0908.370.376 Mr Đông','HT_VINALINE','CONG TY VAN TAI BIEN VINALINES'),(84,'contactName','name',NULL,'taxNo',0,'address','code','info'),(85,'','CÔNG TY ĐỨC VIỆT','08 39 48 72 69 ','',1,'30 Phan Thúc Duyệt, P.4, Q.Tân Bình, HCM','DUC VIET',''),(86,'','Công Ty TNHH Vận Tải M.C.C','35203518','',1,'28 Phùng Khắc Khoan, P. Đa Kao, Q. 1, TP.HCM','MCC',''),(87,'','Công Ty Tnhh Kintetsu World Express Việt Nam','38488845','',1,'51 Yên Thế, Phường 2, Quận Tân Bình, TP.HCM','KINTETSU',''),(88,'','Công ty TNHH Chuyển phát nhanh DHL','3844 6203','',1,'6 Thăng Long, Tân Bình, Thành phố Hồ Chí Minh','DHL',''),(89,'','Công Ty Liên Doanh Đại Lý Vận Tải Evergreen (Việt Nam)','39912629','',1,'2 Huỳnh Văn Bánh, P.11, Q.Phú Nhuận, TP.HCM','EVERGREEN',''),(90,'','NNR GLOBAL LOGISTICS VIETNAM CO., LTD','','',1,'','',''),(91,'','YUSEN LOGISTICS (VIETNAM) CO., LTD','','',1,'','',''),(92,'','DACHSER','','',1,'','',''),(93,'','LOGITEM VIETNAM CORP','','',1,'','',''),(94,'','FEDEX','','',1,'','',''),(95,'','DOLPHIN','','',1,'','',''),(96,'','KHAI MINH GLOBAL CO., LTD','','',1,'','',''),(97,'','OOCL','','',1,'','',''),(98,'','CÔNG TY TNHH THƯƠNG MẠI & DỊCH VỤ AEL','08.62581123','0310793207',0,'308/18 Bình Lợi, P.13, Q. Bình Thạnh, TP.HCM','AEL','LOGISTICS'),(99,'','PANALPINA','','',1,'','',''),(100,'','MITSUI O.S.K LINE','','',1,'','',''),(101,'','TRANS VAN LINKS VIETNAM TRANSPORT','','',1,'','',''),(102,'NGUYÊN VĂN THÚY - 0903815740','Hoàng Nguyễn','08-38911422','0303697936',0,'2222 QL1A - P.TÂN CHÁNH HIỆP - QUẬN 12','HOANG NGUYEN',''),(103,'','VINASTAR GLOBAL','','',1,'','',''),(104,'','THAMI SHIPPING & AIRFREIGHT CORP','','',1,'','',''),(105,'','K LINE','','',1,'','',''),(106,'','DHL CO., LTD','0862581129','',1,'178-188 Great South West Road','',''),(107,'','KHẢI MINH','0839971569','',1,'3F SOVILACO, 01 PHỔ QUANG, TÂN BÌNH, HCM','KMG',''),(108,'','J CONSOL LINE','','',1,'','JCL','');
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
  `closingPlace` varchar(255) DEFAULT NULL,
  `bookingNo` varchar(255) DEFAULT NULL,
  `contNo` varchar(255) DEFAULT NULL,
  `sochuyen` int(10) DEFAULT NULL,
  `dateRevOrgDoc` datetime DEFAULT NULL,
  `dateRevOrgTax` datetime DEFAULT NULL,
  `dateFinCustom` datetime DEFAULT NULL,
  `dateSend` datetime DEFAULT NULL,
  `dateActualDev` datetime DEFAULT NULL,
  `dateStartECus` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packageinfo`
--

LOCK TABLES `packageinfo` WRITE;
/*!40000 ALTER TABLE `packageinfo` DISABLE KEYS */;
INSERT INTO `packageinfo` VALUES (20,'BHS CORRUGATED MACHINEN-UND',-5,'CONG TY TNHH SCG TRADING VIETNAM','4449000588','202933',NULL,'S15020256',NULL,'2015-04-04 00:00:00','HAMBURG','CÁT LÁI',0,0,'KHO 3','100361476500','2015-04-10 00:00:00',166,129,1,1,1,1,1,1,1,1,1,1,12,12,'2015-04-22 16:17:23','2015-04-22 00:00:00',39,1,98,'2015-02-27 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'SIAM KRAFT INDUSTRY CO., LTD',-5,'CONG TY TNHH SCG TRADING VIETNAM','7985572','176870229',NULL,'MCC743819',NULL,'2015-04-03 00:00:00','LAEM CHABANG','CAT LAI',14,0,'','100355747330','2015-04-06 00:00:00',165,129,1,1,1,1,1,1,1,1,1,1,12,12,'2015-04-22 16:33:40','2015-04-22 00:00:00',40,2,102,'2015-03-31 00:00:00',NULL,NULL,'','','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'RENGO CO., LTD',-5,'CONG TY TNHH SCG TRADING VIETNAM','NAI2015.2-4','NAI2015.2-4',NULL,'010241930283',NULL,'2015-04-07 00:00:00','TOKYO','CAT LAI',14,14,'','100357414950','2015-04-07 00:00:00',165,129,1,1,1,1,1,1,0,1,0,1,12,12,'2015-04-22 16:39:04','2015-04-22 16:39:04',41,3,99,'2015-02-28 00:00:00',NULL,NULL,'','','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'RENGO CO., LTD',-5,'CONG TY TNHH SCG TRADING VIETNAM','NAI2015.2-5','NAI2015.2-5',NULL,'010241930272',NULL,'2015-04-16 00:00:00','TOKYO','CAT LAI',14,14,'','100365466500','2015-04-11 00:00:00',165,129,1,1,1,1,1,1,0,1,0,1,12,12,'2015-04-22 16:48:08','2015-04-22 16:48:08',43,4,99,'2015-04-04 00:00:00',NULL,NULL,'','','5',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'MARQUIP WARD UNITED',105,'CONG TY TNHH SCG TRADING VIETNAM','4449000739','398831',NULL,'68 9036 1166',NULL,'2015-04-07 00:00:00','SINGAPORE','TÂN SƠN NHẤT',0,0,'DHL','100361012140','2015-04-10 00:00:00',166,129,1,1,1,1,0,1,1,1,1,1,12,12,'2015-04-22 16:53:13','2015-04-22 00:00:00',44,5,102,'2015-04-06 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'MARQUIP WARD UNITED',105,'CONG TY TNHH SCG TRADING VIETNAM','4449000741','398832',NULL,'79 8002 3074',NULL,'2015-04-03 00:00:00','SINGAPORE','TÂN SƠN NHẤT',0,0,'DHL','100361013800','2015-04-10 00:00:00',164,129,1,1,1,1,1,1,1,1,0,1,12,12,'2015-04-22 17:01:26','2015-04-22 17:01:26',46,6,102,'2015-04-01 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'KWOK FUNG (SINO H.K.) ENTERPRISE LTD',-5,'CONG TY TNHH SCG TRADING VIETNAM','KF25567','KF53873',NULL,'EGLV 149500933421',NULL,'2015-04-19 00:00:00','SHEKOU','CAT LAI',21,0,'','100376275310','2015-04-22 00:00:00',164,129,1,1,1,1,1,1,0,1,0,1,12,18,'2015-04-25 09:06:26','2015-04-22 00:00:00',47,7,99,'2015-04-16 00:00:00',NULL,NULL,'','','13',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'CONG TY TNHH SCG TRADING VIETNAM',286,'OIA GLOBAL LOGISTICS SCM, INC','127522','0000051',NULL,'','2015-04-14 00:00:00',NULL,'Kho Tân Á','KNQ Tiếp vận Thành Long',0,0,'','300353064710','2015-04-10 00:00:00',164,129,1,1,1,1,1,0,0,1,0,1,12,12,'2015-04-23 11:50:03','2015-04-23 00:00:00',48,8,101,NULL,NULL,NULL,'KNQ Tiếp vận Thành Long','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'CONG TY TNHH SCG TRADING VIETNAM',286,'OIA GLOBAL LOGISTICS SCM, INC','127523','0000052',NULL,'','2015-04-15 00:00:00',NULL,'Kho Tân Á','KNQ Tiếp vận Thành Long',0,0,'','300353028900','2015-04-10 00:00:00',164,129,1,1,1,1,1,0,0,1,0,1,12,12,'2015-04-23 13:55:16','2015-04-23 13:55:16',49,9,101,NULL,NULL,NULL,'KNQ Tiếp vận Thành Long','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'CONG TY TNHH SCG TRADING VIETNAM',286,'OIA GLOBAL LOGISTICS SCM, INC','127525','0000054',NULL,'','2015-04-18 00:00:00',NULL,'Kho Tân Á','KNQ Tiếp vận Thành Long',0,0,'','300353108700','2015-04-10 00:00:00',164,129,1,1,1,1,1,0,0,1,1,1,12,12,'2015-04-23 14:48:34','2015-04-23 00:00:00',50,10,101,NULL,NULL,NULL,'KNQ Tiếp vận Thành Long','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'CONG TY TNHH SCG TRADING VIETNAM',286,'OIA GLOBAL LOGISTICS SCM, INC','127633','0000056',NULL,'','2015-04-18 00:00:00',NULL,'Kho Tân Á','KNQ Tiếp vận Thành Long',0,0,'','300356204430','2015-04-14 00:00:00',164,129,1,1,1,1,1,0,0,1,0,1,12,12,'2015-04-23 16:31:49','2015-04-23 16:31:49',51,11,101,NULL,NULL,NULL,'KNQ Tiếp vận Thành Long','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'CONG TY TNHH SCG TRADING VIETNAM',286,'OIA GLOBAL LOGISTICS SCM, INC','127793','0000057',NULL,'','2015-04-21 00:00:00',NULL,'Kho Tân Á','KNQ Tiếp vận Thành Long',0,0,'','300359250500','2015-04-16 00:00:00',164,129,1,1,1,1,1,0,0,1,0,1,12,12,'2015-04-23 16:39:44','2015-04-23 16:39:44',52,12,101,NULL,NULL,NULL,'KNQ Tiếp vận Thành Long','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'SIAM KRAFT INDUSTRY CO., LTD',-5,'CONG TY TNHH SCG TRADING  VIETNAM','7985670','176870209',NULL,'OOLU3109871920',NULL,'2015-04-04 00:00:00','LAEM CHABANG','CÁT LÁI',5,3,'','100356964410','2015-04-07 00:00:00',164,130,1,1,1,1,1,1,1,1,0,1,8,8,'2015-04-24 08:51:40','2015-04-24 08:51:40',53,1,102,'2015-04-01 00:00:00',NULL,NULL,'','','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'VOITH IHI PAPER TECHNOLOGY CO., LTD',105,'CONG TY TNHH SCG TRADING  VIETNAM','4421021451','20151183777',NULL,'NNR-41397541',NULL,'2015-04-01 00:00:00','NARITA','TÂN SÂN NHẤT',0,3,'TCS','100349006000','2015-03-31 00:00:00',165,130,1,1,1,1,1,1,1,1,0,1,8,8,'2015-04-24 09:00:32','2015-04-24 00:00:00',54,2,102,'2015-03-31 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'ESSCO INCORPORATED',105,'CONG TY TNHH SCG TRADING  VIETNAM','4421022047','110835',NULL,'YUS01428534',NULL,'2015-04-04 00:00:00','MILWAUKEE','TÂN SÂN NHẤT',0,3,'TCS','100355231910','2015-04-06 00:00:00',164,163,1,1,1,0,1,1,1,1,0,1,8,8,'2015-04-24 09:06:24','2015-04-24 00:00:00',55,3,102,'2015-04-01 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'SIAM KRAFT INDUSTRY CO., LTD',-5,'CONG TY TNHH SCG TRADING  VIETNAM','7985662','176870200',NULL,'MCC741079',NULL,'2015-04-02 00:00:00','LAEM CHABANG','CÁT LÁI',14,7,'','100351678600','2015-04-02 00:00:00',165,130,1,1,1,1,1,1,1,1,0,1,8,8,'2015-04-24 09:17:50','2015-04-24 09:17:50',56,4,102,'2015-03-30 00:00:00',NULL,NULL,'','','20',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'MARTIN LOHSE GMBH',105,'CONG TY TNHH SCG TRADING  VIETNAM','442122013','90051609',NULL,'KFB-00958585',NULL,'2015-04-06 00:00:00','FRANKFURT','TÂN SÂN NHẤT',0,3,'TCS','100358648240','2015-04-08 00:00:00',164,130,1,1,1,1,1,1,1,1,0,1,8,8,'2015-04-24 09:46:59','2015-04-24 00:00:00',57,5,102,'2015-04-03 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'KANEMATSU CHEMICALS  CORPORATION ,XVB4 DEPT',-5,'CONG TY TNHH SCG TRADING  VIETNAM','4421021192','XVB43-V079',NULL,'BAHO1503052',NULL,'2015-04-02 00:00:00','BANGKOK','CÁT LÁI',0,7,'KHO 3','100351768420','2015-04-02 00:00:00',164,130,1,1,1,1,1,1,1,1,0,1,8,8,'2015-04-24 10:13:42','2015-04-24 00:00:00',58,6,102,'2015-03-30 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'ZINCOMETAL S.PA',105,'CONG TY TNHH SCG TRADING  VIETNAM','23032015','150311',NULL,'773264484049',NULL,'2015-04-03 00:00:00','FEDEX','KHO FEDEX',0,3,'FEDEX','100356682310','2015-04-07 00:00:00',164,130,1,1,1,1,1,1,1,1,1,0,8,8,'2015-04-24 10:18:02','2015-04-24 00:00:00',59,7,102,'2015-04-02 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'HANGZHOU BOILER GROUP CO., LTD',-5,'CONG TY TNHH SCG TRADING  VIETNAM','4421021667-1','HBGC-VKPC-CS-1',NULL,'EURFL15314371SGN',NULL,'2015-04-07 00:00:00','SHANGHAI','CÁT LÁI',0,7,'KHO 2','100355317900','2015-04-06 00:00:00',165,130,1,1,1,1,1,1,1,1,0,1,8,8,'2015-04-24 10:25:15','2015-04-24 00:00:00',62,8,102,'2015-03-31 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'MARUBENI CORPORATION',-5,'CONG TY TNHH SCG TRADING  VIETNAM','442100836,4421020906 ','4YC03015',NULL,'TCLT15008505',NULL,'2015-04-07 00:00:00','YOKOHAMA','CÁT LÁI',0,7,'KHO 3','',NULL,164,163,1,1,1,1,1,1,1,1,0,1,8,8,'2015-04-24 10:42:22','2015-04-24 00:00:00',63,9,102,'2015-03-27 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'NISSHO IWAI PAPER & PULP CORPORATION KYUSHU',-5,'CONG TY TNHH SCG TRADING  VIETNAM','A0118','A0118-F2',NULL,'OOLU3095019110',NULL,'2015-03-30 00:00:00','OSAKA','CÁT LÁI',14,14,'','100350585160','2015-04-01 00:00:00',166,163,1,1,1,1,1,1,1,1,1,0,8,8,'2015-04-24 10:48:04','2015-04-24 00:00:00',65,10,102,'2015-03-15 00:00:00',NULL,NULL,'','','11',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'VOITH IHI PAPER TECHNOLOGY CO., LTD',-5,'CONG TY TNHH SCG TRADING  VIETNAM','4421021449',' 20151153408',NULL,'STR236168',NULL,'2015-04-12 00:00:00','STUTTGART','TÂN SÂN NHẤT',0,3,'SCSC','100363573660','2015-04-13 00:00:00',164,130,1,1,1,1,1,1,1,1,0,1,8,8,'2015-04-24 11:05:34','2015-04-24 00:00:00',66,11,102,'2015-04-07 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'VOITH IHI PAPER TECHNOLOGY CO., LTD',105,'CONG TY TNHH SCG TRADING  VIETNAM','4421021380','20151183782',NULL,'NNR-41398377',NULL,'2015-04-12 00:00:00','NARITA','TÂN SÂN NHẤT',0,3,'TCS','100363421910','2015-04-13 00:00:00',164,130,1,1,1,1,1,1,1,1,0,1,8,8,'2015-04-24 11:09:07','2015-04-24 11:09:07',70,12,102,'2015-04-11 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'MARUBENI CORPORATION',-5,'CONG TY TNHH SCG TRADING  VIETNAM','4421020537','4YC03014',NULL,'TCLT15008191',NULL,'2015-04-07 00:00:00','YOKOHAMA','VICT',0,7,'CFS VICT','100355654560','2015-04-06 00:00:00',164,130,1,1,1,1,1,1,1,1,0,1,8,8,'2015-04-24 11:15:40','2015-04-24 00:00:00',74,13,102,'2015-03-23 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'NISSHO IWAI PAPER & PULP CORPORATION KYUSHU',-5,'CONG TY TNHH SCG TRADING  VIETNAM','A0118','A0118-F3',NULL,'MOLU12014899107',NULL,'2015-04-04 00:00:00','TOKYO','CÁT LÁI',5,6,'','100355160840','2015-04-06 00:00:00',166,163,1,1,1,1,1,1,1,1,1,1,8,8,'2015-04-24 11:22:24','2015-04-24 00:00:00',79,14,102,'2015-03-26 00:00:00',NULL,NULL,'','','24',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'ITOCHU SINGAPORE PTE LTD',-5,'CONG TY TNHH SCG TRADING  VIETNAM','SO-DK15-0053','DK-TPP073/VN',NULL,'KHHSGN50327EA001',NULL,'2015-04-04 00:00:00','KAOHSIUNG','CÁT LÁI',13,6,'','100359820260','2015-04-09 00:00:00',164,163,1,1,1,1,1,1,1,1,0,1,8,8,'2015-04-24 11:30:20','2015-04-24 00:00:00',82,15,102,'2015-04-01 00:00:00',NULL,NULL,'','','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'INTER SUPPLY AND ENGINEERING CO., LTD',-5,'CONG TY TNHH SCG TRADING  VIETNAM','4421021892','IVN-25580004',NULL,'CCS(B)4796',NULL,'2015-04-19 00:00:00','BANGKOK','CÁT LÁI',0,7,'KHO 3','100370601810','2015-04-17 00:00:00',164,130,1,1,1,0,1,1,1,1,0,1,8,8,'2015-04-25 10:16:02','2015-04-25 00:00:00',125,16,102,'2015-04-12 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'HANGZHOU BOILER GROUP CO., LTD',-5,'CONG TY TNHH SCG TRADING  VIETNAM','4421021482','HBGC-VKPC-JTS150-1',NULL,'MWSGN20150425',NULL,'2015-04-17 00:00:00','SHANGHAI','CÁT LÁI',0,7,'KHO 2','100372407330','2015-04-20 00:00:00',164,130,1,1,1,0,1,1,1,1,0,1,8,8,'2015-04-25 10:20:43','2015-04-25 00:00:00',126,17,102,'2015-04-10 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'MARUBENI CORPORATION',-5,'CONG TY TNHH SCG TRADING  VIETNAM','4421020952',' 4YC03016',NULL,'TCLT15010522',NULL,'2015-04-21 00:00:00','YOKOHAMA','CÁT LÁI',0,7,'KHO 3','100372408400','2015-04-20 00:00:00',164,130,1,1,1,0,1,1,1,1,0,1,8,8,'2015-04-25 10:24:40','2015-04-25 10:24:40',127,18,102,'2015-04-10 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'NETZSCH (THAILAND) LIMITED',105,'CONG TY TNHH SCG TRADING  VIETNAM','21480 + 21750','165804004',NULL,'057-70318905',NULL,'2015-04-17 00:00:00','FRANKFURT','TÂN SÂN NHẤT',0,3,'TCS','100372480830','2015-04-20 00:00:00',165,130,1,1,1,0,1,1,1,1,0,1,8,8,'2015-04-25 10:30:20','2015-04-25 00:00:00',130,19,102,'2015-04-10 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'KUBOTA ENVIRONMENTAL SERVICE CO., LTD',105,'CONG TY TNHH SCG TRADING  VIETNAM',' 4421022415','40-00476-00',NULL,'KKS-30856556',NULL,'2015-04-22 00:00:00','OSAKA','TÂN SÂN NHẤT',0,3,'TCS','100375824400','2015-04-22 00:00:00',164,130,1,1,1,0,1,1,1,1,0,1,8,8,'2015-04-25 10:36:53','2015-04-25 00:00:00',131,20,102,'2015-04-21 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'NIKUNI CO., LTD',105,'CONG TY TNHH SCG TRADING  VIETNAM','4421022017','VK150422A',NULL,'NNR-54211037',NULL,'2015-04-08 00:00:00','NARITA','TÂN SÂN NHẤT',0,3,'TCS','100370915960','2015-04-17 00:00:00',164,130,1,1,1,0,1,1,1,1,0,1,8,8,'2015-04-25 10:40:06','2015-04-25 10:40:06',132,21,102,'2015-04-17 00:00:00',NULL,NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `extension` varchar(45) DEFAULT 'pdf',
  PRIMARY KEY (`id`),
  KEY `toAtt_idx` (`attachment`),
  CONSTRAINT `toAtt` FOREIGN KEY (`attachment`) REFERENCES `attachment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
  `payReason` varchar(1000) DEFAULT NULL,
  `refNo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `torefundemployee_idx` (`employee`),
  CONSTRAINT `torefundemployee` FOREIGN KEY (`employee`) REFERENCES `app_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
INSERT INTO `refund` VALUES (1,-2,-2,-2,'2015-04-25 10:28:30','2015-04-25 10:28:30',NULL,0,'',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunddetail`
--

LOCK TABLES `refunddetail` WRITE;
/*!40000 ALTER TABLE `refunddetail` DISABLE KEYS */;
INSERT INTO `refunddetail` VALUES (1,33,1,'tytut',0.00,0.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (-2,'Default role for all Users','ROLE_USER'),(-1,'Administrator role (can edit Users)','ROLE_ADMIN'),(1,'Sales','ROLE_SALES'),(2,'Docs','ROLE_DOCS'),(3,'Trucking','ROLE_TRUCK'),(4,'Accounting','ROLE_ACCOUNTING'),(5,'Configuration','ROLE_CONFIG'),(6,'Report Nhathau','ROLE_NHATHAU');
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
  `noOfVehicle` varchar(45) DEFAULT NULL,
  `nhathau` bigint(20) DEFAULT NULL,
  `dateDev` datetime DEFAULT NULL,
  `deliveryPlace` varchar(500) DEFAULT NULL,
  `phuthu` decimal(20,2) DEFAULT NULL,
  `accountingPrice` decimal(20,2) DEFAULT NULL,
  `otherFees` decimal(20,2) DEFAULT NULL,
  `payForNhaThau` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toContealtrucking_idx` (`consteal`),
  KEY `toTruckingFD_idx` (`trucking`),
  KEY `toNhathauDe_idx` (`nhathau`),
  KEY `payforNhathau_idx` (`payForNhaThau`),
  CONSTRAINT `payforNhathau` FOREIGN KEY (`payForNhaThau`) REFERENCES `nhathau` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toContealtrucking` FOREIGN KEY (`consteal`) REFERENCES `contseal` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `toNhathauDe` FOREIGN KEY (`nhathau`) REFERENCES `nhathau` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toTruckingFD` FOREIGN KEY (`trucking`) REFERENCES `truckingservice` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truckingdetail`
--

LOCK TABLES `truckingdetail` WRITE;
/*!40000 ALTER TABLE `truckingdetail` DISABLE KEYS */;
INSERT INTO `truckingdetail` VALUES (55,22,9,'51C47609',NULL,98,'0015-04-01 00:00:00','ĐÔNG XUYÊN',NULL,NULL,NULL,NULL),(56,23,9,'51C47609',NULL,98,'0015-04-02 00:00:00','ĐÔNG XUYÊN',NULL,NULL,NULL,NULL),(70,NULL,NULL,'PACIFIC GLORIA','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,NULL,NULL,'PACIFIC GLORIA','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,NULL,NULL,'BIEN DONG FREIGHTER','508',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,NULL,NULL,'BIEN DONG STAR','509',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,NULL,NULL,'BIEN DONG STAR','509',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,28,NULL,'BIEN DONG STAR','509',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,NULL,NULL,'BIEN DONG STAR','509',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,43,NULL,'BIEN DONG STAR','509',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,NULL,NULL,'BIEN DONG STAR','509',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,NULL,NULL,'BIEN DONG STAR','509',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,NULL,NULL,'BIEN DONG STAR','509',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,43,NULL,'BIEN DONG STAR','509',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,NULL,NULL,'PIONEER','1,509',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,49,15,'PIONEER','1,509',-1,NULL,'',NULL,NULL,NULL,NULL),(90,91,16,'BIEN DONG FREIGHTER','508',38,'2015-04-12 00:00:00','BẮC NINH',NULL,NULL,NULL,NULL),(91,91,16,'BIEN DONG FREIGHTER','508',98,'2015-04-09 00:00:00','GÒ DẦU',0.00,NULL,NULL,NULL),(92,91,16,'BIEN DONG FREIGHTER','508',31,'2015-04-17 00:00:00','BẮC NINH',NULL,NULL,NULL,NULL),(93,92,17,'GPACIFIC GLORIA ','9',43,'2015-04-13 00:00:00','BẮC NINH',NULL,NULL,NULL,NULL),(94,92,17,'GPACIFIC GLORIA ','9',98,'2015-04-10 00:00:00','GÒ DẦU',0.00,NULL,NULL,NULL),(95,92,17,'GPACIFIC GLORIA ','9',31,'2015-04-20 00:00:00','BẮC NINH',NULL,NULL,NULL,NULL),(96,134,18,'LINER 1','268',40,'2015-04-20 00:00:00','BẮC NINH',NULL,NULL,NULL,NULL),(97,134,18,'LINER 1','268',18,'2015-04-16 00:00:00','GÒ DẦU',NULL,NULL,NULL,NULL),(98,134,18,'LINER 1','268',31,NULL,'',NULL,NULL,NULL,NULL),(99,135,19,'LINER 1','268',-1,NULL,'',NULL,NULL,NULL,NULL),(100,135,19,'LINER 1','268',18,NULL,'',NULL,NULL,NULL,NULL),(101,136,20,'BIEN DONG STAR','510',6,NULL,'',NULL,NULL,NULL,NULL),(102,136,20,'BIEN DONG STAR','510',98,'2015-04-20 00:00:00','GÒ DẦU',0.00,NULL,NULL,NULL),(103,136,20,'BIEN DONG STAR','510',31,NULL,'',NULL,NULL,NULL,NULL),(104,55,21,'HANJIN PORT ADELAIDE 0124W',NULL,10,'2015-04-24 00:00:00','',NULL,NULL,NULL,NULL),(105,56,21,'HANJIN PORT ADELAIDE 0124W',NULL,-1,NULL,'',NULL,NULL,NULL,NULL),(106,57,21,'HANJIN PORT ADELAIDE 0124W',NULL,-1,NULL,'',NULL,NULL,NULL,NULL),(107,58,21,'HANJIN PORT ADELAIDE 0124W',NULL,-1,NULL,'',NULL,NULL,NULL,NULL),(108,59,21,'HANJIN PORT ADELAIDE 0124W',NULL,-1,NULL,'',NULL,NULL,NULL,NULL),(109,60,21,'HANJIN PORT ADELAIDE 0124W',NULL,-1,NULL,'',NULL,NULL,NULL,NULL),(110,61,21,'HANJIN PORT ADELAIDE 0124W',NULL,-1,NULL,'',NULL,NULL,NULL,NULL),(111,62,21,'HANJIN PORT ADELAIDE 0124W',NULL,-1,NULL,'',NULL,NULL,NULL,NULL),(112,63,21,'HANJIN PORT ADELAIDE 0124W',NULL,10,NULL,'',NULL,NULL,NULL,NULL),(113,64,21,'HANJIN PORT ADELAIDE 0124W',NULL,-1,NULL,'',NULL,NULL,NULL,NULL),(114,65,21,'HANJIN PORT ADELAIDE 0124W',NULL,-1,NULL,'',NULL,NULL,NULL,NULL),(115,66,21,'HANJIN PORT ADELAIDE 0124W',NULL,-1,NULL,'',NULL,NULL,NULL,NULL),(116,67,21,'HANJIN PORT ADELAIDE 0124W',NULL,-1,NULL,'',NULL,NULL,NULL,NULL),(117,31,22,'',NULL,10,'2015-04-08 00:00:00','TÂN Á',NULL,NULL,NULL,NULL),(118,32,22,'',NULL,10,'0115-04-09 00:00:00','TÂN Á',NULL,NULL,NULL,NULL),(119,33,22,'',NULL,10,'0015-04-10 00:00:00','TÂN Á',NULL,NULL,NULL,NULL),(120,34,22,'',NULL,10,'0015-04-12 00:00:00','TÂN Á',NULL,NULL,NULL,NULL),(121,93,23,'',NULL,26,'2015-04-01 00:00:00','',NULL,NULL,NULL,NULL),(122,94,23,'',NULL,98,'2015-04-01 00:00:00','',0.00,NULL,NULL,NULL),(123,95,23,'',NULL,98,'2015-04-01 00:00:00','',0.00,NULL,NULL,NULL),(124,96,23,'',NULL,24,'2015-04-01 00:00:00','',NULL,NULL,NULL,NULL),(125,108,23,'',NULL,26,'2015-04-06 00:00:00','',NULL,NULL,NULL,NULL),(126,109,23,'',NULL,26,'2015-04-06 00:00:00','',NULL,NULL,NULL,NULL),(127,110,23,'',NULL,26,'2015-04-06 00:00:00','',NULL,NULL,NULL,NULL),(128,111,23,'',NULL,26,'2015-04-06 00:00:00','',NULL,NULL,NULL,NULL),(129,112,23,'',NULL,26,'2015-04-09 00:00:00','',NULL,NULL,NULL,NULL),(130,113,23,'',NULL,26,'2015-04-09 00:00:00','',NULL,NULL,NULL,NULL),(131,114,23,'',NULL,98,'2015-04-09 00:00:00','',0.00,NULL,NULL,NULL),(132,115,23,'',NULL,98,'2015-04-09 00:00:00','',0.00,NULL,NULL,NULL),(133,116,23,'',NULL,98,'2015-04-14 00:00:00','',0.00,NULL,NULL,NULL),(134,117,23,'',NULL,26,'2015-04-14 00:00:00','',NULL,NULL,NULL,NULL),(135,118,23,'',NULL,26,'2015-04-14 00:00:00','',NULL,NULL,NULL,NULL),(136,119,23,'',NULL,26,'2015-04-14 00:00:00','',NULL,NULL,NULL,NULL),(137,120,23,'',NULL,98,'2015-04-16 00:00:00','',0.00,NULL,NULL,NULL),(138,121,23,'',NULL,98,'2015-04-16 00:00:00','',0.00,NULL,NULL,NULL),(139,122,23,'',NULL,98,'2015-04-16 00:00:00','',0.00,NULL,NULL,NULL),(140,123,23,'',NULL,26,'2015-04-16 00:00:00','',NULL,NULL,NULL,NULL),(141,124,23,'',NULL,26,'2015-04-22 00:00:00','',NULL,NULL,NULL,NULL),(142,125,23,'',NULL,26,'2015-04-22 00:00:00','',NULL,NULL,NULL,NULL),(143,126,23,'',NULL,26,'2015-04-22 00:00:00','',NULL,NULL,NULL,NULL),(144,127,23,'',NULL,26,'2015-04-22 00:00:00','',NULL,NULL,NULL,NULL),(145,128,24,'',NULL,26,'2015-04-07 00:00:00','',NULL,NULL,NULL,NULL),(146,129,24,'',NULL,26,'2015-04-08 00:00:00','',NULL,NULL,NULL,NULL),(147,130,24,'',NULL,26,'2015-04-17 00:00:00','',NULL,NULL,NULL,NULL),(148,131,24,'',NULL,26,'2015-04-18 00:00:00','',NULL,NULL,NULL,NULL),(149,138,25,'',NULL,24,'2015-04-09 00:00:00','',NULL,NULL,NULL,NULL),(150,139,26,'',NULL,26,'2015-04-17 00:00:00','',NULL,NULL,NULL,NULL),(151,140,26,'',NULL,26,'2015-04-17 00:00:00','',NULL,NULL,NULL,NULL),(152,141,27,'',NULL,8,'2015-04-09 00:00:00','',NULL,NULL,NULL,NULL),(153,142,28,'',NULL,24,'2015-04-02 00:00:00','',NULL,NULL,NULL,NULL),(154,143,28,'',NULL,24,'2015-04-02 00:00:00','',NULL,NULL,NULL,NULL),(155,144,28,'',NULL,10,'2015-04-03 00:00:00','',NULL,NULL,NULL,NULL),(156,145,28,'',NULL,24,'2015-04-07 00:00:00','',NULL,NULL,NULL,NULL),(157,146,28,'',NULL,10,'2015-04-09 00:00:00','',NULL,NULL,NULL,NULL),(158,147,28,'',NULL,10,'2015-04-10 00:00:00','',NULL,NULL,NULL,NULL),(159,148,28,'',NULL,10,'2015-04-10 00:00:00','',NULL,NULL,NULL,NULL),(160,149,28,'',NULL,10,'2015-04-16 00:00:00','',NULL,NULL,NULL,NULL),(161,132,29,'',NULL,33,'2015-04-03 00:00:00','',NULL,NULL,NULL,NULL),(162,133,29,'',NULL,33,'2015-04-03 00:00:00','',NULL,NULL,NULL,NULL),(163,174,30,'',NULL,10,'2015-04-13 00:00:00','',NULL,NULL,NULL,NULL),(164,175,30,'',NULL,24,'2015-04-14 00:00:00','',NULL,NULL,NULL,NULL),(165,176,30,'',NULL,24,'2015-04-18 00:00:00','',NULL,NULL,NULL,NULL),(166,196,31,'BIEN DONG STAR','509',38,'2015-04-07 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(167,196,31,'BIEN DONG STAR','509',24,'2015-04-02 00:00:00','ĐÔNG XUYÊN',NULL,NULL,NULL,NULL),(168,196,31,'BIEN DONG STAR','509',31,'2015-04-13 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(169,201,32,'BIEN DONG STAR','509',38,'2015-04-07 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(170,201,32,'BIEN DONG STAR','509',31,'2015-04-13 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(171,202,33,'BIEN DONG STAR','509',38,'2015-04-07 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(172,202,33,'BIEN DONG STAR','509',31,'2015-04-13 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(173,203,34,'PIONEER','1,509',37,'2015-04-05 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(174,203,34,'PIONEER','1,509',24,'2015-04-03 00:00:00','ĐÔNG XUYÊN',NULL,NULL,NULL,NULL),(175,203,34,'PIONEER','1,509',31,NULL,'',NULL,NULL,NULL,NULL),(176,177,35,'',NULL,24,'2015-04-08 00:00:00','',NULL,NULL,NULL,NULL),(177,178,35,'',NULL,24,'2015-04-09 00:00:00','',NULL,NULL,NULL,NULL),(178,179,35,'',NULL,24,'2015-04-14 00:00:00','',NULL,NULL,NULL,NULL),(179,204,36,'BIEN DONG STAR','509',42,'2015-04-08 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(180,204,36,'BIEN DONG STAR','509',98,'2015-04-04 00:00:00','ĐÔNG XUYÊN',0.00,NULL,NULL,NULL),(181,204,36,'BIEN DONG STAR','509',31,'2015-04-14 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(182,205,37,'HAI AN PARK','10',38,'2015-04-09 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(183,205,37,'HAI AN PARK','10',31,'2015-04-22 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(184,184,38,'',NULL,24,'2015-04-16 00:00:00','',NULL,NULL,NULL,NULL),(185,185,38,'',NULL,24,'2015-04-16 00:00:00','',NULL,NULL,NULL,NULL),(186,186,38,'',NULL,24,'2015-04-16 00:00:00','',NULL,NULL,NULL,NULL),(187,187,38,'',NULL,24,'2015-04-16 00:00:00','',NULL,NULL,NULL,NULL),(188,188,38,'',NULL,24,'2015-04-16 00:00:00','',NULL,NULL,NULL,NULL),(189,189,38,'',NULL,24,'2015-04-16 00:00:00','',NULL,NULL,NULL,NULL),(190,190,38,'',NULL,24,'2015-04-16 00:00:00','',NULL,NULL,NULL,NULL),(191,191,38,'',NULL,24,'2015-04-17 00:00:00','',NULL,NULL,NULL,NULL),(192,192,38,'',NULL,24,'2015-04-17 00:00:00','',NULL,NULL,NULL,NULL),(193,193,38,'',NULL,24,'2015-04-17 00:00:00','',NULL,NULL,NULL,NULL),(194,206,39,'PROPER','1,511',37,'2015-04-08 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(195,206,39,'PROPER','1,511',98,'2015-04-06 00:00:00','ĐÔNG XUYÊN',0.00,NULL,NULL,NULL),(196,206,39,'PROPER','1,511',31,'2015-04-22 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(197,194,40,'',NULL,24,'2015-04-17 00:00:00','',NULL,NULL,NULL,NULL),(198,195,40,'',NULL,24,'2015-04-17 00:00:00','',NULL,NULL,NULL,NULL),(199,207,41,'HAI AN PARK','10',38,NULL,'',NULL,NULL,NULL,NULL),(200,207,41,'HAI AN PARK','10',98,'2015-04-07 00:00:00','ĐÔNG XUYÊN',0.00,NULL,NULL,NULL),(201,207,41,'HAI AN PARK','10',31,'2015-04-22 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(202,197,42,'',NULL,24,'2015-04-15 00:00:00','',NULL,NULL,NULL,NULL),(203,198,42,'',NULL,10,'2015-04-16 00:00:00','',NULL,NULL,NULL,NULL),(204,199,42,'',NULL,24,'2015-04-17 00:00:00','',NULL,NULL,NULL,NULL),(205,200,42,'',NULL,24,'2015-04-17 00:00:00','',NULL,NULL,NULL,NULL),(206,NULL,NULL,'BIEN DONG FREIGHTER','508',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(207,NULL,NULL,'BIEN DONG FREIGHTER','508',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(208,208,43,'BIEN DONG FREIGHTER','508',38,NULL,'',NULL,NULL,NULL,NULL),(209,208,43,'BIEN DONG FREIGHTER','508',98,'2015-04-07 00:00:00','',0.00,NULL,NULL,NULL),(210,208,43,'BIEN DONG FREIGHTER','508',31,'2015-04-22 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(211,210,44,'BIEN DONG FREIGHTER','508',38,NULL,'',NULL,NULL,NULL,NULL),(212,210,44,'BIEN DONG FREIGHTER','508',98,'2015-04-08 00:00:00','ĐÔNG XUYÊN',0.00,NULL,NULL,NULL),(213,210,44,'BIEN DONG FREIGHTER','508',31,'2015-04-22 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(214,211,45,'BIEN DONG FREIGHTER','508',38,NULL,'',NULL,NULL,NULL,NULL),(215,211,45,'BIEN DONG FREIGHTER','508',31,'2015-04-22 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(216,212,46,'PIONEER','1,510',37,NULL,'',NULL,NULL,NULL,NULL),(217,212,46,'PIONEER','1,510',31,'2015-04-23 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(218,218,47,'',NULL,10,'2015-04-13 00:00:00','',NULL,NULL,NULL,NULL),(219,213,48,'BIEN DONG FREIGHTER','508',38,NULL,'',NULL,NULL,NULL,NULL),(220,213,48,'BIEN DONG FREIGHTER','508',98,'2015-04-09 00:00:00','ĐÔNG XUYÊN',0.00,NULL,NULL,NULL),(221,213,48,'BIEN DONG FREIGHTER','508',31,'2015-04-23 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(222,NULL,49,'51C-38944',NULL,98,'2015-04-19 00:00:00','',0.00,NULL,NULL,NULL),(223,214,50,'VAN HUNG','508',38,NULL,'',NULL,NULL,NULL,NULL),(224,214,50,'VAN HUNG','508',31,'2015-04-23 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(225,219,51,'',NULL,10,'2015-04-20 00:00:00','',NULL,NULL,NULL,NULL),(226,220,51,'',NULL,10,'2015-04-20 00:00:00','',NULL,NULL,NULL,NULL),(227,221,51,'',NULL,10,'2015-04-20 00:00:00','',NULL,NULL,NULL,NULL),(228,215,52,'VAN HUNG','508',38,NULL,'',NULL,NULL,NULL,NULL),(229,215,52,'VAN HUNG','508',31,NULL,'',NULL,NULL,NULL,NULL),(230,222,53,'',NULL,10,'2015-04-21 00:00:00','',NULL,NULL,NULL,NULL),(231,223,53,'',NULL,10,'2015-04-21 00:00:00','',NULL,NULL,NULL,NULL),(232,224,53,'',NULL,10,'2015-04-21 00:00:00','',NULL,NULL,NULL,NULL),(233,216,54,'VAN HUNG','508',38,NULL,'',NULL,NULL,NULL,NULL),(234,216,54,'VAN HUNG','508',31,'2015-04-23 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(235,NULL,55,'51C-47817',NULL,98,'2015-04-20 00:00:00','',0.00,NULL,NULL,NULL),(236,225,56,'',NULL,10,'2015-04-22 00:00:00','',NULL,NULL,NULL,NULL),(237,217,57,'VAN HUNG','508',38,NULL,'',NULL,NULL,NULL,NULL),(238,217,57,'VAN HUNG','508',31,'2015-04-23 00:00:00','HƯNG YÊN',NULL,NULL,NULL,NULL),(239,NULL,58,'',NULL,30,'2015-04-22 00:00:00','',NULL,NULL,NULL,NULL),(243,NULL,60,'51C-38944',NULL,98,'2015-04-07 00:00:00','',0.00,NULL,NULL,NULL),(244,NULL,60,'51C-47817',NULL,98,'2015-04-08 00:00:00','',0.00,NULL,NULL,NULL),(245,NULL,60,'',NULL,3,'2015-04-08 00:00:00','',NULL,NULL,NULL,NULL),(246,NULL,61,'51C-47817',NULL,98,'2015-04-14 00:00:00','',0.00,NULL,NULL,NULL),(247,NULL,62,'51c-12673',NULL,3,'2015-04-16 00:00:00','',NULL,NULL,NULL,NULL),(248,NULL,63,'51C-38944',NULL,98,'2015-04-18 00:00:00','',0.00,NULL,NULL,NULL),(249,NULL,64,'51C-47817',NULL,98,'2015-04-22 00:00:00','',0.00,NULL,NULL,NULL),(252,NULL,66,'51C-38944',NULL,98,'2015-04-01 00:00:00','',0.00,NULL,NULL,NULL),(254,NULL,67,'51C-38944',NULL,98,'2015-04-22 00:00:00','',0.00,NULL,NULL,NULL),(256,NULL,68,'54Y-0519',NULL,102,'2015-04-23 00:00:00','',NULL,NULL,NULL,NULL),(257,NULL,69,'51C-42216',NULL,102,'2015-04-23 00:00:00','',NULL,NULL,NULL,NULL),(258,NULL,NULL,'BIEN DONG FREIGHTER','508',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(259,25,70,'51C-47325',NULL,98,'2015-04-02 00:00:00','CÁT LÁI',0.00,6636.00,45645.00,NULL),(260,NULL,NULL,'BIEN DONG FREIGHTER','508',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(261,NULL,NULL,'BIEN DONG STAR','509',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(262,NULL,NULL,'BIEN DONG STAR','509',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(263,28,NULL,'BIEN DONG STAR','509',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truckingservice`
--

LOCK TABLES `truckingservice` WRITE;
/*!40000 ALTER TABLE `truckingservice` DISABLE KEYS */;
INSERT INTO `truckingservice` VALUES (9,'','TANAMEXCO',14,16,'2015-04-22 00:00:00','2015-04-25 11:01:04',33,1,1,1,1,1,1,1,NULL,'ANH THANH - PEB','0310793207 AEL'),(10,'','',16,16,'2015-04-22 00:00:00','2015-04-24 10:01:09',34,0,0,0,0,0,0,0,NULL,'Mr Hải 0913597492',''),(11,'','',16,16,'2015-04-22 00:00:00','2015-04-24 09:58:58',36,0,0,0,0,0,0,0,NULL,'',''),(12,'','',16,16,'2015-04-22 00:00:00','2015-04-24 10:07:56',37,0,0,0,0,0,0,0,NULL,'',''),(13,'','',16,16,'2015-04-22 00:00:00','2015-04-24 10:08:20',38,1,1,1,1,1,0,0,NULL,'',''),(14,'','',16,16,'2015-04-22 00:00:00','2015-04-24 10:09:14',42,0,0,0,0,0,0,0,NULL,'',''),(15,'','',16,16,'2015-04-22 00:00:00','2015-04-24 10:09:49',45,0,0,0,0,0,0,0,NULL,'',''),(16,'','',16,16,'2015-04-24 00:00:00','2015-04-25 11:25:59',60,1,1,1,1,1,1,1,NULL,'',''),(17,'','',16,16,'2015-04-24 00:00:00','2015-04-25 11:43:16',61,1,1,1,1,1,1,1,NULL,'',''),(18,'','',16,16,'2015-04-24 00:00:00','2015-04-25 11:42:56',69,1,1,1,0,0,0,0,NULL,'',''),(19,'','',16,16,'2015-04-24 11:39:34','2015-04-24 11:39:34',71,0,0,0,0,0,0,0,NULL,'',''),(20,'','',16,16,'2015-04-24 00:00:00','2015-04-24 11:40:56',72,1,1,1,0,0,0,0,NULL,'',''),(21,'','',18,18,'2015-04-24 12:02:03','2015-04-24 12:02:03',47,0,0,0,0,0,0,0,NULL,'',''),(22,'','',14,16,'2015-04-24 00:00:00','2015-04-25 11:02:50',40,1,1,1,1,1,1,1,NULL,'',''),(23,'','',-2,-2,'2015-04-24 13:35:57','2015-04-24 13:35:57',64,0,0,0,0,0,0,0,NULL,'',''),(24,'','',-2,-2,'2015-04-24 13:39:22','2015-04-24 13:39:22',67,0,0,0,0,0,0,0,NULL,'',''),(25,'','',-2,-2,'2015-04-24 00:00:00','2015-04-24 13:40:21',75,0,0,0,0,1,0,0,NULL,'',''),(26,'','',-2,-2,'2015-04-24 13:41:45','2015-04-24 13:41:45',76,0,0,0,0,0,0,0,NULL,'',''),(27,'','',-2,-2,'2015-04-24 13:46:46','2015-04-24 13:46:46',77,0,0,0,0,0,0,0,NULL,'',''),(28,'','',-2,-2,'2015-04-24 13:49:51','2015-04-24 13:49:51',78,0,0,0,0,0,0,0,NULL,'',''),(29,'','',-2,-2,'2015-04-24 13:51:53','2015-04-24 13:51:53',68,0,0,0,0,0,0,0,NULL,'',''),(30,'','',-2,-2,'2015-04-24 13:58:31','2015-04-24 13:58:31',80,0,0,0,0,0,0,0,NULL,'',''),(31,'','',16,16,'2015-04-24 00:00:00','2015-04-25 11:46:52',85,1,1,1,1,1,1,1,NULL,'Mr Cường 0904.778.273',''),(32,'','',16,16,'2015-04-24 00:00:00','2015-04-25 11:46:29',87,1,1,1,1,1,1,1,NULL,'',''),(33,'','',16,16,'2015-04-24 00:00:00','2015-04-25 11:48:52',88,1,1,1,1,1,1,1,NULL,'',''),(34,'','',16,16,'2015-04-24 00:00:00','2015-04-25 11:53:00',89,1,1,1,1,1,1,1,NULL,'',''),(35,'','',-2,-2,'2015-04-24 14:11:21','2015-04-24 14:11:21',81,0,0,0,0,0,0,0,NULL,'',''),(36,'','',16,16,'2015-04-24 00:00:00','2015-04-25 11:56:39',91,1,1,1,1,1,1,1,NULL,'',''),(37,'','',16,16,'2015-04-24 00:00:00','2015-04-25 11:57:53',92,1,1,1,1,1,1,1,NULL,'',''),(38,'','',-2,-2,'2015-04-24 14:17:20','2015-04-24 14:17:20',83,0,0,0,0,0,0,0,NULL,'',''),(39,'','',16,16,'2015-04-24 00:00:00','2015-04-25 11:59:14',93,1,1,1,1,1,1,1,NULL,'',''),(40,'','',-2,-2,'2015-04-24 14:18:33','2015-04-24 14:18:33',84,0,0,0,0,0,0,0,NULL,'',''),(41,'','',16,16,'2015-04-24 14:20:27','2015-04-24 14:20:27',94,1,1,1,1,1,1,1,NULL,'',''),(42,'','',-2,-2,'2015-04-24 00:00:00','2015-04-24 14:21:07',86,0,0,0,0,0,0,0,NULL,'',''),(43,'','',16,16,'2015-04-24 14:26:35','2015-04-24 14:26:35',95,1,1,1,1,1,1,1,NULL,'',''),(44,'','',16,16,'2015-04-24 14:29:15','2015-04-24 14:29:15',96,1,1,1,1,1,1,1,NULL,'',''),(45,'','',16,16,'2015-04-24 14:32:25','2015-04-24 14:32:25',97,1,1,1,1,1,1,1,NULL,'',''),(46,'','',16,16,'2015-04-24 14:41:38','2015-04-24 14:41:38',98,1,1,1,1,1,1,1,NULL,'',''),(47,'','',-2,-2,'2015-04-24 00:00:00','2015-04-24 14:48:53',104,0,0,0,0,0,0,0,NULL,'',''),(48,'','',16,16,'2015-04-24 14:49:58','2015-04-24 14:49:58',99,1,1,1,1,1,1,1,NULL,'',''),(49,'','',-2,-2,'2015-04-24 14:51:13','2015-04-24 14:51:13',105,0,0,0,0,0,0,0,NULL,'',''),(50,'','',16,16,'2015-04-24 14:51:25','2015-04-24 14:51:25',100,1,1,1,1,1,1,1,NULL,'',''),(51,'','',-2,-2,'2015-04-24 14:52:21','2015-04-24 14:52:21',106,0,0,0,0,0,0,0,NULL,'',''),(52,'','',16,16,'2015-04-24 00:00:00','2015-04-24 14:54:03',101,1,1,1,1,0,1,1,NULL,'',''),(53,'','',-2,-2,'2015-04-24 14:53:19','2015-04-24 14:53:19',107,0,0,0,0,0,0,0,NULL,'',''),(54,'','',16,16,'2015-04-24 00:00:00','2015-04-24 14:53:43',102,1,1,1,1,1,1,1,NULL,'',''),(55,'','',-2,-2,'2015-04-24 14:54:05','2015-04-24 14:54:05',108,0,0,0,0,0,0,0,NULL,'',''),(56,'','',-2,-2,'2015-04-24 14:55:08','2015-04-24 14:55:08',109,0,0,0,0,0,0,0,NULL,'',''),(57,'','',16,16,'2015-04-24 14:55:10','2015-04-24 14:55:10',103,1,1,1,1,1,1,1,NULL,'',''),(58,'','',-2,-2,'2015-04-24 14:55:57','2015-04-24 14:55:57',110,0,0,0,0,0,0,0,NULL,'',''),(60,'','',-2,-2,'2015-04-24 15:11:21','2015-04-24 15:11:21',112,0,0,0,0,0,0,0,NULL,'',''),(61,'','',-2,-2,'2015-04-24 15:26:37','2015-04-24 15:26:37',116,0,0,0,0,0,0,0,NULL,'',''),(62,'','',-2,-2,'2015-04-24 15:27:34','2015-04-24 15:27:34',117,0,0,0,0,0,0,0,NULL,'',''),(63,'','',-2,-2,'2015-04-24 15:28:18','2015-04-24 15:28:18',118,0,0,0,0,0,0,0,NULL,'',''),(64,'','',-2,-2,'2015-04-24 15:28:56','2015-04-24 15:28:56',119,0,0,0,0,0,0,0,NULL,'',''),(66,'','',-2,-2,'2015-04-24 15:34:00','2015-04-24 15:34:00',123,0,0,0,0,0,0,0,NULL,'',''),(67,'','',-2,-2,'2015-04-24 15:34:29','2015-04-24 15:34:29',124,0,0,0,0,0,0,0,NULL,'',''),(68,'','',-2,-2,'2015-04-24 15:52:36','2015-04-24 15:52:36',121,0,0,0,0,0,0,0,NULL,'',''),(69,'','',-2,-2,'2015-04-24 15:53:10','2015-04-24 15:53:10',122,0,0,0,0,0,0,0,NULL,'',''),(70,'','',16,16,'2015-04-25 08:25:01','2015-04-25 08:25:01',35,1,1,1,1,1,1,1,NULL,'','');
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
INSERT INTO `user_role` VALUES (-2,-2),(1,-2),(2,-2),(3,-2),(5,-2),(6,-2),(7,-2),(8,-2),(9,-2),(10,-2),(12,-2),(14,-2),(15,-2),(16,-2),(17,-2),(18,-2),(-2,-1),(1,-1),(5,1),(7,1),(15,1),(5,2),(7,2),(8,2),(10,2),(12,2),(14,2),(15,2),(16,2),(17,2),(18,2),(5,3),(8,3),(10,3),(12,3),(14,3),(16,3),(17,3),(18,3),(1,4),(2,4),(3,4),(6,4),(9,4),(5,6);
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

-- Dump completed on 2015-04-27  2:47:38