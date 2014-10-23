-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2014 at 02:23 AM
-- Server version: 5.6.21
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `PGT_D_14_TEST`
--

-- --------------------------------------------------------

--
-- Table structure for table `forgotten_attempts`
--

CREATE TABLE IF NOT EXISTS `forgotten_attempts` (
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(40) NOT NULL,
  `valid` int(11) NOT NULL,
  `answer` tinyint(1) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `device_type` varchar(40) NOT NULL,
  `IP_addr` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
`attempt_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `IP_addr` varchar(40) NOT NULL,
  `device_type` varchar(40) NOT NULL,
  `comment` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `passwords`
--

CREATE TABLE IF NOT EXISTS `passwords` (
`pass_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(100) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `pass_id` int(11) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `secret_question` varchar(100) NOT NULL,
  `date_registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `pass_id`, `first_name`, `last_name`, `email`, `secret_question`, `date_registered`, `role_id`) VALUES
(24, 'Ebay.Bid', 1, 'Ebay', 'Bid', 'Ebay.Bid@gmail.com', 'test', '2014-10-23 01:25:20', 1),
(23, 'Demo.Success', 1, 'Demo', 'Success', 'Demo.Success@gmail.com', 'test', '2014-10-23 01:24:31', 1),
(22, 'Candy.Crush', 1, 'Candy', 'Crush', 'Candy.Crush@gmail.com', 'test', '2014-10-23 01:24:10', 1),
(21, 'Ben.Smith', 1, 'Ben', 'Smith', 'Ben.Smith@gmail.com', 'test', '2014-10-23 01:23:22', 1),
(20, 'Apple.Tree', 1, 'Apple', 'Tree', 'Apple.Tree@gmail.com', 'test', '2014-10-23 01:22:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
`role_id` int(11) NOT NULL,
  `role_desc` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
 ADD PRIMARY KEY (`attempt_id`);

--
-- Indexes for table `passwords`
--
ALTER TABLE `passwords`
 ADD PRIMARY KEY (`pass_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
 ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
MODIFY `attempt_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `passwords`
--
ALTER TABLE `passwords`
MODIFY `pass_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
