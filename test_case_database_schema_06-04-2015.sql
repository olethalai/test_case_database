-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 06, 2015 at 09:22 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `blinkbox_iOS_test_suite`
--

-- --------------------------------------------------------

--
-- Table structure for table `feature`
--

CREATE TABLE IF NOT EXISTS `feature` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feature`
--

INSERT INTO `feature` (`id`, `name`, `description`) VALUES
(1, 'Test Feature', 'A feature to test form submission.'),
(2, '', ''),
(3, '', ''),
(4, '', ''),
(5, '', ''),
(6, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `scenario`
--

CREATE TABLE IF NOT EXISTS `scenario` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `feature_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scenario`
--

INSERT INTO `scenario` (`id`, `title`, `description`, `feature_id`) VALUES
(1, 'Testing', '', 1),
(2, 'Testing', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `scenario_instance`
--

CREATE TABLE IF NOT EXISTS `scenario_instance` (
`id` int(11) NOT NULL,
  `test_run_id` int(11) NOT NULL,
  `scenario_id` int(11) NOT NULL,
  `outcome` enum('passed','failed') DEFAULT NULL,
  `is_blocked` tinyint(4) NOT NULL DEFAULT '0',
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `step`
--

CREATE TABLE IF NOT EXISTS `step` (
`id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `scenario_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `step`
--

INSERT INTO `step` (`id`, `description`, `scenario_id`) VALUES
(1, 'When you touch me like this\r', 2),
(2, 'And you hold me like that', 2);

-- --------------------------------------------------------

--
-- Table structure for table `test_run`
--

CREATE TABLE IF NOT EXISTS `test_run` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feature`
--
ALTER TABLE `feature`
 ADD PRIMARY KEY (`id`), ADD KEY `name` (`name`);

--
-- Indexes for table `scenario`
--
ALTER TABLE `scenario`
 ADD PRIMARY KEY (`id`), ADD KEY `feature_id` (`feature_id`), ADD KEY `title` (`title`);

--
-- Indexes for table `scenario_instance`
--
ALTER TABLE `scenario_instance`
 ADD PRIMARY KEY (`id`), ADD KEY `test_run_id` (`test_run_id`,`scenario_id`), ADD KEY `scenario_id` (`scenario_id`);

--
-- Indexes for table `step`
--
ALTER TABLE `step`
 ADD PRIMARY KEY (`id`), ADD KEY `scenario_id` (`scenario_id`), ADD KEY `description` (`description`);

--
-- Indexes for table `test_run`
--
ALTER TABLE `test_run`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feature`
--
ALTER TABLE `feature`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `scenario`
--
ALTER TABLE `scenario`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `scenario_instance`
--
ALTER TABLE `scenario_instance`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `step`
--
ALTER TABLE `step`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `test_run`
--
ALTER TABLE `test_run`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `scenario`
--
ALTER TABLE `scenario`
ADD CONSTRAINT `scenario_ibfk_1` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`id`);

--
-- Constraints for table `scenario_instance`
--
ALTER TABLE `scenario_instance`
ADD CONSTRAINT `scenario_instance_ibfk_1` FOREIGN KEY (`test_run_id`) REFERENCES `test_run` (`id`),
ADD CONSTRAINT `scenario_instance_ibfk_2` FOREIGN KEY (`scenario_id`) REFERENCES `scenario` (`id`);

--
-- Constraints for table `step`
--
ALTER TABLE `step`
ADD CONSTRAINT `step_ibfk_1` FOREIGN KEY (`scenario_id`) REFERENCES `scenario` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
