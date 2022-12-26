-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2022 at 07:43 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama` text NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` text NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `harga`, `stok`, `gambar`, `id_kategori`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'Yellow Sweater', 75000, 7, 'product-1.jpg', 2, 1, '2022-12-17 06:35:54', 0, '2022-12-17 06:35:54'),
(2, 'Dusty Pink Crop ', 100000, 11, 'product-2.jpg', 2, 1, '2022-12-17 06:35:55', 0, '2022-12-17 06:35:55'),
(3, 'Green Jacket', 250000, 4, 'product-3.jpg', 1, 1, '2022-12-17 06:35:55', 0, '2022-12-17 06:35:55'),
(4, 'Grey Syal', 50000, 20, 'product-4.jpg', 3, 1, '2022-12-17 06:35:55', 0, '2022-12-17 06:35:55'),
(5, 'Yellow Beg', 150000, 39, 'product-5.jpg', 3, 1, '2022-12-17 06:35:55', 0, '2022-12-17 06:35:55');

-- --------------------------------------------------------

--
-- Table structure for table `diskon`
--

CREATE TABLE `diskon` (
  `id` int(11) NOT NULL,
  `kode_voucher` varchar(10) NOT NULL,
  `tanggal_mulai_berlaku` date NOT NULL,
  `tanggal_akhir_berlaku` date NOT NULL,
  `besar_diskon` int(2) NOT NULL,
  `aktif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diskon`
--

INSERT INTO `diskon` (`id`, `kode_voucher`, `tanggal_mulai_berlaku`, `tanggal_akhir_berlaku`, `besar_diskon`, `aktif`) VALUES
(1, 'v1', '2022-12-01', '2022-12-29', 10, 10),
(2, 'v2', '2022-12-01', '2022-12-31', 20, 10);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'Men', 1, '2022-12-17 06:34:09', NULL, NULL),
(2, 'Women', 1, '2022-12-17 06:34:09', NULL, NULL),
(3, 'Kid', 1, '2022-12-17 06:34:43', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `komentar` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `id_barang`, `id_user`, `komentar`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(2, 5, 1, 'nice', 1, '2022-12-17 00:27:17', NULL, NULL),
(3, 5, 1, 'bagus', 1, '2022-12-17 00:33:16', NULL, NULL),
(4, 5, 1, 'bagus', 1, '2022-12-17 01:01:28', NULL, NULL),
(5, 1, 1, 'Bagus sekali saya suka', 1, '2022-12-23 01:19:46', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `ongkir` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_barang`, `id_pembeli`, `jumlah`, `total_harga`, `alamat`, `ongkir`, `status`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 5, 1, 1, 180000, 'kota', 30000, 0, 1, '2022-12-17 00:25:12', NULL, NULL),
(2, 1, 1, 4, 335000, 'kota', 35000, 0, 1, '2022-12-17 00:32:58', NULL, NULL),
(3, 2, 1, 2, 220000, 'kota', 20000, 0, 1, '2022-12-17 00:47:48', NULL, NULL),
(4, 1, 1, 1, 97000, 'kota', 22000, 0, 1, '2022-12-17 02:49:37', NULL, NULL),
(5, 2, 1, 1, 0, 'kota', 19000, 0, 1, '2022-12-17 03:08:09', NULL, NULL),
(6, 1, 1, 1, 0, 'kota', 15000, 0, 1, '2022-12-20 08:55:30', NULL, NULL),
(7, 1, 1, 1, 82400, 'Pagersari RT03 RW01 Patean', 28000, 0, 1, '2022-12-21 21:57:51', NULL, NULL),
(8, 1, 1, 1, 84000, 'Pagersari RT03 RW01 Patean', 30000, 0, 1, '2022-12-21 22:09:03', NULL, NULL),
(9, 2, 1, 1, 117000, 'kota', 30000, 0, 1, '2022-12-22 20:09:51', NULL, NULL),
(10, 3, 1, 1, 217600, 'Pagersari RT03 RW01 Patean', 22000, 0, 1, '2022-12-23 01:14:46', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `salt` text NOT NULL,
  `avatar` text NOT NULL,
  `role` int(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `salt`, `avatar`, `role`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'firman', '6533cc46d8c4e438b3a3b61a02a1c5fd', '639d342daf35f2.71099100', '', 0, 0, '2022-12-16 21:14:53', NULL, NULL),
(2, 'peler', 'e2dfbf16bbe5d8eac87372dde8e608bc', '639d405616e9e1.27719843', '', 0, 0, '2022-12-16 22:06:46', NULL, NULL),
(3, 'AKU12345', '59568dd3b68c21810afb7bb0e5803b06', '639d7d52c96ed3.05014970', '', 0, 0, '2022-12-17 02:26:58', NULL, NULL),
(4, 'admin2', '46fd07005786a98b54a4a2f01cb99cee', '639d7d8c3fe8b1.44446153', '', 0, 0, '2022-12-17 02:27:56', NULL, NULL),
(5, 'Firman Asdiansyah', 'adeb62d5503c01ab308908dd9aacfd04', '63a5293e2823f1.58464085', '', 0, 0, '2022-12-22 22:06:22', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `diskon`
--
ALTER TABLE `diskon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_pembeli` (`id_pembeli`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `diskon`
--
ALTER TABLE `diskon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pembeli`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
