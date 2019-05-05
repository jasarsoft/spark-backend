-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 29, 2018 at 09:40 
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_dodatna`
--

-- --------------------------------------------------------

--
-- Table structure for table `cinema`
--

CREATE TABLE `cinema` (
  `id_cinema` int(11) NOT NULL,
  `cinema_name` varchar(45) NOT NULL,
  `zip_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cinema`
--

INSERT INTO `cinema` (`id_cinema`, `cinema_name`, `zip_code`) VALUES
(1, 'Mepas Mall', 88000),
(2, 'Bingo Centar', 77000),
(3, 'Bingo City Centar', 75000);

-- --------------------------------------------------------

--
-- Table structure for table `cinema_hall`
--

CREATE TABLE `cinema_hall` (
  `id_hall` int(11) UNSIGNED NOT NULL,
  `seats_number` tinyint(3) UNSIGNED NOT NULL,
  `id_cinema` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cinema_hall`
--

INSERT INTO `cinema_hall` (`id_hall`, `seats_number`, `id_cinema`) VALUES
(1, 100, 1),
(2, 120, 2),
(3, 130, 3),
(4, 140, 3),
(5, 110, 2),
(6, 150, 1),
(7, 160, 1),
(8, 95, 2),
(9, 85, 2),
(10, 88, 3),
(11, 105, 3),
(12, 180, 1),
(13, 200, 1),
(14, 100, 2),
(15, 60, 2);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `id_movie` int(11) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `duration` tinyint(3) UNSIGNED NOT NULL COMMENT 'minutes'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`id_movie`, `name`, `duration`) VALUES
(1, 'Alien: Covenant', 122),
(2, 'Guardians of the Galaxy Vol. 2', 137),
(3, 'King Arthur: Legend of the Sword', 126),
(4, 'How to be a Latin Lover', 115),
(5, 'The Boss Baby', 98),
(6, 'Deep', 92),
(7, 'Fast & Furious 8', 136),
(8, 'The Fallen', 92),
(9, 'Pirates of the Caribbean: Salazars Revenge', 129);

-- --------------------------------------------------------

--
-- Table structure for table `projection`
--

CREATE TABLE `projection` (
  `id_projection` int(11) UNSIGNED NOT NULL,
  `id_cinema` int(11) UNSIGNED NOT NULL,
  `id_hall` int(11) UNSIGNED NOT NULL,
  `id_movie` int(11) UNSIGNED NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projection`
--

INSERT INTO `projection` (`id_projection`, `id_cinema`, `id_hall`, `id_movie`, `date`) VALUES
(1, 1, 5, 1, '2017-05-09'),
(2, 2, 4, 3, '2017-05-09'),
(3, 3, 1, 2, '2017-05-11'),
(4, 1, 2, 5, '2017-05-11'),
(5, 2, 3, 4, '2017-05-05'),
(6, 1, 13, 8, '2017-05-03'),
(7, 1, 12, 7, '2017-05-03'),
(8, 3, 8, 4, '2017-05-13'),
(9, 3, 6, 2, '2017-05-13'),
(10, 3, 6, 5, '2017-05-13'),
(11, 3, 7, 8, '2017-05-01'),
(12, 1, 7, 7, '2017-05-02'),
(13, 3, 10, 3, '2017-06-02'),
(14, 1, 12, 3, '2017-04-02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `lastname` varchar(45) CHARACTER SET utf8 NOT NULL,
  `mail` varchar(90) NOT NULL,
  `password` varchar(128) NOT NULL,
  `zip_code` mediumint(6) UNSIGNED NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `name`, `lastname`, `mail`, `password`, `zip_code`, `birthday`) VALUES
(1, 'Toni', 'Soldo', 'tonisoldo@gmail.com', '123456', 88000, '1993-04-20'),
(2, 'Marko', 'Markic', 'markomarkic@gmail.com', 'marka123', 88000, '1993-05-02'),
(3, 'Ivo', 'Ivic', 'ivoivic@gmail.com', 'ivo321', 75000, '1994-02-24'),
(4, 'Josip', 'Leko', 'leko91@gmail.com', 'lekoleko91', 77000, '1991-12-24'),
(5, 'Mario', 'Soldo', 'mariosoldo95@gmail.com', 'solabola321', 88000, '1995-09-21'),
(6, 'Dragan', 'Tomic', 'dragan_tomic97@gmail.com', 'tomic123dragan', 88000, '1997-03-24'),
(7, 'Marin', 'Ljubic', 'marin_lj@gmail.com', 'mara321mara', 75000, '1990-01-23'),
(8, 'Ilija', 'Milicevic', 'ilija_m92@gmail.com', 'ilija_321_', 71000, '1992-09-30'),
(9, 'Mirko', 'Kvesic', 'mirkokvesic@gmail.com', 'm!rk0m!rk0', 75000, '1993-08-14'),
(10, 'Josip', 'Peric', 'josip95@gmail.com', 'jopapajo3121', 77000, '1995-12-24'),
(11, 'Zdravko', 'Ivankovic', 'ivankovic_zdravko@gmail.com', 'zdravkodren', 75000, '1991-01-21'),
(12, 'Pero', 'Peric', 'peropero@gmail.com', 'roperope321', 72000, '1993-10-11');

-- --------------------------------------------------------

--
-- Table structure for table `user_projection`
--

CREATE TABLE `user_projection` (
  `id_user_projection` int(11) UNSIGNED NOT NULL,
  `id_projection` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_projection`
--

INSERT INTO `user_projection` (`id_user_projection`, `id_projection`, `id_user`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 7),
(4, 1, 3),
(5, 1, 11),
(6, 2, 3),
(7, 2, 4),
(8, 2, 5),
(9, 2, 6),
(10, 2, 7),
(11, 2, 8),
(12, 2, 9),
(13, 2, 10),
(14, 2, 11),
(15, 2, 12),
(16, 3, 9),
(17, 3, 7),
(18, 3, 1),
(19, 3, 5),
(20, 3, 2),
(21, 3, 10),
(22, 3, 11),
(23, 4, 12),
(24, 4, 8),
(25, 4, 9),
(26, 5, 4),
(27, 5, 1),
(28, 5, 3),
(29, 5, 2),
(30, 6, 11),
(31, 5, 8),
(32, 5, 7),
(33, 6, 4),
(34, 5, 4),
(35, 5, 5),
(36, 5, 6),
(37, 6, 8),
(38, 5, 10),
(39, 5, 11),
(40, 5, 12);

-- --------------------------------------------------------

--
-- Table structure for table `zip_code`
--

CREATE TABLE `zip_code` (
  `zip_code` mediumint(6) UNSIGNED NOT NULL,
  `town_name` varchar(45) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zip_code`
--

INSERT INTO `zip_code` (`zip_code`, `town_name`) VALUES
(71000, 'Sarajevo'),
(72000, 'Zenica'),
(75000, 'Tuzla'),
(77000, 'Bihać'),
(88000, 'Mostar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`id_cinema`);

--
-- Indexes for table `cinema_hall`
--
ALTER TABLE `cinema_hall`
  ADD PRIMARY KEY (`id_hall`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id_movie`);

--
-- Indexes for table `projection`
--
ALTER TABLE `projection`
  ADD PRIMARY KEY (`id_projection`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_projection`
--
ALTER TABLE `user_projection`
  ADD PRIMARY KEY (`id_user_projection`);

--
-- Indexes for table `zip_code`
--
ALTER TABLE `zip_code`
  ADD PRIMARY KEY (`zip_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cinema`
--
ALTER TABLE `cinema`
  MODIFY `id_cinema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cinema_hall`
--
ALTER TABLE `cinema_hall`
  MODIFY `id_hall` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `id_movie` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `projection`
--
ALTER TABLE `projection`
  MODIFY `id_projection` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user_projection`
--
ALTER TABLE `user_projection`
  MODIFY `id_user_projection` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
