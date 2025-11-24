CREATE DATABASE  IF NOT EXISTS `btl2_hcsdl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `btl2_hcsdl`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: btl2_hcsdl
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `chinhanh`
--

DROP TABLE IF EXISTS `chinhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chinhanh` (
  `MaChiNhanh` char(3) NOT NULL,
  `Diachi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaChiNhanh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chinhanh`
--

LOCK TABLES `chinhanh` WRITE;
/*!40000 ALTER TABLE `chinhanh` DISABLE KEYS */;
INSERT INTO `chinhanh` VALUES ('001','Ho Chi Minh'),('002','Ho CHi Minh'),('003','Ha Noi'),('004','Da Nang'),('005','Ha Noi');
/*!40000 ALTER TABLE `chinhanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `MaGiamGia` char(3) NOT NULL,
  `PhanTramGiam` double DEFAULT NULL,
  `SoTienGiamToiDa` int DEFAULT NULL,
  PRIMARY KEY (`MaGiamGia`),
  CONSTRAINT `Coupon_PhieuGiamGia` FOREIGN KEY (`MaGiamGia`) REFERENCES `phieugiamgia` (`MaGiamGia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES ('001',0.2,50000),('002',0.1,12000),('003',0.6,5000),('004',0.75,8000),('005',0.1,100000);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhgia`
--

DROP TABLE IF EXISTS `danhgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhgia` (
  `MaNguoiMua` char(3) NOT NULL,
  `MaSach` char(3) NOT NULL,
  `NoiDung` varchar(45) DEFAULT NULL,
  `Ngay` date DEFAULT NULL,
  `SoSao` int DEFAULT NULL,
  PRIMARY KEY (`MaNguoiMua`,`MaSach`),
  CONSTRAINT `DanhGia_NguoiMua` FOREIGN KEY (`MaNguoiMua`) REFERENCES `nguoimua` (`MaNguoiMua`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DanhGia_Sach` FOREIGN KEY (`MaNguoiMua`) REFERENCES `sach` (`MaSach`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhgia`
--

LOCK TABLES `danhgia` WRITE;
/*!40000 ALTER TABLE `danhgia` DISABLE KEYS */;
INSERT INTO `danhgia` VALUES ('006','001','noi dung sach tot','2024-05-18',5),('006','010','bo ich','2024-11-20',5),('007','002','tot','2025-01-30',5),('008','006','dang mua','2025-08-11',5),('008','007','hay','2023-02-28',5),('010','008','day du','2023-09-05',5);
/*!40000 ALTER TABLE `danhgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diachi`
--

DROP TABLE IF EXISTS `diachi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diachi` (
  `MaNguoiMua` char(3) NOT NULL,
  `DiaChi` varchar(45) NOT NULL,
  PRIMARY KEY (`MaNguoiMua`,`DiaChi`),
  CONSTRAINT `DiaChi_NguoiMua` FOREIGN KEY (`MaNguoiMua`) REFERENCES `nguoimua` (`MaNguoiMua`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diachi`
--

LOCK TABLES `diachi` WRITE;
/*!40000 ALTER TABLE `diachi` DISABLE KEYS */;
INSERT INTO `diachi` VALUES ('000','1'),('006','10 Ly Thuong Kiet, Quan 10,HCM'),('007','12 Hai Ba Trung, Quan 7,HCM'),('008','116 Quang Trung, Quan Hoan  Kiem,Ha Noi'),('009','234/7 Dinh Tien Hoang, Quan Dong Dam Ha Noi'),('010','47 Mac Dinh Chi, Da Nang');
/*!40000 ALTER TABLE `diachi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhang` (
  `MaDonHang` char(3) NOT NULL,
  `MaNguoiMua` char(3) NOT NULL,
  `NgayTaoDon` date DEFAULT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  `PhuongThucThanhToan` varchar(45) DEFAULT NULL,
  `TongGia` int DEFAULT NULL,
  `MaGiamGia` char(3) DEFAULT NULL,
  `GiaCuoiCung` int DEFAULT NULL,
  PRIMARY KEY (`MaDonHang`),
  KEY `DonHang_PhieuGiamGia` (`MaGiamGia`),
  KEY `DonHang_NguoiMua` (`MaNguoiMua`),
  CONSTRAINT `DonHang_NguoiMua` FOREIGN KEY (`MaNguoiMua`) REFERENCES `nguoimua` (`MaNguoiMua`),
  CONSTRAINT `DonHang_PhieuGiamGia` FOREIGN KEY (`MaGiamGia`) REFERENCES `phieugiamgia` (`MaGiamGia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` VALUES ('000','000','2025-11-22','Waiting for checkout','Waiting for checkout',0,NULL,0),('001','006','2025-11-22','Checked out','cash',230000,NULL,0),('002','009','2025-11-23','Waiting for checkout','Waiting for checkout',200000,NULL,0),('003','010','2025-11-25','Waiting for checkout','Waiting for checkout',770000,NULL,0),('004','007','2025-11-25','checked out','cash',80000,NULL,0),('005','008','2025-11-25','checked out','banking',600000,NULL,0),('006','007','2025-11-26','Waiting for checkout','Waiting for checkout',65000,NULL,NULL),('007','006','2025-11-27','checked out','banking',105000,NULL,0),('008','008','2025-11-27','checked out','banking',475000,NULL,0);
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `LimitedOrderAtATime` BEFORE INSERT ON `donhang` FOR EACH ROW begin
	declare checking int default 0;
    
	select count(*) into checking
    from DonHang
    where MaNguoiMua=new.MaNguoiMua and TrangThai='Waiting for checkout'
    order by MaDonHang desc;
    if(checking!=0) then signal sqlstate '45000' set message_text='customer is checking out multi order at the same time';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `donhangbaogom`
--

DROP TABLE IF EXISTS `donhangbaogom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhangbaogom` (
  `MaDonHang` char(3) NOT NULL,
  `MaSach` char(3) NOT NULL,
  `SoLuong` int DEFAULT NULL,
  `TongGia` int DEFAULT NULL,
  PRIMARY KEY (`MaDonHang`,`MaSach`),
  KEY `DonHangBaoGom_Sach` (`MaSach`),
  CONSTRAINT `DonHangBaoGom_DonHang` FOREIGN KEY (`MaDonHang`) REFERENCES `donhang` (`MaDonHang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DonHangBaoGom_Sach` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhangbaogom`
--

LOCK TABLES `donhangbaogom` WRITE;
/*!40000 ALTER TABLE `donhangbaogom` DISABLE KEYS */;
INSERT INTO `donhangbaogom` VALUES ('002','008',1,50000),('002','009',1,50000),('003','010',7,385000),('005','005',1,300000),('006','003',1,65000);
/*!40000 ALTER TABLE `donhangbaogom` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CalculatePrice` BEFORE INSERT ON `donhangbaogom` FOR EACH ROW begin
	declare unit_price int;
    select Gia into unit_price
    from Sach
    where MaSach=new.MaSach;
    SET new.TongGia = unit_price * NEW.SoLuong;
    update DonHang set TongGia=TongGia+new.TongGia where MaDonHang=new.MaDonHang; 

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_donhang_tonggia_insert` AFTER INSERT ON `donhangbaogom` FOR EACH ROW BEGIN
    UPDATE donhang
    SET TongGia = (
        SELECT COALESCE(SUM(bg.SoLuong * s.Gia), 0)
        FROM donhangbaogom bg
        JOIN sach s ON bg.MaSach = s.MaSach
        WHERE bg.MaDonHang = NEW.MaDonHang
    )
    WHERE MaDonHang = NEW.MaDonHang;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_donhang_tonggia_update` AFTER UPDATE ON `donhangbaogom` FOR EACH ROW BEGIN
    UPDATE donhang
    SET TongGia = (
        SELECT COALESCE(SUM(bg.SoLuong * s.Gia), 0)
        FROM donhangbaogom bg
        JOIN sach s ON bg.MaSach = s.MaSach
        WHERE bg.MaDonHang = NEW.MaDonHang
    )
    WHERE MaDonHang = NEW.MaDonHang;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_donhang_tonggia_delete` AFTER DELETE ON `donhangbaogom` FOR EACH ROW BEGIN
    UPDATE donhang
    SET TongGia = (
        SELECT COALESCE(SUM(bg.SoLuong * s.Gia), 0)
        FROM donhangbaogom bg
        JOIN sach s ON bg.MaSach = s.MaSach
        WHERE bg.MaDonHang = OLD.MaDonHang
    )
    WHERE MaDonHang = OLD.MaDonHang;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `donvanchuyen`
--

DROP TABLE IF EXISTS `donvanchuyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donvanchuyen` (
  `MaDonVanChuyen` char(3) NOT NULL,
  `MaDonHang` char(3) DEFAULT NULL,
  `DiaChiNguoiNhan` varchar(45) DEFAULT NULL,
  `NgayGiao` date DEFAULT NULL,
  `NgayNhan` date DEFAULT NULL,
  `TinhTrang` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaDonVanChuyen`),
  KEY `DonVanChuyen_DonHang` (`MaDonHang`),
  CONSTRAINT `DonVanChuyen_DonHang` FOREIGN KEY (`MaDonHang`) REFERENCES `donhang` (`MaDonHang`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donvanchuyen`
--

LOCK TABLES `donvanchuyen` WRITE;
/*!40000 ALTER TABLE `donvanchuyen` DISABLE KEYS */;
INSERT INTO `donvanchuyen` VALUES ('000','001','10 Ly Thuong Kiet, Quan 10,HCM','2025-11-22','2025-11-22','Delivered'),('001','005','116 Quang Trung, Quan Hoan  Kiem,Ha Noi','2025-11-25',NULL,'Delivering'),('002','004','12 Hai Ba Trung, Quan 7,HCM','2025-11-26','2025-11-26','Delivered'),('003','007','10 Ly Thuong Kiet, Quan 10,HCM','2025-11-27','2025-11-27','Delivered'),('004','008','116 Quang Trung, Quan Hoan  Kiem,Ha Noi','2025-11-27',NULL,'Delivering');
/*!40000 ALTER TABLE `donvanchuyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duocvietboi`
--

DROP TABLE IF EXISTS `duocvietboi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duocvietboi` (
  `MaSach` char(3) NOT NULL,
  `MaTacGia` char(3) NOT NULL,
  PRIMARY KEY (`MaSach`,`MaTacGia`),
  KEY `DuocVietBoi_TacGia` (`MaTacGia`),
  CONSTRAINT `DuocVietBoi_Sach` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DuocVietBoi_TacGia` FOREIGN KEY (`MaTacGia`) REFERENCES `tacgia` (`MaTacGia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duocvietboi`
--

LOCK TABLES `duocvietboi` WRITE;
/*!40000 ALTER TABLE `duocvietboi` DISABLE KEYS */;
INSERT INTO `duocvietboi` VALUES ('001','001'),('002','002'),('003','003'),('004','004'),('005','005'),('006','006'),('007','007'),('008','008'),('009','009'),('010','010');
/*!40000 ALTER TABLE `duocvietboi` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `soluongsach_duocvietboi_insert` AFTER INSERT ON `duocvietboi` FOR EACH ROW BEGIN
    UPDATE TacGia
    SET SoLuongSach=SoLuongSach+1
    WHERE MaTacGia=NEW.MaTacGia;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `soluongsach_duocvietboi_update` AFTER UPDATE ON `duocvietboi` FOR EACH ROW BEGIN
    UPDATE TacGia
    SET SoLuongSach=SoLuongSach+1
    WHERE MaTacGia=NEW.MaTacGia;
    UPDATE TacGia
    SET SoLuongSach=SoLuongSach-1
    WHERE MaTacGia=OLD.MaTacGia;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `soluongsach_duocvietboi_delete` AFTER DELETE ON `duocvietboi` FOR EACH ROW BEGIN
    UPDATE TacGia
    SET SoLuongSach=SoLuongSach-1
    WHERE MaTacGia=OLD.MaTacGia;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `giaodonvanchuyen`
--

DROP TABLE IF EXISTS `giaodonvanchuyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giaodonvanchuyen` (
  `MaNguoiGiaoHang` char(3) NOT NULL,
  `MaDonVanChuyen` char(3) NOT NULL,
  PRIMARY KEY (`MaNguoiGiaoHang`,`MaDonVanChuyen`),
  KEY `GiaoDonVanChuyen_DonVanChuyen` (`MaDonVanChuyen`),
  CONSTRAINT `GiaoDonVanChuyen_DonVanChuyen` FOREIGN KEY (`MaDonVanChuyen`) REFERENCES `donvanchuyen` (`MaDonVanChuyen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `GiaoDonVanChuyen_NguoiGiaoHang` FOREIGN KEY (`MaNguoiGiaoHang`) REFERENCES `nguoigiaohang` (`MaNguoiGiaoHang`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giaodonvanchuyen`
--

LOCK TABLES `giaodonvanchuyen` WRITE;
/*!40000 ALTER TABLE `giaodonvanchuyen` DISABLE KEYS */;
INSERT INTO `giaodonvanchuyen` VALUES ('011','000'),('015','001'),('012','002'),('012','003'),('013','004');
/*!40000 ALTER TABLE `giaodonvanchuyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giohangbaogom`
--

DROP TABLE IF EXISTS `giohangbaogom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giohangbaogom` (
  `MaGioHang` char(3) NOT NULL,
  `MaSanPham` char(3) NOT NULL,
  `SoLuong` int DEFAULT NULL,
  PRIMARY KEY (`MaGioHang`,`MaSanPham`),
  KEY `GioHang_Sach` (`MaSanPham`),
  CONSTRAINT `GioHang_NguoiMua` FOREIGN KEY (`MaGioHang`) REFERENCES `nguoimua` (`MaGioHang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `GioHang_Sach` FOREIGN KEY (`MaSanPham`) REFERENCES `sach` (`MaSach`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giohangbaogom`
--

LOCK TABLES `giohangbaogom` WRITE;
/*!40000 ALTER TABLE `giohangbaogom` DISABLE KEYS */;
INSERT INTO `giohangbaogom` VALUES ('006','008',1),('007','005',7),('007','009',7),('008','002',5),('009','008',2),('009','010',2),('010','007',7);
/*!40000 ALTER TABLE `giohangbaogom` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AmountOfProductInCart` BEFORE INSERT ON `giohangbaogom` FOR EACH ROW begin
	declare amount int default 0;
    
	select SUM(SoLuong) into amount
    from GioHangBaoGom
    where MaGioHang=new.MaGioHang;
    if(amount+new.SoLuong>1000) then signal sqlstate '45000' set message_text='the amount of book in customer cart is overflow';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hoidap`
--

DROP TABLE IF EXISTS `hoidap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoidap` (
  `MaHoiDap` char(3) NOT NULL,
  `MaNguoiMua` char(3) DEFAULT NULL,
  `MaNguoiQuanTri` char(3) DEFAULT NULL,
  `NoiDung` varchar(45) DEFAULT NULL,
  `ThoiGian` date DEFAULT NULL,
  PRIMARY KEY (`MaHoiDap`),
  KEY `HoiDap_NguoiMua` (`MaNguoiMua`),
  KEY `HoiDap_NguoiQuanTri` (`MaNguoiQuanTri`),
  CONSTRAINT `HoiDap_NguoiMua` FOREIGN KEY (`MaNguoiMua`) REFERENCES `nguoimua` (`MaNguoiMua`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `HoiDap_NguoiQuanTri` FOREIGN KEY (`MaNguoiQuanTri`) REFERENCES `nguoiquantri` (`MaNguoiQuanTri`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoidap`
--

LOCK TABLES `hoidap` WRITE;
/*!40000 ALTER TABLE `hoidap` DISABLE KEYS */;
INSERT INTO `hoidap` VALUES ('001','006','005','lam sao de dat mua sach','2024-05-18'),('002','007','005','lam sao de thay doi phuong thuc thanh toan','2025-01-30'),('003','009','003','lam the nao de huy dat sac','2023-09-05'),('004','010','002','lam the nao de tim sach','2024-11-20'),('005','008','001','lam the nao de hoan tra sach','2025-08-11');
/*!40000 ALTER TABLE `hoidap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoidung`
--

DROP TABLE IF EXISTS `nguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoidung` (
  `MaNguoiDung` char(3) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `HoTen` varchar(45) DEFAULT NULL,
  `SDT` char(11) DEFAULT NULL,
  `MatKhau` varchar(45) DEFAULT NULL,
  `GioiTinh` char(1) DEFAULT NULL,
  `VaiTro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaNguoiDung`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `SDT` (`SDT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoidung`
--

LOCK TABLES `nguoidung` WRITE;
/*!40000 ALTER TABLE `nguoidung` DISABLE KEYS */;
INSERT INTO `nguoidung` VALUES ('000',NULL,NULL,NULL,NULL,NULL,NULL),('001','001@','A','001','001','M','admin'),('002','002@','E','002','002','F','admin'),('003','003@','D','003','003','M','admin'),('004','004@','C','004','004','F','admin'),('005','005@','B','005','005','F','admin'),('006','006@','Nguyen Hoang Minh Quan','006','006','M','customer'),('007','007@','Duc Quan','007','007','M','customer'),('008','008@','Nguyen Chuong','008','008','M','customer'),('009','009@','Nhat Thiem','009','009','M','customer'),('010','010@','Kiet Vi','010','010','M','customer'),('011','011@','F','011','011','M','delivery'),('012','012@','G','012','012','M','delivery'),('013','013@','H','013','013','F','delivery'),('014','014@','I','014','014','M','delivery'),('015','015@','J','015','015','F','delivery');
/*!40000 ALTER TABLE `nguoidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoigiaohang`
--

DROP TABLE IF EXISTS `nguoigiaohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoigiaohang` (
  `MaNguoiGiaoHang` char(3) NOT NULL,
  `GiayPhepLaiXe` varchar(45) DEFAULT NULL,
  `PhuongTienDangKy` varchar(45) DEFAULT NULL,
  `BienSo` varchar(45) DEFAULT NULL,
  `PhamViHoatDong` varchar(45) DEFAULT NULL,
  `Luong` int DEFAULT NULL,
  PRIMARY KEY (`MaNguoiGiaoHang`),
  CONSTRAINT `NguoiGiaoHang_NguoiDung` FOREIGN KEY (`MaNguoiGiaoHang`) REFERENCES `nguoidung` (`MaNguoiDung`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoigiaohang`
--

LOCK TABLES `nguoigiaohang` WRITE;
/*!40000 ALTER TABLE `nguoigiaohang` DISABLE KEYS */;
INSERT INTO `nguoigiaohang` VALUES ('011','011','Xe tai','011','Ho Chi Minh',7000000),('012','012','Xe may','012','Ho Chi Minh',7000000),('013','013','Xe tai','013','Ha Noi',7000000),('014','014','Xe tai','014','Da Nang',7000),('015','015','Xe tai','015','Ha Noi',7000000);
/*!40000 ALTER TABLE `nguoigiaohang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoimua`
--

DROP TABLE IF EXISTS `nguoimua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoimua` (
  `MaNguoiMua` char(3) NOT NULL,
  `MaGioHang` char(3) NOT NULL,
  PRIMARY KEY (`MaNguoiMua`),
  UNIQUE KEY `MaGioHang_UNIQUE` (`MaGioHang`),
  CONSTRAINT `MaNguoiMua_NguoiDung` FOREIGN KEY (`MaNguoiMua`) REFERENCES `nguoidung` (`MaNguoiDung`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoimua`
--

LOCK TABLES `nguoimua` WRITE;
/*!40000 ALTER TABLE `nguoimua` DISABLE KEYS */;
INSERT INTO `nguoimua` VALUES ('000','000'),('006','006'),('007','007'),('008','008'),('009','009'),('010','010');
/*!40000 ALTER TABLE `nguoimua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoiquantri`
--

DROP TABLE IF EXISTS `nguoiquantri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoiquantri` (
  `MaNguoiQuanTri` char(3) NOT NULL,
  `ThoiGianLamViec` varchar(45) DEFAULT NULL,
  `Luong` int DEFAULT NULL,
  `NghiepVu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaNguoiQuanTri`),
  CONSTRAINT `MaNguoiQuanTri_NguoiDung` FOREIGN KEY (`MaNguoiQuanTri`) REFERENCES `nguoidung` (`MaNguoiDung`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoiquantri`
--

LOCK TABLES `nguoiquantri` WRITE;
/*!40000 ALTER TABLE `nguoiquantri` DISABLE KEYS */;
INSERT INTO `nguoiquantri` VALUES ('001','2-4-6',650000,'thu ngan'),('002','3-5-7',650000,'thu ngan'),('003','2-4-6-cn',570000,'kiem kho'),('004','7-cn',650000,'thu ngan'),('005','3-5-7-cn',570000,'kiem kho');
/*!40000 ALTER TABLE `nguoiquantri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phanphoi`
--

DROP TABLE IF EXISTS `phanphoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phanphoi` (
  `MaChiNhanhNhan` char(3) NOT NULL,
  `MaChiNhanhGui` char(3) NOT NULL,
  PRIMARY KEY (`MaChiNhanhNhan`,`MaChiNhanhGui`),
  KEY `PhanPhoi_ChiNhanhGui` (`MaChiNhanhGui`),
  CONSTRAINT `PhanPhoi_ChiNhanhGui` FOREIGN KEY (`MaChiNhanhGui`) REFERENCES `chinhanh` (`MaChiNhanh`),
  CONSTRAINT `PhanPhoi_ChiNhanhNhan` FOREIGN KEY (`MaChiNhanhNhan`) REFERENCES `chinhanh` (`MaChiNhanh`),
  CONSTRAINT `Nhan_Gui` CHECK ((`MaChiNhanhNhan` <> `MaChiNhanhGui`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phanphoi`
--

LOCK TABLES `phanphoi` WRITE;
/*!40000 ALTER TABLE `phanphoi` DISABLE KEYS */;
INSERT INTO `phanphoi` VALUES ('001','002'),('004','002'),('002','003'),('005','004'),('003','005');
/*!40000 ALTER TABLE `phanphoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieugiamgia`
--

DROP TABLE IF EXISTS `phieugiamgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieugiamgia` (
  `MaGiamGia` char(3) NOT NULL,
  `YeuCauToiThieu` varchar(45) DEFAULT NULL,
  `ThoiHanSD` date DEFAULT NULL,
  `SoLuong` int DEFAULT NULL,
  PRIMARY KEY (`MaGiamGia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieugiamgia`
--

LOCK TABLES `phieugiamgia` WRITE;
/*!40000 ALTER TABLE `phieugiamgia` DISABLE KEYS */;
INSERT INTO `phieugiamgia` VALUES ('001','100000','2025-11-24',50),('002','50000','2025-11-30',20),('003','10000','2025-12-12',100),('004','20000','2026-01-20',5),('005','200000','2025-11-25',5),('006','100000','2025-11-24',5),('007','200000','2025-12-25',5),('008','50000','2025-11-30',20),('009','20000','2025-12-30',50),('010','30000','2026-02-24',50);
/*!40000 ALTER TABLE `phieugiamgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sach`
--

DROP TABLE IF EXISTS `sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sach` (
  `MaSach` char(3) NOT NULL,
  `TenSach` varchar(45) DEFAULT NULL,
  `NgonNgu` varchar(45) DEFAULT NULL,
  `DichGia` varchar(45) DEFAULT NULL,
  `TenNhaXuatBan` varchar(45) DEFAULT NULL,
  `SoTrang` int DEFAULT NULL,
  `NamXuatBan` year DEFAULT NULL,
  `Gia` int DEFAULT NULL,
  `SoLuongTonKho` int DEFAULT NULL,
  `MaChiNhanh` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaSach`),
  KEY `Sach_ChiNhanh` (`MaChiNhanh`),
  CONSTRAINT `Sach_ChiNhanh` FOREIGN KEY (`MaChiNhanh`) REFERENCES `chinhanh` (`MaChiNhanh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sach`
--

LOCK TABLES `sach` WRITE;
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
INSERT INTO `sach` VALUES ('000',NULL,NULL,NULL,NULL,NULL,NULL,10000,0,NULL),('001','Giai tich 1','Tieng Viet','','Nxb.DHQG TP.HCM',113,2021,75000,30,'001'),('002','Giai tich 2','Tieng Viet','A','Nxb.DHQG TP.HCM',250,2021,80000,36,'001'),('003','Dai so tuyen tinh','Tieng Viet','B','Nxb.DHQG TP.HCM',250,2022,65000,50,'002'),('004','Co so du lieu','Tieng Viet','C','Nxb.DHQG TP.HCM',700,2025,175000,10,'002'),('005','Discrete mathematic','Tieng Anh','D','Mc  Graw Hill Education',2500,2019,300000,5,'005'),('006','He Thong So','Tieng Viet','E','Nxb.DHQG TP.HCM',300,2020,65000,20,'003'),('007','Cau truc du lieu va Giai thuat','tieng Viet','F','Nxb.DHQG TP.HCM',600,2022,70000,20,'002'),('008','Lich su Dang','Tieng Viet','G','Nxb.DHQG TP.HCM',1000,2021,50000,30,'002'),('009','Chu Nghi Xa Hoi Khoa Hoc','Tieng Viet','H','Nxb.DHQG TP.HCM',1112,2021,50000,27,'004'),('010','Tu Tuong Ho Chi Minh','Tieng Viet','I','Nxb.DHQG TP.HCM',1500,2021,55000,35,'004');
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tacgia`
--

DROP TABLE IF EXISTS `tacgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tacgia` (
  `MaTacGia` char(3) NOT NULL,
  `ButDanh` varchar(45) DEFAULT NULL,
  `QueQuan` varchar(45) DEFAULT NULL,
  `NamSinh` date DEFAULT NULL,
  `SoLuongSach` int DEFAULT '0',
  PRIMARY KEY (`MaTacGia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tacgia`
--

LOCK TABLES `tacgia` WRITE;
/*!40000 ALTER TABLE `tacgia` DISABLE KEYS */;
INSERT INTO `tacgia` VALUES ('001','A','a','1985-05-12',0),('002','B','b','1957-08-01',0),('003','C','c','1999-03-25',0),('004','D','d','1968-11-10',0),('005','E','e','1974-06-30',0),('006','F','f','1950-12-18',0),('007','G','g','1992-09-05',0),('008','H','h','1980-04-22',0),('009','I','i','1963-02-14',0),('010','J','j','1988-07-29',0);
/*!40000 ALTER TABLE `tacgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theloai`
--

DROP TABLE IF EXISTS `theloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theloai` (
  `MaTheLoai` char(3) NOT NULL,
  `TenPhanLoai` varchar(45) DEFAULT NULL,
  `ThongtinMoTa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaTheLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theloai`
--

LOCK TABLES `theloai` WRITE;
/*!40000 ALTER TABLE `theloai` DISABLE KEYS */;
INSERT INTO `theloai` VALUES ('001','Khoa hoc May tinh',NULL),('002','Chinh tri',NULL),('003','Dai cuong',NULL);
/*!40000 ALTER TABLE `theloai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuoctheloai`
--

DROP TABLE IF EXISTS `thuoctheloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuoctheloai` (
  `MaSach` char(3) NOT NULL,
  `MaTheLoai` char(3) NOT NULL,
  PRIMARY KEY (`MaSach`,`MaTheLoai`),
  KEY `ThuocTheLoai_TheLoai` (`MaTheLoai`),
  CONSTRAINT `ThuocTheLoai_Sach` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ThuocTheLoai_TheLoai` FOREIGN KEY (`MaTheLoai`) REFERENCES `theloai` (`MaTheLoai`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoctheloai`
--

LOCK TABLES `thuoctheloai` WRITE;
/*!40000 ALTER TABLE `thuoctheloai` DISABLE KEYS */;
INSERT INTO `thuoctheloai` VALUES ('004','001'),('005','001'),('006','001'),('007','001'),('008','002'),('009','002'),('010','002'),('001','003'),('002','003'),('003','003');
/*!40000 ALTER TABLE `thuoctheloai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
  `MaGiamGia` char(3) NOT NULL,
  `GiaTri` int DEFAULT NULL,
  PRIMARY KEY (`MaGiamGia`),
  CONSTRAINT `Voucher_PhieuGiamGia` FOREIGN KEY (`MaGiamGia`) REFERENCES `phieugiamgia` (`MaGiamGia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
INSERT INTO `voucher` VALUES ('006',50000),('007',100000),('008',25000),('009',15000),('010',20000);
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'btl2_hcsdl'
--

--
-- Dumping routines for database 'btl2_hcsdl'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCategory`(in book_id char(3), in cat_id char(3))
begin
    declare BookIdValidate int default 0;
    declare CatIdValidate int default 0;
    -- -------------------------------------------------------
    declare exit handler for 60011 -- id sach  khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
	declare exit handler for 60012 -- id the loai  khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='category id is invalid';
    end;
   -- -------------------------------------------------------
    select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60011;
    end if;
    select count(*) into CatIdValidate
    from TheLoai
    where MaTheLoai=cat_id;
    if(CatIdValidate=0) then signal sqlstate '45000' set mysql_errno=60012;
    end if;
    start transaction;
    insert into ThuocTheLoai value(book_id,cat_id);
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddingBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddingBook`(
in ma_sach char(3),
in ten_sach varchar(45),
in ngon_ngu varchar(45),
in dich_gia varchar(45),
in ten_nha_xuat_ban varchar(45),
in so_trang int,
in nam year,
in gia int,
in so_luong int,
in ma_chi_nhanh char(3)
)
begin
    declare bookIdValidate int default 0;
    declare AgencyValidate int default 0;
    declare BookValidate int default 0;
    -- -------------------------------------------------------
	declare exit handler for 60001 -- so luong san pham <0
    begin
    rollback;
    signal sqlstate '45000' set message_text='the selected amount is invalid';
    end;
    declare exit handler for 60002 -- gia cua san pham <0
    begin
    rollback;
    signal sqlstate '45000' set message_text='the price of  product is invalid';
    end;
    declare exit handler for 60003 -- trung ma san pham
    begin
    rollback;
    signal sqlstate '45000' set message_text='the id of product has already exitsted';
    end;
     declare exit handler for 60004 -- ma chi nhanh khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='the id of agency is invalid';
    end;    
    declare exit handler for 60005 -- san pham da ton tai/ sach co chung ten va chung tac gia
    begin
    rollback;
    signal sqlstate '45000' set message_text='the product has already exitsted';
    end;
	-- -------------------------------------------------------
    if(so_luong<0) then signal sqlstate '45000' set mysql_errno=60001;
    end if;
	if(gia<0) then signal sqlstate '45000' set mysql_errno=60002;
    end if;
    select count(*) into BookIdValidate
    from Sach
    where MaSach=ma_sach;
    if(BookIdValidate!=0) then signal sqlstate '45000' set mysql_errno=60003;
    end if;
    select count(*) into AgencyValidate
    from ChiNhanh
    where MaChiNhanh=ma_chi_nhanh;
    if(AgencyValidate=0) then signal sqlstate '45000' set mysql_errno=60004;
    end if;
    select count(*) into BookValidate
    from (Sach natural join DuocVietBoi) natural join TacGia
    where TenSach=ten_sach and TenTacGia=ten_tac_gia;
    if(BookValidate!=0)then signal sqlstate '45000' set mysql_errno=60005;
    end if;
	start transaction;
    insert into Sach values (ma_sach,ten_sach,Ngon_ngu,dich_gia,ten_nha_xuat_ban,so_trang,nam,so_luong, ma_chi_nhanh);
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddingBookFromCartIntoOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddingBookFromCartIntoOrder`(in cus_id char(3), in book_id char(3))
begin
	declare cart_id char(3);
    declare amount int;
    declare order_id char(3);
    declare CustomerIdValidate int default 0;
    declare BookIdValidate int default 0;
    declare Cus_BookValidate int default 0;
    declare Cus_OrderValidate int default 0;
   -- -------------------------------------------------------   
    declare exit handler for 60022 -- ma id nguoi mua ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='customer id is invalid';
    end;
    
    declare exit handler for 60023 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
    
    declare exit handler for 60024 -- khong ton tai quan he cus-book
    begin
    rollback;
    signal sqlstate '45000' set message_text='book has not been add to customer cart';
    end;
	-- -------------------------------------------------------
    select count(MaNguoiMua) into CustomerIdValidate
    from NguoiMua
    where MaNguoiMua=cus_id;
    if(CustomerIdValidate=0) then signal sqlstate '45000' set mysql_errno=60022;
    else 
		begin
		select MaGioHang into cart_id
		from NguoiMua
		where MaNguoiMua=cus_id;
        
        select MaDonHang into order_id
        from DonHang
        where MaNguoiMua=cus_id
        order by MaDonHang desc
        limit 1;
		end;
	end if;
    
    select count(MaSach) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60023;
    end if;
    
    select count(*) into Cus_BookValidate
    from GioHangBaoGom
    where MaGioHang=cart_id and MaSanPham=book_id;
    if(Cus_BookValidate=0) then signal sqlstate '45000' set mysql_errno=60024;
    else
    begin
    select SoLuong into amount
    from GioHangBaoGom
    where MaGioHang=cart_id and MaSanPham=book_id;
    end;
    end if;
    
	start transaction;
    select count(*) into Cus_OrderValidate
    from DonHang as D
    where D.MaNguoiMua=cus_id and D.TrangThai!='Checked out'
    order by MaDonHang desc
    limit 1;
    if(Cus_OrderValidate=0) then call CreateOrder(cus_id, order_id);
	end if;
    insert into DonHangBaoGom(MaDonHang,MaSach,SoLuong)
    values (order_id,book_id,amount);
    commit;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddWriter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddWriter`(in book_id char(3), in writer_id char(3))
begin
    declare BookIdValidate int default 0;
    declare WriterIdValidate int default 0;
    -- -------------------------------------------------------
    declare exit handler for 60009 -- id sach  khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
	declare exit handler for 60010 -- id tac gia  khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='writer id is invalid';
    end;
   -- -------------------------------------------------------
    select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60009;
    end if;
    select count(*) into WriterIdValidate
    from TacGia
    where MaTacGia=writer_id;
    if(WriterIdValidate=0) then signal sqlstate '45000' set mysql_errno=60010;
    end if;
    start transaction;
    insert into DuocVietBoi value(book_id,writer_id);
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdjustCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdjustCategory`(in book_id char(3), in cat_id char(3))
begin
    declare BookIdValidate int default 0;
    declare CatIdValidate int default 0;
    -- -------------------------------------------------------
    declare exit handler for 60027 -- id sach  khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
	declare exit handler for 60028 -- id the loai  khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='category id is invalid';
    end;
   -- -------------------------------------------------------
    select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60027;
    end if;
    select count(*) into CatIdValidate
    from TheLoai
    where MaTheLoai=cat_id;
    if(CatIdValidate=0) then signal sqlstate '45000' set mysql_errno=60028;
    end if;
    start transaction;
    update ThuocTheLoai 
    set MaTheLoai=cat_id
    where MaSach=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdjustingBookAgency` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdjustingBookAgency`(in book_id char(3), in agency_id char(3))
begin
    declare BookIdValidate int default 0;
    declare AgencyIdValidate int default 0;
   -- -------------------------------------------------------
    declare exit handler for 60021 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
	declare exit handler for 60022 -- ma id chi nhanh ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='agency id is invalid';
    end;
    -- -------------------------------------------------------
	select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60021;
    end if;
	select count(*) into AgencyIdValidate
    from ChiNhanh
    where MaChiNhanh=agency_id;
    if(AgencyIdValidate=0) then signal sqlstate '45000' set mysql_errno=60022;
    end if;
    start transaction;
    update Sach set MaChiNhanh=agency_id where MaSach=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdjustingBookLanguage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdjustingBookLanguage`(in book_id char(3), in ngon_ngu varchar(45))
begin
    declare BookIdValidate int default 0;
   -- -------------------------------------------------------
    declare exit handler for 60016 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
    -- -------------------------------------------------------
	select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60016;
    end if;
    start transaction;
    update Sach set NgonNgu=ngon_ngu where MaSach=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdjustingBookName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdjustingBookName`(in book_id char(3), in book_name varchar(45))
begin
    declare BookIdValidate int default 0;
   -- -------------------------------------------------------
    declare exit handler for 60015 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
    -- -------------------------------------------------------
	select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60015;
    end if;
    start transaction;
    update Sach set TenSach=book_name where MaSach=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdjustingBookNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdjustingBookNumber`(in book_id char(3), in new_amount int)
begin
    declare BookIdValidate int default 0;
   -- -------------------------------------------------------
	declare exit handler for 60006 -- so luong lua chon<0
    begin
    rollback;
    signal sqlstate '45000' set message_text='the selected amount is invalid';
    end;  
    declare exit handler for 60007 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
    -- -------------------------------------------------------
    if(new_amount<0) then signal sqlstate '45000' set mysql_errno=60006;
    end if;
	select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60007;
    end if;
    start transaction;
    update Sach set SoLuongTonKho=new_amount where MaSach=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdjustingBookPages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdjustingBookPages`(in book_id char(3), in pages int)
begin
    declare BookIdValidate int default 0;
   -- -------------------------------------------------------
    declare exit handler for 60019 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
    -- -------------------------------------------------------
	select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60019;
    end if;
    start transaction;
    update Sach set SoTrang=pages where MaSach=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdjustingBookPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdjustingBookPrice`(in book_id char(3), in new_price int)
begin
    declare BookIdValidate int default 0;
   -- -------------------------------------------------------
	declare exit handler for 60013 -- gia lua chon<0
    begin
    rollback;
    signal sqlstate '45000' set message_text='the selected price is invalid';
    end;  
    declare exit handler for 60014 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
    -- -------------------------------------------------------
    if(new_price<0) then signal sqlstate '45000' set mysql_errno=60013;
    end if;
	select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60014;
    end if;
    start transaction;
    update Sach set Gia=new_price where MaSach=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdjustingBookPriceOnShelf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdjustingBookPriceOnShelf`(in book_id char(3), in new_price int)
begin
    declare BookIdValidate int default 0;
   -- -------------------------------------------------------
	declare exit handler for 60013 -- gia lua chon<0
    begin
    rollback;
    signal sqlstate '45000' set message_text='the selected price is invalid';
    end;  
    declare exit handler for 60014 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
    -- -------------------------------------------------------
    if(new_price<0) then signal sqlstate '45000' set mysql_errno=60013;
    end if;
	select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60014;
    end if;
    start transaction;
    update Sach set Gia=new_price where MaSach=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdjustingBookPublisher` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdjustingBookPublisher`(in book_id char(3), in nxb varchar(45))
begin
    declare BookIdValidate int default 0;
   -- -------------------------------------------------------
    declare exit handler for 60018 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
    -- -------------------------------------------------------
	select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60018;
    end if;
    start transaction;
    update Sach set NhaXuatBan=nxb where MaSach=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdjustingBookTranslator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdjustingBookTranslator`(in book_id char(3), in dich_gia varchar(45))
begin
    declare BookIdValidate int default 0;
   -- -------------------------------------------------------
    declare exit handler for 60017 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
    -- -------------------------------------------------------
	select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60017;
    end if;
    start transaction;
    update Sach set DichGia=dich_gia where MaSach=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdjustingBookYear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdjustingBookYear`(in book_id char(3), in nam year)
begin
    declare BookIdValidate int default 0;
   -- -------------------------------------------------------
    declare exit handler for 60020 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
    -- -------------------------------------------------------
	select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60020;
    end if;
    start transaction;
    update Sach set NamXuatBan=nam where MaSach=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckingOutOrderIntoDelivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckingOutOrderIntoDelivery`(in cus_id char(3), in paymemt varchar(45))
begin
    declare CustomerIdValidate int default 0;
    declare Cus_OrderValidate int default 0;
    declare order_id char(3);
    declare cart_id char(3);
    declare deliID char(3);
    declare deliCODE int;
    declare deliMAX int default 0;
    declare OrderAddr varchar(45);
   -- -------------------------------------------------------   
    declare exit handler for 60025 -- ma id nguoi mua ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='customer id is invalid';
    end;
	declare exit handler for 60026 -- relationship nguoimua_donhang khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='customer has not ordered';
    end;
	-- -------------------------------------------------------
    select count(MaNguoiMua) into CustomerIdValidate
    from NguoiMua
    where MaNguoiMua=cus_id;
    
    if(CustomerIdValidate=0) then signal sqlstate '45000' set mysql_errno=60025;
	end if;
	
    select count(*) into Cus_OrderValidate
    from DonHang
    where MaNguoiMua=cus_id and TrangThai= 'Waiting for checkout'
    order by MaDonHang desc
    limit 1;
    if(Cus_OrderValidate=0) then signal sqlstate '45000' set mysql_errno=60026;
	end if;
    
    select MaDonHang into order_id
    from DonHang
    where MaNguoiMua=cus_id and TrangThai= 'Waiting for checkout'
    order by MaDonHang desc
    limit 1;
    
    select MaGioHang into cart_id
    from NguoiMua
    where MaNguoiMua=cus_id;
    
    select DiaChi into OrderAddr
    from DiaChi
    where MaNguoiMua=cus_id;
    
	start transaction;
    select count(*) into deliCODE
    from DonVanChuyen;
    select max(MaDonVanCHuyen) into deliMAX
    from DonVanChuyen;
    if(deliCODE<=deliMAX) then set deliCODE=deliMAX+1;
    end if;
    set deliId=lpad(deliCODE,3,'0');
    insert into DonVanChuyen
    values (deliId ,order_id,OrderAddr, curdate(),curdate(),'Delivering');
    
    update Sach as S join DonHangBaoGom as D on S.MaSach=D.MaSach
    set S.SoLuongTonKho=S.SoLuongTonKho-D.SoLuong
    where D.MaDonHang=order_id;
    update DonHang
    set TrangThai='Checked out'
    where MaNguoiMua=cus_id
	order by MaDonHang desc
    limit 1;
    update DonHang
    set PhuongThucThanhToan=paymemt
    where MaNguoiMua=cus_id
	order by MaDonHang desc
    limit 1;
    
    delete from GioHangBaoGom 
    where MaGioHang=cart_id and MaSanPham in (select MaSach from DonHangBaoGom where MaDonHang=order_id);
    delete from DonHangBaoGom
    where MaDonHang=order_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateOrder`(in cus_id char(3), out order_id char(3))
begin
    declare CustomerIdValidate int default 0;
    declare OrderId char(3);
    declare orderCODE int;
    declare orderMAX int default 0;
   -- -------------------------------------------------------   
    declare exit handler for 60019 -- ma id nguoi mua ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='customer id is invalid';
    end;
	-- -------------------------------------------------------
    select count(MaNguoiMua) into CustomerIdValidate
    from NguoiMua
    where MaNguoiMua=cus_id;
    if(CustomerIdValidate=0) then signal sqlstate '45000' set mysql_errno=60019;
	end if;
    
	start transaction;
    select count(*) into orderCODE
    from DonHang;
    select max(MaDonHang) into orderMAX
    from DonHang;
    if(orderCODE<=orderMAX) then set orderCODE=OrderMAX+1;
    end if;
    set OrderId=lpad(orderCODE,3,'0');
	set order_id=OrderId;
    insert into DonHang(MaDonHang,MaNguoiMua,NgayTaoDon,TrangThai,PhuongThucThanhToan,TongGia,MaGiamGia,GiaCuoiCung)
    values (OrderId ,cus_id, curdate(),'Waiting for checkout','Waiting for checkout', 0, null, 0);
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateOrder1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateOrder1`(in cus_id char(3))
begin
    declare tmp char(3);
    call CreateOrder('000',tmp );
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CustomerAddingBookToCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CustomerAddingBookToCart`(in cus_id char(3), in book_id char(3), in amount int )
begin
	declare inStock int;
    declare cart_id char(3);
    declare CusIdValidate int default 0;
    declare bookIdValidate int default 0;
    declare Cus_BookValidate int default 0;
    declare InCart int default 0;
    -- -------------------------------------------------------
	declare exit handler for 60001 -- so luong san pham co san = 0
	begin
	rollback;
	signal sqlstate '45000' set message_text='Product is out of stock';
	end;
    
	declare exit handler for 60002 -- so luong san pham co san < so luong san pham lua chon
    begin
    signal sqlstate '45000' set message_text='the selected amount of products is greater than stock';
    end;
    
	declare exit handler for 60003 -- so luong san pham lua chon <1
    begin
    rollback;
    signal sqlstate '45000' set message_text='the selected amount of  product is invalid';
    end;
    
    declare exit handler for 60004 -- ma id nguoi mua ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='customer id is invalid';
    end;
    
    declare exit handler for 60005 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
	-- -------------------------------------------------------
	select count(MaNguoiMua) into CusIdValidate
    from NguoiMua
    where cus_id=MaNguoiMua;
    if(cusIdValidate=0) then signal sqlstate '45000' set mysql_errno=60004;
    end if;
    select  MaGioHang into cart_id 
	from NguoiMua
	where cus_id=MaNguoiMua;
    
    select count(MaSach) into BookIdValidate
    from Sach
    where book_id=MaSach;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60005;
    end if;
    select SoLuongTonKho into InStock
	from Sach
	where book_id=MaSach;
    
    select count(*) into Cus_BookValidate
    from GioHangBaoGom
    where MaGioHang=cart_id and MaSanPham=book_id;
    if(Cus_BookValidate!=0) then
    begin 
    select SoLuong into InCart
    from GioHangBaoGom
    where MaGioHang=cart_id and MaSanPham=book_id;
    set amount=amount+InCart;
    end;
    end if;
    
	if(inStock=0 or instock is null) then signal sqlstate '45000' set mysql_errno =60001; 
    elseif (inStock<amount) then signal sqlstate '45000' set mysql_errno =60002;
    elseif (amount=0) then signal sqlstate'45000' set mysql_errno= 60003;
    end if;
	
    start transaction;

	if(Cus_BookValidate!=0) then
		begin 
		update GioHangBaoGom 
        set SoLuong=amount 
        where MaGioHang=cart_id and MaSanPham=book_id;
		end;
	else  
        begin
		insert into GioHangBaoGom (MaGioHang,MaSanPham,SoLuong)
		values (cart_id,book_id,amount);
		end;
	end if;
    commit;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CustomerAdjustingBookInCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CustomerAdjustingBookInCart`(in cus_id char(3), in book_id char(3), in new_amount int)
begin
	declare cart_id char(3);
    declare inStock int;
    declare CustomerIdValidate int default 0;
    declare BookIdValidate int default 0;
    declare Cus_BookValidate int default 0;
   -- -------------------------------------------------------
	declare exit handler for 60010 -- so luong san pham co san = 0
	begin
	rollback;
	signal sqlstate '45000' set message_text='Product is out of stock';
	end;
    
	declare exit handler for 60011 -- so luong san pham co san < so luong san pham lua chon
    begin
    signal sqlstate '45000' set message_text='the selected amount of products is greater than stock';
    end;
    
	declare exit handler for 60012 -- so luong san pham lua chon<1
    begin
    rollback;
    signal sqlstate '45000' set message_text='the selected amount of  product is invalid';
    end;
    
    declare exit handler for 60013 -- ma id nguoi mua ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='customer id is invalid';
    end;
    
    declare exit handler for 60014 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
    
    declare exit handler for 60015 -- khong ton tai quan he cus-book
    begin
    rollback;
    signal sqlstate '45000' set message_text='book has not been add to customer cart';
    end;
	-- -------------------------------------------------------
    select count(MaNguoiMua) into CustomerIdValidate
    from NguoiMua
    where MaNguoiMua=cus_id;
    if(CustomerIdValidate=0) then signal sqlstate '45000' set mysql_errno=60013;
    else 
		begin
		select MaGioHang into cart_id
		from NguoiMua
		where MaNguoiMua=cus_id;
		end;
	end if;
    
    select count(MaSach) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60014;
    end if;
    
    select count(*) into Cus_BookValidate
    from GioHangBaoGom
    where MaGioHang=cart_id and MaSanPham=book_id;
    if(Cus_BookValidate=0) then signal sqlstate '45000' set mysql_errno=60015;
    end if;
    
	select SoLuongTonKho into inStock
	from Sach
	where MaSach=book_id;
	if(inStock=0 or instock is null) then signal sqlstate '45000' set mysql_errno=60010;
    elseif (inStock<new_amount) then signal sqlstate '45000' set mysql_errno=60011;
    elseif (new_amount<0) then signal sqlstate '45000' set mysql_errno=60012;
    end if;

    start transaction;
    if (new_amount=0) then
		begin
		delete from GioHangBaoGom where MaGioHang=cart_id and MaSanPham=book_id;
		end;
	else
		begin
		update GioHangBaoGom
		set Soluong=new_amount
		where MaGioHang=cus_id and MaSanPham=book_id;
		end;
	end if;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CustomerRemovingBookFromCart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CustomerRemovingBookFromCart`(in cus_id char(3), in book_id char(3))
begin
	declare cart_id char(3);
    declare CustomerIdValidate int default 0;
    declare BookIdValidate int default 0;
    declare Cus_BookValidate int default 0;
    -- -------------------------------------------------------
	declare exit handler for 60006 -- id nguoi mua khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='customer id is invalid';
    end;
    
    declare exit handler for 60007 -- id sach  khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
    
    declare exit handler for 60008 -- khong ton tai (nguoi mua-sach)
    begin
    rollback;
    signal sqlstate '45000' set message_text='book has not been add to customer cart';
    end;
    -- -------------------------------------------------------
    select count(MaNguoiMua) into CustomerIdValidate
    from NguoiMua
    where MaNguoiMua=cus_id;
    if(CustomerIdValidate=0) then signal sqlstate '45000' set mysql_errno=60006;
    else 
		begin
		select MaGioHang into cart_id
		from NguoiMua
		where MaNguoiMua=cus_id;
		end;
	end if;
    
    select count(MaSach) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60007;
    end if;
    
    
    select count(*) into Cus_BookValidate
    from GioHangBaoGom
    where MaGioHang=cart_id and MaSanPham=book_id;
    if(Cus_BookValidate=0) then signal sqlstate '45000' set mysql_errno=60008;
    end if;
    
    start transaction;
    delete from GioHangBaoGom where MaGioHang=cart_id and MaSanPham=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DropOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DropOrder`(in cus_id char(3))
begin
    declare CustomerIdValidate int default 0;
    declare Cus_OrderValidate int default 0;
   -- -------------------------------------------------------   
    declare exit handler for 60020 -- ma id nguoi mua ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='customer id is invalid';
    end;
    declare exit handler for 60021 -- relationship nguoimua_donhang khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='customer has not ordered';
    end;
	-- -------------------------------------------------------
    select count(MaNguoiMua) into CustomerIdValidate
    from NguoiMua
    where MaNguoiMua=cus_id;
    if(CustomerIdValidate=0) then signal sqlstate '45000' set mysql_errno=60020;
	end if;
    
    select count(MaNguoiMua) into Cus_OrderValidate
    from DonHang
    where MaNguoiMua=cus_id;
    if(Cus_OrderValidate=0) then signal sqlstate '45000' set mysql_errno=60021;
	end if;
    
	start transaction;
    delete from DonHang where MaNguoiMua=cus_id; 
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveCategory`(in book_id char(3), in cat_id char(3))
begin
    declare BookIdValidate int default 0;
    declare CatIdValidate int default 0;
    -- -------------------------------------------------------
    declare exit handler for 60029 -- id sach  khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
	declare exit handler for 60030 -- id the loai  khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='category id is invalid';
    end;
   -- -------------------------------------------------------
    select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60029;
    end if;
    select count(*) into CatIdValidate
    from TheLoai
    where MaTheLoai=cat_id;
    if(CatIdValidate=0) then signal sqlstate '45000' set mysql_errno=60030;
    end if;
    start transaction;
    delete from ThuocTheLoai 
    where MaSach=book_id and MaTheLoai=cat_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveWirter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveWirter`(in book_id char(3), in writer_id char(3))
begin
    declare BookIdValidate int default 0;
    declare WriterIdValidate int default 0;
    -- -------------------------------------------------------
    declare exit handler for 60025 -- id sach  khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
	declare exit handler for 60026 -- id tac gia  khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='writer id is invalid';
    end;
   -- -------------------------------------------------------
    select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60025;
    end if;
    select count(*) into WriterIdValidate
    from TacGia
    where MaTacGia=writer_id;
    if(WriterIdValidate=0) then signal sqlstate '45000' set mysql_errno=60026;
    end if;
    start transaction;
    delete from DuocVietBoi
    where MaSach=book_id and MaTacGia=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemovingBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemovingBook`(in book_id char(3))
begin
    declare BookIdValidate int default 0;
    -- -------------------------------------------------------
    declare exit handler for 60008 -- id sach  khong ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
   -- -------------------------------------------------------
    select count(*) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60008;
    end if;
    start transaction;
    delete from Sach where MaSach=book_id;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemovingBookOutOfCartAfterPurchasing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemovingBookOutOfCartAfterPurchasing`(in cus_id char(3), in book_id char(3))
begin
	declare cart_id char(3);
    declare amount int;
    declare CustomerIdValidate int default 0;
    declare BookIdValidate int default 0;
    declare Cus_BookValidate int default 0;
   -- -------------------------------------------------------   
    declare exit handler for 60016 -- ma id nguoi mua ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='customer id is invalid';
    end;
    
    declare exit handler for 60017 -- ma id sach ko ton tai
    begin
    rollback;
    signal sqlstate '45000' set message_text='book id is invalid';
    end;
    
    declare exit handler for 60018 -- khong ton tai quan he cus-book
    begin
    rollback;
    signal sqlstate '45000' set message_text='book has not been add to customer cart';
    end;
	-- -------------------------------------------------------
    select count(MaNguoiMua) into CustomerIdValidate
    from NguoiMua
    where MaNguoiMua=cus_id;
    if(CustomerIdValidate=0) then signal sqlstate '45000' set mysql_errno=60013;
    else 
		begin
		select MaGioHang into cart_id
		from NguoiMua
		where MaNguoiMua=cus_id;
		end;
	end if;
    
    select count(MaSach) into BookIdValidate
    from Sach
    where MaSach=book_id;
    if(BookIdValidate=0) then signal sqlstate '45000' set mysql_errno=60014;
    end if;
    
    select count(*) into Cus_BookValidate
    from GioHangBaoGom
    where MaGioHang=cart_id and MaSanPham=book_id;
    if(Cus_BookValidate=0) then signal sqlstate '45000' set mysql_errno=60015;
    else
    begin
    select SoLuong into amount
    from GioHangBaoGom
    where MaGioHang=cart_id and MaSanPham=book_id;
    end;
    end if;
    
	start transaction;
    delete from GioHangBaoGom 
    where MaGioHang=cus_id and MaSanPham=book_id;
    
    update Sach
    set SoLuongTonKho=SoLuongTonKho-amount
    where MaSach=book_id;
    commit;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ThongKeSachBanChay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ThongKeSachBanChay`(
    IN p_NgayBatDau DATE,
    IN p_NgayKetThuc DATE,
    IN p_SoLuongToiThieu INT 
)
BEGIN
    SELECT 
        s.MaSach,
        s.TenSach,
        COUNT(dh.MaDonHang) AS SoLanDat,      
        SUM(dhbg.SoLuong) AS TongSoLuongBan,  
        SUM(dhbg.TongGia) AS TongDoanhThu     
    FROM 
        sach s
    JOIN 
        donhangbaogom dhbg ON s.MaSach = dhbg.MaSach
    JOIN 
        donhang dh ON dhbg.MaDonHang = dh.MaDonHang
    WHERE 
        
        dh.NgayTaoDon BETWEEN p_NgayBatDau AND p_NgayKetThuc
        
    GROUP BY 
        s.MaSach, s.TenSach 
    HAVING 
        SUM(dhbg.SoLuong) >= p_SoLuongToiThieu 
    ORDER BY 
        TongDoanhThu DESC; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_TimKiemSach` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_TimKiemSach`(
    IN p_TuKhoa VARCHAR(45),    
    IN p_GiaMin INT,            
    IN p_GiaMax INT,            
    IN p_TenTheLoai VARCHAR(45),
    IN p_SapXep VARCHAR(10)     
)
BEGIN
    SELECT 
        s.MaSach, 
        s.TenSach, 
        s.TenNhaXuatBan,
        s.Gia, 
        s.SoLuongTonKho,
        
        GROUP_CONCAT(tl.TenPhanLoai SEPARATOR ', ') AS TheLoai
    FROM 
        sach s
    LEFT JOIN 
        thuoctheloai ttl ON s.MaSach = ttl.MaSach
    LEFT JOIN 
        theloai tl ON ttl.MaTheLoai = tl.MaTheLoai
    WHERE 
        
        (p_TuKhoa IS NULL OR p_TuKhoa = '' OR s.TenSach LIKE CONCAT('%', p_TuKhoa, '%'))
        
        
        AND (p_GiaMin IS NULL OR s.Gia >= p_GiaMin)
        AND (p_GiaMax IS NULL OR s.Gia <= p_GiaMax)
        
        
        AND (p_TenTheLoai IS NULL OR p_TenTheLoai = '' OR tl.TenPhanLoai LIKE CONCAT('%', p_TenTheLoai, '%'))
        
    GROUP BY 
        s.MaSach, s.TenSach, s.TenNhaXuatBan, s.Gia, s.SoLuongTonKho
    ORDER BY 
        CASE WHEN p_SapXep = 'GIA_TANG' THEN s.Gia END ASC,
        CASE WHEN p_SapXep = 'GIA_GIAM' THEN s.Gia END DESC,
        CASE WHEN p_SapXep = 'MAC_DINH' OR p_SapXep IS NULL THEN s.TenSach END ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-24 11:15:33
