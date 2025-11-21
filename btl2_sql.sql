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
INSERT INTO `chinhanh` VALUES ('001','Ho Chi Minh'),('002','Ho CHi Minh'),('003','Ha Noi'),('004','Da Nang');
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
INSERT INTO `diachi` VALUES ('000','1');
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
  `PhuongThuocThanhToan` varchar(45) DEFAULT NULL,
  `MaGiamGia` char(3) DEFAULT NULL,
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
INSERT INTO `donhang` VALUES ('000','000','2025-11-21','Waiting for checkout','Waiting for checkout',NULL),('001','006','2025-11-21','Waiting for checkout','Waiting for checkout',NULL);
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `donhangbaogom` VALUES ('000','000',5,50000),('001','001',1,75000);
/*!40000 ALTER TABLE `donhangbaogom` ENABLE KEYS */;
UNLOCK TABLES;

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
  `TongGia` int DEFAULT NULL,
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
/*!40000 ALTER TABLE `duocvietboi` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `giohangbaogom` VALUES ('000','000',5),('006','001',1);
/*!40000 ALTER TABLE `giohangbaogom` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `phanphoi` VALUES ('001','002'),('004','002'),('002','003');
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
  `NamTai` year DEFAULT NULL,
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
INSERT INTO `sach` VALUES ('000',NULL,NULL,NULL,NULL,NULL,NULL,10000,5,NULL),('001','Giai tich 1','Tieng Viet','','Nxb.DHQG TP.HCM',NULL,2021,75000,60,NULL),('002','Giai tich 2','Tieng Viet',NULL,'Nxb.DHQG TP.HCM',NULL,2021,80000,60,NULL),('003','Dai so tuyen tinh','Tieng Viet',NULL,'Nxb.DHQG TP.HCM',NULL,2022,65000,50,NULL),('004','Co so du lieu','Tieng Viet',NULL,'Nxb.DHQG TP.HCM',NULL,2025,175000,10,NULL),('005','Discrete mathematic','Tieng Anh',NULL,'Mc  Graw Hill Education',NULL,2019,300000,5,NULL),('006','He Thong So','Tieng Viet',NULL,'Nxb.DHQG TP.HCM',NULL,2020,65000,20,NULL),('007','Cau truc du lieu va Giai thuat','tieng Viet',NULL,'Nxb.DHQG TP.HCM',NULL,2022,70000,20,NULL),('008','Lich su Dang','Tieng Viet',NULL,'Nxb.DHQG TP.HCM',NULL,2021,50000,30,NULL),('009','Chu Nghi Xa Hoi Khoa Hoc','Tieng Viet',NULL,'Nxb.DHQG TP.HCM',NULL,2021,50000,27,NULL),('010','Tu Tuong Ho Chi Minh','Tieng Viet',NULL,'Nxb.DHQG TP.HCM',NULL,2021,55000,35,NULL);
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
  PRIMARY KEY (`MaTacGia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tacgia`
--

LOCK TABLES `tacgia` WRITE;
/*!40000 ALTER TABLE `tacgia` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-22  0:03:18
