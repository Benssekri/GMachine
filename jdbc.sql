-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2022 at 10:03 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jdbc`
--

-- --------------------------------------------------------

--
-- Table structure for table `machine`
--

CREATE TABLE `machine` (
  `Id` int(11) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `marque` varchar(80) NOT NULL,
  `dateAchat` date NOT NULL,
  `prix` double NOT NULL,
  `idSalle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `machine`
--

INSERT INTO `machine` (`Id`, `reference`, `marque`, `dateAchat`, `prix`, `idSalle`) VALUES
(2, 'AA1298', 'dell', '2022-01-25', 12900, 2),
(3, 'JNU4', 'hp', '2022-01-10', 1990, 4),
(5, 'AM0116', 'lenovo', '2022-01-07', 2900, 2),
(10, 'SU15', 'acer', '2022-01-14', 9233, 11),
(11, 'VR56', 'micromax', '2022-01-13', 6940, 11),
(12, 'QW875', 'Dell', '2022-01-04', 8000, 9),
(13, 'AK8721', 'HP', '2022-01-19', 10900, 8),
(14, 'OPH654', 'Lenovo', '2022-01-22', 12330, 10),
(15, 'TO87', 'Acer', '2022-01-20', 12876, 10),
(16, 'DD764', 'apple', '2022-01-17', 12000, 4),
(17, 'AA98', 'Dell', '2022-01-15', 12345, 10),
(18, 'GH54', 'HP', '2022-01-25', 3423, 11),
(19, 'QQ12', 'Lenovo', '2022-01-23', 9766, 11),
(22, 'AM11', 'dell', '2022-01-19', 4333, 9);

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE `salle` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `Type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`id`, `code`, `Type`) VALUES
(2, 'B1', 'Buvette'),
(4, 'CC2', 'centre carriereess'),
(8, 'Bibl1', 'Bibliotheque'),
(9, 'AA1', 'Tp'),
(10, 'BC2', 'Travaux Pratique'),
(11, 'D23', 'Salle De Lecture');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `username`, `mail`, `password`, `Status`) VALUES
(1, 'Manal Ben', 'manalben@gmail.com', '1234', 1),
(13, 'User2', 'use@gmail.com', '1234', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fksalle` (`idSalle`);

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `machine`
--
ALTER TABLE `machine`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `machine`
--
ALTER TABLE `machine`
  ADD CONSTRAINT `fksalle` FOREIGN KEY (`idSalle`) REFERENCES `salle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
