-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2014 at 03:21 AM
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
`forgot_id` int(40) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(40) NOT NULL,
  `valid` int(11) NOT NULL,
  `answer` tinyint(1) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `device_type` varchar(40) NOT NULL,
  `IP_addr` varchar(40) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forgotten_attempts`
--

INSERT INTO `forgotten_attempts` (`forgot_id`, `user_id`, `timestamp`, `token`, `valid`, `answer`, `success`, `device_type`, `IP_addr`) VALUES
(1, 28, '2015-05-06 10:53:49', '6407449082', 0, 0, 0, 'Sed congue, elit', '65541'),
(2, 97, '2014-02-06 14:25:29', '8312579738', 0, 0, 0, 'montes, nascetur ridiculus', '60106'),
(3, 31, '2014-04-01 08:57:49', '3264605249', 0, 1, 1, 'hymenaeos. Mauris ut', '49114'),
(4, 26, '2013-12-25 08:00:37', '8846627697', 0, 0, 0, 'placerat velit. Quisque', '35616'),
(5, 6, '2015-06-29 06:49:46', '3744576513', 0, 0, 0, 'tristique senectus et', '15521'),
(6, 79, '2015-09-07 01:23:23', '1651852089', 0, 1, 1, 'nec mauris blandit', '41789'),
(7, 85, '2014-02-11 04:12:36', '9943935698', 0, 0, 1, 'auctor vitae, aliquet', '55175'),
(8, 98, '2014-06-07 14:18:35', '5463187438', 0, 1, 1, 'eu odio tristique', '88131'),
(9, 98, '2014-11-08 10:57:36', '8251851075', 0, 0, 0, 'eu, ligula. Aenean', '71503'),
(10, 84, '2013-11-20 17:57:59', '7392985504', 0, 1, 1, 'risus a ultricies', '26249'),
(11, 14, '2014-09-04 14:32:19', '7568075605', 0, 0, 1, 'facilisi. Sed neque.', '1315'),
(12, 45, '2014-06-22 06:04:10', '509230760', 0, 0, 0, 'imperdiet nec, leo.', '21349'),
(13, 39, '2015-01-21 22:41:11', '4746356728', 0, 0, 1, 'euismod enim. Etiam', '4365'),
(14, 15, '2014-09-09 09:18:13', '8872507452', 0, 1, 0, 'Aliquam ornare, libero', '83517'),
(15, 65, '2014-04-21 14:28:59', '8001341191', 0, 1, 1, 'enim non nisi.', '25157'),
(16, 92, '2015-04-21 05:08:29', '7509699915', 0, 1, 1, 'lobortis augue scelerisque', '48657'),
(17, 36, '2014-11-01 18:17:59', '6673083128', 0, 0, 1, 'lorem, auctor quis,', '37068'),
(18, 37, '2015-10-15 03:20:17', '8118974352', 0, 1, 1, 'nunc interdum feugiat.', '69073'),
(19, 99, '2014-09-14 21:05:55', '5644425070', 0, 1, 1, 'Nulla eget metus', '58121'),
(20, 63, '2014-10-17 06:09:35', '7878764453', 0, 1, 1, 'mi felis, adipiscing', '15629'),
(21, 101, '2015-01-27 19:40:46', '3863047580', 0, 1, 1, 'lobortis quis, pede.', '72139'),
(22, 51, '2015-08-11 17:27:17', '5102460505', 0, 1, 1, 'ac turpis egestas.', '59778'),
(23, 2, '2015-04-29 06:08:06', '9669542238', 0, 1, 0, 'eleifend egestas. Sed', '87497'),
(24, 77, '2014-11-20 14:27:01', '9656094214', 0, 0, 0, 'volutpat. Nulla dignissim.', '89871'),
(25, 75, '2014-07-22 10:40:08', '7375241024', 0, 0, 0, 'metus. In nec', '4128'),
(26, 4, '2015-09-16 15:15:19', '206628466', 0, 0, 0, 'semper pretium neque.', '34317'),
(27, 26, '2014-06-30 00:56:49', '3535174937', 0, 0, 0, 'magna. Lorem ipsum', '98719'),
(28, 17, '2014-04-02 11:14:22', '4438125817', 0, 0, 1, 'sagittis augue, eu', '58583'),
(29, 24, '2014-07-10 17:55:36', '6326468112', 0, 0, 0, 'orci sem eget', '50967'),
(30, 36, '2015-10-03 03:33:04', '4349258216', 0, 0, 1, 'adipiscing elit. Etiam', '82770'),
(31, 77, '2015-04-11 05:49:15', '1481119180', 0, 0, 1, 'gravida. Aliquam tincidunt,', '18394'),
(32, 23, '2014-04-07 00:47:14', '2698278604', 0, 0, 0, 'Quisque ac libero', '81911'),
(33, 25, '2015-05-12 15:42:24', '5679558418', 0, 1, 0, 'semper, dui lectus', '2809'),
(34, 21, '2014-02-17 22:46:46', '4238620251', 0, 1, 1, 'vitae diam. Proin', '21561'),
(35, 61, '2014-10-23 07:38:07', '613159221', 0, 0, 1, 'Aliquam gravida mauris', '8721'),
(36, 7, '2014-03-09 12:21:08', '7769716899', 0, 1, 1, 'placerat. Cras dictum', '21119'),
(37, 71, '2015-02-09 13:30:45', '7837993391', 0, 0, 0, 'blandit mattis. Cras', '61426'),
(38, 41, '2015-08-09 17:50:05', '3467619675', 0, 0, 0, 'Aenean euismod mauris', '8654'),
(39, 85, '2013-12-23 03:43:17', '8421257506', 0, 0, 1, 'dignissim lacus. Aliquam', '1727'),
(40, 72, '2014-09-20 10:01:20', '5460736719', 0, 0, 0, 'inceptos hymenaeos. Mauris', '26873'),
(41, 89, '2014-09-28 17:16:05', '6379387746', 0, 1, 1, 'ullamcorper, nisl arcu', '1662'),
(42, 74, '2014-11-01 19:45:26', '1511618910', 0, 0, 0, 'Curabitur ut odio', '37612'),
(43, 61, '2014-07-23 16:25:44', '9131575431', 0, 1, 0, 'elit elit fermentum', '22349'),
(44, 7, '2014-07-27 19:42:38', '3230781336', 0, 0, 0, 'ultrices sit amet,', '67005'),
(45, 21, '2015-06-23 17:11:52', '6139768902', 0, 1, 1, 'risus quis diam', '16710'),
(46, 9, '2015-10-01 21:10:51', '5325185936', 0, 0, 0, 'nisi dictum augue', '2489'),
(47, 44, '2015-08-15 10:19:51', '939009055', 0, 1, 0, 'elit fermentum risus,', '90113'),
(48, 11, '2014-08-28 10:17:48', '851212866', 0, 1, 0, 'velit justo nec', '43105'),
(49, 10, '2014-09-06 11:16:00', '2144953958', 0, 0, 0, 'id enim. Curabitur', '70219'),
(50, 21, '2015-01-03 18:35:10', '1102107419', 0, 1, 1, 'libero. Integer in', '14322'),
(51, 71, '2015-02-20 14:28:29', '4449811289', 0, 1, 1, 'faucibus lectus, a', '47745'),
(52, 22, '2015-05-17 19:22:49', '1904683165', 0, 0, 1, 'mollis. Integer tincidunt', '35453'),
(53, 89, '2015-04-05 14:06:12', '8708589309', 0, 1, 1, 'Curabitur dictum. Phasellus', '83235'),
(54, 69, '2015-04-05 15:45:42', '2164727175', 0, 0, 1, 'lorem lorem, luctus', '88986'),
(55, 95, '2014-06-18 09:20:26', '1025277772', 0, 0, 0, 'at lacus. Quisque', '90035'),
(56, 46, '2014-09-14 18:56:38', '299241301', 0, 0, 1, 'sed, sapien. Nunc', '33334'),
(57, 34, '2015-04-20 03:19:21', '5305724232', 0, 1, 0, 'Phasellus libero mauris,', '34935'),
(58, 21, '2014-10-20 21:40:19', '8619396654', 0, 1, 1, 'fermentum metus. Aenean', '83195'),
(59, 101, '2014-07-29 18:24:48', '3948440426', 0, 0, 1, 'Proin ultrices. Duis', '13333'),
(60, 17, '2015-08-05 00:24:33', '4163118173', 0, 0, 1, 'rhoncus. Donec est.', '87051'),
(61, 5, '2015-06-15 00:06:55', '492987894', 0, 0, 1, 'urna justo faucibus', '74727'),
(62, 85, '2014-02-16 03:20:14', '2724764077', 0, 1, 1, 'vel, faucibus id,', '75339'),
(63, 83, '2013-12-09 02:03:55', '6036880757', 0, 1, 1, 'turpis. Aliquam adipiscing', '55165'),
(64, 67, '2014-12-15 14:58:15', '973570808', 0, 0, 0, 'sit amet risus.', '60780'),
(65, 57, '2013-11-29 13:18:27', '1872501755', 0, 1, 1, 'nostra, per inceptos', '62230'),
(66, 44, '2015-04-20 17:10:37', '5212425725', 0, 0, 1, 'Donec est. Nunc', '38830'),
(67, 63, '2015-07-31 13:10:39', '550705367', 0, 1, 1, 'nec urna et', '67300'),
(68, 21, '2013-11-20 11:47:23', '7255357443', 0, 1, 0, 'elementum, dui quis', '67338'),
(69, 3, '2014-12-22 13:59:18', '4367326745', 0, 1, 0, 'sit amet nulla.', '61950'),
(70, 79, '2013-12-07 11:06:38', '7930682664', 0, 0, 1, 'magnis dis parturient', '74010'),
(71, 3, '2015-09-24 02:58:03', '399781787', 0, 1, 1, 'metus. Aliquam erat', '66605'),
(72, 58, '2014-02-05 19:00:41', '5379080414', 0, 0, 1, 'quis lectus. Nullam', '73991'),
(73, 15, '2015-04-10 13:53:12', '647474104', 0, 1, 0, 'Curabitur ut odio', '25342'),
(74, 60, '2014-12-03 15:11:46', '8739608405', 0, 1, 1, 'bibendum fermentum metus.', '52610'),
(75, 34, '2015-03-29 20:35:18', '262678192', 0, 0, 1, 'tellus eu augue', '29480'),
(76, 81, '2013-11-19 21:26:28', '6021696394', 0, 1, 1, 'Duis volutpat nunc', '38864'),
(77, 14, '2015-07-24 11:03:38', '9698629728', 0, 0, 0, 'non nisi. Aenean', '73557'),
(78, 92, '2014-03-29 22:54:23', '7215227093', 0, 0, 0, 'Aenean egestas hendrerit', '40195'),
(79, 76, '2015-05-15 05:13:25', '5610072799', 0, 1, 1, 'fringilla mi lacinia', '17830'),
(80, 33, '2014-04-05 02:39:17', '374738845', 0, 0, 0, 'dictum ultricies ligula.', '78410'),
(81, 6, '2014-12-19 12:46:29', '1790389219', 0, 1, 0, 'scelerisque neque sed', '89647'),
(82, 52, '2014-11-11 16:29:10', '4794201357', 0, 1, 1, 'nec ante blandit', '44023'),
(83, 32, '2015-06-30 00:40:25', '8962209513', 0, 1, 1, 'mauris, rhoncus id,', '87833'),
(84, 15, '2014-12-23 00:52:54', '9208232346', 0, 1, 0, 'congue. In scelerisque', '10590'),
(85, 15, '2015-01-18 04:12:51', '3890113980', 0, 1, 1, 'facilisis facilisis, magna', '43799'),
(86, 16, '2015-10-14 07:11:01', '2558225105', 0, 0, 1, 'adipiscing elit. Aliquam', '28703'),
(87, 38, '2015-07-11 12:43:19', '6458175494', 0, 0, 0, 'ac mattis semper,', '19429'),
(88, 23, '2015-06-05 06:00:24', '1465635659', 0, 1, 0, 'ante dictum mi,', '59513'),
(89, 6, '2014-12-13 21:03:18', '6141967913', 0, 0, 0, 'Donec elementum, lorem', '67187'),
(90, 39, '2015-04-04 17:54:59', '5219956483', 0, 0, 1, 'risus. Morbi metus.', '34114'),
(91, 43, '2014-11-27 09:43:12', '4900288256', 0, 1, 1, 'lectus. Cum sociis', '2354'),
(92, 11, '2014-07-14 06:35:50', '1465003807', 0, 0, 1, 'luctus, ipsum leo', '79729'),
(93, 99, '2015-06-14 07:51:22', '2697353396', 0, 0, 0, 'sem magna nec', '9825'),
(94, 9, '2015-11-05 03:00:48', '7782173687', 0, 1, 1, 'ornare sagittis felis.', '22489'),
(95, 26, '2015-01-29 10:43:13', '9290399351', 0, 1, 1, 'diam eu dolor', '2685'),
(96, 7, '2015-10-21 08:36:54', '296806931', 0, 0, 1, 'suscipit, est ac', '22927'),
(97, 90, '2014-10-18 17:36:53', '1711163107', 0, 0, 1, 'quam quis diam.', '38062'),
(98, 26, '2015-06-08 00:56:08', '5931396261', 0, 1, 1, 'sapien. Nunc pulvinar', '63240'),
(99, 27, '2015-03-04 03:32:05', '4313671058', 0, 0, 0, 'non, feugiat nec,', '46784'),
(100, 35, '2014-06-13 08:54:49', '2799208737', 0, 0, 0, 'orci. Phasellus dapibus', '96937');

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
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`attempt_id`, `timestamp`, `user_id`, `success`, `IP_addr`, `device_type`, `comment`) VALUES
(1, '2015-07-27 23:12:10', 5, 1, '56730', 'faucibus orci luctus', 'Nulla facilisis. Suspendisse commodo tincidunt'),
(2, '2015-06-09 01:28:32', 95, 1, '17921', 'netus et malesuada', 'iaculis, lacus pede sagittis augue,'),
(3, '2014-07-12 12:37:19', 88, 0, '7785', 'est ac mattis', 'Vestibulum ante ipsum primis in'),
(4, '2014-04-09 05:02:18', 36, 0, '19011', 'ornare, facilisis eget,', 'odio, auctor vitae, aliquet nec,'),
(5, '2014-02-10 15:24:43', 78, 0, '12437', 'semper tellus id', 'id sapien. Cras dolor dolor,'),
(6, '2014-10-15 03:09:38', 3, 0, '97771', 'Vivamus molestie dapibus', 'nisi a odio semper cursus.'),
(7, '2015-03-27 11:35:15', 64, 1, '87681', 'eget, dictum placerat,', 'luctus et ultrices posuere cubilia'),
(8, '2014-05-20 11:50:20', 78, 1, '96632', 'nec enim. Nunc', 'metus. Vivamus euismod urna. Nullam'),
(9, '2015-10-17 14:21:18', 30, 0, '77289', 'libero. Integer in', 'imperdiet ullamcorper. Duis at lacus.'),
(10, '2013-11-16 18:27:32', 29, 1, '65533', 'mi felis, adipiscing', 'dictum eu, placerat eget, venenatis'),
(11, '2014-03-26 21:08:19', 29, 0, '62381', 'Cras eu tellus', 'egestas. Sed pharetra, felis eget'),
(12, '2013-11-27 15:43:21', 76, 0, '51136', 'tristique senectus et', 'at lacus. Quisque purus sapien,'),
(13, '2015-01-14 12:43:29', 41, 1, '9489', 'velit egestas lacinia.', 'purus sapien, gravida non, sollicitudin'),
(14, '2015-06-29 07:03:24', 58, 0, '15945', 'vel pede blandit', 'ipsum sodales purus, in molestie'),
(15, '2014-01-13 16:19:43', 51, 1, '1876', 'nec, diam. Duis', 'Sed et libero. Proin mi.'),
(16, '2015-03-17 22:39:38', 17, 1, '59133', 'malesuada vel, venenatis', 'ullamcorper, velit in aliquet lobortis,'),
(17, '2015-05-27 17:21:27', 3, 1, '80496', 'nascetur ridiculus mus.', 'convallis dolor. Quisque tincidunt pede'),
(18, '2014-02-24 22:20:14', 88, 1, '8083', 'ridiculus mus. Proin', 'ut, sem. Nulla interdum. Curabitur'),
(19, '2015-07-06 18:18:47', 46, 1, '90428', 'tortor, dictum eu,', 'ornare tortor at risus. Nunc'),
(20, '2014-11-07 05:44:57', 101, 1, '87859', 'hymenaeos. Mauris ut', 'tristique senectus et netus et'),
(21, '2015-10-15 21:14:31', 79, 1, '48758', 'Morbi non sapien', 'nulla. Cras eu tellus eu'),
(22, '2014-12-16 00:19:09', 75, 1, '18294', 'Duis mi enim,', 'sit amet, consectetuer adipiscing elit.'),
(23, '2015-02-07 04:27:30', 87, 0, '85003', 'eget laoreet posuere,', 'Nunc commodo auctor velit. Aliquam'),
(24, '2014-09-28 17:42:45', 4, 1, '30274', 'vehicula aliquet libero.', 'luctus et ultrices posuere cubilia'),
(25, '2014-05-16 06:08:05', 46, 0, '84921', 'a, malesuada id,', 'magna. Praesent interdum ligula eu'),
(26, '2015-07-03 12:25:12', 23, 0, '38297', 'Fusce mi lorem,', 'Vestibulum ante ipsum primis in'),
(27, '2014-04-28 07:56:31', 11, 1, '50632', 'vitae, sodales at,', 'Pellentesque tincidunt tempus risus. Donec'),
(28, '2013-12-11 03:22:20', 90, 0, '51067', 'Nulla facilisis. Suspendisse', 'interdum ligula eu enim. Etiam'),
(29, '2014-11-02 21:35:05', 90, 0, '9957', 'nibh sit amet', 'feugiat non, lobortis quis, pede.'),
(30, '2013-11-21 15:58:23', 56, 1, '63010', 'faucibus lectus, a', 'in sodales elit erat vitae'),
(31, '2015-06-30 02:33:49', 54, 1, '21477', 'Nam porttitor scelerisque', 'Integer id magna et ipsum'),
(32, '2013-11-27 09:40:25', 14, 0, '45969', 'Integer vulputate, risus', 'nunc est, mollis non, cursus'),
(33, '2014-02-07 10:56:06', 60, 1, '89156', 'massa non ante', 'Aliquam tincidunt, nunc ac mattis'),
(34, '2014-12-12 20:18:10', 42, 0, '77936', 'massa. Mauris vestibulum,', 'in aliquet lobortis, nisi nibh'),
(35, '2014-11-03 16:54:08', 17, 1, '63624', 'vel pede blandit', 'ac ipsum. Phasellus vitae mauris'),
(36, '2014-02-23 08:35:07', 14, 0, '37137', 'massa. Mauris vestibulum,', 'imperdiet ornare. In faucibus. Morbi'),
(37, '2014-04-27 09:25:57', 65, 1, '83222', 'non, vestibulum nec,', 'ut, pellentesque eget, dictum placerat,'),
(38, '2014-02-10 19:37:17', 28, 1, '15315', 'Praesent eu nulla', 'cursus purus. Nullam scelerisque neque'),
(39, '2014-12-16 07:52:30', 73, 0, '74990', 'mauris sit amet', 'habitant morbi tristique senectus et'),
(40, '2014-04-09 04:10:40', 87, 0, '78057', 'turpis. Aliquam adipiscing', 'ornare egestas ligula. Nullam feugiat'),
(41, '2014-02-15 00:55:56', 96, 1, '57779', 'Sed et libero.', 'ridiculus mus. Aenean eget magna.'),
(42, '2015-02-07 03:48:28', 51, 1, '74844', 'ullamcorper magna. Sed', 'quis lectus. Nullam suscipit, est'),
(43, '2014-03-03 08:58:23', 47, 0, '24773', 'molestie tellus. Aenean', 'dolor. Fusce feugiat. Lorem ipsum'),
(44, '2015-01-28 09:09:36', 11, 1, '87844', 'diam. Pellentesque habitant', 'nec enim. Nunc ut erat.'),
(45, '2014-09-18 14:13:43', 69, 1, '63931', 'tristique pharetra. Quisque', 'egestas lacinia. Sed congue, elit'),
(46, '2015-03-03 21:22:06', 59, 1, '12801', 'ipsum. Donec sollicitudin', 'sagittis placerat. Cras dictum ultricies'),
(47, '2015-05-01 03:52:23', 92, 0, '13708', 'elementum sem, vitae', 'dictum magna. Ut tincidunt orci'),
(48, '2014-04-16 09:47:04', 27, 0, '58508', 'non, dapibus rutrum,', 'Quisque imperdiet, erat nonummy ultricies'),
(49, '2014-07-16 12:47:22', 58, 0, '66149', 'tempor augue ac', 'vel nisl. Quisque fringilla euismod'),
(50, '2015-03-09 15:01:47', 44, 1, '79831', 'Cum sociis natoque', 'Nunc ullamcorper, velit in aliquet'),
(51, '2015-10-14 17:04:52', 101, 0, '29324', 'nulla magna, malesuada', 'odio sagittis semper. Nam tempor'),
(52, '2015-08-30 08:59:43', 63, 1, '35865', 'amet, consectetuer adipiscing', 'ut eros non enim commodo'),
(53, '2015-01-27 15:23:48', 72, 1, '27331', 'eget nisi dictum', 'parturient montes, nascetur ridiculus mus.'),
(54, '2014-11-28 13:16:08', 88, 1, '62703', 'quis diam luctus', 'condimentum. Donec at arcu. Vestibulum'),
(55, '2014-11-08 04:06:34', 13, 1, '5886', 'Integer sem elit,', 'nunc risus varius orci, in'),
(56, '2015-05-19 04:35:14', 44, 1, '18478', 'lacus. Quisque imperdiet,', 'nunc. Quisque ornare tortor at'),
(57, '2015-06-25 14:19:45', 20, 0, '22335', 'volutpat ornare, facilisis', 'Donec tempor, est ac mattis'),
(58, '2014-06-22 11:12:14', 60, 1, '29949', 'egestas. Sed pharetra,', 'ac sem ut dolor dapibus'),
(59, '2014-08-10 01:45:31', 79, 1, '19928', 'sem mollis dui,', 'aliquet libero. Integer in magna.'),
(60, '2015-07-05 02:11:06', 77, 1, '61822', 'Duis cursus, diam', 'Donec sollicitudin adipiscing ligula. Aenean'),
(61, '2013-12-13 02:44:36', 5, 0, '35982', 'Suspendisse commodo tincidunt', 'Cras vulputate velit eu sem.'),
(62, '2014-08-07 05:09:33', 22, 1, '6036', 'quis arcu vel', 'Vestibulum ut eros non enim'),
(63, '2015-02-06 16:50:02', 88, 1, '9437', 'tortor at risus.', 'fermentum metus. Aenean sed pede'),
(64, '2015-10-17 03:28:49', 25, 0, '31313', 'ornare, facilisis eget,', 'sapien. Aenean massa. Integer vitae'),
(65, '2015-04-17 00:02:48', 89, 0, '68193', 'urna et arcu', 'Etiam ligula tortor, dictum eu,'),
(66, '2014-05-01 12:00:36', 77, 1, '14814', 'orci. Donec nibh.', 'Sed id risus quis diam'),
(67, '2013-12-13 23:36:29', 66, 1, '90568', 'pede nec ante', 'vulputate eu, odio. Phasellus at'),
(68, '2014-04-13 22:41:58', 13, 0, '62719', 'lorem vitae odio', 'odio sagittis semper. Nam tempor'),
(69, '2015-05-21 16:17:47', 97, 1, '49047', 'ultricies sem magna', 'gravida. Aliquam tincidunt, nunc ac'),
(70, '2014-06-21 05:35:45', 58, 0, '19785', 'in aliquet lobortis,', 'ligula. Aenean gravida nunc sed'),
(71, '2014-08-11 16:38:06', 65, 0, '86899', 'sed pede nec', 'elementum at, egestas a, scelerisque'),
(72, '2015-08-19 04:00:15', 86, 1, '14069', 'dui. Fusce diam', 'nisi. Cum sociis natoque penatibus'),
(73, '2014-09-23 12:52:52', 27, 1, '98795', 'Donec at arcu.', 'Suspendisse commodo tincidunt nibh. Phasellus'),
(74, '2015-10-24 18:06:29', 70, 0, '21242', 'et netus et', 'magna. Suspendisse tristique neque venenatis'),
(75, '2014-04-14 13:56:23', 54, 1, '40087', 'Cras convallis convallis', 'lectus quis massa. Mauris vestibulum,'),
(76, '2013-11-22 05:18:11', 33, 1, '35482', 'lobortis tellus justo', 'ut, sem. Nulla interdum. Curabitur'),
(77, '2015-09-25 07:50:31', 32, 0, '66958', 'odio. Aliquam vulputate', 'magna et ipsum cursus vestibulum.'),
(78, '2015-08-01 12:09:18', 15, 1, '90771', 'orci luctus et', 'ipsum ac mi eleifend egestas.'),
(79, '2014-12-31 07:31:27', 67, 1, '11688', 'imperdiet nec, leo.', 'Suspendisse sed dolor. Fusce mi'),
(80, '2014-01-25 08:17:26', 64, 1, '1257', 'dictum sapien. Aenean', 'nec orci. Donec nibh. Quisque'),
(81, '2015-03-14 21:37:15', 85, 0, '43213', 'vel lectus. Cum', 'sociis natoque penatibus et magnis'),
(82, '2015-06-25 10:39:57', 13, 1, '5467', 'ipsum. Suspendisse non', 'vitae diam. Proin dolor. Nulla'),
(83, '2015-07-22 10:17:20', 77, 1, '89839', 'Vivamus rhoncus. Donec', 'orci. Donec nibh. Quisque nonummy'),
(84, '2014-02-04 08:16:04', 15, 0, '2746', 'Phasellus fermentum convallis', 'lacinia orci, consectetuer euismod est'),
(85, '2013-11-16 09:11:31', 10, 0, '2815', 'mauris a nunc.', 'eu nulla at sem molestie'),
(86, '2014-09-30 09:40:25', 13, 0, '24657', 'vehicula aliquet libero.', 'ridiculus mus. Proin vel arcu'),
(87, '2015-03-24 18:20:00', 35, 1, '99356', 'luctus vulputate, nisi', 'quam, elementum at, egestas a,'),
(88, '2014-07-25 06:50:11', 100, 0, '75130', 'a purus. Duis', 'vitae diam. Proin dolor. Nulla'),
(89, '2015-07-27 19:33:11', 28, 0, '18256', 'lacinia. Sed congue,', 'In ornare sagittis felis. Donec'),
(90, '2015-09-27 23:25:59', 88, 0, '48764', 'est, vitae sodales', 'amet, faucibus ut, nulla. Cras'),
(91, '2015-01-08 11:11:55', 90, 1, '43454', 'vestibulum massa rutrum', 'convallis ligula. Donec luctus aliquet'),
(92, '2015-02-08 00:12:44', 34, 0, '41072', 'egestas lacinia. Sed', 'Nam porttitor scelerisque neque. Nullam'),
(93, '2014-02-05 09:25:07', 81, 0, '20397', 'auctor, nunc nulla', 'orci, in consequat enim diam'),
(94, '2014-11-14 00:25:45', 70, 0, '93701', 'vitae erat vel', 'id, libero. Donec consectetuer mauris'),
(95, '2014-12-20 12:29:51', 85, 0, '66539', 'accumsan neque et', 'Sed nec metus facilisis lorem'),
(96, '2015-04-09 08:45:44', 52, 0, '49301', 'at sem molestie', 'elementum sem, vitae aliquam eros'),
(97, '2015-02-11 04:41:47', 14, 0, '42222', 'quam quis diam.', 'dolor, nonummy ac, feugiat non,'),
(98, '2014-07-21 10:31:20', 29, 0, '91391', 'facilisi. Sed neque.', 'sapien. Nunc pulvinar arcu et'),
(99, '2014-12-27 02:56:07', 37, 1, '93854', 'Nam tempor diam', 'quam dignissim pharetra. Nam ac'),
(100, '2015-08-21 01:23:12', 93, 1, '63808', 'libero. Proin sed', 'justo eu arcu. Morbi sit');

-- --------------------------------------------------------

--
-- Table structure for table `passwords`
--

CREATE TABLE IF NOT EXISTS `passwords` (
`pass_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL DEFAULT '',
  `salt` varchar(128) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(40) NOT NULL,
  `active` int(1) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passwords`
--

INSERT INTO `passwords` (`pass_id`, `user_id`, `password`, `salt`, `timestamp`, `type`, `active`) VALUES
(1, 1, '6D67C0C7C02C991CBC409AA09D00C4E8606010F25AFDDDE98015CC3FF4CBBDB96184EFDA09427F82AC32140D8E1F8FC7356037995AE1BF2310971AC6D3B47C0A', '', '2014-11-05 17:42:19', '', 1),
(100, 100, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-02-07 08:24:06', '2', 1),
(101, 101, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2013-12-26 20:12:26', '1', 1),
(98, 98, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-04-30 11:46:52', '2', 1),
(99, 99, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-07-22 20:14:08', '1', 1),
(95, 95, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-09-20 17:01:00', '2', 1),
(96, 96, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-12-24 19:46:00', '1', 1),
(97, 97, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-11-02 10:28:51', '2', 1),
(94, 94, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-09-29 02:28:39', '1', 1),
(93, 93, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-12-15 02:18:11', '2', 1),
(92, 92, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-10-24 07:43:26', '2', 1),
(91, 91, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-04-14 12:31:18', '2', 1),
(90, 90, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-08-08 00:49:03', '1', 1),
(89, 89, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-05-11 22:26:23', '1', 1),
(88, 88, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-07-26 07:36:21', '2', 1),
(87, 87, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-04-01 13:02:14', '1', 1),
(86, 86, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-02-22 23:06:17', '2', 1),
(85, 85, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-04-20 08:25:51', '1', 1),
(84, 84, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-07-10 07:12:20', '2', 1),
(83, 83, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-10-12 10:58:06', '2', 1),
(82, 82, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-01-15 19:10:20', '2', 1),
(81, 81, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-02-22 22:34:35', '2', 1),
(80, 80, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-08-29 11:06:04', '1', 1),
(79, 79, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2013-12-01 00:02:19', '1', 1),
(78, 78, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-06-19 02:10:56', '1', 1),
(77, 77, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-05-16 02:21:38', '1', 1),
(76, 76, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-01-30 01:53:02', '2', 1),
(75, 75, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-03-12 04:07:50', '1', 1),
(74, 74, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-07-22 22:07:38', '2', 1),
(73, 73, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-06-25 20:11:03', '2', 1),
(72, 72, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-09-18 22:36:15', '1', 1),
(71, 71, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-06-08 17:02:32', '1', 1),
(70, 70, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-11-29 12:45:09', '2', 1),
(69, 69, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-06-23 23:30:58', '2', 1),
(68, 68, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-02-08 23:19:44', '1', 1),
(67, 67, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-07-24 04:22:24', '1', 1),
(66, 66, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-11-21 22:08:56', '1', 1),
(65, 65, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-10-18 13:40:44', '1', 1),
(64, 64, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-08-14 06:37:30', '2', 1),
(63, 63, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-06-17 07:27:48', '2', 1),
(62, 62, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-11-30 01:55:52', '2', 1),
(61, 61, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-01-05 08:44:27', '2', 1),
(60, 60, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-05-25 12:56:46', '1', 1),
(59, 59, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-10-25 03:02:04', '1', 1),
(58, 58, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2013-12-18 16:36:45', '1', 1),
(57, 57, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-01-28 02:01:18', '1', 1),
(56, 56, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-08-23 08:16:05', '2', 1),
(55, 55, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-05-30 03:09:38', '2', 1),
(54, 54, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-12-10 13:19:24', '1', 1),
(53, 53, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-11-02 19:43:39', '1', 1),
(52, 52, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-05-23 08:30:24', '2', 1),
(51, 51, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-03-30 13:09:54', '2', 1),
(50, 50, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2013-11-22 22:02:21', '1', 1),
(49, 49, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-07-20 03:01:44', '1', 1),
(48, 48, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-09-28 20:52:30', '1', 1),
(47, 47, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-11-04 11:34:38', '1', 1),
(46, 46, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-03-03 02:15:05', '2', 1),
(45, 45, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-10-03 20:39:00', '2', 1),
(44, 44, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2013-12-13 02:18:40', '1', 1),
(43, 43, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-12-27 21:51:22', '2', 1),
(42, 42, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-03-13 09:07:57', '2', 1),
(41, 41, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-09-22 06:17:27', '2', 1),
(40, 40, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-10-30 06:55:28', '1', 1),
(39, 39, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-04-21 17:22:26', '1', 1),
(38, 38, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-03-24 19:06:23', '2', 1),
(37, 37, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-09-19 17:00:51', '2', 1),
(36, 36, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-09-25 04:15:58', '2', 1),
(35, 35, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2013-12-29 14:20:58', '1', 1),
(34, 34, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-07-09 04:17:32', '2', 1),
(33, 33, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-06-13 22:44:21', '1', 1),
(32, 32, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-07-11 13:16:52', '1', 1),
(31, 31, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-06-26 06:12:58', '1', 1),
(30, 30, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-08-06 13:37:43', '1', 1),
(29, 29, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-10-09 22:24:49', '1', 1),
(28, 28, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-12-20 01:11:10', '2', 1),
(27, 27, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-10-29 10:09:09', '2', 1),
(26, 26, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-01-27 23:41:51', '1', 1),
(25, 25, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-07-04 12:52:43', '2', 1),
(24, 24, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-08-09 13:07:04', '1', 1),
(23, 23, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-06-23 16:55:59', '1', 1),
(22, 22, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-01-24 18:25:41', '1', 1),
(21, 21, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-07-30 12:07:05', '1', 1),
(20, 20, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-11-20 23:17:33', '1', 1),
(19, 19, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-09-13 23:49:09', '1', 1),
(18, 18, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-08-17 20:14:47', '2', 1),
(17, 17, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-09-08 15:14:35', '1', 1),
(16, 16, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-08-01 18:43:04', '2', 1),
(15, 15, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-05-28 04:22:42', '2', 1),
(14, 14, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-03-22 12:35:50', '2', 1),
(13, 13, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-08-08 05:48:00', '1', 1),
(12, 12, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-08-17 08:31:35', '2', 1),
(11, 11, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-02-10 19:08:20', '1', 1),
(10, 10, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-10-12 13:30:13', '2', 1),
(9, 9, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-02-17 16:40:45', '1', 1),
(8, 8, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-11-18 06:17:08', '1', 1),
(7, 7, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-06-19 01:44:01', '1', 1),
(6, 6, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-08-09 11:37:41', '2', 1),
(5, 5, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-07-01 00:00:19', '1', 1),
(4, 4, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2014-11-14 23:08:47', '2', 1),
(3, 3, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-03-19 02:48:53', '2', 1),
(2, 2, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', '2015-03-05 20:56:53', '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass_id` int(11) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `secret_question` varchar(100) NOT NULL,
  `date_registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `pass_id`, `first_name`, `last_name`, `secret_question`, `date_registered`, `role_id`) VALUES
(1, 'bozhkov.atanas@gmail.com', 1, 'Atanas', 'Bozhkov', 'what', '2014-11-05 17:27:11', 0),
(92, 'Aliquam.erat@sedorcilobortis.ca', 92, 'Quinn', 'Dunlap', 'faucibus id, libero.', '2015-09-13 11:22:02', 1),
(93, 'Nunc.ac@Suspendissesed.edu', 93, 'Drake', 'Parks', 'sed, hendrerit a,', '2015-04-20 08:16:13', 1),
(94, 'fermentum@tortor.org', 94, 'Vance', 'Hutchinson', 'est tempor bibendum.', '2015-04-08 12:31:52', 1),
(95, 'Aliquam.adipiscing@non.com', 95, 'Ronan', 'Cobb', 'volutpat. Nulla facilisis.', '2015-03-02 13:17:03', 1),
(96, 'Mauris.molestie@fringilla.ca', 96, 'Peter', 'Oneal', 'Etiam ligula tortor,', '2014-01-14 04:41:52', 1),
(97, 'nulla.Integer.urna@nisiMauris.com', 97, 'Jerome', 'Sexton', 'faucibus orci luctus', '2014-08-25 15:17:18', 1),
(98, 'nonummy.ipsum@estarcuac.ca', 98, 'Linus', 'Cole', 'et, rutrum eu,', '2014-02-25 00:30:23', 1),
(99, 'lorem.vehicula@commodohendreritDonec.co.uk', 99, 'Davis', 'Harrell', 'Mauris non dui', '2014-09-02 11:07:32', 1),
(100, 'non@perinceptos.com', 100, 'Tucker', 'Henderson', 'amet, dapibus id,', '2014-10-30 20:20:08', 1),
(101, 'ridiculus.mus@eratsemper.org', 101, 'Carl', 'Cotton', 'tempus scelerisque, lorem', '2015-01-06 14:38:47', 1),
(2, 'sed@amalesuada.edu', 2, 'Erich', 'Porter', 'odio vel est', '2014-04-12 05:07:02', 1),
(3, 'habitant@Suspendisse.org', 3, 'Harlan', 'Petersen', 'ligula. Nullam feugiat', '2013-11-12 19:30:50', 1),
(4, 'Cras.dictum.ultricies@ipsum.edu', 4, 'August', 'Jackson', 'lobortis mauris. Suspendisse', '2014-12-23 12:14:01', 1),
(5, 'pede.Praesent.eu@congueturpis.com', 5, 'Kermit', 'Everett', 'cursus et, magna.', '2015-04-23 21:53:56', 1),
(6, 'bibendum.ullamcorper@necligula.net', 6, 'Moses', 'Anthony', 'Aliquam auctor, velit', '2014-02-09 03:58:56', 1),
(7, 'Sed@enimnonnisi.org', 7, 'Graham', 'Sullivan', 'est. Mauris eu', '2014-07-20 04:52:07', 1),
(8, 'non@egetmagna.ca', 8, 'Lucas', 'Lopez', 'Donec tempor, est', '2015-05-03 14:09:39', 1),
(9, 'malesuada.augue.ut@liberoMorbi.edu', 9, 'Igor', 'Hensley', 'a purus. Duis', '2014-04-10 03:22:35', 1),
(10, 'Nulla.facilisis@sodalesMauris.edu', 10, 'Ethan', 'Bradshaw', 'elit. Nulla facilisi.', '2015-02-04 22:38:10', 1),
(11, 'tempor@et.com', 11, 'Paul', 'Sherman', 'nonummy ultricies ornare,', '2015-02-07 01:02:20', 1),
(12, 'arcu.Sed.eu@arcu.org', 12, 'Gray', 'Weiss', 'laoreet lectus quis', '2014-12-22 15:46:41', 1),
(13, 'Etiam@habitantmorbitristique.ca', 13, 'Melvin', 'Hendrix', 'Proin vel arcu', '2013-11-15 21:43:54', 1),
(14, 'sagittis.lobortis@nequevenenatislacus.net', 14, 'Zeus', 'Adkins', 'non, luctus sit', '2015-11-09 07:08:56', 1),
(15, 'molestie.in@risusDuisa.ca', 15, 'Walter', 'Martin', 'magnis dis parturient', '2015-09-10 03:02:57', 1),
(16, 'accumsan.neque@lectus.org', 16, 'Jason', 'Floyd', 'tempus eu, ligula.', '2014-08-28 04:20:13', 1),
(17, 'nec.ante.Maecenas@felis.org', 17, 'Victor', 'Mcdowell', 'turpis. Nulla aliquet.', '2014-09-27 05:12:12', 1),
(18, 'neque.venenatis@mattisCraseget.net', 18, 'Rashad', 'Robles', 'vel nisl. Quisque', '2015-02-19 21:36:54', 1),
(19, 'vitae@turpis.co.uk', 19, 'Fuller', 'Medina', 'interdum. Curabitur dictum.', '2014-10-19 23:03:39', 1),
(20, 'Integer@gravidanon.edu', 20, 'Mohammad', 'Solis', 'adipiscing lacus. Ut', '2015-09-02 17:43:00', 1),
(21, 'elementum@Maurisvel.co.uk', 21, 'Oren', 'Mayer', 'aliquam eu, accumsan', '2014-11-21 14:58:32', 1),
(22, 'urna@euismod.ca', 22, 'Jared', 'Jefferson', 'turpis vitae purus', '2014-07-14 03:00:25', 1),
(23, 'non.sapien@amifringilla.ca', 23, 'Louis', 'Gordon', 'dui. Suspendisse ac', '2014-06-25 12:17:50', 1),
(24, 'Cras.vulputate.velit@ametfaucibusut.com', 24, 'Ahmed', 'Kidd', 'at pede. Cras', '2014-05-31 17:11:08', 1),
(25, 'amet.metus@ipsumdolor.com', 25, 'Burton', 'Vinson', 'vestibulum nec, euismod', '2015-05-20 02:58:34', 1),
(26, 'dis.parturient.montes@justoPraesentluctus.ca', 26, 'Thomas', 'Morris', 'sapien. Cras dolor', '2015-08-29 16:30:46', 1),
(27, 'eget@duinec.org', 27, 'Graham', 'Terry', 'ornare, facilisis eget,', '2015-08-26 07:11:26', 1),
(28, 'dignissim.tempor@adipiscinglacusUt.ca', 28, 'Hu', 'Harrison', 'ultricies sem magna', '2014-05-09 09:29:59', 1),
(29, 'Nulla@tellus.edu', 29, 'Jerry', 'Terry', 'Nulla eget metus', '2015-10-20 19:23:17', 1),
(30, 'ultricies@dolorDonecfringilla.net', 30, 'Alvin', 'Irwin', 'imperdiet ornare. In', '2014-09-04 05:33:49', 1),
(31, 'mi@eget.org', 31, 'Stone', 'Woods', 'sollicitudin a, malesuada', '2014-03-15 10:20:27', 1),
(32, 'Morbi.neque@eleifendvitaeerat.net', 32, 'Herman', 'Munoz', 'nisl elementum purus,', '2015-01-31 15:08:09', 1),
(33, 'Cras.pellentesque@egestasnuncsed.co.uk', 33, 'Emmanuel', 'Jensen', 'dictum. Proin eget', '2014-03-30 20:53:42', 1),
(34, 'sit@id.co.uk', 34, 'William', 'Gomez', 'Pellentesque habitant morbi', '2013-11-29 05:36:38', 1),
(35, 'interdum@malesuada.net', 35, 'Gray', 'Pacheco', 'in molestie tortor', '2015-05-01 08:51:11', 1),
(36, 'vel@pretium.org', 36, 'Magee', 'Olsen', 'mauris sagittis placerat.', '2014-07-25 10:59:53', 1),
(37, 'mi@enimSed.edu', 37, 'Ulysses', 'Franklin', 'quam a felis', '2014-01-24 05:55:02', 1),
(38, 'ipsum.Phasellus.vitae@Etiam.co.uk', 38, 'Abel', 'Quinn', 'id, libero. Donec', '2013-11-27 06:12:19', 1),
(39, 'Aliquam.fringilla@atiaculis.co.uk', 39, 'Ryder', 'Mclean', 'Pellentesque ultricies dignissim', '2014-11-05 02:27:49', 1),
(40, 'Phasellus@sapien.co.uk', 40, 'Walter', 'Vang', 'arcu. Nunc mauris.', '2013-12-14 17:56:47', 1),
(41, 'mauris.Integer@Lorem.ca', 41, 'Lucas', 'Atkins', 'mollis dui, in', '2014-11-02 08:46:22', 1),
(42, 'vel@utnulla.co.uk', 42, 'Blake', 'Mcneil', 'at augue id', '2014-06-26 06:23:39', 1),
(43, 'interdum@per.org', 43, 'Thor', 'Sharpe', 'posuere, enim nisl', '2014-07-21 08:20:37', 1),
(44, 'eu.ligula@Phasellusdapibusquam.co.uk', 44, 'Dominic', 'Sykes', 'mattis. Cras eget', '2014-12-15 09:49:17', 1),
(45, 'interdum.feugiat@Nunc.org', 45, 'Bradley', 'Hess', 'Mauris non dui', '2014-11-30 04:19:22', 1),
(46, 'Duis@et.edu', 46, 'Cairo', 'Savage', 'pede. Suspendisse dui.', '2014-03-08 19:43:07', 1),
(47, 'Nulla.interdum.Curabitur@Suspendissealiquetsem.ca', 47, 'Baker', 'Powers', 'a, facilisis non,', '2014-12-05 23:55:07', 1),
(48, 'nec.enim@duiSuspendisseac.org', 48, 'Bruno', 'Mercer', 'aliquam adipiscing lacus.', '2014-08-27 12:52:03', 1),
(49, 'nulla.ante.iaculis@vestibulum.ca', 49, 'Ralph', 'Wall', 'magna. Suspendisse tristique', '2014-06-20 22:07:47', 1),
(50, 'quis.pede.Praesent@Integer.edu', 50, 'Adam', 'Wolf', 'vitae velit egestas', '2014-06-10 22:23:01', 1),
(51, 'diam.nunc@erosProin.co.uk', 51, 'Jesse', 'Santana', 'malesuada ut, sem.', '2015-07-17 09:15:52', 1),
(52, 'dolor.quam.elementum@Donec.ca', 52, 'Jarrod', 'Chen', 'Nunc commodo auctor', '2014-06-09 11:25:56', 1),
(53, 'Cras.pellentesque.Sed@atlacusQuisque.net', 53, 'Chase', 'Mosley', 'congue. In scelerisque', '2014-03-15 16:59:20', 1),
(54, 'aliquet@mollis.edu', 54, 'Dylan', 'Norris', 'commodo at, libero.', '2014-06-30 10:47:28', 1),
(55, 'accumsan.laoreet@luctuset.org', 55, 'Carlos', 'Salazar', 'magnis dis parturient', '2015-09-28 09:45:37', 1),
(56, 'amet.consectetuer.adipiscing@ornareegestas.org', 56, 'Alvin', 'Mathis', 'Phasellus elit pede,', '2015-02-22 09:26:18', 1),
(57, 'diam.Proin.dolor@quam.com', 57, 'Axel', 'Estrada', 'Sed congue, elit', '2014-07-30 08:28:31', 1),
(58, 'ornare@est.net', 58, 'Eaton', 'Haynes', 'gravida sit amet,', '2014-11-03 19:49:06', 1),
(59, 'nunc@Nullam.ca', 59, 'Scott', 'Knapp', 'at fringilla purus', '2013-12-25 00:11:02', 1),
(60, 'lorem.lorem@augueeutempor.edu', 60, 'Keegan', 'England', 'Nunc ac sem', '2015-09-26 20:42:58', 1),
(61, 'ac.orci@vitaemaurissit.net', 61, 'Gage', 'Mack', 'fermentum arcu. Vestibulum', '2014-11-24 06:25:40', 1),
(62, 'tellus@nibhdolor.com', 62, 'Burton', 'Sanford', 'Nunc ac sem', '2014-10-04 13:40:26', 1),
(63, 'sagittis@sagittis.edu', 63, 'George', 'Adkins', 'auctor vitae, aliquet', '2014-10-01 00:27:15', 1),
(64, 'dis@nisidictum.ca', 64, 'Chandler', 'Guzman', 'turpis egestas. Aliquam', '2014-06-15 22:35:08', 1),
(65, 'mauris@euelit.edu', 65, 'Cairo', 'Patton', 'lectus sit amet', '2014-11-08 02:21:40', 1),
(66, 'Nunc@maurisSuspendisse.net', 66, 'Blaze', 'Harris', 'ligula. Aliquam erat', '2014-08-08 05:42:22', 1),
(67, 'tincidunt@dui.ca', 67, 'Herrod', 'Prince', 'eu, ligula. Aenean', '2014-04-18 10:07:07', 1),
(68, 'Phasellus.vitae@sagittisplaceratCras.net', 68, 'Xavier', 'Mathews', 'Integer in magna.', '2013-12-14 22:37:31', 1),
(69, 'ipsum.Phasellus@blandit.ca', 69, 'Rudyard', 'Pearson', 'aliquet. Phasellus fermentum', '2014-01-16 05:58:35', 1),
(70, 'lorem.semper@laciniaorci.com', 70, 'Basil', 'Sellers', 'eu dui. Cum', '2015-04-13 21:16:09', 1),
(71, 'mollis.non@sodalespurusin.co.uk', 71, 'Orson', 'Stewart', 'urna convallis erat,', '2015-09-05 12:28:50', 1),
(72, 'Donec@atvelitCras.com', 72, 'Calvin', 'Crosby', 'Lorem ipsum dolor', '2015-07-11 15:51:21', 1),
(73, 'Nam@vulputate.co.uk', 73, 'Connor', 'Mcgee', 'leo elementum sem,', '2015-06-06 21:52:28', 1),
(74, 'vehicula.Pellentesque.tincidunt@Inat.edu', 74, 'Keaton', 'Hester', 'vulputate velit eu', '2014-03-03 06:36:03', 1),
(75, 'nisi@condimentumDonecat.com', 75, 'Eric', 'Alvarez', 'eros. Proin ultrices.', '2015-05-01 15:03:04', 1),
(76, 'erat@leoMorbineque.co.uk', 76, 'Austin', 'Gibson', 'sed tortor. Integer', '2014-03-08 19:39:29', 1),
(77, 'eu@atrisus.co.uk', 77, 'Curran', 'Kline', 'cursus et, magna.', '2015-04-04 21:52:22', 1),
(78, 'faucibus.ut@Phasellus.com', 78, 'Talon', 'Salazar', 'faucibus. Morbi vehicula.', '2014-04-09 00:44:00', 1),
(79, 'gravida@adipiscingnon.org', 79, 'Ira', 'Howard', 'adipiscing. Mauris molestie', '2015-06-07 13:37:19', 1),
(80, 'Ut.tincidunt.vehicula@quisdiamPellentesque.ca', 80, 'August', 'Barton', 'hendrerit neque. In', '2015-03-20 19:37:05', 1),
(81, 'mollis.nec.cursus@blanditatnisi.net', 81, 'Victor', 'Serrano', 'luctus ut, pellentesque', '2013-12-02 13:08:50', 1),
(82, 'nascetur.ridiculus@Sed.net', 82, 'Quinn', 'Nieves', 'lacus. Aliquam rutrum', '2014-05-22 19:03:02', 1),
(83, 'Duis.sit.amet@arcuAliquamultrices.co.uk', 83, 'Wyatt', 'Mcdonald', 'lectus. Nullam suscipit,', '2014-01-24 07:35:42', 1),
(84, 'Nulla.semper@eleifendnon.ca', 84, 'Evan', 'Marsh', 'eget nisi dictum', '2015-01-21 17:50:07', 1),
(85, 'luctus.lobortis@purusNullamscelerisque.edu', 85, 'Tiger', 'Dodson', 'imperdiet dictum magna.', '2015-01-20 04:23:46', 1),
(86, 'enim@magna.net', 86, 'Callum', 'Bean', 'laoreet ipsum. Curabitur', '2013-12-03 14:20:23', 1),
(87, 'penatibus.et.magnis@sodales.co.uk', 87, 'Lance', 'Bruce', 'aliquet vel, vulputate', '2015-02-09 17:18:58', 1),
(88, 'eu.eleifend.nec@egestasurna.com', 88, 'Erich', 'Roy', 'Praesent luctus. Curabitur', '2015-05-30 14:37:03', 1),
(89, 'sit@facilisismagna.ca', 89, 'Price', 'Hughes', 'nunc nulla vulputate', '2015-07-31 03:06:51', 1),
(90, 'augue@Duis.edu', 90, 'Kermit', 'Guerra', 'nec quam. Curabitur', '2015-08-15 20:09:07', 1),
(91, 'cursus.in.hendrerit@a.edu', 91, 'Oscar', 'Preston', 'nec ante. Maecenas', '2013-12-14 08:34:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
`role_id` int(11) NOT NULL,
  `role_desc` varchar(40) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`role_id`, `role_desc`) VALUES
(1, 'Stupid user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forgotten_attempts`
--
ALTER TABLE `forgotten_attempts`
 ADD PRIMARY KEY (`forgot_id`);

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
-- AUTO_INCREMENT for table `forgotten_attempts`
--
ALTER TABLE `forgotten_attempts`
MODIFY `forgot_id` int(40) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
MODIFY `attempt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `passwords`
--
ALTER TABLE `passwords`
MODIFY `pass_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
