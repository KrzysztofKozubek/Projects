-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2015 at 11:52 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `givememybike`
--

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `NewsletterID` int(11) NOT NULL AUTO_INCREMENT,
  `NewsletterUserID` int(11) NOT NULL,
  PRIMARY KEY (`NewsletterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderUniqueName` varchar(255) NOT NULL,
  `OrderUserID` int(11) NOT NULL,
  `OrderPlaceID` int(11) NOT NULL,
  `OrderBikeType` varchar(255) NOT NULL,
  `OrderServiceType` varchar(255) NOT NULL,
  `OrderDateStart` varchar(255) NOT NULL,
  `OrderDateEnd` varchar(255) DEFAULT NULL,
  `OrderPreferences` text,
  `OrderOtherUser` tinyint(1) NOT NULL,
  `OrderOtherUserID` text,
  `OrderIsRated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `OrderUniqueName`, `OrderUserID`, `OrderPlaceID`, `OrderBikeType`, `OrderServiceType`, `OrderDateStart`, `OrderDateEnd`, `OrderPreferences`, `OrderOtherUser`, `OrderOtherUserID`, `OrderIsRated`) VALUES
(5, 'MTOF_4/1899', 1, 4, 'szosowy', 'rezerwacja długoterminowa', '15.11.2015 20:43', '27.11.2015 20:43', 'Koszyk zakupowy,Bidon,Zapasowa pompka', 0, 'undefined', 1),
(6, 'MTOF_4/1496', 1, 4, 'szosowy', 'rezerwacja długoterminowa', '15.11.2015 20:43', '27.11.2015 20:43', 'Koszyk zakupowy,Bidon,Zapasowa pompka', 0, 'undefined', NULL),
(7, 'MTOF_5/1408', 1, 5, 'miejski', 'wypożyczenie', '15.11.2015 20:52', '15.11.2015 20:52', 'Bidon,Zapasowa pompka', 1, 'dads adsdas<br>ad2@22<brdasdas<br>dasdsa, undefined', NULL),
(9, 'MTOF_5/1813', 1, 5, 'MTB', 'rezerwacja długoterminowa', '16.11.2015 18:44', '16.11.2015 18:44', 'Bidon,Zapasowa pompka', 1, 'undefined undefined<br>undefined<brundefined<br>undefined, undefined', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentUserID` int(11) NOT NULL,
  `PaymentType` tinyint(4) NOT NULL,
  `PaymentAmount` varchar(255) NOT NULL,
  `PaymentDate` datetime NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `PaymentUserID` (`PaymentUserID`),
  KEY `PaymentUserID_2` (`PaymentUserID`),
  KEY `PaymentUserID_3` (`PaymentUserID`),
  KEY `paymentIndex` (`PaymentUserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `PaymentUserID`, `PaymentType`, `PaymentAmount`, `PaymentDate`) VALUES
(3, 1, 1, '25', '2015-11-12 15:07:39'),
(4, 1, 1, '15', '2015-11-12 15:22:33'),
(5, 2, 3, '-12', '2015-11-12 00:00:00'),
(6, 1, 1, '25', '2015-11-12 15:46:21'),
(7, 1, 2, '2', '2015-11-16 19:02:09'),
(8, 1, 1, '1', '2015-11-16 19:56:01');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE IF NOT EXISTS `place` (
  `PlaceID` int(11) NOT NULL AUTO_INCREMENT,
  `PlaceName` varchar(255) NOT NULL,
  `PlaceAddress` varchar(255) NOT NULL,
  `PlaceZipcode` varchar(255) NOT NULL,
  `PlaceCity` varchar(255) NOT NULL,
  `PlaceCoordinates` varchar(255) NOT NULL,
  `PlaceRating` tinyint(4) NOT NULL DEFAULT '5',
  `PlaceEmail` varchar(255) NOT NULL,
  PRIMARY KEY (`PlaceID`),
  UNIQUE KEY `PlaceName` (`PlaceName`,`PlaceCoordinates`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`PlaceID`, `PlaceName`, `PlaceAddress`, `PlaceZipcode`, `PlaceCity`, `PlaceCoordinates`, `PlaceRating`, `PlaceEmail`) VALUES
(1, 'Placówka#1', 'Kobierzyńska 68', '30-384', 'Kraków', '50.028989;19.919004', 5, 'krakow@email.com'),
(3, 'Placówka#2', 'Stary Rynek 73', '61-772', 'Poznań', '52.406374;16.925168', 5, 'poznan@email.com'),
(4, 'Placówka#3', 'Nowogrodzka 25', '00-511', 'Warszawa', '52.229176;21.014569', 5, 'warszawa@email.com'),
(5, 'Placówka#4', 'Młyńska 15', '80-846', 'Gdańsk', '54.353324;18.649835', 5, 'gdansk@email.com'),
(6, 'Placówka#5', 'Piotrkowska 79', '93-034', 'Łódź', '51.767132;19.45648', 5, 'lodz@email.com'),
(9, 'Placówka#6', 'Dionizego Czachowskiego 44', '26-600', 'Radom', '51.398930;21.167363', 5, 'radom@email.com'),
(10, 'Placówka#7', '3 Maja 7', '35-030', 'Rzeszów', '50.037016;22.001717', 5, 'rzeszow@email.com'),
(11, 'Placówka#8', 'Świętego Marka 27', '31-024', 'Kraków', '50.063018;19.94212', 5, 'krakow@email.com'),
(12, 'Placówka#9', 'Rakowicka 17', '31-511', 'Kraków', '50.066734;19.952143', 5, 'krakow@email.com'),
(13, 'Placówka#10', 'Floriańska 26', '31-000', 'Kraków', '50.063502;19.94005', 5, 'krakow@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `stars`
--

CREATE TABLE IF NOT EXISTS `stars` (
  `StarsID` int(11) NOT NULL AUTO_INCREMENT,
  `StarsPlaceID` int(11) NOT NULL,
  `StarsUserID` int(11) NOT NULL,
  `StarsAmount` tinyint(4) NOT NULL,
  `StarsDesc` text NOT NULL,
  `StarsOrderID` int(11) NOT NULL,
  PRIMARY KEY (`StarsID`),
  UNIQUE KEY `StarsOrderID` (`StarsOrderID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `stars`
--

INSERT INTO `stars` (`StarsID`, `StarsPlaceID`, `StarsUserID`, `StarsAmount`, `StarsDesc`, `StarsOrderID`) VALUES
(7, 4, 1, 3, 'Całkiem spoko!', 5);

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE IF NOT EXISTS `trip` (
  `TripID` int(11) NOT NULL AUTO_INCREMENT,
  `TripName` varchar(255) NOT NULL,
  `TripDateStart` timestamp NOT NULL,
  `TripDateEnd` timestamp NOT NULL,
  `TripStartPoint` varchar(255) NOT NULL,
  `TripEndPoint` varchar(255) NOT NULL,
  `TripDescription` text NOT NULL,
  `TripAuthor` int(11) NOT NULL,
  PRIMARY KEY (`TripID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`TripID`, `TripName`, `TripDateStart`, `TripDateEnd`, `TripStartPoint`, `TripEndPoint`, `TripDescription`, `TripAuthor`) VALUES
(1, 'Wycieczka testowa #1', '2015-11-16 12:37:29', '2015-11-16 12:37:29', 'Kraków, pętla Czerwone Maki', 'Kraków, pętla Kurdwanów', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tempor turpis eros, vitae ullamcorper mauris condimentum et. Suspendisse ultricies elementum tincidunt. Donec dui lacus, efficitur in ipsum sit amet, ultrices suscipit nulla. Proin sodales odio enim, ac eleifend velit porta ut. Aenean at mi orci. Aliquam in ligula non velit accumsan imperdiet sit amet non arcu. Duis eu nisl malesuada purus scelerisque rhoncus.', 1),
(2, 'Wycieczka testowa #2', '2016-07-14 05:00:00', '2016-07-14 11:00:00', 'Kraków, Port Lotniczy Balice', 'Kraków, Rynek Główny', 'Pellentesque sed odio sit amet libero finibus vehicula. Curabitur lorem tellus, eleifend ac tincidunt ut, varius eu justo. Morbi lacinia felis vitae sem luctus, at sagittis dui sagittis. Sed quis laoreet odio, sit amet elementum magna. Praesent vel nisl sed mi tincidunt imperdiet. Duis condimentum, mauris eget interdum sollicitudin, sem neque lobortis purus, vel sagittis justo ante nec nisi. Nullam condimentum suscipit lorem. Pellentesque molestie at velit ut sodales.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trip_member`
--

CREATE TABLE IF NOT EXISTS `trip_member` (
  `Trip_memberID` int(11) NOT NULL AUTO_INCREMENT,
  `MemberID` int(11) NOT NULL,
  `TripID` int(11) NOT NULL,
  PRIMARY KEY (`Trip_memberID`),
  KEY `TipID` (`TripID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `trip_member`
--

INSERT INTO `trip_member` (`Trip_memberID`, `MemberID`, `TripID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 2),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) NOT NULL,
  `UserSurname` varchar(255) NOT NULL,
  `UserPassword` varchar(255) NOT NULL,
  `UserPhone` varchar(255) NOT NULL,
  `UserEmail` varchar(255) NOT NULL,
  `UserAddress` varchar(255) NOT NULL,
  `UserZipCity` varchar(255) NOT NULL,
  `userMoney` varchar(128) DEFAULT '0',
  `UserPermission` tinyint(4) NOT NULL,
  `UserAuth` tinyint(4) NOT NULL,
  `UserAuthKey` varchar(255) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserPhone` (`UserPhone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `UserName`, `UserSurname`, `UserPassword`, `UserPhone`, `UserEmail`, `UserAddress`, `UserZipCity`, `userMoney`, `UserPermission`, `UserAuth`, `UserAuthKey`) VALUES
(1, 'Marcin', 'Tofilski', 'eBPVRYKrlyLLpCDMeyCljmXYbpRGNZrCPu928VDAfrk=', '+48724045063', 'mtofilski@gmail.com', 'asdasd', 'asdasddsad', '120', 1, 1, ''),
(6, 'Janek', 'Kowalski', 'tEZwP03UEKBpjYqjvr8PZSB6zH9qThXLqb5i12WaCys=', '724045063', 'mtofilski@tlen.pl', 'Sanowa 6', '20-200 Kraków', '0', 2, 1, 'bHSwo2Msm2aDefL4h1FKBlNlIc6qbAMaeSg81z41yQU=');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
