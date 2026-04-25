-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: freshfoodapp
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chitietdonhang`
--

DROP TABLE IF EXISTS `chitietdonhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietdonhang` (
  `iddonhang` int(11) NOT NULL,
  `idsp` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `gia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdonhang`
--

LOCK TABLES `chitietdonhang` WRITE;
/*!40000 ALTER TABLE `chitietdonhang` DISABLE KEYS */;
INSERT INTO `chitietdonhang` VALUES (160,118,1,'2356'),(160,117,1,'23'),(161,120,1,'123'),(162,52,1,'100000'),(163,120,1,'123'),(164,120,1,'123'),(165,122,1,'123'),(166,120,1,'123'),(167,52,1,'100000'),(168,122,2,'123'),(169,17,1,'45000'),(170,122,1,'123'),(171,122,1,'123'),(172,122,1,'123'),(173,122,1,'123'),(174,120,1,'123'),(175,120,1,'123'),(176,120,1,'123'),(177,47,1,'150000'),(177,41,1,'160000'),(177,40,1,'50000'),(177,52,1,'100000'),(177,120,1,'123'),(177,31,1,'30000'),(177,30,1,'150000'),(178,122,1,'123'),(178,121,1,'555'),(178,52,1,'100000'),(178,120,1,'123'),(179,45,1,'160000'),(179,52,1,'100000'),(179,120,1,'123'),(179,40,1,'50000'),(179,41,1,'160000'),(180,122,1,'123'),(181,120,1,'123'),(182,120,1,'123'),(183,120,1,'123'),(184,120,1,'123'),(185,120,1,'123'),(186,120,1,'123'),(187,41,2,'160000'),(188,52,1,'100000'),(188,45,1,'160000'),(188,41,1,'160000'),(188,33,1,'100000'),(188,47,1,'150000'),(189,52,1,'100000'),(189,45,1,'160000'),(189,41,1,'160000'),(189,33,1,'100000'),(189,47,1,'150000'),(190,47,1,'150000'),(190,41,1,'160000'),(190,45,1,'160000'),(190,33,1,'100000'),(190,52,1,'100000'),(191,52,1,'100000'),(191,47,1,'150000'),(191,41,1,'160000'),(191,45,1,'160000'),(191,33,1,'100000'),(192,122,1,'123'),(193,120,1,'123'),(193,122,1,'123'),(193,52,1,'100000'),(194,120,1,'123'),(194,122,1,'123'),(194,52,1,'100000'),(195,45,1,'160000'),(195,52,1,'100000'),(196,120,2,'123'),(197,52,1,'100000'),(198,122,1,'123'),(198,121,1,'555'),(199,52,1,'100000'),(199,122,1,'123'),(200,45,2,'160000'),(200,41,1,'160000'),(201,134,1,'10000'),(201,120,1,'123'),(201,121,1,'555'),(202,52,1,'100000'),(203,52,1,'100000'),(204,47,1,'150000'),(205,135,2,'15000'),(206,47,2,'150000'),(207,47,2,'150000'),(208,138,1,'200000'),(208,120,2,'123'),(208,139,1,'10000'),(209,138,1,'200000'),(209,120,2,'123'),(209,139,1,'10000'),(210,138,1,'200000'),(210,120,2,'123'),(210,139,1,'10000'),(211,12,1,'99000'),(212,120,1,'123'),(212,47,3,'150000'),(212,139,3,'200000'),(213,120,1,'123'),(213,47,3,'150000'),(213,139,3,'200000'),(214,120,1,'123'),(214,47,3,'150000'),(214,139,3,'200000'),(215,120,1,'123'),(215,47,3,'150000'),(216,120,1,'123'),(217,120,1,'123'),(215,139,3,'200000'),(217,47,3,'150000'),(216,47,3,'150000'),(216,139,3,'200000'),(217,139,3,'200000'),(218,120,1,'123'),(219,120,1,'123'),(220,120,1,'123'),(218,47,3,'150000'),(219,47,3,'150000'),(220,47,3,'150000'),(218,139,3,'200000'),(220,139,3,'200000'),(219,139,3,'200000'),(222,122,1,'123'),(223,122,1,'123'),(224,47,1,'150000'),(224,137,1,'15000'),(225,41,1,'160000'),(226,47,3,'150000');
/*!40000 ALTER TABLE `chitietdonhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `diachi` text NOT NULL,
  `sodienthoai` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `soluong` int(11) NOT NULL,
  `tongtien` varchar(255) NOT NULL,
  `trangthai` int(2) NOT NULL DEFAULT 0,
  `momo` text NOT NULL,
  `ngaydat` date NOT NULL DEFAULT current_timestamp(),
  `phuongthucthanhtoan` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` VALUES (160,46,'fggggg','123456789','hoangtest@gmail.com',2,'2379',3,'','2024-09-13','Thanh toán khi nhận hàng'),(169,39,'111','1234567','mrdiep15052002@gmail.com',1,'45000',0,'','2024-09-17','Thanh toán khi nhận hàng'),(170,39,'111','1234567','mrdiep15052002@gmail.com',1,'123',0,'','2024-09-17','Thanh toán khi nhận hàng'),(171,39,'Bac Ninh','1234567','mrdiep15052002@gmail.com',1,'123',1,'ACwL6rPI6C7V9ta_m6KdCJaQ','2024-09-17','Đã thanh toán'),(173,39,'Bac Ninh','1234567','mrdiep15052002@gmail.com',1,'123',1,'AC409kQp4ly3kbMiZJh0SUhQ','2024-10-07','Đã thanh toán'),(174,39,'Bac Ninh','1234567','mrdiep15052002@gmail.com',1,'123',4,'ACfyJapKjaP81MgIEJgEQv8g','2024-10-07','Đã thanh toán'),(175,39,'Bac Ninh','1234567','mrdiep15052002@gmail.com',1,'123',3,'ACaQfPP8f-NS4RfEVP3KyqFQ','2024-10-07','Đã thanh toán'),(176,39,'Bac Ninh','1234567','mrdiep15052002@gmail.com',1,'123',1,'','2024-10-23','Thanh toán khi nhận hàng'),(177,47,'Vạn Phúc, Hà Đông, Hà Nội','0123456789','hoangsazaga@gmail.com',7,'640123',1,'','2024-10-24','Thanh toán khi nhận hàng'),(178,47,'Vạn Phục, Hà Đông, Hà Nội','0123456789','hoangsazaga@gmail.com',4,'100801',1,'','2024-11-15','Thanh toán khi nhận hàng'),(179,47,'Hà Đông','0123456789','hoangsazaga@gmail.com',5,'470123',3,'','2024-11-15','Thanh toán khi nhận hàng'),(180,47,'Hà dông','0123456789','hoangsazaga@gmail.com',1,'123',2,'','2024-11-15','Thanh toán khi nhận hàng'),(181,47,'Hà Đông','0123456789','hoangsazaga@gmail.com',1,'123',0,'','2024-11-15','Đã Thanh Toán'),(182,47,'Hà Đông','0123456789','hoangsazaga@gmail.com',1,'123',0,'','2024-11-15','Đã Thanh Toán'),(183,47,'Hà Đông','0123456789','hoangsazaga@gmail.com',1,'123',0,'','2024-11-15','Đã Thanh Toán'),(184,47,'Hà Đông','0123456789','hoangsazaga@gmail.com',1,'123',0,'','2024-11-15','Đã Thanh Toán'),(185,47,'Hà Đông','0123456789','hoangsazaga@gmail.com',1,'123',0,'','2024-11-15','Đã Thanh Toán'),(186,47,'Hà Đông','0123456789','hoangsazaga@gmail.com',1,'123',0,'ACxcUuu9H-wXRnyJNM3-tc3A','2024-11-15','Đã Thanh Toán'),(187,47,'Hà Nội','0123456789','hoangsazaga@gmail.com',2,'320000',0,'AC3H1jtGqfLQ4iM4g_9PIIHg','2024-11-15','Đã Thanh Toán'),(188,47,'Vạn Phúc, Hà Đông, Hà Nội','0123456789','hoangsazaga@gmail.com',5,'670000',0,'','2024-11-17','Đã Thanh Toán'),(189,47,'Vạn Phúc, Hà Đông, Hà Nội','0123456789','hoangsazaga@gmail.com',5,'670000',0,'','2024-11-17','Thanh toán khi nhận hàng'),(190,47,'Vạn Phúc, Hà Đông, Hà Nội','0123456789','hoangsazaga@gmail.com',5,'670000',0,'ACSfxNQinMTnar4NXhWS2acg','2024-11-17','Đã Thanh Toán'),(191,47,'Vạn Phúc, Hà Đông, Hà Nội','0123456789','hoangsazaga@gmail.com',5,'670000',0,'','2024-11-17','Đã Thanh Toán'),(192,47,'Bac Ninh','0123456789','hoangsazaga@gmail.com',1,'123',1,'ACOU0lwt-jAPJS5JLaO8PZWg','2024-11-17','Đã Thanh Toán'),(193,47,'Vạn Phúc, Hà Nội','0123456789','hoangsazaga@gmail.com',3,'100246',0,'','2024-12-24','Đã Thanh Toán'),(194,47,'Vạn Phúc, Hà Nội','0123456789','hoangsazaga@gmail.com',3,'100246',2,'','2024-12-24','Thanh toán khi nhận hàng'),(195,47,'Há Noi','0123456789','hoangsazaga@gmail.com',2,'260000',0,'','2024-12-24','Thanh toán khi nhận hàng'),(196,47,'aaaa','0123456789','hoangsazaga@gmail.com',2,'246',0,'','2024-12-24','Thanh toán khi nhận hàng'),(197,47,'đd','0123456789','hoangsazaga@gmail.com',1,'100000',3,'','2024-12-24','Thanh toán khi nhận hàng'),(198,47,'Ha Noi','0123456789','hoangsazaga@gmail.com',2,'678',0,'','2024-12-24','Thanh toán khi nhận hàng'),(199,47,'Hà Nội','0123456789','hoangsazaga@gmail.com',2,'100123',2,'','2024-12-24','Thanh toán khi nhận hàng'),(200,47,'Ha Noi','0123456789','hoangsazaga@gmail.com',3,'480000',1,'ACilkmEoq5LUEPSwNu3CNP8Q','2024-12-25','Đã Thanh Toán'),(201,47,'Ha Noi','0123456789','hoangsazaga@gmail.com',3,'10678',1,'ACcaCpkj7I4LXcZtzUQPDVHw','2024-12-25','Đã Thanh Toán'),(202,47,'Ba Vi','0123456789','hoangsazaga@gmail.com',1,'100000',0,'','2024-12-25','Thanh toán khi nhận hàng'),(203,47,'Ha Noi','0123456789','hoangsazaga@gmail.com',1,'100000',0,'','2024-12-25','Thanh toán khi nhận hàng'),(204,47,'Vạn Phúc, Hà Đông, Hà Nội','0123456789','hoangsazaga@gmail.com',1,'150000',0,'','2024-12-25','Thanh toán khi nhận hàng'),(205,47,'Hà Nội','0123456789','hoangsazaga@gmail.com',2,'30000',0,'','2024-12-25','Thanh toán khi nhận hàng'),(206,47,'Vạn Phúc Hà Đông Hà Nội','0123456789','hoangsazaga@gmail.com',2,'300000',1,'','2024-12-25','Thanh toán khi nhận hàng'),(207,47,'Hà Nội','0123456789','hoangsazaga@gmail.com',2,'300000',0,'','2024-12-25','Đã Thanh Toán'),(208,45,'23 lvl','123456789','hoangngoc07@gmail.com',4,'210246',1,'','2026-04-23','Đã Thanh Toán'),(209,45,'23 lvl','123456789','hoangngoc07@gmail.com',4,'210246',3,'','2026-04-23','Đã Thanh Toán'),(210,45,'23 lvl','123456789','hoangngoc07@gmail.com',4,'210246',2,'','2026-04-23','Thanh toán khi nhận hàng'),(211,45,'23 lvlvlv','123456789','hoangngoc07@gmail.com',1,'99000',0,'','2026-04-23','Thanh toán khi nhận hàng'),(212,36,'12313','12345678','diep1@gmail.com',7,'1050123',0,'','2026-04-23','Đã Thanh Toán'),(213,36,'12313','12345678','diep1@gmail.com',7,'1050123',0,'','2026-04-23','Đã Thanh Toán'),(214,36,'12313','12345678','diep1@gmail.com',7,'1050123',0,'','2026-04-23','Đã Thanh Toán'),(215,36,'12313','12345678','diep1@gmail.com',7,'1050123',0,'','2026-04-23','Đã Thanh Toán'),(216,36,'12313','12345678','diep1@gmail.com',7,'1050123',0,'','2026-04-23','Đã Thanh Toán'),(217,36,'12313','12345678','diep1@gmail.com',7,'1050123',0,'','2026-04-23','Đã Thanh Toán'),(218,36,'12313','12345678','diep1@gmail.com',7,'1050123',0,'','2026-04-23','Thanh toán khi nhận hàng'),(219,36,'12313','12345678','diep1@gmail.com',7,'1050123',0,'','2026-04-23','Thanh toán khi nhận hàng'),(220,36,'12313','12345678','diep1@gmail.com',7,'1050123',0,'','2026-04-23','Đã Thanh Toán'),(221,36,'12313','12345678','diep1@gmail.com',7,'1050123',0,'','2026-04-23','Thanh toán khi nhận hàng'),(222,36,'123','12345678','diep1@gmail.com',1,'123',0,'','2026-04-23','Đã Thanh Toán'),(223,36,'123','12345678','diep1@gmail.com',1,'123',0,'','2026-04-23','Thanh toán khi nhận hàng'),(224,2,'123 lvl','0101011001','okela2222@gmail.com',2,'165000',1,'','2026-04-24','Thanh toán khi nhận hàng'),(225,1,'ng','0123456789','admin@gmail.com',1,'160000',0,'','2026-04-24','Thanh toán khi nhận hàng'),(226,4,'123 lvl','02584694','lph@gmail.com',3,'450000',3,'','2026-04-25','Thanh toán khi nhận hàng');
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsp` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,'https://thucphamsachgiatot.vn/image/cache/catalog/ca-bac-ma-700x700.png'),(2,2,'https://thucphamsachgiatot.vn/image/cache/catalog/X-SAU-RIENG-RI-6-VIETGAP-700x700.png'),(3,3,'https://thucphamsachgiatot.vn/image/cache/catalog/ro-cai-xoan-700x700.jpg'),(4,4,'https://thucphamsachgiatot.vn/image/cache/catalog/V-RAU-MAM-CN-700x700.jpg'),(5,5,'https://thucphamsachgiatot.vn/image/cache/catalog/trung-ga-hop-10q-700x700.jpg'),(6,6,'https://thucphamsachgiatot.vn/image/cache/catalog/XRAU-HUNG-CAY-700x700.jpg'),(7,7,'https://thucphamsachgiatot.vn/image/cache/catalog/rau-mong-toi-700x700.jpg'),(8,8,'https://thucphamsachgiatot.vn/image/cache/catalog/ca-rot-da-lat-700x700.jpg'),(9,9,'https://thucphamsachgiatot.vn/image/cache/catalog/X-PHI-LE-CA-BASA-700x700.jpg'),(10,10,'https://thucphamsachgiatot.vn/image/cache/catalog/thit-ba-roi-700x700.png'),(11,11,'https://thucphamsachgiatot.vn/image/cache/catalog/XTHANH-LONG-DO-700x700.jpg'),(12,12,'https://thucphamsachgiatot.vn/image/cache/catalog/xtuy-bo.jpg-700x700.jpg'),(13,13,'https://thucphamsachgiatot.vn/image/catalog/ot-chuong-vang.webp'),(14,14,'https://thucphamsachgiatot.vn/image/catalog/V-RAU-MAM-CAI-DO.webp'),(15,15,'https://thucphamsachgiatot.vn/image/cache/catalog/qua-su-su-700x700.jpg'),(16,16,'https://thucphamsachgiatot.vn/image/cache/catalog/V-KHOAI-TAY-VANG-700x700.jpg'),(17,17,'https://thucphamsachgiatot.vn/image/catalog/bong-cai-trang.webp'),(18,18,'https://thucphamsachgiatot.vn/image/cache/catalog/X-BI-DO-TRON-700x700.jpg'),(19,22,'https://thucphamsachgiatot.vn/image/cache/catalog/V-chuoi-dole-700x700.jpg'),(20,24,'https://thucphamsachgiatot.vn/image/cache/catalog/V-LE-NAM-PHI-700x700.jpg'),(21,29,'42.jpg'),(22,30,'31.jpg'),(23,31,'32.jpg'),(24,33,'https://thucphamsachgiatot.vn/image/cache/catalog/thit-xay-700x700.png'),(25,40,'40.jpg'),(26,41,'41.jpg'),(27,45,'45.jpg'),(28,47,'48.jpg'),(29,48,'53.jpg'),(30,52,'49.jpg'),(31,52,'48.jpg'),(36,110,'IMG_20240713_171942.jpg'),(37,110,'IMG_20240713_172043.jpg'),(38,111,'IMG_20240508_203801.jpg'),(39,111,'IMG_20240713_171942.jpg'),(40,111,'IMG_20240713_172043.jpg'),(41,112,'IMG_20240713_171942.jpg'),(42,113,'IMG_20240807_211016.jpg'),(43,113,'IMG_20240805_161623.jpg'),(44,113,'IMG_20240807_211021.jpg'),(53,115,'IMG_20240905_191329.jpg'),(76,115,'IMG_20240807_211021.jpg'),(77,115,'IMG_20240805_161623.jpg'),(78,115,'IMG_20240807_211016.jpg'),(94,119,'3707-rau-bina-tri-mat-ngu.jpg'),(95,119,'unnamed.jpg'),(99,120,'3707-rau-bina-tri-mat-ngu.jpg'),(100,120,'unnamed.jpg'),(101,121,'https://png.pngtree.com/png-vector/20220926/ourlarge/pngtree-small-greens-vegetable-rape-png-image_6155790.png'),(102,122,'https://img.lovepik.com/free-png/20220127/lovepik-hang-cabbage-png-image_401942940_wh860.png'),(103,122,'unnamed.jpg'),(105,123,'https://vissanmart.com/pub/media/catalog/product/cache/ee97423e9fa68a0b8b7aae16fe28a6ff/x/_/x_c_x_ch_s_n_gi_n_250g.jpg'),(110,127,'messi-chon-hai-ban-thang-quan-trong-nhat-su-nghiep-8893.jpeg.webp'),(112,128,'messi-chon-hai-ban-thang-quan-trong-nhat-su-nghiep-8893.jpeg.webp'),(113,129,'444225135_812787224044283_3252876504369139027_n.jpg'),(114,129,'444225135_812787224044283_3252876504369139027_n.jpg'),(115,129,'Picture1.png'),(133,136,'caingot.jpg'),(134,137,'anh.jpg'),(135,138,'download (5).jpg'),(136,139,'download (6).jpg'),(137,140,'download (7).jpg'),(138,141,'download (3).jpg');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livestream`
--

DROP TABLE IF EXISTS `livestream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livestream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livestream`
--

LOCK TABLES `livestream` WRITE;
/*!40000 ALTER TABLE `livestream` DISABLE KEYS */;
INSERT INTO `livestream` VALUES (7,'60054',1,''),(26,'56594',0,''),(28,'92003',0,'LiveStram 23/10'),(29,'04322',0,'Live stream 15/11'),(30,'44503',0,'Live test'),(31,'72446',0,'Liva'),(32,'60497',1,'Live Noel'),(33,'62547',1,'ádasd'),(34,'11616',1,'Anh'),(35,'74221',1,'ádadas'),(36,'04173',1,'trtrd'),(37,'13524',1,'Noel'),(38,'37349',1,'Anh'),(39,'28819',1,'aaadg'),(40,'39363',1,'sdfsdf'),(41,'24080',1,'ádasdas'),(42,'57178',1,'Live 2'),(43,'68341',1,'Live 5'),(44,'31699',1,'anh'),(45,'77972',0,'ANH'),(46,'04375',0,'ANH2');
/*!40000 ALTER TABLE `livestream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tensanpham` varchar(100) NOT NULL,
  `hinhanh` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES (1,'Trang Chủ','https://www.heartlandfoods.com/wp-content/uploads/2020/01/icon@500w.png'),(2,'Rau Củ','https://64.media.tumblr.com/e0a59fcf9ae79a26ef6d98c1f7c8f2c0/2680751f3d735a8d-25/s540x810/33b8d0c05c5c7d1d7135b17428e05777e22c68b9.jpg'),(3,'Thịt,Cá,Trứng','https://i.pinimg.com/originals/bf/f6/20/bff62066ade1a0957e54e512f32f220b.jpg'),(4,'Trái Cây','https://thumbs.dreamstime.com/b/big-pile-bright-healthy-fruits-isolated-white-background-big-pile-bright-healthy-fruits-isolated-white-240683222.jpg'),(5,'Đơn Hàng','https://cdn.iconscout.com/icon/premium/png-256-thumb/check-list-15-1093938.png'),(6,'Đơn ','https://cdn.iconscout.com/icon/premium/png-256-thumb/check-list-15-1093938.png');
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanphammoi`
--

DROP TABLE IF EXISTS `sanphammoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanphammoi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tensp` varchar(250) NOT NULL,
  `giasp` varchar(100) NOT NULL,
  `giamgia` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `mota` text NOT NULL,
  `kho` int(3) NOT NULL,
  `loai` int(3) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanphammoi`
--

LOCK TABLES `sanphammoi` WRITE;
/*!40000 ALTER TABLE `sanphammoi` DISABLE KEYS */;
INSERT INTO `sanphammoi` VALUES (1,'Cá bạc má vỉ 300g','59000','0','Với công nghệ cấp đông siêu tốc IQF từ nhà máy đạt chuẩn xuất khẩu châu Âu, Cá Bạc Má đông lạnh G hoàn toàn không sử dụng chất bảo quản mà vẫn giữ được độ ngọt thịt, săn chắc như cá tươi. Cá Bạc Má G đã làm sạch sẵn, chỉ cần cho vào nồi hấp ăn kèm rau là có ngay món ngon. Ngoài ra, thịt cá đàn hồi tốt nên còn có thể chiên, kho,… cho món hấp dẫn khó cưỡng.',10,2,'2024-10-23 16:56:51'),(2,'Sầu Riêng Ri (Kg)','150000','0','Sầu riêng Ri 6 hạt lép chín tự nhiên Cai Lậy – Tiền Giang. Được trồng trên vùng đất phù sa màu mỡ nên có hương vị thơm khác với các dòng sầu riêng khác. Cơm bùi, dẻo. Đạt chuẩn VietGap.\r\n\r\nSầu riêng Ri 6 là loại quả giàu giá trị dinh dưỡng, trong 100g cơm quả sầu riêng có 37% nước, 6% protit, 2% lipit, 16% gluxit và nhiều loại chất khoáng, vitamin.\r\n\r\n Sầu riêng Ri 6 có tác dụng giúp tăng cường và phục hồi sức khỏe cho người ốm yếu, có ích cho cơ bắp, duy trì sự chắc khỏe của xương, giúp duy trì và điều hòa hoạt động của tuyến giáp, bảo vệ sự khỏe mạnh cho răng và lợi.\r\n\r\nSầu riêng Ri 6 được trồng theo tiêu chuẩn , không chứa dư lượng hóa chất bảo vệ thực vật và kích thích tăng trưởng độc hại. Qua quá trình thu hoạch, vận chuyển và bảo quản cẩn thận, sản phẩm đảm bảo vẫn giữ được hương vị và độ tươi ngon khi tới tay người tiêu dùng.',10,3,'2024-10-23 16:56:51'),(3,'Cải Xoăn KALE 350G','45000','0','Cải kale là một loại cây thuộc họ thân thảo, sống lâu năm với thân cao từ 1 - 1,5 mét. Nó có vị hơi đắng và được xem là có họ hàng gần với các loại rau như bắp cải, súp lơ, cải bruxen hay rau xanh collard.\r\n\r\nKhông phải ngẫu nhiên mà loại rau xanh này lại được mệnh danh là loại thực phẩm giàu dinh dưỡng nhất hành tinh, là \"nữ hoàng rau xanh\" và được lòng nhiều chị em đến vậy. Tất cả đều nằm ở những giá trị dinh dưỡng mà nó mang lại cho người dùng.\r\n\r\nKale chứa các hoạt chất có tính chống oxy hóa cao, nhờ đó góp phần tăng cường sức khỏe và phòng ngừa các khối u ác tính hình thành.',10,1,'2024-10-23 16:56:51'),(4,'Rau mầm 200G','20000','0','Được trồng từ những hạt giống rau mầm cải ngọt tuyển chọn, chuyên dùng cho sản xuất rau ăn mầm, Rau Mầm cải ngọt có giá trị dinh dưỡng cao.\r\n\r\nRau mầm cải ngọt là cây thân nhỏ, khi thu hoạch cao chừng 3-4cm, thường dùng săn sống hoặc nấu canh, trộn gỏi, hoặc dùng trang trí các món ăn. Rau mầm cải ngọt là cây có  vị ngọt, giòn, giàu vitamin và các chất dinh dưỡng thiết yếu. Không những thế rau mầm cải ngọt còn cung cấp nhiều chất xơ giúp quá trình bài tiết dễ dàng hơn.\r\n\r\nRau mầm cải ngọt rất dễ ăn, đảm bảo sẽ chinh phục vị giác của tất cả mọi người, bao gồm cả người già yếu và trẻ nhỏ. Tuy nhiên do mầm cải ngọt có nhiều chất xơ (cao gấp hơn 5 lần so với rau lớn) nên khi sử dụng lưu ý tăng dần số lượng rau ăn, ngày đầu chỉ nên ăn khoảng từ 100g/người/ngày (trẻ nhỏ thì khoảng từ 25g/bé/ngày). Không nên ăn quá 200g/người/ngày – lượng rau này tương đương với 1kg rau cải ngọt lớn/người/ngày.',10,1,'2024-10-23 16:56:51'),(5,'Trứng gà DaBaCo','50000','0','Trứng gà là một loại thực phẩm có giá trị dinh dưỡng cao giàu protein, trong lòng đỏ trứng có chứa một hàm lượng phong phú lecithin và các vitamin A, D, B2. Protein của trứng gà là loại dinh dưỡng cần thiết cho cơ thể, tỷ lệ phù hợp nên dễ hấp thu, có thể hấp thu trên 94%.\r\nSản phẩm trứng gia cầm Ba Huân  được xử lý trên thiết bị hiện đại nhất hiện nay trên thế giới, trong đó có 2 công đoạn quan trọng là chiếu UV diệt khuẩn và làm se khít các lỗ thông khí, tránh sự xâm nhập của vi khuẩn và tạp chất vào bên trong trứng.',10,2,'2024-10-23 16:56:51'),(6,'Rau Húng Cây (Húng Đứng) 100g','10000','0','Tên sản phẩm: Rau Húng Cây 100G\r\nKhối lượng tịnh / Thể tích thực / Kích thước: 100G\r\nMàu sắc:\r\nXuất xứ: Việt Nam\r\nThành phần: 100% Rau húng cây tươi\r\nHướng dẫn sử dụng: Dùng để chế biến, trang trí các món ăn.\r\nHướng dẫn bảo quản: Nơi khô ráo, thoáng mát, bọc kín để trong ngăn mát tủ lạnh, nhiệt độ tốt nhất 10-15˚C.',10,1,'2024-10-23 16:56:51'),(7,'Rau mồng tơi(500G)','33000','0','Rau mồng tơi còn gọi là mùng tơi, lạc quỳ, có tên khoa học là Basella alba L, là loại dây leo, lá to, dày, giòn, màu xanh  và nhiều chất nhầy. Quả nhỏ khi chín có nước với màu tím than. Theo Đông y, mồng tơi có vị chua ngọt, không độc, tính lạnh có tác dụng giải độc, thanh nhiệt, nhuận tràng… Ăn mồng tơi chữa táo bón, đái dắt, kiết lỵ, tốt cho người tiểu đường, thải chất béo nên rất tốt cho người có mỡ và đường máu cao.',10,1,'2024-10-23 16:56:51'),(8,'Cà Rốt VG(500G)','25000','0','Cây cà rốt không chỉ là loại rau quen thuộc mà còn là cây thuốc quý. Cà rốt là loại cây thảo sống 2 năm. Lá cắt thành bản hẹp. Hoa tập hợp thành tán kép; trong mỗi tán, hoa ở chính giữa thì không sinh sản và màu tía, còn các hoa sinh sản ở chung quanh thì màu trắng hay hồng. Hạt Cà rốt có vỏ gỗ và lớp lông cứng che phủ.\r\n\r\nCà rốt là một trong những loại rau trồng rộng rãi nhất và lâu đời nhất trên thế giới. Người Lã Mã gọi Cà rốt là nữ hoàng của các loại rau. Cà rốt cũng được trồng nhiều ở nước ta. Hiện nay, các vùng rau của ta đang trồng phổ biến hai loại Cà rốt: một loại có củ màu đỏ tươi, một loại có củ màu đỏ ngả sang màu da cam',10,1,'2024-10-23 16:56:51'),(9,'Phi Lê Cá Basa Đóng Vỉ (300g)','50000','0','Tên sản phẩm: Phi Lê Cá Basa Đóng Vỉ (Kg)\r\nKhối lượng tịnh/ Thể tích thực/ Kích thước: Kg\r\nMàu sắc:\r\nXuất xứ: Việt Nam\r\nThành phần: 100% fillet cá basa\r\nHướng dẫn sử dụng: Chế biến món ăn tùy thích: chiên, nướng, hấp, kho, nấu canh hoặc nấu lẩu,...\r\nHướng dẫn bảo quản: Bảo quản ở nhiệt độ 0-5 độ C\r\nHạn sử dụng: 3 ngày kể từ NSX',10,2,'2024-10-23 16:56:51'),(10,'Ba Rọi Heo(500G)','99000','0','Thịt ba rọi hay còn gọi là thịt ba chỉ có lớp thịt và lớp mỡ xen kẽ đẹp mắt. Với hương vị thịt béo hài hòa đặc trưng, thịt ba rọi đặc bệt được ưa chuộng để chế biến nhiều món ăn khác nhau như luộc, chiên, nướng...đều phù hợp\r\n\r\nBạn muốn có những miếng thịt ba rọi vừa ngon vừa sạch, hãy chọn G!',10,2,'2024-10-23 16:56:51'),(11,'Thanh Long Ruột Đỏ (Kg)','35000','0','Thanh long đỏ là một loại trái cây có tác dụng sức khỏe tuyệt vời. Với chức năng độc đáo, ít sâu bệnh, cây có thể phát triển bình thường mà không cần sử dụng bất kỳ loại thuốc bảo vệ thực vật nào. Vì vậy, thanh long đỏ là loại quả xanh, thân thiện với môi trường và là thực phẩm tốt cho sức khỏe, có tác dụng chữa bệnh nhất định.\r\n\r\nMỗi 100g thanh long chứa 2,83g fructose và 7,83g glucose. Ngoài vitamin C, nó còn chứa 23,3mg  malic, 2,8mg  shikimic, 20mg  oxalic,  succinic,  fumaric,… Do chứa một lượng lớn  hữu cơ nên độ pH trong thanh long đỏ đạt 5,8 ~ 6,4.\r\n\r\nThịt của quả thanh long đỏ giàu chất dinh dưỡng, giá trị chữa bệnh cao, có tác dụng hạ huyết áp, hạ lipid máu, giải độc , dưỡng phổi, dưỡng da, cải thiện thị lực, đồng thời cũng có tác dụng nhất định đối với bệnh táo bón, tiểu đường. Ngoài ra, thanh long đỏ còn tác dụng phòng chống nhiễm độc kim loại nặng và tăng cường sức đề kháng, chống oxy hóa, chống lão hóa và các tác dụng khác.',10,3,'2024-10-23 16:56:51'),(12,'Tủy Bò Tươi (300G)','99000','0','Tủy là bộ phận quan trọng của động vật, chạy dọc bên trong xương sống, chứa các dây thần kinh tạo liên hệ từ não đến toàn bộ cơ thể. Tủy có màu hồng nhạt, trải qua quá trình chế biến thì có màu trắng đục, mềm, dai , ăn béo . Không những thế tủy bò có giá trị dinh dưỡng vô cùng cao, cực tốt cho sức khỏe.\r\n\r\nTủy bò tuy không phổ biến trong các bữa cơm của gia đình người Việt nhưng lại thường xuyên có mặt trên bàn ăn của những người sành ăn.\r\n\r\nTủy bò có tác dụng bổ thận, lợi tủy tăng cường trí thông minh, thích hợp cho trẻ em không đủ khiếu bẩm sinh, dậy thì muộn, vóc dáng thấp bé…',10,2,'2024-10-23 16:56:51'),(13,'Ớt Chuông (300G)','35000','0','Ớt chuông vàng (hay còn gọi là ớt ngọt, ớt Đà Lạt) được mệnh danh là “siêu thực phẩm” với nhiều lợi ích tuyệt vời đối với sức khỏe. Chúng có lượng calo thấp, đặc biệt giàu vitamin C và các chất chống oxy hóa khác.\r\n\r\nỚt Đà Lạt có nhiều màu sắc khác nhau như đỏ, vàng, cam và xanh lục (ớt chưa chín có vị hơi đắng và không ngọt như những quả chín hoàn toàn).',10,1,'2024-10-23 16:56:51'),(14,'Rau mầm đỏ 200G','30000','0','Rau Mầm Cải Đỏ có thân to, màu hồng rất đẹp. Ăn giòn, cay nồng.\r\nRau Mầm Cải Đỏ giàu carotene, vitamin B2, vitamin E và nhiều chất dinh dưỡng rất tốt cho sức khỏe, đặc biệt trong việc phòng ngừa lão hóa tế bào và làm đẹp cho phụ nữ. Rau Mầm Cải Đỏ ngoài giàu hàm lượng vitamin C, sắt và can xi rất tốt cho cơ thể thì vị cay ngọt nhẹ của loại rau mầm từ hạt cải có tác dụng kỳ diệu trong việc kích thích vị giác, tăng cường tiêu hóa và giảm mệt mỏi.',10,1,'2024-10-23 16:56:51'),(15,'SuSu VG(300G)','15000','0','Susu là món ăn quen thuộc, loại quả này ăn rất mát, lành tính. Cây leo sống dai có rễ phình thành củ. Lá to, bóng, hình chân vịt, có 5 thu , tua cuốn chia 3-5 nhánh. Hoa nhỏ, đơn tính, cùng gốc, màu trắng vàng. Quả thịt hình quả lê có cạnh lồi dọc và sần sùi, to bằng nắm tay, chứa một hạt lớn hình cầu.',10,1,'2024-10-23 16:56:51'),(16,'Khoai Tây(500G)','25000','0','Khoai tây vàng Đà Lạt được trồng theo phương pháp hữu cơ, không chứa các hóa chất bảo quản độc hại, đảm bảo giữ nguyên các giá trị dinh dưỡng vốn có và đảm bảo không ảnh hưởng đến sức khỏe người tiêu dùng. Sản phẩm có vị ngọt, bở bùi, bạn có thể dùng chế biến nhiều món ăn thơm ngon: sườn om khoai tây, thịt gà kho khoai tây, mứt khoai tây… tốt cho sức khỏe.',10,1,'2024-10-23 16:56:51'),(17,'Súp Lơ VG(500G)','45000','0','Bông cải trắng là thành phần của họ cải bao gồm bông cải xanh, cải bắp, cải xoăn, cải Brussel... Tuy nhiên, bông cải trắng cũng là một nguồn dinh dưỡng quý giá trên thế giới. Giàu dưỡng chất thực vật, giàu chất chống viêm, chống ung thư, tốt cho bệnh tim mạch, ngăn ngừa bệnh ở não và thậm chí là giúp tăng cân, dường như là quá nhiều cho một loại thực vật',10,1,'2024-10-23 16:56:51'),(18,'Bí Đỏ Tròn(950g)','35000','0','Bí đỏ có ruột màu vàng cam, vị ngọt béo, dẻo, thơm ngon và dễ chế biến thành nhiều món ăn hấp dẫn như: luộc, hấp, xào, nấu canh,...\r\nSử dụng bí đỏ trong khẩu phần ăn hàng ngày giúp cung cấp vitamin A, C, acid folic, magnesium, kali, chất đạm, acid glutamic rất cần thiết cho hoạt động của não bộ…\r\nSản phẩm có nguồn gốc xuất xứ rõ ràng, đảm bảo vệ sinh an toàn chất lượng, được Emart chọn lọc kỹ lưỡng giúp mang đến cho khách hàng sự an tâm trong việc lựa chọn và tin dùng.',10,1,'2024-10-23 16:56:51'),(22,'Chuối Dole','25000','0','Chuối DOLE, thương hiệu chuối nổi tiếng thế giới được người tiêu dùng trong và ngoài nước tin dùng.\r\n\r\nChuối Dole là một giống chuối ngoại nhập, có mùi thơm và có vị ngọt đặc trưng. Đây là loại quả cung cấp kali và axit folic tuyệt vời cho sức khỏe. Bên cạnh đó, chuối còn giàu vitamin và khoáng chất tốt cho não bộ, hỗ trợ trí nhớ, bổ sung dưỡng chất, hỗ trợ hệ tiêu hóa và có tác dụng trong việc làm đẹp hiệu quả.',10,3,'2024-10-23 16:56:51'),(24,'Lê Nam Phi (500g)','60000','0','Lê Nam Phi là một trong số ít các loại trái cây nhập khẩu  vượt qua nhiều tiêu chuẩn khắt khe để xuất khẩu ra toàn thế giới. Với vẻ ngoài lạ, bắt mắt cùng hương vị thơm ngon, lê Nam Phi sẽ là thứ quả không thể thiếu trong list trái cây của gia đình bạn mỗi khi đến mùa.\r\n\r\nLê Nam Phi có nguồn gốc từ Châu Âu, được xem là một trong những loại trái cây nhập khẩu có từ thời xa xưa. Hiện nay tại Nam Phi lê được trồng nhiều ở vùng Western Cape, tỉnh nằm phía Tây Nam. Nơi đây có khí hậu đa dạng, tuy nhiên đa phần là mát mẻ, khô và ấm áp mùa hè nên thích hợp trồng loại trái cây này. Mùa vụ lê Nam Phi bắt đầu từ tháng 2 đến tháng 8 hàng năm.\r\n\r\nQuả lê có hình chuông nhỏ, một đầu to và đầu nhỏ, nhưng tròn và thon đều. Khi chín, vỏ lê chuyển từ màu xanh đen sang màu vàng đỏ rực. Khi bổ quả lê ra mới thực sự hấp dẫn: Thịt trắng ngần cùng hương vị thơm mát, giòn và rất mọng nước mà không một loại lên nào sánh được.',10,3,'2024-10-23 16:56:51'),(29,'test','2222','0','teet',10,3,'2024-10-23 16:56:51'),(30,'Dưa hấu 1kg','150000','0','Nho xanh không hạt Mỹ là loại hoa quả nhập khẩu rất giàu dinh dưỡng, có tác dụng bổ tì, ích khí, giúp cơ thể khỏe mạnh, miễn dịch tốt và làm chậm quá trình lão hóa\r\nCanxi, kali, photpho, sắt, vitamin B1, B2, B6, C và các loại axit amin cần thiết tốt cho người suy nhược thần kinh và có lợi cho tiêu hóa\r\nHợp chất Resveratrol trong nho xanh không hạt mỹ đặc biệt là phần vỏ giúp giải độc tốt, giảm máu nhiễm mỡ, chống tụ huyết, phòng chống xơ vỡ động mạch và tăng cường hệ thống miễn dịch của cơ thể.',10,3,'2024-10-23 16:56:51'),(31,'Nho không hạt','30000','0','Sở dĩ dưa hấu Long An nổi tiếng như thế là do, quả dưa hấu ở đây được trồng theo tiêu chuẩn quốc tế về độ sạch và vệ sinh an toàn thực phẩm. Ăn dưa hấu Long An ngoài việc đảm bảo được sức khỏe, người dùng còn thưởng thức được độ ngon của dưa hấu một cách trọn vẹn, vì dưa hấu Long An là giống dưa không hạt, vỏ mỏng, đặc ruột, hạt li ti mịn, thơm lừng, ngọt thanh, ít xốp, mọng nước nhưng cũng rất giòn. Một quả dưa hấu Long An đạt trọng lượng nhẹ nhất là 2 kg. Với trọng lượng này, một quả dưa hấu cũng đã đủ trở thành món ngon tráng miệng cho một gia đình.\r\n\r\nKhông chỉ trở thành đặc sản nổi tiếng, dưa hấu Long An còn góp phần giúp người nông dân nơi đây kiếm thêm thu nhập trái mùa, thậm chí làm giàu từ loại quả thanh mát này. Được biết, nông dân Long An đã chọn cách trồng dưa hấu thay cho cả vụ lúa Hè thu. Thông thường, vụ lúa Đông xuân cho năng suất rất cao, nhưng đến vụ Hè thu thường hay rớt giá, không trúng mùa. Nên dưa hấu đã trở thành “cứu tinh” cho bà con. Dù nặng công chăm sóc nhưng lợi nhuận từ trái dưa hấu mang lại cao gấp 5 lần cây lúa. Những nhà trồng dưa hấu giỏi, diện tích lớn có thể mang về cho mình lợi nhuận trên 40 triệu đồng một mùa là chuyện bình thường.\r\n\r\nSong, không chạy theo lợi nhuận mà làm mất giá trị dưa hấu Long An, người nông dân Long An luôn tuân thủ theo quy tắc trồng dưa hấu chuẩn, gieo trồng trong môi trường sạch, cung cấp chất dinh dưỡng an toàn cho đất đai, quy trình thu hoạch đảm bảo chất lượng để tăng thời gian bảo quản. Từ đó, quả dưa hấu Long An luôn giữ nguyên được độ ngon ngọt, an toàn và ngày càng nhân rộng vị thế của loại trái cây đặc sản này trên thị trường trong và ngoài nước.',10,3,'2024-10-23 16:56:51'),(33,'Heo Xay(500g)','100000','0','Thịt heo xay (gọi tắt là thịt xay) là một trong những thực phẩm được nhiều bà nội trợ yêu thích chế biến trong các bữa ăn nhờ giá thành rẻ, dễ dàng chế biến đa dạng các món ăn ngon mà không tốn quá nhiều thời gian.\r\n\r\nThịt heo xay đảm bảo an toàn vệ sinh không chỉ đòi hỏi thịt phải sạch và ngon, mà các dụng cụ sơ chế, cối xay cũng phải cực kỳ sạch mới có thể tạo ra được thịt xay chất lượng.',10,2,'2024-10-23 16:56:51'),(40,' Ức Gà (500g)','50000','0','Thịt ức gà Leboucher được chế biến từ nguồn gà sạch, được nuôi trong hệ thống trang trại đạt tiêu chuẩn khắt khe của Pháp. Quá trình sơ chế và bảo quản được thực hiện trong quy trình khép kín, đảm bảo vệ sinh an toàn thực phẩm. Thịt gà rất giàu vitamin A, B1, B2, C, E, axit, canxi, photpho, sắt mà cơ thể con người dễ hấp thu và tiêu hóa. Do đó, ăn thịt gà giúp giảm nguy cơ mắc ung thư ruột, giúp kéo dài tuổi thọ, tốt cho tim, chống trầm cảm, hỗ trợ răng và xương, thúc đẩy sức khỏe cho mắt.',10,2,'2024-10-23 16:56:51'),(41,'Thịt Bò VG(500G)','160000','0','Thịt bò phi lê hay thịt thăn vai hay lóc thăn vai là những miếng thịt được xẻ từ phần lưng bò. Là phần thịt được cắt nằm ở phần nạc vai bò. Toàn bộ xương và sụn cũng như phần gân ngoài đã được loại bỏ. Đây là nơi những miếng thịt ngon nhất, gồm thịt thăn phi lê có hình chữ T hay là những miếng thịt Porterhouse steak hoặc cũng như thịt thăn viền mỡ.\r\nThịt phile thường mềm nhất và ngọt thịt, thịt thường có rất ít, cứ 1 tạ thịt bò thì có khoản 3kg thịt phile, đầu vai cuộn có nhiều gân và mỡ, rất thích hợp cho những người thích ăn giòn',10,2,'2024-10-23 16:56:51'),(45,'Quả Bòn Bon (1Kg)','160000','0','Bòn bon thái lan hay còn gọi dâu da đất, chắc chắn sẽ không mấy ai còn xa lạ. Đây là loại quả nhiệt đới, họ Xoan. Quả bòn bon tròn hoặc hơi thuôn, khi chín cho vỏ màu vàng tươi và ruột màu trắng đục. Bòn bon có vị ngọt hơi chua. Thịt quả chia làm nhiều múi (từ 5 – 6 múi), mỗi múi có 1 hạt. Đây là loại quả chứa nhiều nước và vitamin, khoáng nên rất được các chị em ưa chuộng.',10,3,'2024-10-23 16:56:51'),(47,'Thịt Ngan','150000','0','Thịt ngan tươi ngon bổ rẻ',10,2,'2024-10-23 16:56:51'),(52,'Xuc xich','100000','0','xuc xuc',10,2,'2024-10-23 16:56:51'),(120,'123','123','0','123',10,1,'2024-10-23 16:56:51'),(121,'555','555','0','555',10,1,'2024-10-23 16:56:51'),(122,'rau1','123','0','123',10,1,'2024-10-23 16:56:51'),(123,'Xúc xích','1000','500','Xúc xích',10,2,'2024-10-23 16:56:51'),(137,'Rau cải ngọt','15000','0','aaaa2222',2,1,'2024-12-25 12:08:20'),(138,'robo trái cây','200000','1000','ok',100,3,'2026-04-23 02:18:12'),(139,'robo trái cây','200000','10000','ok',100,3,'2026-04-23 02:21:11'),(140,'robot','2000001','100000','11',100,1,'2026-04-23 02:25:46'),(141,'robot test','200001','1000','kk',100,3,'2026-04-25 02:25:32');
/*!40000 ALTER TABLE `sanphammoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) NOT NULL,
  `pass` varchar(250) NOT NULL,
  `username` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `uid` text NOT NULL,
  `token` text NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `imageprofile` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@gmail.com','123456','ADMIN','0123456789','','cANvj9GLQNq3mTXSzh5DxH:APA91bHcb_NXRulPlbevDRW3Lb0wiN4vY62SKIw0k95Cw4J8y5-zx0OOv78CXfduNFDVgwViFAhdjGKZbG_mUqJXnuKjvf45IcGdD2HVNIZZjQi65rGSpkI',1,'',NULL),(2,'okela2222@gmail.com','onfibase','Test','0101011001','HWgS2TDJDZbSFo29tpDGtoHRbCn1','eu-aBwRXQ3SAOcKxFBsFGj:APA91bGbIjRnckgiEs63bofNwwGZCQd2zGwglcxBQZuoBKVs0kK_fSDII89ou1aArFoiR0wYqprFZ_3F9WoWVGbS9pYxOQI1Qte6r2iVR6qLN6VP8etGjEE',0,'',NULL),(3,'user1@gmail.com','onfibase','user1','02584695','YqfBmTS7UwVuiAFONEm79NNlsHw2','eu-aBwRXQ3SAOcKxFBsFGj:APA91bGbIjRnckgiEs63bofNwwGZCQd2zGwglcxBQZuoBKVs0kK_fSDII89ou1aArFoiR0wYqprFZ_3F9WoWVGbS9pYxOQI1Qte6r2iVR6qLN6VP8etGjEE',0,'',NULL),(4,'lph@gmail.com','onfibase','lph','02584694','brpdlJLmYKNAZ4BX4kwE9PiNnUA3','eu-aBwRXQ3SAOcKxFBsFGj:APA91bGbIjRnckgiEs63bofNwwGZCQd2zGwglcxBQZuoBKVs0kK_fSDII89ou1aArFoiR0wYqprFZ_3F9WoWVGbS9pYxOQI1Qte6r2iVR6qLN6VP8etGjEE',0,'',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-25  9:41:12
