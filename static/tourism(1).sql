-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2019 at 08:41 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourism`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `userid` varchar(10) NOT NULL,
  `feedback` varchar(2000) NOT NULL,
  `date` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`userid`, `feedback`, `date`, `time`) VALUES
('1001', 'good', '23-01-2019', '1:05:24'),
('1001', 'good', '', ''),
('1001', 'good', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `tag` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `image`, `area`, `tag`, `description`, `address`) VALUES
(1, 'pravash', '', 'rushikonda', 'taggggg', 'visakhapatnam', 'vijawada'),
(2, 'pravash', '', 'rushikonda', 'taggggg', 'visakhapatnam', 'vijawada'),
(3, 'pravash', '', 'rushikonda', 'taggggg', 'visakhapatnam', 'vijawada'),
(4, 'pravash', '', 'rushikonda', 'taggggg', 'visakhapatnam', 'vijawada'),
(5, 'pravash', '', 'rushikonda', 'taggggg', 'mumbai is great', 'vijawada'),
(6, 'pravash', '', 'rushikonda', 'taggggg', 'mumbai is great', 'vijawada'),
(7, 'pravash', '', 'rushikonda', 'taggggg', 'mumbai is great', 'vijawada'),
(8, 'pravash', '', 'rushikonda', 'taggggg', 'mumbai is great', 'vijawada'),
(9, 'pravash', '', 'rushikonda', 'taggggg', 'mumbai is great', 'vijawada'),
(10, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(11, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(12, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(13, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(14, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(15, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(16, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(17, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(18, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(19, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(20, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(21, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(22, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(23, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(24, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(25, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(26, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(27, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(28, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(29, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(30, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(31, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(32, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(33, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(34, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(35, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(36, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(37, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(38, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(39, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(40, 'pravash', '', 'donparthy', 'taggggg', 'aaaa', 'vijawada'),
(41, 'sujatha', '', 'donparthy', 'taggggg', 'aaaa', 'Diamond park'),
(42, 'sujatha', '42.jpg', 'donparthy', 'taggggg', 'aaaa', 'Diamond park'),
(43, 'syam', '43.jpg', 'gannavaram', 'dongabazar', 'nice place', 'bza');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phno` varchar(20) NOT NULL,
  `area` varchar(50) NOT NULL,
  `beach` text NOT NULL,
  `hill` text NOT NULL,
  `landscape` text NOT NULL,
  `museum` text NOT NULL,
  `temple` text NOT NULL,
  `fort` text NOT NULL,
  `adven` text NOT NULL,
  `water` text NOT NULL,
  `waterfalls` text NOT NULL,
  `aviation` text NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `name`, `email`, `phno`, `area`, `beach`, `hill`, `landscape`, `museum`, `temple`, `fort`, `adven`, `water`, `waterfalls`, `aviation`, `password`) VALUES
(1001, 'abcd', 'abcd@gmail.com', '9012345678', 'donparthy', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'no', 'yes', 'no', '12345'),
(1002, 'a@gmail.com', 'shaikferoz012@gmail.com', '1234545', '', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
