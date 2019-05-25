-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 19, 2018 at 05:51 
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ex`
--

-- --------------------------------------------------------

--
-- Table structure for table `grad`
--

CREATE TABLE `grad` (
  `id_grad` int(11) NOT NULL,
  `naziv_grada` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grad`
--

INSERT INTO `grad` (`id_grad`, `naziv_grada`) VALUES
(1, 'Mostar'),
(2, 'Sarajevo'),
(3, 'Split'),
(4, 'Zagreb');

-- --------------------------------------------------------

--
-- Table structure for table `ispit`
--

CREATE TABLE `ispit` (
  `id_ispit` int(11) NOT NULL,
  `id_student` int(11) NOT NULL,
  `id_predmet` int(11) NOT NULL,
  `datum_ispita` datetime NOT NULL,
  `ocjena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ispit`
--

INSERT INTO `ispit` (`id_ispit`, `id_student`, `id_predmet`, `datum_ispita`, `ocjena`) VALUES
(1, 1, 1, '2015-12-16 12:00:00', 3),
(2, 1, 2, '2015-12-11 14:00:00', 1),
(3, 2, 2, '2015-12-13 13:00:00', 5),
(4, 2, 5, '2015-12-15 13:00:00', 2),
(5, 3, 2, '2015-12-01 13:00:00', 3),
(6, 4, 4, '2015-12-10 15:00:00', 5),
(7, 6, 4, '2015-12-15 13:00:00', 4),
(8, 1, 5, '2015-12-02 11:00:00', 5),
(9, 4, 5, '2015-12-03 11:00:00', 4),
(10, 6, 2, '2015-12-01 14:00:00', 4),
(11, 5, 4, '2015-12-02 14:00:00', 1),
(12, 7, 2, '2015-12-09 14:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `predmet`
--

CREATE TABLE `predmet` (
  `id_predmet` int(11) NOT NULL,
  `naziv_predmeta` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `predmet`
--

INSERT INTO `predmet` (`id_predmet`, `naziv_predmeta`) VALUES
(1, 'Fizika'),
(2, 'Kemija'),
(3, 'Biologija'),
(4, 'Matematika'),
(5, 'Povijest'),
(6, 'Likovno');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id_student` int(11) NOT NULL,
  `ime` varchar(128) NOT NULL,
  `prezime` varchar(128) NOT NULL,
  `id_grad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id_student`, `ime`, `prezime`, `id_grad`) VALUES
(1, 'Petar', 'Peric', 1),
(2, 'Marko', 'Maric', 1),
(3, 'Ivana', 'Ivic', 1),
(4, 'Maja', 'Majic', 2),
(5, 'Maja', 'Majic', 3),
(6, 'Vedrana', 'Ilic', 2),
(7, 'Marina', 'Peric', 4),
(8, 'Kristina', 'Zovkic', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `grad`
--
ALTER TABLE `grad`
  ADD PRIMARY KEY (`id_grad`);

--
-- Indexes for table `ispit`
--
ALTER TABLE `ispit`
  ADD PRIMARY KEY (`id_ispit`);

--
-- Indexes for table `predmet`
--
ALTER TABLE `predmet`
  ADD PRIMARY KEY (`id_predmet`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id_student`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `grad`
--
ALTER TABLE `grad`
  MODIFY `id_grad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ispit`
--
ALTER TABLE `ispit`
  MODIFY `id_ispit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `predmet`
--
ALTER TABLE `predmet`
  MODIFY `id_predmet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id_student` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
