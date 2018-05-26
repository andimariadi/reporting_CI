-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2018 at 10:17 AM
-- Server version: 5.5.39
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `reporting`
--

-- --------------------------------------------------------

--
-- Table structure for table `bandwith`
--

CREATE TABLE IF NOT EXISTS `bandwith` (
`id` int(100) NOT NULL,
  `id_unit` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `receive` int(20) NOT NULL,
  `sent` int(20) NOT NULL,
  `snr_rx` int(11) NOT NULL,
  `snr_tx` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `bandwith`
--

INSERT INTO `bandwith` (`id`, `id_unit`, `date`, `time`, `receive`, `sent`, `snr_rx`, `snr_tx`) VALUES
(1, 'PT 02', '2018-05-25', '15:27:31', 41470, 3428, 25, 25),
(2, 'PT 28', '2018-05-25', '15:27:38', 54223, 4482, 34, 28),
(3, 'PT 15', '2018-05-25', '15:27:44', 65690, 5430, 41, 36),
(4, 'MTL J5', '2018-05-25', '15:27:51', 52290, 4322, 34, 26),
(5, 'PT 29', '2018-05-25', '15:27:57', 52588, 4346, 31, 29);

-- --------------------------------------------------------

--
-- Table structure for table `device_report`
--

CREATE TABLE IF NOT EXISTS `device_report` (
`id` int(2) NOT NULL,
  `name_device` varchar(25) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `device_report`
--

INSERT INTO `device_report` (`id`, `name_device`) VALUES
(1, 'Jigsaw'),
(2, 'Network');

-- --------------------------------------------------------

--
-- Table structure for table `enum`
--

CREATE TABLE IF NOT EXISTS `enum` (
`IdEnum` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(25) NOT NULL,
  `refid` int(5) NOT NULL,
  `IdDevice` int(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=215 ;

--
-- Dumping data for table `enum`
--

INSERT INTO `enum` (`IdEnum`, `name`, `type`, `refid`, `IdDevice`) VALUES
(1, 'Dump Truck', 'unit', 0, 1),
(2, 'Shovel', 'unit', 0, 1),
(3, 'Exavator', 'unit', 0, 1),
(4, 'Portable Network', 'unit', 0, 2),
(5, 'Hitachi EH1700', 'type_unit', 0, 1),
(6, 'Komatsu HD785-5', 'type_unit', 0, 1),
(7, 'Komatsu HD785-7', 'type_unit', 0, 1),
(8, 'Caterpillar CAT777D', 'type_unit', 0, 1),
(9, 'Caterpillar CAT785C', 'type_unit', 0, 1),
(10, 'Komatsu HD15005', 'type_unit', 0, 1),
(11, 'Caterpillar CAT789C', 'type_unit', 0, 1),
(12, 'Hitachi EH3500', 'type_unit', 0, 1),
(13, 'Liebherr R9350', 'type_unit', 0, 1),
(14, 'Hitachi EX3600', 'type_unit', 0, 1),
(15, 'SH4000', 'type_unit', 0, 1),
(16, 'Unknown', 'type_unit', 0, 1),
(17, 'Komatsu PC2000-8', 'type_unit', 0, 1),
(18, 'Hitachi EX2500', 'type_unit', 0, 1),
(19, 'Liebherr R9250', 'type_unit', 0, 1),
(20, 'Liebherr R9200', 'type_unit', 0, 1),
(21, 'Liebherr R9400', 'type_unit', 0, 1),
(22, 'Portable', 'type_unit', 0, 2),
(24, 'Installed', 'status', 0, 1),
(25, 'Uninstalled', 'status', 0, 1),
(26, 'Dismantle', 'status', 0, 1),
(27, 'Battery Replacement', 'activity', 0, 2),
(28, 'Reassociate', 'activity', 0, 2),
(29, 'Change Radio', 'activity', 0, 2),
(30, 'Repointing', 'activity', 0, 2),
(31, 'Installation', 'activity', 0, 2),
(32, 'Reposition Portable', 'activity', 0, 2),
(33, 'Restart Server', 'activity', 0, 2),
(34, 'Change PoE', 'activity', 0, 2),
(35, 'Moving PT', 'activity', 0, 2),
(36, 'Re-Instalation', 'activity', 0, 2),
(37, 'Change MPPT', 'activity', 0, 2),
(38, 'Restart MPPT', 'activity', 0, 2),
(39, 'Restart Radio Aruba', 'activity', 0, 2),
(40, 'Uninstall Perangkat', 'activity', 0, 2),
(41, 'Fabrikasi Unit Portable Network', 'activity', 0, 2),
(42, 'Change Switch/ Restart Switch', 'activity', 0, 2),
(43, 'Change Cable Jumper', 'activity', 0, 2),
(44, 'Recondition, Cleaning And Painting', 'activity', 0, 2),
(45, 'Change Inverter', 'activity', 0, 2),
(46, 'Suvey Location PT', 'activity', 0, 2),
(47, 'Preventive Maintenance', 'activity', 0, 2),
(48, 'Mojo Freeze', 'analysis', 0, 1),
(49, 'JAMS Error', 'analysis', 0, 1),
(50, 'Not Associated', 'analysis', 0, 1),
(51, 'Jigsaw Off', 'analysis', 0, 1),
(52, 'GPS Offline', 'analysis', 0, 1),
(53, 'Bracket, Ram, Bolt Mounting', 'analysis', 0, 1),
(54, 'Signal Wifi Low', 'analysis', 0, 1),
(55, 'Source Power Problem', 'analysis', 0, 1),
(56, 'Jigsaw N/A', 'analysis', 0, 1),
(57, 'N/A Access Point', 'analysis', 0, 1),
(58, 'Unit Standby', 'analysis', 0, 1),
(59, 'Screen Retak', 'analysis', 0, 1),
(60, 'Source Power off', 'analysis', 0, 1),
(61, 'Screen Problem', 'analysis', 0, 1),
(62, 'Connector OMNI Damage', 'analysis', 0, 1),
(64, 'Jigsaw Dismantle', 'analysis', 0, 1),
(65, 'Preventive Maintenance', 'analysis', 0, 1),
(67, 'Out Of Memory\n', 'case', 0, 1),
(68, 'Not Connected AP', 'case', 0, 1),
(69, 'Replicator Not Connected', 'case', 0, 1),
(70, 'Source Power Problem', 'case', 0, 1),
(71, 'Wifi Box Hang', 'case', 0, 1),
(72, 'Kabel Source Power Jigsaw Dilepas', 'case', 0, 1),
(73, 'Over Voltage', 'case', 0, 1),
(74, 'Bolt Mounting Bracket Broken', 'case', 0, 1),
(75, 'OS Error', 'case', 0, 1),
(76, 'Delay, Spase Memory Full', 'case', 0, 1),
(77, 'Production Re-Schedule', 'case', 0, 1),
(78, 'Jigsaw N/A', 'case', 0, 1),
(79, 'Antenna GPS Demage', 'case', 0, 1),
(80, 'Disconnect Battery', 'case', 0, 1),
(81, 'Screen Damage', 'case', 0, 1),
(82, 'Kabel Antenna Omni Putus', 'case', 0, 1),
(83, 'Upgrade Versions Failed', 'case', 0, 1),
(84, 'Connector omni N/A, kabel dilepas', 'case', 0, 1),
(85, 'Screen Problem', 'case', 0, 1),
(86, 'Jigsaw Dismantle', 'case', 0, 1),
(87, 'Pengelasan Unit', 'case', 0, 1),
(88, 'Kabel Connector GPS putus', 'case', 0, 1),
(89, 'Connector GPS lepas / longgar', 'case', 0, 1),
(90, 'Antenna Omni Down / Demage', 'case', 0, 1),
(91, 'Operasi System Error/ Corupt', 'case', 0, 1),
(92, 'Preventive Maintenance', 'case', 0, 1),
(93, 'GPS ANTENNA LOW SIGNAL', 'case', 0, 1),
(94, 'Troubleshoot', 'category', 0, 2),
(95, 'Maintenance', 'category', 0, 2),
(96, 'Installation', 'category', 0, 2),
(97, 'Uninstall', 'category', 0, 2),
(98, 'No Communication', 'problem', 0, 1),
(112, 'Aruba Radio Broken', 'problem', 0, 2),
(113, 'PTP Link Not Associated', 'problem', 0, 2),
(114, 'PTP Link Intermitten', 'problem', 0, 2),
(115, 'Battery Voltage Low', 'problem', 0, 2),
(116, 'POE Broken', 'problem', 0, 2),
(117, 'Blasting Evacuation', 'problem', 0, 2),
(118, 'Server VPN Problem', 'problem', 0, 2),
(119, 'Suvey Location PT', 'problem', 0, 2),
(120, 'PTP Link Low', 'problem', 0, 2),
(121, 'Problem Coverage', 'problem', 0, 2),
(122, 'Radius Dumping', 'problem', 0, 2),
(123, 'Radius Drilling', 'problem', 0, 2),
(124, 'Radius loading', 'problem', 0, 2),
(125, 'Maintenance', 'problem', 0, 2),
(126, 'MPPT Broken', 'problem', 0, 2),
(127, 'Installation', 'problem', 0, 2),
(128, 'Moving Portable', 'problem', 0, 2),
(129, 'Portable Standby', 'problem', 0, 2),
(130, 'Switch Broken/ Hang', 'problem', 0, 2),
(131, 'Inverter Problem', 'problem', 0, 2),
(132, 'Repair Portable', 'problem', 0, 2),
(133, 'Link PTP Follow IT', 'problem', 0, 2),
(134, 'Preventive Maintenance', 'problem', 0, 2),
(135, 'Restart Hardware', 'activity', 0, 1),
(137, 'Mega Tower Lamp\n', 'type_unit', 0, 2),
(139, 'RFI', 'antenna', 0, 1),
(140, 'Blade', 'antenna', 0, 1),
(141, 'Mobile Mark', 'antenna', 0, 1),
(142, 'Troubleshoot', 'category', 0, 1),
(143, 'Maintenance', 'category', 0, 1),
(144, 'Installation', 'category', 0, 1),
(145, 'Uninstall', 'category', 0, 1),
(146, 'Dismantle', 'category', 0, 1),
(149, 'Solarcell Berdebu', 'problem', 0, 2),
(150, 'Cleaning Solarcell', 'activity', 0, 2),
(151, 'Change Port Switch', 'activity', 0, 2),
(152, 'Rebahkan portable', 'activity', 0, 2),
(156, 'Dismantle Jigsaw', 'activity', 0, 1),
(160, 'Installed', 'status', 0, 2),
(161, 'Uninstalled', 'status', 0, 2),
(162, 'Dismantle', 'status', 0, 2),
(163, 'Repair Source Power', 'activity', 0, 1),
(164, 'Change Connector', 'activity', 0, 1),
(165, 'GPS Bad', 'case', 0, 1),
(166, 'Change GPS', 'activity', 0, 1),
(168, 'Restart By Relay\n', 'activity', 0, 1),
(169, 'Uninstall', 'problem', 0, 2),
(170, 'Radius Drainase Air', 'problem', 0, 2),
(171, 'Reinstall Jigsaw', 'activity', 0, 1),
(172, 'Display Freeze\n', 'problem', 0, 1),
(173, 'JAMS Problem', 'problem', 0, 1),
(174, 'Operating System Problem', 'problem', 0, 1),
(175, 'Screen Problem', 'problem', 0, 1),
(176, 'Antena Omni Problem', 'problem', 0, 1),
(177, 'Antena GPS Problem', 'problem', 0, 1),
(178, 'Bracket Antena Problem', 'problem', 0, 1),
(179, 'Bracket Mojo Problem', 'problem', 0, 1),
(180, 'Bracket Router Problem', 'problem', 0, 1),
(181, 'Preventive Maintenance', 'problem', 0, 1),
(182, 'Jigsaw Dismantle', 'problem', 0, 1),
(183, 'Installation', 'problem', 0, 1),
(185, 'Source Power Problem', 'problem', 0, 1),
(186, 'Installation', 'activity', 0, 1),
(187, 'ReInstallation', 'problem', 0, 1),
(188, 'ReInstallation', 'analysis', 0, 1),
(189, 'ReInstallation', 'case', 0, 1),
(190, 'Preventive Maintenance', 'activity', 0, 1),
(191, 'Restart By SSH', 'activity', 0, 1),
(192, 'Mars', 'antenna', 0, 1),
(193, 'Change Screen', 'activity', 0, 1),
(195, 'Repair Connector', 'activity', 0, 1),
(197, 'Maintenance ', 'activity', 0, 2),
(199, 'activity', 'activity', 0, 0),
(205, 'Upload a\n', 'activity', 0, 1),
(206, 'Kabel Antenna GPS', 'rekondisi', 0, 1),
(207, 'Kabel Antenna RH', 'rekondisi', 0, 1),
(208, 'Kabel Antenna LH', 'rekondisi', 0, 1),
(209, 'Bracket Mojo', 'rekondisi', 0, 1),
(210, 'Bracket Routerstation', 'rekondisi', 0, 1),
(211, 'Posisi Routerstation', 'rekondisi', 0, 1),
(212, 'Harness', 'rekondisi', 0, 1),
(213, 'Bracket   Antenna', 'rekondisi', 0, 1),
(214, 'Take Source Power', 'rekondisi', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `man_power`
--

CREATE TABLE IF NOT EXISTS `man_power` (
  `nrp` varchar(10) NOT NULL,
  `fullname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pm_device`
--

CREATE TABLE IF NOT EXISTS `pm_device` (
`id_pm` int(10) NOT NULL,
  `IdDevice` int(2) NOT NULL,
  `IdEnum` int(2) NOT NULL,
  `idUnit` int(11) NOT NULL,
  `values` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recondition`
--

CREATE TABLE IF NOT EXISTS `recondition` (
`id` int(100) NOT NULL,
  `id_unit` varchar(10) NOT NULL,
  `value` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `pic` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `recondition`
--

INSERT INTO `recondition` (`id`, `id_unit`, `value`, `date`, `time`, `pic`) VALUES
(1, 'D3-006', '206,207', '2018-05-23', '02:09:31', 'MAZRI'),
(2, 'D3-006', '206,207,210', '2018-05-24', '02:09:31', 'MAZRI');

-- --------------------------------------------------------

--
-- Table structure for table `reportingjob`
--

CREATE TABLE IF NOT EXISTS `reportingjob` (
`IDReport` int(10) NOT NULL,
  `id_device` int(2) NOT NULL,
  `date` date NOT NULL,
  `shift` int(2) NOT NULL,
  `id_unit` varchar(25) NOT NULL,
  `bd_type` varchar(10) NOT NULL,
  `problem` int(5) NOT NULL,
  `category` int(5) NOT NULL,
  `location` varchar(25) NOT NULL,
  `time_problem` time NOT NULL,
  `wait_start` time NOT NULL,
  `wait_end` time NOT NULL,
  `analysis` int(5) NOT NULL,
  `case` int(5) NOT NULL,
  `activity` int(5) NOT NULL,
  `start_action` time NOT NULL,
  `end_action` time NOT NULL,
  `bd_receiver` varchar(50) NOT NULL,
  `rfu_receiver` varchar(50) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `remark` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=373 ;

--
-- Dumping data for table `reportingjob`
--

INSERT INTO `reportingjob` (`IDReport`, `id_device`, `date`, `shift`, `id_unit`, `bd_type`, `problem`, `category`, `location`, `time_problem`, `wait_start`, `wait_end`, `analysis`, `case`, `activity`, `start_action`, `end_action`, `bd_receiver`, `rfu_receiver`, `pic`, `status`, `remark`) VALUES
(4, 2, '2018-02-17', 1, 'MTL MIA 4', '', 112, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 27, '10:18:33', '10:18:40', 'e', 'e', 'e', '-', '-'),
(5, 1, '2018-03-25', 2, 'D3-046', 'STB', 98, 142, 'csa n1', '17:00:00', '07:00:00', '07:30:00', 48, 67, 135, '08:00:00', '08:30:00', 'Reza', 'Reza', 'Andi Mariadi', 'RFU', 'Bad Conduit'),
(6, 1, '2018-04-01', 2, 'D3-139', 'STB', 172, 142, 'OB2', '17:00:00', '21:00:00', '21:00:00', 48, 67, 135, '21:00:00', '21:05:00', 'dispatch', 'dispatch', 'Syairi, Aris', 'RFU', 'bad conduit, kabel antenna kanan putus'),
(7, 1, '2018-04-01', 2, 'D4-002', 'STB', 172, 142, 'OB2', '17:00:00', '22:00:00', '22:30:00', 48, 67, 135, '22:00:00', '22:30:00', 'dispatch', 'dispatch', 'Syairi, Aris', 'RFU', 'BRACKET WB N/A, BAD CONDUIT'),
(8, 1, '2018-04-01', 2, 'D4-009', 'BUS', 172, 142, 'OB2\n', '17:00:00', '22:30:00', '22:55:00', 48, 67, 135, '22:55:00', '23:05:00', 'dispatch', 'dispatch', 'Syairi, Aris', 'RFU', 'bracket, conduit bad, kabel antena kanan putus'),
(9, 1, '2018-04-01', 2, 'D4-083', 'STB', 172, 142, 'OB2', '17:00:00', '23:00:00', '23:00:00', 48, 67, 135, '23:00:00', '23:15:00', 'dispatch', 'dispatch', 'Syairi, Aris', 'RFU', 'bracket& conduit bad, kabel antena kanan putus'),
(10, 1, '2018-04-01', 2, 'D4-083', 'STB', 172, 142, 'OB2', '17:00:00', '23:00:00', '23:00:00', 48, 67, 135, '23:00:00', '23:15:00', 'dispatch', 'dispatch', 'Syairi, Aris', 'RFU', 'bad conduit'),
(11, 1, '2018-04-01', 2, 'D4-085', 'STB', 172, 142, 'OB2', '17:00:00', '23:15:00', '23:15:00', 48, 67, 135, '23:15:00', '23:30:00', 'dispatch', 'dispatch', 'Syairi, Aris', 'RFU', 'bad conduit'),
(12, 1, '2018-04-01', 2, 'D3-117', 'BUS', 172, 142, 'J5', '17:00:00', '00:45:00', '01:00:00', 48, 67, 135, '01:00:00', '01:15:00', 'dispatch', 'dispatch', 'Syairi, Aris', 'RFU', 'BAD CONDUIT'),
(13, 1, '2018-04-01', 2, 'D3-124', 'BUS', 172, 142, 'J5', '17:00:00', '01:00:00', '01:20:00', 48, 67, 135, '01:20:00', '01:40:00', 'dispatch', 'dispatch', 'Syairi, Aris', 'RFU', 'BAD CONDUIT, BRACKET BERKARAT'),
(14, 1, '2018-04-01', 2, 'D3-233', 'STB', 172, 142, 'J5', '17:00:00', '01:30:00', '01:30:00', 48, 67, 135, '01:30:00', '01:45:00', 'dispatch', 'dispatch', 'Syairi, Aris', 'RFU', 'bad conduit,bracket antenna berkarat,connector tnc gps yang di mojo bad'),
(15, 1, '2018-04-01', 2, 'D4-093', 'BUS', 172, 142, 'J5', '17:00:00', '01:30:00', '01:50:00', 48, 67, 135, '01:50:00', '02:05:00', 'dispatch', 'dispatch', 'Syairi, Aris', 'RFU', 'bad conduit,bracket berkarat'),
(16, 1, '2018-04-01', 2, 'D3-215', 'STB', 172, 142, 'N1', '17:00:00', '02:15:00', '02:15:00', 48, 67, 135, '02:15:00', '02:30:00', 'dispatch', 'dispatch', 'Syairi, Aris', 'RFU', 'conduit bad '),
(17, 1, '2018-04-01', 2, 'D3-065', 'BUS', 172, 142, 'N1', '17:00:00', '02:15:00', '02:40:00', 48, 67, 135, '02:40:00', '03:00:00', 'dispatch', 'dispatch', 'Syairi, Aris', 'RFU', 'conduit bad'),
(22, 2, '2018-03-31', 1, 'PT 29', '', 115, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 27, '09:00:00', '09:30:00', 'Reza', 'Reza', 'Adnan, Andi', 'Closed', '-'),
(23, 2, '2018-04-01', 1, 'PT 23', '', 130, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 151, '10:30:00', '10:40:00', 'Reza', 'Reza', 'Andi, Adnan', 'Closed', '-'),
(24, 2, '2018-04-01', 1, 'PT 25', '', 117, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 152, '12:00:00', '13:30:00', 'Reza', 'Reza', 'Andi, Adnan', 'Closed', 'Plang akses portable tidak ada'),
(25, 1, '2018-04-01', 1, 'D5-029', 'BUS', 185, 142, 'CSA N4', '07:00:00', '09:10:00', '09:50:00', 55, 70, 135, '09:50:00', '11:35:00', 'SUDIN', 'DISPATCHER', 'SUDIN, ERWIN', 'RFU', 'BAD CONDUIT'),
(28, 2, '2018-04-02', 1, 'SKID 02', '', 127, 96, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 31, '10:30:00', '12:00:00', 'Sutarno', 'Sutarno', 'Andi, Adnan', 'Closed', 'Installasi PTP to Dispatch WARA'),
(29, 1, '2018-04-01', 2, 'D4-060', 'STB', 172, 142, 'CSA N3', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '23:25:00', '23:36:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'BAD CONDUIT'),
(30, 1, '2018-04-02', 2, 'D4-062', 'STB', 172, 142, 'CSA N3', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '23:40:00', '23:50:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'BAD CONDUIT'),
(31, 1, '2018-04-02', 2, 'D4-059', 'STB', 172, 142, 'CSA N3', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '23:50:00', '24:00:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'BAD CONDUIT'),
(32, 1, '2018-04-02', 2, 'D4-054', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '00:10:00', '00:21:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'BAD CONDUIT'),
(33, 1, '2018-04-02', 2, 'D3-150', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '00:23:00', '00:31:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'BAD CONDUIT'),
(34, 1, '2018-04-02', 2, 'D3-182', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '00:33:00', '00:44:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'BAD CONDUIT'),
(35, 1, '2018-04-02', 2, 'D4-057', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '00:46:00', '00:55:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'BAD CONDUIT'),
(36, 1, '2018-04-02', 2, 'D4-047', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '00:56:00', '01:18:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'BAD CONDUIT, BRACKET WB LONGGAR'),
(37, 1, '2018-04-02', 2, 'D3-109', 'STB', 172, 142, 'CSA N4', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '01:25:00', '01:35:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'BRACKET BERKARAT\n'),
(38, 1, '2018-04-02', 2, 'D3-095', 'STB', 172, 142, 'CSA N4', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '01:37:00', '01:47:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'BAD CONDUIT'),
(39, 1, '2018-04-02', 2, 'D3-088', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '01:49:00', '01:59:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'BAD CONDUIT'),
(40, 1, '2018-04-02', 2, 'D5-031', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '02:00:00', '02:10:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'BAD CONDUIT'),
(41, 1, '2018-04-02', 2, 'D5-004', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '02:12:00', '02:22:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'BAD CONDUIT'),
(42, 1, '2018-04-02', 2, 'D3-064', 'STB', 172, 142, 'CSA N4', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '03:00:00', '03:07:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'RESTART BY RELAY'),
(43, 1, '2018-04-02', 2, 'D3-053', 'STB', 172, 142, 'CSA N4', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '03:08:00', '03:17:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'RESTART BY RELAY'),
(44, 1, '2018-04-02', 2, 'D3-375', 'STB', 172, 142, 'CSA OB2', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '03:19:00', '03:27:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'RESTART BY RELAY'),
(45, 1, '2018-04-02', 2, 'D5-014', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '03:27:00', '03:35:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'RESTART BY RELAY'),
(46, 1, '2018-04-02', 2, 'D5-009', 'STB', 172, 142, 'CSA N4', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '03:35:00', '03:44:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'RESTART BY RELAY'),
(47, 1, '2018-04-02', 2, 'D3-012', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '04:30:00', '04:40:00', 'DISPATCHER', 'DISPACTHER', 'SYAIRI, SUDIN', 'RFU', 'GPS LOW '),
(48, 2, '2018-04-02', 1, 'PT 20', '', 130, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 42, '08:30:00', '08:40:00', 'Sutarno', 'Sutarno', 'Adnan, Andi', 'CLOSED', '-'),
(49, 2, '2018-04-03', 1, 'PT 05', '', 119, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 46, '08:30:00', '09:00:00', 'Najamudin', 'Najamudin', 'Aris, Nanang, Andi', 'Closed', 'Akses jalan tidak ada, radius saluran air'),
(50, 2, '2018-04-03', 1, 'PT 09', '', 122, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 46, '09:00:00', '09:30:00', 'Najamudin', 'Najamudin', 'Aris, Nanang, Andi', 'Closed', 'Akses jalan tertutup, akses jalan untuk penempatan tidak ada'),
(51, 2, '2018-04-03', 1, 'PT 25', '', 117, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 152, '11:50:00', '13:00:00', 'Najamudin', 'Najamudin', 'Nanang, andy , aris ', 'RFU', 'Plang akses portable tidak ada, akses tergenang(closed)'),
(52, 1, '2018-04-03', 1, 'D4-058', 'STB', 172, 142, 'CSA N1', '07:00:00', '00:00:00', '00:00:00', 48, 67, 135, '14:50:00', '15:05:00', 'Najamudin', 'Najamudin', 'Nanang, Andi', 'RFU', 'Bad conduit, SN mojo buram'),
(53, 1, '2018-04-03', 1, 'D5-017', 'STB', 172, 142, 'Csa n1', '07:00:00', '00:00:00', '00:00:00', 48, 67, 135, '14:52:00', '15:10:00', 'Najamudin', 'Najamudin', 'Nanang, andy ', 'RFU', 'Bad conduit'),
(54, 1, '2018-04-03', 1, 'D3-228', 'BUS', 172, 142, 'csa ob2', '07:00:00', '09:00:00', '09:10:10', 48, 67, 135, '09:10:10', '09:20:20', 'DISPATCHER', 'DISPATCHER', 'pedy,mazri', 'RFU', 'cable n counduit bad'),
(56, 1, '2018-04-03', 1, 'D4-045', 'bus', 172, 142, 'csa ob2', '07:00:00', '09:50:00', '10:10:10', 48, 67, 135, '10:10:10', '10:25:00', 'DISPATCHER', 'DISPATCHER', 'pedy,mazri', 'RFU', 'cable n counduit bad'),
(57, 1, '2018-04-03', 1, 'D4-001', 'bus', 172, 142, 'csa ob2', '07:00:00', '10:40:00', '10:50:00', 48, 67, 135, '10:50:00', '11:05:00', 'DISPATCHER', 'DISPATCHER', 'pedy,mazri', 'RFU', 'cable n coundiut bad'),
(58, 1, '2018-04-03', 1, 'D3-232', 'BUS', 172, 142, 'csa ob2', '07:00:00', '11:20:00', '11:25:00', 48, 67, 135, '11:25:00', '11:40:00', 'DISPATCHER', 'DISPATCHER', 'pedy,mazri', 'RFU', 'cable n counduit bad'),
(61, 1, '2018-04-03', 2, 'D3-146', 'STB', 172, 142, 'CSA N3', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '23:25:00', '23:35:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(62, 1, '2018-04-03', 2, 'D4-052', 'STB', 172, 142, 'CSA N3', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '23:40:00', '23:50:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(63, 1, '2018-04-03', 2, 'D4-010', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '02:00:00', '02:10:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(64, 1, '2018-04-03', 2, 'D4-064', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '02:30:00', '02:41:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(66, 2, '2018-04-04', 1, 'PT 02', '', 115, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 27, '10:00:00', '10:20:00', 'Najamudin', 'Najamudin', 'Syairi, Adnan', 'RFU', 'Akses Portable longsor'),
(67, 1, '2018-04-03', 1, 'D4-043', 'stb', 177, 142, 'csa ob2', '07:00:00', '10:00:00', '10:20:00', 52, 89, 164, '10:20:00', '11:00:00', 'najamudin', 'najamudin', 'pedy,mazri', 'rfu', 'cable n counduit bad'),
(68, 1, '2018-04-03', 1, 'D3-392', 'stb', 177, 142, 'csa ob2', '07:00:00', '00:00:00', '00:00:00', 52, 165, 166, '13:50:00', '13:30:00', 'najamudin', 'najamudin', 'pedy,mazri', 'rfu', '-'),
(69, 1, '2018-04-04', 2, 'D4-060', 'BUS', 172, 142, 'N3', '17:00:00', '22:00:00', '22:30:00', 48, 67, 135, '10:30:00', '10:40:00', 'DISPACHER', 'DISPATCHER', 'SUDIN, ERWIN', 'RFU', 'BAD CONDUIT'),
(70, 1, '2018-04-04', 2, 'D4-032', 'BUS', 172, 142, 'N3', '17:00:00', '22:00:00', '22:30:00', 48, 67, 135, '22:30:00', '22:40:00', 'DISPACHER', 'DISPATCHER', 'SUDIN, ERWIN', 'RFU', 'BAD CABLE & CONDUIT'),
(71, 1, '2018-04-04', 2, 'D4-007', 'STB', 172, 142, 'OB2', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '00:00:00', '00:00:00', 'DISPACHER', 'DISPATCHER', 'SUDIN, ERWIN', 'RFU', 'BAD CONDUIT, BRACKET WB N/A'),
(72, 1, '2018-04-04', 2, 'D5-009', 'STB', 172, 142, 'CSA N3', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '22:30:00', '23:40:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(73, 1, '2018-04-04', 2, 'D4-091', 'STB', 172, 142, 'J5', '17:00:00', '00:00:00', '00:00:00', 48, 67, 168, '23:55:00', '24:10:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', ''),
(74, 1, '2018-04-04', 2, 'D4-058', 'STB', 172, 142, 'CSA N3', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '00:22:00', '00:32:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', 'Bad conduit, SN mojo buram'),
(75, 1, '2018-04-04', 2, 'D3-131', 'STB', 172, 142, 'CSA OB2', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '00:40:00', '00:50:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', 'BRACKET BERKARAT'),
(76, 1, '2018-04-04', 2, 'D3-150', 'STB', 172, 142, 'CSA OB2', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '00:55:00', '01:10:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(78, 2, '2018-04-05', 1, 'PT 24', '', 117, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 152, '12:00:00', '13:30:00', 'NAJAMUDIN', 'NAJAMUDIN', 'Syairi, Adnan', 'RFU', '-'),
(79, 2, '2018-04-05', 1, 'PT 29', '', 121, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 32, '14:00:00', '16:00:00', 'NAJAMUDIN', 'NAJAMUDIN', 'Syairi, Adnan', 'RFU', 'Bracket perangkat bad, groud petir bad, winch bawah bad, stiker titik jepit bad, nomer portable tidak ada, pole atas stuck.'),
(80, 1, '2018-04-05', 1, 'D5-030', 'BUS', 172, 142, 'CSA N3', '07:00:00', '14:00:00', '14:30:00', 48, 67, 135, '14:30:00', '14:40:00', 'Najamudin', 'Najamudin', 'Pedy, Nanang, Andi', 'RFU', 'Bracket dan Conduit Bad'),
(81, 2, '2018-04-05', 1, 'PT 25', '', 117, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 152, '11:30:00', '13:30:00', 'NAJAMUDIN', 'NAJAMUDIN', 'Syairi, Adnan', 'RFU', 'Plang akses portable tidak ada, akses tergenang(closed)'),
(82, 2, '2018-04-05', 1, 'PT 26', '', 116, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 34, '14:00:00', '14:30:00', 'NAJAMUDIN', 'NAJAMUDIN', 'Andi, Pedy, Nanang', 'RFU', 'Jalan tertutup genangan air'),
(83, 2, '2018-04-05', 1, 'PT 26', '', 115, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 27, '14:00:00', '14:30:00', 'NAJAMUDIN', 'NAJAMUDIN', 'Andi, Pedy, Nanang', 'RFU', 'Jalan tertutup genangan air'),
(84, 1, '2018-04-05', 2, 'D5-011', 'BUS', 172, 142, 'N1', '17:00:00', '22:00:00', '22:30:00', 48, 67, 135, '22:30:00', '22:40:00', 'DISPACHER', 'DISPACHER', 'SUDIN, ERWIN', 'RFU', '-'),
(85, 1, '2018-04-05', 2, 'D4-077', 'BUS', 172, 142, 'N1', '17:00:00', '22:40:00', '23:00:00', 48, 67, 135, '23:00:00', '23:10:00', 'DISPACHER', 'DISPACHER', 'SUDIN, ERWIN', 'RFU', 'BAD CONDUIT'),
(86, 1, '2018-04-05', 2, 'D4-059', 'BUS', 172, 142, 'N1', '17:00:00', '23:40:00', '00:10:00', 48, 67, 135, '00:10:00', '00:20:00', 'DISPACHER', 'DISPACHER', 'SUDIN, ERWIN', 'RFU', 'BAD CABLE & CONDUIT, BRACKET BERKARAT'),
(87, 1, '2018-04-05', 2, 'D3-215', 'BUS', 172, 142, 'N1', '17:00:00', '23:10:00', '00:00:00', 48, 67, 135, '00:00:00', '00:15:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(88, 1, '2018-04-05', 2, 'D3-154', 'BUS', 172, 142, 'CSA N1', '17:00:00', '23:00:00', '00:50:00', 48, 67, 135, '00:50:00', '00:59:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(89, 2, '2018-04-06', 1, 'PT 04', '', 169, 97, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 40, '08:30:00', '10:00:00', 'Dispatcher', 'Dispatcher', 'Syairi, Nanang, Adnan', 'RFU', 'Unisntall Infinet SMN'),
(90, 1, '2018-04-06', 2, 'D3-390', 'STB', 185, 142, 'OB2', '17:00:00', '00:00:00', '00:00:00', 51, 70, 163, '22:30:00', '22:40:00', 'DISPACHER', 'DISPACHER', 'SUDIN, ERWIN', 'RFU', 'None'),
(91, 1, '2018-04-06', 2, 'D4-002', 'STB', 172, 142, 'OB2', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '23:00:00', '23:10:00', 'DISPATCH', 'DISPATCH', 'SUDIN, ERWIN', 'RFU', '-'),
(92, 1, '2018-04-06', 2, 'D3-182', 'BUS', 172, 142, 'N1', '17:00:00', '23:40:00', '00:20:00', 48, 67, 135, '00:20:00', '00:30:00', 'DISPATCH', 'DISPATCH', 'SUDIN, ERWIN', 'RFU', 'BAD CONDUIT'),
(94, 2, '2018-04-07', 1, 'PT 09', '', 122, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 32, '08:00:00', '10:00:00', 'REZA ARI P.', 'REZA ARI P.', 'Syairi, Nanang, Andi', 'CLOSED', 'Portable need Rekondisi'),
(95, 2, '2018-04-07', 1, 'PT 05', '', 170, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 32, '10:00:00', '10:50:00', 'REZA ARI P.', 'REZA ARI P.', 'Syairi, Nanang, Andi', 'OPEN', 'Akses jalan tidak ada, radius saluran air, bracket kayu solarcell rapuh'),
(96, 2, '2018-04-07', 1, 'PT 25', '', 117, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 152, '11:40:00', '13:30:00', 'REZA ARI P.', 'REZA ARI P.', 'Syairi, Nanang, Andi', 'CLOSED', 'pull tidak bisa turun'),
(97, 1, '2018-04-07', 1, 'D3-170', 'BUS', 172, 142, 'csa OB2', '07:00:00', '09:30:00', '10:00:00', 48, 67, 135, '10:00:00', '10:15:00', 'reza ari', 'reza ari', 'adnan, pedy, mazri', 'rfu', 'bracket berkarat, ram mojo bad'),
(98, 1, '2018-04-07', 1, 'D3-397', 'Bus', 173, 142, 'csa ob2', '07:00:00', '14:00:00', '14:10:00', 49, 75, 135, '14:10:00', '14:25:00', 'reza', 'reza', 'pedy, adnan, mazri', 'rfu', 'vhms n/a'),
(99, 1, '2018-04-07', 1, 'D3-386', 'Bus', 172, 142, 'csa ob2', '07:00:00', '14:30:00', '14:55:00', 48, 67, 135, '14:55:00', '15:05:00', 'reza', 'reza', 'pedy,mazri,adnan', 'rfu', '-'),
(100, 1, '2018-04-07', 1, 'D3-377', 'bus', 98, 142, 'csa ob2', '07:00:00', '14:00:00', '15:30:00', 50, 71, 156, '15:30:00', '16:00:00', 'DISPATCHER', 'DISPACTHER', 'pedy,adnan,mazri', 'RFU', 'no bcl'),
(102, 2, '2018-04-07', 1, 'PT 20', '', 130, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 42, '16:20:00', '16:30:00', 'REZA ARI P.', 'REZA ARI P.', 'Syairi, Nanang, Andi', 'Closed', '-'),
(103, 1, '2018-04-07', 2, 'D3-377', 'BUS', 183, 144, 'OB2', '17:00:00', '00:40:00', '01:20:00', 56, 78, 66, '01:20:00', '02:00:00', 'DISPACHER', 'DISPACHER', 'SUDIN, ERWIN', 'RFU', 'Nilai value ketika di bad_mojo tidak bisa 1'),
(104, 2, '2018-04-08', 1, 'PT 11', '', 115, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 27, '08:30:00', '09:00:00', 'Reza', 'Reza', 'Syairi, Andi', 'Closed', 'Need GOH'),
(105, 2, '2018-04-08', 1, 'PT 20', '', 130, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 42, '09:30:00', '09:50:00', 'Reza', 'Reza', 'Syairi, Andi', 'Closed', 'By pass aruba to CPE, kabel LAN Aruba terkelupas. Switch need repair, Bracket Solarcell kayu'),
(106, 2, '2018-04-08', 1, 'PT 19', '', 119, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 46, '10:20:00', '10:30:00', 'Reza', 'Reza', 'Syairi, Andi', 'OPEN', 'Jalan akses portable tertutup bundwall.'),
(107, 2, '2018-04-08', 1, 'PT 17', '', 169, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 40, '10:50:00', '11:30:00', 'Reza', 'Reza', 'Syairi, Andi', 'Closed', 'Jalan sering tertutup spoil grader'),
(108, 2, '2018-04-08', 1, 'PT 21', '', 149, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 150, '14:00:00', '14:15:00', 'Reza', 'Reza', 'Syairi, Andi', 'Closed', '-\r\n'),
(109, 1, '2018-04-08', 2, 'D5-017', 'OPERASI', 172, 142, 'N1', '17:00:00', '19:00:00', '19:05:00', 48, 67, 168, '19:05:00', '19:10:00', 'Dispatcher', 'Dispatcher', 'SUDIN, ERWIN', 'RFU', 'Bad conduit'),
(110, 1, '2018-04-08', 2, 'D4-021', 'OPERASI', 172, 142, 'J5', '17:00:00', '00:00:00', '00:00:00', 48, 67, 168, '19:15:00', '19:20:00', 'Dispatcher', 'Dispatcher', 'SUDIN, ERWIN', 'RFU', '-'),
(111, 1, '2018-04-08', 2, 'D3-094', 'BUS', 172, 142, 'N3', '17:00:00', '22:10:00', '22:40:00', 48, 67, 135, '22:40:00', '22:50:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', 'bad conduit'),
(112, 1, '2018-04-08', 2, 'D5-032', 'BUS', 172, 142, 'N3', '17:00:00', '22:50:00', '23:30:00', 48, 67, 135, '23:30:00', '23:40:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(113, 1, '2018-04-08', 2, 'D3-047', 'BUS', 175, 146, 'N3', '17:00:00', '22:30:00', '23:00:00', 61, 85, 156, '23:00:00', '23:40:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'OPEN', 'bad conduit'),
(114, 1, '2018-04-08', 2, 'D3-091', 'BUS', 172, 142, 'N3', '17:00:00', '23:40:00', '23:50:00', 48, 67, 135, '23:50:00', '00:00:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(115, 1, '2018-04-08', 2, 'D3-181', 'BUS', 172, 142, 'N1', '17:00:00', '01:00:00', '01:30:00', 48, 67, 135, '01:30:00', '01:40:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(116, 1, '2018-04-08', 2, 'D4-049', 'BUS', 172, 142, 'N1', '17:00:00', '01:40:00', '02:00:00', 48, 67, 135, '02:00:00', '02:10:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', 'bad conduit'),
(117, 1, '2018-04-08', 2, 'D4-066', 'BUS', 172, 142, 'N3', '17:00:00', '21:30:00', '21:50:00', 48, 67, 0, '21:50:00', '22:00:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(118, 1, '2018-04-08', 2, 'D5-030', 'BUS', 172, 142, 'N3', '17:00:00', '22:30:00', '23:00:00', 48, 67, 135, '23:00:00', '23:10:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', 'Bracket dan Conduit Bad'),
(119, 1, '2018-04-08', 2, 'D3-088', 'BUS', 172, 142, 'N2', '17:00:00', '00:20:00', '00:30:00', 48, 67, 135, '00:30:00', '00:40:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(120, 1, '2018-04-08', 2, 'D3-215', 'BUS', 172, 142, 'N2', '17:00:00', '00:20:00', '00:30:00', 48, 67, 135, '00:30:00', '00:40:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(121, 1, '2018-04-08', 2, 'D3-150', 'BUS', 172, 142, 'N2', '17:00:00', '00:20:00', '00:30:00', 48, 67, 135, '00:40:00', '00:50:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(122, 1, '2018-04-08', 2, 'D3-151', 'BUS', 172, 142, 'N2', '17:00:00', '00:20:00', '00:30:00', 48, 67, 135, '00:50:00', '01:00:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', '-', '-'),
(123, 1, '2018-04-08', 2, 'D5-030', 'BUS', 172, 142, 'CSA N3', '17:00:00', '23:00:00', '23:50:00', 48, 67, 135, '23:50:00', '23:59:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'CLOSED', 'Bracket dan Conduit Bad'),
(124, 1, '2018-04-08', 2, 'D3-045', 'STB', 172, 142, 'CSA N2', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '01:10:00', '01:19:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', 'X'),
(125, 1, '2018-04-08', 2, 'D5-023', 'BUS', 172, 142, 'CSA N2', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '01:30:00', '01:45:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'CLOSED', 'X'),
(126, 1, '2018-04-08', 2, 'D3-391', 'STB', 172, 142, 'CSA OB2', '17:00:00', '00:00:00', '00:00:00', 48, 74, 163, '02:50:00', '02:59:00', 'DISPATCHER', 'DISPACTHER', 'SUDIN, ERWIN', 'RFU', '-'),
(127, 2, '2018-04-09', 1, 'PT 26', '', 115, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 27, '08:30:00', '09:00:00', 'REZA ARI P.', 'REZA ARI P.', 'Syairi, Nanang, Adnan', 'CLOSED', 'Akses tergenang air, Battery SIS'),
(128, 1, '2018-04-09', 1, 'D3-047', 'BUS', 183, 144, 'CSA N4', '07:00:00', '09:30:00', '10:00:00', 56, 78, 66, '10:30:00', '11:00:00', 'Reza', 'Reza', 'Syairi, Nanang, Adnan', 'RFU', 'bad conduit'),
(129, 1, '2018-04-08', 1, 'D3-246', 'STB', 182, 146, 'CSA TIMUR WARA', '07:00:00', '08:00:00', '09:30:00', 64, 86, 156, '09:30:00', '10:00:00', 'Sutarno', 'Sutarno', 'Nanang, Adnan', 'RFU', '-'),
(130, 2, '2018-04-08', 1, 'PT 10', '', 169, 97, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 40, '08:30:00', '09:30:00', 'Reza', 'Reza', 'Nanang , Adnan', 'CLOSED', 'Switch dan DC DC dilepas'),
(131, 1, '2018-04-09', 1, 'D5-022', 'STB', 183, 144, 'CSA N1', '07:00:00', '00:00:00', '00:00:00', 64, 86, 171, '09:30:00', '12:00:00', 'REZA ARI P.', 'REZA ARI P.', 'Syairi ,Adnan , Nanang', 'RFU', 'Conduit bad'),
(132, 1, '2018-04-09', 2, 'D3-147', 'OPERASI', 172, 142, 'n3', '17:00:00', '00:00:00', '00:00:00', 48, 67, 168, '17:55:00', '18:00:00', 'Dispatcher', 'Dispatcher', 'erwin', 'RFU', '-'),
(133, 1, '2018-04-09', 2, 'D4-046', 'BUS', 172, 142, 'J5', '17:00:00', '11:30:00', '12:40:00', 48, 67, 135, '00:40:00', '00:50:00', 'DISPACHER', 'DISPACHER', 'PEDY, ERWIN', 'RFU', 'BAD CONDUIT '),
(134, 1, '2018-04-09', 2, 'D3-178', 'BUS', 172, 142, 'CSA J5', '17:00:00', '23:00:00', '23:20:00', 48, 67, 135, '23:20:00', '23:35:00', 'DISPATCHER', 'DISPACTHER', 'pedy,erwin', 'RFU', 'bad counduit, ram mojo bad'),
(135, 1, '2018-04-09', 2, 'D3-228', 'BUS', 172, 142, 'J5', '17:00:00', '23:30:00', '00:40:00', 48, 67, 135, '00:40:00', '00:50:00', 'DISPACHER', 'DISPACHER', 'PEDY, ERWIN', 'RFU', 'cable n counduit bad'),
(136, 1, '2018-04-09', 2, 'D3-235', 'BUS', 172, 142, 'J5', '17:00:00', '23:30:00', '00:40:00', 48, 67, 135, '00:40:00', '00:50:00', 'DISPACHER', 'DISPACHER', 'PEDY, ERWIN', 'RFU', 'BAD CONDUIT'),
(137, 1, '2018-04-09', 2, 'D3-121', 'BUS', 172, 142, 'CSA J5', '17:00:00', '23:30:00', '00:10:00', 48, 67, 135, '00:10:00', '00:25:00', 'DISPATCHER', 'DISPACTHER', 'pedy,erwin', 'RFU', 'counduit bad, ram mojo bad'),
(138, 1, '2018-04-09', 2, 'D4-026', 'BUS', 172, 142, 'J5', '17:00:00', '00:50:00', '01:20:00', 48, 67, 135, '01:20:00', '01:30:00', 'DISPACHER', 'DISPACHER', 'PEDY, ERWIN', 'RFU', 'BAD CONDUIT'),
(139, 1, '2018-04-09', 2, 'D3-214', 'BUS', 172, 142, 'J5', '17:00:00', '01:30:00', '02:00:00', 48, 67, 135, '02:00:00', '02:10:00', 'DISPACHER', 'DISPACHER', 'PEDY, ERWIN', 'RFU', 'BAD CONDUIT\r\n'),
(140, 1, '2018-04-09', 2, 'D3-221', 'BUS', 172, 142, 'CSA J5', '17:00:00', '00:15:00', '00:40:00', 48, 67, 135, '00:40:00', '00:55:00', 'DISPATCHER', 'DISPACTHER', 'pedy,erwin', 'RFU', 'counduit bad'),
(141, 1, '2018-04-09', 2, 'D4-088', 'BUS', 172, 142, 'J5', '17:00:00', '02:00:00', '02:10:00', 48, 67, 135, '02:10:00', '02:20:00', 'DISPACHER', 'DISPACHER', 'PEDY, ERWIN', 'RFU', 'BAD CONDUIT\r\n\r\n\r\n\r\n\r\n\r\n'),
(142, 1, '2018-04-09', 2, 'D3-115', 'BUS', 172, 142, 'CSA J5', '17:00:00', '01:00:00', '01:30:00', 48, 67, 135, '01:30:00', '01:50:00', 'DISPATCHER', 'DISPACTHER', 'pedy,erwin', 'RFU', 'Bracket berkarat, amseal 23 bad'),
(143, 1, '2018-04-09', 2, 'D3-224', 'BUS', 172, 142, 'CSA J5', '17:00:00', '02:00:00', '02:45:00', 48, 67, 135, '02:45:00', '03:00:00', 'DISPATCHER', 'DISPACTHER', 'pedy,erwin', 'RFU', 'bad counduit'),
(144, 1, '2018-04-09', 2, 'D4-092', 'BUS', 172, 142, 'CSA J5', '17:00:00', '03:10:00', '03:30:00', 48, 67, 135, '03:30:00', '03:40:00', 'DISPATCHER', 'DISPACTHER', 'pedy,erwin', 'RFU', 'bad counduit'),
(145, 1, '2018-04-09', 2, 'D3-097', 'BUS', 172, 142, 'CSA J5', '17:00:00', '03:15:00', '03:40:00', 48, 67, 135, '03:40:00', '03:50:00', 'DISPATCHER', 'DISPACTHER', 'pedy,erwin', 'RFU', 'bad kabel & counduit'),
(146, 1, '2018-04-10', 1, 'D4-066', 'Bus', 172, 142, 'Csa n3', '07:00:00', '09:30:00', '09:50:00', 48, 67, 135, '09:50:00', '10:00:00', 'Dispatcher', 'Dispatcher', 'Syairi, Nanang', 'RFU', 'Antena RH none, bracket berkarat, conduit bad'),
(147, 1, '2018-04-10', 1, 'D3-046', 'STB', 172, 142, 'Csa n1', '07:00:00', '00:00:00', '00:00:00', 48, 67, 135, '11:25:00', '11:50:00', 'Dispatcher', 'Dispatcher', 'Syairi, Nanang', 'RFU', '-'),
(148, 2, '2018-04-10', 1, 'PT 09', '', 115, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 27, '09:00:00', '10:00:00', 'DISPATCH', 'DISPATCH', 'Syairi, Nanang', 'CLOSED', 'Portable need Rekondisi'),
(149, 1, '2018-04-10', 1, 'D4-067', 'BUS', 172, 142, 'N3', '07:00:00', '10:00:00', '10:15:00', 48, 67, 135, '10:15:00', '10:25:00', 'dispatcher', 'dispatcher', 'Syairi, Nanang', 'RFU', 'bad conduit'),
(150, 1, '2018-04-10', 1, 'D3-053', 'BUS', 172, 142, 'N3', '07:00:00', '11:00:00', '11:15:00', 48, 67, 135, '11:15:00', '11:25:00', 'dispatcher', 'dispatcher', 'Syairi, Nanang', 'RFU', 'bad conduit'),
(151, 1, '2018-04-10', 1, 'D3-388', 'Operasi', 172, 142, 'OB2', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '09:00:00', '09:05:00', 'Dispatcher', 'Dispatcher', 'Taufik', 'RFU', '-'),
(152, 1, '2018-04-10', 1, 'D3-398', 'Operasi', 172, 142, 'OB2', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '09:15:00', '09:20:00', 'Dispatcher', 'Dispatcher', 'Taufik', 'RFU', '-'),
(153, 2, '2018-04-10', 1, 'PT 26', '', 116, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 34, '14:32:08', '15:30:00', 'Reza Ari', 'Reza Ari', 'Syairi, Nanang', 'RFU', 'Change DC-DC 24v'),
(154, 1, '2018-04-10', 2, 'D4-048', 'bus', 172, 142, 'N1', '17:00:00', '21:00:00', '21:30:00', 48, 67, 135, '21:30:00', '21:45:00', 'DISPACHER', 'DISPACHER', 'PEDY, ERWIN', 'RFU', 'bad counduit'),
(155, 1, '2018-04-10', 2, 'D3-151', 'bus', 172, 142, 'n1', '17:00:00', '21:45:00', '22:00:00', 48, 67, 135, '22:00:00', '22:15:00', 'dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', 'bracket anten berkarat, conector gps bad, ram mojo bad'),
(156, 1, '2018-04-10', 2, 'D4-077', 'BUS', 172, 142, 'N1', '17:00:00', '22:20:00', '23:00:00', 48, 67, 135, '23:00:00', '23:15:00', 'dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', 'BAD CONDUIT'),
(157, 1, '2018-04-10', 2, 'D4-002', 'BUS', 172, 142, 'csa ob2', '17:00:00', '01:30:00', '02:00:00', 48, 67, 135, '02:00:00', '02:15:00', 'dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', 'bracket wifibox n/a'),
(158, 1, '2018-04-10', 2, 'D4-082', 'BUS', 172, 142, 'csa OB2', '17:00:00', '01:20:00', '02:00:00', 48, 67, 135, '02:00:00', '02:15:00', 'dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', 'BAD COUNDUIT'),
(159, 1, '2018-04-10', 2, 'D5-020', 'BUS', 172, 142, 'N1', '17:00:00', '23:00:00', '00:10:00', 48, 67, 135, '00:10:00', '00:20:00', 'dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', '-'),
(160, 1, '2018-04-10', 2, 'D3-151', 'BUS', 172, 142, 'N1', '17:00:00', '22:20:00', '23:00:00', 48, 67, 135, '23:00:00', '23:15:00', 'dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', 'bracket anten berkarat, conector gps bad, ram mojo bad'),
(161, 1, '2018-04-10', 2, 'D4-054', 'BUS', 172, 142, 'N1', '17:00:00', '23:10:00', '23:30:00', 48, 67, 135, '23:30:00', '23:40:00', 'dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', 'BAD COUNDUIT'),
(162, 1, '2018-04-10', 2, 'D3-154', 'BUS', 172, 142, 'N1', '17:00:00', '22:00:00', '22:10:00', 48, 67, 135, '22:10:00', '22:30:00', 'Dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', 'bad conduit'),
(163, 1, '2018-04-10', 2, 'D3-150', 'BUS', 172, 142, 'N1', '17:00:00', '22:30:00', '22:35:00', 48, 67, 135, '22:35:00', '22:40:00', 'Dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', 'bad conduit'),
(164, 1, '2018-04-10', 2, 'D5-019', 'BUS', 172, 142, 'csa OB2', '17:00:00', '23:10:00', '23:15:00', 48, 67, 135, '23:15:00', '23:25:00', 'Dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', 'bad conduit'),
(165, 1, '2018-04-10', 2, 'D3-146', 'BUS', 172, 142, 'csa OB2', '17:00:00', '23:25:00', '23:30:00', 48, 67, 135, '23:30:00', '23:45:00', 'Dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', 'bad conduit'),
(166, 1, '2018-04-10', 2, 'D4-001', 'BUS', 172, 142, 'csa OB2', '17:00:00', '23:45:00', '23:50:00', 48, 67, 135, '23:50:00', '00:00:00', 'Dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', 'cable n coundiut bad'),
(167, 1, '2018-04-10', 2, 'D5-039', 'BUS', 172, 142, 'csa OB2', '17:00:00', '00:00:00', '00:30:00', 48, 67, 135, '00:30:00', '00:50:00', 'Dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', 'Bad conduit'),
(168, 1, '2018-04-10', 2, 'D4-006', 'BUS', 172, 142, 'csa OB2', '17:00:00', '01:00:00', '01:30:00', 48, 67, 135, '01:30:00', '02:00:00', 'Dispatcher', 'Dispatcher', 'pedy,adnan', 'RFU', 'Bd conduit'),
(169, 1, '2018-04-11', 1, 'D4-021', 'BUS', 172, 142, 'CSA J5', '07:00:00', '09:20:00', '09:40:00', 48, 67, 135, '09:40:00', '09:50:00', 'reza ari', 'reza ari', 'Nanang,Syairi,Huzai', 'RFU', 'bracket berkarat, conduit bad'),
(170, 1, '2018-04-11', 1, 'D4-028', 'BUS', 172, 142, 'CSA J5', '07:00:00', '09:50:00', '10:00:00', 48, 67, 135, '10:00:00', '10:10:00', 'reza ari', 'reza ari', 'Nanang,Syairi,Huzai', 'RFU', 'BAD CONDUIT'),
(171, 1, '2018-04-11', 1, 'D4-018', 'BUS', 172, 142, 'CSA J5', '07:00:00', '10:20:00', '10:30:00', 48, 67, 135, '10:30:00', '10:40:00', 'reza ari', 'reza ari', 'Nanang,Syairi,Huzai', 'RFU', 'bracket berkarat'),
(172, 1, '2018-04-11', 1, 'D4-046', 'BUS', 172, 142, 'CSA J5', '07:00:00', '09:45:00', '10:10:00', 48, 67, 135, '10:10:00', '10:20:00', 'reza ari', 'reza ari', 'Nanang,Syairi,Huzai', 'RFU', 'BAD CONDUIT '),
(173, 1, '2018-04-11', 1, 'D4-080', 'BUS', 172, 142, 'CSA J5', '07:00:00', '09:30:00', '09:40:00', 48, 67, 135, '09:40:00', '10:10:00', 'reza ari', 'reza ari', 'Nanang,Syairi,Huzai', 'RFU', 'bad conduit'),
(174, 2, '2018-04-11', 1, 'PT 25', '', 117, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 152, '12:00:00', '13:30:00', 'Reza Ari', 'Reza Ari', 'Taufik, Sudin, Andi', 'RFU', 'poll tidak bisa turun'),
(175, 1, '2018-04-11', 1, 'D4-068', 'BS', 181, 143, 'WORKSHOP MIA4', '07:00:00', '00:00:00', '00:00:00', 65, 92, 135, '09:00:00', '09:26:00', 'SAMSUDIN', 'SAMSUDIN', 'SUDIN, ERWIN, ANDI', 'RFU', 'BAD CONDUIT'),
(176, 1, '2018-04-11', 1, 'D4-088', 'BS', 181, 143, 'WORKSHOP MIA4', '07:00:00', '00:00:00', '00:00:00', 65, 92, 135, '09:35:00', '09:49:00', 'SAMSUDIN', 'SAMSUDIN', 'SUDIN, ERWIN, ANDI', 'RFU', 'BAD CONDUIT'),
(177, 1, '2018-04-11', 1, 'D4-075', 'BS', 181, 143, 'WORKSHOP MIA4', '07:00:00', '00:00:00', '00:00:00', 65, 92, 135, '10:10:00', '10:37:00', 'SAMSUDIN', 'SAMSUDIN', 'SUDIN, ERWIN, ANDI', 'RFU', 'BAD CONDUIT'),
(178, 1, '2018-04-11', 1, 'D4-023', 'BS', 181, 143, 'WORKSHOP MIA4', '07:00:00', '00:00:00', '00:00:00', 65, 92, 190, '11:10:00', '11:35:00', 'SAMSUDIN', 'SAMSUDIN', 'SUDIN, ERWIN, ANDI', 'RFU', 'BRACKET BERKARAT, CONDUIT GPS DALAM BELUM ADA HEATSHINK, BOLT WB KURANG 1, BEEP SOUND PROBLEM'),
(179, 1, '2018-04-11', 1, 'D4-069', 'Operasi', 172, 142, 'N3', '07:00:00', '10:00:00', '10:05:00', 48, 67, 168, '10:05:00', '10:10:00', 'Dispatcher', 'Dispatcher', 'Taufik', 'RFU', '-'),
(180, 1, '2018-04-11', 1, 'D5-009', 'Operasi', 172, 142, 'N3', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '10:15:00', '10:20:00', 'Dispatcher', 'Dispatcher', 'Taufik', 'RFU', '-'),
(181, 1, '2018-04-11', 1, 'D5-018', 'Operasi', 172, 142, 'N1', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '10:20:00', '10:25:00', 'Dispatcher', 'Dispatcher', 'Taufik', 'RFU', '-'),
(182, 1, '2018-04-11', 1, 'D3-064', 'Operasi', 172, 142, 'N1', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '10:25:00', '10:30:00', 'Dispatcher', 'Dispatcher', 'Taufik', 'RFU', '-'),
(183, 1, '2018-04-10', 1, 'D5-016', 'BUS', 187, 144, 'CSA N1', '07:00:00', '14:00:00', '15:00:00', 188, 189, 171, '15:00:00', '16:20:00', 'reza ari', 'reza ari', 'Sudin,Aris,Huzai', 'RFU', 'cable & conduit bad'),
(184, 2, '2018-04-11', 1, 'PT 18', '', 121, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 32, '11:00:00', '15:30:00', 'Reza A P', 'Reza A P', 'Nanang, Ujai, Syairi', 'RFU', 'Need Rekondisi'),
(185, 1, '2018-04-11', 2, 'D3-377', 'BUS', 172, 142, 'CSA OB2', '17:00:00', '08:00:00', '08:20:00', 48, 67, 135, '08:20:00', '08:30:00', 'Dispatch', 'Dispatch', 'pedy,adnan', 'RFU', 'Nilai value ketika di bad_mojo tidak bisa 1'),
(186, 1, '2018-04-11', 2, 'D4-022', 'BUS', 172, 142, 'CSA OB2', '17:00:00', '08:30:00', '08:55:00', 48, 67, 135, '08:55:00', '09:10:00', 'Dispatch', 'Dispatch', 'pedy,adnan', 'RFU', 'BAD CONDUIT'),
(187, 1, '2018-04-11', 2, 'D3-386', 'BUS', 172, 142, 'CSA OB2', '17:00:00', '09:10:00', '09:30:00', 48, 67, 135, '09:30:00', '09:40:00', 'Dispatch', 'Dispatch', 'pedy,adnan', 'RFU', '-'),
(188, 1, '2018-04-11', 2, 'D4-006', 'BUS', 172, 142, 'CSA OB2', '17:00:00', '11:30:00', '12:10:00', 48, 67, 135, '12:10:00', '12:20:00', 'Dispatch', 'Dispatch', 'pedy,adnan', 'RFU', 'Bd conduit'),
(189, 1, '2018-04-11', 2, 'D3-163', 'BUS', 172, 142, 'CSA OB2', '17:00:00', '01:00:00', '01:20:00', 48, 67, 135, '01:20:00', '01:35:00', 'Dispatch', 'Dispatch', 'pedy,adnan', 'RFU', 'bad counduit'),
(190, 1, '2018-04-11', 2, 'D4-082', 'BUS', 172, 142, 'CSA OB2', '17:00:00', '01:30:00', '01:50:00', 48, 67, 135, '01:50:00', '02:00:00', 'Dispatch', 'Dispatch', 'pedy,adnan', 'RFU', 'BAD COUNDUIT'),
(191, 1, '2018-04-11', 2, 'D4-010', 'BUS', 172, 142, 'CSA OB2', '17:00:00', '02:10:00', '02:30:00', 48, 67, 135, '02:30:00', '02:40:00', 'Dispatch', 'Dispatch', 'pedy,adnan', 'RFU', 'bad counduit'),
(192, 1, '2018-04-11', 2, 'D3-388', 'BUS', 172, 142, 'CSA OB2', '17:00:00', '02:50:00', '03:10:00', 48, 67, 135, '03:10:00', '03:20:00', 'Dispatch', 'Dispatch', 'pedy,adnan', 'RFU', '-'),
(193, 1, '2018-04-10', 1, 'D3-092', 'BUS', 182, 146, 'CSA WARA', '07:00:00', '09:00:00', '09:30:00', 64, 86, 156, '09:30:00', '10:00:00', 'REZA ARI P.', 'REZA ARI P.', 'SUDIN, ARIS, HUZAI', 'NOT RFU', '-'),
(194, 1, '2018-04-10', 1, 'D3-169', 'BUS', 182, 146, 'CSA WARA', '07:00:00', '09:00:00', '09:30:00', 64, 86, 156, '09:30:00', '10:15:00', 'REZA ARI P.', 'REZA ARI P.', 'SUDIN, ARIS, HUZAI', 'NOT RFU', '-'),
(195, 1, '2018-04-12', 1, 'D3-147', 'OPERASI', 173, 142, 'N1', '07:00:00', '00:00:00', '00:00:00', 49, 69, 191, '09:00:00', '09:05:10', 'DISPATCHER', 'DISPACTHER', 'HUZAI', 'RFU', '-'),
(196, 1, '2018-04-12', 1, 'D3-372', 'OPERASI', 173, 142, 'IPD', '07:00:00', '00:00:00', '00:00:00', 49, 69, 191, '09:45:00', '09:50:00', 'DISPATCHER', 'DISPACTHER', 'HUZAI', 'RFU', '-'),
(197, 2, '2018-04-12', 1, 'PT 09', '', 115, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 27, '09:00:00', '09:20:00', 'Reza', 'Reza', 'Andi, Nanang, Syairi', 'CLOSED', 'Portable need Rekondisi'),
(198, 2, '2018-04-12', 1, 'PT 25', '', 117, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 32, '11:50:00', '13:00:00', 'Reza', 'Reza', 'Andi, Nanang, Syairi', 'CLOSED', 'poll tidak bisa turun'),
(199, 1, '2018-04-12', 2, 'D4-064', 'bus', 98, 142, 'n3', '17:00:00', '10:00:00', '10:30:00', 50, 68, 135, '10:30:00', '10:40:00', 'disparcher', 'dispatcher', 'adnan,pedy', 'rfu', 'bracket wb tidak ada, bad conduit'),
(200, 1, '2018-04-12', 2, 'D4-063', 'bus', 172, 142, 'n3', '17:00:00', '10:00:00', '10:50:00', 48, 67, 135, '10:50:00', '11:00:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'bad conduit & bracket'),
(201, 1, '2018-04-12', 2, 'D4-066', 'bus', 172, 142, 'n3', '17:00:00', '10:00:00', '10:55:00', 48, 67, 135, '10:55:00', '11:05:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'Antena RH none, bracket berkarat, conduit bad'),
(202, 1, '2018-04-12', 2, 'D4-060', 'bus', 172, 142, 'n3', '17:00:00', '11:00:00', '11:30:00', 48, 67, 135, '11:30:00', '11:45:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'BAD CONDUIT'),
(203, 1, '2018-04-12', 2, 'D4-074', 'bus', 172, 142, 'n3', '17:00:00', '11:45:00', '12:20:00', 48, 67, 135, '12:20:00', '12:35:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', '-'),
(204, 1, '2018-04-12', 2, 'D5-032', 'bus', 172, 142, 'n3', '17:00:00', '12:00:00', '01:00:00', 48, 67, 135, '01:00:00', '01:15:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', '-'),
(205, 1, '2018-04-12', 2, 'D3-053', 'bus', 172, 142, 'n3', '17:00:00', '01:15:00', '02:30:00', 48, 67, 135, '02:30:00', '02:40:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'bad conduit'),
(206, 1, '2018-04-12', 2, 'D5-031', 'bus', 172, 142, 'n3', '17:00:00', '02:45:00', '02:50:00', 48, 67, 135, '02:50:00', '03:00:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'bad conduit'),
(207, 1, '2018-04-12', 2, 'D3-046', 'BUS', 172, 142, 'N3', '17:00:00', '11:25:00', '11:40:00', 48, 67, 135, '11:40:00', '11:50:00', 'dispatcher', 'dispatcher', 'ADNAN,PEDY', 'RFU', '-'),
(208, 1, '2018-04-12', 2, 'D5-026', 'BUS', 172, 142, 'N3', '17:00:00', '12:15:00', '12:30:00', 48, 67, 135, '12:30:00', '12:40:00', 'dispatcher', 'dispatcher', 'ADNAN,PEDY', 'RFU', '-'),
(209, 1, '2018-04-13', 1, 'D4-001', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '10:00:00', '10:20:00', 48, 67, 135, '10:20:00', '10:30:00', 'DISPATCHER', 'DISPATCHER', 'TAUFIK, HUZAI, ERWIN', 'RFU', 'cable n coundiut bad'),
(210, 1, '2018-04-13', 1, 'D4-092', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '10:40:00', '10:50:00', 48, 67, 135, '10:50:00', '11:00:00', 'DISPATCHER', 'DISPATCHER', 'TAUFIK, HUZAI, ERWIN', 'RFU', 'bad counduit'),
(211, 1, '2018-04-13', 1, 'D4-006', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '11:00:00', '11:05:00', 48, 67, 135, '11:05:00', '11:15:00', 'DISPATCHER', 'DISPATCHER', 'TAUFIK, HUZAI, ERWIN', 'RFU', 'Bad conduit'),
(212, 1, '2018-04-13', 1, 'D4-043', 'BUS', 177, 142, 'csa OB2', '07:00:00', '10:00:00', '10:20:00', 52, 93, 135, '10:20:00', '10:40:00', 'reza ari', 'reza ari', 'Taufik, Khuzai, Erwin', 'RFU', 'cable n counduit bad'),
(213, 1, '2018-04-13', 1, 'D3-397', 'BUS', 172, 142, 'csa OB2', '07:00:00', '10:20:00', '10:30:00', 48, 67, 135, '10:30:00', '10:45:00', 'reza ari', 'reza ari', 'Taufik, Khuzai, Erwin', 'RFU', 'vhms n/a'),
(214, 2, '2018-04-13', 1, 'PT 26', '', 121, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 46, '08:30:00', '09:00:00', 'Reza', 'Reza', 'Andi, Nanang, Syairi', 'Closed', 'Change DC-DC 24v'),
(215, 2, '2018-04-13', 1, 'PT 09', '', 121, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 30, '09:20:00', '09:50:00', 'Reza', 'Reza', 'Andi, Nanang, Syairi', 'Closed', 'Portable need Rekondisi'),
(216, 1, '2018-04-13', 1, 'D4-039', 'BUS', 98, 142, 'OB2', '07:00:00', '10:10:00', '10:30:00', 50, 68, 135, '10:30:00', '11:20:00', 'REZA ', 'Reza', 'ERWIN, TAUFIK, HUJAI', 'RFU', 'repair connector dan pin amps23'),
(217, 1, '2018-04-13', 2, 'D3-109', 'bus', 172, 142, 'n3', '17:00:00', '10:00:00', '10:30:00', 48, 67, 135, '10:30:00', '10:40:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'bad conduit'),
(218, 1, '2018-04-13', 2, 'D5-004', 'bus', 172, 142, 'n3', '17:00:00', '10:10:00', '11:40:00', 48, 67, 135, '11:40:00', '11:55:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'anten kanan n/a'),
(219, 1, '2018-04-13', 2, 'D3-095', 'bus', 172, 142, 'n3', '17:00:00', '10:40:00', '11:25:00', 48, 67, 135, '11:25:00', '11:35:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'brkcket antena bad'),
(220, 1, '2018-04-13', 2, 'D4-068', 'bus', 173, 142, 'n3', '17:00:00', '11:25:00', '11:40:00', 50, 68, 135, '11:40:00', '11:55:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'BAD CONDUIT'),
(221, 1, '2018-04-13', 2, 'D3-094', 'bus', 172, 142, 'n3', '17:00:00', '11:30:00', '12:00:00', 48, 67, 135, '12:00:00', '12:15:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'bad conduit'),
(222, 1, '2018-04-13', 2, 'D3-186', 'bus', 172, 142, 'n1', '17:00:00', '12:15:00', '12:45:00', 48, 67, 135, '12:45:00', '12:55:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'bad conduit'),
(223, 1, '2018-04-13', 2, 'D3-047', 'BUS', 172, 142, 'N1', '17:00:00', '11:25:00', '11:40:00', 48, 67, 135, '11:40:00', '00:00:11', 'dispatcher', 'dispatcher', 'ADNAN,PEDY', 'RFU', 'bad conduit'),
(224, 1, '2018-04-13', 2, 'D4-054', 'BUS', 172, 142, 'N1', '17:00:00', '12:15:00', '12:30:00', 48, 67, 135, '12:30:00', '12:40:00', 'dispatcher', 'dispatcher', 'ADNAN,PEDY', 'RFU', 'BAD COUNDUIT'),
(225, 1, '2018-04-13', 2, 'D3-150', 'BUS', 172, 142, 'N1', '17:00:00', '12:40:00', '12:45:00', 48, 67, 135, '12:45:00', '12:55:00', 'dispatcher', 'dispatcher', 'ADNAN,PEDY', 'RFU', 'bad conduit'),
(226, 1, '2018-04-13', 2, 'D4-059', 'BUS', 98, 142, 'N1', '17:00:00', '10:25:00', '10:30:00', 48, 67, 135, '10:30:00', '10:40:00', 'dispatcher', 'dispatcher', 'ADNAN,PEDY', 'RFU', 'BAD CABLE & CONDUIT, BRACKET BERKARAT'),
(227, 1, '2018-04-13', 2, 'D5-015', 'BUS', 172, 142, 'N1', '17:00:00', '12:55:00', '01:00:00', 48, 67, 135, '01:00:00', '01:10:00', 'dispatcher', 'dispatcher', 'ADNAN,PEDY', 'RFU', '-'),
(228, 1, '2018-04-13', 1, 'D4-049', 'STB', 172, 142, 'CSA N1', '07:00:00', '00:00:00', '00:00:00', 48, 67, 135, '15:00:00', '15:15:00', 'Reza', 'Reza', 'Andi, Erwin, Khuzaimi', 'RFU', 'bad conduit'),
(229, 1, '2018-04-13', 1, 'D4-034', 'STB', 172, 142, 'CSA N1', '07:00:00', '00:00:00', '00:00:00', 48, 67, 135, '15:15:00', '15:30:00', 'Reza', 'Reza', 'Andi, Erwin, Khuzaimi', 'RFU', 'No bracket router'),
(230, 2, '2018-04-14', 1, 'PT 29', '', 115, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 27, '08:30:00', '09:00:00', 'Reza', 'Reza', 'Nanang, Andi, Syairi', 'Closed', 'Bracket perangkat bad, groud petir bad, winch bawah bad, stiker titik jepit bad, nomer portable tidak ada, pole atas stuck.'),
(231, 1, '2018-04-14', 1, 'D5-032', 'BS', 181, 143, 'MIA4', '07:00:00', '00:00:00', '00:00:00', 65, 92, 190, '09:00:00', '09:40:00', 'REZA', 'REZA', 'SUDIN, ERWIN', 'RFU', '-'),
(232, 1, '2018-04-14', 1, 'D4-041', 'BUS', 172, 142, 'CSA J5', '07:00:00', '09:00:00', '09:20:00', 48, 67, 135, '09:20:00', '09:30:00', 'DISPATCHER', 'DISPATCHER', 'TAUFIK, HUZAI', 'RFU', 'bad conduit'),
(233, 1, '2018-04-14', 1, 'D4-063', 'BS', 181, 143, 'MIA4', '07:00:00', '00:00:00', '00:00:00', 65, 92, 190, '09:40:00', '10:20:00', 'REZA', 'REZA', 'SUDIN, ERWIN', 'RFU', 'bad conduit & bracket'),
(234, 1, '2018-04-14', 1, 'D3-178', 'BUS', 172, 142, 'CSA J5', '07:00:00', '09:30:00', '09:55:00', 48, 67, 135, '09:55:00', '10:05:00', 'DISPATCHER', 'DISPATCHER', 'TAUFIK, HUZAI', 'RFU', 'bad counduit, ram mojo bad'),
(235, 1, '2018-04-14', 1, 'D3-054', 'BUS', 172, 142, 'CSA J5', '07:00:00', '09:30:00', '10:00:00', 48, 67, 135, '10:00:00', '10:10:00', 'DISPATCHER', 'DISPATCHER', 'TAUFIK, HUZAI', 'RFU', 'cable & conduit bad'),
(236, 1, '2018-04-14', 1, 'D4-077', 'BS', 181, 143, 'MIA4', '07:00:00', '00:00:00', '00:00:00', 65, 92, 190, '10:20:00', '11:00:00', 'REZA', 'REZA', 'SUDIN, ERWIN', 'RFU', 'BAD CONDUIT'),
(237, 1, '2018-04-14', 1, 'D4-100', 'BS', 181, 143, 'MIA4', '07:00:00', '00:00:00', '00:00:00', 65, 92, 190, '11:00:00', '12:00:00', 'REZA', 'REZA', 'SUDIN, ERWIN', 'RFU', 'Bad conduit, install relay'),
(238, 1, '2018-04-14', 1, 'D4-080', 'BUS', 172, 142, 'CSA J5', '07:00:00', '09:00:00', '09:30:00', 48, 67, 135, '09:30:00', '09:45:00', 'Reza Ari', 'Reza Ari', 'Taufik, Khuzaimi', 'RFU', 'bad conduit, Bracket antenna berkarat'),
(239, 1, '2018-04-14', 1, 'D3-117', 'BUS', 172, 142, 'CSA J5', '07:00:00', '09:30:00', '10:00:00', 48, 67, 135, '10:00:00', '10:15:00', 'Reza Ari', 'Reza Ari', 'Taufik, Khuzaimi', 'RFU', 'BAD CONDUIT'),
(240, 2, '2018-04-14', 1, 'PT 29', '', 115, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 27, '09:30:00', '10:10:00', 'REZA ARI P.', 'REZA ARI P.', 'SYAIRI, NANANG, ANDI', 'RFU', 'Bracket perangkat bad, groud petir bad, winch bawah bad, stiker titik jepit bad, nomer portable tidak ada, pole atas stuck.'),
(241, 2, '2018-04-14', 1, 'PT 10', '', 119, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 46, '14:20:00', '15:00:00', 'REZA ARI P.', 'REZA ARI P.', 'SYAIRI, NANANG, ANDI', 'RFU', 'Switch dan DC DC dilepas'),
(242, 2, '2018-04-14', 1, 'PT 10', '', 121, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 32, '15:30:00', '16:20:00', 'REZA ARI P.', 'REZA ARI P.', 'SYAIRI, NANANG, ANDI', 'RFU', 'Switch dan DC DC dilepas - MOVING KE MIA4'),
(243, 1, '2018-04-14', 2, 'D3-063', 'bus', 172, 142, 'n3', '17:00:00', '09:50:00', '10:00:00', 48, 67, 135, '10:00:00', '10:15:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'bad conduit'),
(244, 1, '2018-04-14', 2, 'D4-062', 'bus', 172, 142, 'n3', '17:00:00', '10:15:00', '10:25:00', 48, 67, 135, '10:25:00', '10:40:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'Bracket Antenna Berkarat, Bad conduit'),
(245, 1, '2018-04-14', 2, 'D5-027', 'bus', 172, 142, 'n4', '17:00:00', '11:00:00', '12:00:00', 48, 67, 135, '12:00:00', '15:15:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'bad conduit'),
(246, 1, '2018-04-14', 2, 'D5-023', 'bus', 172, 142, 'n1', '17:00:00', '12:15:00', '01:10:00', 48, 67, 135, '01:10:00', '01:20:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'X'),
(249, 1, '2018-04-14', 2, 'D3-079', 'bus', 172, 142, 'n1', '17:00:00', '02:00:00', '02:10:00', 48, 67, 135, '02:10:00', '02:20:00', 'dispatcher', 'dispatcher', 'adnan,pedy', 'rfu', 'bad conduit'),
(250, 1, '2018-04-14', 2, 'D5-004', 'BUS', 98, 142, 'N1', '17:00:00', '22:00:00', '22:30:00', 48, 67, 135, '22:30:00', '22:40:00', 'DISPATCHER', 'DISPACTHER', 'pedy,adnan', 'RFU', 'anten kanan n/a'),
(251, 1, '2018-04-14', 2, 'D5-023', 'BUS', 98, 142, 'CSA N3', '17:00:00', '21:40:00', '22:10:00', 48, 67, 135, '22:10:00', '22:25:00', 'DISPATCHER', 'DISPACTHER', 'pedy,adnan', 'RFU', '-'),
(252, 1, '2018-04-14', 2, 'D4-049', 'BUS', 98, 142, 'N3', '17:00:00', '22:00:00', '22:30:00', 48, 67, 135, '22:30:00', '22:50:00', 'DISPATCHER', 'DISPACTHER', 'pedy,adnan', 'RFU', 'bad conduit'),
(253, 1, '2018-04-14', 2, 'D4-048', 'BUS', 98, 142, 'N3', '17:00:00', '23:00:00', '23:30:00', 48, 67, 135, '23:30:00', '23:45:00', 'DISPATCHER', 'DISPACTHER', 'pedy,adnan', 'RFU', 'bad counduit'),
(254, 1, '2018-04-14', 2, 'D3-046', 'BUS', 98, 142, 'n1', '17:00:00', '23:50:00', '00:30:00', 48, 67, 135, '00:30:00', '00:40:00', 'DISPATCHER', 'DISPACTHER', 'pedy,adnan', 'RFU', '-'),
(255, 1, '2018-04-14', 2, 'D4-059', 'BUS', 98, 142, 'n3', '17:00:00', '00:50:00', '01:20:00', 48, 67, 135, '01:20:00', '01:30:00', 'DISPATCHER', 'DISPACTHER', 'pedy,adnan', 'RFU', 'BAD CABLE & CONDUIT, BRACKET BERKARAT'),
(256, 1, '2018-04-14', 2, 'D5-005', 'BUS', 98, 142, 'N3', '17:00:00', '01:20:00', '01:50:00', 48, 67, 135, '01:50:00', '02:00:00', 'DISPATCHER', 'DISPACTHER', 'pedy,adnan', 'RFU', 'bad counduit'),
(257, 1, '2018-04-14', 2, 'D4-050', 'BUS', 98, 142, 'N3', '17:00:00', '02:00:00', '02:20:00', 48, 67, 135, '02:20:00', '02:30:00', 'DISPATCHER', 'DISPACTHER', 'pedy,adnan', 'RFU', 'bad counduit'),
(258, 1, '2018-04-15', 1, 'D3-122', 'BUS', 98, 142, 'CSA OB2', '07:00:00', '08:30:00', '08:50:00', 60, 70, 163, '08:50:00', '09:20:00', 'DISPATCHER', 'DISPATCHER', 'SUDIN, HUZAI, ERWIN', 'RFU', 'bracket berkarat,conduit bad,ram mounting bad'),
(259, 1, '2018-04-15', 1, 'D3-167', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '09:20:00', '09:30:00', 48, 67, 135, '09:30:00', '09:40:00', 'DISPATCHER', 'DISPATCHER', 'SUDIN, HUZAI, ERWIN', 'RFU', 'bracket antenna berkarat'),
(260, 2, '2018-04-15', 1, 'PT 02', '', 121, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 32, '09:00:00', '11:30:00', 'Reza Ari', 'Reza Ari', 'Taufik, Syairi', 'RFU', 'Cover Area PAAP Project'),
(261, 1, '2018-04-15', 1, 'D3-398', 'BUS', 172, 142, 'OB2', '07:00:00', '09:00:00', '09:30:00', 48, 67, 135, '09:30:00', '09:40:00', 'REZA', 'REZA', 'SUDIN, ERWIN, HUJAI', 'RFU', '-'),
(262, 1, '2018-04-15', 1, 'D4-025', 'BUS', 172, 142, 'OB2', '07:00:00', '09:00:00', '09:30:00', 48, 67, 135, '09:50:00', '10:00:00', 'REZA', 'REZA', 'SUDIN, ERWIN, HUJAI', 'RFU', ' Bad conduit'),
(263, 1, '2018-04-15', 1, 'D3-063', 'BUS', 172, 142, 'N3', '07:00:00', '14:30:00', '15:00:00', 48, 67, 135, '15:00:00', '15:10:00', 'REZA', 'REZA', 'SUDIN, ERWIN, HUJAI', 'RFU', 'bad cable & conduit, lock amps23 patah, ');
INSERT INTO `reportingjob` (`IDReport`, `id_device`, `date`, `shift`, `id_unit`, `bd_type`, `problem`, `category`, `location`, `time_problem`, `wait_start`, `wait_end`, `analysis`, `case`, `activity`, `start_action`, `end_action`, `bd_receiver`, `rfu_receiver`, `pic`, `status`, `remark`) VALUES
(264, 1, '2018-04-15', 1, 'D4-074', 'BUS', 172, 142, 'N3', '07:00:00', '14:30:00', '15:00:00', 48, 67, 135, '15:30:00', '15:40:00', 'REZA', 'REZA', 'SUDIN, ERWIN, HUJAI', 'RFU', 'Bad conduit, braket wb n/4'),
(265, 1, '2018-04-15', 1, 'D5-028', 'BUS', 98, 142, 'CSA N3', '07:00:00', '14:00:00', '14:20:00', 55, 70, 163, '14:20:00', '14:40:00', 'DISPATCHER', 'DISPATCHER', 'SUDIN, HUZAI, ERWIN', 'RFU', 'connector antenna kiri L'),
(266, 2, '2018-04-15', 1, 'PT 25', '', 116, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 34, '14:30:00', '15:00:00', 'Reza A P', 'Reza A P', 'Syairi, Taufik', 'RFU', 'poll tidak bisa turun'),
(267, 1, '2018-04-15', 2, 'D3-319', 'BUS', 172, 142, 'CSA N3', '17:00:00', '22:00:00', '22:15:00', 48, 67, 135, '22:15:00', '22:30:00', 'DISPATCHER', 'DISPATCHER', 'Pedy, Andi', 'RFU', '-'),
(268, 1, '2018-04-15', 2, 'D4-058', 'BUS', 172, 142, 'CSA N3', '17:00:00', '22:30:00', '22:40:00', 48, 67, 135, '22:40:00', '22:50:00', 'DISPATCHER', 'DISPATCHER', 'Pedy, Andi', 'RFU', 'Bad conduit, SN mojo buram'),
(269, 1, '2018-04-15', 2, 'D3-084', 'BUS', 98, 142, 'CSA N3', '17:00:00', '22:50:00', '23:20:00', 57, 68, 135, '23:20:00', '23:30:00', 'DISPATCHER', 'DISPATCHER', 'Pedy, Andi', 'RFU', 'Lock ampseal 8 patah, GPS Problem'),
(270, 1, '2018-04-15', 2, 'D3-088', 'BUS', 172, 142, 'CSA N3', '17:00:00', '23:30:00', '23:50:00', 48, 67, 135, '23:50:00', '00:00:00', 'DISPATCHER', 'DISPATCHER', 'Pedy, Andi', 'RFU', '-'),
(271, 1, '2018-04-15', 2, 'D4-074', 'BUS', 172, 142, 'CSA N3', '17:00:00', '00:00:00', '00:10:00', 48, 67, 135, '00:10:00', '00:20:00', 'DISPATCHER', 'DISPACTHER', 'Pedy, Andi', 'RFU', 'Bad conduit, braket wb n/4'),
(272, 1, '2018-04-15', 2, 'D3-091', 'BUS', 172, 142, 'CSA N3', '17:00:00', '00:20:00', '00:30:00', 48, 67, 135, '00:30:00', '00:50:00', 'DISPATCHER', 'DISPACTHER', 'Pedy, Andi', 'RFU', 'Ram Mojo Bad'),
(273, 1, '2018-04-15', 2, 'D5-027', 'BUS', 172, 142, 'CSA N3', '17:00:00', '00:50:00', '01:00:00', 48, 67, 135, '01:00:00', '01:20:00', 'DISPATCHER', 'DISPACTHER', 'Pedy, Andi', 'RFU', 'bad conduit'),
(274, 1, '2018-04-15', 2, 'D3-094', 'BUS', 172, 142, 'CSA N3', '17:00:00', '01:20:00', '01:40:00', 48, 67, 135, '01:40:00', '02:00:00', 'DISPATCHER', 'DISPACTHER', 'Pedy, Andi', 'RFU', 'bad conduit'),
(275, 1, '2018-04-15', 2, 'D4-048', 'BUS', 172, 142, 'CSA N3', '17:00:00', '02:00:00', '02:30:00', 48, 67, 135, '02:30:00', '02:40:00', 'DISPATCHER', 'DISPACTHER', 'Pedy, Andi', 'RFU', 'bad counduit'),
(276, 1, '2018-04-15', 2, 'D4-050', 'BUS', 172, 142, 'CSA N3', '17:00:00', '02:40:00', '02:50:00', 48, 67, 135, '02:50:00', '03:00:00', 'DISPATCHER', 'DISPACTHER', 'Pedy, Andi', 'RFU', 'bad counduit'),
(277, 1, '2018-04-15', 2, 'D5-002', 'BUS', 98, 142, 'CSA N4', '17:00:00', '03:10:00', '03:30:00', 48, 67, 135, '03:30:00', '03:40:00', 'DISPATCHER', 'DISPACTHER', 'Pedy, Andi', 'RFU', 'No bracket Router'),
(278, 1, '2018-04-15', 1, 'D3-121', 'BUS', 172, 142, 'CSA N3', '17:00:00', '09:25:00', '09:45:00', 48, 67, 135, '09:45:00', '10:00:00', 'REZA ARI P.', 'DISPACTHER', 'SUDIN, ERWIN, KHUZAI', 'RFU', 'counduit bad, ram mojo bad, BRACKET BERKARAT, DCDC24V'),
(279, 1, '2018-04-15', 1, 'D4-002', 'BUS', 172, 142, 'CSA OB2', '17:00:00', '10:15:00', '10:25:00', 48, 67, 135, '10:25:00', '10:40:00', 'REZA ARI P.', 'DISPACTHER', 'SUDIN, ERWIN, KHUZAI', 'RFU', 'bracket wifibox n/a'),
(280, 1, '2018-04-15', 1, 'D3-390', 'BUS', 172, 142, 'CSA OB2', '17:00:00', '11:10:00', '11:20:00', 48, 67, 135, '11:20:00', '11:35:00', 'REZA ARI P.', 'DISPACTHER', 'SUDIN, ERWIN, KHUZAI', 'RFU', 'LH : 5490\r\nRH : 5344'),
(281, 1, '2018-04-15', 1, 'D4-028', 'BUS', 172, 142, 'CSA OB2', '17:00:00', '11:40:00', '11:50:00', 48, 67, 135, '11:50:00', '11:59:00', 'REZA ARI P.', 'DISPACTHER', 'SUDIN, ERWIN, KHUZAI', 'RFU', 'BAD CONDUIT'),
(282, 1, '2018-04-15', 1, 'D4-001', 'BUS', 172, 142, 'CSA OB2', '17:00:00', '12:00:00', '12:10:00', 48, 67, 135, '12:10:00', '12:19:00', 'REZA ARI P.', 'DISPACTHER', 'SUDIN, ERWIN, KHUZAI', 'RFU', 'cable, coundiut bad'),
(283, 1, '2018-04-16', 1, 'D4-103', 'OPERASI', 172, 142, 'IPD', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '09:00:00', '09:05:00', 'DISPATCHER', 'DISPACTHER', 'HUZAI', 'RFU', '-'),
(284, 1, '2018-04-16', 1, 'D5-018', 'OPERASI', 172, 142, 'N1', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '09:05:00', '09:10:00', 'DISPATCHER', 'DISPACTHER', 'HUZAI', 'RFU', '-'),
(285, 1, '2018-04-16', 1, 'D3-112', 'OPERASI', 172, 142, 'N4', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '09:10:00', '09:15:00', 'DISPATCHER', 'DISPACTHER', 'HUZAI', 'RFU', '-'),
(286, 1, '2018-04-16', 1, 'D5-009', 'OPERASI', 172, 142, 'N4', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '09:15:00', '09:20:00', 'DISPATCHER', 'DISPACTHER', 'HUZAI', 'RFU', '-'),
(287, 1, '2018-04-16', 1, 'D5-003', 'BS', 181, 143, 'Ws mia4', '07:00:00', '00:00:00', '00:00:00', 65, 92, 190, '10:00:00', '11:00:00', 'Sutarno', 'Sutarno', 'Nanang, erwin', 'RFU', 'Bracket wb none,conduit bad'),
(288, 1, '2018-04-16', 2, 'D3-181', 'BUS', 172, 142, 'CSA N1', '17:00:00', '22:00:00', '22:40:00', 48, 67, 135, '22:40:00', '22:50:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'Bad Conduit'),
(289, 1, '2018-04-16', 2, 'D3-180', 'BUS', 172, 142, 'CSA N1', '17:00:00', '22:50:00', '23:30:00', 48, 67, 135, '23:30:00', '23:40:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'Bad bracket antenna and conduit'),
(290, 1, '2018-04-16', 2, 'D5-015', 'BUS', 172, 142, 'CSA N1', '17:00:00', '23:40:00', '00:20:00', 48, 67, 135, '00:20:00', '00:30:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', '-'),
(291, 1, '2018-04-16', 2, 'D5-011', 'BUS', 172, 142, 'CSA N1', '17:00:00', '00:10:00', '00:45:00', 48, 67, 135, '00:45:00', '01:00:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', '-'),
(292, 1, '2018-04-16', 2, 'D5-020', 'BUS', 172, 142, 'CSA N1', '17:00:00', '01:00:00', '01:30:00', 48, 67, 135, '01:30:00', '01:45:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', '-'),
(293, 1, '2018-04-16', 2, 'D4-032', 'BUS', 98, 142, 'CSA N1', '17:00:00', '01:45:00', '02:15:00', 50, 68, 135, '02:15:00', '02:30:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'BAD CABLE & CONDUIT, NO SOUND BUZZER'),
(294, 1, '2018-04-16', 2, 'D3-154', 'BUS', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:30:00', 48, 67, 135, '00:30:00', '00:40:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'bad conduit'),
(295, 1, '2018-04-16', 2, 'D4-034', 'BUS', 172, 142, 'CSA N1', '17:00:00', '01:00:00', '01:20:00', 48, 67, 135, '01:20:00', '01:30:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'No bracket router'),
(296, 2, '2018-04-17', 1, 'PT 10', '', 127, 96, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 31, '08:00:00', '11:00:00', 'Reza', 'Reza', 'Nanang, Huzai, Erwin', 'Continue', 'None'),
(297, 2, '2018-04-17', 1, 'PT 25', '', 117, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 152, '11:30:00', '15:20:00', 'REZA', 'REZA', 'SUDIN, PEDY, HUZAI', 'RFU', '-'),
(298, 1, '2018-04-17', 1, 'D5-028', 'BUS', 175, 142, 'CSA N3', '07:00:00', '09:00:00', '09:30:00', 59, 81, 193, '09:30:00', '09:55:00', 'REZA AP', 'DISPATCHER', 'SUDIN, PEDY', 'RFU', 'connector antenna kiri L'),
(299, 2, '2018-04-17', 1, 'PT 10', '', 127, 96, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 31, '13:30:00', '16:30:00', 'Reza', 'Reza', 'Nanang, Ujai, Rwin', 'Continue', 'None'),
(300, 1, '2018-04-17', 2, 'D3-150', 'BUS', 172, 142, 'CSA N3\n', '17:00:00', '22:00:00', '22:30:00', 48, 67, 135, '22:30:00', '22:40:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'bad conduit'),
(301, 1, '2018-04-17', 2, 'D3-049', 'BUS', 172, 142, 'CSA N3', '17:00:00', '22:40:00', '23:20:00', 48, 67, 135, '23:20:00', '23:30:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'Bad conduit'),
(302, 1, '2018-04-17', 2, 'D3-053', 'BUS', 172, 142, 'CSA N4', '17:00:00', '23:30:00', '00:00:00', 48, 67, 135, '00:00:00', '00:10:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'bad conduit'),
(303, 1, '2018-04-17', 2, 'D5-008', 'BUS', 172, 142, 'CSA N4', '17:00:00', '00:10:00', '00:30:00', 48, 67, 135, '00:30:00', '00:40:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'No bracket router'),
(304, 1, '2018-04-17', 2, 'D4-066', 'BUS', 172, 142, 'CSA N4', '17:00:00', '00:40:00', '01:00:00', 48, 67, 135, '01:00:00', '01:10:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'Antena RH none, bracket berkarat, conduit bad, Bracket WB N/A'),
(305, 1, '2018-04-17', 2, 'D4-060', 'BUS', 172, 142, 'CSA N4', '17:00:00', '01:10:00', '01:30:00', 48, 67, 135, '01:30:00', '01:40:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'BAD CONDUIT'),
(306, 1, '2018-04-17', 2, 'D4-062', 'BUS', 172, 142, 'CSA N4', '17:00:00', '01:00:00', '01:20:00', 48, 67, 135, '01:20:00', '01:30:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'Bracket Antenna Berkarat, Bad conduit'),
(307, 1, '2018-04-17', 2, 'D3-095', 'BUS', 172, 142, 'CSA N4', '17:00:00', '01:40:00', '01:50:00', 48, 67, 135, '01:50:00', '02:10:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'brkcket antena bad'),
(308, 1, '2018-04-17', 2, 'D3-154', 'BUS', 172, 142, 'CSA N4', '17:00:00', '02:10:00', '02:30:00', 48, 67, 135, '02:30:00', '02:45:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'bad conduit'),
(309, 1, '2018-04-17', 2, 'D4-075', 'Operasi', 172, 142, 'N3', '17:00:00', '00:00:00', '00:00:00', 48, 67, 168, '20:20:00', '20:25:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'BAD CONDUIT'),
(310, 1, '2018-04-17', 2, 'D4-055', 'Operasi', 172, 142, 'N3', '17:00:00', '00:00:00', '00:00:00', 48, 67, 168, '20:30:00', '20:35:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', '-'),
(311, 1, '2018-04-17', 2, 'D3-147', 'Operasi', 172, 142, 'N3', '17:00:00', '00:00:00', '00:00:00', 48, 67, 168, '20:50:00', '20:55:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', '-'),
(312, 1, '2018-04-17', 2, 'D5-005', 'Operasi', 172, 142, 'N3', '17:00:00', '00:00:00', '00:00:00', 48, 67, 168, '21:10:00', '21:15:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'bad counduit'),
(313, 1, '2018-04-17', 1, 'D4-073', 'BUS', 172, 142, 'CSA N3', '07:00:00', '13:45:00', '14:40:00', 48, 67, 135, '14:40:00', '14:57:00', 'DISPATCHER', 'DISPACTHER', 'PEDY, SUDIN, ERWIN', 'RFU', 'BAD CONDUIT.'),
(314, 1, '2018-04-17', 1, 'D4-058', 'BUS', 172, 142, 'CSA N3', '07:00:00', '14:00:00', '14:20:00', 48, 67, 135, '14:20:00', '14:30:00', 'reza ari', 'reza ari', 'SUDIN, PEDY, HUZAI', 'RFU', 'Bad conduit, SN mojo buram, bracket berkarat'),
(315, 1, '2018-04-17', 1, 'D4-074', 'BUS', 172, 142, 'CSA N3', '07:00:00', '14:00:00', '14:20:00', 48, 67, 135, '14:20:00', '14:40:00', 'reza ari', 'reza ari', 'SUDIN, PEDY, HUZAI', 'RFU', 'braket wb n/4'),
(316, 1, '2018-04-18', 1, 'D4-007', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '09:15:00', '09:45:00', 48, 67, 135, '09:45:00', '10:00:00', 'REZA AP', 'DISPATCHER', 'SUDIN, PEDY, HUZAI', 'RFU', 'Bad conduit'),
(317, 1, '2018-04-18', 1, 'D4-006', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '09:00:00', '09:30:00', 48, 67, 135, '09:30:00', '09:45:00', 'reza ari', 'reza ari', 'pedy,sudin,jay', 'RFU', 'Bad conduit'),
(318, 1, '2018-04-18', 1, 'D4-025', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '09:30:00', '10:00:00', 48, 67, 135, '10:00:00', '10:20:00', 'reza ari', 'reza ari', 'pedy,sudin,jay', 'RFU', ' Bad conduit'),
(319, 1, '2018-04-18', 1, 'D4-043', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '10:30:00', '11:00:00', 48, 67, 135, '11:00:00', '11:15:00', 'reza ari', 'reza ari', 'pedy,sudin,jay', 'RFU', 'cable n counduit bad, kabel gps kencang, connector tnc gps indor bad'),
(320, 1, '2018-04-18', 1, 'D4-001', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '08:20:00', '08:35:00', 48, 67, 135, '08:35:00', '08:45:00', 'reza ari', 'reza ari', 'SUDIN, PEDY, HUZAI', 'RFU', 'cable, coundiut bad'),
(321, 1, '2018-04-18', 1, 'D4-011', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '08:45:00', '09:00:00', 48, 67, 135, '09:00:00', '09:10:00', 'reza ari', 'reza ari', 'SUDIN, PEDY, HUZAI', 'RFU', 'kabel antenna sebelah kanan putus'),
(322, 1, '2018-04-18', 1, 'D4-085', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '09:10:00', '09:30:00', 48, 67, 135, '09:30:00', '09:40:00', 'reza ari', 'reza ari', 'SUDIN, PEDY, HUZAI', 'RFU', 'bracket berkarat, conduit bad'),
(323, 1, '2018-04-18', 1, 'D3-395', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '09:45:00', '10:20:00', 48, 67, 135, '10:20:00', '10:30:00', 'reza ari', 'reza ari', 'SUDIN, PEDY, HUZAI', 'RFU', '-'),
(324, 1, '2018-04-18', 1, 'D5-016', 'OPERASI', 172, 142, 'N1', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '09:00:00', '09:10:00', 'REZA ARI P.', 'DISPACTHER', 'SUDIN', 'RFU', 'cable & conduit bad'),
(325, 1, '2018-04-18', 1, 'D3-397', 'OPERASI', 172, 142, 'OB2', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '09:20:00', '09:30:00', 'REZA ARI P.', 'DISPACTHER', 'SUDIN', 'RFU', 'vhms n/a'),
(326, 1, '2018-04-18', 1, 'D3-122', 'OPERASI', 172, 142, 'OB2', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '10:10:00', '10:20:00', 'REZA ARI P.', 'DISPACTHER', 'SUDIN', 'RFU', 'bracket berkarat,conduit bad,ram mounting bad'),
(327, 1, '2018-04-18', 1, 'D3-167', 'OPERASI', 172, 142, 'N3', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '09:50:00', '10:00:00', 'REZA ARI P.', 'DISPACTHER', 'SUDIN', 'RFU', 'bracket antenna berkarat'),
(328, 1, '2018-04-18', 1, 'D4-102', 'OPERASI', 98, 142, 'OB2', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '11:00:00', '11:10:00', 'REZA ARI P.', 'DISPACTHER', 'SUDIN', 'RFU', '-'),
(329, 1, '2018-04-18', 1, 'D5-017', 'OPERASI', 172, 142, 'N1', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '11:30:00', '11:40:00', 'REZA ARI P.', 'DISPACTHER', 'SUDIN', 'RFU', 'Bad conduit'),
(330, 2, '2018-04-18', 1, 'PT 25', '', 117, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 32, '11:30:00', '14:30:00', 'REZA ARI P.', 'REZA ARI P.', 'SYAIRI, ERWIN', 'CLOSED', '-'),
(331, 2, '2018-04-18', 1, 'PT 10', '', 132, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 44, '13:00:00', '16:35:00', 'REZA ARI P.', 'REZA ARI P.', 'SYAIRI, ERWIN', 'CLOSED', 'None'),
(332, 1, '2018-04-18', 2, 'D4-075', 'Operasi', 172, 142, 'CSA N3', '17:00:00', '00:00:00', '00:00:00', 48, 67, 168, '20:10:00', '20:15:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'BAD CONDUIT'),
(333, 1, '2018-04-19', 1, 'D4-050', 'BUS', 172, 142, 'N3', '07:00:00', '09:00:00', '09:30:00', 48, 67, 135, '09:30:00', '09:45:00', 'Sutarno', 'Sutarno', 'pedy,sudin,erwin,jay', 'RFU', 'bad counduit'),
(334, 1, '2018-04-19', 1, 'D4-047', 'BUS', 172, 142, 'N3', '07:00:00', '09:40:00', '10:30:00', 48, 67, 135, '10:30:00', '10:40:00', 'Sutarno', 'Sutarno', 'pedy,sudin,erwin,jay', 'RFU', 'bad counduit'),
(335, 1, '2018-04-19', 1, 'D4-065', 'BUS', 172, 142, 'CSA N3', '07:00:00', '08:30:00', '08:50:00', 48, 67, 135, '08:50:00', '09:00:00', 'SUTARNO', 'DISPATCHER', 'SUDIN, PEDY, HUZAI, ERWIN', 'RFU', 'bad conduit'),
(336, 1, '2018-04-19', 1, 'D3-053', 'BUS', 172, 142, 'CSA N3', '07:00:00', '09:00:00', '09:20:00', 48, 67, 135, '09:20:00', '09:30:00', 'SUTARNO', 'DISPATCHER', 'SUDIN, PEDY, HUZAI, ERWIN', 'RFU', 'bracket berkarat'),
(337, 1, '2018-04-19', 1, 'D3-181', 'BUS', 172, 142, 'CSA N3', '07:00:00', '09:30:00', '09:50:00', 48, 67, 135, '09:50:00', '10:00:00', 'SUTARNO', 'DISPATCHER', 'SUDIN, PEDY, HUZAI, ERWIN', 'RFU', '-'),
(338, 1, '2018-04-19', 1, 'D4-067', 'BUS', 172, 142, 'CSA N3', '07:00:00', '10:00:00', '10:30:00', 48, 67, 135, '10:30:00', '10:40:00', 'SUTARNO', 'DISPATCHER', 'SUDIN, PEDY, HUZAI, ERWIN', 'RFU', 'bad conduit'),
(339, 2, '2018-04-19', 1, 'PT 10', '', 127, 96, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 36, '08:00:00', '11:00:00', 'Sutarno', 'Sutarno', 'Syairi, Nanang', 'Continue', 'None'),
(340, 2, '2018-04-19', 1, 'PT 25', '', 117, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 32, '12:00:00', '13:30:00', 'Sutarno', 'Sutarno', 'Syairi, Nanang', 'RFU', '-'),
(341, 2, '2018-04-19', 2, 'PT 24', '', 115, 94, '', '17:00:00', '00:00:00', '00:00:00', 0, 0, 27, '02:00:00', '02:30:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'CLOSED', '-'),
(342, 1, '2018-04-19', 2, 'D3-147', 'OPERASI', 172, 142, 'N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 168, '20:00:00', '20:05:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', '-'),
(343, 1, '2018-04-19', 2, 'D4-023', 'OPERASI', 172, 142, 'OB2', '17:00:00', '00:00:00', '00:00:00', 48, 67, 168, '20:15:00', '20:20:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'BRACKET BERKARAT, CONDUIT GPS DALAM BELUM ADA HEATSHINK, BOLT WB KURANG 1, BEEP SOUND PROBLEM'),
(344, 1, '2018-04-19', 2, 'D4-102', 'OPERASI', 172, 142, 'OB2', '17:00:00', '00:00:00', '00:00:00', 48, 67, 168, '20:30:00', '20:35:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', '-'),
(345, 1, '2018-04-20', 1, 'D3-370', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '08:00:00', '08:05:00', 'Reza Ari', 'Reza Ari', 'HUZAI', 'RFU', '-'),
(346, 1, '2018-04-20', 1, 'D3-388', 'BUS', 172, 142, 'CSA OB2', '07:00:00', '00:00:00', '00:00:00', 48, 67, 168, '08:05:00', '08:10:00', 'Reza Ari', 'Reza Ari', 'HUZAI', 'RFU', '-'),
(347, 1, '2018-04-20', 1, 'D3-084', 'BUS', 98, 142, 'CSA N3', '07:00:00', '08:30:00', '08:50:00', 52, 89, 195, '08:50:00', '09:10:00', 'Reza Ari', 'Reza Ari', 'SUDIN, PEDY, HUZAI, ERWIN', 'RFU', 'GPS BAD, CABLE BAD'),
(348, 1, '2018-04-20', 1, 'D3-047', 'BUS', 172, 142, 'CSA N1', '07:00:00', '10:00:00', '10:30:00', 48, 67, 135, '10:30:00', '10:40:00', 'Reza Ari', 'Reza Ari', 'SUDIN, PEDY, HUZAI, ERWIN', 'RFU', 'bad conduit'),
(349, 1, '2018-04-20', 1, 'D4-042', 'bus', 98, 142, 'csa ob2', '07:00:00', '14:00:00', '14:30:00', 48, 67, 135, '14:30:00', '14:40:00', 'reza ari', 'reza ari', 'pedy, sudin, rwin, jay', 'rfu', 'bracket anten omni berkarat, '),
(350, 2, '2018-04-20', 1, 'PT 06', '', 121, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 29, '15:30:00', '16:00:00', 'Reza Ari', 'Reza Ari', 'Syairi, Nanang', 'RFU', '-'),
(351, 2, '2018-04-20', 1, 'PT 27', '', 125, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 197, '08:30:00', '08:45:00', 'Reza Ari', 'Reza Ari', 'Syairi, Nanang', 'RFU', '-'),
(352, 2, '2018-04-20', 1, 'PT 05', '', 125, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 197, '09:00:00', '09:15:00', 'Reza Ari', 'Reza Ari', 'Syairi, Nanang', 'RFU', 'Bracket kayu solarcell rapuh'),
(353, 2, '2018-04-20', 1, 'PT 09', '', 125, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 197, '09:45:00', '10:00:00', 'Reza Ari', 'Reza Ari', 'Syairi, Nanang', 'RFU', 'Portable need Rekondisi'),
(354, 1, '2018-04-20', 2, 'D4-055', 'BUS', 182, 144, 'CSA N3', '17:00:00', '22:00:00', '22:30:00', 64, 86, 171, '22:30:00', '23:00:00', 'DISPATCHER', 'DISPACTHER', 'Taufik, Andi', 'RFU', '-'),
(355, 1, '2018-04-20', 2, 'D5-023', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '23:15:00', '23:30:00', 'DISPATCHER', 'DISPACTHER', 'Taufik, Andi', 'RFU', '-'),
(356, 1, '2018-04-20', 2, 'D3-229', 'BUS', 182, 144, 'CSA J5', '17:00:00', '01:30:00', '02:00:00', 64, 86, 171, '02:00:00', '02:30:00', 'DISPATCHER', 'DISPACTHER', 'Taufik, Andi', 'RFU', '-'),
(357, 1, '2018-04-20', 2, 'D3-182', 'BUS', 98, 142, 'CSA J5', '17:00:00', '02:00:00', '02:30:00', 50, 68, 135, '02:30:00', '02:45:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'BAD CONDUIT'),
(358, 1, '2018-04-21', 1, 'D3-101', 'BUS', 172, 142, 'CSA J5', '07:00:00', '10:00:00', '10:30:00', 48, 67, 135, '10:30:00', '10:45:00', 'Reza Ari', 'Reza Ari', 'pedy,nanang,husyairi', 'rfi', 'counduit & cabel bad, bracket berkarat'),
(359, 1, '2018-04-21', 1, 'D4-094', 'BUS', 172, 142, 'CSA J5', '07:00:00', '11:00:00', '11:30:00', 48, 67, 135, '11:30:00', '11:45:00', 'Reza Ari', 'Reza Ari', 'pedy,nanang,husyairi', 'rfi', 'counduit bad'),
(360, 2, '2018-04-21', 2, 'PT 26', '', 115, 94, '', '17:00:00', '00:00:00', '00:00:00', 0, 0, 27, '22:00:00', '22:30:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'Change 4 Battery RITAR'),
(361, 1, '2018-04-21', 2, 'D5-019', 'STB', 172, 142, 'CSA N1', '17:00:00', '00:00:00', '00:00:00', 48, 67, 135, '23:00:00', '23:15:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'bad conduit'),
(362, 1, '2018-04-21', 2, 'D3-215', 'BUS', 98, 142, 'CSA N4', '17:00:00', '23:40:00', '00:10:00', 50, 68, 135, '00:10:00', '00:25:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', '-'),
(363, 1, '2018-04-21', 2, 'D4-065', 'BUS', 172, 142, 'CSA N4', '17:00:00', '00:25:00', '00:50:00', 48, 67, 135, '00:50:00', '01:10:00', 'Dispatcher', 'Dispatcher', 'Taufik, Andi', 'RFU', 'bad conduit'),
(364, 1, '2018-04-21', 2, 'D3-045', 'BUS', 172, 142, 'CSA N3', '17:00:00', '01:10:00', '01:40:00', 48, 67, 135, '01:40:00', '01:50:00', 'DISPATCHER', 'DISPACTHER', 'Taufik, Andi', 'RFU', '-'),
(365, 1, '2018-04-21', 2, 'D3-151', 'BUS', 172, 142, 'CSA N4', '17:00:00', '01:50:00', '02:20:00', 48, 67, 135, '02:20:00', '02:30:00', 'DISPATCHER', 'DISPACTHER', 'Taufik, Andi', 'RFU', 'bracket anten berkarat, conector gps bad, ram mojo bad, lock ampseal 23 patah'),
(366, 1, '2018-05-05', 2, 'D3-133', 'BUS', 98, 142, 'csa OB2', '17:00:00', '21:30:00', '22:00:00', 51, 70, 163, '22:00:00', '22:20:00', 'Dispatcher', 'Dispatcher', 'mazri,huzai', 'RFU', 'counduit bad. lock amp 23 patah'),
(367, 1, '2018-05-05', 2, 'D4-004', 'BUS', 98, 142, 'csa OB2', '17:00:00', '22:25:00', '22:40:00', 50, 68, 135, '22:40:00', '23:00:00', 'Dispatcher', 'Dispatcher', 'mazri,huzai', 'RFU', 'counduit bad'),
(368, 1, '2018-05-05', 2, 'D3-147', 'BUS', 187, 142, 'CSA N1', '17:00:00', '23:20:00', '00:10:00', 56, 78, 171, '24:10:00', '24:40:00', 'Dispatcher', 'Dispatcher', 'mazri,huzai', 'RFU', 'Bosku'),
(369, 2, '2018-05-08', 1, 'PT 02', '', 112, 94, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 30, '07:44:48', '07:49:00', 'WANDI', 'WANDI', 'WANDI', 'CLOSED', 'Cover Area PAAP Project'),
(371, 1, '2018-05-22', 1, 'D3-006', 'BS', 98, 142, 'CSA N3', '07:00:00', '00:00:00', '00:00:00', 48, 67, 135, '00:00:00', '13:30:00', 'DISPATCHER', 'DISPACTHER', 'Reza', 'RFU', 'Bad Conduit'),
(372, 2, '2018-05-22', 1, 'PT 29', '', 121, 95, '', '07:00:00', '00:00:00', '00:00:00', 0, 0, 32, '09:00:00', '10:30:00', 'REZA ARI P.', 'REZA ARI P.', 'TAUFIK,ADNAN,ANDI', 'RFU', 'Bracket perangkat bad, groud petir bad, winch bawah bad, stiker titik jepit bad, nomer portable tidak ada, pole atas stuck.');

-- --------------------------------------------------------

--
-- Table structure for table `unit_detail`
--

CREATE TABLE IF NOT EXISTS `unit_detail` (
  `cn_unit` varchar(25) NOT NULL,
  `id_unit` varchar(25) NOT NULL,
  `type_unit` int(5) NOT NULL,
  `kode_unit` int(5) NOT NULL,
  `description` varchar(100) NOT NULL,
  `position` varchar(50) NOT NULL,
  `sn_mojo` varchar(20) NOT NULL,
  `sn_wb` varchar(20) NOT NULL,
  `sn_gps` varchar(20) NOT NULL,
  `antenna` int(5) NOT NULL,
  `remark` text NOT NULL,
  `status` int(5) NOT NULL,
  `relay` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `recondition` text NOT NULL,
  `date_update` date NOT NULL,
  `time_update` time NOT NULL,
  `pic_update` varchar(100) NOT NULL,
  `id_device` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit_detail`
--

INSERT INTO `unit_detail` (`cn_unit`, `id_unit`, `type_unit`, `kode_unit`, `description`, `position`, `sn_mojo`, `sn_wb`, `sn_gps`, `antenna`, `remark`, `status`, `relay`, `locked`, `recondition`, `date_update`, `time_update`, `pic_update`, `id_device`) VALUES
('D3-006', 'D3-006', 5, 1, 'Hitachi EH1700\n', '', 'M75151', '00000', '76565', 139, 'Bad Conduit', 25, 0, 0, '206,212,213', '2018-05-22', '09:21:57', 'Reza', 1),
('D3-007', 'D3-007', 5, 1, 'Hitachi EH1700', '', 'M51578', '76121', '76121', 140, 'RH: 0989 LH: 0989a', 25, 0, 0, '206', '0000-00-00', '00:00:00', '', 1),
('D3-009', 'D3-009', 5, 1, 'Hitachi EH1700', '', '', '', '', 0, '\n', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-010', 'D3-010', 5, 1, 'Hitachi EH1700', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-011', 'D3-011', 5, 1, 'Hitachi EH1700', '', '1111', '11111', '11111', 139, 'eeeee', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-012', 'D3-012', 5, 1, 'Hitachi EH1700', '', '000447', '55139', '55139', 139, 'Dismantle mojo router dan antena gps', 26, 1, 1, '', '0000-00-00', '00:00:00', '', 1),
('D3-013', 'D3-013', 5, 1, 'Hitachi EH1700', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-014', 'D3-014', 5, 1, 'Hitachi EH1700', '', '5', '5', '5', 139, '5', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-015', 'D3-015', 5, 1, 'Hitachi EH1700', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-016', 'D3-016', 6, 1, 'Komatsu HD785-5', '', '33333', '33333', '33333', 139, '-', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-035', 'D3-035', 6, 1, 'Komatsu HD785-5', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-039', 'D3-039', 6, 1, 'Komatsu HD785-5', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-041', 'D3-041', 6, 1, 'Komatsu HD785-5', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-045', 'D3-045', 7, 1, 'Komatsu HD785-7', '', '000353', '0082', '84636', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-046', 'D3-046', 7, 1, 'Komatsu HD785-7', '', '000424', '0126', '55434', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-047', 'D3-047', 7, 1, 'Komatsu HD785-7', '', '000480', '0046', '55476', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-049', 'D3-049', 7, 1, 'Komatsu HD785-7', '', '001248', '0134', '63428', 139, 'Bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-053', 'D3-053', 7, 1, 'Komatsu HD785-7', '', '001251', '1278', '55411', 139, 'bracket berkarat', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-054', 'D3-054', 7, 1, 'Komatsu HD785-7', '', '001642', '0045', '55462', 139, 'cable & conduit bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-058', 'D3-058', 7, 1, 'Komatsu HD785-7', '', '000518', '1242', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-060', 'D3-060', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-062', 'D3-062', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-063', 'D3-063', 7, 1, 'Komatsu HD785-7', '', 'M751513', '0099', '55426', 139, 'bad cable & conduit, lock amps23 patah, ', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-064', 'D3-064', 7, 1, 'Komatsu HD785-7', '', '000456', '0035', '55505', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-065', 'D3-065', 7, 1, 'Komatsu HD785-7', '', '000337', '1267', '55427', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-067', 'D3-067', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-068', 'D3-068', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-074', 'D3-074', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-075', 'D3-075', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-076', 'D3-076', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-078', 'D3-078', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-079', 'D3-079', 7, 1, 'Komatsu HD785-7', '', '000364', '1268', '84643', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-081', 'D3-081', 7, 1, 'Komatsu HD785-7', '', '000508', '0091', '55590', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-084', 'D3-084', 7, 1, 'Komatsu HD785-7', '', '000475', '1107', '63162', 139, 'GPS BAD, CABLE BAD', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-085', 'D3-085', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-086', 'D3-086', 7, 1, 'Komatsu HD785-7', '', '000469', '0172', '55413', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-087', 'D3-087', 7, 1, 'Komatsu HD785-7', '', '000467', '0016', '79691', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-088', 'D3-088', 7, 1, 'Komatsu HD785-7', '', '000437', '0209', '55457', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-091', 'D3-091', 7, 1, 'Komatsu HD785-7', '', '000503', '0148', '63466', 139, 'Ram Mojo Bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-092', 'D3-092', 7, 1, 'Komatsu HD785-7', '', '0', '0', '0', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-093', 'D3-093', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-094', 'D3-094', 7, 1, 'Komatsu HD785-7', '', '000539', '0062', '55492', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-095', 'D3-095', 7, 1, 'Komatsu HD785-7', '', '000557', '0179', '55475', 139, 'brkcket antena bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-096', 'D3-096', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-097', 'D3-097', 7, 1, 'Komatsu HD785-7', '', '001269', '0153', '-', 139, 'bad kabel & counduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-098', 'D3-098', 7, 1, 'Komatsu HD785-7', '', '-', '-', '-', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-099', 'D3-099', 7, 1, 'Komatsu HD785-7', '', '000351', 'WB017', '55152', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-100', 'D3-100', 7, 1, 'Komatsu HD785-7', '', '001322', '1273', 'BURAM', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-101', 'D3-101', 7, 1, 'Komatsu HD785-7', '', '000371', '0218', '-', 139, 'counduit & cabel bad, bracket berkarat', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-102', 'D3-102', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-106', 'D3-106', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-108', 'D3-108', 7, 1, 'Komatsu HD785-7', '', '001399', '0154', '55439', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-109', 'D3-109', 7, 1, 'Komatsu HD785-7', '', '000564', 'WB51502', '84641', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-110', 'D3-110', 7, 1, 'Komatsu HD785-7', '', '', '0106', '79694', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-111', 'D3-111', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-112', 'D3-112', 7, 1, 'Komatsu HD785-7', '', '-', '-', '-', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-113', 'D3-113', 7, 1, 'Komatsu HD785-7', '', '000423', '0042', '55452', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-114', 'D3-114', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-115', 'D3-115', 7, 1, 'Komatsu HD785-7', '', '000524', '0086', '55487', 139, 'Bracket berkarat, amseal 23 bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-116', 'D3-116', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-117', 'D3-117', 7, 1, 'Komatsu HD785-7', '', '001396', '0081', '55414', 139, 'BAD CONDUIT', 0, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-118', 'D3-118', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-119', 'D3-119', 7, 1, 'Komatsu HD785-7', '', '000507', '51503', '55500', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-120', 'D3-120', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-121', 'D3-121', 7, 1, 'Komatsu HD785-7', '', '001407', '0125', '55595', 139, 'counduit bad, ram mojo bad, BRACKET BERKARAT, DCDC24V', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-122', 'D3-122', 7, 1, 'Komatsu HD785-7', '', '000348', '0204', '55131', 139, 'bracket berkarat,conduit bad,ram mounting bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-123', 'D3-123', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-124', 'D3-124', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, 'BAD CONDUIT, BRACKET BERKARAT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-125', 'D3-125', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-126', 'D3-126', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-127', 'D3-127', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-128', 'D3-128', 7, 1, 'Komatsu HD785-7', '', '000487', 'Xxxxxx', 'Xxxxxx', 139, 'Lepas', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-129', 'D3-129', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-130', 'D3-130', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-131', 'D3-131', 7, 1, 'Komatsu HD785-7', '', 'BURAM', '0110', 'BURAM', 139, 'BRACKET BERKARAT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-132', 'D3-132', 7, 1, 'Komatsu HD785-7', '', 'M751513', '1100', '55195', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-133', 'D3-133', 7, 1, 'Komatsu HD785-7', '', '000497', '0069', '82392', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-134', 'D3-134', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-135', 'D3-135', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-136', 'D3-136', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-137', 'D3-137', 7, 1, 'Komatsu HD785-7', '', 'M7001', '1098', '79697', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-138', 'D3-138', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-139', 'D3-139', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-140', 'D3-140', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-145', 'D3-145', 7, 1, 'Komatsu HD785-7', '', '000531', '0058', '6P51501', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-146', 'D3-146', 7, 1, 'Komatsu HD785-7', '', '000458', '1089', '55195', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-147', 'D3-147', 7, 1, 'Komatsu HD785-7', '', '000316', '0064', '55405', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-148', 'D3-148', 7, 1, 'Komatsu HD785-7', '', '001273', '0189', '55464', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-149', 'D3-149', 7, 1, 'Komatsu HD785-7', '', '001402', 'WB51525', '55139', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-150', 'D3-150', 7, 1, 'Komatsu HD785-7', '', '001404', '0214', '66245', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-151', 'D3-151', 7, 1, 'Komatsu HD785-7', '', '000538', '0013', '-', 139, 'bracket anten berkarat, conector gps bad, ram mojo bad, lock ampseal 23 patah', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-152', 'D3-152', 7, 1, 'Komatsu HD785-7', '', 'BURAM', '0089', '51502', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-154', 'D3-154', 7, 1, 'Komatsu HD785-7', '', '001649', '0073', '55617', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-159', 'D3-159', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-163', 'D3-163', 7, 1, 'Komatsu HD785-7', '', '001371', '0063', '55493', 139, 'bad counduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-166', 'D3-166', 7, 1, 'Komatsu HD785-7', '', '000425', '0102', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-167', 'D3-167', 7, 1, 'Komatsu HD785-7', '', '001272', '0144', '55435', 139, 'bracket antenna berkarat', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-169', 'D3-169', 7, 1, 'Komatsu HD785-7', '', '0', '0', '0', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-170', 'D3-170', 7, 1, 'Komatsu HD785-7', '', '000476', '0193', '55604', 139, 'bracket berkarat, ram mojo bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-177', 'D3-177', 7, 1, 'Komatsu HD785-7', '', '000325', '0170', '55421', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-178', 'D3-178', 7, 1, 'Komatsu HD785-7', '', '000532', '0101', '55443', 139, 'bad counduit, ram mojo bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-179', 'D3-179', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-180', 'D3-180', 7, 1, 'Komatsu HD785-7', '', '001287', '1115', '55424', 139, 'Bad bracket antenna and conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-181', 'D3-181', 7, 1, 'Komatsu HD785-7', '', '000500', '0184', '63496', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-182', 'D3-182', 7, 1, 'Komatsu HD785-7', '', '000551', '1102', '63640', 139, 'BAD CONDUIT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-183', 'D3-183', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-186', 'D3-186', 7, 1, 'Komatsu HD785-7', '', '-', '-', '-', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-214', 'D3-214', 7, 1, 'Komatsu HD785-7', '', '000432', '1248', '54965', 139, 'BAD CONDUIT\r\n', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-215', 'D3-215', 7, 1, 'Komatsu HD785-7', '', '001386', '1188', '54965', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-216', 'D3-216', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-217', 'D3-217', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-218', 'D3-218', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-219', 'D3-219', 7, 1, 'Komatsu HD785-7', '', '000369', '1229', '55181', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-220', 'D3-220', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-221', 'D3-221', 8, 1, 'Caterpillar CAT777D', '', '0001247', '-', '-', 139, 'counduit bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-222', 'D3-222', 8, 1, 'Caterpillar CAT777D', '', '000511', '1139', '66242', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-223', 'D3-223', 8, 1, 'Caterpillar CAT777D', '', '001400', '1276', '55431', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-224', 'D3-224', 8, 1, 'Caterpillar CAT777D', '', '001406', '1275', '63201', 139, 'bad counduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-225', 'D3-225', 8, 1, 'Caterpillar CAT777D', '', '000311', '1228', '63188', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-226', 'D3-226', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-227', 'D3-227', 8, 1, 'Caterpillar CAT777D', '', '001261', '0180', '55601', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-228', 'D3-228', 8, 1, 'Caterpillar CAT777D', '', '001631', '0300', '55403', 139, 'cable n counduit bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-229', 'D3-229', 8, 1, 'Caterpillar CAT777D', '', '000548', '0162', '66166', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-230', 'D3-230', 8, 1, 'Caterpillar CAT777D', '', '000512', '1244', '66500', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-231', 'D3-231', 8, 1, 'Caterpillar CAT777D', '', '001376', '1194', '66241', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-232', 'D3-232', 8, 1, 'Caterpillar CAT777D', '', '001395', '1138', '66203', 139, 'cable n counduit bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-233', 'D3-233', 8, 1, 'Caterpillar CAT777D', '', '001268', '1255', '63609', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-234', 'D3-234', 8, 1, 'Caterpillar CAT777D', '', '001307', '1237', '62811', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-235', 'D3-235', 8, 1, 'Caterpillar CAT777D', '', '001645', '0199', '66163', 139, 'BAD CONDUIT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-241', 'D3-241', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-242', 'D3-242', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-243', 'D3-243', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-244', 'D3-244', 7, 1, 'Komatsu HD785-7', '', '001276', '1240', '55124', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-245', 'D3-245', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-246', 'D3-246', 7, 1, 'Komatsu HD785-7', '', '-', '-', '-', 141, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-247', 'D3-247', 7, 1, 'Komatsu HD785-7', '', '000485', '1088', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-248', 'D3-248', 7, 1, 'Komatsu HD785-7', '', '000422', '0080', '55597', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-249', 'D3-249', 7, 1, 'Komatsu HD785-7', '', '001264', '0138', '55385', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-250', 'D3-250', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-254', 'D3-254', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-256', 'D3-256', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-257', 'D3-257', 7, 1, 'Komatsu HD785-7', '', '000447', '0056', '55139', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-258', 'D3-258', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-259', 'D3-259', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-260', 'D3-260', 8, 1, 'Caterpillar CAT777D', '', '000496', '0093', '55383', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-262', 'D3-262', 8, 1, 'Caterpillar CAT777D', '', '000441', '0060', '55125', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-264', 'D3-264', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-266', 'D3-266', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-267', 'D3-267', 8, 1, 'Caterpillar CAT777D', '', '001278', '-', '55447', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-269', 'D3-269', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-271', 'D3-271', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-272', 'D3-272', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-273', 'D3-273', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-274', 'D3-274', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-277', 'D3-277', 8, 1, 'Caterpillar CAT777D', '', '000330', '1240', '63452', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-279', 'D3-279', 8, 1, 'Caterpillar CAT777D', '', '001648', '0146', '54951', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-280', 'D3-280', 8, 1, 'Caterpillar CAT777D', '', '000341', '0087', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-281', 'D3-281', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 26, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-282', 'D3-282', 8, 1, 'Caterpillar CAT777D', '', '000486', '0208', '55481', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-285', 'D3-285', 8, 1, 'Caterpillar CAT777D', '', '000482', '0027', '55421', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-286', 'D3-286', 8, 1, 'Caterpillar CAT777D', '', '000517', '0116', '55489', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-287', 'D3-287', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-288', 'D3-288', 8, 1, 'Caterpillar CAT777D', '', '', '0109', '63490', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-289', 'D3-289', 8, 1, 'Caterpillar CAT777D', '', '001397', 'wb004', '55441', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-290', 'D3-290', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-291', 'D3-291', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-292', 'D3-292', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-293', 'D3-293', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-294', 'D3-294', 8, 1, 'Caterpillar CAT777D', '', '000452', '0031', '55516', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-295', 'D3-295', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-298', 'D3-298', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-303', 'D3-303', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-304', 'D3-304', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-305', 'D3-305', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-307', 'D3-307', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-308', 'D3-308', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-310', 'D3-310', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-311', 'D3-311', 8, 1, 'Caterpillar CAT777D', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-319', 'D3-319', 7, 1, 'Komatsu HD785-7', '', '000439', '1130', '55498', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-355', 'D3-355', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-356', 'D3-356', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-357', 'D3-357', 7, 1, 'Komatsu HD785-7', '', '000446', '0093', '607944', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-358', 'D3-358', 7, 1, 'Komatsu HD785-7', '', '001391', '0078', '55608', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-359', 'D3-359', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-360', 'D3-360', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-362', 'D3-362', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-363', 'D3-363', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-364', 'D3-364', 7, 1, 'Komatsu HD785-7', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-370', 'D3-370', 7, 1, '-', '', '-', '-', '-', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-372', 'D3-372', 7, 1, '-', '', '-', '-', '-', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-375', 'D3-375', 7, 1, '-', '', '-', '-', '-', 0, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-377', 'D3-377', 7, 1, 'Unit New', '', '000341', '1094', '50533', 139, 'Nilai value ketika di bad_mojo tidak bisa 1', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-386', 'D3-386', 7, 1, 'Unit New', '', '000547', '0058', '55125', 140, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-388', 'D3-388', 7, 1, 'Komatsu HD785-7', '', '001283', '0185', '55445', 139, '-', 0, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-389', 'D3-389', 7, 1, 'Komatsu HD785-7', '', '\n', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-390', 'D3-390', 7, 1, 'None', '', '000483', '0043', '55415', 139, 'LH : 5490\r\nRH : 5344', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-391', 'D3-391', 7, 1, 'none', '', '000000', '0000', '000000', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-392', 'D3-392', 7, 1, '', '', '000494', '1218', '55126', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-395', 'D3-395', 7, 1, '-', '', '000518', '0102', '55413', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-396', 'D3-396', 7, 1, '-', '', '-', '-', '-', 0, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-397', 'D3-397', 7, 1, 'Unit News', '', '000335', '0059', '55397', 139, 'vhms n/a', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-398', 'D3-398', 7, 1, '-', '', '001259', '1193', '55496', 140, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D3-400', 'D3-400', 7, 1, '-', '', '-', '-', '-', 0, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-001', 'D4-001', 9, 1, 'Caterpillar CAT785C', '', '000344', '0065', '55451', 139, 'cable, coundiut bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-002', 'D4-002', 9, 1, 'Caterpillar CAT785C', '', '000433', '', '55427', 139, 'bracket wifibox n/a', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-003', 'D4-003', 9, 1, 'Caterpillar CAT785C', '', '001388', '0182', '55389', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-004', 'D4-004', 9, 1, 'Caterpillar CAT785C', '', '000558', '0163', '66478', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-005', 'D4-005', 9, 1, 'Caterpillar CAT785C', '', '000326', '0048', '54946', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-006', 'D4-006', 9, 1, 'Caterpillar CAT785C', '', '000484', '0201', '84645', 139, 'Bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-007', 'D4-007', 9, 1, 'Caterpillar CAT785C', '', '001328', '0039', '55423', 139, 'BAD CONDUIT, BRACKET WB N/A', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-008', 'D4-008', 9, 1, 'Caterpillar CAT785C', '', '000420', '0055', '55603', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-009', 'D4-009', 9, 1, 'Caterpillar CAT785C', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-010', 'D4-010', 9, 1, 'Caterpillar CAT785C', '', '000336', '0049', '55429', 139, 'bad counduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-011', 'D4-011', 9, 1, 'Caterpillar CAT785C', '', '000506', '0151', '55619', 139, 'kabel antenna sebelah kanan putus', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-012', 'D4-012', 9, 1, 'Caterpillar CAT785C', '', '001638', '0057', '55619', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-013', 'D4-013', 9, 1, 'Caterpillar CAT785C', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-014', 'D4-014', 9, 1, 'Caterpillar CAT785C', '', '000529', '0084', '55675', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-015', 'D4-015', 10, 1, 'Komatsu HD15005', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-016', 'D4-016', 10, 1, 'Komatsu HD15005', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-017', 'D4-017', 10, 1, 'Komatsu HD15005', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-018', 'D4-018', 10, 1, 'Komatsu HD15005', '', '000530', '0022', '55384', 139, 'bracket berkarat', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-019', 'D4-019', 10, 1, 'Komatsu HD15005', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-020', 'D4-020', 10, 1, 'Komatsu HD15005', '', '000537', '1116', '84644', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-021', 'D4-021', 10, 1, 'Komatsu HD15005', '', '000541', '1126', '55601', 139, 'bracket berkarat, conduit bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-022', 'D4-022', 10, 1, 'Komatsu HD15005', '', '000347', '0195', '55506', 139, 'BAD CONDUIT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-023', 'D4-023', 10, 1, 'Komatsu HD15005', '', '000429', '1297', '55485', 139, 'BRACKET BERKARAT, CONDUIT GPS DALAM BELUM ADA HEATSHINK, BOLT WB KURANG 1, BEEP SOUND PROBLEM', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-024', 'D4-024', 10, 1, 'Komatsu HD15005', '', '000469', '1084', '55438', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-025', 'D4-025', 10, 1, 'Komatsu HD15005', '', '000322', '0194', '56800', 139, ' Bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-026', 'D4-026', 10, 1, 'Komatsu HD15005', '', '000343', '0215', '55605', 139, 'BAD CONDUIT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-027', 'D4-027', 10, 1, 'Komatsu HD15005', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-028', 'D4-028', 10, 1, 'Komatsu HD15005', '', '000370', '1122', '63492', 139, 'BAD CONDUIT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-029', 'D4-029', 10, 1, 'Komatsu HD15005', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-030', 'D4-030', 10, 1, 'Komatsu HD15005', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-031', 'D4-031', 9, 1, 'Caterpillar CAT785C', '', '000501', '0023', '55449', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-032', 'D4-032', 9, 1, 'Caterpillar CAT785C', '', '000533', '1282', '63468', 139, 'BAD CABLE & CONDUIT, NO SOUND BUZZER', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-033', 'D4-033', 9, 1, 'Caterpillar CAT785C', '', '001617', '0131', '63456', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-034', 'D4-034', 9, 1, 'Caterpillar CAT785C', '', '000121', '1124', '55613', 139, 'No bracket router', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-035', 'D4-035', 10, 1, 'Komatsu HD15005', '', '001378', '1293', '79649', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-036', 'D4-036', 10, 1, 'Komatsu HD15005', '', '000362', '0077', '55478', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-037', 'D4-037', 10, 1, 'Komatsu HD15005', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-038', 'D4-038', 10, 1, 'Komatsu HD15005', '', '000540', '0079', '55400', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-039', 'D4-039', 10, 1, 'Komatsu HD15005', '', '000455', '0085', '66453', 139, 'repair connector dan pin amps23', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-040', 'D4-040', 10, 1, 'Komatsu HD15005', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-041', 'D4-041', 10, 1, 'Komatsu HD15005', '', '000543', '1079', '63481', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-042', 'D4-042', 10, 1, 'Komatsu HD15005', '', '001257', '1108', '63491', 139, 'bracket anten omni berkarat, ', 24, 1, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-043', 'D4-043', 10, 1, 'Komatsu HD15005', '', '001630', '1137', '63480', 139, 'cable n counduit bad, kabel gps kencang, connector tnc gps indor bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-044', 'D4-044', 10, 1, 'Komatsu HD15005', '', '000478', 'WB51519', '55380', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-045', 'D4-045', 10, 1, 'Komatsu HD15005', '', '000473', '0120', '63463', 139, 'cable n counduit bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-046', 'D4-046', 10, 1, 'Komatsu HD15005', '', '001219', '1096', '55196', 139, 'BAD CONDUIT ', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-047', 'D4-047', 9, 1, 'Caterpillar CAT785C', '', '001129', '0041', '55468', 139, 'bad counduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-048', 'D4-048', 9, 1, 'Caterpillar CAT785C', '', 'M7009', '1123', '55478', 139, 'bad counduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-049', 'D4-049', 9, 1, 'Caterpillar CAT785C', '', '001262', '1133', '63497', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-050', 'D4-050', 9, 1, 'Caterpillar CAT785C', '', '001249', '1110', '62812', 139, 'bad counduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-051', 'D4-051', 9, 1, 'Caterpillar CAT785C', '', '000504', '1118', '63458', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-052', 'D4-052', 9, 1, 'Caterpillar CAT785C', '', '-', '-', '-', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-053', 'D4-053', 9, 1, 'Caterpillar CAT785C', '', '000489', '0032', '62769', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-054', 'D4-054', 9, 1, 'Caterpillar CAT785C', '', '001271', '1095', '-', 139, 'BAD COUNDUIT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-055', 'D4-055', 9, 1, 'Caterpillar CAT785C', '', '000471', '0173', '63487', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-056', 'D4-056', 9, 1, 'Caterpillar CAT785C', '', '000555', '1092', '63477', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-057', 'D4-057', 9, 1, 'Caterpillar CAT785C', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-058', 'D4-058', 9, 1, 'Caterpillar CAT785C', '', '-', '0154', '55501', 139, 'Bad conduit, SN mojo buram, bracket berkarat', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-059', 'D4-059', 9, 1, 'Caterpillar CAT785C', '', '000334', '1222', '66490', 139, 'BAD CABLE & CONDUIT, BRACKET BERKARAT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-060', 'D4-060', 9, 1, 'Caterpillar CAT785C', '', '000545', '1270', '000000', 139, 'BAD CONDUIT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-061', 'D4-061', 9, 1, 'Caterpillar CAT785C', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-062', 'D4-062', 9, 1, 'Caterpillar CAT785C', '', '001214', '1088', '63483', 139, 'Bracket Antenna Berkarat, Bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-063', 'D4-063', 9, 1, 'Caterpillar CAT785C', '', '001212', '63450', '63450', 139, 'bad conduit & bracket', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-064', 'D4-064', 9, 1, 'Caterpillar CAT785C', '', '001223', '0207', '63475', 139, 'bracket wb tidak ada, bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-065', 'D4-065', 9, 1, 'Caterpillar CAT785C', '', '000427', '0019', '55429', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-066', 'D4-066', 9, 1, 'Caterpillar CAT785C', '', '001228', 'wb515066', '63498', 139, 'Antena RH none, bracket berkarat, conduit bad, Bracket WB N/A', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-067', 'D4-067', 9, 1, 'Caterpillar CAT785C', '', '000528', '0183', '61802', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-068', 'D4-068', 9, 1, 'Caterpillar CAT785C', '', '001254', '1119', '63476', 139, 'BAD CONDUIT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-069', 'D4-069', 9, 1, 'Caterpillar CAT785C', '', '-', '-', '-', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-070', 'D4-070', 9, 1, 'Caterpillar CAT785C', '', ' ', 'WB51510', '63193', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-071', 'D4-071', 9, 1, 'Caterpillar CAT785C', '', '000438', '0056', '63483', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-072', 'D4-072', 9, 1, 'Caterpillar CAT785C', '', '001218', '0128', '63470', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-073', 'D4-073', 9, 1, 'Caterpillar CAT785C', '', '-', '-', '-', 139, 'BAD CONDUIT.', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-074', 'D4-074', 9, 1, 'Caterpillar CAT785C', '', '001274', '0075', '62803', 139, 'braket wb n/4', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-075', 'D4-075', 9, 1, 'Caterpillar CAT785C', '', '000490', '0103', '62806', 139, 'BAD CONDUIT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-076', 'D4-076', 9, 1, 'Caterpillar CAT785C', '', '000521', '1239', '63457', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-077', 'D4-077', 9, 1, 'Caterpillar CAT785C', '', '001234', '0211', '62797', 139, 'BAD CONDUIT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-078', 'D4-078', 10, 1, 'Komatsu HD15005', '', '1', '1', '1', 140, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-079', 'D4-079', 10, 1, 'Komatsu HD15005', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-080', 'D4-080', 10, 1, 'Komatsu HD15005', '', '001412', '1111', '55380', 139, 'bad conduit, Bracket antenna berkarat', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-081', 'D4-081', 10, 1, 'Komatsu HD15005', '', '000491', '1129', '63469', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-082', 'D4-082', 10, 1, 'Komatsu HD15005', '', '001240', '1121', '63454', 139, 'BAD COUNDUIT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-083', 'D4-083', 10, 1, 'Komatsu HD15005', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-084', 'D4-084', 10, 1, 'Komatsu HD15005', '', '', '', '', 0, '', 24, 1, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-085', 'D4-085', 10, 1, 'Komatsu HD15005', '', '001235', '0197', '63494', 139, 'bracket berkarat, conduit bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-086', 'D4-086', 10, 1, 'Komatsu HD15005', '', '000495', '1093', '63454', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-087', 'D4-087', 10, 1, 'Komatsu HD15005', '', '001280', '0025', '62808', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-088', 'D4-088', 10, 1, 'Komatsu HD15005', '', 'M751513', '0136', '55480', 139, 'BAD CONDUIT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-089', 'D4-089', 10, 1, 'Komatsu HD15005', '', '001304', '1274', '55102', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-090', 'D4-090', 10, 1, 'Komatsu HD15005', '', '001221', '0067', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-091', 'D4-091', 10, 1, 'Komatsu HD15005', '', '-', '-', '-', 139, '- (restart by relay)', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-092', 'D4-092', 10, 1, 'Komatsu HD15005', '', '000374', '0176', '55209', 139, 'bad counduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-093', 'D4-093', 10, 1, 'Komatsu HD15005', '', '\n', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-094', 'D4-094', 10, 1, 'Komatsu HD15005', '', 'M7006', '0119', '62807', 139, 'counduit bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-095', 'D4-095', 10, 1, 'Komatsu HD15005', '', '', '', '', 0, '', 26, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-096', 'D4-096', 10, 1, 'Komatsu HD15005', '', '001393', '1207', '66441', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-097', 'D4-097', 10, 1, 'Komatsu HD15005', '', '001620', '0165', '66449', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-098', 'D4-098', 10, 1, 'Komatsu HD15005', '', '000556', '0053', '66491', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-099', 'D4-099', 10, 1, 'Komatsu HD15005', '', '001618', '1078', '66470', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-100', 'D4-100', 10, 1, 'Komatsu HD15005', '', '001408', '0161', '66178', 140, 'Bad conduit, install relay', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-101', 'D4-101', 10, 1, 'Komatsu HD15005', '', '000315', '0130', '55479', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-102', 'D4-102', 10, 1, 'Komatsu HD15005', '', '-', '-', '-', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D4-103', 'D4-103', 10, 1, 'Komatsu HD15005', '', '-', '-', '-', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-001', 'D5-001', 11, 1, 'Caterpillar CAT789C', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-002', 'D5-002', 11, 1, 'Caterpillar CAT789C', '', '001220', '1241', '79698', 139, 'No bracket Router', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-003', 'D5-003', 11, 1, 'Caterpillar CAT789C', '', '000461', '1090', '55574', 139, 'Bracket wb none,conduit bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-004', 'D5-004', 11, 1, 'Caterpillar CAT789C', '', '000308', '0030', '55409', 139, 'anten kanan n/a', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-005', 'D5-005', 11, 1, 'Caterpillar CAT789C', '', '000373', '0112', '-', 139, 'bad counduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-006', 'D5-006', 11, 1, 'Caterpillar CAT789C', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-007', 'D5-007', 11, 1, 'Caterpillar CAT789C', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-008', 'D5-008', 11, 1, 'Caterpillar CAT789C', '', '000466', '0121', '55449', 139, 'No bracket router', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-009', 'D5-009', 11, 1, 'Caterpillar CAT789C', '', '000367', '0076', '55583', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-010', 'D5-010', 11, 1, 'Caterpillar CAT789C', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-011', 'D5-011', 12, 1, 'Hitachi EH3500', '', 'M7008', '0090', '55482', 140, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-012', 'D5-012', 12, 1, 'Hitachi EH3500', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-013', 'D5-013', 12, 1, 'Hitachi EH3500', '', 'M7007', 'WB001', '63469', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-014', 'D5-014', 12, 1, 'Hitachi EH3500', '', '000340', '0206', '66488', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-015', 'D5-015', 12, 1, 'Hitachi EH3500', '', '000360', '1131', '55407', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-016', 'D5-016', 12, 1, 'Hitachi EH3500', '', '000485', 'WB51503', '55377', 139, 'cable & conduit bad', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-017', 'D5-017', 12, 1, 'Hitachi EH3500', '', '000517', 'GPS1501', 'GPS1501', 139, 'Bad conduit', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-018', 'D5-018', 12, 1, 'Hitachi EH3500', '', '001375', '0155', '55390', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-019', 'D5-019', 12, 1, 'Hitachi EH3500', '', '000454', '1196', '55489', 139, 'bad conduit', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-020', 'D5-020', 12, 1, 'Hitachi EH3500', '', '000426', '1210', '66475', 140, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-021', 'D5-021', 12, 1, 'Hitachi EH3500', '', '001408', '0175', '63633', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-022', 'D5-022', 12, 1, 'Hitachi EH3500', '', '-', '-', '55484', 141, 'Conduit bad', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-023', 'D5-023', 12, 1, 'Hitachi EH3500', '', '000428', '1077', '66246', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-024', 'D5-024', 12, 1, 'Hitachi EH3500', '', '001213', '1086', '66412', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-025', 'D5-025', 12, 1, 'Hitachi EH3500', '', '000436', '0018', '66218', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-026', 'D5-026', 11, 1, 'Caterpillar CAT789C', '', '001377', '1259', '66230', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-027', 'D5-027', 11, 1, 'Caterpillar CAT789C', '', '000572', '1254', '54922', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-028', 'D5-028', 11, 1, 'Caterpillar CAT789C', '', '001402', '0098', '66171', 139, 'connector antenna kiri L', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-029', 'D5-029', 11, 1, 'Caterpillar CAT789C', '', '000496', '63197', '63197', 139, 'BAD CONDUIT', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-030', 'D5-030', 11, 1, 'Caterpillar CAT789C', '', '001372', '1192', '63194', 139, 'Bracket dan Conduit Bad', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-031', 'D5-031', 11, 1, 'Caterpillar CAT789C', '', '000332', '0212', '55615', 139, 'bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-032', 'D5-032', 11, 1, 'Caterpillar CAT789C', '', '000453', 'WB003', '66222', 139, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-033', 'D5-033', 11, 1, 'Caterpillar CAT789C', '', '001258', '1215', '66466', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-034', 'D5-034', 11, 1, 'Caterpillar CAT789C', '', '000460', '0149', '66221', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-035', 'D5-035', 11, 1, 'Caterpillar CAT789C', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-036', 'D5-036', 11, 1, 'Caterpillar CAT789C', '', '', '', '', 0, '', 26, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-037', 'D5-037', 11, 1, 'Caterpillar CAT789C', '', '001403', '1251', '63467', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-038', 'D5-038', 11, 1, 'Caterpillar CAT789C', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D5-039', 'D5-039', 11, 1, 'Caterpillar CAT789C', '', '001401', '1244', '55581', 139, 'Bad conduit', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('D6-001', 'D6-001', 5, 1, 'Description', '', 'sn mojo', 'sn wb', 'sn gps', 0, 'remark', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('FIX TOWER MIA 4', 'MTL MIA 4', 0, 4, 'Mega Tower MIA 4', 'Dispatch MIA 4', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('MTL CT', 'MTL CT', 0, 4, 'Mega Tower CT', 'View Point Central', '', '', '', 0, 'BELUM ADA FUSE HOLDER', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('MTL J5', 'MTL J5', 0, 4, 'Mega Tower J5', 'CSA Jalur 5', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('MTL North West', 'MTL North West', 0, 4, 'Mega Tower NW', 'View Point NW', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 01', 'PT 01', 22, 4, 'SIS-PT 12M 1', 'Parkiran STB MIA 4', '', '', '', 0, '', 161, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 02', 'PT 02', 22, 4, 'SIS-PT 12M 2', 'HW J5\n', '', '', '', 0, 'Cover Area PAAP Project', 24, 0, 0, '', '2018-05-08', '07:45:02', 'WANDI', 2),
('PT 03', 'PT 03', 22, 4, 'SIS-PT 12M 3', 'WARA', '', '', '', 0, '-', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 04', 'PT 04', 22, 4, 'SIS-PT 12M 4', 'WARA', '', '', '', 0, 'Unisntall Infinet SMN', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 05', 'PT 05', 22, 4, 'SIS-PT 12M 5', 'CSA N4', '', '', '', 0, 'Bracket kayu solarcell rapuh', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 06', 'PT 06', 22, 4, 'SIS-PT 12M 6', 'OB2', '', '', '', 0, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 07', 'PT 07', 22, 4, 'SIS-PT 12M 7', 'WARA', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 08', 'PT 08', 22, 4, 'SIS-PT 12M 8', 'OB2', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 09', 'PT 09', 22, 4, 'SIS-PT 12M 9', 'N4', '', '', '', 0, 'Portable need Rekondisi', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 10', 'PT 10', 22, 4, 'SIS-PT 12M 10', 'Parkiran STB MIA 4', '', '', '', 0, 'None', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 11', 'PT 11', 22, 4, 'SIS-PT 12M 11', 'OB1', '', '', '', 0, 'Need GOH', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 12', 'PT 12', 22, 4, 'SIS-PT 12M 12', 'Parkiran STB MIA 4', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 13', 'PT 13', 22, 4, 'SIS-PT 12M 13', 'OB2', '', '', '', 0, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 14', 'PT 14', 22, 4, 'SIS-PT 12M 14', 'Front N1', '', '', '', 0, '', 161, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 15', 'PT 15', 22, 4, 'SIS-PT 12M 15', 'Jalur 5', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 16', 'PT 16', 22, 4, 'SIS-PT 12M 16', 'Scrapt MIA 3', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 17', 'PT 17', 22, 4, 'SIS-PT 12M 17', 'CSA N1', '', '', '', 0, 'Jalan sering tertutup spoil grader', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 18', 'PT 18', 22, 4, 'SIS-PT 12M 18', 'CT1', '', '', '', 0, 'Need Rekondisi', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 19', 'PT 19', 22, 4, 'SIS-PT 12M 19', 'Disposal N1', '', '', '', 0, 'Jalan akses portable tertutup bundwall.', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 20', 'PT 20', 22, 4, 'SIS-PT 12M 20', 'N2\n', '', '', '', 0, 'By pass aruba to CPE, kabel LAN Aruba terkelupas. Switch need repair, Bracket Solarcell kayu', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 21', 'PT 21', 22, 4, 'SIS-PT 12M 21', 'OB2', '', '', '', 0, '-\r\n', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 22', 'PT 22', 22, 4, 'SIS-PT 12M 22', 'CSA N2', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 23', 'PT 23', 22, 4, 'SIS-PT 12M 23', 'OB1', '', '', '', 0, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 24', 'PT 24', 22, 4, 'SIS-PT 12M 24', 'Front N1\n', '', '', '', 0, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2);
INSERT INTO `unit_detail` (`cn_unit`, `id_unit`, `type_unit`, `kode_unit`, `description`, `position`, `sn_mojo`, `sn_wb`, `sn_gps`, `antenna`, `remark`, `status`, `relay`, `locked`, `recondition`, `date_update`, `time_update`, `pic_update`, `id_device`) VALUES
('PT 25', 'PT 25', 22, 4, 'SIS-PT 12M 25', 'Front N4', '', '', '', 0, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 26', 'PT 26', 22, 4, 'SIS-PT 12M 26', 'N3', '', '', '', 0, 'Change 4 Battery RITAR', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 27', 'PT 27', 22, 4, 'SIS-PT 12M 27', 'Pitsop 7 N3\n', '', '', '', 0, '-', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 28', 'PT 28', 22, 4, 'SIS-PT 12M 28', 'Disposal Jalur 5', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('PT 29', 'PT 29', 22, 4, 'SIS-PT 12M 29', 'CT1', '', '', '', 0, 'Bracket perangkat bad, groud petir bad, winch bawah bad, stiker titik jepit bad, nomer portable tidak ada, pole atas stuck.', 24, 0, 0, '', '2018-05-22', '10:39:44', 'TAUFIK,ADNAN,ANDI', 2),
('S6-002', 'S6-002', 13, 2, 'Liebherr R9350', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('S6-003', 'S6-003', 13, 2, 'Liebherr R9350', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('S6-004', 'S6-004', 13, 2, 'Liebherr R9350', '', '001413', '0129', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('S7-001', 'S7-001', 14, 2, 'Hitachi EX3600', '', '', '', '', 0, '', 26, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('S7-002', 'S7-002', 15, 2, 'SH4000', '', '000378', '0178', '84620', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('S7-003', 'S7-003', 15, 2, 'SH4000', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('SKID 01', 'SKID 01', 22, 4, 'SKID 01', 'View Point NW', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('SKID 02', 'SKID 02', 22, 4, 'SKID 02', 'WARA', '', '', '', 0, 'Installasi PTP to Dispatch WARA', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 2),
('X2-004', 'X2-004', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-007', 'X2-007', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-025', 'X2-025', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-028', 'X2-028', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-029', 'X2-029', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-033', 'X2-033', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-037', 'X2-037', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-038', 'X2-038', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-043', 'X2-043', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-048', 'X2-048', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-049', 'X2-049', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-050', 'X2-050', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-051', 'X2-051', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-052', 'X2-052', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X2-053', 'X2-053', 0, 3, 'N/A', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-001', 'X4-001', 17, 3, 'Komatsu PC2000-8', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-002', 'X4-002', 17, 3, 'Komatsu PC2000-8', '', '001397', '0026', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-003', 'X4-003', 17, 3, 'Komatsu PC2000-8', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-005', 'X4-005', 17, 3, 'Komatsu PC2000-8', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-006', 'X4-006', 17, 3, 'Komatsu PC2000-8', '', 'M7002', 'R00001', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-007', 'X4-007', 17, 3, 'Komatsu PC2000-8', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-009', 'X4-009', 17, 3, 'Komatsu PC2000-8', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-010', 'X4-010', 17, 3, 'Komatsu PC2000-8', '', '000443', '1104', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-011', 'X4-011', 17, 3, 'Komatsu PC2000-8', '', '000339', '0070', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-012', 'X4-012', 17, 3, 'Komatsu PC2000-8', '', '001270', '1083', '66238', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-014', 'X4-014', 17, 3, 'Komatsu PC2000-8', '', '', '', '', 0, '', 26, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-015', 'X4-015', 17, 3, 'Komatsu PC2000-8', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-018', 'X4-018', 17, 3, 'Komatsu PC2000-8', '', '000516', '1173', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-021', 'X4-021', 17, 3, 'Komatsu PC2000-8', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-022', 'X4-022', 17, 3, 'Komatsu PC2000-8', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-023', 'X4-023', 17, 3, 'Komatsu PC2000-8', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-024', 'X4-024', 17, 3, 'Komatsu PC2000-8', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-027', 'X4-027', 17, 3, 'Komatsu PC2000-8', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X4-031', 'X4-031', 17, 3, 'Komatsu PC2000-8', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X5-001', 'X5-001', 18, 3, 'Hitachi EX2500', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X5-003', 'X5-003', 18, 3, 'Hitachi EX2500', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X5-004', 'X5-004', 18, 3, 'Hitachi EX2500', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X5-005', 'X5-005', 18, 3, 'Hitachi EX2500', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X5-006', 'X5-006', 18, 3, 'Hitachi EX2500', '', '', '', '', 0, '', 26, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X5-007', 'X5-007', 18, 3, 'Hitachi EX2500', '', '001265', 'WB04', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X5-008', 'X5-008', 19, 3, 'Liebherr R9250', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X5-009', 'X5-009', 18, 3, 'Hitachi EX2500', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X5-011', 'X5-011', 18, 3, 'Hitachi EX2500', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X5-012', 'X5-012', 18, 3, 'Hitachi EX2500', '', '', '', '', 0, '', 25, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X5-035', 'X5-035', 20, 3, 'Liebherr R9200', '', '000449', '0021', '55901', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X5-036', 'X5-036', 20, 3, 'Liebherr R9200', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X7-001', 'X7-001', 14, 3, 'Hitachi EX3600', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X7-002', 'X7-002', 14, 3, 'Hitachi EX3600', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X7-003', 'X7-003', 14, 3, 'Hitachi EX3600', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X7-004', 'X7-004', 21, 3, 'Liebherr R9400', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X7-005', 'X7-005', 21, 3, 'Liebherr R9400', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X7-006', 'X7-006', 21, 3, 'Liebherr R9400', '', '000474', '0036', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X7-007', 'X7-007', 21, 3, 'Liebherr R9400', '', '001244', '0094', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X7-008', 'X7-008', 14, 3, 'Hitachi EX3600', '', '', '', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X7-009', 'X7-009', 14, 3, 'Hitachi EX3600', '', '000375', '0187', '', 0, '', 24, 0, 0, '', '0000-00-00', '00:00:00', '', 1),
('X7-010', 'X7-010', 14, 3, 'Hitachi EX3600', '', '', '', '', 0, '', 26, 0, 0, '', '0000-00-00', '00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_report`
--

CREATE TABLE IF NOT EXISTS `user_report` (
`IDUser` int(2) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `user_report`
--

INSERT INTO `user_report` (`IDUser`, `username`, `password`, `description`, `type`) VALUES
(1, 'administrator', '$2y$10$znZr2QTNEzod37yFocxiL.N2tPZDcvEftavkTQRVCPTeUatLimWxC', 'Full Access', 'Supervisor'),
(5, 'report', 'a27297bde9732f2e73fbc06db2611764e3ad9855', 'Reporting Access', 'Reporting'),
(16, 'sutarno', '3547c02e1c131e23d028c84cb7a530930eea40e2', 'Pak tarno Login..', 'Reporting'),
(17, 'rudy', 'edb1bcf4e84ca4a233ffa5880cbc7af81279ef1e', 'Full Akses Control', 'Supervisor'),
(19, 'aris', '4338a5da9ada4c289e5f0ab6c56a96baae1b6564', 'ariskulum akses', 'Administrator'),
(23, 'huzai', 'bd9d72feef95996e82ed0be724880b8510ae5910', 'Helper Administrator', 'administrator'),
(24, 'teknisi', '$2y$10$84fRgGaTdkxsX2hierWqg.lq1VkmDVAySpvB5ptNpgpcNWPgI.18S', 'Teknisi Reporting', 'teknisi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bandwith`
--
ALTER TABLE `bandwith`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_report`
--
ALTER TABLE `device_report`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enum`
--
ALTER TABLE `enum`
 ADD PRIMARY KEY (`IdEnum`);

--
-- Indexes for table `man_power`
--
ALTER TABLE `man_power`
 ADD PRIMARY KEY (`nrp`);

--
-- Indexes for table `pm_device`
--
ALTER TABLE `pm_device`
 ADD PRIMARY KEY (`id_pm`), ADD KEY `IdDevice` (`IdDevice`,`IdEnum`), ADD KEY `idUnit` (`idUnit`);

--
-- Indexes for table `recondition`
--
ALTER TABLE `recondition`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reportingjob`
--
ALTER TABLE `reportingjob`
 ADD PRIMARY KEY (`IDReport`);

--
-- Indexes for table `unit_detail`
--
ALTER TABLE `unit_detail`
 ADD PRIMARY KEY (`cn_unit`), ADD KEY `as_report` (`id_device`);

--
-- Indexes for table `user_report`
--
ALTER TABLE `user_report`
 ADD PRIMARY KEY (`IDUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bandwith`
--
ALTER TABLE `bandwith`
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `device_report`
--
ALTER TABLE `device_report`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `enum`
--
ALTER TABLE `enum`
MODIFY `IdEnum` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=215;
--
-- AUTO_INCREMENT for table `pm_device`
--
ALTER TABLE `pm_device`
MODIFY `id_pm` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `recondition`
--
ALTER TABLE `recondition`
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `reportingjob`
--
ALTER TABLE `reportingjob`
MODIFY `IDReport` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=373;
--
-- AUTO_INCREMENT for table `user_report`
--
ALTER TABLE `user_report`
MODIFY `IDUser` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
