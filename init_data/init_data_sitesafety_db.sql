-- MySQL dump 10.13  Distrib 8.0.44, for Linux (aarch64)
--
-- Host: localhost    Database: sitesafety_db
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `T_ALARM_CODE_INFO`
--

DROP TABLE IF EXISTS `T_ALARM_CODE_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_ALARM_CODE_INFO` (
  `ALARM_CODE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ALARM_DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RISK_LEVEL` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_ALARM_CODE_INFO`
--

LOCK TABLES `T_ALARM_CODE_INFO` WRITE;
/*!40000 ALTER TABLE `T_ALARM_CODE_INFO` DISABLE KEYS */;
INSERT INTO `T_ALARM_CODE_INFO` VALUES ('AR0001','중장비 작업 거리 확보 필요',0),('AR0002','중장비 / 사람간 안전거리 확보 필요',100),('AR0003','위험구역 진입 감지',10),('AR0004','안전장비 미착용자 감지',1),('AR0005','야간 침입자 감지',10),('AR0006','신호수 미배치 감지',10),('AR0008','화재/불꽃/연기 감지',100),('AR0009','쓰러짐 감지',100),('AR0010','1인 사다리 작업 감지',10),('AR0011','개구부 탐지',100),('AR0012','용접구간 소화기 미비 감지',10),('AR0013','안전모 미착용 감지',10);
/*!40000 ALTER TABLE `T_ALARM_CODE_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_ALARM_COMMENT`
--

DROP TABLE IF EXISTS `T_ALARM_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_ALARM_COMMENT` (
  `ID` int NOT NULL,
  `ALARM_ID` int NOT NULL,
  `CONTENT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CRT_DTIME` datetime DEFAULT NULL,
  `CRT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MOD_DTIME` datetime DEFAULT NULL,
  `CRT_NM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_ALARM_COMMENT`
--

LOCK TABLES `T_ALARM_COMMENT` WRITE;
/*!40000 ALTER TABLE `T_ALARM_COMMENT` DISABLE KEYS */;
INSERT INTO `T_ALARM_COMMENT` VALUES (287,1,'중장비 안전거리 감지 기능을 2m 줄여 주시고, 앞면과 뒷면만 허용하는 부분이 수정되었으면\n좋겠습니다.  ','2025-12-16 05:51:16','soalee','2025-12-16 05:51:16','이소아'),(288,1,'보조 작업자 복장 미준수 건','2025-12-16 08:51:16','eunsun5460','2025-12-16 12:23:16','백은선');
/*!40000 ALTER TABLE `T_ALARM_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_ALARM_CONFIRM_CODE_INFO`
--

DROP TABLE IF EXISTS `T_ALARM_CONFIRM_CODE_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_ALARM_CONFIRM_CODE_INFO` (
  `ALARM_CONFIRM_CODE` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ALARM_CONFIRM_CODE_DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_ALARM_CONFIRM_CODE_INFO`
--

LOCK TABLES `T_ALARM_CONFIRM_CODE_INFO` WRITE;
/*!40000 ALTER TABLE `T_ALARM_CONFIRM_CODE_INFO` DISABLE KEYS */;
INSERT INTO `T_ALARM_CONFIRM_CODE_INFO` VALUES ('CF001','현장위험감지, 현장관리자 조치 요청'),('CF002','카메라영상판독불가, 시스템관리자 확인 요청'),('CF003','AI모델/알고리즘 개선 요청, 예측오류'),('unConfirmed','미확인');
/*!40000 ALTER TABLE `T_ALARM_CONFIRM_CODE_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_ALARM_INFO`
--

DROP TABLE IF EXISTS `T_ALARM_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_ALARM_INFO` (
  `ID` int NOT NULL,
  `SITE_CODE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EVENT_TIME` datetime DEFAULT NULL,
  `CAM_CODE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MODEL_VERSION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ALARM_CODE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LATITUDE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LONGITUDE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONFIRM` tinyint(1) DEFAULT NULL,
  `CONFIRM_PERSON` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACTION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `IMAGE_URL` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENT_CNT` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_ALARM_INFO`
--

LOCK TABLES `T_ALARM_INFO` WRITE;
/*!40000 ALTER TABLE `T_ALARM_INFO` DISABLE KEYS */;
INSERT INTO `T_ALARM_INFO` VALUES (1,'ss020101','2023-10-18 14:26:47','css020101z01','0.1','AR0002','','',0,'','unConfirmed',NULL,'https://rsp-dev-sitesafety.s3.ap-northeast-2.amazonaws.com/2023-10-18+14%3A26%3A47.021.jpg',0);
/*!40000 ALTER TABLE `T_ALARM_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_DANGER_ZONE`
--

DROP TABLE IF EXISTS `T_DANGER_ZONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_DANGER_ZONE` (
  `ID` int NOT NULL,
  `CAM_CODE` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GROUP_ID` int DEFAULT NULL,
  `X` int DEFAULT NULL,
  `Y` int DEFAULT NULL,
  `SEQUENCE` int DEFAULT NULL,
  `CRT_DTIME` datetime NOT NULL,
  `CRT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MOD_DTIME` datetime NOT NULL,
  `MOD_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_DANGER_ZONE`
--

LOCK TABLES `T_DANGER_ZONE` WRITE;
/*!40000 ALTER TABLE `T_DANGER_ZONE` DISABLE KEYS */;
INSERT INTO `T_DANGER_ZONE` VALUES (1,'css020101z01',1,622,28,1,'2024-07-16 15:49:53',NULL,'2024-07-16 15:49:53',NULL),(2,'css020101z01',1,780,118,2,'2024-07-16 15:49:53',NULL,'2024-07-16 15:49:53',NULL),(3,'css020101z01',1,752,280,3,'2024-07-16 15:49:53',NULL,'2024-07-16 15:49:53',NULL),(4,'css020101z01',1,610,87,4,'2024-07-16 15:49:53',NULL,'2024-07-16 15:49:53',NULL);
/*!40000 ALTER TABLE `T_DANGER_ZONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_DANGER_ZONE_TIME`
--

DROP TABLE IF EXISTS `T_DANGER_ZONE_TIME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_DANGER_ZONE_TIME` (
  `CAM_CODE` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GROUP_ID` int NOT NULL,
  `OPERATING_TIME_START` time NOT NULL,
  `OPERATING_TIME_END` time NOT NULL,
  `IS_ACTIVE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CRT_DTIME` datetime NOT NULL,
  `CRT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MOD_DTIME` datetime NOT NULL,
  `MOD_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_DANGER_ZONE_TIME`
--

LOCK TABLES `T_DANGER_ZONE_TIME` WRITE;
/*!40000 ALTER TABLE `T_DANGER_ZONE_TIME` DISABLE KEYS */;
INSERT INTO `T_DANGER_ZONE_TIME` VALUES ('css020101z01',1,'00:00:00','00:00:00','Y','2024-08-29 13:31:12','grkim','2024-08-29 13:31:12','grkim');
/*!40000 ALTER TABLE `T_DANGER_ZONE_TIME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_SITE_CAM_INFO`
--

DROP TABLE IF EXISTS `T_SITE_CAM_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_SITE_CAM_INFO` (
  `ID` int NOT NULL,
  `CAM_CODE` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CAM_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STREAM_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SITE_CODE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HEIGHT` int DEFAULT NULL,
  `WIDTH` int DEFAULT NULL,
  `ACTIVE_ALARM_CODE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RTSP_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CRT_DTIME` datetime NOT NULL,
  `CRT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MOD_DTIME` datetime DEFAULT NULL,
  `MOD_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RECORD_STATUS` tinyint NOT NULL,
  `THUMBNAIL_URL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `THUMBNAIL_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_SITE_CAM_INFO`
--

LOCK TABLES `T_SITE_CAM_INFO` WRITE;
/*!40000 ALTER TABLE `T_SITE_CAM_INFO` DISABLE KEYS */;
INSERT INTO `T_SITE_CAM_INFO` VALUES (112,'css020101z01','HDC랩스 PTZ 1번 카메라','ws://','ss020101',500,1100,NULL,'rtsp://','2024-07-31 11:02:54',NULL,'2024-07-31 11:03:51',NULL,0,NULL,NULL),(113,'css020101z02','HDC랩스 PTZ 2번 카메라','ws://','ss020101',756,805,NULL,'rtsp://','2025-12-16 05:51:02',NULL,'2025-12-16 05:51:02',NULL,0,NULL,NULL),(114,'css020101z03','HDC랩스 PTZ 3번 카메라','ws://','ss020101',500,1100,NULL,'rtsp://','2025-12-16 05:51:02',NULL,'2025-12-16 05:51:02',NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `T_SITE_CAM_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_SITE_CODE`
--

DROP TABLE IF EXISTS `T_SITE_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_SITE_CODE` (
  `ID` int NOT NULL,
  `REGION_CODE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REGION_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CITY_CODE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CITY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_SERIAL_NUM` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_SITE_CODE`
--

LOCK TABLES `T_SITE_CODE` WRITE;
/*!40000 ALTER TABLE `T_SITE_CODE` DISABLE KEYS */;
INSERT INTO `T_SITE_CODE` VALUES (1,'02','서울특별시','01','강남구',1),(2,'02','서울특별시','02','강동구',1),(3,'02','서울특별시','03','강북구',0),(4,'02','서울특별시','04','강서구',0),(5,'02','서울특별시','05','관악구',0),(6,'02','서울특별시','06','광진구',4),(7,'02','서울특별시','07','구로구',0),(8,'02','서울특별시','08','금천구',0),(9,'02','서울특별시','09','노원구',0),(10,'02','서울특별시','10','도봉도',0),(11,'02','서울특별시','11','동대문구',1),(12,'02','서울특별시','12','동작구',0),(13,'02','서울특별시','13','마포구',0),(14,'02','서울특별시','14','서대문구',0),(15,'02','서울특별시','15','서초구',1),(16,'02','서울특별시','16','성동구',0),(17,'02','서울특별시','17','성북구',0),(18,'02','서울특별시','18','송파구',1),(19,'02','서울특별시','19','양천구',0),(20,'02','서울특별시','20','영등포구',0),(21,'02','서울특별시','21','용산구',1),(22,'02','서울특별시','22','은평구',0),(23,'02','서울특별시','23','종로구',0),(24,'02','서울특별시','24','중구',0),(25,'02','서울특별시','25','중랑구',0),(26,'31','경기도','01','가평군',1),(27,'31','경기도','02','고양시 덕양구',0),(28,'31','경기도','03','고양시 일산구',0),(29,'31','경기도','04','과천시',0),(30,'31','경기도','05','광명시',1),(31,'31','경기도','06','광주군',0),(32,'31','경기도','07','광주시',0),(33,'31','경기도','08','구리시',0),(34,'31','경기도','09','군포시',0),(35,'31','경기도','10','김포시',0),(36,'31','경기도','11','남양주시',0),(37,'31','경기도','12','동두천시',0),(38,'32','인천광역시','01','강화군',0),(39,'32','인천광역시','02','계양구',0),(40,'32','인천광역시','03','남구(미추홀구)',2),(41,'32','인천광역시','04','남동구',0),(42,'32','인천광역시','05','동구',0),(43,'32','인천광역시','06','부평구',0),(44,'32','인천광역시','07','서구',0),(45,'32','인천광역시','08','연수구',0),(46,'32','인천광역시','09','옹진군',0),(47,'32','인천광역시','10','중구',0),(48,'42','대전광역시','01','대덕구',0),(49,'42','대전광역시','02','동구',0),(50,'42','대전광역시','03','서구',0),(51,'42','대전광역시','04','유성구',0),(52,'42','대전광역시','05','중구',0),(53,'51','부산광역시','01','강서구',0),(54,'51','부산광역시','02','금정구',0),(55,'51','부산광역시','03','기장군',0),(56,'51','부산광역시','04','남구',0),(57,'51','부산광역시','05','동구',0),(58,'51','부산광역시','06','동래구',0),(59,'51','부산광역시','07','부산진구',0),(60,'51','부산광역시','08','북구',1),(61,'51','부산광역시','09','사상구',0),(62,'51','부산광역시','10','사하구',0),(63,'51','부산광역시','11','서구',0),(64,'51','부산광역시','12','수영구',0),(65,'51','부산광역시','13','연제구',0),(66,'51','부산광역시','14','영도구',0),(67,'51','부산광역시','15','중구',0),(68,'51','부산광역시','16','해운대',0),(69,'52','울산광역시','01','남구',0),(70,'52','울산광역시','02','동구',0),(71,'52','울산광역시','03','북구',0),(72,'52','울산광역시','04','울주군',0),(73,'52','울산광역시','05','중구',0),(74,'53','대구광역시','01','남구',0),(75,'53','대구광역시','02','달서구',0),(76,'53','대구광역시','03','달성군',0),(77,'53','대구광역시','04','동구',0),(78,'53','대구광역시','05','북구',0),(79,'53','대구광역시','06','서구',0),(80,'53','대구광역시','07','수성구',0),(81,'53','대구광역시','08','중구',0),(82,'62','광주광역시','01','광산구',0),(83,'62','광주광역시','02','남구',0),(84,'62','광주광역시','03','동구',0),(85,'62','광주광역시','04','북구',0),(86,'62','광주광역시','05','서구',0),(87,'31','경기도','13','부천시 소사구',0),(88,'31','경기도','14','부천시 오정구',0),(89,'31','경기도','15','부천시 원미구',0),(90,'31','경기도','16','성남시 분당구',0),(91,'31','경기도','17','성남시 수정구',0),(92,'31','경기도','18','성남시 중원구',0),(93,'31','경기도','19','수원시 권선구',0),(94,'31','경기도','20','수원시 장안구',0),(95,'31','경기도','21','수원시 팔달구',0),(96,'31','경기도','22','시흥시',0),(97,'31','경기도','23','안산시 단원구',0),(98,'31','경기도','24','안산시 상록구',0),(99,'31','경기도','25','안성시',0),(100,'31','경기도','26','안양시 동안구',0),(101,'31','경기도','27','안양시 만안구',0),(102,'31','경기도','28','양주군',0),(103,'31','경기도','29','양평군',0),(104,'31','경기도','30','여주시',0),(105,'31','경기도','31','연천군',0),(106,'31','경기도','32','오산시',0),(107,'31','경기도','33','용인시',0),(110,'31','경기도','34','의왕시',0),(111,'31','경기도','35','의정부시',0),(112,'31','경기도','36','이천시',0),(113,'31','경기도','37','파주시',0),(114,'31','경기도','38','평택시',0),(115,'31','경기도','39','포천시',0),(116,'31','경기도','40','하남시',0),(117,'31','경기도','41','화성군',0),(118,'31','경기도','42','화성시',0),(119,'31','경기도','43','연천군',0),(120,'31','경기도','44','수원시 영통구',0),(121,'33','강원도','01','강릉시',0),(122,'33','강원도','02','고성군',0),(123,'33','강원도','03','동해시',0),(124,'33','강원도','04','삼척시',0),(125,'33','강원도','05','속초시',0),(126,'33','강원도','06','양주군',0),(127,'33','강원도','07','양양군',0),(128,'33','강원도','08','영월군',0),(129,'33','강원도','09','원주군',0),(130,'33','강원도','10','인제군',0),(131,'33','강원도','11','정선군',0),(132,'33','강원도','12','철원군',0),(133,'33','강원도','13','춘천시',0),(134,'33','강원도','14','태백시',0),(135,'33','강원도','15','평창군',0),(136,'33','강원도','16','홍천구',0),(137,'33','강원도','17','화천구',0),(138,'33','강원도','18','횡성군',0),(139,'55','경상남도','01','거제시',0),(140,'55','경상남도','02','거창군',0),(141,'55','경상남도','03','고성군',0),(142,'55','경상남도','04','김해시',0),(143,'55','경상남도','05','남해군',0),(144,'55','경상남도','06','마산시',0),(145,'55','경상남도','07','밀양시',0),(146,'55','경상남도','08','사천시',0),(147,'55','경상남도','09','산청군',0),(148,'55','경상남도','10','양산시',0),(149,'55','경상남도','11','의령군',0),(150,'55','경상남도','12','진주시',0),(151,'55','경상남도','13','창녕군',0),(152,'55','경상남도','14','창원시',0),(153,'55','경상남도','15','통영시',0),(154,'55','경상남도','16','하동군',0),(155,'55','경상남도','17','함안군',0),(156,'55','경상남도','18','함양군',0),(157,'55','경상남도','19','합천구',0),(158,'56','경상북도','01','경산시',0),(159,'56','경상북도','02','경주시',0),(160,'56','경상북도','03','고령군',0),(161,'56','경상북도','04','구미시',0),(162,'56','경상북도','05','군위군',0),(163,'56','경상북도','06','김천시',0),(164,'56','경상북도','07','문경시',0),(165,'56','경상북도','08','봉화군',0),(166,'56','경상북도','09','상주시',0),(167,'56','경상북도','10','성주군',0),(168,'56','경상북도','11','안동시',0),(169,'56','경상북도','12','영덕군',0),(170,'56','경상북도','13','영양군',0),(171,'56','경상북도','14','영주사',0),(172,'56','경상북도','15','영천시',0),(173,'56','경상북도','16','예천시',0),(174,'56','경상북도','17','울릉도',0),(175,'56','경상북도','18','울진군',0),(176,'56','경상북도','19','의성군',0),(177,'56','경상북도','20','청도군',0),(178,'56','경상북도','21','청송군',0),(179,'56','경상북도','22','칠곡군',0),(180,'56','경상북도','23','포항시 남구',0),(181,'56','경상북도','24','포항시 북구',0),(182,'61','전라남도','01','강진군',0),(183,'61','전라남도','02','고흥군',0),(184,'61','전라남도','03','곡성군',0),(185,'61','전라남도','04','광양시',0),(186,'61','전라남도','05','구례군',0),(187,'61','전라남도','06','나주시',0),(188,'61','전라남도','07','담약군',0),(189,'61','전라남도','08','목포시',0),(190,'61','전라남도','09','무안군',0),(191,'61','전라남도','10','보성군',0),(192,'61','전라남도','11','순천시',0),(193,'61','전라남도','12','신안군',0),(194,'61','전라남도','13','여수시',0),(195,'61','전라남도','14','영광군',0),(196,'61','전라남도','15','영암군',0),(197,'61','전라남도','16','완도군',0),(198,'61','전라남도','17','장성군',0),(199,'61','전라남도','18','장흥군',0),(200,'61','전라남도','19','진도군',0),(201,'61','전라남도','20','함평군',0),(202,'61','전라남도','21','해남군',0),(203,'61','전라남도','22','화순군',0),(204,'63','전라북도','01','고창군',0),(205,'63','전라북도','02','군산시',0),(206,'63','전라북도','03','김제시',0),(207,'63','전라북도','04','남원시',0),(208,'63','전라북도','05','무주군',0),(209,'63','전라북도','06','부안군',0),(210,'63','전라북도','07','순창군',0),(211,'63','전라북도','08','완주군',0),(212,'63','전라북도','09','익산시',1),(213,'63','전라북도','10','임실군',0),(214,'63','전라북도','11','장수군',0),(215,'63','전라북도','12','전주시 덕진구',0),(216,'63','전라북도','13','전주시 완산구',0),(217,'63','전라북도','14','정읍시',0),(218,'63','전라북도','15','진안군',0),(219,'41','충청남도','01','공주시',0),(220,'41','충청남도','02','금산군',0),(221,'41','충청남도','03','논산시',0),(222,'41','충청남도','04','당진시',0),(223,'41','충청남도','05','보령시',0),(224,'41','충청남도','06','부여군',0),(225,'41','충청남도','07','서산시',0),(226,'41','충청남도','08','서천군',0),(227,'41','충청남도','09','아산시',0),(228,'41','충청남도','10','연기군',0),(229,'41','충청남도','11','예산군',0),(230,'41','충청남도','12','천안시',0),(231,'41','충청남도','13','청양군',0),(232,'41','충청남도','14','태안군',0),(233,'41','충청남도','15','홍성군',0),(234,'41','충청남도','16','세종시',0),(235,'41','충청남도','17','계룡시',0),(236,'43','충청북도','01','괴산군',0),(237,'43','충청북도','02','단양군',0),(238,'43','충청북도','03','보은군',0),(239,'43','충청북도','04','영동군',0),(240,'43','충청북도','05','옥천군',0),(241,'43','충청북도','06','음성군',0),(242,'43','충청북도','07','제원군',0),(243,'43','충청북도','08','제천시',0),(244,'43','충청북도','09','진천군',0),(245,'43','충청북도','10','청원군',0),(246,'43','충청북도','11','청주시 상당구',0),(247,'43','충청북도','12','청주시 흥덕구',0),(248,'43','충청북도','13','충주시',0),(249,'64','제주도','01','남제주군',0),(250,'64','제주도','02','북제주군',0),(251,'64','제주도','03','서귀포시',0),(252,'64','제주도','04','제주시',0),(253,'31','경기도','99','이천',0);
/*!40000 ALTER TABLE `T_SITE_CODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_SITE_INFO`
--

DROP TABLE IF EXISTS `T_SITE_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_SITE_INFO` (
  `SITE_CODE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LATITUDE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LONGITUDE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CAM_SERIAL_NUM` int unsigned NOT NULL,
  `AI_PORT` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CRT_DTIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CRT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MOD_DTIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MOD_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GRID_X` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GRID_Y` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_SITE_INFO`
--

LOCK TABLES `T_SITE_INFO` WRITE;
/*!40000 ALTER TABLE `T_SITE_INFO` DISABLE KEYS */;
INSERT INTO `T_SITE_INFO` VALUES ('ss020101','HDC랩스','127.0219','37.4864','서울특별시 서초구 효령로 346',31,NULL,'2024-07-31 10:57:04','soalee','2024-07-31 10:59:48','soalee','61','125'),('ss510801','부산 센트럴 아이파크','23','43','부산광역시',0,NULL,'2025-12-17 23:39:07',NULL,'2025-12-17 23:39:07',NULL,NULL,NULL);
/*!40000 ALTER TABLE `T_SITE_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_SITE_USER_INFO`
--

DROP TABLE IF EXISTS `T_SITE_USER_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_SITE_USER_INFO` (
  `ID` int NOT NULL,
  `ADMIN_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADMIN_GROUP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PHONE_NUMBER` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMPANY` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DIVISION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SITE_CODE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ALARM_ENABLE` tinyint(1) DEFAULT NULL,
  `ALARM_TIME_START` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ALARM_TIME_END` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ALARM_WEEKDAY` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CRT_DTIME` timestamp NOT NULL,
  `CRT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MOD_DTIME` datetime DEFAULT NULL,
  `MOD_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_ADDR` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATUS` enum('INIT','ACTIVE','DELETE') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_SITE_USER_INFO`
--

LOCK TABLES `T_SITE_USER_INFO` WRITE;
/*!40000 ALTER TABLE `T_SITE_USER_INFO` DISABLE KEYS */;
INSERT INTO `T_SITE_USER_INFO` VALUES (109,'soalee','이소아','GRP_0010','dslkjfnvlnPedweIRdlfkdgs+b','HDC-LABS','플랫폼LAB','ss020101',1,'09:00','18:00','[\"MON\",\"TUE\",\"WED\",\"THU\",\"FRI\"]','2025-01-21 10:10:35','INBASE','2025-12-16 05:58:09','INBASE','fadslfEildsfjldisIwklmcvnv==Ilkdnf','INIT');
/*!40000 ALTER TABLE `T_SITE_USER_INFO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-17 23:51:29
