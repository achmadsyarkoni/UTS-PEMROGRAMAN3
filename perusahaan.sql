-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2020 at 02:07 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perusahaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DPT_kode` int(3) NOT NULL,
  `nama_department` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DPT_kode`, `nama_department`) VALUES
(1, 'HRD'),
(2, 'Produksi'),
(3, 'Marketing');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `Jabatan_kode` int(3) NOT NULL,
  `nama_jabatan` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`Jabatan_kode`, `nama_jabatan`) VALUES
(1, 'Manager'),
(2, 'SPv'),
(3, 'Leader'),
(4, 'staff'),
(5, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_cuti`
--

CREATE TABLE `jenis_cuti` (
  `jeniscuti_kode` int(2) NOT NULL,
  `nama_cuti` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_cuti`
--

INSERT INTO `jenis_cuti` (`jeniscuti_kode`, `nama_cuti`) VALUES
(1, 'Tahunan'),
(2, 'Khusus');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `NIK` int(8) NOT NULL,
  `nama_karyawan` varchar(128) DEFAULT NULL,
  `tempat_lahir` varchar(128) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` int(13) DEFAULT NULL,
  `status_karyawan` varchar(32) DEFAULT NULL,
  `DPT_Kode` int(3) DEFAULT NULL,
  `Jabatan_Kode` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`NIK`, `nama_karyawan`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `no_hp`, `status_karyawan`, `DPT_Kode`, `Jabatan_Kode`) VALUES
(19020001, 'Achmad Syarkoni', 'Lahat', '1973-12-23', 'Perum Talaga Bestari Blok L6 NO 42 Wanakerta Kec. Sindang Jaya Kab. Tangerang', 2147483647, 'Aktif', 2, 3),
(19020002, 'Bagus Panji', 'Tangerang', '1980-01-21', 'Perum Talaga Bestari Blok L4 NO 20 Wanakerta Kec. Sindang Jaya Kab. Tangerang', 2147483647, 'Aktif', 3, 2),
(19020003, 'Cynthia Ariestiani', 'Jakarta', '1978-08-06', 'Perum Talaga Bestari Blok B6 NO 29 Wanakerta Kec. Sindang Jaya Kab. Tangerang', 2147483647, 'Aktif', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_cuti`
--

CREATE TABLE `transaksi_cuti` (
  `id_cuti` int(4) NOT NULL,
  `NIK` int(8) DEFAULT NULL,
  `nama_karyawan` varchar(128) DEFAULT NULL,
  `nama_department` varchar(128) DEFAULT NULL,
  `nama_jabatan` varchar(128) DEFAULT NULL,
  `mulai_cuti` date DEFAULT NULL,
  `akhir_cuti` date DEFAULT NULL,
  `nama_cuti` varchar(128) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DPT_kode`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`Jabatan_kode`);

--
-- Indexes for table `jenis_cuti`
--
ALTER TABLE `jenis_cuti`
  ADD PRIMARY KEY (`jeniscuti_kode`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`NIK`),
  ADD KEY `DPT_Kode` (`DPT_Kode`),
  ADD KEY `Jabatan_Kode` (`Jabatan_Kode`);

--
-- Indexes for table `transaksi_cuti`
--
ALTER TABLE `transaksi_cuti`
  ADD PRIMARY KEY (`id_cuti`),
  ADD KEY `NIK` (`NIK`),
  ADD KEY `Jabatan_Kode` (`nama_jabatan`),
  ADD KEY `jeniscuti_kode` (`nama_cuti`),
  ADD KEY `DPT_Kode` (`nama_department`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaksi_cuti`
--
ALTER TABLE `transaksi_cuti`
  MODIFY `id_cuti` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`DPT_Kode`) REFERENCES `department` (`DPT_kode`),
  ADD CONSTRAINT `karyawan_ibfk_2` FOREIGN KEY (`Jabatan_Kode`) REFERENCES `jabatan` (`Jabatan_kode`);

--
-- Constraints for table `transaksi_cuti`
--
ALTER TABLE `transaksi_cuti`
  ADD CONSTRAINT `transaksi_cuti_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `karyawan` (`NIK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
