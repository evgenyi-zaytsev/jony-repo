-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 10, 2011 at 03:13 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `zvz_spain`
--

-- --------------------------------------------------------

--
-- Table structure for table `Autocasion_Images`
--

CREATE TABLE IF NOT EXISTS `Autocasion_Images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Key` int(11) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `Ad_Site` int(11) DEFAULT NULL,
  `Ad_Section` int(11) DEFAULT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
