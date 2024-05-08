-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2024 at 02:53 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `apoteker`
--

CREATE TABLE `apoteker` (
  `kode_apoteker` char(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telp` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apoteker`
--

INSERT INTO `apoteker` (`kode_apoteker`, `nama`, `no_telp`) VALUES
('KA001', 'Vivin', '085844778383'),
('KA002', 'Asima', '087867675533'),
('KA003', 'Ikrom', '081383835590');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `kode_obat` char(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`kode_obat`, `nama`, `jenis`, `harga`) VALUES
('KO001', 'Bisolvon Extra', 'Obat Batuk', 96000),
('KO002', 'Iremax', 'Obat Pusing', 15000),
('KO003', 'Mylanta', 'Obat maag', 51000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kode_pelanggan` char(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `usia` char(3) NOT NULL,
  `no_telp` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`kode_pelanggan`, `nama`, `alamat`, `usia`, `no_telp`) VALUES
('KP001', 'Fitroh', 'Kota Tangerang', '21', '081383835590'),
('KP002', 'Vivin', 'Kota Jakarta', '20', '087867675533'),
('KP003', 'Asima', 'Bekasi', '21', '085844778383');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `kode_transaksi` char(5) NOT NULL,
  `kode_pelanggan` char(5) NOT NULL,
  `kode_apoteker` char(5) NOT NULL,
  `kode_obat` char(5) NOT NULL,
  `tanggal_tr` date NOT NULL,
  `Qty` int(2) NOT NULL,
  `Harga` double NOT NULL,
  `Subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`kode_transaksi`, `kode_pelanggan`, `kode_apoteker`, `kode_obat`, `tanggal_tr`, `Qty`, `Harga`, `Subtotal`) VALUES
('KT001', 'KP001', 'KA003', 'KO002', '2024-05-06', 2, 15000, 30000),
('KT002', 'KP003', 'KA001', 'KO001', '2024-05-07', 1, 96000, 96000),
('KT003', 'KP001', 'KA001', 'KO003', '2024-05-08', 3, 51000, 153000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apoteker`
--
ALTER TABLE `apoteker`
  ADD PRIMARY KEY (`kode_apoteker`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`kode_obat`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `kode_apoteker` (`kode_apoteker`),
  ADD KEY `kode_obat` (`kode_obat`),
  ADD KEY `kode_pelanggan` (`kode_pelanggan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kode_obat`) REFERENCES `obat` (`kode_obat`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`kode_apoteker`) REFERENCES `apoteker` (`kode_apoteker`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`kode_obat`) REFERENCES `obat` (`kode_obat`),
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`kode_pelanggan`) REFERENCES `pelanggan` (`kode_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
