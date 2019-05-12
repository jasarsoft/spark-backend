-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 17, 2018 at 10:43 
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_example`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id_city` int(11) NOT NULL,
  `city_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id_city`, `city_name`) VALUES
(1, 'Mostar'),
(2, 'Sarajevo'),
(3, 'Banja Luka'),
(4, 'Stolac'),
(5, 'Zagreb'),
(6, 'Split'),
(7, 'Dubrovnik'),
(8, 'Beograd'),
(9, 'Ljubljana'),
(10, 'London');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id_department` int(11) NOT NULL,
  `department_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id_department`, `department_name`) VALUES
(1, 'Prodaja'),
(2, 'Support'),
(3, 'Frontend'),
(4, 'Backend'),
(5, 'android');

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `id_worker` int(11) NOT NULL,
  `worker_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `worker_lastname` varchar(45) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `salary` int(11) NOT NULL,
  `worker_since_datetime` datetime NOT NULL,
  `id_department` int(11) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`id_worker`, `worker_name`, `worker_lastname`, `salary`, `worker_since_datetime`, `id_department`, `id_city`) VALUES
(1, '', '', 0, '0000-00-00 00:00:00', NULL, NULL),
(2, 'Mario', '', 1256, '2014-04-18 00:00:00', 4, 5),
(3, 'Dea', '', 780, '2017-01-08 00:00:00', 3, 6),
(4, 'Lara', '', 1450, '2014-10-11 00:00:00', 1, 5),
(5, 'Pero', 'Perić', 650, '2016-02-15 00:00:00', 1, 9),
(6, 'Ivo', 'Ivo', 2500, '2014-03-03 00:00:00', 3, 1),
(7, 'Adam', '', 750, '2014-08-22 00:19:00', 2, 4),
(8, 'John', '', 3200, '2014-04-03 00:00:00', 1, 2),
(9, 'Sabina', '', 1450, '2015-01-01 00:00:00', 3, 7),
(10, 'Ela', 'Mat', 2800, '2016-04-19 00:00:00', NULL, 8),
(11, 'Perica', '', 7878, '2014-07-18 00:00:00', 1, 1),
(12, 'Mario', '', 1256, '2014-04-18 00:00:00', 4, 5),
(13, 'Dea', '', 780, '2017-01-08 00:00:00', 3, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id_city`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id_department`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id_worker`),
  ADD KEY `fk_workers_cities_idx` (`id_city`),
  ADD KEY `fk_workers_departments_idx` (`id_department`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id_department` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `workers`
--
ALTER TABLE `workers`
  MODIFY `id_worker` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `fk_workers_cities` FOREIGN KEY (`id_city`) REFERENCES `cities` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_workers_departments` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id_department`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
