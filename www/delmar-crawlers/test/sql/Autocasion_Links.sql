-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 04, 2011 at 02:22 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.5-1ubuntu6ppa1~lucid

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
-- Table structure for table `Autocasion_Links`
--

CREATE TABLE IF NOT EXISTS `Autocasion_Links_All` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) NOT NULL,
  `AD_Section` int(11) NOT NULL,
  `AD_Link` text NOT NULL,
  `link_status` int(11) NOT NULL,
  `TargetPage` int(11) DEFAULT NULL,
  `TargetLink` text,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=630 ;
