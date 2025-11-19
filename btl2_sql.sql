CREATE DATABASE  IF NOT EXISTS `btl2_hcsdl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `btl2_hcsdl`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: btl2_hcsdl
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
  `NaChiNhanh` char(3) NOT NULL,
  `DiaChi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NaChiNhanh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chinhanh`
--

LOCK TABLES `chinhanh` WRITE;
/*!40000 ALTER TABLE `chinhanh` DISABLE KEYS */;
INSERT INTO `chinhanh` VALUES ('000',NULL),('001',NULL),('002',NULL);
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
  `SoTienToiDa` int DEFAULT NULL,
  PRIMARY KEY (`MaGiamGia`)
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
-- Table structure for table `danhgiasanphamsach`
--

DROP TABLE IF EXISTS `danhgiasanphamsach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhgiasanphamsach` (
  `MaNguoiMua` char(3) NOT NULL,
  `MaSach` char(3) NOT NULL,
  `NoiDung` varchar(45) DEFAULT NULL,
  `NgayDanhGia` date DEFAULT NULL,
  `SoSao` int DEFAULT NULL,
  PRIMARY KEY (`MaNguoiMua`,`MaSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhgiasanphamsach`
--

LOCK TABLES `danhgiasanphamsach` WRITE;
/*!40000 ALTER TABLE `danhgiasanphamsach` DISABLE KEYS */;
/*!40000 ALTER TABLE `danhgiasanphamsach` ENABLE KEYS */;
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
  PRIMARY KEY (`MaNguoiMua`,`DiaChi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diachi`
--

LOCK TABLES `diachi` WRITE;
/*!40000 ALTER TABLE `diachi` DISABLE KEYS */;
/*!40000 ALTER TABLE `diachi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhang` (
  `MaDon` char(3) NOT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  `NgayTaoDon` date DEFAULT NULL,
  `PhuongThucThanhToan` varchar(45) DEFAULT NULL,
  `MaGiamGia` char(3) DEFAULT NULL,
  PRIMARY KEY (`MaDon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donhangbaogom`
--

DROP TABLE IF EXISTS `donhangbaogom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhangbaogom` (
  `MaDon` char(3) NOT NULL,
  `SoLuong` int DEFAULT NULL,
  `MaSanPham` char(3) NOT NULL,
  PRIMARY KEY (`MaSanPham`,`MaDon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhangbaogom`
--

LOCK TABLES `donhangbaogom` WRITE;
/*!40000 ALTER TABLE `donhangbaogom` DISABLE KEYS */;
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
  `NgayGiao` date DEFAULT NULL,
  `NgayNhan` date DEFAULT NULL,
  `TinhTrang` varchar(45) DEFAULT NULL,
  `DiachiNguoiNhan` varchar(45) DEFAULT NULL,
  `MaDon` char(3) DEFAULT NULL,
  PRIMARY KEY (`MaDonVanChuyen`)
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
  KEY `ma tac gia_idx` (`MaTacGia`),
  CONSTRAINT `ma sach` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`),
  CONSTRAINT `ma tac gia` FOREIGN KEY (`MaTacGia`) REFERENCES `tacgia` (`MaTacGia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duocvietboi`
--

LOCK TABLES `duocvietboi` WRITE;
/*!40000 ALTER TABLE `duocvietboi` DISABLE KEYS */;
INSERT INTO `duocvietboi` VALUES ('000','000'),('001','001'),('002','002'),('003','003'),('004','004');
/*!40000 ALTER TABLE `duocvietboi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giohangbaogom`
--

DROP TABLE IF EXISTS `giohangbaogom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giohangbaogom` (
  `MaGioHang` char(3) NOT NULL,
  `SoLuong` int DEFAULT NULL,
  `MaSanPham` char(3) NOT NULL,
  PRIMARY KEY (`MaSanPham`,`MaGioHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giohangbaogom`
--

LOCK TABLES `giohangbaogom` WRITE;
/*!40000 ALTER TABLE `giohangbaogom` DISABLE KEYS */;
/*!40000 ALTER TABLE `giohangbaogom` ENABLE KEYS */;
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
  `Hoten` varchar(45) DEFAULT NULL,
  `Sdt` varchar(45) DEFAULT NULL,
  `MatKhau` char(3) DEFAULT NULL,
  `GioiTinh` char(1) DEFAULT NULL,
  `VaiTro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaNguoiDung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoidung`
--

LOCK TABLES `nguoidung` WRITE;
/*!40000 ALTER TABLE `nguoidung` DISABLE KEYS */;
INSERT INTO `nguoidung` VALUES ('',NULL,NULL,NULL,NULL,NULL,NULL),('000','111@','Nguyen Van A','0111','111','M','ad'),('001','112@','Nguyen Van B','0112','112','F','ad'),('002','113@','Nguyen Van C','113','113','F','ad'),('003','114@','Nguyen Van D','114','114','M','ad'),('004','115@','Nguyen Van E','115','115','M','ad'),('005','116@','Nguyen Van F','116','116','F','cus'),('006','117@','Nguyen Van G','117','117','F','cus'),('007','118@','Nguyen Van H','118','118','M','cus'),('008','119@','Nguyen Van I','119','119','M','cus'),('009','120@','Nguyen Van J','120','120','F','cus'),('010','121@','Nguyen Van K','121','121','M','deli'),('011','122@','Nguyen Van L','122','122','M','deli'),('012','123@','Nguyen Van M','123','123','F','deli'),('013','124@','Nguyen Van N','124','124','M','deli'),('014','125@','Nguyen Van O','125','125','F','deli');
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
  `TenPhuongTienDangKy` varchar(45) DEFAULT NULL,
  `BienSo` varchar(45) DEFAULT NULL,
  `PhamViHoatDong` varchar(45) DEFAULT NULL,
  `Luong` int DEFAULT NULL,
  PRIMARY KEY (`MaNguoiGiaoHang`),
  CONSTRAINT `ma nguoi dung-nguoi giao hang` FOREIGN KEY (`MaNguoiGiaoHang`) REFERENCES `nguoidung` (`MaNguoiDung`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoigiaohang`
--

LOCK TABLES `nguoigiaohang` WRITE;
/*!40000 ALTER TABLE `nguoigiaohang` DISABLE KEYS */;
INSERT INTO `nguoigiaohang` VALUES ('010',NULL,NULL,NULL,NULL,NULL),('011',NULL,NULL,NULL,NULL,NULL),('012',NULL,NULL,NULL,NULL,NULL),('013',NULL,NULL,NULL,NULL,NULL),('014',NULL,NULL,NULL,NULL,NULL);
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
  `maGioHang` char(3) NOT NULL,
  PRIMARY KEY (`MaNguoiMua`),
  CONSTRAINT `ma nguoi dung-nguoi mua` FOREIGN KEY (`MaNguoiMua`) REFERENCES `nguoidung` (`MaNguoiDung`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoimua`
--

LOCK TABLES `nguoimua` WRITE;
/*!40000 ALTER TABLE `nguoimua` DISABLE KEYS */;
INSERT INTO `nguoimua` VALUES ('005','001'),('006','002'),('007','003'),('008','004'),('009','005');
/*!40000 ALTER TABLE `nguoimua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoiquanly`
--

DROP TABLE IF EXISTS `nguoiquanly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoiquanly` (
  `MaNguoiQuanLy` char(3) NOT NULL,
  `ThoiGianLamViec` varchar(45) DEFAULT NULL,
  `NgayLamViec` varchar(45) DEFAULT NULL,
  `Luong` int DEFAULT NULL,
  `NghiepVu` varchar(45) DEFAULT 'ad',
  PRIMARY KEY (`MaNguoiQuanLy`),
  CONSTRAINT `ma nguoi dung-nguoi quan ly` FOREIGN KEY (`MaNguoiQuanLy`) REFERENCES `nguoidung` (`MaNguoiDung`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoiquanly`
--

LOCK TABLES `nguoiquanly` WRITE;
/*!40000 ALTER TABLE `nguoiquanly` DISABLE KEYS */;
INSERT INTO `nguoiquanly` VALUES ('000',NULL,NULL,NULL,'ad'),('001',NULL,NULL,NULL,'ad'),('002',NULL,NULL,NULL,'ad'),('003',NULL,NULL,NULL,'ad'),('004',NULL,NULL,NULL,'ad');
/*!40000 ALTER TABLE `nguoiquanly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phanphoi`
--

DROP TABLE IF EXISTS `phanphoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phanphoi` (
  `MaChiNhanhGui` char(3) NOT NULL,
  `MaChiNhanhNhan` char(3) NOT NULL,
  PRIMARY KEY (`MaChiNhanhGui`,`MaChiNhanhNhan`),
  KEY `ma chi nhanh-gui_idx` (`MaChiNhanhNhan`),
  CONSTRAINT `ma chi nhanh-gui` FOREIGN KEY (`MaChiNhanhNhan`) REFERENCES `chinhanh` (`NaChiNhanh`),
  CONSTRAINT `ma chi nhanh-nhan` FOREIGN KEY (`MaChiNhanhGui`) REFERENCES `chinhanh` (`NaChiNhanh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phanphoi`
--

LOCK TABLES `phanphoi` WRITE;
/*!40000 ALTER TABLE `phanphoi` DISABLE KEYS */;
INSERT INTO `phanphoi` VALUES ('000','001'),('001','002');
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
  `YeuCauToiThieu` int DEFAULT NULL,
  `HanSuDung` date DEFAULT NULL,
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
  `GiaTien` int DEFAULT NULL,
  `SoLuongTonKho` int DEFAULT NULL,
  `NgonNgu` varchar(45) DEFAULT NULL,
  `DichGia` varchar(45) DEFAULT NULL,
  `HinhThuc` varchar(45) DEFAULT NULL,
  `SoTrang` int DEFAULT NULL,
  `TenNhaXuatBan` varchar(45) DEFAULT NULL,
  `TenNhaPhanPhoi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sach`
--

LOCK TABLES `sach` WRITE;
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
INSERT INTO `sach` VALUES ('000','GiaiTich1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('001','Giaitich2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('002','DaiSoTuyenTinh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('003','HoaDaiCuong',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('004','CauTrucDuLieu&GiaiThuat',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('005','MoHinhHoaToanHoc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `tacgia` VALUES ('000','A',NULL,NULL),('001','B',NULL,NULL),('002','C',NULL,NULL),('003','D',NULL,NULL),('004','E',NULL,NULL);
/*!40000 ALTER TABLE `tacgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taiban`
--

DROP TABLE IF EXISTS `taiban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taiban` (
  `MaSach` char(3) NOT NULL,
  `MaSanPham` char(3) NOT NULL,
  `LanTaiBan` int DEFAULT NULL,
  `NamTaiBan` date DEFAULT NULL,
  `MaChiNhanh` char(3) DEFAULT NULL,
  PRIMARY KEY (`MaSach`,`MaSanPham`),
  KEY `ma chi nhanh-cung cap_idx` (`MaChiNhanh`),
  CONSTRAINT `ma chi nhanh-cung cap` FOREIGN KEY (`MaChiNhanh`) REFERENCES `chinhanh` (`NaChiNhanh`),
  CONSTRAINT `ma sach-taiban` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taiban`
--

LOCK TABLES `taiban` WRITE;
/*!40000 ALTER TABLE `taiban` DISABLE KEYS */;
INSERT INTO `taiban` VALUES ('000','000',2,NULL,NULL),('000','001',1,NULL,NULL),('001','002',2,NULL,NULL),('001','003',1,NULL,NULL),('002','004',2,NULL,NULL),('002','005',1,NULL,NULL),('003','006',2,NULL,NULL),('003','007',1,NULL,NULL),('004','008',2,NULL,NULL),('004','009',1,NULL,NULL),('004','010',2,NULL,NULL),('005','011',1,NULL,NULL),('005','012',2,NULL,NULL);
/*!40000 ALTER TABLE `taiban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theloai`
--

DROP TABLE IF EXISTS `theloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theloai` (
  `MaPhanLoai` char(3) NOT NULL,
  `TenPhanLoai` varchar(45) DEFAULT NULL,
  `ThongTinMoTa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaPhanLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theloai`
--

LOCK TABLES `theloai` WRITE;
/*!40000 ALTER TABLE `theloai` DISABLE KEYS */;
INSERT INTO `theloai` VALUES ('000','xa hoi',NULL),('001','tu nhien',NULL);
/*!40000 ALTER TABLE `theloai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thongtingiaohang`
--

DROP TABLE IF EXISTS `thongtingiaohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thongtingiaohang` (
  `MaNguoiGiao` char(3) NOT NULL,
  `MaDonVanChuyen` char(3) NOT NULL,
  PRIMARY KEY (`MaNguoiGiao`,`MaDonVanChuyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thongtingiaohang`
--

LOCK TABLES `thongtingiaohang` WRITE;
/*!40000 ALTER TABLE `thongtingiaohang` DISABLE KEYS */;
/*!40000 ALTER TABLE `thongtingiaohang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuoctheloai`
--

DROP TABLE IF EXISTS `thuoctheloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuoctheloai` (
  `MaPhanLoai` char(3) NOT NULL,
  `MaSach` char(3) NOT NULL,
  PRIMARY KEY (`MaPhanLoai`,`MaSach`),
  KEY `ma sach_idx` (`MaSach`),
  CONSTRAINT `ma phan loai` FOREIGN KEY (`MaPhanLoai`) REFERENCES `theloai` (`MaPhanLoai`),
  CONSTRAINT `ma sach-thuoc the loai` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoctheloai`
--

LOCK TABLES `thuoctheloai` WRITE;
/*!40000 ALTER TABLE `thuoctheloai` DISABLE KEYS */;
INSERT INTO `thuoctheloai` VALUES ('000','000'),('000','001'),('000','002'),('000','003'),('000','004'),('000','005');
/*!40000 ALTER TABLE `thuoctheloai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinnhanhoidap`
--

DROP TABLE IF EXISTS `tinnhanhoidap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinnhanhoidap` (
  `MaTinNhan` char(3) NOT NULL,
  `NoiDung` varchar(45) DEFAULT NULL,
  `ThoiGian` date DEFAULT NULL,
  `MaNguoiMua` char(3) DEFAULT NULL,
  `MaNguoiQuanLy` char(3) DEFAULT NULL,
  PRIMARY KEY (`MaTinNhan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinnhanhoidap`
--

LOCK TABLES `tinnhanhoidap` WRITE;
/*!40000 ALTER TABLE `tinnhanhoidap` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinnhanhoidap` ENABLE KEYS */;
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
  PRIMARY KEY (`MaGiamGia`)
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

-- Dump completed on 2025-11-19 18:22:24
