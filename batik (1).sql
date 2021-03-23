-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2021 at 09:49 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `batik`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_brg` int(50) NOT NULL,
  `nama_brg` varchar(100) NOT NULL,
  `kode_brg` varchar(30) NOT NULL,
  `stok_brg` varchar(30) NOT NULL,
  `kategori_brg` varchar(50) NOT NULL,
  `hbeli_brg` varchar(50) NOT NULL,
  `hjual_brg` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_brg`, `nama_brg`, `kode_brg`, `stok_brg`, `kategori_brg`, `hbeli_brg`, `hjual_brg`) VALUES
(4, 'sasasa1', '21212', '0', 'Male', '100000', '90000'),
(5, 'kasjaksjaks', '9009s', '900000', 'Male', '900000', 'dasdsdasdasda'),
(6, 'kasjaksjaks', '9009s', '900000', 'Male', '900000', 'dasdsdasdasda'),
(9, 'ooiipipip', 'oipipi', '79', 'Female', '900000', '900000'),
(10, 'oipip', 'dsada', '43', 'Male', '900000', '900000'),
(12, '9000', 'dadad', '8814', 'Male', '9000000', '90000'),
(13, '9000', 'dadad', '9000', 'Male', '9000000', '90000');

-- --------------------------------------------------------

--
-- Table structure for table `kas`
--

CREATE TABLE `kas` (
  `id_kas` int(11) NOT NULL,
  `nama_kas` varchar(100) NOT NULL,
  `saldo_kas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kas`
--

INSERT INTO `kas` (`id_kas`, `nama_kas`, `saldo_kas`) VALUES
(1, 'bank mandiri', '10000000'),
(2, 'dompet', '1000000');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id_kategori_brg` int(11) NOT NULL,
  `kategori_brg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`id_kategori_brg`, `kategori_brg`) VALUES
(1, 'hhoo');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(100) NOT NULL,
  `kode_brg` varchar(50) NOT NULL,
  `harga_brg` varchar(100) NOT NULL,
  `jml_brg` varchar(50) NOT NULL,
  `sub_total` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id_brg`, `nama_brg`, `kode_brg`, `harga_brg`, `jml_brg`, `sub_total`, `status`) VALUES
(9, 'ooiipipip', 'oipipi', '900000', '1', '900000', 'order');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `tgl_pengeluaran` varchar(30) NOT NULL,
  `ket_pengeluaran` varchar(30) NOT NULL,
  `nilai_pengeluaran` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`tgl_pengeluaran`, `ket_pengeluaran`, `nilai_pengeluaran`) VALUES
('hahaha', 'satu', 'satu'),
('hihihi', 'dua', 'dua');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `invoice` varchar(50) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `total_biaya` varchar(50) NOT NULL,
  `jenis_bayar` varchar(50) NOT NULL,
  `setor_ke` varchar(50) NOT NULL,
  `jml_bayar` varchar(50) NOT NULL,
  `catatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`invoice`, `tgl_transaksi`, `total_biaya`, `jenis_bayar`, `setor_ke`, `jml_bayar`, `catatan`) VALUES
('LN - 03210001', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '9000000000', 'nbmbbmbmbnm'),
('LN - 03210002', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '90000000', 'jkhkjkjhkjhk'),
('LN - 03210003', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000', 'hggjhghjghjgjhghj'),
('LN - 03210004', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '5000000', 'hggjgjghjgj'),
('LN - 03210005', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '9000000', 'djsadhhasgddgjas'),
('LN - 03210006', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '900000000', 'dkjsahdjksahdjashkd'),
('LN - 03210007', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '9000000000', 'dsiahdashdkashdjsa'),
('LN - 03210008', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000', 'jhjhgjghjgjhgjhg'),
('LN - 03210009', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000', 'hjhkjhjhkhhkj'),
('LN - 03210010', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000000', 'dsjdajsdhshagdas'),
('LN - 03210011', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '9000000000', 'dsjhdshagdasdgsajdgasd'),
('LN - 03210012', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000', 'jhsjkdhashdkasd'),
('LN - 03210013', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '9000000000', 'hjghjghjghjgj'),
('LN - 03210014', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '90000000000', 'jdsgdgasdhgasdasjd'),
('LN - 03210015', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '9000000000', 'hjghjgjgjghjbjhgj'),
('LN - 03210016', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '80000000000', 'jhjhjhjhjhjh'),
('LN - 03210017', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000', 'dasdasdasdas'),
('LN - 03210018', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '9000000000', 'sdgashdgasjdgasjda'),
('LN - 03210019', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '9000000', 'dagshdhdgjas'),
('LN - 03210020', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '9000000', 'dnsabdsabdasdbashd'),
('LN - 03210021', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '900000000', 'djshdadjs'),
('LN - 03210022', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '90000000', 'dsdsadadasdas'),
('LN - 03210023', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '9000000', 'djshdhsagdasjda'),
('LN - 03210024', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000', 'dadasdada'),
('LN - 03210025', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '9000000', 'kjhjkdskdas'),
('LN - 03210026', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '90000000', 'djagsdagsjadsjd'),
('LN - 03210027', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '90000000', 'hjagsdjasdjdas'),
('LN - 03210028', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '9000000000', 'xsnmdsahdkasjdhasd'),
('LN - 03210029', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '90000000', 'jhghgjggjhggjh'),
('LN - 03210030', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '90000000000', 'dsadasdasdasd'),
('LN - 03210031', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '90000000000', 'sdakdhasdasjdas'),
('LN - 03210032', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '9000000000', 'jhjhjhjhjh'),
('LN - 03210033', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '9000000', 'dsadasd'),
('LN - 03210034', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '90000000000', 'dsadada'),
('LN - 03210035', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000', 'dasdadadad'),
('LN - 03210036', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '9000000000', 'ghfhfghfhff'),
('LN - 03210037', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000', 'dadadadadas'),
('LN - 03210038', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000', 'dadada'),
('LN - 03210039', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000', 'dadadad'),
('LN - 03210040', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000', 'daasdadas'),
('LN - 03210041', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '80000000000', 'dasdasdadasd'),
('LN - 03210042', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000', 'dadadasdasd'),
('LN - 03210043', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '90000000', 'jhkhjkjkhj'),
('LN - 03210044', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '9000000000', 'dadadada'),
('LN - 03210045', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '900000000', 'dadadadad'),
('LN - 03210046', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '90000000', 'dadadadad'),
('LN - 03210047', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '90000000000', 'dadada'),
('LN - 03210048', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '90000000', 'hggj'),
('LN - 03210049', '2021-03-21', '3780000', 'Transfer', 'bank mandiri', '90000000000', ''),
('LN - 03210050', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '9000000', 'gjkhkhjkhjkjhjk'),
('LN - 03210051', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '9000000', 'ghjgjhghgj'),
('LN - 03210052', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '900000000', 'hjghjghgjhg'),
('LN - 03210053', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '90000000000', 'dadada'),
('LN - 03210054', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '9000000000', 'dada'),
('LN - 03210055', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '90000000000', ''),
('LN - 03210056', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '900000000', 'hjgjhgghj'),
('LN - 03210057', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '90000000', ''),
('LN - 03210058', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '9000000000', 'sasasasa'),
('LN - 03210059', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '9000000000', ''),
('LN - 03210060', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '90000000000', ''),
('LN - 03210061', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '90000000', ''),
('LN - 03210062', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '900000000', ''),
('LN - 03210063', '2021-03-21', '3780000', 'Tunai', 'bank mandiri', '90000000', ''),
('LN - 03210064', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '900000000', ''),
('LN - 03210065', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '900000000', ''),
('LN - 03210066', '2021-03-22', '3780000', 'Transfer', 'bank mandiri', '900000000', ''),
('LN - 03210067', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '9000000000', ''),
('LN - 03210068', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '900000000', 'hjghgjgh'),
('LN - 03210069', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '900000000', 'hgghghjgj'),
('LN - 03210070', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '90000000', 'hghjgjghgj'),
('LN - 03210071', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '900000000000', 'jdkhasdkjaskdas'),
('LN - 03210072', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '9000000000', ''),
('LN - 03210073', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '9000000000', 'dsadsadasd'),
('LN - 03210074', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '900000000', 'jkhkjhhk'),
('LN - 03210075', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '9000000', 'jkhkhhkjh'),
('LN - 03210076', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '900000000', 'nj'),
('LN - 03210077', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '90000000000', ''),
('LN - 03210078', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '900000000', ''),
('LN - 03210079', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '900000000000', ''),
('LN - 03210080', '2021-03-22', '3780000', 'Tunai', 'bank mandiri', '90000000', ''),
('LN - 03210081', '2021-03-22', '180000', 'Tunai', 'bank mandiri', '900000', ''),
('LN - 03210082', '2021-03-22', '180000', 'Tunai', 'bank mandiri', '9000000', ''),
('LN - 03210083', '2021-03-22', '180000', 'Tunai', 'bank mandiri', '900000', ''),
('LN - 03210084', '2021-03-22', '180000', 'Tunai', 'bank mandiri', '9000000', ''),
('LN - 03210085', '2021-03-22', '180000', 'Tunai', 'bank mandiri', '9000000', ''),
('LN - 03210086', '2021-03-22', '180000', 'Tunai', 'bank mandiri', '90000000', ''),
('LN - 03210087', '2021-03-22', '180000', 'Transfer', 'bank mandiri', '9000000000', ''),
('LN - 03210088', '2021-03-22', '180000', 'Tunai', 'bank mandiri', '9000000000', ''),
('LN - 03210089', '2021-03-22', '180000', 'Tunai', 'bank mandiri', '90000000', ''),
('LN - 03210090', '2021-03-22', '180000', 'Tunai', 'bank mandiri', '900000000', ''),
('LN - 03210091', '2021-03-22', '180000', 'Tunai', 'bank mandiri', '90000000', ''),
('LN - 03210092', '2021-03-22', '180000', 'Tunai', 'bank mandiri', '90000000', ''),
('LN - 03210093', '2021-03-22', '180000', 'Tunai', 'bank mandiri', '9000000000', 'hjasdhasgdjasd'),
('LN - 03210094', '2021-03-22', '180000', 'Tunai', 'bank mandiri', '9000000', 'dadadada'),
('LN - 03210095', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '1260000', 'dadasdasda'),
('LN - 03210096', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '90000000', ''),
('LN - 03210097', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '90000000', 'jh'),
('LN - 03210098', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '10000000000000', ''),
('LN - 03210099', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '9000000000', ''),
('LN - 03210100', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '900000000', ''),
('LN - 03210101', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '9000000', ''),
('LN - 03210102', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '900000000', ''),
('LN - 03210103', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '9000000000', ''),
('LN - 03210104', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '9000000', ''),
('LN - 03210105', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '9000000000', ''),
('LN - 03210106', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '90000000', ''),
('LN - 03210107', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '90000000', ''),
('LN - 03210108', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '900000000', ''),
('LN - 03210109', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '9000000000', 'jhkjhkjjh'),
('LN - 03210110', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '9000000000', ''),
('LN - 03210111', '2021-03-22', '1260000', 'Transfer', 'bank mandiri', '900000000', ''),
('LN - 03210112', '2021-03-22', '1260000', 'Tunai', 'bank mandiri', '900000000', 'hjgjhghjghjghgj'),
('LN - 03210113', '2021-03-22', '8100000', 'Tunai', 'bank mandiri', '90000000', 'la'),
('LN - 03210114', '2021-03-23', '1800000', 'Tunai', 'dompet', '9000000', 'lklklklk'),
('LN - 03210115', '2021-03-23', '900000', 'Tunai', 'bank mandiri', '9000000', 'kkk');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `invoice` varchar(25) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `kode_brg` varchar(50) NOT NULL,
  `harga_brg` varchar(50) NOT NULL,
  `jml_brg` varchar(50) NOT NULL,
  `sub_total` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`invoice`, `id_brg`, `nama_brg`, `kode_brg`, `harga_brg`, `jml_brg`, `sub_total`) VALUES
('LN - 03210001', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210001', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210001', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210002', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210002', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210002', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210003', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210003', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210003', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210004', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210004', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210004', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210005', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210005', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210005', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210006', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210006', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210006', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210007', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210007', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210007', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210008', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210008', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210008', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210009', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210009', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210009', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210010', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210010', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210010', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210011', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210011', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210011', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210012', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210012', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210012', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210013', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210013', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210013', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210014', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210014', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210014', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210015', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210015', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210015', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210016', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210016', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210016', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210017', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210017', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210017', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210018', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210018', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210018', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210019', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210019', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210019', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210020', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210020', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210020', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210021', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210021', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210021', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210022', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210022', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210022', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210023', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210023', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210023', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210024', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210024', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210024', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210025', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210025', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210025', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210026', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210026', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210026', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210027', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210027', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210027', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210028', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210028', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210028', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210029', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210029', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210029', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210030', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210030', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210030', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210031', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210031', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210031', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210032', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210032', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210032', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210033', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210033', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210033', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210034', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210034', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210034', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210035', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210035', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210035', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210036', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210036', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210036', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210037', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210037', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210037', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210038', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210038', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210038', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210039', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210039', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210039', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210040', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210040', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210040', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210041', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210041', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210041', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210042', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210042', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210042', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210043', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210043', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210043', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210044', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210044', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210044', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210045', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210045', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210045', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210046', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210046', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210046', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210047', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210047', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210047', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210048', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210048', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210048', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210049', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210049', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210049', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210050', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210050', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210050', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210051', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210051', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210051', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210052', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210052', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210052', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210053', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210053', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210053', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210054', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210054', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210054', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210055', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210055', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210055', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210056', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210056', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210056', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210057', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210057', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210057', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210058', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210058', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210058', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210059', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210059', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210059', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210060', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210060', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210060', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210061', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210061', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210061', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210062', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210062', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210062', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210063', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210063', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210063', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210064', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210064', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210064', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210065', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210065', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210065', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210066', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210066', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210066', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210067', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210067', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210067', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210068', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210068', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210068', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210069', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210069', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210069', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210070', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210070', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210070', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210071', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210071', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210071', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210072', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210072', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210072', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210073', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210073', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210073', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210074', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210074', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210074', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210075', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210075', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210075', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210076', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210076', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210076', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210077', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210077', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210077', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210078', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210078', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210078', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210079', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210079', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210079', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210080', 12, '9000', 'dadad', '90000', '2', '180000'),
('LN - 03210080', 11, 'oipip', 'dsada', '900000', '3', '2700000'),
('LN - 03210080', 8, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210081', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210082', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210083', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210084', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210085', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210086', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210087', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210088', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210089', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210090', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210091', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210092', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210093', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210094', 7, 'kjkjkjkj', 'dsadasdada', '90000', '2', '180000'),
('LN - 03210095', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210095', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210096', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210096', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210097', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210097', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210098', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210098', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210099', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210099', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210100', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210100', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210101', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210101', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210102', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210102', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210103', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210103', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210104', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210104', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210105', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210105', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210106', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210106', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210107', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210107', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210108', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210108', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210109', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210109', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210110', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210110', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210111', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210111', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210112', 7, 'kjkjkjkj', 'dsadasdada', '90000', '4', '360000'),
('LN - 03210112', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210113', 9, 'ooiipipip', 'oipipi', '900000', '9', '8100000'),
('LN - 03210114', 10, 'oipip', 'dsada', '900000', '1', '900000'),
('LN - 03210114', 9, 'ooiipipip', 'oipipi', '900000', '1', '900000'),
('LN - 03210115', 9, 'ooiipipip', 'oipipi', '900000', '1', '900000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `kas`
--
ALTER TABLE `kas`
  ADD PRIMARY KEY (`id_kas`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id_kategori_brg`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`invoice`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_brg` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `kas`
--
ALTER TABLE `kas`
  MODIFY `id_kas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id_kategori_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
