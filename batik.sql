-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Feb 2021 pada 10.18
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
  `kode_brg` int(11) NOT NULL,
  `nama_brg` varchar(100) NOT NULL,
  `stok_brg` varchar(50) NOT NULL,
  `hbeli_brg` varchar(100) NOT NULL,
  `hjual_brg` varchar(100) NOT NULL,
  `kategori_brg` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kode_brg`, `nama_brg`, `stok_brg`, `hbeli_brg`, `hjual_brg`, `kategori_brg`) VALUES
(1, 'batik tulis', '100', '100000', '200000', 'batik'),
(2, 'batik cap', '20', '90000', '100000', 'batik'),
(3, 'sasasasa', '12', '1000', '10000', 'asasasasas'),
(4, 'ininininini', '121212', '121212121', '21212121212', '12121212');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`kategori`) VALUES
('fdsfdsfdsfdsfsd'),
('fdfdfdfdfd'),
('dasfsdafdfdsfds'),
('fdfdfdfdfdfdfdfdf'),
('hghghghghg'),
('dfdfdfdfdfd'),
('fdsfdsfsdfsdfs'),
('sdadsadasdsadasdasdasdas'),
('dsdsds'),
('kkkkk'),
('ss');

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
  ADD PRIMARY KEY (`kode_brg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
