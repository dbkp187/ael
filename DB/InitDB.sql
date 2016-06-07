CREATE DATABASE  IF NOT EXISTS `ael` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ael`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: ael
-- ------------------------------------------------------
-- Server version	5.6.24

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
  `unitPrice` decimal(20,2) DEFAULT NULL,
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
INSERT INTO `app_user` VALUES (-2,'\0','\0','','Denver','US','80210','CO','\0','matt@raibledesigns.com','','Matt','Raible','$2a$10$bH/ssqW8OhkTlIso9/yakubYODUOmh.6m5HEJvcBq3t3VdBh7ebqO','Not a female kitty.','','admin',2,'http://raibledesigns.com'),(1,'\0','\0','BAN GIÁM ĐỐC','','','','','\0','yen@aelvn.com','','Hoàng Thị Hải','Yến','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','BGD01',3,''),(2,'\0','\0','BAN GIÁM ĐỐC','','','','','\0','truongpq@aelvn.com','','Phạm Quang','Trưởng','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','BGD02',2,''),(3,'\0','\0','PHÒNG KẾ TOÁN','','','','','\0','account@aelvn.com','','Hoàng Hải','Vân','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','KT01',2,''),(4,'\0','\0','PHÒNG VẬN TẢI','','','','','\0','vtnd@aelvn.com','','Võ Văn','Tuấn','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','VT01',1,''),(5,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','khoilm@aelvn.com','','Lê Minh','Khôi','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','TH01',3,''),(6,'\0','\0','PHÒNG KẾ TOÁN','','','','','\0','account1@aelvn.com','','Lê Thị','Phượng','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','KT02',2,''),(7,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','sales@aelvn.com','','Phan Chinh','Trúc','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','TH02',2,''),(8,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','log01@aelvn.com','','Trần Tuấn','Anh','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','TH03',2,''),(9,'\0','\0','PHÒNG KẾ TOÁN','','','','','\0','admin@aelvn.com','','Lê Thị Hương','Giang','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','KT03',2,''),(10,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','cbd@aelvn.com','','Huỳnh Thanh','Tân','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','TH04',2,''),(12,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','docs@aelvn.com','','Phạm Thị Lệ','Hà','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','TH06',2,''),(14,'\0','\0','PHÒNG VẬN TẢI','','','','','\0','import@aelvn.com','','Hứa Phi','Kỳ','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','VT02',3,''),(15,'\0','\0','PHÒNG VẬN TẢI','','','','','\0','export@aelvn.com','','Hoàng','Tuấn','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','VT03',2,''),(16,'\0','\0','PHÒNG VẬN TẢI','','','','','\0','ops@aelvn.com','','Nguyễn Thị Hải','Vân','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','VT04',2,''),(17,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','cbd@aelvn.com','','Tran Dung','Chinh','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','TH07',3,''),(18,'\0','\0','PHÒNG TỔNG HỢP','','','','','\0','cbd@aelvn.com','','Dương Thanh','Giàu','$2a$10$0doijj4k4c.s2eJDUvCmFeFVyQv/GHeMDWv9OXoNPvdXAqlP53.W.','admin','','TH05',3,'');
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
  CONSTRAINT `filetoTruck` FOREIGN KEY (`trucking`) REFERENCES `truckingservice` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `filetodoc` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `filetosale` FOREIGN KEY (`offerPrice`) REFERENCES `offerprice` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (-10,'Chi phí chi hộ',20,'Thông tin customs service',1,'{1}'),(-6,'Hàng rời',7,'Thông tin Transportation Services',1,NULL),(-5,'Biển',6,'Thông tin customs service',0,NULL),(-4,'Xuất',27,'',1,NULL),(-3,'Nhập',27,'',1,NULL),(-2,'LCL',7,NULL,1,NULL),(-1,'FCL',7,NULL,1,NULL),(60,'Công ty nước ngoài',4,'Thông tin customer',1,NULL),(61,'Công ty Việt Nam',4,'Thông tin customer',1,NULL),(62,'Công ty đầu tư nước ngoài',4,'Thông tin customer',1,NULL),(63,'Công ty liên doanh',4,'Thông tin customer',1,NULL),(64,'Doanh nghiệp chế xuất',4,'Thông tin customer',1,NULL),(65,'Văn phòng đại diện',4,'Thông tin customer',1,NULL),(66,'Vietnam',5,'Thông tin customer',1,NULL),(67,'Thailand',5,'Thông tin customer',1,NULL),(68,'Singapore',5,'Thông tin customer',1,NULL),(69,'Campodia',5,'Thông tin customer',1,NULL),(70,'Malaysia',5,'Thông tin customer',1,NULL),(71,'Indonesia',5,'Thông tin customer',1,NULL),(72,'Philippine',5,'Thông tin customer',1,NULL),(73,'Myanmar',5,'Thông tin customer',1,NULL),(74,'China',5,'Thông tin customer',1,NULL),(75,'Korea',5,'Thông tin customer',1,NULL),(76,'Japan',5,'Thông tin customer',1,NULL),(77,'Taiwan',5,'Thông tin customer',1,NULL),(78,'Hongkong',5,'Thông tin customer',1,NULL),(79,'Germany',5,'Thông tin customer',1,NULL),(80,'Denmark',5,'Thông tin customer',1,NULL),(81,'France',5,'Thông tin customer',1,NULL),(82,'England',5,'Thông tin customer',1,NULL),(83,'Nertherland',5,'Thông tin customer',1,NULL),(84,'Australia',5,'Thông tin customer',1,NULL),(85,'USA',5,'Thông tin customer',1,NULL),(86,'Dịch vụ hải quan',0,'Thông tin báo giá',1,NULL),(87,'Dịch vụ vận chuyển',0,'Thông tin báo giá',1,NULL),(88,'Dịch vụ hải quan và vận chuyển',0,'Thông tin báo giá',1,NULL),(89,'Dịch vụ triển lãm',0,'Thông tin báo giá',1,NULL),(90,'Dịch vụ đóng gói, lắp đặt',0,'Thông tin báo giá',1,NULL),(91,'VND',1,'Thông tin báo giá',1,NULL),(92,'USD',1,'Thông tin báo giá',1,NULL),(93,'SGD',1,'Thông tin báo giá',1,NULL),(94,'AUD',1,'Thông tin báo giá',1,NULL),(96,'Xuất kinh doanh',11,'Thông tin customs service',1,NULL),(97,'Xuất phi mậu dịch',11,'Thông tin customs service',1,NULL),(98,'Tạm xuất tái nhập',11,'Thông tin customs service',1,NULL),(99,'Nhập SXXK',11,'Thông tin customs service',1,NULL),(100,'Tái xuất',11,'Thông tin customs service',1,NULL),(101,'Xuất SXXK',11,'Thông tin customs service',1,NULL),(102,'Nhập kinh doanh',11,'Thông tin customs service',1,NULL),(103,'Nhập phi mậu dịch',11,'Thông tin customs service',1,NULL),(104,'Tạm nhập tái xuất',11,'Thông tin customs service',1,NULL),(105,'Đường không',6,'Thông tin customs service',1,NULL),(107,'NYK',12,'Thông tin customs service',1,NULL),(108,'APL',12,'Thông tin customs service',1,NULL),(109,'MOL',12,'Thông tin customs service',1,NULL),(110,'OOCL',12,'Thông tin customs service',1,NULL),(111,'COSCO',12,'Thông tin customs service',1,NULL),(112,'PIL',12,'Thông tin customs service',1,NULL),(113,'NAMSUNG',12,'Thông tin customs service',1,NULL),(114,'INTERASIA',12,'Thông tin customs service',1,NULL),(115,'TSLINE',12,'Thông tin customs service',1,NULL),(116,'MYANGMINH',12,'Thông tin customs service',1,NULL),(117,'SITC',12,'Thông tin customs service',1,NULL),(118,'RCL',12,'Thông tin customs service',1,NULL),(119,'KLINE',12,'Thông tin customs service',1,NULL),(120,'UASC',12,'Thông tin customs service',1,NULL),(121,'MAERSK',12,'Thông tin customs service',1,NULL),(122,'BIEN DONG',12,'Thông tin customs service',1,NULL),(123,'MARINA',12,'Thông tin customs service',1,NULL),(124,'VOSCO',12,'Thông tin customs service',1,NULL),(125,'SINOKOR',12,'Thông tin customs service',1,NULL),(126,'DHL',12,'Thông tin customs service',1,NULL),(127,'FEDEX',12,'Thông tin customs service',1,NULL),(128,'TNT',12,'Thông tin customs service',1,NULL),(129,'Quản lý hàng đầu tư HCM',13,'Thông tin customs service',1,NULL),(130,'Mỹ Phước 1',13,'Thông tin customs service',1,NULL),(131,'Cảng Bình Dương',13,'Thông tin customs service',1,NULL),(132,'VSIP',13,'Thông tin customs service',1,NULL),(133,'Biên Hoà',13,'Thông tin customs service',1,NULL),(134,'Long Bình Tân',13,'Thông tin customs service',1,NULL),(135,'Cảng Cát Lái',13,'Thông tin customs service',1,NULL),(136,'Khánh Hội',13,'Thông tin customs service',1,NULL),(155,'VICT',13,'Thông tin customs service',1,NULL),(156,'Bến Nghé',13,'Thông tin customs service',1,NULL),(157,'ICD TRANSIMEX',13,'Thông tin customs service',1,NULL),(158,'ICD Phước Long 1',13,'Thông tin customs service',1,NULL),(159,'ICD Phước Long 3',13,'Thông tin customs service',1,NULL),(160,'ICD TAMAMEXCO',13,'Thông tin customs service',1,NULL),(161,'ICD SOTRANS',13,'Thông tin customs service',1,NULL),(162,'Cảng Hải Phòng',13,'Thông tin customs service',1,NULL),(163,'Bắc Hà Nội',13,'Thông tin customs service',1,NULL),(164,'1',8,'GREEN',1,NULL),(165,'2',8,'YELLOW',1,NULL),(166,'3',8,'RED',1,NULL),(167,'20 DR',10,'Thông tin CONT',1,NULL),(168,'20 FR',10,'Thông tin CONT',1,NULL),(169,'20 OP',10,'Thông tin CONT',1,NULL),(170,'20 TK',10,'Thông tin CONT',1,NULL),(171,'40 DR',10,'Thông tin CONT',1,NULL),(172,'40 HQ',10,'Thông tin CONT',1,NULL),(173,'40 FR',10,'Thông tin CONT',1,NULL),(174,'40 OP',10,'Thông tin CONT',1,NULL),(175,'40 TK',10,'Thông tin CONT',1,NULL),(176,'45 HQ',10,'Thông tin CONT',1,NULL),(178,'Chi phí AEL',20,'Thông tin customs service',1,NULL),(180,'Khác',20,'Thông tin customs service',1,NULL),(200,'Xuất',14,'Thông tin Transportation Services',1,NULL),(201,'Nhập',14,'Thông tin Transportation Services',1,NULL),(202,'Chuyển kho',14,'Thông tin Transportation Services',1,NULL),(203,'Bắc - Nam',15,'Thông tin Transportation Services',1,NULL),(204,'Nam - Bắc',15,'Thông tin Transportation Services',1,NULL),(205,'Tạm xuất',17,'Thông tin exhibition',1,NULL),(206,'Tạm nhập',17,'Thông tin exhibition',1,NULL),(207,'Xuất KD',17,'Thông tin exhibition',1,NULL),(208,'Tái nhập',17,'Thông tin exhibition',1,NULL),(209,'Nhập sau',17,'Thông tin exhibition',1,NULL),(210,'Onsite',17,'Thông tin exhibition',1,NULL),(211,'Phí xin GP',21,'Thông tin exhibition',1,NULL),(212,'Local charge at depart',21,'Thông tin exhibition',1,NULL),(213,'Local charge at dest',21,'Thông tin exhibition',1,NULL),(214,'Phí onsite',21,'Thông tin exhibition',1,NULL),(215,'Phí XN - CN',21,'Thông tin exhibition',1,NULL),(216,'Phí giao nhận',21,'Thông tin exhibition',1,NULL),(217,'Phí OF',21,'Thông tin exhibition',1,NULL),(218,'Phí đại lý',21,'Thông tin exhibition',1,NULL),(219,'Tiền thuế XNK',21,'Thông tin exhibition',1,NULL),(220,'Phí khác',21,'Thông tin exhibition',1,NULL),(260,'Phí dịch vụ hải quan và vận chuyển',23,'',1,NULL),(261,'Customs clearance  & Transportation fee',24,'',1,NULL),(271,'Cái',3,NULL,1,NULL),(272,'Con',3,NULL,1,NULL),(274,'Lào',5,NULL,1,NULL),(283,'Inward handling',25,NULL,1,NULL),(284,'Outward',25,NULL,1,NULL),(286,'Đường bộ',6,'',1,NULL),(287,'Loại khác',14,'',1,NULL),(288,'Loại khác',0,NULL,1,NULL),(289,'Mua tài sản',19,'',1,''),(290,'Mua công cụ dụng cụ',19,'',1,''),(291,'value',0,'description',0,'implyActions'),(292,'Thanh toán cho người lao động',19,'',1,''),(293,'Tiền lương',19,'',1,''),(294,'Tiền thưởng',19,'',1,''),(295,'Tiền phụ cấp',19,'',1,''),(296,'Chi phí dịch vụ mua ngoài',19,'',1,''),(297,'Tiền điện',19,'',1,''),(298,'Tiền nước',19,'',1,''),(299,'Tiền điện thoại',19,'',1,''),(300,'Tiền thuê văn phòng, cửa hàng, thuê tài sản',19,'',1,''),(301,'Thuê bốc dỡ, vận chuyển',19,'',1,''),(302,'Tiền hoa hồng đại lý',19,'',1,''),(303,'Tiền thuê sửa chữa TSCĐ',19,'',1,''),(304,'Chi phí bằng tiền khác',19,'',1,''),(305,'Văn phòng phẩm',19,'',1,''),(306,'Công tác phí',19,'',1,''),(307,'Đào tạo cán bộ',19,'',1,''),(308,'Hội nghị',19,'',1,''),(309,'Tiếp khách',19,'',1,''),(310,'Tuyển dụng',19,'',1,''),(311,'Chi phí quảng cáo, giới thiệu sản phẩm, hàng hóa',19,'',1,''),(312,'Chi phí mua hàng',19,'',1,''),(313,'Cước vận chuyển',19,'',1,''),(314,'Cước vận chuyển nội địa',19,'',1,''),(315,'Cước vận chuyển quốc tế',19,'',1,''),(316,'Chi phí nâng hạ',19,'',1,''),(317,'Phát sinh',19,'',1,''),(318,'Phí hạ',19,'',1,''),(319,'Phí nâng',19,'',1,''),(320,'Phí lấy lệnh',19,'',1,''),(321,'Phí chứng từ',19,'',1,''),(322,'Phí D/O',19,'',1,''),(323,'Phí xếp dỡ',19,'',1,''),(324,'Phí lưu con, lưu bãi, lưu kho',19,'',1,''),(325,'Phí lưu bãi',19,'',1,''),(326,'Phí lưu cont',19,'',1,''),(327,'Phí lưu kho',19,'',1,''),(328,'Phí vệ sinh',19,'',1,''),(329,'Phí sữa chữa',19,'',1,''),(330,'Phí kiểm dịch',19,'',1,''),(331,'Chi phí hải quan',19,'',1,''),(332,'Chi phí khác',19,'',1,''),(333,'Lệ phí hải quan',19,'',1,''),(334,'Phí bốc hàng',19,'',1,''),(335,'Phí ký chứng từ',19,'',1,''),(336,'Phí làm kiểm dịch',19,'',1,''),(337,'Phí thanh lý',19,'',1,''),(338,'Chi phí xe cont, xe tải',19,'',1,''),(339,'Chi phí xe cont',19,'',1,''),(340,'CP khoán xe cont',19,'',1,''),(341,'Dầu DO xe cont',19,'',1,''),(342,'Lương tài xế',19,'',1,''),(343,'Nâng hạ, bốc xếp, cầu đường',19,'',1,''),(344,'Chi phí xe tải',19,'',1,''),(345,'Chi phí khoán xe tải',19,'',1,''),(346,'Chi phí dầu DO xe tải',19,'',1,''),(347,'value',0,'description',0,'implyActions'),(348,'TEST_Ban tổ chức',22,'',1,NULL),(349,'EWEW',22,NULL,1,NULL),(350,'asdsadas',19,NULL,1,NULL),(351,'wewrw',19,NULL,1,NULL),(352,'wer',10,NULL,1,NULL),(353,'hhhhh',22,NULL,1,NULL),(354,'TEST',26,NULL,1,NULL),(355,'Triển lãm nhà',29,NULL,1,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'CÔNG TY TNHH AGILITY','364 Cộng Hòa- Phường 13- Quận Tân Bình- Tp.HCM','000','','','364 Cộng Hòa- Phường 13- Quận Tân Bình- Tp.HCM','',63,66,'AGILI',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(2,'CÔNG TY TNHH AGILITY LOGISTICS VIỆT NAM','364 Đường Cộng Hòa- Phường 13- Quận Tân Bình- Tp.HCM','000','','','364 Đường Cộng Hòa- Phường 13- Quận Tân Bình- Tp.HCM','',63,66,'AGILOG',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(3,'CÔNG TY TNHH BA HÁT','Ấp 1A- Xã An Phú- Thị Xã Thuận An- Tỉnh Bình Dương','000','','','Ấp 1A- Xã An Phú- Thị Xã Thuận An- Tỉnh Bình Dương','',63,66,'BAHAT',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(4,'CÔNG TY TNHH SX - XK HÀNG TCMN & TM BẮC NINH','Nhà số 5- ngách 43/98- đường Cổ Nhuế- Phường Cổ Nhuế 2- Quận Bắc Từ Liêm- TP Hà Nội','000','','','Nhà số 5- ngách 43/98- đường Cổ Nhuế- Phường Cổ Nhuế 2- Quận Bắc Từ Liêm- TP Hà Nội','',63,66,'BCNINH',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(5,'CÔNG TY CỔ PHẦN ĐẦU TƯ CẢNG CÁI LÂN','Số 1 đường Cái Lân- Tp Hạ Long- Tỉnh Quảng Ninh','000','','','Số 1 đường Cái Lân- Tp Hạ Long- Tỉnh Quảng Ninh','',63,66,'CAILAN',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(6,'CÔNG TY TNHH TRE NỨA CUỐN MỸ NGHỆ CÁT ĐẰNG','Yên Tiến- Ý Yên- Nam Định','000','','','Yên Tiến- Ý Yên- Nam Định','',63,66,'CDANG',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(7,'CN CTY CP VẬN TAI VÀ TIẾP VẬN CHÂU Á THÁI BÌNH DƯƠNG (TP HN)','07 Nguyễn Huệ- Phường Bến Nghé- Quận 1- TP HCM','000','','','07 Nguyễn Huệ- Phường Bến Nghé- Quận 1- TP HCM','',63,66,'CATBD',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(8,'CÔNG TY TNHH CÔNG NGHIỆP SẮT THÉP CONNEX-AIKO','Lô C-8D-CN- Khu Công Nghiệp Mỹ Phước 3- Huyện Bến Cát- Tỉnh Bình Dương','000','','','Lô C-8D-CN- Khu Công Nghiệp Mỹ Phước 3- Huyện Bến Cát- Tỉnh Bình Dương','',63,66,'CONNEX',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(9,'CÔNG TY TNHH CỬA ĐỎ','212 Nguyễn Sơn- Phường Bồ Đề- Quận Long Biên- Hà Nội','000','','','212 Nguyễn Sơn- Phường Bồ Đề- Quận Long Biên- Hà Nội','',63,66,'CUADO',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(10,'CÔNG TY TNHH MỘT THÀNH VIÊN DADU VIỆT NAM','Lô số 14-16-18-20- Đường số 3- KCN Tân Đức- Xã Đức Hòa Hạ- Huyện Đức Hóa- Tỉnh Long An','000','','','Lô số 14-16-18-20- Đường số 3- KCN Tân Đức- Xã Đức Hòa Hạ- Huyện Đức Hóa- Tỉnh Long An','',63,66,'DADUVN',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(11,'CÔNG TY TNHH MTV TM-DV ĐÀI BẮC','Số 31- đường số 6- tổ 8- Ấp Bàu Sim- ã Tân Thông Hội- Huyện Củ Chi- TP HCM','000','','','Số 31- đường số 6- tổ 8- Ấp Bàu Sim- ã Tân Thông Hội- Huyện Củ Chi- TP HCM','',63,66,'DAIBAC',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(12,'CÔNG TY CỔ PHẦN ĐẠI ĐỒNG TIẾN','216 Tân Thành- P. 15- Q. 5- TP HCM.','000','','','216 Tân Thành- P. 15- Q. 5- TP HCM.','',63,66,'DDTIEN',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(13,'CÔNG TY TNHH ĐẠI TÂN','Khu A- Lô G.27C - 28B- đường số 8- KCX Tân Thuận- P. Tân Thuận Đông- Quận 7- TP HCM','000','','','Khu A- Lô G.27C - 28B- đường số 8- KCX Tân Thuận- P. Tân Thuận Đông- Quận 7- TP HCM','',63,66,'DAITAN',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(14,'CTY TNHH ĐẠI THÀNH','Ấp Đông Hòa- Xã Song Thuận- Huyện Châu Thành- Tỉnh Tiền Giang','000','','','Ấp Đông Hòa- Xã Song Thuận- Huyện Châu Thành- Tỉnh Tiền Giang','',63,66,'DTHANH',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(15,'CÔNG TY TNHH XUẤT KHẨU THỦ CÔNG MỸ NGHỆ ĐẠI VIỆT','Thôn Thái Hòa- Xã Bình Phú- Huyện Thạch Thất- TP Hà Nội','000','','','Thôn Thái Hòa- Xã Bình Phú- Huyện Thạch Thất- TP Hà Nội','',63,66,'DAIVIET',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(16,'CTY TNHH TB DẦU KHÍ SCHOELLER BLECKMANN VN','Lô B2.6- đường D3- KCN Đông An 2- TP Thủ Dầu Một- Tỉnh Bình Dương- VN','000','','','Lô B2.6- đường D3- KCN Đông An 2- TP Thủ Dầu Một- Tỉnh Bình Dương- VN','',63,66,'DKSBVN',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(17,'CHI NHÁNH CÔNG TY TNHH QUỐC TẾ DELTA TẠI BÌNH DƯƠNG','Số 1/497- Tổ 4- KP Hòa Lân 2- P. Thuận Giao- TX. Thuận An- Tỉnh Bình Dương','000','','','Số 1/497- Tổ 4- KP Hòa Lân 2- P. Thuận Giao- TX. Thuận An- Tỉnh Bình Dương','',63,66,'DELTA',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(18,'CÔNG TY LIÊN DOANH ĐỒ GỖ QUỐC TẾ','14 -16- 18 Song Hành- KCN Tân Tạo- Quận Bình Tân- TP HCM','000','','','14 -16- 18 Song Hành- KCN Tân Tạo- Quận Bình Tân- TP HCM','',63,66,'DGQTE',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(20,'CÔNG TY CỔ PHẦN FECON MILTEC','Lô NX_D2- KCN Long Hậu- Long Hậu- Cần Giuộc- Long An.','000','','','Lô NX_D2- KCN Long Hậu- Long Hậu- Cần Giuộc- Long An.','',63,66,'FCMTEC',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(21,'CÔNG TY CỔ PHẦN TIẾP VẬN FIAN','Phòng TH6- Lầu 3- Số 02 Phùng Khắc Khoan- P.Đa Kao- Quận 1- TP HCM','000','','','Phòng TH6- Lầu 3- Số 02 Phùng Khắc Khoan- P.Đa Kao- Quận 1- TP HCM','',63,66,'TVFIAN',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(22,'CÔNG TY TNHH GEA REFRIGERATION VIỆT NAM','3G Phổ Quang- Phường 2- Q. Tân Bình- Tp.HCM','000','','','3G Phổ Quang- Phường 2- Q. Tân Bình- Tp.HCM','',63,66,'GEARVN',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(23,'CÔNG TY TNHH GLOBE EXPRESS VIỆT NAM','P.102- Lầu 01- Số 43 Mạc Đĩnh Chi- Quân 1- TP HCM','000','','','P.102- Lầu 01- Số 43 Mạc Đĩnh Chi- Quân 1- TP HCM','',63,66,'GLOEX',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(24,'CÔNG TY CP SẢN XUẤT - THƯƠNG MẠI XUẤT NHẬP KHẨU VỚ HẠNH TRANG','106/26 Tôn Thất Hiệp- Phường 13- Quận 11- TP CHM','000','','','106/26 Tôn Thất Hiệp- Phường 13- Quận 11- TP CHM','',63,66,'HTRANG',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(25,'DOANH NGHIỆP TƯ NHÂN HIỀN UYÊN VI','22C/4 đường 672- P.Phước Long B- Quận 9- TP HCM','000','','','22C/4 đường 672- P.Phước Long B- Quận 9- TP HCM','',63,66,'HIUYVI',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(26,'CÔNG TY TNHH HITACHI TRANSPORT SYSTEM','Số 20- đường Sông Thao- phường 2- Quận Tân Bình- TP HCM','000','','','Số 20- đường Sông Thao- phường 2- Quận Tân Bình- TP HCM','',63,66,'HITACH',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(27,'CÔNG TY TNHH GIAO NHẬN VẬN TẢI QUỐC TẾ HOÀNG MẠNH LONG','218/28 Tô Ngọc Vân- Phường Linh Đông- Quận Thủ Đức- TP HCM','000','','','218/28 Tô Ngọc Vân- Phường Linh Đông- Quận Thủ Đức- TP HCM','',63,66,'HOMALO',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(28,'CÔNG TY TNHH TMDV HOMY','144 Đường D1- Phường 25- Quận Bình Thạnh- Tp.HCM','000','','','144 Đường D1- Phường 25- Quận Bình Thạnh- Tp.HCM','',63,66,'HOMY',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(29,'CÔNG TY TNHH HỐ NAI','Khu phố 8- phường Long Bình- Biên Hòa- Đồng Nai','000','','','Khu phố 8- phường Long Bình- Biên Hòa- Đồng Nai','',63,66,'HONAI',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(30,'CÔNG TY TNHH ISHIDA VIỆT NAM','R4 - 51 Hưng Phước 4- Phường Tân Phong- Quận 7- TP HCM.','000','','','R4 - 51 Hưng Phước 4- Phường Tân Phong- Quận 7- TP HCM.','',63,66,'ISHIDA',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(31,'CÔNG TY TNHH DỊCH VỤ HÀNG HẢI JARDINE (VIỆT NAM)','Phòng 304- Lầu 3- Số 2 Bis 4-6 Lê Thánh Tôn- Phường Bến Nghé- Quận 1- TP HCM','000','','','Phòng 304- Lầu 3- Số 2 Bis 4-6 Lê Thánh Tôn- Phường Bến Nghé- Quận 1- TP HCM','',63,66,'JARDINE',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(32,'CÔNG TY TNHH MTV JORDAN MANUFACTURING VIỆT NAM','Lô IV- 16A-16B- Nhóm Công Nghiệp IV- KCN Tân Bình- P.Tây Thạnh- Q.Tân Phú- TP HCM','000','','','Lô IV- 16A-16B- Nhóm Công Nghiệp IV- KCN Tân Bình- P.Tây Thạnh- Q.Tân Phú- TP HCM','',63,66,'JORDAN',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(33,'CÔNG TY TNHH GIAO NHẬN VẬN TẢI DẦU KHÍ KIM LIÊN','99 Lê Văn Lương- Xã Phước Kiển- Huyện Nhà Bè- Tp HCM','000','','','99 Lê Văn Lương- Xã Phước Kiển- Huyện Nhà Bè- Tp HCM','',63,66,'KIMLIEN',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(34,'CÔNG TY TNHH VẬN TẢI LÂM VINH','448B Nguyễn Tất Thành- Phường 18- Quận 4- Tp.HCM','000','','','448B Nguyễn Tất Thành- Phường 18- Quận 4- Tp.HCM','',63,66,'LAMVINH',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(35,'CTY TNHH DV VT LONG PHÚ LIBERTY','236/3 Điện Biên Phủ- P.17- Q.Bình Thạnh- TP HCM','000','','','236/3 Điện Biên Phủ- P.17- Q.Bình Thạnh- TP HCM','',63,66,'LOPHU',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(36,'CÔNG TY TNHH MAICO','216/5 KP 4- P. An Phú- TX. Thuận An- Bình Dương.','000','','','216/5 KP 4- P. An Phú- TX. Thuận An- Bình Dương.','',63,66,'MAICO',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(37,'CÔNG TY TNHH MẦM XANH VIỆT','28/1/29 Đường số 10- khu phố 3- P.Linh Trung- Q.Thủ Đức- Tp HCM','000','','','28/1/29 Đường số 10- khu phố 3- P.Linh Trung- Q.Thủ Đức- Tp HCM','',63,66,'MAXAVI',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(38,'VPĐD MAREL FOOD SYSTEMS LTD.TẠI TP.HCM','10 Hưng Phước 3- Tân Phong- Quận 7- TP HCM','000','','','10 Hưng Phước 3- Tân Phong- Quận 7- TP HCM','',63,66,'MAFOSY',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(39,'CÔNG TY TNHH CƠ KHÍ CHÍNH XÁC MIEN HUA','Quốc Lộ 1A- P.Tân Khánh- TP Tân An- Long An','000','','','Quốc Lộ 1A- P.Tân Khánh- TP Tân An- Long An','',63,66,'MIEHUA',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(40,'CÔNG TY TNHH QUỐC TẾ MINH ANH','36 Trần Văn Quang- Phường 10- Quận Tân Bình- Tp HCM','000','','','36 Trần Văn Quang- Phường 10- Quận Tân Bình- Tp HCM','',63,66,'MINANH',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(41,'CÔNG TY TNHH MKP SHIPPING','52 Đường 239- Cư Xá Bùi Minh Trực- Phường 5- Quận 8- TP HCM','000','','','52 Đường 239- Cư Xá Bùi Minh Trực- Phường 5- Quận 8- TP HCM','',63,66,'MKPSH',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(42,'CÔNG TY CP TẬP ĐÒAN MUỐI MIỀN NAM','173 Hai Bà Trưng- Phường 6- Quận 3- Tp.HCM','000','','','173 Hai Bà Trưng- Phường 6- Quận 3- Tp.HCM','',63,66,'MUMINA',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(43,'CÔNG TY TNHH VẬN TẢI NGUYÊN THÀNH','63A An Phú Đông 27- Phường An Phú Đông- Quận 12- Tp.HCM','000','','','63A An Phú Đông 27- Phường An Phú Đông- Quận 12- Tp.HCM','',63,66,'NGUTHA',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(44,'CÔNG TY CỔ PHẦN ĐẦU TƯ NHÀ BÈ','Khu phố 3- Bến Nghé- Phường Tân Thuận Đông- Quận 7- TP HCM','000','','','Khu phố 3- Bến Nghé- Phường Tân Thuận Đông- Quận 7- TP HCM','',63,66,'NHABE',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(45,'CÔNG TY CỔ PHẦN OTRAN LOGISTICS','Đường số 4- KCN Phú Mỹ 1- Thị Trấn Phú Mỹ- Huyện Tân Thành- Bà Rịa - Vũng Tàu','000','','','Đường số 4- KCN Phú Mỹ 1- Thị Trấn Phú Mỹ- Huyện Tân Thành- Bà Rịa - Vũng Tàu','',63,66,'OTRALO',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(46,'CÔNG TY TNHH NHÀ THÉP PEB','KCN Đông Xuyên- P. Rạch Dừa- TP Vũng Tàu','000','','','KCN Đông Xuyên- P. Rạch Dừa- TP Vũng Tàu','',63,66,'PEBSTB',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(47,'CÔNG TY TNHH TM & DV GIAO NHẬN VẬN TẢI PHƯƠNG NHUNG','193/2D Bùi Thị xuân- Phường 1- Quận tân Bình- TP HCM','000','','','193/2D Bùi Thị xuân- Phường 1- Quận tân Bình- TP HCM','',63,66,'PHUNHU',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(48,'CÔNG TY CỔ PHẦN TƯ VẤN ĐẦU TƯ QUỐC TẾ PROMANA','193-203 Trần Hưng Đạo- Phường Cô Giang- Quận 1- TP HCM','000','','','193-203 Trần Hưng Đạo- Phường Cô Giang- Quận 1- TP HCM','',63,66,'PRMANA',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(49,'CÔNG TY TNHH SCG TRADING VIỆT NAM','117 - 119 Lý Chính Thắng- Phường 7- Quận 3- Tp.HCM','000','','','117 - 119 Lý Chính Thắng- Phường 7- Quận 3- Tp.HCM','',63,66,'SCGVN',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(50,'CÔNG TY TNHH GIẤY KRAFT VINA','VINA KRAFT PAPER CO.- LTD  - VINA KRAFT','000','','','VINA KRAFT PAPER CO.- LTD  - VINA KRAFT','',63,66,'SCGVKP',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(51,'CÔNG TY CÔNG NGHIỆP TÂN Á',' NEW ASIA   INDUSTRIAL CO.- LTD - NAI','000','','',' NEW ASIA   INDUSTRIAL CO.- LTD - NAI','',63,66,'SCGNAI',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(52,'CÔNG TY CP ĐẦU TƯ VÀ CÔNG NGHIỆP BỬU LONG','BUU  LONG  INDUSTRIAL & INVESTMENT  CO.- LTD','000','','','BUU  LONG  INDUSTRIAL & INVESTMENT  CO.- LTD','',63,66,'SCGBLG',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(53,'CÔNG TY TNHH NGÓI BÊ TÔNG SCG ( Việt Nam )- ','CÔNG TY TNHH NGÓI BÊ TÔNG SCG ( Việt Nam )- ','000','','','CÔNG TY TNHH NGÓI BÊ TÔNG SCG ( Việt Nam )- ','',63,66,'SCGCVN',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(54,'CÔNG TY TNHH SẢN XUẤT BAO BÌ ALCAMAX (VN)',' ALCAMAX (VN) PACKGAGING CO.- LTD','000','','',' ALCAMAX (VN) PACKGAGING CO.- LTD','',63,66,'SCGALC',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(55,'CÔNG TY TNHH QUỐC TẾ BJC VIỆT NAM','BJC VIỆT NAM CO.- LTD','000','','','BJC VIỆT NAM CO.- LTD','',63,66,'SCGBJC',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(56,'CÔNG TY TNHH LUCKY STAR PLAST','LUCKY STAR PLAST CO.- LTD','000','','','LUCKY STAR PLAST CO.- LTD','',63,66,'SCGLSP',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(57,'CÔNG TY TNHH SẢN XUẤT BAO BÌ PACKAMEX (VIỆT NAM )',' PACKAMEX (VIỆT NAM ) CO.- LTD','000','','',' PACKAMEX (VIỆT NAM ) CO.- LTD','',63,66,'SCGPKM',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(58,'CÔNG TY TNHH CHEMTECH',' CHEMTECH CO.- LTD','000','','',' CHEMTECH CO.- LTD','',63,66,'SCGCHT',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(59,'CÔNG TY TNHH BỒN NƯỚC BÌNH MINH','BINH MINH CO.- LTD','000','','','BINH MINH CO.- LTD','',63,66,'SCGBMH',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(60,'CÔNG TY TNHH SX VÀ TM BỒN NƯỚC HỮU THÀNH','HUU THANH CO.- LTD','000','','','HUU THANH CO.- LTD','',63,66,'SCGHTH',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(61,'CÔNG TY TNHH THỰC PHẨM TƯƠI SỐNG VÀ KHO LẠNH','ROYAL FOOD CO.- LTD','000','','','ROYAL FOOD CO.- LTD','',63,66,'SCGRYF',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(62,'CÔNG TY CỔ PHẦN QUỐC TẾ SƠN HÀ','Lô CN1- Cụm Công Nghiệp Từ Liêm - Phường Minh Khai- quận Bắc Từ Liêm- TP Hà Nội- Việt Nam','000','','','Lô CN1- Cụm Công Nghiệp Từ Liêm - Phường Minh Khai- quận Bắc Từ Liêm- TP Hà Nội- Việt Nam','',63,66,'SONHA',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(63,'CÔNG TY SONG LONG','','000','','','','',63,66,'SOLONG',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(64,'CÔNG TY TNHH THẾ GIỚI SƠN MÀI','788 La Thành- Phường Giảng Võ- Quận Ba Đình- Tp Hà Nội- Việt Nam','000','','','788 La Thành- Phường Giảng Võ- Quận Ba Đình- Tp Hà Nội- Việt Nam','',63,66,'SONMAI',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(65,'CÔNG TY TNHH NỘI THẤT - SƠN MÀI VIỆT','Thôn Bối Khê- Xã Chuyên Mỹ- Huyện Phú xuyên- Hà Nội','000','','','Thôn Bối Khê- Xã Chuyên Mỹ- Huyện Phú xuyên- Hà Nội','',63,66,'SOMAVI',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(66,'CÔNG TY TNHH SURINT OMYA VIET NAM','khu công nghiệp Gò dầu- Long Thành- Đồng Nai','000','','','khu công nghiệp Gò dầu- Long Thành- Đồng Nai','',63,66,'SURINT',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(67,'CÔNG TY TNHH DỊCH VỤ GIAO NHẬN T & A','49 Phòng 05 tầng trệt- Trường Sơn- Phường 2- Quận Tân Bình- Tp HCM- Việt Nam','000','','','49 Phòng 05 tầng trệt- Trường Sơn- Phường 2- Quận Tân Bình- Tp HCM- Việt Nam','',63,66,'GNT&A',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(68,'CÔNG TY TNHH GIAO NHẬN VẬN TẢI T.A.M','649/40 Điện Biên Phủ- Phường 25- Q. Bình Thạnh- Tp. Hồ Chí Minh','000','','','649/40 Điện Biên Phủ- Phường 25- Q. Bình Thạnh- Tp. Hồ Chí Minh','',63,66,'VTTAM',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(69,'CÔNG TY TNHH T.M VINA','Lô H1- H2- KCN Minh Hưng- Xã Minh Hưng- Huyện Chơn Thành- Bình Phước','000','','','Lô H1- H2- KCN Minh Hưng- Xã Minh Hưng- Huyện Chơn Thành- Bình Phước','',63,66,'T.MVINA',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(70,'CÔNG TY TNHH GIAO NHẬN T.A.C','2A Nguyễn Thị Minh Khai- P. Đa Kao- Quận 1- Tp.HCM','000','','','2A Nguyễn Thị Minh Khai- P. Đa Kao- Quận 1- Tp.HCM','',63,66,'GNTAC',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(71,'CÔNG TY ĐIỆN VÀ ĐIỆN TỬ TCL (VIỆT NAM)','Phường Tân Biên- Thành phố Biên Hòa- Tỉnh Đồng Nai','000','','','Phường Tân Biên- Thành phố Biên Hòa- Tỉnh Đồng Nai','',63,66,'DTTCL',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(72,'CÔNG TY CỔ PHẦN THÀNH ĐỒNG','Bình Dương- Đông Triều- Quảng Ninh','000','','','Bình Dương- Đông Triều- Quảng Ninh','',63,66,'THADON',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(73,'CÔNG TY TNHH THIẾT KẾ QUẬN TÁM','343-345 Bến Bình Đông- P. 11- Q. 8- TP HCM','000','','','343-345 Bến Bình Đông- P. 11- Q. 8- TP HCM','',63,66,'THKEQ8',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(74,'CÔNG TY CỔ PHẦN QUỐC TẾ TICO','Số 1- ngách 165/53 Đường Cầu Giấy- Phường Dịch Vọng- Quận Cầu Giấy- TP.Hà Nội','000','','','Số 1- ngách 165/53 Đường Cầu Giấy- Phường Dịch Vọng- Quận Cầu Giấy- TP.Hà Nội','',63,66,'QTTICO',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(75,'CÔNG TY CỔ PHẦN THÔNG QUAN ĐẠI TÍN','Số 06 Lê Văn Thiêm- Pường Tân Phong- Quận 7- TP HCM','000','','','Số 06 Lê Văn Thiêm- Pường Tân Phong- Quận 7- TP HCM','',63,66,'DAITIN',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(76,'CÔNG TY CỔ PHẦN VẬN TẢI QUỐC TẾ TIẾN TỚI THÀNH CÔNG','Phòng 65- tầng 3- 49 Hoàng Văn Thụ- Phường 15- Quận Phú Nhuận- TP HCM','000','','','Phòng 65- tầng 3- 49 Hoàng Văn Thụ- Phường 15- Quận Phú Nhuận- TP HCM','',63,66,'TTTHCO',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(77,'VĂN PHÒNG TỔNG CỤC DẠY NGHỀ','37B Nguyễn Bỉnh Khiêm- Hai Bà Trưng- Hà Nội','000','','','37B Nguyễn Bỉnh Khiêm- Hai Bà Trưng- Hà Nội','',63,66,'VPTCDN',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27'),(78,'CÔNG TY TNHH YNG HUA VIỆT NAM','Lô 24- KCN Biên Hòa 2- P.An Bình- TP Biên Hòa- Đồng Nai','000','','','Lô 24- KCN Biên Hòa 2- P.An Bình- TP Biên Hòa- Đồng Nai','',63,66,'YNGHUA',-2,-2,'2015-05-29 23:09:27','2015-05-29 15:09:27');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `noOfPkgs` int(10) DEFAULT NULL,
  `weigth` decimal(15,2) DEFAULT NULL,
  `cmb` decimal(15,3) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `refund` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nameOfFee_idx` (`name`),
  KEY `feeToexhibition_idx` (`docsgeneral`),
  KEY `toMasterFee_idx` (`masterFee`),
  KEY `totruckingdetail_idx` (`id`,`truckingdetail`),
  KEY `totruckingdetail_idx1` (`truckingdetail`),
  KEY `fromfeetoexh_idx` (`exhibition`),
  KEY `toRefund` (`refund`),
  CONSTRAINT `feeToexhibition` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fromfeetoexh` FOREIGN KEY (`exhibition`) REFERENCES `exhibition` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `nameOfFee` FOREIGN KEY (`name`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toMasterFee` FOREIGN KEY (`masterFee`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toRefund` FOREIGN KEY (`refund`) REFERENCES `refund` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `totruckingdetail` FOREIGN KEY (`truckingdetail`) REFERENCES `truckingdetail` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `exName` bigint(10) DEFAULT NULL,
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
  KEY `toExName_idx` (`exName`),
  CONSTRAINT `extodocgeneral` FOREIGN KEY (`docsgeneral`) REFERENCES `docsgeneral` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `operatorConf` FOREIGN KEY (`operator`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toCusDept` FOREIGN KEY (`cusDept`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `toExName` FOREIGN KEY (`exName`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `typeOfEx` FOREIGN KEY (`typeOfEx`) REFERENCES `configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhathau`
--

LOCK TABLES `nhathau` WRITE;
/*!40000 ALTER TABLE `nhathau` DISABLE KEYS */;
INSERT INTO `nhathau` VALUES (-1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(1,'0915640077 Mr  Hùng','An Hòa',NULL,'',0,'Địa chỉ: A26/17B Ấp 1, Xã Bình Hưng, Huyện Bì','ANHOA',''),(2,'0912.146839 Mr Hòa','AN LONG TRƯỜNG',NULL,'',0,'','TAI_ALT','CTY CP AN LONG TRƯỜNG MST 03010271497'),(3,'','ANH LINH',NULL,'',0,'','TAI_ALINH','XE MỒ CÔI - ANH  LINH'),(4,'0919518468 Mr Nam','ANH NAM',NULL,'',0,'','TAI_ANAM','XE MỒ CÔI - ANH NAM'),(5,'0917192206 Mr Vương','ANH VƯƠNG',NULL,'',0,'','TAI_AVUONG','XE MỒ CÔI - ANH VUONG'),(6,'0904 204 234 Mr Thao','BÌNH MINH',NULL,'',0,'Số 414 Lê Thánh Tông,P. Máy Chai,Q.Ngô Quy','BINHMINH','CTY CP VẬT TƯ CÔNG NGHIỆP BÌNH MINH MST 0200763993'),(7,'','CẨM HẠNH',NULL,'',0,' 998 Ấp Tường Huệ xã Trường Tây Huyện Hòa Thà','CAMHANH','DOANH NGHIỆP TƯ NHÂN CẨM HẠNH MST 3900313219'),(8,'0906.369.499 Mr Thương','ĐÔNG NGÀN',NULL,'',0,'51 Ngô Gia Tự, P.2, Q.10, TP. HCM','DONGNGAN','CTY TNHH SX TM DV ĐÔNG NGÀN MST 0303417956'),(9,'0909.919.667 Mr Đông','ĐÔNG TÚ',NULL,'',0,'672 Điện Biên Phủ, P.22, Q. Bình Thạnh, TP.HC','DONGTU','CTY TNHH - VT ĐÔNG TÚ MST 0307412162'),(10,'0938.29.57.67 Mrs Thủy','ĐỨC TRUYỀN',NULL,'',0,'13 Hồ Bá Phấn, KP4, P. Phước Long A, Q.9, TP.','DUCTRUYEN','CTY TNHH TM DV VẬN TẢI ĐỨC TRUYỀN MST 0311812124'),(11,'0918.369.159 Mr Hoàng','HOÀNG KHANH',NULL,'',0,'','HOANGKHANH',''),(12,'0908.21.21.36 Mr Toán','HỒNG TOÁN',NULL,'',0,'15 đường số 6A,  Phường phước bình, Q.9, TP. ','HONGTOAN','CTY TNHH TM DV VẬN TẢI HỒNG TOÁN MST 0305605264'),(13,'0984.70.14.15 Mr Toàn','ITL',NULL,'',0,'52-54-56 Trường Sơn, P.2, Q. Bình Thạnh, TP. ','ITL','CTY CP GIAO NHẬN VÀ VẬN CHUYỂN IN DO TRẦN MST 0301909173'),(14,'0908200200 Mr Cường','KIEN CUONG',NULL,'',0,'','CAU_KIENCUONG',''),(15,'0903728551 Mr Vinh','LÂM VINH',NULL,'',0,' 448B Nguyễn Tất Thành, Phường 14, Quận 4, Tp','LAMVINH','CTY TNHH VẬN TẢI LÂM VINH MST 0909988360'),(16,'0914.052.488 Mr Nhật','LONG PHÚ',NULL,'',0,'','LONGPHU','CTY TNHH TM DV VẬN TẢI LONG PHÚ MST 0311947409'),(17,'0903.807.491Mr Nghĩa','MINH NGHĨA',NULL,'',0,'','CAU_MINHNGHIA',''),(18,'0914.722.246 Mr Sơn','NAM LONG',NULL,'',0,'Phòng 301, Số 33 Lê Quốc Hưng, P.12, Q.4, TP.','NAMLONG','CTY TNHH GIẢI PHÁP VẬN CHUYỂN NAM LONG MST 0311857799'),(19,'0903 704 837 Mr Báu','NGỌC BÁU',NULL,'',0,'','NGOCBAU',''),(20,'0919.17.17.13 A THUAN','NGỌC PHÚ',NULL,'',0,'143/3D Ung Văn Khiêm, P.25, Q. Bình Thạnh, TP','NGOCPHU','CTY TNHH VẬN TẢI NGỌC PHÚ MST 0308982214'),(21,'0913.856667 A Thịnh','PHÚ MỸ',NULL,'',0,'','PHUMY',''),(22,'0904.867.869 Mr Duy','PHƯƠNG LÂM',NULL,'',0,'137 Bình Kiều 2, P. Đông Hải 2, Q. Hải An, TP','PHUONGLAM','CTY CP VẬN TẢI THƯƠNG MẠI PHƯƠNG LÂM MST 0200744976'),(23,'0909576486  A Phương','PHƯƠNG NHUNG',NULL,'',0,'','PHUONGNHUNG',''),(24,'0906396289 Mr Ẩn','QUỐC NGHĨA',NULL,'',0,'39/20B KB Đông Chiêu, P. Tân Đông Hiệp, TX. D','QUOCNGHIA','CTY TNHH MTV VẬN TẢI QUỐC NGHĨA MST 3702070606'),(25,' 0989847879 Mr Phương','SONG HÀ',NULL,'',0,' 11Đường D3, Phường 25, Quận Bình Thạnh, HCM','SONGHA','CÔNG TY TNHH DỊCH VỤ VẬN TẢI SONG HÀ'),(26,'','SONG LONG',NULL,'',0,'867A Lê Văn Lương - Xã Nhơn Đức - Huyện Nhà B','SONGLONG','CTY TNHH VẬN TẢI XUẤT KHẨU SONG LONG MST 0312864573'),(27,'0916.699.634 Mr Tùng','TAM ',NULL,'',0,'649/40 Điện Biên Phủ, P.25, Q.Bình Thạnh, TP.','TAM','CTY TNHH GIAO NHẬN VẬN TẢI T.A.M MST 0310906475'),(28,'0937.331.078 Ms Vân','THUẬN HIẾU',NULL,'',0,'','THUANHIEU',''),(29,'0982442522 Mr Hùng','THUẬN PHONG',NULL,'',0,'','THUANPHONG','CTY CP GIAO NHẬN VẬN TẢI THUẬN PHONG MST 0312038383'),(30,'0902731711 Mr Bình','TRẦN BÌNH',NULL,'',0,'286 đường 10, KP. 5, P. Phước Bình, Q.9, TP.H','TAI_TRANBINH','\nCÔNG TY TNHH GIAO NHẬN VẬN TẢI TRẦN BÌNH'),(31,'0907.082.069 Mr Nghĩa','TRUNG NGHĨA',NULL,'',0,'Thôn 6, Do nha, Tân Tiến, An Dương, Hải Phòng','TRUNGNGHIA','CTY TNHH TM VÀ DỊCH VỤ VẬN TẢI TRUNG NGHĨA MST 0200781872'),(32,'','TRUNG VIỆT',NULL,'',0,'','TRUNGVIET',''),(33,'0918.066.764 Mr Nghĩa','TRUONG LOI',NULL,'',0,'1051/41/21 Hậu Giang, Phường 11, Quận 6, TP.H','TRUONGLOI','CTY TNHH DỊCH VỤ VẬN TẢI TRƯỞNG LỢI MST 03039911960'),(34,'0983.188.233 Mr Hùng','V & T',NULL,'',0,'39/23 Đoạn Xá, P. Đông Hải 1, Q. Hải An, Hải ','V&T','CTY CỔ PHẨN V&T'),(35,'0906368177 Mr Hải','VINATRA',NULL,'',0,'','VINATRA','XE MỒ CÔI'),(36,'0902791618 Mr Phòng','TiẾP VẬN MiỀN TRUNG',NULL,'',0,'Tầng 5 tòa nhà TD Business Center- Lô 20A, Lê','TVMT','CÔNG TY CỔ PHẦN KHOÁNG SẢN & TiẾP VẬN MiỀN TRUNG'),(37,'','VSICO',NULL,'',1,'0905.765.324 Ms Luyến','HT_ VSICO','CÔNG TY CỔ PHẦN HÀNG HẢI VSICO'),(38,'','BÌNH MINH',NULL,'',1,'0917.835.837 Mr Thanh','HT_ BINH MINH','CÔNG TY CP ĐẦU TƯ & VẬN TẢI BiỂN BÌNH MINH'),(39,'','COLLYER',NULL,'',1,'0986.238.995/ 0908.176.081 Mr Thiện or Mr Hùn','HT_ COLLYER','CÔNG TY TNHH VẬN TẢI BiỂN ĐỒNG SỰ THANH NIÊN PHƯƠNG ĐÔNG '),(40,'','THẮNG LỢI',NULL,'',1,'0949.828.430 Ms Hằng','HT_ THANG LOI','CÔNG TY TNHH VẬN TẢI BiỂN THẮNG LỢI'),(41,'','VIỄN ĐÔNG',NULL,'',1,'0908.502.804 Ms Lan','HT_ VIEN DONG','CÔNG TY CỔ PHẦN ĐẦU TƯ HÀNG HẢI ViỂN ĐÔNG'),(42,'','VGP',NULL,'',1,'0906.676.117 Ms Diễm','HT_ VGP','CÔNG TY CỔ PHẦN CẢNG RAU QuẢ'),(43,'','SCL',NULL,'',1,'0919.195.375 Ms Ánh','HT_SCL','CÔNG TY TNHH TIÊP VẬN SCL'),(44,'','VINALINE',NULL,'',1,'0908.370.376 Mr Đông','HT_VINALINE','CONG TY VAN TAI BIEN VINALINES'),(84,'contactName','name',NULL,'taxNo',0,'address','code','info');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `extension` varchar(45) DEFAULT 'pdf',
  PRIMARY KEY (`id`),
  KEY `toAtt_idx` (`attachment`),
  CONSTRAINT `toAtt` FOREIGN KEY (`attachment`) REFERENCES `attachment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `isPhieuThu` int(1) DEFAULT NULL,
  `isAdmin` int(1) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (-2,'Default role for all Users','ROLE_USER'),(-1,'Administrator role (can edit Users)','ROLE_ADMIN'),(1,'Sales','ROLE_SALES'),(2,'Docs','ROLE_DOCS'),(3,'Trucking','ROLE_TRUCK'),(4,'Accounting','ROLE_ACCOUNTING'),(5,'Configuration','ROLE_CONFIG'),(7,'Report Nhathau','ROLE_NHATHAU');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
INSERT INTO `user_role` VALUES (-2,-2),(1,-2),(2,-2),(3,-2),(5,-2),(6,-2),(7,-2),(8,-2),(9,-2),(10,-2),(12,-2),(14,-2),(15,-2),(16,-2),(17,-2),(18,-2),(-2,-1),(1,-1),(5,1),(7,1),(15,1),(5,2),(7,2),(8,2),(10,2),(12,2),(14,2),(15,2),(16,2),(17,2),(18,2),(5,3),(8,3),(10,3),(12,3),(14,3),(16,3),(17,3),(18,3),(1,4),(2,4),(3,4),(6,4),(9,4),(5,7);
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

-- Dump completed on 2015-05-29 23:12:41
