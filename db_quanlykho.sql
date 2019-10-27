-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2016 at 05:36 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_quanlykho`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatluong`
--

CREATE TABLE `chatluong` (
  `id` int(10) UNSIGNED NOT NULL,
  `cl_ma` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cl_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chatluong`
--

INSERT INTO `chatluong` (`id`, `cl_ma`, `cl_ten`, `created_at`, `updated_at`) VALUES
(2, '123', 'Tốt', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '222', 'Trung bình', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '333', 'Kém', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `chitietchuyenkho`
--

CREATE TABLE `chitietchuyenkho` (
  `id` int(10) UNSIGNED NOT NULL,
  `ctck_soluong` int(11) NOT NULL,
  `ctck_thanhtien` decimal(10,2) NOT NULL,
  `vt_id` int(10) UNSIGNED NOT NULL,
  `ck_id` int(10) UNSIGNED NOT NULL,
  `khocu_id` int(10) UNSIGNED NOT NULL,
  `khomoi_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chitietchuyenkho`
--

INSERT INTO `chitietchuyenkho` (`id`, `ctck_soluong`, `ctck_thanhtien`, `vt_id`, `ck_id`, `khocu_id`, `khomoi_id`, `created_at`, `updated_at`) VALUES
(1, 10, '180000.00', 2, 1, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 20, '200000.00', 1, 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, '18000.00', 2, 3, 1, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 10, '100000.00', 1, 4, 2, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 10, '2000000.00', 4, 5, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `chitietnhapkho`
--

CREATE TABLE `chitietnhapkho` (
  `id` int(10) UNSIGNED NOT NULL,
  `ctnk_soluong` int(11) NOT NULL,
  `ctnk_thanhtien` decimal(10,2) NOT NULL,
  `vt_id` int(10) UNSIGNED DEFAULT NULL,
  `nk_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chitietnhapkho`
--

INSERT INTO `chitietnhapkho` (`id`, `ctnk_soluong`, `ctnk_thanhtien`, `vt_id`, `nk_id`, `created_at`, `updated_at`) VALUES
(23, 100, '1800000.00', 2, 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 32, '6400000.00', 1, 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 23, '230000.00', 1, 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 100, '1000000.00', 1, 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 20, '360000.00', 2, 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 10, '100000.00', 1, 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 100, '1000000.00', 1, 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 20, '1000000.00', 5, 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `chitietxuatkho`
--

CREATE TABLE `chitietxuatkho` (
  `id` int(10) UNSIGNED NOT NULL,
  `ctxk_soluong` int(11) NOT NULL,
  `ctxk_thanhtien` decimal(10,2) NOT NULL,
  `vt_id` int(10) UNSIGNED NOT NULL,
  `xk_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chitietxuatkho`
--

INSERT INTO `chitietxuatkho` (`id`, `ctxk_soluong`, `ctxk_thanhtien`, `vt_id`, `xk_id`, `created_at`, `updated_at`) VALUES
(13, 100, '1000000.00', 1, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 5, '50000.00', 1, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 11, '110000.00', 1, 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 20, '4000000.00', 4, 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 12, '120000.00', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 21, '378000.00', 2, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 12, '240000.00', 7, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 123, '12300000.00', 6, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `chuyenkho`
--

CREATE TABLE `chuyenkho` (
  `id` int(10) UNSIGNED NOT NULL,
  `ck_ma` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ck_ngay` date NOT NULL,
  `ck_lydo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `nv_id` int(10) UNSIGNED NOT NULL,
  `ck_tongtien` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chuyenkho`
--

INSERT INTO `chuyenkho` (`id`, `ck_ma`, `ck_ngay`, `ck_lydo`, `nv_id`, `ck_tongtien`, `created_at`, `updated_at`) VALUES
(1, 'CK04072016110740', '2016-07-04', 'Chuyển vào kho Bình Thủy', 4, '180000.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'CK04072016120731', '2016-07-04', 'chuyển kho', 4, '200000.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'CK04072016030700', '2016-07-04', 'abc', 4, '18000.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'CK04072016030710', '2016-07-04', 'abc', 4, '100000.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'CK05072016030742', '2016-07-05', 'Thiếu ổn áp', 4, '2000000.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `congtrinh`
--

CREATE TABLE `congtrinh` (
  `id` int(10) UNSIGNED NOT NULL,
  `ct_ma` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ct_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `congtrinh`
--

INSERT INTO `congtrinh` (`id`, `ct_ma`, `ct_ten`, `created_at`, `updated_at`) VALUES
(1, 'CT01', 'Sửa chửa cột điện', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'CT02', 'Thay ổn áp điện', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '004', 'Thay bóng đèn đường', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `donvitinh`
--

CREATE TABLE `donvitinh` (
  `id` int(10) UNSIGNED NOT NULL,
  `dvt_ma` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `dvt_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `donvitinh`
--

INSERT INTO `donvitinh` (`id`, `dvt_ma`, `dvt_ten`, `created_at`, `updated_at`) VALUES
(1, 'DVT01', 'Kg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'DVT02', 'Cái', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'DVT03', 'Mét', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'DVT04', 'Lít', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kho`
--

CREATE TABLE `kho` (
  `id` int(10) UNSIGNED NOT NULL,
  `kho_ma` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `kho_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kho_lienhe` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kho_diachi` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `kho_sdt` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `kho_quanly` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kho_ghichu` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kho`
--

INSERT INTO `kho` (`id`, `kho_ma`, `kho_ten`, `kho_lienhe`, `kho_diachi`, `kho_sdt`, `kho_quanly`, `kho_ghichu`, `created_at`, `updated_at`) VALUES
(1, 'K001', 'Kho Ninh Kiều', 'Nguyễn Văn A', 'Ninh Kiều - Cần Thơ', '0710386554', 'Trần Trần', 'Còn quản lý', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'K002', 'Kho Bình Thủy', 'Nguyễn Văn B', 'Bình Thủy - Cần Thơ', '01665186186', 'Nguyễn Văn B', 'Tạm ngừng', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'K003', 'Kho Ô Môn', 'Nguyễn Văn A', 'Ô Môn - Cần Thơ', '0946711770', 'Le Le', 'Còn Quản lý', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `khuvuc`
--

CREATE TABLE `khuvuc` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `kv_ma` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `kv_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `khuvuc`
--

INSERT INTO `khuvuc` (`id`, `created_at`, `updated_at`, `kv_ma`, `kv_ten`) VALUES
(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KV1', 'Khu vực 1 (Ninh Kiều, Bình Thủy)'),
(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KV3', 'Khu vực 3 (Thốt Nốt, Cái Răng)');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2016_05_09_021146_create_khuvuc_table', 1),
('2016_05_17_122517_create_donvitinh_table', 2),
('2016_05_18_005923_create_chatluongs_table', 3),
('2016_05_18_020324_create_chatluong_table', 4),
('2016_05_18_020445_create_nhomvattu_table', 4),
('2016_05_18_021618_create_nhomvattu_table', 5),
('2016_05_18_023140_create_congtrinh_table', 6),
('2016_05_18_024401_create_nhasanxuat_table', 7),
('2016_05_18_041730_create_nhaphanphoi_table', 8),
('2016_05_18_065956_create_khuvucnhaphanphoi_table', 8),
('2016_05_18_071005_create_vattu_table', 9),
('2016_05_19_024011_create_kho_table', 10),
('2016_05_19_090753_create_phongban_table', 11),
('2016_05_20_032537_create_nhasanxuat_table', 12),
('2016_05_20_041401_create_nhaphanphoi_table', 13),
('2016_05_20_072311_create_nhanvien_table', 14),
('2016_05_23_035758_create_vattu_table', 15),
('2016_05_27_015553_create_vattu_table', 16),
('2016_05_27_072252_create_thongtincongty_table', 17),
('2016_05_27_072935_create_thongtincongties_table', 17),
('2016_05_27_085818_create_thongtincongty_table', 18),
('2016_05_27_090018_create_thongtincongty_table', 19),
('2016_05_27_090041_create_thongtincongties_table', 19),
('2016_05_27_090117_create_thongtincongty_table', 20),
('2016_05_30_023039_create_user_table', 21),
('2016_05_30_030642_create_user_table', 22),
('2016_05_30_031507_create_users_table', 23),
('2016_05_31_075701_create_nhanvien_table', 24),
('2016_05_31_080423_create_nhanvien_table', 25),
('2016_05_31_081038_create_nhanvien_table', 26),
('2016_05_31_081103_create_nhanviens_table', 26),
('2016_05_31_081308_create_users_table', 27),
('2016_05_31_082202_create_users_table', 28),
('2016_05_31_082731_create_users_table', 29),
('2016_05_31_083513_create_users_table', 30),
('2016_06_13_072141_create_nhapkho_table', 31),
('2016_06_13_073902_create_chitietnhapkho_table', 32),
('2016_06_13_074941_create_chitietnhapkho_table', 33),
('2016_06_13_075008_create_chitietnhapkhos_table', 33),
('2016_06_13_075120_create_chitietnhapkho_table', 34),
('2016_06_15_082752_create_xuatkho_table', 35),
('2016_06_15_083232_create_chitietxuatkho_table', 36),
('2008_12_31_170638_create_vattukho_table', 37),
('2016_06_22_122115_create_chuyenkho_table', 38),
('2016_06_22_125200_create_chitietchuyenkho_table', 39);

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id` int(11) UNSIGNED NOT NULL,
  `nd_ten` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`id`, `nd_ten`) VALUES
(1, 'Quản trị viên'),
(2, 'Thủ kho'),
(3, 'Nhân viên'),
(4, 'Ban lãnh đạo');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `id` int(10) UNSIGNED NOT NULL,
  `nv_ma` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `nv_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nv_gioitinh` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nv_ngaysinh` date NOT NULL,
  `nv_diachi` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `nv_cmnd` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `nv_sdt` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `nv_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nv_ngayvaolam` date NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`id`, `nv_ma`, `nv_ten`, `nv_gioitinh`, `nv_ngaysinh`, `nv_diachi`, `nv_cmnd`, `nv_sdt`, `nv_email`, `nv_ngayvaolam`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 'NV002', 'Lê Hữu Nghĩa', 'Nam', '2016-07-03', 'Long An', '24234234', '0946711770', 'nghiab1204035@gmail.com', '2016-07-14', 2, '2016-07-03 22:09:58', '2016-07-03 22:09:58'),
(5, '0011', 'Nguyễn Trọng Hiếu', 'Nam', '2016-07-07', 'Ninh Kiều - Cần Thơ', '24234234', '0946711770', 'han1221@gmail.com', '2016-07-20', 5, '2016-07-04 03:38:48', '2016-07-04 03:38:48'),
(6, '006', 'Nguyễn Văn A', 'Nam', '2016-07-22', 'Ninh Kiều - Cần Thơ', '24234234', '0946711770', 'abc@gmail.com', '2016-07-24', 6, '2016-07-04 05:19:17', '2016-07-04 05:19:17'),
(7, 'NV009', 'Nguyen Hoang Nam', 'Nam', '1990-06-05', 'Long AN', '301583024', '01293963362', 'nghia1204035@gmail.com', '2016-07-01', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `nhaphanphoi`
--

CREATE TABLE `nhaphanphoi` (
  `id` int(10) UNSIGNED NOT NULL,
  `npp_ma` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `npp_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `npp_diachi` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `npp_sdt` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `npp_fax` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `npp_taikhoan` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `npp_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `npp_nhanviendaidien` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `kv_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhaphanphoi`
--

INSERT INTO `nhaphanphoi` (`id`, `npp_ma`, `npp_ten`, `npp_diachi`, `npp_sdt`, `npp_fax`, `npp_taikhoan`, `npp_email`, `npp_nhanviendaidien`, `kv_id`, `created_at`, `updated_at`) VALUES
(3, 'abc', 'Công ty vật liệu Phú Cường', 'sda', '45645646', '5555555555', '456456465', '', 'Trần Trùi Trụi', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'KV2', 'Cửa hàng Ngọc Thuận', 'CM', 'ádas', 'ádasd', 'sdasd', 'sdasd@gmail.com', 'ádasds', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '003', 'Công ty TNHH ABC', 'Ninh Kiều - Cần Thơ', '0946711770', '0967117700', '123156498849', 'nghiab1204035@gmail.com', 'Nguyễn Văn A', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `nhapkho`
--

CREATE TABLE `nhapkho` (
  `id` int(10) UNSIGNED NOT NULL,
  `nk_ma` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nk_ngaylap` date NOT NULL,
  `nk_lydo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `nk_tongtien` decimal(10,2) NOT NULL,
  `npp_id` int(10) UNSIGNED NOT NULL,
  `nv_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhapkho`
--

INSERT INTO `nhapkho` (`id`, `nk_ma`, `nk_ngaylap`, `nk_lydo`, `nk_tongtien`, `npp_id`, `nv_id`, `created_at`, `updated_at`) VALUES
(26, 'PNK04072016080716', '2016-07-04', 'Nhap kho dinh ky', '8430000.00', 3, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'PNK04072016090707', '2016-07-04', 'abc', '1000000.00', 3, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'PNK04072016120735', '2016-07-04', 'Nhập kho vật tư', '460000.00', 4, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'PNK04072016030718', '2016-07-04', 'abc', '1000000.00', 3, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'PNK05072016030746', '2016-07-05', 'Nhập cầu dao', '1000000.00', 4, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `nhasanxuat`
--

CREATE TABLE `nhasanxuat` (
  `id` int(10) UNSIGNED NOT NULL,
  `nsx_ma` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `nsx_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kv_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhasanxuat`
--

INSERT INTO `nhasanxuat` (`id`, `nsx_ma`, `nsx_ten`, `kv_id`, `created_at`, `updated_at`) VALUES
(1, '001', 'Trung Quốc', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '002', 'Nhật Bản', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '003', 'Mỹ', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `nhomvattu`
--

CREATE TABLE `nhomvattu` (
  `id` int(10) UNSIGNED NOT NULL,
  `nvt_ma` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nvt_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhomvattu`
--

INSERT INTO `nhomvattu` (`id`, `nvt_ma`, `nvt_ten`, `created_at`, `updated_at`) VALUES
(2, 'NVT01', 'Dây diện', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'NVT02', 'Kim loại', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `phongban`
--

CREATE TABLE `phongban` (
  `id` int(10) UNSIGNED NOT NULL,
  `pb_ma` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `pb_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thongtincongty`
--

CREATE TABLE `thongtincongty` (
  `id` int(10) UNSIGNED NOT NULL,
  `cty_ten` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `cty_diachi` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `cty_sdt` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `cty_fax` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `cty_web` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cty_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `thongtincongty`
--

INSERT INTO `thongtincongty` (`id`, `cty_ten`, `cty_diachi`, `cty_sdt`, `cty_fax`, `cty_web`, `cty_email`, `created_at`, `updated_at`) VALUES
(1, 'Công ty điện lực TP. Cần Thơ', 'Số 06 Nguyễn Trãi, Thành phố Cần Thơ', '07102221000', '07102221039', 'khoevncantho.com', 'canthopc@evnspc.vn', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nguoidung_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `nguoidung_id`, `created_at`, `updated_at`) VALUES
(3, 'Hoàng Nam - Thủ kho', 'admin@gmail.com', '$2y$10$7LuqenZX8EI2OhVEt4yK.O7q7A.M5F7Co3j6oATlK8zGHGgOqjfLC', '5Ze0Sw7IoEXybvgKBwk5ALX0ALoWKRp43BPJBWRkoPHSIyY2FnzBHywbHJyu', 1, '2016-07-03 22:14:22', '2016-07-26 08:27:33'),
(5, 'Trọng Hiếu - Nhân viên', 'han1221@gmail.com', '$2y$10$hRKaeh2Z9fEUnCnrqTWcWOJBHZRtNUQ5rtx3y4I15Ksu5nvj0dg.K', 'EWjpUM02IAb9byjdZ9ju31IiC6ziG1EIz9eQWA1XS8W8jUY9kCuqdvJRq3nu', 1, '2016-07-04 03:38:48', '2016-07-04 19:46:18'),
(6, 'Minh Trung - GĐ', 'abc@gmail.com', '', '373I37Um2T0dhNGwPKhak7OZb6ibDTME5VL5fMzABTgrursAunHxwFEQDloX', 1, '2016-07-04 05:19:17', '2016-07-26 08:01:26');

-- --------------------------------------------------------

--
-- Table structure for table `vattu`
--

CREATE TABLE `vattu` (
  `id` int(10) UNSIGNED NOT NULL,
  `vt_ma` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `vt_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `vt_gia` decimal(10,0) NOT NULL,
  `dvt_id` int(10) UNSIGNED NOT NULL,
  `nvt_id` int(10) UNSIGNED NOT NULL,
  `cl_id` int(10) UNSIGNED NOT NULL,
  `npp_id` int(10) UNSIGNED NOT NULL,
  `nsx_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vattu`
--

INSERT INTO `vattu` (`id`, `vt_ma`, `vt_ten`, `vt_gia`, `dvt_id`, `nvt_id`, `cl_id`, `npp_id`, `nsx_id`, `created_at`, `updated_at`) VALUES
(1, '001', 'Dây điện', '10000', 3, 2, 2, 5, 1, '2016-06-12 17:48:57', '2016-06-12 17:48:57'),
(2, '002', 'Bóng đèn đường', '18000', 2, 3, 3, 3, 2, '2016-07-01 00:00:40', '2016-07-01 00:00:40'),
(4, '003', 'Ổn áp', '200000', 2, 3, 2, 3, 1, '2016-07-04 16:05:41', '2016-07-04 16:05:41'),
(5, '004', 'Cầu dao', '50000', 2, 3, 3, 3, 2, '2016-07-04 16:13:53', '2016-07-04 16:13:53'),
(6, '005', 'Dây cáp điện', '100000', 3, 2, 2, 4, 3, '2016-07-04 16:15:52', '2016-07-04 16:15:52'),
(7, '007', 'Bóng đèn huỳnh quang', '20000', 2, 3, 3, 4, 2, '2016-07-04 20:22:19', '2016-07-04 20:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `vattukho`
--

CREATE TABLE `vattukho` (
  `id` int(10) UNSIGNED NOT NULL,
  `vt_id` int(10) UNSIGNED NOT NULL,
  `kho_id` int(10) UNSIGNED NOT NULL,
  `sl_nhap` int(11) NOT NULL,
  `sl_xuat` int(11) NOT NULL,
  `sl_ton` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vattukho`
--

INSERT INTO `vattukho` (`id`, `vt_id`, `kho_id`, `sl_nhap`, `sl_xuat`, `sl_ton`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 230, 167, 63, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 3, 142, 11, 131, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 2, 43, 13, 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 2, 2, 80, 21, 59, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 2, 2, 80, 21, 59, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 2, 2, 80, 21, 59, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 4, 1, 100, 30, 70, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 5, 2, 100, 0, 100, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 6, 1, 200, 123, 77, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 7, 2, 100, 12, 88, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 5, 1, 20, 0, 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 4, 2, 10, 0, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `xuatkho`
--

CREATE TABLE `xuatkho` (
  `id` int(10) UNSIGNED NOT NULL,
  `xk_ma` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `xk_ngaylap` date NOT NULL,
  `xk_diachi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `xk_lydo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `xk_tongtien` decimal(10,2) NOT NULL,
  `ct_id` int(10) UNSIGNED NOT NULL,
  `nv_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `xuatkho`
--

INSERT INTO `xuatkho` (`id`, `xk_ma`, `xk_ngaylap`, `xk_diachi`, `xk_lydo`, `xk_tongtien`, `ct_id`, `nv_id`, `created_at`, `updated_at`) VALUES
(0, 'PXK26072016030701', '2016-07-26', 'đường 3/2', 'Xuất kho', '13038000.00', 1, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'PXK04072016050735', '2016-07-04', 'đường 3/2', 'abc', '1000000.00', 2, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'PXK04072016120702', '2016-07-04', 'Cần Thơ', 'Xuất kho Ninh Kiều', '50000.00', 2, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'PXK04072016020711', '2016-07-04', 'đường 3/2', 'acb', '110000.00', 1, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'PXK05072016030746', '2016-07-05', 'Bình Thủy', 'Hư ổn áp', '4000000.00', 2, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatluong`
--
ALTER TABLE `chatluong`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chitietchuyenkho`
--
ALTER TABLE `chitietchuyenkho`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chitietchuyenkho_vt_id_foreign` (`vt_id`),
  ADD KEY `chitietchuyenkho_ck_id_foreign` (`ck_id`),
  ADD KEY `chitietchuyenkho_khocu_id_foreign` (`khocu_id`),
  ADD KEY `chitietchuyenkho_khomoi_id_foreign` (`khomoi_id`);

--
-- Indexes for table `chitietnhapkho`
--
ALTER TABLE `chitietnhapkho`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chitietnhapkho_nk_id_foreign` (`nk_id`),
  ADD KEY `chitietnhapkho_vt_id_foreign` (`vt_id`);

--
-- Indexes for table `chitietxuatkho`
--
ALTER TABLE `chitietxuatkho`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chitietxuatkho_vt_id_foreign` (`vt_id`),
  ADD KEY `chitietxuatkho_xk_id_foreign` (`xk_id`);

--
-- Indexes for table `chuyenkho`
--
ALTER TABLE `chuyenkho`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nv_id` (`nv_id`);

--
-- Indexes for table `congtrinh`
--
ALTER TABLE `congtrinh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donvitinh`
--
ALTER TABLE `donvitinh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kho`
--
ALTER TABLE `kho`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `khuvuc`
--
ALTER TABLE `khuvuc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_group` (`user_id`);

--
-- Indexes for table `nhaphanphoi`
--
ALTER TABLE `nhaphanphoi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nhaphanphoi_kv_id_foreign` (`kv_id`);

--
-- Indexes for table `nhapkho`
--
ALTER TABLE `nhapkho`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nhapkho_npp_id_foreign` (`npp_id`),
  ADD KEY `nhapkho_nv_id_foreign` (`nv_id`);

--
-- Indexes for table `nhasanxuat`
--
ALTER TABLE `nhasanxuat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nhasanxuat_kv_id_foreign` (`kv_id`);

--
-- Indexes for table `nhomvattu`
--
ALTER TABLE `nhomvattu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phongban`
--
ALTER TABLE `phongban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thongtincongty`
--
ALTER TABLE `thongtincongty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nguoidung_id` (`nguoidung_id`);

--
-- Indexes for table `vattu`
--
ALTER TABLE `vattu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vattu_dvt_id_foreign` (`dvt_id`),
  ADD KEY `vattu_nvt_id_foreign` (`nvt_id`),
  ADD KEY `vattu_cl_id_foreign` (`cl_id`),
  ADD KEY `vattu_npp_id_foreign` (`npp_id`),
  ADD KEY `vattu_nsx_id_foreign` (`nsx_id`);

--
-- Indexes for table `vattukho`
--
ALTER TABLE `vattukho`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vattukho_vt_id_foreign` (`vt_id`),
  ADD KEY `vattukho_kho_id_foreign` (`kho_id`);

--
-- Indexes for table `xuatkho`
--
ALTER TABLE `xuatkho`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xuatkho_ct_id_foreign` (`ct_id`),
  ADD KEY `xuatkho_user_id_foreign` (`nv_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatluong`
--
ALTER TABLE `chatluong`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `chitietchuyenkho`
--
ALTER TABLE `chitietchuyenkho`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `chitietnhapkho`
--
ALTER TABLE `chitietnhapkho`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `chitietxuatkho`
--
ALTER TABLE `chitietxuatkho`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `chuyenkho`
--
ALTER TABLE `chuyenkho`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `congtrinh`
--
ALTER TABLE `congtrinh`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
