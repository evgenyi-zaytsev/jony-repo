-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 18 2011 г., 11:46
-- Версия сервера: 5.1.41
-- Версия PHP: 5.3.5-1ubuntu7.2ppa1~lucid

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- База данных: `zvz_spain`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Autocasion_Images`
--

DROP TABLE IF EXISTS `Autocasion_Images`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Autocasion_Links`
--

DROP TABLE IF EXISTS `Autocasion_Links`;
CREATE TABLE IF NOT EXISTS `Autocasion_Links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) NOT NULL,
  `AD_Section` int(11) NOT NULL,
  `AD_Link` text NOT NULL,
  `link_status` int(11) NOT NULL,
  `TargetPage` int(11) DEFAULT NULL,
  `TargetLink` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Autocasion_Links_All`
--

DROP TABLE IF EXISTS `Autocasion_Links_All`;
CREATE TABLE IF NOT EXISTS `Autocasion_Links_All` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) NOT NULL,
  `AD_Section` int(11) NOT NULL,
  `AD_Link` text NOT NULL,
  `link_status` int(11) NOT NULL,
  `TargetPage` int(11) DEFAULT NULL,
  `TargetLink` text,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Autocasion_Provinces`
--

DROP TABLE IF EXISTS `Autocasion_Provinces`;
CREATE TABLE IF NOT EXISTS `Autocasion_Provinces` (
  `province_id` int(11) NOT NULL,
  `province_name` varchar(30) NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Autocasion_Temp_Ads`
--

DROP TABLE IF EXISTS `Autocasion_Temp_Ads`;
CREATE TABLE IF NOT EXISTS `Autocasion_Temp_Ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) DEFAULT NULL,
  `AD_Section` int(11) DEFAULT NULL,
  `AD_KEY` varchar(256) DEFAULT NULL,
  `Ad_Link` varchar(255) DEFAULT NULL,
  `AD_Phone1` varchar(255) DEFAULT NULL,
  `AD_Phone2` varchar(255) DEFAULT NULL,
  `AD_ContactName1` varchar(255) DEFAULT NULL,
  `AD_ContactName2` varchar(255) DEFAULT NULL,
  `AD_ContactEmail` varchar(255) DEFAULT NULL,
  `AD_UpdateDate` varchar(255) DEFAULT NULL,
  `AD_Region` varchar(255) DEFAULT NULL,
  `AD_Area` varchar(255) DEFAULT NULL,
  `AD_City` varchar(255) DEFAULT NULL,
  `AD_Address` varchar(255) DEFAULT NULL,
  `AD_Price` varchar(255) DEFAULT NULL,
  `AD_Notes` varchar(255) DEFAULT NULL,
  `app_MoveInDate` varchar(255) DEFAULT NULL,
  `app_Neighborhood` varchar(255) DEFAULT NULL,
  `app_meter` varchar(255) DEFAULT NULL,
  `app_PropertyTypeIndex` varchar(255) DEFAULT NULL,
  `app_Rooms` varchar(255) DEFAULT NULL,
  `app_Floor` varchar(255) DEFAULT NULL,
  `app_FloorTotal` varchar(255) DEFAULT NULL,
  `app_Furniture` varchar(255) DEFAULT NULL,
  `app_FurnitureIndex` varchar(255) DEFAULT NULL,
  `app_FlatMatesCount` varchar(255) DEFAULT NULL,
  `app_RequiredGenderIndex` varchar(255) DEFAULT NULL,
  `app_BarsIndex` varchar(255) DEFAULT NULL,
  `app_LiftIndex` varchar(255) DEFAULT NULL,
  `app_AirConIndex` varchar(255) DEFAULT NULL,
  `app_storeroom` varchar(255) DEFAULT NULL,
  `app_ParkingIndex` varchar(255) DEFAULT NULL,
  `app_BalconyIndex` varchar(255) DEFAULT NULL,
  `app_BalconeCount` varchar(255) DEFAULT NULL,
  `app_SmokingIndex` varchar(255) DEFAULT NULL,
  `app_RenovatedIndex` varchar(255) DEFAULT NULL,
  `app_AirDirection` varchar(255) DEFAULT NULL,
  `app_Status` varchar(255) DEFAULT NULL,
  `app_RentTime` varchar(255) DEFAULT NULL,
  `app_Partners` varchar(255) DEFAULT NULL,
  `app_Animal` varchar(255) DEFAULT NULL,
  `app_handicapped` varchar(255) DEFAULT NULL,
  `app_SunBalcone` varchar(255) DEFAULT NULL,
  `app_ExtendOption` varchar(255) DEFAULT NULL,
  `car_Maker` varchar(255) DEFAULT NULL,
  `car_Model` varchar(255) DEFAULT NULL,
  `car_SubModel` varchar(255) DEFAULT NULL,
  `car_Color` varchar(255) DEFAULT NULL,
  `car_Engine` varchar(255) DEFAULT NULL,
  `car_Hand` varchar(255) DEFAULT NULL,
  `car_Year` varchar(255) DEFAULT NULL,
  `car_gear` varchar(255) DEFAULT NULL,
  `car_owner` varchar(255) DEFAULT NULL,
  `car_PreviousOwner` varchar(255) DEFAULT NULL,
  `car_Doors` varchar(255) DEFAULT NULL,
  `car_km` varchar(255) DEFAULT NULL,
  `car_Addition` varchar(255) DEFAULT NULL,
  `car_AirCon` varchar(255) DEFAULT NULL,
  `car_Volume` varchar(255) DEFAULT NULL,
  `car_AcceptTrade` varchar(255) DEFAULT NULL,
  `car_ElectricWindows` varchar(255) DEFAULT NULL,
  `car_GPS` varchar(255) DEFAULT NULL,
  `car_DVD` varchar(255) DEFAULT NULL,
  `car_ABS` varchar(255) DEFAULT NULL,
  `car_Sunroof` varchar(255) DEFAULT NULL,
  `car_Airbags` varchar(255) DEFAULT NULL,
  `car_AlloyWheels` varchar(255) DEFAULT NULL,
  `yad2_Category` varchar(255) DEFAULT NULL,
  `yad2_Product` varchar(255) DEFAULT NULL,
  `yad2_NameProduct` varchar(255) DEFAULT NULL,
  `yad2_SubCategory` varchar(255) DEFAULT NULL,
  `yad2_Maker` varchar(255) DEFAULT NULL,
  `Yad2_Status` varchar(255) DEFAULT NULL,
  `Yad2_AcceptTrade` varchar(255) DEFAULT NULL,
  `anim_Age` varchar(255) DEFAULT NULL,
  `anim_Gender` varchar(255) DEFAULT NULL,
  `anim_Breed` varchar(255) DEFAULT NULL,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Autoscout24_Images`
--

DROP TABLE IF EXISTS `Autoscout24_Images`;
CREATE TABLE IF NOT EXISTS `Autoscout24_Images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Key` int(11) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `Ad_Site` int(11) DEFAULT NULL,
  `Ad_Section` int(11) DEFAULT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `AD_Key` (`AD_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Autoscout24_Links`
--

DROP TABLE IF EXISTS `Autoscout24_Links`;
CREATE TABLE IF NOT EXISTS `Autoscout24_Links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Marka` text NOT NULL,
  `AD_Model` text NOT NULL,
  `link_status` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Autoscout24_Links_All`
--

DROP TABLE IF EXISTS `Autoscout24_Links_All`;
CREATE TABLE IF NOT EXISTS `Autoscout24_Links_All` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Marka` text NOT NULL,
  `AD_Model` text NOT NULL,
  `link_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Autoscout24_Temp_Ads`
--

DROP TABLE IF EXISTS `Autoscout24_Temp_Ads`;
CREATE TABLE IF NOT EXISTS `Autoscout24_Temp_Ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) DEFAULT NULL,
  `AD_Section` int(11) DEFAULT NULL,
  `AD_KEY` int(11) DEFAULT NULL,
  `Ad_Link` varchar(255) DEFAULT NULL,
  `AD_Phone1` varchar(255) DEFAULT NULL,
  `AD_Phone2` varchar(255) DEFAULT NULL,
  `AD_ContactName1` varchar(255) DEFAULT NULL,
  `AD_ContactName2` varchar(255) DEFAULT NULL,
  `AD_ContactEmail` varchar(255) DEFAULT NULL,
  `AD_UpdateDate` varchar(255) DEFAULT NULL,
  `AD_Region` varchar(255) DEFAULT NULL,
  `AD_Area` varchar(255) DEFAULT NULL,
  `AD_City` varchar(255) DEFAULT NULL,
  `AD_Address` varchar(255) DEFAULT NULL,
  `AD_Price` varchar(255) DEFAULT NULL,
  `AD_Notes` varchar(255) DEFAULT NULL,
  `app_MoveInDate` varchar(255) DEFAULT NULL,
  `app_Neighborhood` varchar(255) DEFAULT NULL,
  `app_meter` varchar(255) DEFAULT NULL,
  `app_PropertyTypeIndex` varchar(255) DEFAULT NULL,
  `app_Rooms` varchar(255) DEFAULT NULL,
  `app_Floor` varchar(255) DEFAULT NULL,
  `app_FloorTotal` varchar(255) DEFAULT NULL,
  `app_Furniture` varchar(255) DEFAULT NULL,
  `app_FurnitureIndex` varchar(255) DEFAULT NULL,
  `app_FlatMatesCount` varchar(255) DEFAULT NULL,
  `app_RequiredGenderIndex` varchar(255) DEFAULT NULL,
  `app_BarsIndex` varchar(255) DEFAULT NULL,
  `app_LiftIndex` varchar(255) DEFAULT NULL,
  `app_AirConIndex` varchar(255) DEFAULT NULL,
  `app_storeroom` varchar(255) DEFAULT NULL,
  `app_ParkingIndex` varchar(255) DEFAULT NULL,
  `app_BalconyIndex` varchar(255) DEFAULT NULL,
  `app_BalconeCount` varchar(255) DEFAULT NULL,
  `app_SmokingIndex` varchar(255) DEFAULT NULL,
  `app_RenovatedIndex` varchar(255) DEFAULT NULL,
  `app_AirDirection` varchar(255) DEFAULT NULL,
  `app_Status` varchar(255) DEFAULT NULL,
  `app_RentTime` varchar(255) DEFAULT NULL,
  `app_Partners` varchar(255) DEFAULT NULL,
  `app_Animal` varchar(255) DEFAULT NULL,
  `app_handicapped` varchar(255) DEFAULT NULL,
  `app_SunBalcone` varchar(255) DEFAULT NULL,
  `app_ExtendOption` varchar(255) DEFAULT NULL,
  `car_Maker` varchar(255) DEFAULT NULL,
  `car_Model` varchar(255) DEFAULT NULL,
  `car_SubModel` varchar(255) DEFAULT NULL,
  `car_Color` varchar(255) DEFAULT NULL,
  `car_Engine` varchar(255) DEFAULT NULL,
  `car_Hand` varchar(255) DEFAULT NULL,
  `car_Year` varchar(255) DEFAULT NULL,
  `car_gear` varchar(255) DEFAULT NULL,
  `car_owner` varchar(255) DEFAULT NULL,
  `car_PreviousOwner` varchar(255) DEFAULT NULL,
  `car_Doors` varchar(255) DEFAULT NULL,
  `car_km` varchar(255) DEFAULT NULL,
  `car_Addition` varchar(255) DEFAULT NULL,
  `car_AirCon` varchar(255) DEFAULT NULL,
  `car_Volume` varchar(255) DEFAULT NULL,
  `car_AcceptTrade` varchar(255) DEFAULT NULL,
  `car_ElectricWindows` varchar(255) DEFAULT NULL,
  `car_GPS` varchar(255) DEFAULT NULL,
  `car_DVD` varchar(255) DEFAULT NULL,
  `car_ABS` varchar(255) DEFAULT NULL,
  `car_Sunroof` varchar(255) DEFAULT NULL,
  `car_Airbags` varchar(255) DEFAULT NULL,
  `car_AlloyWheels` varchar(255) DEFAULT NULL,
  `yad2_Category` varchar(255) DEFAULT NULL,
  `yad2_Product` varchar(255) DEFAULT NULL,
  `yad2_NameProduct` varchar(255) DEFAULT NULL,
  `yad2_SubCategory` varchar(255) DEFAULT NULL,
  `yad2_Maker` varchar(255) DEFAULT NULL,
  `Yad2_Status` varchar(255) DEFAULT NULL,
  `Yad2_AcceptTrade` varchar(255) DEFAULT NULL,
  `anim_Age` varchar(255) DEFAULT NULL,
  `anim_Gender` varchar(255) DEFAULT NULL,
  `anim_Breed` varchar(255) DEFAULT NULL,
  `AD_Pictures` text,
  `AD_Thumbs` text,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Coches_Images`
--

DROP TABLE IF EXISTS `Coches_Images`;
CREATE TABLE IF NOT EXISTS `Coches_Images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Key` int(11) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `Ad_Site` int(11) DEFAULT NULL,
  `Ad_Section` int(11) DEFAULT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `AD_Key` (`AD_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Coches_Links`
--

DROP TABLE IF EXISTS `Coches_Links`;
CREATE TABLE IF NOT EXISTS `Coches_Links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Region` text NOT NULL,
  `AD_Area` text NOT NULL,
  `AD_City` text NOT NULL,
  `link_status` varchar(32) NOT NULL,
  `link_date` date NOT NULL,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Coches_Links_All`
--

DROP TABLE IF EXISTS `Coches_Links_All`;
CREATE TABLE IF NOT EXISTS `Coches_Links_All` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Region` text NOT NULL,
  `AD_Area` text NOT NULL,
  `AD_City` text NOT NULL,
  `link_status` varchar(32) NOT NULL,
  `link_date` date NOT NULL,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Coches_Temp_Ads`
--

DROP TABLE IF EXISTS `Coches_Temp_Ads`;
CREATE TABLE IF NOT EXISTS `Coches_Temp_Ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) DEFAULT NULL,
  `AD_Section` int(11) DEFAULT NULL,
  `AD_KEY` int(11) DEFAULT NULL,
  `Ad_Link` varchar(255) DEFAULT NULL,
  `AD_Phone1` varchar(255) DEFAULT NULL,
  `AD_Phone2` varchar(255) DEFAULT NULL,
  `AD_ContactName1` varchar(255) DEFAULT NULL,
  `AD_ContactName2` varchar(255) DEFAULT NULL,
  `AD_ContactEmail` varchar(255) DEFAULT NULL,
  `AD_UpdateDate` varchar(255) DEFAULT NULL,
  `AD_Region` varchar(255) DEFAULT NULL,
  `AD_Area` varchar(255) DEFAULT NULL,
  `AD_City` varchar(255) DEFAULT NULL,
  `AD_Address` varchar(255) DEFAULT NULL,
  `AD_Price` varchar(255) DEFAULT NULL,
  `AD_Notes` varchar(255) DEFAULT NULL,
  `app_MoveInDate` varchar(255) DEFAULT NULL,
  `app_Neighborhood` varchar(255) DEFAULT NULL,
  `app_meter` varchar(255) DEFAULT NULL,
  `app_PropertyTypeIndex` varchar(255) DEFAULT NULL,
  `app_Rooms` varchar(255) DEFAULT NULL,
  `app_Floor` varchar(255) DEFAULT NULL,
  `app_FloorTotal` varchar(255) DEFAULT NULL,
  `app_Furniture` varchar(255) DEFAULT NULL,
  `app_FurnitureIndex` varchar(255) DEFAULT NULL,
  `app_FlatMatesCount` varchar(255) DEFAULT NULL,
  `app_RequiredGenderIndex` varchar(255) DEFAULT NULL,
  `app_BarsIndex` varchar(255) DEFAULT NULL,
  `app_LiftIndex` varchar(255) DEFAULT NULL,
  `app_AirConIndex` varchar(255) DEFAULT NULL,
  `app_storeroom` varchar(255) DEFAULT NULL,
  `app_ParkingIndex` varchar(255) DEFAULT NULL,
  `app_BalconyIndex` varchar(255) DEFAULT NULL,
  `app_BalconeCount` varchar(255) DEFAULT NULL,
  `app_SmokingIndex` varchar(255) DEFAULT NULL,
  `app_RenovatedIndex` varchar(255) DEFAULT NULL,
  `app_AirDirection` varchar(255) DEFAULT NULL,
  `app_Status` varchar(255) DEFAULT NULL,
  `app_RentTime` varchar(255) DEFAULT NULL,
  `app_Partners` varchar(255) DEFAULT NULL,
  `app_Animal` varchar(255) DEFAULT NULL,
  `app_handicapped` varchar(255) DEFAULT NULL,
  `app_SunBalcone` varchar(255) DEFAULT NULL,
  `app_ExtendOption` varchar(255) DEFAULT NULL,
  `car_Maker` varchar(255) DEFAULT NULL,
  `car_Model` varchar(255) DEFAULT NULL,
  `car_SubModel` varchar(255) DEFAULT NULL,
  `car_Color` varchar(255) DEFAULT NULL,
  `car_Engine` varchar(255) DEFAULT NULL,
  `car_Hand` varchar(255) DEFAULT NULL,
  `car_Year` varchar(255) DEFAULT NULL,
  `car_gear` varchar(255) DEFAULT NULL,
  `car_owner` varchar(255) DEFAULT NULL,
  `car_PreviousOwner` varchar(255) DEFAULT NULL,
  `car_Doors` varchar(255) DEFAULT NULL,
  `car_km` varchar(255) DEFAULT NULL,
  `car_Addition` varchar(255) DEFAULT NULL,
  `car_AirCon` varchar(255) DEFAULT NULL,
  `car_Volume` varchar(255) DEFAULT NULL,
  `car_AcceptTrade` varchar(255) DEFAULT NULL,
  `car_ElectricWindows` varchar(255) DEFAULT NULL,
  `car_GPS` varchar(255) DEFAULT NULL,
  `car_DVD` varchar(255) DEFAULT NULL,
  `car_ABS` varchar(255) DEFAULT NULL,
  `car_Sunroof` varchar(255) DEFAULT NULL,
  `car_Airbags` varchar(255) DEFAULT NULL,
  `car_AlloyWheels` varchar(255) DEFAULT NULL,
  `yad2_Category` varchar(255) DEFAULT NULL,
  `yad2_Product` varchar(255) DEFAULT NULL,
  `yad2_NameProduct` varchar(255) DEFAULT NULL,
  `yad2_SubCategory` varchar(255) DEFAULT NULL,
  `yad2_Maker` varchar(255) DEFAULT NULL,
  `Yad2_Status` varchar(255) DEFAULT NULL,
  `Yad2_AcceptTrade` varchar(255) DEFAULT NULL,
  `anim_Age` varchar(255) DEFAULT NULL,
  `anim_Gender` varchar(255) DEFAULT NULL,
  `anim_Breed` varchar(255) DEFAULT NULL,
  `AD_Pictures` text,
  `AD_Thumbs` text,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `deletedidsadsp`
--

DROP TABLE IF EXISTS `deletedidsadsp`;
CREATE TABLE IF NOT EXISTS `deletedidsadsp` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SiteId` bigint(20) NOT NULL,
  `SectionId` bigint(20) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `AdKey` varchar(255) NOT NULL,
  `AD_md5` varchar(50) NOT NULL,
  `AD_import` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `AD_md5` (`AD_md5`),
  KEY `Foreign_key` (`AdKey`,`SiteId`,`SectionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Enalquiler_Images`
--

DROP TABLE IF EXISTS `Enalquiler_Images`;
CREATE TABLE IF NOT EXISTS `Enalquiler_Images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Key` int(11) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `Ad_Site` int(11) DEFAULT NULL,
  `Ad_Section` int(11) DEFAULT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `AD_Key` (`AD_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Enalquiler_Links`
--

DROP TABLE IF EXISTS `Enalquiler_Links`;
CREATE TABLE IF NOT EXISTS `Enalquiler_Links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `link_status` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Enalquiler_Links_All`
--

DROP TABLE IF EXISTS `Enalquiler_Links_All`;
CREATE TABLE IF NOT EXISTS `Enalquiler_Links_All` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `link_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Enalquiler_Temp_Ads`
--

DROP TABLE IF EXISTS `Enalquiler_Temp_Ads`;
CREATE TABLE IF NOT EXISTS `Enalquiler_Temp_Ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) DEFAULT NULL,
  `AD_Section` int(11) DEFAULT NULL,
  `AD_KEY` int(11) DEFAULT NULL,
  `Ad_Link` varchar(255) DEFAULT NULL,
  `AD_Phone1` varchar(255) DEFAULT NULL,
  `AD_Phone2` varchar(255) DEFAULT NULL,
  `AD_ContactName1` varchar(255) DEFAULT NULL,
  `AD_ContactName2` varchar(255) DEFAULT NULL,
  `AD_ContactEmail` varchar(255) DEFAULT NULL,
  `AD_UpdateDate` varchar(255) DEFAULT NULL,
  `AD_Region` varchar(255) DEFAULT NULL,
  `AD_Area` varchar(255) DEFAULT NULL,
  `AD_City` varchar(255) DEFAULT NULL,
  `AD_Address` varchar(255) DEFAULT NULL,
  `AD_Price` varchar(255) DEFAULT NULL,
  `AD_Notes` varchar(255) DEFAULT NULL,
  `app_MoveInDate` varchar(255) DEFAULT NULL,
  `app_Neighborhood` varchar(255) DEFAULT NULL,
  `app_meter` varchar(255) DEFAULT NULL,
  `app_PropertyTypeIndex` varchar(255) DEFAULT NULL,
  `app_Rooms` varchar(255) DEFAULT NULL,
  `app_Floor` varchar(255) DEFAULT NULL,
  `app_FloorTotal` varchar(255) DEFAULT NULL,
  `app_Furniture` varchar(255) DEFAULT NULL,
  `app_FurnitureIndex` varchar(255) DEFAULT NULL,
  `app_FlatMatesCount` varchar(255) DEFAULT NULL,
  `app_RequiredGenderIndex` varchar(255) DEFAULT NULL,
  `app_BarsIndex` varchar(255) DEFAULT NULL,
  `app_LiftIndex` varchar(255) DEFAULT NULL,
  `app_AirConIndex` varchar(255) DEFAULT NULL,
  `app_storeroom` varchar(255) DEFAULT NULL,
  `app_ParkingIndex` varchar(255) DEFAULT NULL,
  `app_BalconyIndex` varchar(255) DEFAULT NULL,
  `app_BalconeCount` varchar(255) DEFAULT NULL,
  `app_SmokingIndex` varchar(255) DEFAULT NULL,
  `app_RenovatedIndex` varchar(255) DEFAULT NULL,
  `app_AirDirection` varchar(255) DEFAULT NULL,
  `app_Status` varchar(255) DEFAULT NULL,
  `app_RentTime` varchar(255) DEFAULT NULL,
  `app_Partners` varchar(255) DEFAULT NULL,
  `app_Animal` varchar(255) DEFAULT NULL,
  `app_handicapped` varchar(255) DEFAULT NULL,
  `app_SunBalcone` varchar(255) DEFAULT NULL,
  `app_ExtendOption` varchar(255) DEFAULT NULL,
  `car_Maker` varchar(255) DEFAULT NULL,
  `car_Model` varchar(255) DEFAULT NULL,
  `car_SubModel` varchar(255) DEFAULT NULL,
  `car_Color` varchar(255) DEFAULT NULL,
  `car_Engine` varchar(255) DEFAULT NULL,
  `car_Hand` varchar(255) DEFAULT NULL,
  `car_Year` varchar(255) DEFAULT NULL,
  `car_gear` varchar(255) DEFAULT NULL,
  `car_owner` varchar(255) DEFAULT NULL,
  `car_PreviousOwner` varchar(255) DEFAULT NULL,
  `car_Doors` varchar(255) DEFAULT NULL,
  `car_km` varchar(255) DEFAULT NULL,
  `car_Addition` varchar(255) DEFAULT NULL,
  `car_AirCon` varchar(255) DEFAULT NULL,
  `car_Volume` varchar(255) DEFAULT NULL,
  `car_AcceptTrade` varchar(255) DEFAULT NULL,
  `car_ElectricWindows` varchar(255) DEFAULT NULL,
  `car_GPS` varchar(255) DEFAULT NULL,
  `car_DVD` varchar(255) DEFAULT NULL,
  `car_ABS` varchar(255) DEFAULT NULL,
  `car_Sunroof` varchar(255) DEFAULT NULL,
  `car_Airbags` varchar(255) DEFAULT NULL,
  `car_AlloyWheels` varchar(255) DEFAULT NULL,
  `yad2_Category` varchar(255) DEFAULT NULL,
  `yad2_Product` varchar(255) DEFAULT NULL,
  `yad2_NameProduct` varchar(255) DEFAULT NULL,
  `yad2_SubCategory` varchar(255) DEFAULT NULL,
  `yad2_Maker` varchar(255) DEFAULT NULL,
  `Yad2_Status` varchar(255) DEFAULT NULL,
  `Yad2_AcceptTrade` varchar(255) DEFAULT NULL,
  `anim_Age` varchar(255) DEFAULT NULL,
  `anim_Gender` varchar(255) DEFAULT NULL,
  `anim_Breed` varchar(255) DEFAULT NULL,
  `AD_Pictures` text,
  `AD_Thumbs` text,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Fotocasa_Cities`
--

DROP TABLE IF EXISTS `Fotocasa_Cities`;
CREATE TABLE IF NOT EXISTS `Fotocasa_Cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `city_name` varchar(128) NOT NULL,
  `city_link` text NOT NULL,
  `city_status` varchar(32) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Fotocasa_Cities_All`
--

DROP TABLE IF EXISTS `Fotocasa_Cities_All`;
CREATE TABLE IF NOT EXISTS `Fotocasa_Cities_All` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `city_name` varchar(128) NOT NULL,
  `city_link` text NOT NULL,
  `city_status` varchar(32) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Fotocasa_Images`
--

DROP TABLE IF EXISTS `Fotocasa_Images`;
CREATE TABLE IF NOT EXISTS `Fotocasa_Images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Key` varchar(128) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `Ad_Site` int(11) DEFAULT NULL,
  `Ad_Section` int(11) DEFAULT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  `AD_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Fotocasa_Links`
--

DROP TABLE IF EXISTS `Fotocasa_Links`;
CREATE TABLE IF NOT EXISTS `Fotocasa_Links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Region` text NOT NULL,
  `AD_Area` text NOT NULL,
  `AD_City` text NOT NULL,
  `link_status` varchar(32) NOT NULL,
  `TargetPage` varchar(32) DEFAULT NULL,
  `TargetLink` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Fotocasa_Links_All`
--

DROP TABLE IF EXISTS `Fotocasa_Links_All`;
CREATE TABLE IF NOT EXISTS `Fotocasa_Links_All` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Region` text NOT NULL,
  `AD_Area` text NOT NULL,
  `AD_City` text NOT NULL,
  `link_status` tinyint(3) NOT NULL DEFAULT '0',
  `TargetPage` varchar(32) DEFAULT NULL,
  `TargetLink` text,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Fotocasa_Provinces`
--

DROP TABLE IF EXISTS `Fotocasa_Provinces`;
CREATE TABLE IF NOT EXISTS `Fotocasa_Provinces` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(128) NOT NULL,
  `province_link` text NOT NULL,
  `province_status` varchar(32) NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Fotocasa_Provinces_All`
--

DROP TABLE IF EXISTS `Fotocasa_Provinces_All`;
CREATE TABLE IF NOT EXISTS `Fotocasa_Provinces_All` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(128) NOT NULL,
  `province_link` text NOT NULL,
  `province_status` varchar(32) NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Fotocasa_Temp_Ads`
--

DROP TABLE IF EXISTS `Fotocasa_Temp_Ads`;
CREATE TABLE IF NOT EXISTS `Fotocasa_Temp_Ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) DEFAULT NULL,
  `AD_Section` int(11) DEFAULT NULL,
  `AD_KEY` varchar(256) DEFAULT NULL,
  `Ad_Link` varchar(255) DEFAULT NULL,
  `AD_Phone1` varchar(255) DEFAULT NULL,
  `AD_Phone2` varchar(255) DEFAULT NULL,
  `AD_ContactName1` varchar(255) DEFAULT NULL,
  `AD_ContactName2` varchar(255) DEFAULT NULL,
  `AD_ContactEmail` varchar(255) DEFAULT NULL,
  `AD_UpdateDate` varchar(255) DEFAULT NULL,
  `AD_Region` varchar(255) DEFAULT NULL,
  `AD_Area` varchar(255) DEFAULT NULL,
  `AD_City` varchar(255) DEFAULT NULL,
  `AD_Address` varchar(255) DEFAULT NULL,
  `AD_Price` varchar(255) DEFAULT NULL,
  `AD_Notes` varchar(255) DEFAULT NULL,
  `app_MoveInDate` varchar(255) DEFAULT NULL,
  `app_Neighborhood` varchar(255) DEFAULT NULL,
  `app_meter` varchar(255) DEFAULT NULL,
  `app_PropertyTypeIndex` varchar(255) DEFAULT NULL,
  `app_Rooms` varchar(255) DEFAULT NULL,
  `app_Floor` varchar(255) DEFAULT NULL,
  `app_FloorTotal` varchar(255) DEFAULT NULL,
  `app_Furniture` varchar(255) DEFAULT NULL,
  `app_FurnitureIndex` varchar(255) DEFAULT NULL,
  `app_FlatMatesCount` varchar(255) DEFAULT NULL,
  `app_RequiredGenderIndex` varchar(255) DEFAULT NULL,
  `app_BarsIndex` varchar(255) DEFAULT NULL,
  `app_LiftIndex` varchar(255) DEFAULT NULL,
  `app_AirConIndex` varchar(255) DEFAULT NULL,
  `app_storeroom` varchar(255) DEFAULT NULL,
  `app_ParkingIndex` varchar(255) DEFAULT NULL,
  `app_BalconyIndex` varchar(255) DEFAULT NULL,
  `app_BalconeCount` varchar(255) DEFAULT NULL,
  `app_SmokingIndex` varchar(255) DEFAULT NULL,
  `app_RenovatedIndex` varchar(255) DEFAULT NULL,
  `app_AirDirection` varchar(255) DEFAULT NULL,
  `app_Status` varchar(255) DEFAULT NULL,
  `app_RentTime` varchar(255) DEFAULT NULL,
  `app_Partners` varchar(255) DEFAULT NULL,
  `app_Animal` varchar(255) DEFAULT NULL,
  `app_handicapped` varchar(255) DEFAULT NULL,
  `app_SunBalcone` varchar(255) DEFAULT NULL,
  `app_ExtendOption` varchar(255) DEFAULT NULL,
  `car_Maker` varchar(255) DEFAULT NULL,
  `car_Model` varchar(255) DEFAULT NULL,
  `car_SubModel` varchar(255) DEFAULT NULL,
  `car_Color` varchar(255) DEFAULT NULL,
  `car_Engine` varchar(255) DEFAULT NULL,
  `car_Hand` varchar(255) DEFAULT NULL,
  `car_Year` varchar(255) DEFAULT NULL,
  `car_gear` varchar(255) DEFAULT NULL,
  `car_owner` varchar(255) DEFAULT NULL,
  `car_PreviousOwner` varchar(255) DEFAULT NULL,
  `car_Doors` varchar(255) DEFAULT NULL,
  `car_km` varchar(255) DEFAULT NULL,
  `car_Addition` varchar(255) DEFAULT NULL,
  `car_AirCon` varchar(255) DEFAULT NULL,
  `car_Volume` varchar(255) DEFAULT NULL,
  `car_AcceptTrade` varchar(255) DEFAULT NULL,
  `car_ElectricWindows` varchar(255) DEFAULT NULL,
  `car_GPS` varchar(255) DEFAULT NULL,
  `car_DVD` varchar(255) DEFAULT NULL,
  `car_ABS` varchar(255) DEFAULT NULL,
  `car_Sunroof` varchar(255) DEFAULT NULL,
  `car_Airbags` varchar(255) DEFAULT NULL,
  `car_AlloyWheels` varchar(255) DEFAULT NULL,
  `yad2_Category` varchar(255) DEFAULT NULL,
  `yad2_Product` varchar(255) DEFAULT NULL,
  `yad2_NameProduct` varchar(255) DEFAULT NULL,
  `yad2_SubCategory` varchar(255) DEFAULT NULL,
  `yad2_Maker` varchar(255) DEFAULT NULL,
  `Yad2_Status` varchar(255) DEFAULT NULL,
  `Yad2_AcceptTrade` varchar(255) DEFAULT NULL,
  `anim_Age` varchar(255) DEFAULT NULL,
  `anim_Gender` varchar(255) DEFAULT NULL,
  `anim_Breed` varchar(255) DEFAULT NULL,
  `AD_Pictures` text,
  `AD_Thumbs` text,
  `AD_status` tinyint(4) NOT NULL DEFAULT '0',
  `AD_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `genericdatap`
--

DROP TABLE IF EXISTS `genericdatap`;
CREATE TABLE IF NOT EXISTS `genericdatap` (
  `POST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `cDate` datetime DEFAULT NULL,
  `uDate` datetime DEFAULT NULL,
  `fDate` datetime DEFAULT NULL,
  `dDate` datetime DEFAULT NULL,
  `eDate` datetime DEFAULT NULL,
  `AD_Site` bigint(20) DEFAULT NULL,
  `AD_Section` bigint(20) DEFAULT NULL,
  `AD_KEY` varchar(255) NOT NULL,
  `AD_Status` bigint(20) DEFAULT NULL,
  `AD_UserId` varchar(50) DEFAULT NULL,
  `AD_Random` bigint(20) DEFAULT NULL,
  `Ad_Link` text NOT NULL,
  `pictureHave` tinyint(1) DEFAULT NULL,
  `pictureFromIcar` tinyint(1) DEFAULT NULL,
  `PicturesString` longtext,
  `videoHave` tinyint(1) DEFAULT NULL,
  `AD_Phone1` text,
  `AD_Phone2` text,
  `AD_ContactName1` text,
  `AD_ContactEmail` text,
  `AD_ContactCity` text,
  `AD_ContactName2` text,
  `Ad_Fax` varchar(50) DEFAULT NULL,
  `AD_WebSite` varchar(50) DEFAULT NULL,
  `AD_ContactAddress` text,
  `AD_PostDate` text,
  `AD_UpdateDate` text,
  `AD_Region` text,
  `AD_Area` text,
  `AD_City` text,
  `AD_CityArea` text,
  `AD_Address` text,
  `AD_Price` bigint(20) DEFAULT NULL,
  `AD_PriceNIS` bigint(20) DEFAULT NULL,
  `AD_CostTotal` bigint(20) DEFAULT NULL,
  `AD_Notes` longtext,
  `AD_Coords` text,
  `AD_CoordsCheck` tinyint(1) DEFAULT NULL,
  `app_MoveInDate` text,
  `app_Neighborhood` text,
  `app_AddressStreet` text,
  `app_AddressNumber` text,
  `app_AddressDescription` text,
  `app_meter` text,
  `app_meterInt` bigint(20) DEFAULT NULL,
  `app_PropertyTypeIndex` text,
  `app_Typeindex` text,
  `app_Rooms` float(9,3) DEFAULT NULL,
  `app_Floor` bigint(20) DEFAULT NULL,
  `app_FloorTotal` text,
  `app_FloorDescription` text,
  `app_PaymentsNumber` text,
  `app_Furniture` longtext,
  `app_FurnitureIndex` text,
  `app_FurnitureHave` text,
  `app_FlatMatesCount` text,
  `app_RequiredGenderIndex` text,
  `app_BarsIndex` text,
  `app_LiftIndex` text,
  `app_AirConIndex` text,
  `app_AirConHave` text,
  `app_storeroom` text,
  `app_ParkingIndex` text,
  `app_ParkingHave` text,
  `app_LocationIndex` text,
  `app_BalconyIndex` text,
  `app_BalconeCount` int(11) DEFAULT NULL,
  `app_BalconyHave` text,
  `app_SmokingIndex` text,
  `app_RenovatedIndex` text,
  `app_TypeProperty` text,
  `app_AirDirection` text,
  `app_Status` text,
  `app_RentTime` text,
  `app_Partners` text,
  `app_Animal` text,
  `app_PartnerSex` text,
  `app_handicapped` varchar(50) DEFAULT NULL,
  `app_Mamad` varchar(50) DEFAULT NULL,
  `app_SunBalcone` varchar(50) DEFAULT NULL,
  `app_Arnona` varchar(50) DEFAULT NULL,
  `app_Kosher` varchar(50) DEFAULT NULL,
  `app_Entrance` text,
  `app_ExtendOption` text,
  `app_MoveInDateDT` datetime DEFAULT NULL,
  `app_IsKones` int(11) DEFAULT '0',
  `app_LastServeDate` datetime DEFAULT NULL,
  `app_Appraiser` varchar(50) DEFAULT NULL,
  `app_IsRealtor` int(11) DEFAULT '0',
  `car_Maker` text,
  `car_Model` text,
  `car_Color` text,
  `car_GearFull` text,
  `car_SubModel` text,
  `car_Engine` text,
  `car_Hand` text,
  `car_Year` bigint(20) DEFAULT NULL,
  `car_gear` text,
  `car_owner` varchar(50) DEFAULT NULL,
  `car_PreviousOwner` text,
  `car_Doors` text,
  `car_km` float(9,3) DEFAULT NULL,
  `car_Addition` longtext,
  `car_AirCon` text,
  `car_Volume` bigint(20) DEFAULT NULL,
  `car_NextTest` text,
  `car_Accessory` text,
  `car_AcceptTrade` text,
  `car_ICarId` int(11) DEFAULT NULL,
  `car_ICar_PastModel` tinyint(1) DEFAULT NULL,
  `car_ElectricWindows` text,
  `car_GPS` text,
  `car_DVD` text,
  `car_ABS` text,
  `car_Conditioner` text,
  `car_Sunroof` text,
  `car_Airbags` text,
  `car_AlloyWheels` text,
  `yad2_Category` text,
  `yad2_Product` text,
  `yad2_Description` longtext,
  `yad2_NameProduct` text,
  `yad2_Operation` text,
  `yad2_SubCategory` text,
  `yad2_Maker` text,
  `Yad2_Status` text,
  `Yad2_AcceptTrade` text,
  `anim_Age` text,
  `anim_Gender` text,
  `anim_Association` text,
  `anim_Neutered` varchar(50) DEFAULT NULL,
  `anim_Type` text,
  `anim_Breed` text,
  `anim_Hours` text,
  `anim_Immuned` varchar(50) DEFAULT NULL,
  `anim_ImmuneDetails` longtext,
  `req_Range` text,
  `req_Role` text,
  `req_Notes` longtext,
  `req_JobRank` text,
  `req_CompanyName` text,
  `req_CompanyDetails` text,
  `req_CompanyRequirement` text,
  `req_CompanyLogo` text,
  `AD_Test` int(11) DEFAULT NULL,
  `AD_md5` varchar(50) NOT NULL,
  `AD_import` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`POST_ID`),
  KEY `AD_md5` (`AD_md5`),
  KEY `AD_import` (`AD_import`),
  KEY `Foreign_key` (`AD_KEY`,`AD_Site`,`AD_Section`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Habitamos_Images`
--

DROP TABLE IF EXISTS `Habitamos_Images`;
CREATE TABLE IF NOT EXISTS `Habitamos_Images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Key` int(11) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `AD_status` int(11) NOT NULL DEFAULT '0',
  `Ad_Site` int(11) DEFAULT NULL,
  `Ad_Section` int(11) DEFAULT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Habitamos_Links`
--

DROP TABLE IF EXISTS `Habitamos_Links`;
CREATE TABLE IF NOT EXISTS `Habitamos_Links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Region` text NOT NULL,
  `AD_Area` text NOT NULL,
  `AD_City` text NOT NULL,
  `link_status` varchar(32) NOT NULL,
  `link_date` date NOT NULL,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Habitamos_Links_All`
--

DROP TABLE IF EXISTS `Habitamos_Links_All`;
CREATE TABLE IF NOT EXISTS `Habitamos_Links_All` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Region` text NOT NULL,
  `AD_Area` text NOT NULL,
  `AD_City` text NOT NULL,
  `link_status` varchar(32) NOT NULL,
  `link_date` date NOT NULL,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Habitamos_Temp_Ads`
--

DROP TABLE IF EXISTS `Habitamos_Temp_Ads`;
CREATE TABLE IF NOT EXISTS `Habitamos_Temp_Ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) DEFAULT NULL,
  `AD_Section` int(11) DEFAULT NULL,
  `AD_KEY` int(11) DEFAULT NULL,
  `Ad_Link` varchar(255) DEFAULT NULL,
  `AD_Phone1` varchar(255) DEFAULT NULL,
  `AD_Phone2` varchar(255) DEFAULT NULL,
  `AD_ContactName1` varchar(255) DEFAULT NULL,
  `AD_ContactName2` varchar(255) DEFAULT NULL,
  `AD_ContactEmail` varchar(255) DEFAULT NULL,
  `AD_UpdateDate` varchar(255) DEFAULT NULL,
  `AD_Region` varchar(255) DEFAULT NULL,
  `AD_Area` varchar(255) DEFAULT NULL,
  `AD_City` varchar(255) DEFAULT NULL,
  `AD_Address` varchar(255) DEFAULT NULL,
  `AD_Price` varchar(255) DEFAULT NULL,
  `AD_Notes` varchar(255) DEFAULT NULL,
  `app_MoveInDate` varchar(255) DEFAULT NULL,
  `app_Neighborhood` varchar(255) DEFAULT NULL,
  `app_meter` varchar(255) DEFAULT NULL,
  `app_PropertyTypeIndex` varchar(255) DEFAULT NULL,
  `app_Rooms` varchar(255) DEFAULT NULL,
  `app_Floor` varchar(255) DEFAULT NULL,
  `app_FloorTotal` varchar(255) DEFAULT NULL,
  `app_Furniture` varchar(255) DEFAULT NULL,
  `app_FurnitureIndex` varchar(255) DEFAULT NULL,
  `app_FlatMatesCount` varchar(255) DEFAULT NULL,
  `app_RequiredGenderIndex` varchar(255) DEFAULT NULL,
  `app_BarsIndex` varchar(255) DEFAULT NULL,
  `app_LiftIndex` varchar(255) DEFAULT NULL,
  `app_AirConIndex` varchar(255) DEFAULT NULL,
  `app_storeroom` varchar(255) DEFAULT NULL,
  `app_ParkingIndex` varchar(255) DEFAULT NULL,
  `app_BalconyIndex` varchar(255) DEFAULT NULL,
  `app_BalconeCount` varchar(255) DEFAULT NULL,
  `app_SmokingIndex` varchar(255) DEFAULT NULL,
  `app_RenovatedIndex` varchar(255) DEFAULT NULL,
  `app_AirDirection` varchar(255) DEFAULT NULL,
  `app_Status` varchar(255) DEFAULT NULL,
  `app_RentTime` varchar(255) DEFAULT NULL,
  `app_Partners` varchar(255) DEFAULT NULL,
  `app_Animal` varchar(255) DEFAULT NULL,
  `app_handicapped` varchar(255) DEFAULT NULL,
  `app_SunBalcone` varchar(255) DEFAULT NULL,
  `app_ExtendOption` varchar(255) DEFAULT NULL,
  `car_Maker` varchar(255) DEFAULT NULL,
  `car_Model` varchar(255) DEFAULT NULL,
  `car_SubModel` varchar(255) DEFAULT NULL,
  `car_Color` varchar(255) DEFAULT NULL,
  `car_Engine` varchar(255) DEFAULT NULL,
  `car_Hand` varchar(255) DEFAULT NULL,
  `car_Year` varchar(255) DEFAULT NULL,
  `car_gear` varchar(255) DEFAULT NULL,
  `car_owner` varchar(255) DEFAULT NULL,
  `car_PreviousOwner` varchar(255) DEFAULT NULL,
  `car_Doors` varchar(255) DEFAULT NULL,
  `car_km` varchar(255) DEFAULT NULL,
  `car_Addition` varchar(255) DEFAULT NULL,
  `car_AirCon` varchar(255) DEFAULT NULL,
  `car_Volume` varchar(255) DEFAULT NULL,
  `car_AcceptTrade` varchar(255) DEFAULT NULL,
  `car_ElectricWindows` varchar(255) DEFAULT NULL,
  `car_GPS` varchar(255) DEFAULT NULL,
  `car_DVD` varchar(255) DEFAULT NULL,
  `car_ABS` varchar(255) DEFAULT NULL,
  `car_Sunroof` varchar(255) DEFAULT NULL,
  `car_Airbags` varchar(255) DEFAULT NULL,
  `car_AlloyWheels` varchar(255) DEFAULT NULL,
  `yad2_Category` varchar(255) DEFAULT NULL,
  `yad2_Product` varchar(255) DEFAULT NULL,
  `yad2_NameProduct` varchar(255) DEFAULT NULL,
  `yad2_SubCategory` varchar(255) DEFAULT NULL,
  `yad2_Maker` varchar(255) DEFAULT NULL,
  `Yad2_Status` varchar(255) DEFAULT NULL,
  `Yad2_AcceptTrade` varchar(255) DEFAULT NULL,
  `anim_Age` varchar(255) DEFAULT NULL,
  `anim_Gender` varchar(255) DEFAULT NULL,
  `anim_Breed` varchar(255) DEFAULT NULL,
  `AD_Pictures` text,
  `AD_Thumbs` text,
  `AD_md5` varchar(50) NOT NULL,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Idealista_BaseLinks`
--

DROP TABLE IF EXISTS `Idealista_BaseLinks`;
CREATE TABLE IF NOT EXISTS `Idealista_BaseLinks` (
  `baselink_id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Section` int(11) DEFAULT NULL,
  `baselink_url` text NOT NULL,
  `baselink_subtype` varchar(128) NOT NULL,
  `baselink_status` varchar(32) NOT NULL,
  PRIMARY KEY (`baselink_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Idealista_BaseLinksAll`
--

DROP TABLE IF EXISTS `Idealista_BaseLinksAll`;
CREATE TABLE IF NOT EXISTS `Idealista_BaseLinksAll` (
  `baselink_id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Section` int(11) DEFAULT NULL,
  `baselink_url` text NOT NULL,
  `baselink_subtype` varchar(128) NOT NULL,
  `baselink_status` varchar(32) NOT NULL,
  PRIMARY KEY (`baselink_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Idealista_Cities`
--

DROP TABLE IF EXISTS `Idealista_Cities`;
CREATE TABLE IF NOT EXISTS `Idealista_Cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `city_name` varchar(128) NOT NULL,
  `city_link` text NOT NULL,
  `city_status` varchar(32) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Idealista_CitiesAll`
--

DROP TABLE IF EXISTS `Idealista_CitiesAll`;
CREATE TABLE IF NOT EXISTS `Idealista_CitiesAll` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `city_name` varchar(128) NOT NULL,
  `city_link` text NOT NULL,
  `city_status` varchar(32) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Idealista_Images`
--

DROP TABLE IF EXISTS `Idealista_Images`;
CREATE TABLE IF NOT EXISTS `Idealista_Images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Key` varchar(128) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `Ad_Site` int(11) DEFAULT NULL,
  `Ad_Section` int(11) DEFAULT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  `AD_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `AD_Key` (`AD_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Idealista_Links`
--

DROP TABLE IF EXISTS `Idealista_Links`;
CREATE TABLE IF NOT EXISTS `Idealista_Links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Region` text,
  `AD_Area` text NOT NULL,
  `AD_City` text NOT NULL,
  `link_status` varchar(32) NOT NULL,
  `TargetPage` varchar(32) DEFAULT NULL,
  `TargetLink` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Idealista_Links_All`
--

DROP TABLE IF EXISTS `Idealista_Links_All`;
CREATE TABLE IF NOT EXISTS `Idealista_Links_All` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Region` text NOT NULL,
  `AD_Area` text NOT NULL,
  `AD_City` text NOT NULL,
  `link_status` tinyint(4) NOT NULL DEFAULT '0',
  `TargetPage` varchar(32) DEFAULT NULL,
  `TargetLink` text,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Idealista_Provinces`
--

DROP TABLE IF EXISTS `Idealista_Provinces`;
CREATE TABLE IF NOT EXISTS `Idealista_Provinces` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Section` int(11) DEFAULT NULL,
  `province_name` varchar(128) NOT NULL,
  `province_link` text NOT NULL,
  `province_status` varchar(32) NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Idealista_ProvincesAll`
--

DROP TABLE IF EXISTS `Idealista_ProvincesAll`;
CREATE TABLE IF NOT EXISTS `Idealista_ProvincesAll` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Section` int(11) DEFAULT NULL,
  `province_name` varchar(128) NOT NULL,
  `province_link` text NOT NULL,
  `province_status` varchar(32) NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Idealista_Temp_Ads`
--

DROP TABLE IF EXISTS `Idealista_Temp_Ads`;
CREATE TABLE IF NOT EXISTS `Idealista_Temp_Ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) DEFAULT NULL,
  `AD_Section` int(11) DEFAULT NULL,
  `AD_KEY` varchar(256) DEFAULT NULL,
  `Ad_Link` varchar(255) DEFAULT NULL,
  `AD_Phone1` varchar(255) DEFAULT NULL,
  `AD_Phone2` varchar(255) DEFAULT NULL,
  `AD_ContactName1` varchar(255) DEFAULT NULL,
  `AD_ContactName2` varchar(255) DEFAULT NULL,
  `AD_ContactEmail` varchar(255) DEFAULT NULL,
  `AD_UpdateDate` varchar(255) DEFAULT NULL,
  `AD_Region` varchar(255) DEFAULT NULL,
  `AD_Area` varchar(255) DEFAULT NULL,
  `AD_City` varchar(255) DEFAULT NULL,
  `AD_Address` varchar(255) DEFAULT NULL,
  `AD_Price` varchar(255) DEFAULT NULL,
  `AD_Notes` text,
  `app_MoveInDate` varchar(255) DEFAULT NULL,
  `app_Neighborhood` varchar(255) DEFAULT NULL,
  `app_meter` varchar(255) DEFAULT NULL,
  `app_PropertyTypeIndex` varchar(255) DEFAULT NULL,
  `app_Rooms` varchar(255) DEFAULT NULL,
  `app_Floor` varchar(255) DEFAULT NULL,
  `app_FloorTotal` varchar(255) DEFAULT NULL,
  `app_Furniture` varchar(255) DEFAULT NULL,
  `app_FurnitureIndex` varchar(255) DEFAULT NULL,
  `app_FlatMatesCount` varchar(255) DEFAULT NULL,
  `app_RequiredGenderIndex` varchar(255) DEFAULT NULL,
  `app_BarsIndex` varchar(255) DEFAULT NULL,
  `app_LiftIndex` varchar(255) DEFAULT NULL,
  `app_AirConIndex` varchar(255) DEFAULT NULL,
  `app_storeroom` varchar(255) DEFAULT NULL,
  `app_ParkingIndex` varchar(255) DEFAULT NULL,
  `app_BalconyIndex` varchar(255) DEFAULT NULL,
  `app_BalconeCount` varchar(255) DEFAULT NULL,
  `app_SmokingIndex` varchar(255) DEFAULT NULL,
  `app_RenovatedIndex` varchar(255) DEFAULT NULL,
  `app_AirDirection` varchar(255) DEFAULT NULL,
  `app_Status` varchar(255) DEFAULT NULL,
  `app_RentTime` varchar(255) DEFAULT NULL,
  `app_Partners` varchar(255) DEFAULT NULL,
  `app_Animal` varchar(255) DEFAULT NULL,
  `app_handicapped` varchar(255) DEFAULT NULL,
  `app_SunBalcone` varchar(255) DEFAULT NULL,
  `app_ExtendOption` varchar(255) DEFAULT NULL,
  `car_Maker` varchar(255) DEFAULT NULL,
  `car_Model` varchar(255) DEFAULT NULL,
  `car_SubModel` varchar(255) DEFAULT NULL,
  `car_Color` varchar(255) DEFAULT NULL,
  `car_Engine` varchar(255) DEFAULT NULL,
  `car_Hand` varchar(255) DEFAULT NULL,
  `car_Year` varchar(255) DEFAULT NULL,
  `car_gear` varchar(255) DEFAULT NULL,
  `car_owner` varchar(255) DEFAULT NULL,
  `car_PreviousOwner` varchar(255) DEFAULT NULL,
  `car_Doors` varchar(255) DEFAULT NULL,
  `car_km` varchar(255) DEFAULT NULL,
  `car_Addition` varchar(255) DEFAULT NULL,
  `car_AirCon` varchar(255) DEFAULT NULL,
  `car_Volume` varchar(255) DEFAULT NULL,
  `car_AcceptTrade` varchar(255) DEFAULT NULL,
  `car_ElectricWindows` varchar(255) DEFAULT NULL,
  `car_GPS` varchar(255) DEFAULT NULL,
  `car_DVD` varchar(255) DEFAULT NULL,
  `car_ABS` varchar(255) DEFAULT NULL,
  `car_Sunroof` varchar(255) DEFAULT NULL,
  `car_Airbags` varchar(255) DEFAULT NULL,
  `car_AlloyWheels` varchar(255) DEFAULT NULL,
  `yad2_Category` varchar(255) DEFAULT NULL,
  `yad2_Product` varchar(255) DEFAULT NULL,
  `yad2_NameProduct` varchar(255) DEFAULT NULL,
  `yad2_SubCategory` varchar(255) DEFAULT NULL,
  `yad2_Maker` varchar(255) DEFAULT NULL,
  `Yad2_Status` varchar(255) DEFAULT NULL,
  `Yad2_AcceptTrade` varchar(255) DEFAULT NULL,
  `anim_Age` varchar(255) DEFAULT NULL,
  `anim_Gender` varchar(255) DEFAULT NULL,
  `anim_Breed` varchar(255) DEFAULT NULL,
  `AD_Pictures` text,
  `AD_Thumbs` text,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `imagesp`
--

DROP TABLE IF EXISTS `imagesp`;
CREATE TABLE IF NOT EXISTS `imagesp` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Key` varchar(255) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `Ad_Site` int(11) DEFAULT NULL,
  `Ad_Section` int(11) DEFAULT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  `AD_import` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `AD_import` (`AD_import`),
  KEY `Foreign_key` (`AD_Key`,`Ad_Site`,`Ad_Section`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Motocasion_Images`
--

DROP TABLE IF EXISTS `Motocasion_Images`;
CREATE TABLE IF NOT EXISTS `Motocasion_Images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Key` int(11) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `Ad_Site` int(11) DEFAULT NULL,
  `Ad_Section` int(11) DEFAULT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `ImageName` varchar(500) DEFAULT NULL,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `AD_Key` (`AD_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Motocasion_Links`
--

DROP TABLE IF EXISTS `Motocasion_Links`;
CREATE TABLE IF NOT EXISTS `Motocasion_Links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Region` text NOT NULL,
  `link_status` varchar(32) NOT NULL DEFAULT 'new',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Motocasion_Links_All`
--

DROP TABLE IF EXISTS `Motocasion_Links_All`;
CREATE TABLE IF NOT EXISTS `Motocasion_Links_All` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Region` text NOT NULL,
  `link_status` tinyint(4) NOT NULL DEFAULT '0',
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Motocasion_Provinces`
--

DROP TABLE IF EXISTS `Motocasion_Provinces`;
CREATE TABLE IF NOT EXISTS `Motocasion_Provinces` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(128) NOT NULL,
  `province_link` text NOT NULL,
  `province_status` varchar(32) NOT NULL DEFAULT 'new',
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Motocasion_Provinces_All`
--

DROP TABLE IF EXISTS `Motocasion_Provinces_All`;
CREATE TABLE IF NOT EXISTS `Motocasion_Provinces_All` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(128) NOT NULL,
  `province_link` text NOT NULL,
  `province_status` varchar(32) NOT NULL DEFAULT 'new',
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Motocasion_Temp_Ads`
--

DROP TABLE IF EXISTS `Motocasion_Temp_Ads`;
CREATE TABLE IF NOT EXISTS `Motocasion_Temp_Ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) DEFAULT NULL,
  `AD_Section` int(11) DEFAULT NULL,
  `AD_KEY` int(11) DEFAULT NULL,
  `Ad_Link` varchar(255) DEFAULT NULL,
  `AD_Phone1` varchar(255) DEFAULT NULL,
  `AD_Phone2` varchar(255) DEFAULT NULL,
  `AD_ContactName1` varchar(255) DEFAULT NULL,
  `AD_ContactName2` varchar(255) DEFAULT NULL,
  `AD_ContactEmail` varchar(255) DEFAULT NULL,
  `AD_UpdateDate` varchar(255) DEFAULT NULL,
  `AD_Region` varchar(255) DEFAULT NULL,
  `AD_Area` varchar(255) DEFAULT NULL,
  `AD_City` varchar(255) DEFAULT NULL,
  `AD_Address` varchar(255) DEFAULT NULL,
  `AD_Price` varchar(255) DEFAULT NULL,
  `AD_Notes` varchar(255) DEFAULT NULL,
  `app_MoveInDate` varchar(255) DEFAULT NULL,
  `app_Neighborhood` varchar(255) DEFAULT NULL,
  `app_meter` varchar(255) DEFAULT NULL,
  `app_PropertyTypeIndex` varchar(255) DEFAULT NULL,
  `app_Rooms` varchar(255) DEFAULT NULL,
  `app_Floor` varchar(255) DEFAULT NULL,
  `app_FloorTotal` varchar(255) DEFAULT NULL,
  `app_Furniture` varchar(255) DEFAULT NULL,
  `app_FurnitureIndex` varchar(255) DEFAULT NULL,
  `app_FlatMatesCount` varchar(255) DEFAULT NULL,
  `app_RequiredGenderIndex` varchar(255) DEFAULT NULL,
  `app_BarsIndex` varchar(255) DEFAULT NULL,
  `app_LiftIndex` varchar(255) DEFAULT NULL,
  `app_AirConIndex` varchar(255) DEFAULT NULL,
  `app_storeroom` varchar(255) DEFAULT NULL,
  `app_ParkingIndex` varchar(255) DEFAULT NULL,
  `app_BalconyIndex` varchar(255) DEFAULT NULL,
  `app_BalconeCount` varchar(255) DEFAULT NULL,
  `app_SmokingIndex` varchar(255) DEFAULT NULL,
  `app_RenovatedIndex` varchar(255) DEFAULT NULL,
  `app_AirDirection` varchar(255) DEFAULT NULL,
  `app_Status` varchar(255) DEFAULT NULL,
  `app_RentTime` varchar(255) DEFAULT NULL,
  `app_Partners` varchar(255) DEFAULT NULL,
  `app_Animal` varchar(255) DEFAULT NULL,
  `app_handicapped` varchar(255) DEFAULT NULL,
  `app_SunBalcone` varchar(255) DEFAULT NULL,
  `app_ExtendOption` varchar(255) DEFAULT NULL,
  `car_Maker` varchar(255) DEFAULT NULL,
  `car_Model` varchar(255) DEFAULT NULL,
  `car_SubModel` varchar(255) DEFAULT NULL,
  `car_Color` varchar(255) DEFAULT NULL,
  `car_Engine` varchar(255) DEFAULT NULL,
  `car_Hand` varchar(255) DEFAULT NULL,
  `car_Year` varchar(255) DEFAULT NULL,
  `car_gear` varchar(255) DEFAULT NULL,
  `car_owner` varchar(255) DEFAULT NULL,
  `car_PreviousOwner` varchar(255) DEFAULT NULL,
  `car_Doors` varchar(255) DEFAULT NULL,
  `car_km` varchar(255) DEFAULT NULL,
  `car_Addition` varchar(255) DEFAULT NULL,
  `car_AirCon` varchar(255) DEFAULT NULL,
  `car_Volume` varchar(255) DEFAULT NULL,
  `car_AcceptTrade` varchar(255) DEFAULT NULL,
  `car_ElectricWindows` varchar(255) DEFAULT NULL,
  `car_GPS` varchar(255) DEFAULT NULL,
  `car_DVD` varchar(255) DEFAULT NULL,
  `car_ABS` varchar(255) DEFAULT NULL,
  `car_Sunroof` varchar(255) DEFAULT NULL,
  `car_Airbags` varchar(255) DEFAULT NULL,
  `car_AlloyWheels` varchar(255) DEFAULT NULL,
  `yad2_Category` varchar(255) DEFAULT NULL,
  `yad2_Product` varchar(255) DEFAULT NULL,
  `yad2_NameProduct` varchar(255) DEFAULT NULL,
  `yad2_SubCategory` varchar(255) DEFAULT NULL,
  `yad2_Maker` varchar(255) DEFAULT NULL,
  `Yad2_Status` varchar(255) DEFAULT NULL,
  `Yad2_AcceptTrade` varchar(255) DEFAULT NULL,
  `anim_Age` varchar(255) DEFAULT NULL,
  `anim_Gender` varchar(255) DEFAULT NULL,
  `anim_Breed` varchar(255) DEFAULT NULL,
  `AD_Pictures` text,
  `AD_Thumbs` text,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Pisos_Cities`
--

DROP TABLE IF EXISTS `Pisos_Cities`;
CREATE TABLE IF NOT EXISTS `Pisos_Cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `city_name` varchar(128) NOT NULL,
  `city_link` text NOT NULL,
  `city_status` varchar(32) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Pisos_Images`
--

DROP TABLE IF EXISTS `Pisos_Images`;
CREATE TABLE IF NOT EXISTS `Pisos_Images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Key` varchar(256) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `Ad_Site` int(11) DEFAULT NULL,
  `Ad_Section` int(11) DEFAULT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Pisos_Links`
--

DROP TABLE IF EXISTS `Pisos_Links`;
CREATE TABLE IF NOT EXISTS `Pisos_Links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `link_status` varchar(32) NOT NULL,
  `TargetPage` varchar(32) DEFAULT NULL,
  `TargetLink` text,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Pisos_Links_All`
--

DROP TABLE IF EXISTS `Pisos_Links_All`;
CREATE TABLE IF NOT EXISTS `Pisos_Links_All` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `link_status` varchar(32) NOT NULL,
  `TargetPage` varchar(32) DEFAULT NULL,
  `TargetLink` text,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Pisos_Provinces`
--

DROP TABLE IF EXISTS `Pisos_Provinces`;
CREATE TABLE IF NOT EXISTS `Pisos_Provinces` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(128) NOT NULL,
  `province_link` text NOT NULL,
  `province_status` varchar(32) NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Pisos_Temp_Ads`
--

DROP TABLE IF EXISTS `Pisos_Temp_Ads`;
CREATE TABLE IF NOT EXISTS `Pisos_Temp_Ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) DEFAULT NULL,
  `AD_Section` int(11) DEFAULT NULL,
  `AD_KEY` varchar(256) DEFAULT NULL,
  `Ad_Link` varchar(255) DEFAULT NULL,
  `AD_Phone1` varchar(255) DEFAULT NULL,
  `AD_Phone2` varchar(255) DEFAULT NULL,
  `AD_ContactName1` varchar(255) DEFAULT NULL,
  `AD_ContactName2` varchar(255) DEFAULT NULL,
  `AD_ContactEmail` varchar(255) DEFAULT NULL,
  `AD_UpdateDate` varchar(255) DEFAULT NULL,
  `AD_Region` varchar(255) DEFAULT NULL,
  `AD_Area` varchar(255) DEFAULT NULL,
  `AD_City` varchar(255) DEFAULT NULL,
  `AD_Address` varchar(255) DEFAULT NULL,
  `AD_Price` varchar(255) DEFAULT NULL,
  `AD_Notes` varchar(255) DEFAULT NULL,
  `app_MoveInDate` varchar(255) DEFAULT NULL,
  `app_Neighborhood` varchar(255) DEFAULT NULL,
  `app_meter` varchar(255) DEFAULT NULL,
  `app_PropertyTypeIndex` varchar(255) DEFAULT NULL,
  `app_Rooms` varchar(255) DEFAULT NULL,
  `app_Floor` varchar(255) DEFAULT NULL,
  `app_FloorTotal` varchar(255) DEFAULT NULL,
  `app_Furniture` varchar(255) DEFAULT NULL,
  `app_FurnitureIndex` varchar(255) DEFAULT NULL,
  `app_FlatMatesCount` varchar(255) DEFAULT NULL,
  `app_RequiredGenderIndex` varchar(255) DEFAULT NULL,
  `app_BarsIndex` varchar(255) DEFAULT NULL,
  `app_LiftIndex` varchar(255) DEFAULT NULL,
  `app_AirConIndex` varchar(255) DEFAULT NULL,
  `app_storeroom` varchar(255) DEFAULT NULL,
  `app_ParkingIndex` varchar(255) DEFAULT NULL,
  `app_BalconyIndex` varchar(255) DEFAULT NULL,
  `app_BalconeCount` varchar(255) DEFAULT NULL,
  `app_SmokingIndex` varchar(255) DEFAULT NULL,
  `app_RenovatedIndex` varchar(255) DEFAULT NULL,
  `app_AirDirection` varchar(255) DEFAULT NULL,
  `app_Status` varchar(255) DEFAULT NULL,
  `app_RentTime` varchar(255) DEFAULT NULL,
  `app_Partners` varchar(255) DEFAULT NULL,
  `app_Animal` varchar(255) DEFAULT NULL,
  `app_handicapped` varchar(255) DEFAULT NULL,
  `app_SunBalcone` varchar(255) DEFAULT NULL,
  `app_ExtendOption` varchar(255) DEFAULT NULL,
  `car_Maker` varchar(255) DEFAULT NULL,
  `car_Model` varchar(255) DEFAULT NULL,
  `car_SubModel` varchar(255) DEFAULT NULL,
  `car_Color` varchar(255) DEFAULT NULL,
  `car_Engine` varchar(255) DEFAULT NULL,
  `car_Hand` varchar(255) DEFAULT NULL,
  `car_Year` varchar(255) DEFAULT NULL,
  `car_gear` varchar(255) DEFAULT NULL,
  `car_owner` varchar(255) DEFAULT NULL,
  `car_PreviousOwner` varchar(255) DEFAULT NULL,
  `car_Doors` varchar(255) DEFAULT NULL,
  `car_km` varchar(255) DEFAULT NULL,
  `car_Addition` varchar(255) DEFAULT NULL,
  `car_AirCon` varchar(255) DEFAULT NULL,
  `car_Volume` varchar(255) DEFAULT NULL,
  `car_AcceptTrade` varchar(255) DEFAULT NULL,
  `car_ElectricWindows` varchar(255) DEFAULT NULL,
  `car_GPS` varchar(255) DEFAULT NULL,
  `car_DVD` varchar(255) DEFAULT NULL,
  `car_ABS` varchar(255) DEFAULT NULL,
  `car_Sunroof` varchar(255) DEFAULT NULL,
  `car_Airbags` varchar(255) DEFAULT NULL,
  `car_AlloyWheels` varchar(255) DEFAULT NULL,
  `yad2_Category` varchar(255) DEFAULT NULL,
  `yad2_Product` varchar(255) DEFAULT NULL,
  `yad2_NameProduct` varchar(255) DEFAULT NULL,
  `yad2_SubCategory` varchar(255) DEFAULT NULL,
  `yad2_Maker` varchar(255) DEFAULT NULL,
  `Yad2_Status` varchar(255) DEFAULT NULL,
  `Yad2_AcceptTrade` varchar(255) DEFAULT NULL,
  `anim_Age` varchar(255) DEFAULT NULL,
  `anim_Gender` varchar(255) DEFAULT NULL,
  `anim_Breed` varchar(255) DEFAULT NULL,
  `AD_Pictures` text,
  `AD_Thumbs` text,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Portae_Cities`
--

DROP TABLE IF EXISTS `Portae_Cities`;
CREATE TABLE IF NOT EXISTS `Portae_Cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` tinytext NOT NULL,
  `city_name` tinytext NOT NULL,
  `city_link` text NOT NULL,
  `city_status` varchar(32) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Portae_Images`
--

DROP TABLE IF EXISTS `Portae_Images`;
CREATE TABLE IF NOT EXISTS `Portae_Images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Key` varchar(256) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `Ad_Site` int(11) DEFAULT NULL,
  `Ad_Section` int(11) DEFAULT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `AD_Key` (`AD_Key`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Portae_Links`
--

DROP TABLE IF EXISTS `Portae_Links`;
CREATE TABLE IF NOT EXISTS `Portae_Links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Region` text NOT NULL,
  `AD_Area` text NOT NULL,
  `AD_City` text NOT NULL,
  `link_status` varchar(32) NOT NULL,
  `link_date` date NOT NULL,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Portae_Links_All`
--

DROP TABLE IF EXISTS `Portae_Links_All`;
CREATE TABLE IF NOT EXISTS `Portae_Links_All` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `AD_Region` text NOT NULL,
  `AD_Area` text NOT NULL,
  `AD_City` text NOT NULL,
  `link_status` varchar(32) NOT NULL,
  `link_date` date NOT NULL,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Portae_Temp_Ads`
--

DROP TABLE IF EXISTS `Portae_Temp_Ads`;
CREATE TABLE IF NOT EXISTS `Portae_Temp_Ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) DEFAULT NULL,
  `AD_Section` int(11) DEFAULT NULL,
  `AD_KEY` int(11) DEFAULT NULL,
  `Ad_Link` varchar(255) DEFAULT NULL,
  `AD_Phone1` varchar(255) DEFAULT NULL,
  `AD_Phone2` varchar(255) DEFAULT NULL,
  `AD_ContactName1` varchar(255) DEFAULT NULL,
  `AD_ContactName2` varchar(255) DEFAULT NULL,
  `AD_ContactEmail` varchar(255) DEFAULT NULL,
  `AD_UpdateDate` varchar(255) DEFAULT NULL,
  `AD_Region` varchar(255) DEFAULT NULL,
  `AD_Area` varchar(255) DEFAULT NULL,
  `AD_City` varchar(255) DEFAULT NULL,
  `AD_Address` varchar(255) DEFAULT NULL,
  `AD_Price` varchar(255) DEFAULT NULL,
  `AD_Notes` varchar(255) DEFAULT NULL,
  `app_MoveInDate` varchar(255) DEFAULT NULL,
  `app_Neighborhood` varchar(255) DEFAULT NULL,
  `app_meter` varchar(255) DEFAULT NULL,
  `app_PropertyTypeIndex` varchar(255) DEFAULT NULL,
  `app_Rooms` varchar(255) DEFAULT NULL,
  `app_Floor` varchar(255) DEFAULT NULL,
  `app_FloorTotal` varchar(255) DEFAULT NULL,
  `app_Furniture` varchar(255) DEFAULT NULL,
  `app_FurnitureIndex` varchar(255) DEFAULT NULL,
  `app_FlatMatesCount` varchar(255) DEFAULT NULL,
  `app_RequiredGenderIndex` varchar(255) DEFAULT NULL,
  `app_BarsIndex` varchar(255) DEFAULT NULL,
  `app_LiftIndex` varchar(255) DEFAULT NULL,
  `app_AirConIndex` varchar(255) DEFAULT NULL,
  `app_storeroom` varchar(255) DEFAULT NULL,
  `app_ParkingIndex` varchar(255) DEFAULT NULL,
  `app_BalconyIndex` varchar(255) DEFAULT NULL,
  `app_BalconeCount` varchar(255) DEFAULT NULL,
  `app_SmokingIndex` varchar(255) DEFAULT NULL,
  `app_RenovatedIndex` varchar(255) DEFAULT NULL,
  `app_AirDirection` varchar(255) DEFAULT NULL,
  `app_Status` varchar(255) DEFAULT NULL,
  `app_RentTime` varchar(255) DEFAULT NULL,
  `app_Partners` varchar(255) DEFAULT NULL,
  `app_Animal` varchar(255) DEFAULT NULL,
  `app_handicapped` varchar(255) DEFAULT NULL,
  `app_SunBalcone` varchar(255) DEFAULT NULL,
  `app_ExtendOption` varchar(255) DEFAULT NULL,
  `car_Maker` varchar(255) DEFAULT NULL,
  `car_Model` varchar(255) DEFAULT NULL,
  `car_SubModel` varchar(255) DEFAULT NULL,
  `car_Color` varchar(255) DEFAULT NULL,
  `car_Engine` varchar(255) DEFAULT NULL,
  `car_Hand` varchar(255) DEFAULT NULL,
  `car_Year` varchar(255) DEFAULT NULL,
  `car_gear` varchar(255) DEFAULT NULL,
  `car_owner` varchar(255) DEFAULT NULL,
  `car_PreviousOwner` varchar(255) DEFAULT NULL,
  `car_Doors` varchar(255) DEFAULT NULL,
  `car_km` varchar(255) DEFAULT NULL,
  `car_Addition` varchar(255) DEFAULT NULL,
  `car_AirCon` varchar(255) DEFAULT NULL,
  `car_Volume` varchar(255) DEFAULT NULL,
  `car_AcceptTrade` varchar(255) DEFAULT NULL,
  `car_ElectricWindows` varchar(255) DEFAULT NULL,
  `car_GPS` varchar(255) DEFAULT NULL,
  `car_DVD` varchar(255) DEFAULT NULL,
  `car_ABS` varchar(255) DEFAULT NULL,
  `car_Sunroof` varchar(255) DEFAULT NULL,
  `car_Airbags` varchar(255) DEFAULT NULL,
  `car_AlloyWheels` varchar(255) DEFAULT NULL,
  `yad2_Category` varchar(255) DEFAULT NULL,
  `yad2_Product` varchar(255) DEFAULT NULL,
  `yad2_NameProduct` varchar(255) DEFAULT NULL,
  `yad2_SubCategory` varchar(255) DEFAULT NULL,
  `yad2_Maker` varchar(255) DEFAULT NULL,
  `Yad2_Status` varchar(255) DEFAULT NULL,
  `Yad2_AcceptTrade` varchar(255) DEFAULT NULL,
  `anim_Age` varchar(255) DEFAULT NULL,
  `anim_Gender` varchar(255) DEFAULT NULL,
  `anim_Breed` varchar(255) DEFAULT NULL,
  `AD_Pictures` text,
  `AD_Thumbs` text,
  `AD_md5` varchar(50) NOT NULL,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Proxy_List`
--

DROP TABLE IF EXISTS `Proxy_List`;
CREATE TABLE IF NOT EXISTS `Proxy_List` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` text NOT NULL,
  `port` text NOT NULL,
  `proxy_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sitesp`
--

DROP TABLE IF EXISTS `sitesp`;
CREATE TABLE IF NOT EXISTS `sitesp` (
  `Site_Id` int(11) NOT NULL DEFAULT '0',
  `Site_Name` varchar(255) DEFAULT NULL,
  `Site_Link` text NOT NULL,
  `Site_Enabled` tinyint(1) NOT NULL DEFAULT '0',
  `Site_Crawling` tinyint(1) NOT NULL DEFAULT '0',
  `Site_Imported` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Site_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `stat`
--

DROP TABLE IF EXISTS `stat`;
CREATE TABLE IF NOT EXISTS `stat` (
  `OP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OP_Site` bigint(20) NOT NULL,
  `OP_Datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OP_New` bigint(20) DEFAULT NULL,
  `OP_Upd` bigint(20) DEFAULT NULL,
  `OP_Img` bigint(20) DEFAULT NULL,
  `OP_Type` char(1) NOT NULL,
  PRIMARY KEY (`OP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) NOT NULL,
  `pwd` varchar(256) NOT NULL,
  `group` varchar(256) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `variables`
--

DROP TABLE IF EXISTS `variables`;
CREATE TABLE IF NOT EXISTS `variables` (
  `name` varchar(256) NOT NULL,
  `value` text NOT NULL,
  KEY `name` (`name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Ventadepisos_Images`
--

DROP TABLE IF EXISTS `Ventadepisos_Images`;
CREATE TABLE IF NOT EXISTS `Ventadepisos_Images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Key` int(11) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `Ad_Site` int(11) DEFAULT NULL,
  `Ad_Section` int(11) DEFAULT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `AD_Key` (`AD_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Ventadepisos_Links`
--

DROP TABLE IF EXISTS `Ventadepisos_Links`;
CREATE TABLE IF NOT EXISTS `Ventadepisos_Links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `link_status` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Ventadepisos_Links_All`
--

DROP TABLE IF EXISTS `Ventadepisos_Links_All`;
CREATE TABLE IF NOT EXISTS `Ventadepisos_Links_All` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `link_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Ventadepisos_Temp_Ads`
--

DROP TABLE IF EXISTS `Ventadepisos_Temp_Ads`;
CREATE TABLE IF NOT EXISTS `Ventadepisos_Temp_Ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) DEFAULT NULL,
  `AD_Section` int(11) DEFAULT NULL,
  `AD_KEY` int(11) DEFAULT NULL,
  `Ad_Link` varchar(255) DEFAULT NULL,
  `AD_Phone1` varchar(255) DEFAULT NULL,
  `AD_Phone2` varchar(255) DEFAULT NULL,
  `AD_ContactName1` varchar(255) DEFAULT NULL,
  `AD_ContactName2` varchar(255) DEFAULT NULL,
  `AD_ContactEmail` varchar(255) DEFAULT NULL,
  `AD_UpdateDate` varchar(255) DEFAULT NULL,
  `AD_Region` varchar(255) DEFAULT NULL,
  `AD_Area` varchar(255) DEFAULT NULL,
  `AD_City` varchar(255) DEFAULT NULL,
  `AD_Address` varchar(255) DEFAULT NULL,
  `AD_Price` varchar(255) DEFAULT NULL,
  `AD_Notes` varchar(255) DEFAULT NULL,
  `app_MoveInDate` varchar(255) DEFAULT NULL,
  `app_Neighborhood` varchar(255) DEFAULT NULL,
  `app_meter` varchar(255) DEFAULT NULL,
  `app_PropertyTypeIndex` varchar(255) DEFAULT NULL,
  `app_Rooms` varchar(255) DEFAULT NULL,
  `app_Floor` varchar(255) DEFAULT NULL,
  `app_FloorTotal` varchar(255) DEFAULT NULL,
  `app_Furniture` varchar(255) DEFAULT NULL,
  `app_FurnitureIndex` varchar(255) DEFAULT NULL,
  `app_FlatMatesCount` varchar(255) DEFAULT NULL,
  `app_RequiredGenderIndex` varchar(255) DEFAULT NULL,
  `app_BarsIndex` varchar(255) DEFAULT NULL,
  `app_LiftIndex` varchar(255) DEFAULT NULL,
  `app_AirConIndex` varchar(255) DEFAULT NULL,
  `app_storeroom` varchar(255) DEFAULT NULL,
  `app_ParkingIndex` varchar(255) DEFAULT NULL,
  `app_BalconyIndex` varchar(255) DEFAULT NULL,
  `app_BalconeCount` varchar(255) DEFAULT NULL,
  `app_SmokingIndex` varchar(255) DEFAULT NULL,
  `app_RenovatedIndex` varchar(255) DEFAULT NULL,
  `app_AirDirection` varchar(255) DEFAULT NULL,
  `app_Status` varchar(255) DEFAULT NULL,
  `app_RentTime` varchar(255) DEFAULT NULL,
  `app_Partners` varchar(255) DEFAULT NULL,
  `app_Animal` varchar(255) DEFAULT NULL,
  `app_handicapped` varchar(255) DEFAULT NULL,
  `app_SunBalcone` varchar(255) DEFAULT NULL,
  `app_ExtendOption` varchar(255) DEFAULT NULL,
  `car_Maker` varchar(255) DEFAULT NULL,
  `car_Model` varchar(255) DEFAULT NULL,
  `car_SubModel` varchar(255) DEFAULT NULL,
  `car_Color` varchar(255) DEFAULT NULL,
  `car_Engine` varchar(255) DEFAULT NULL,
  `car_Hand` varchar(255) DEFAULT NULL,
  `car_Year` varchar(255) DEFAULT NULL,
  `car_gear` varchar(255) DEFAULT NULL,
  `car_owner` varchar(255) DEFAULT NULL,
  `car_PreviousOwner` varchar(255) DEFAULT NULL,
  `car_Doors` varchar(255) DEFAULT NULL,
  `car_km` varchar(255) DEFAULT NULL,
  `car_Addition` varchar(255) DEFAULT NULL,
  `car_AirCon` varchar(255) DEFAULT NULL,
  `car_Volume` varchar(255) DEFAULT NULL,
  `car_AcceptTrade` varchar(255) DEFAULT NULL,
  `car_ElectricWindows` varchar(255) DEFAULT NULL,
  `car_GPS` varchar(255) DEFAULT NULL,
  `car_DVD` varchar(255) DEFAULT NULL,
  `car_ABS` varchar(255) DEFAULT NULL,
  `car_Sunroof` varchar(255) DEFAULT NULL,
  `car_Airbags` varchar(255) DEFAULT NULL,
  `car_AlloyWheels` varchar(255) DEFAULT NULL,
  `yad2_Category` varchar(255) DEFAULT NULL,
  `yad2_Product` varchar(255) DEFAULT NULL,
  `yad2_NameProduct` varchar(255) DEFAULT NULL,
  `yad2_SubCategory` varchar(255) DEFAULT NULL,
  `yad2_Maker` varchar(255) DEFAULT NULL,
  `Yad2_Status` varchar(255) DEFAULT NULL,
  `Yad2_AcceptTrade` varchar(255) DEFAULT NULL,
  `anim_Age` varchar(255) DEFAULT NULL,
  `anim_Gender` varchar(255) DEFAULT NULL,
  `anim_Breed` varchar(255) DEFAULT NULL,
  `AD_Pictures` text,
  `AD_Thumbs` text,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Yaencontre_Images`
--

DROP TABLE IF EXISTS `Yaencontre_Images`;
CREATE TABLE IF NOT EXISTS `Yaencontre_Images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Key` varchar(128) NOT NULL,
  `cDate` datetime DEFAULT NULL,
  `Ad_Site` int(11) DEFAULT NULL,
  `Ad_Section` int(11) DEFAULT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `ImageName` varchar(50) DEFAULT NULL,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `AD_Key` (`AD_Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Yaencontre_Links`
--

DROP TABLE IF EXISTS `Yaencontre_Links`;
CREATE TABLE IF NOT EXISTS `Yaencontre_Links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `link_status` tinyint(1) NOT NULL DEFAULT '0',
  `TargetPage` varchar(32) DEFAULT NULL,
  `TargetLink` text,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Yaencontre_Links_All`
--

DROP TABLE IF EXISTS `Yaencontre_Links_All`;
CREATE TABLE IF NOT EXISTS `Yaencontre_Links_All` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` varchar(30) NOT NULL,
  `AD_Section` varchar(30) NOT NULL,
  `AD_Link` text NOT NULL,
  `link_status` tinyint(1) NOT NULL DEFAULT '0',
  `TargetPage` varchar(32) DEFAULT NULL,
  `TargetLink` text,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Yaencontre_Temp_Ads`
--

DROP TABLE IF EXISTS `Yaencontre_Temp_Ads`;
CREATE TABLE IF NOT EXISTS `Yaencontre_Temp_Ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AD_Site` int(11) DEFAULT NULL,
  `AD_Section` int(11) DEFAULT NULL,
  `AD_KEY` varchar(256) DEFAULT NULL,
  `Ad_Link` varchar(255) DEFAULT NULL,
  `AD_Phone1` varchar(255) DEFAULT NULL,
  `AD_Phone2` varchar(255) DEFAULT NULL,
  `AD_ContactName1` varchar(255) DEFAULT NULL,
  `AD_ContactName2` varchar(255) DEFAULT NULL,
  `AD_ContactEmail` varchar(255) DEFAULT NULL,
  `AD_UpdateDate` varchar(255) DEFAULT NULL,
  `AD_Region` varchar(255) DEFAULT NULL,
  `AD_Area` varchar(255) DEFAULT NULL,
  `AD_City` varchar(255) DEFAULT NULL,
  `AD_Address` varchar(255) DEFAULT NULL,
  `AD_Price` varchar(255) DEFAULT NULL,
  `AD_Notes` varchar(255) DEFAULT NULL,
  `app_MoveInDate` varchar(255) DEFAULT NULL,
  `app_Neighborhood` varchar(255) DEFAULT NULL,
  `app_meter` varchar(255) DEFAULT NULL,
  `app_PropertyTypeIndex` varchar(255) DEFAULT NULL,
  `app_Rooms` varchar(255) DEFAULT NULL,
  `app_Floor` varchar(255) DEFAULT NULL,
  `app_FloorTotal` varchar(255) DEFAULT NULL,
  `app_Furniture` varchar(255) DEFAULT NULL,
  `app_FurnitureIndex` varchar(255) DEFAULT NULL,
  `app_FlatMatesCount` varchar(255) DEFAULT NULL,
  `app_RequiredGenderIndex` varchar(255) DEFAULT NULL,
  `app_BarsIndex` varchar(255) DEFAULT NULL,
  `app_LiftIndex` varchar(255) DEFAULT NULL,
  `app_AirConIndex` varchar(255) DEFAULT NULL,
  `app_storeroom` varchar(255) DEFAULT NULL,
  `app_ParkingIndex` varchar(255) DEFAULT NULL,
  `app_BalconyIndex` varchar(255) DEFAULT NULL,
  `app_BalconeCount` varchar(255) DEFAULT NULL,
  `app_SmokingIndex` varchar(255) DEFAULT NULL,
  `app_RenovatedIndex` varchar(255) DEFAULT NULL,
  `app_AirDirection` varchar(255) DEFAULT NULL,
  `app_Status` varchar(255) DEFAULT NULL,
  `app_RentTime` varchar(255) DEFAULT NULL,
  `app_Partners` varchar(255) DEFAULT NULL,
  `app_Animal` varchar(255) DEFAULT NULL,
  `app_handicapped` varchar(255) DEFAULT NULL,
  `app_SunBalcone` varchar(255) DEFAULT NULL,
  `app_ExtendOption` varchar(255) DEFAULT NULL,
  `car_Maker` varchar(255) DEFAULT NULL,
  `car_Model` varchar(255) DEFAULT NULL,
  `car_SubModel` varchar(255) DEFAULT NULL,
  `car_Color` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_Engine` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_Hand` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_Year` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_gear` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_owner` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_PreviousOwner` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_Doors` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_km` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_Addition` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_AirCon` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_Volume` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_AcceptTrade` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_ElectricWindows` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_GPS` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_DVD` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_ABS` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_Sunroof` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_Airbags` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_AlloyWheels` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yad2_Category` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yad2_Product` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yad2_NameProduct` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yad2_SubCategory` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `yad2_Maker` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Yad2_Status` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Yad2_AcceptTrade` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `anim_Age` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `anim_Gender` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `anim_Breed` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `AD_Pictures` text CHARACTER SET latin1,
  `AD_Thumbs` text CHARACTER SET latin1,
  `AD_status` tinyint(1) NOT NULL DEFAULT '0',
  `AD_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AD_md5` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AD_md5` (`AD_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

