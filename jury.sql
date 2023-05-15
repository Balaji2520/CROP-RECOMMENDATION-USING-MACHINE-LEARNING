-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2021 at 07:05 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jury`
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
('1234', 'Super', '2020-07-12', '13:19:17'),
('1001', 'Awesome application..it helps me a lot...Thank you team', '2020-07-17', '20:45:56'),
('1234', 'Awesome application..it helps me a lot...Thank you team', '2020-07-19', '21:32:59'),
('1234', 'Awesome application..it helps me a lot...Thank you team.................Amazing.This is my feedback..thanku', '2020-07-19', '21:44:52'),
('1234', 'ok its good', '2020-07-20', '10:03:44'),
('1234', 'thank you guys', '2020-07-20', '10:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `tag` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Not Match'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `name`, `image`, `area`, `tag`, `description`, `address`, `status`) VALUES
(N170898, 'Balaji', '134.jpg', 'GUNTUR', '8074150472', 'Dark eyes, 5'9 feet height', 'Guntur', 'Match'),
(137, 'Unknown', '137.jpg', 'Vizag', '9876543110', 'found umbrella with her, mole on right hand', 'Maddilapalem', 'Not Match'),
(139, 'sashank', '139.jpg', 'West Godavari', '9876543110', 'Habit of keeping everything in mouth, talktive', 'Penugonda', 'Match');

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
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `name`, `email`, `phno`, `area`, `password`) VALUES
(898, 'Balaji', 'balajinaik2520@gmail.com', '8074150472', 'GUNTUR', 'N170898'),
(1234, 'Jyothi', 'n170536@rguktn.ac.in', '9550382156', 'SKLM', '1234'),
(1924, 'Mounika', 'n171020@rguktn.ac.in', '9550382156', 'Vizag', '1924'),
(1999, 'Lakshmi', 'n170216@rguktn.ac.in', '9550382156', 'guntur', '1999'),
(2000, 'Hema Keerthana', '17131a05d5@gvpce.ac.in', '7013323386', 'Vizag', '2000'),
(5678, 'Nani', 'padalarampraveenreddy.si20@iacademia.in', '8888888', 'ggggg', '5678'),
(9090, 'Sharath', '17131a05f3@gvpce.ac.in', '7013323386', 'NAD', '9090'),
(9999, 'Nehal Ahmad', 'rampraveenreddy04@gmail.com', '9550382156', 'Vizag', '9999');

-- --------------------------------------------------------

--
-- Table structure for table `visitedplaces`
--

CREATE TABLE `visitedplaces` (
  `uid` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `area` varchar(200) NOT NULL,
  `places` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitedplaces`
--

INSERT INTO `visitedplaces` (`uid`, `age`, `area`, `places`) VALUES
(1001, 23, 'visakhapatnam', 'hillstation,visakhapatnam, Simhachalam Rd, Simhachalam, Visakhapatnam'),
(1001, 23, 'visakhapatnam', 'hillstation,visakhapatnam,Bheemunipatnam'),
(1001, 23, 'visakhapatnam', 'hillstation,visakhapatnam,near Bheemunipatnam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `person`
--
ALTER TABLE `person`
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
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17132;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
