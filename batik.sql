-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Feb 2021 pada 10.10
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.7

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
-- Struktur dari tabel `barang`
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
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_brg`, `nama_brg`, `kode_brg`, `stok_brg`, `kategori_brg`, `hbeli_brg`, `hjual_brg`) VALUES
(1, 'batik cap', 'b003', '100', 'batik', '10000', '100000'),
(2, 'Batik tulis', 'b002', '12', 'batik', '10000', '100000'),
(3, 'Batik tulis', 'b002', '12', 'batik', '10000', '100000'),
(4, 'Batik byar', 'b002', '12', 'batik', '10000', '100000'),
(5, 'batik kampret', 'b004', '120', 'Female', '900000', '10000'),
(6, 'batik kampret', 'b004', '120', 'Female', '900000', '10000'),
(7, 'batik kampret', 'b004', '120', 'Female', '900000', '10000'),
(8, 'haloo', 'ashaksh', '90', 'Male', '900000', '10000'),
(9, 'dsakdad', 'dkadkad', '22', 'Male', '90000', '10000'),
(10, 'adsadsaddasdas', 'sadsadasdas', '29', 'Female', '2000000', '10000'),
(11, 'dasdasd', 'sadasdas', '1', 'Female', '10000', '1000'),
(12, 'last', 'jajsd', '90', 'Female', '900000', '10000'),
(13, 'dsadsds', 'sadasd', '10', 'Female', '10000', '100000'),
(14, 'dasdsa', 'sadas', '8', 'Male', '88998', '90909');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(50) NOT NULL,
  `kategori_brg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori_brg`) VALUES
(1, 'kaka'),
(2, 'halo'),
(3, 'yolo'),
(4, 'yahalo'),
(5, 'jihahaha'),
(6, 'hehehe'),
(7, 'huhuhuh'),
(8, ''),
(9, ''),
(10, ''),
(11, 'yuyuyu'),
(12, 'batik'),
(13, 'Female');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_detail`
--

CREATE TABLE `order_detail` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(100) NOT NULL,
  `harga_brg` varchar(100) NOT NULL,
  `jml_brg` varchar(50) NOT NULL,
  `sub_total` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_detail`
--

INSERT INTO `order_detail` (`id_brg`, `nama_brg`, `harga_brg`, `jml_brg`, `sub_total`) VALUES
(9, 'dsakdad', '10000', '1', '10000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `tgl_pengeluaran` varchar(30) NOT NULL,
  `ket_pengeluaran` varchar(30) NOT NULL,
  `nilai_pengeluaran` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengeluaran`
--

INSERT INTO `pengeluaran` (`tgl_pengeluaran`, `ket_pengeluaran`, `nilai_pengeluaran`) VALUES
('hahaha', 'satu', 'satu'),
('hihihi', 'dua', 'dua');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_brg` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
