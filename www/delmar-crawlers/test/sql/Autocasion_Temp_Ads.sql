-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 10, 2011 at 03:24 PM
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
-- Table structure for table `Autocasion_Temp_Ads`
--

CREATE TABLE IF NOT EXISTS `Autocasion_Temp_Ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) DEFAULT NULL,
  `AD_Section` int(11) DEFAULT NULL,
  `AD_KEY` varchar(256) DEFAULT NULL,
  `Ad_Link` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AD_Phone1` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AD_Phone2` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AD_ContactName1` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AD_ContactName2` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AD_ContactEmail` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AD_UpdateDate` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AD_Region` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AD_Area` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AD_City` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AD_Address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AD_Price` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AD_Notes` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_MoveInDate` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_Neighborhood` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_meter` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_PropertyTypeIndex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_Rooms` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_Floor` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_FloorTotal` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_Furniture` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_FurnitureIndex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_FlatMatesCount` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_RequiredGenderIndex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_BarsIndex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_LiftIndex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_AirConIndex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_storeroom` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_ParkingIndex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_BalconyIndex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_BalconeCount` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_SmokingIndex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_RenovatedIndex` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_AirDirection` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_Status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_RentTime` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_Partners` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_Animal` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_handicapped` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_SunBalcone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `app_ExtendOption` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_Maker` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_Model` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_SubModel` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_Color` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_Engine` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_Hand` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_Year` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_gear` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_owner` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_PreviousOwner` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_Doors` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_km` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_Addition` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_AirCon` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_Volume` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_AcceptTrade` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_ElectricWindows` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_GPS` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_DVD` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_ABS` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_Sunroof` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_Airbags` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `car_AlloyWheels` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `yad2_Category` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `yad2_Product` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `yad2_NameProduct` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `yad2_SubCategory` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `yad2_Maker` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Yad2_Status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Yad2_AcceptTrade` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `anim_Age` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `anim_Gender` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `anim_Breed` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;
