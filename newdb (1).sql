-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 08:18 PM
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
-- Database: `newdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FID` int(11) NOT NULL,
  `FeedbackID` varchar(11) NOT NULL,
  `FeedBack` varchar(400) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FID`, `FeedbackID`, `FeedBack`, `CustomerID`, `ItemID`) VALUES
(2, 'f32', 'good seller', 3, 34),
(6, 'F34', 'Nice', 23, 0);

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `FID` int(11) NOT NULL,
  `CustomerID` varchar(150) NOT NULL,
  `ItemID` varchar(150) NOT NULL,
  `FeedbackID` varchar(150) NOT NULL,
  `FeedBack` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`FID`, `CustomerID`, `ItemID`, `FeedbackID`, `FeedBack`) VALUES
(2, 'c1', 's34', 'f12', 'good product Item'),
(3, 'c1', 's34', 'f12', 'good product Item'),
(4, 'c1', 's34', 'f12', 'good product Item'),
(5, 'c1', 's34', 'f12', 'good product Item'),
(6, 'c1', 's34', 'f12', 'good product Item'),
(7, '34', '34', '34', 'dfgdfg'),
(8, 'c54', 's1', 'f3', 'good item');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `itemID` int(11) NOT NULL,
  `itemCode` varchar(11) NOT NULL,
  `itemName` varchar(30) NOT NULL,
  `itemPrice` double NOT NULL,
  `itemDesc` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemID`, `itemCode`, `itemName`, `itemPrice`, `itemDesc`) VALUES
(21, 's1', 'cleaner', 5000, 'brand new condition'),
(34, 's34', 'computer cleaner', 4000, 'good item'),
(35, 's30', 'office room cleaner', 5000, 'try it and see the results'),
(36, 's45', 'sound card cleaner', 4000, 'USA '),
(37, 's7', 'Iphone', 50000, 'iphone 7+'),
(38, 's54', 'MAC', 9000000, 'good item'),
(39, 's56', 'headphone', 45600, 'good product');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FID`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`FID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `FID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
