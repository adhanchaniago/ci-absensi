-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 26, 2010 at 06:28 AM
-- Server version: 5.1.33
-- PHP Version: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `absensi2010`
--
CREATE DATABASE `absensi2010` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `absensi2010`;

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE IF NOT EXISTS `absen` (
  `id_absen` int(11) NOT NULL AUTO_INCREMENT,
  `nis` int(4) NOT NULL,
  `id_semester` int(1) NOT NULL,
  `tanggal` date NOT NULL,
  `absen` varchar(1) NOT NULL,
  PRIMARY KEY (`id_absen`),
  KEY `id_semester` (`id_semester`),
  KEY `nis` (`nis`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `absen`
--

INSERT INTO `absen` (`id_absen`, `nis`, `id_semester`, `tanggal`, `absen`) VALUES
(1, 1007, 1, '2010-01-01', 'T'),
(2, 1008, 1, '2010-01-02', 'S'),
(3, 1004, 1, '2010-01-04', 'S'),
(4, 1018, 1, '2010-01-05', 'S'),
(5, 1001, 1, '2010-01-04', 'S'),
(6, 1001, 1, '2001-01-06', 'S'),
(7, 1006, 1, '2010-01-07', 'A'),
(8, 1001, 1, '2010-01-08', 'S'),
(9, 1003, 1, '2010-01-09', 'S'),
(10, 1001, 1, '2010-01-11', 'S'),
(11, 1002, 1, '2010-01-12', 'I'),
(12, 1003, 1, '2010-01-24', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE IF NOT EXISTS `kelas` (
  `id_kelas` int(2) NOT NULL,
  `kelas` varchar(32) NOT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`) VALUES
(1, 'X - 1'),
(2, 'X - 2'),
(3, 'X - 3'),
(4, 'X - 4'),
(5, 'X - 5'),
(6, 'X - 6'),
(7, 'XI IPA - 1'),
(8, 'XI IPA - 2'),
(9, 'XI IPA - 3'),
(10, 'XI IPS - 1'),
(11, 'XI IPS - 2'),
(12, 'XI IPS - 3'),
(13, 'XII IPA - 1'),
(14, 'XII IPA - 2'),
(15, 'XII IPA - 3'),
(16, 'XII IPS - 1'),
(17, 'XII IPS - 2'),
(18, 'XII IPS - 3');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE IF NOT EXISTS `semester` (
  `id_semester` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id_semester`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id_semester`, `status`) VALUES
(1, 1),
(2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE IF NOT EXISTS `siswa` (
  `nis` int(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_kelas` int(2) NOT NULL,
  PRIMARY KEY (`nis`),
  KEY `id_kelas` (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `id_kelas`) VALUES
(1001, 'ADI DANUDIRJA', 1),
(1002, 'BAYU HIDAYATULLAH', 2),
(1003, 'CANDRA WIJAYA', 3),
(1004, 'DANI AHMAD', 4),
(1005, 'EKA WIBISONO', 5),
(1006, 'FERI ARDYANSAH', 6),
(1007, 'ABI ABIMANYU', 7),
(1008, 'BETA BETARIA', 8),
(1009, 'CINDYTA SARI', 9),
(1010, 'DEKI DARMANTO', 10),
(1011, 'ENDAH SURYATI', 11),
(1012, 'FANI FADILLAH', 12),
(1013, 'AGUS GURNIWA', 13),
(1014, 'BAGUS ADITYA', 14),
(1015, 'CIKA AMELIA', 15),
(1016, 'DIKY WAHYUDI', 16),
(1017, 'EGA NOVITA', 17),
(1018, 'FANDI SAPUTRA', 18);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(1) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`) VALUES
(1, 'admin', 'admin');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absen`
--
ALTER TABLE `absen`
  ADD CONSTRAINT `absen_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `absen_ibfk_2` FOREIGN KEY (`id_semester`) REFERENCES `semester` (`id_semester`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;
