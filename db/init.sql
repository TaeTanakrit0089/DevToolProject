-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2024 at 03:31 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz1_sec6`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `contact` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `name`, `address`, `contact`) VALUES
(1, 'Siam Paragon Branch', '991 Rama I Rd, Pathum Wan, Bangkok 10330', '022500000'),
(2, 'CentralWorld Branch', '4, 4/1-4/2, 4/4 Ratchadamri Rd, Pathum Wan, Bangkok 10330', '021000000'),
(3, 'Mega Bangna Branch', '39 Moo 6, Bangna-Trad Rd, Bang Kaeo, Bang Phli, Samut Prakan 10540', '027500000'),
(4, 'Fashion Island Branch', '587, 589, 589/7-9 Ramintra Rd, Khan Na Yao, Bangkok 10230', '025500000'),
(5, 'Central Ladprao Branch', '1693 Phahonyothin Rd, Chatuchak, Bangkok 10900', '025600000'),
(6, 'The Mall Bangkapi Branch', '3522 Ladprao Rd, Khlong Chan, Bang Kapi, Bangkok 10240', '026500000'),
(7, 'Imperial World Samrong Branch', '999 Sukhumvit Rd, Samrong Nuea, Mueang Samut Prakan, Samut Prakan 10270', '027800000'),
(8, 'Central WestGate Branch', '199/3 Moo 6, Kanchanaphisek Rd, Sao Thong Hin, Bang Yai, Nonthaburi 11140', '028800000'),
(9, 'IconSiam Branch', '299 Charoen Nakhon Rd, Khlong Ton Sai, Khlong San, Bangkok 10600', '026000000'),
(10, 'Central Rama 9 Branch', '9/8-9/9 Ratchadaphisek Rd, Huai Khwang, Bangkok 10310', '029900000');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` int(5) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`invoice_id`, `product_id`, `amount`, `total`) VALUES
(1, 1, 1, 300),
(1, 4, 20, 8000),
(1, 19, 2, 630),
(2, 2, 1, 450),
(2, 3, 3, 1050),
(2, 10, 2, 840),
(3, 3, 1, 350),
(4, 4, 1, 400),
(5, 5, 1, 280),
(6, 6, 1, 320),
(7, 7, 1, 310),
(8, 8, 1, 380),
(9, 9, 1, 360),
(10, 10, 1, 420),
(11, 11, 1, 440),
(12, 12, 1, 340),
(13, 13, 1, 290),
(14, 14, 1, 370),
(15, 15, 1, 330),
(16, 16, 1, 500),
(17, 17, 1, 410),
(18, 18, 1, 365),
(19, 19, 1, 315),
(20, 20, 1, 395),
(21, 10, 1, 420),
(21, 13, 2, 580),
(21, 21, 1, 425),
(21, 25, 2, 590),
(22, 22, 1, 455),
(23, 23, 1, 355),
(24, 24, 1, 385),
(25, 25, 1, 295),
(26, 1, 1, 300),
(27, 2, 1, 450),
(28, 3, 1, 350),
(29, 4, 1, 400),
(30, 5, 1, 280),
(31, 6, 1, 320),
(32, 7, 1, 310),
(33, 8, 1, 380),
(34, 9, 1, 360),
(35, 10, 1, 420),
(36, 11, 1, 440),
(37, 12, 1, 340),
(38, 13, 1, 290),
(39, 14, 1, 370),
(40, 15, 1, 330),
(41, 16, 1, 500),
(42, 17, 1, 410),
(43, 18, 1, 365),
(44, 19, 1, 315),
(45, 20, 1, 395),
(46, 26, 1, 34100),
(46, 27, 1, 15500),
(46, 30, 2, 322);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `occupation` varchar(50) NOT NULL,
  `salary` int(10) NOT NULL,
  `date_of_birth` date NOT NULL,
  `hired_date` datetime NOT NULL,
  `fired_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `branch_id`, `email`, `first_name`, `last_name`, `gender`, `occupation`, `salary`, `date_of_birth`, `hired_date`, `fired_date`) VALUES
(1, 9, 'holmespeggy@book.in.th', 'Peggy', 'Holmes', 'Female', 'Cashier', 27513, '1985-11-11', '2019-06-02 06:36:40', NULL),
(2, 5, 'mjoshua@book.in.th', 'Joshua', 'Morris', 'Male', 'Supervisor', 35101, '1990-11-20', '2018-02-07 15:42:07', NULL),
(3, 8, 'emma221@book.in.th', 'Emma', 'Martinez', 'Female', 'Supervisor', 30285, '1997-12-08', '2015-01-21 22:39:42', NULL),
(4, 4, 'josewilliams821@book.in.th', 'Josephine', 'Williams', 'Female', 'Sales', 23508, '1989-02-10', '2018-07-31 00:00:12', '2022-11-11 20:36:30'),
(5, 10, 'emilypatterson@book.in.th', 'Emily', 'Patterson', 'Female', 'Sales', 47920, '1990-01-04', '2024-01-13 05:16:12', NULL),
(6, 1, 'martinf@book.in.th', 'Frank', 'Martin', 'Male', 'Supervisor', 17724, '1980-10-03', '2020-03-22 04:40:29', NULL),
(7, 2, 'billysalazar@book.in.th', 'Billy', 'Salazar', 'Male', 'Supervisor', 10846, '1988-07-15', '2019-07-08 13:47:25', NULL),
(8, 6, 'barnes7@book.in.th', 'Carrie', 'Barnes', 'Female', 'Sales', 35183, '1980-04-29', '2018-06-27 19:22:01', NULL),
(9, 3, 'judithnguyen@book.in.th', 'Judith', 'Nguyen', 'Female', 'Manager', 45525, '1992-06-08', '2022-07-22 04:10:02', NULL),
(10, 7, 'brown316@book.in.th', 'Sherry', 'Brown', 'Female', 'Cashier', 49337, '2001-06-09', '2015-02-28 02:13:44', NULL),
(11, 2, 'hlui@book.in.th', 'Luis', 'Hall', 'Male', 'Manager', 15067, '2002-06-10', '2022-04-03 19:54:31', '2022-06-01 20:21:14'),
(12, 10, 'clarence5@book.in.th', 'Clarence', 'Cole', 'Male', 'Sales', 26358, '1995-09-15', '2019-07-31 13:23:47', NULL),
(13, 2, 'noramirez65@book.in.th', 'Norma', 'Ramirez', 'Female', 'Manager', 19845, '1984-05-29', '2022-05-17 04:37:25', NULL),
(14, 1, 'herrerapam@book.in.th', 'Pamela', 'Herrera', 'Female', 'Sales', 9661, '1982-09-11', '2022-07-31 23:13:55', NULL),
(15, 10, 'roroger@book.in.th', 'Roger', 'Roberts', 'Male', 'Supervisor', 12392, '1998-05-24', '2015-05-02 17:12:04', NULL),
(16, 8, 'fmarie@book.in.th', 'Marie', 'Fisher', 'Female', 'Supervisor', 20414, '1986-01-19', '2017-01-26 06:54:00', NULL),
(17, 1, 'marcusvasqu1948@book.in.th', 'Marcus', 'Vasquez', 'Male', 'Manager', 33824, '1992-10-19', '2019-07-28 16:33:26', NULL),
(18, 6, 'ircrawford3@book.in.th', 'Irene', 'Crawford', 'Female', 'Cashier', 16156, '2001-12-29', '2020-12-12 18:03:21', NULL),
(19, 9, 'gordon9@book.in.th', 'Valerie', 'Gordon', 'Female', 'Supervisor', 19717, '1985-12-23', '2019-11-01 20:22:51', '2022-02-04 10:05:05'),
(20, 1, 'joyceh1941@book.in.th', 'Joyce', 'Holmes', 'Female', 'Supervisor', 29527, '1985-03-28', '2019-06-18 21:00:37', '2022-10-19 04:14:00'),
(21, 6, 'sandersj@book.in.th', 'Joyce', 'Sanders', 'Female', 'Cashier', 29301, '2001-06-23', '2018-02-07 10:35:47', NULL),
(22, 2, 'joannejone@book.in.th', 'Joanne', 'Jones', 'Female', 'Sales', 27096, '1998-09-20', '2023-04-21 21:27:10', NULL),
(23, 4, 'parkerkathryn96@book.in.th', 'Kathryn', 'Parker', 'Female', 'Sales', 43145, '1984-12-09', '2021-10-30 07:10:16', NULL),
(24, 7, 'jimmygray5@book.in.th', 'Jimmy', 'Gray', 'Male', 'Sales', 42343, '1985-07-25', '2024-05-26 10:57:33', NULL),
(25, 8, 'lerhoward@book.in.th', 'Leroy', 'Howard', 'Male', 'Sales', 34360, '1984-09-10', '2016-12-28 20:35:42', NULL),
(26, 5, 'randall6@book.in.th', 'Randall', 'Olson', 'Male', 'Cashier', 8920, '2000-04-21', '2016-07-07 23:13:43', '2022-10-01 10:44:09'),
(27, 4, 'greenstephen1@book.in.th', 'Stephen', 'Green', 'Male', 'Sales', 24215, '1982-05-07', '2023-02-10 03:24:05', '2023-02-03 19:56:47'),
(28, 10, 'chen75@book.in.th', 'Peggy', 'Chen', 'Female', 'Sales', 10000, '2001-06-11', '2021-04-18 02:45:52', NULL),
(29, 3, 'bell9@book.in.th', 'Norman', 'Bell', 'Male', 'Sales', 29219, '1988-04-18', '2015-06-19 14:17:25', NULL),
(30, 8, 'rust@book.in.th', 'Theodore', 'Russell', 'Male', 'Sales', 43288, '2001-11-28', '2019-05-06 13:17:09', NULL),
(31, 8, 'dennmendoza@book.in.th', 'Dennis', 'Mendoza', 'Male', 'Manager', 44235, '1990-02-17', '2021-08-17 02:56:43', NULL),
(32, 10, 'roseflores1@book.in.th', 'Rose', 'Flores', 'Female', 'Sales', 44646, '1982-01-10', '2017-02-14 15:13:15', NULL),
(33, 5, 'ryalaura@book.in.th', 'Laura', 'Ryan', 'Female', 'Manager', 22206, '1991-11-09', '2017-09-05 07:04:54', '2023-08-16 10:24:50'),
(34, 9, 'adcrystal8@book.in.th', 'Crystal', 'Adams', 'Female', 'Cashier', 31980, '2000-04-26', '2022-01-07 10:14:24', NULL),
(35, 2, 'jesusbell@book.in.th', 'Jesus', 'Bell', 'Male', 'Cashier', 42400, '2002-07-18', '2021-03-11 13:13:00', NULL),
(36, 2, 'bobbkennedy@book.in.th', 'Bobby', 'Kennedy', 'Male', 'Cashier', 36358, '1992-02-19', '2019-09-25 20:16:45', NULL),
(37, 1, 'alan7@book.in.th', 'Alan', 'Wilson', 'Male', 'Supervisor', 31080, '1980-12-04', '2017-12-26 17:44:46', NULL),
(38, 5, 'ccha@book.in.th', 'Chad', 'Chen', 'Male', 'Manager', 30119, '1980-01-03', '2023-11-08 21:27:28', NULL),
(39, 3, 'chris1215@book.in.th', 'Chris', 'Vargas', 'Male', 'Supervisor', 24551, '2001-12-13', '2024-06-28 01:00:54', '2023-05-05 19:32:03'),
(40, 7, 'christine8@book.in.th', 'Christine', 'Salazar', 'Female', 'Sales', 26499, '1996-11-07', '2021-09-01 22:45:05', NULL),
(41, 2, 'wipamela4@book.in.th', 'Pamela', 'Williams', 'Female', 'Sales', 44606, '2000-02-28', '2016-01-26 19:21:42', '2024-06-17 10:16:07'),
(42, 7, 'marcryan@book.in.th', 'Marcus', 'Ryan', 'Male', 'Manager', 19757, '1982-10-27', '2018-11-25 02:36:13', NULL),
(43, 8, 'floresjaco@book.in.th', 'Jacob', 'Flores', 'Male', 'Cashier', 25807, '1985-04-16', '2021-09-21 23:50:14', NULL),
(44, 4, 'bruce5@book.in.th', 'Bruce', 'Silva', 'Male', 'Cashier', 34265, '2001-12-12', '2020-12-15 12:32:03', NULL),
(45, 3, 'castrobilly@book.in.th', 'Billy', 'Castro', 'Male', 'Cashier', 46545, '1986-04-12', '2016-11-28 19:51:25', NULL),
(46, 4, 'pr09@book.in.th', 'Peter', 'Ruiz', 'Male', 'Sales', 32862, '1993-09-18', '2021-01-18 01:53:55', NULL),
(47, 10, 'murphyrosa@book.in.th', 'Rosa', 'Murphy', 'Female', 'Cashier', 47048, '1996-08-21', '2016-08-16 18:15:48', NULL),
(48, 5, 'phillips3@book.in.th', 'Donald', 'Phillips', 'Male', 'Cashier', 36299, '1982-06-15', '2022-09-01 07:39:28', NULL),
(49, 4, 'emma215@book.in.th', 'Emma', 'Collins', 'Female', 'Manager', 14668, '1990-05-03', '2016-04-07 06:37:59', NULL),
(50, 10, 'pm10@book.in.th', 'Michelle', 'Phillips', 'Female', 'Cashier', 18247, '1981-03-17', '2023-01-11 00:45:14', '2023-08-26 00:40:16'),
(51, 5, 'sotjoyce@book.in.th', 'Joyce', 'Soto', 'Female', 'Cashier', 42171, '2001-02-01', '2020-02-11 01:37:36', NULL),
(52, 6, 'gardnerlee3@book.in.th', 'Lee', 'Gardner', 'Male', 'Supervisor', 37232, '1991-03-27', '2019-04-27 11:08:25', NULL),
(53, 5, 'angelake@book.in.th', 'Angela', 'Kennedy', 'Female', 'Cashier', 20196, '1993-08-13', '2019-11-19 16:58:29', '2023-07-16 04:12:46'),
(54, 2, 'hayeskeit2012@book.in.th', 'Keith', 'Hayes', 'Male', 'Sales', 36225, '1980-05-30', '2016-08-21 20:38:38', NULL),
(55, 8, 'ernewagner6@book.in.th', 'Ernest', 'Wagner', 'Male', 'Sales', 36049, '1987-11-17', '2018-01-07 08:04:12', NULL),
(56, 10, 'sma615@book.in.th', 'Martha', 'Snyder', 'Female', 'Sales', 43636, '1989-04-24', '2023-01-16 07:24:50', NULL),
(57, 4, 'lalexander@book.in.th', 'Lois', 'Alexander', 'Female', 'Cashier', 42150, '1992-06-22', '2017-12-04 06:09:26', NULL),
(58, 3, 'rosswa@book.in.th', 'Wayne', 'Ross', 'Male', 'Sales', 18610, '1985-01-02', '2023-12-29 03:10:19', NULL),
(59, 10, 'medinaanna8@book.in.th', 'Anna', 'Medina', 'Female', 'Supervisor', 34600, '1985-10-05', '2015-06-07 13:06:16', NULL),
(60, 9, 'joanneso5@book.in.th', 'Joanne', 'Soto', 'Female', 'Manager', 34510, '1996-08-16', '2018-11-11 02:41:52', NULL),
(61, 7, 'howardelean1974@book.in.th', 'Eleanor', 'Howard', 'Female', 'Sales', 49142, '2002-05-18', '2016-04-27 09:27:24', '2022-10-08 19:31:31'),
(62, 9, 'brdawn@book.in.th', 'Dawn', 'Brooks', 'Female', 'Sales', 28766, '1999-08-31', '2016-11-28 05:31:52', NULL),
(63, 8, 'murrafrancisco56@book.in.th', 'Francisco', 'Murray', 'Male', 'Sales', 30533, '1998-04-01', '2016-05-24 02:50:47', NULL),
(64, 1, 'sngu9@book.in.th', 'Sandra', 'Nguyen', 'Female', 'Cashier', 29264, '1996-04-15', '2020-03-29 12:17:16', '2022-07-28 21:36:24'),
(65, 5, 'martin88@book.in.th', 'Kyle', 'Martin', 'Male', 'Supervisor', 23930, '1994-10-13', '2018-02-23 00:00:58', NULL),
(66, 5, 'munoz3@book.in.th', 'Valerie', 'Munoz', 'Female', 'Manager', 42912, '2001-09-13', '2020-12-20 03:37:50', NULL),
(67, 1, 'jordanbobby07@book.in.th', 'Bobby', 'Jordan', 'Male', 'Cashier', 21649, '1993-07-10', '2018-09-27 11:39:53', NULL),
(68, 9, 'chavez713@book.in.th', 'Kimberly', 'Chavez', 'Female', 'Manager', 40613, '1998-07-22', '2019-05-01 16:57:49', NULL),
(69, 1, 'lisa611@book.in.th', 'Lisa', 'Ruiz', 'Female', 'Supervisor', 36065, '1986-06-10', '2021-04-29 16:16:40', NULL),
(70, 4, 'torres8@book.in.th', 'Sean', 'Torres', 'Male', 'Sales', 37426, '1987-06-25', '2015-03-24 20:04:28', NULL),
(71, 6, 'kellyt1969@book.in.th', 'Thomas', 'Kelly', 'Male', 'Supervisor', 24139, '1997-11-15', '2019-12-27 03:32:46', NULL),
(72, 5, 'murphyteresa@book.in.th', 'Teresa', 'Murphy', 'Female', 'Cashier', 45269, '2000-02-03', '2018-05-25 13:44:11', '2023-01-01 23:21:01'),
(73, 9, 'garylon119@book.in.th', 'Gary', 'Long', 'Male', 'Cashier', 46609, '1992-12-23', '2019-06-21 23:35:56', NULL),
(74, 4, 'shen@book.in.th', 'Henry', 'Shaw', 'Male', 'Supervisor', 8223, '1983-02-18', '2024-07-17 01:52:36', NULL),
(75, 6, 'crystalchav@book.in.th', 'Crystal', 'Chavez', 'Female', 'Sales', 37256, '2001-04-25', '2018-07-28 18:18:36', '2022-02-25 20:27:56'),
(76, 3, 'harrisonannie@book.in.th', 'Annie', 'Harrison', 'Female', 'Sales', 27918, '1997-05-30', '2017-12-29 06:35:38', '2022-01-14 04:49:35'),
(77, 7, 'snhenry@book.in.th', 'Henry', 'Snyder', 'Male', 'Manager', 26558, '1996-09-26', '2016-02-25 06:53:47', NULL),
(78, 3, 'clarence1110@book.in.th', 'Clarence', 'Bailey', 'Male', 'Manager', 8494, '1997-10-28', '2017-08-21 18:58:35', '2022-09-22 03:25:12'),
(79, 4, 'mjohn3@book.in.th', 'John', 'Moore', 'Male', 'Supervisor', 20585, '1994-07-29', '2016-10-20 10:21:52', NULL),
(80, 1, 'kimhamil67@book.in.th', 'Kim', 'Hamilton', 'Female', 'Supervisor', 17575, '1988-05-16', '2024-07-06 06:13:19', '2022-03-09 03:05:25'),
(81, 8, 'kellyca84@book.in.th', 'Carrie', 'Kelly', 'Female', 'Manager', 44346, '2000-06-18', '2016-12-22 07:38:08', NULL),
(82, 9, 'patterson910@book.in.th', 'George', 'Patterson', 'Male', 'Sales', 46867, '1981-03-23', '2016-04-08 03:38:28', '2022-03-08 03:34:48'),
(83, 2, 'juanc@book.in.th', 'Juan', 'Coleman', 'Male', 'Sales', 25979, '1984-06-05', '2022-12-05 10:21:13', NULL),
(84, 10, 'dg1962@book.in.th', 'Gerald', 'Daniels', 'Male', 'Manager', 20002, '1982-10-11', '2022-05-23 05:50:08', '2023-09-27 22:06:08'),
(85, 2, 'ebrow@book.in.th', 'Elizabeth', 'Brown', 'Female', 'Cashier', 34377, '1981-07-31', '2021-09-01 18:14:51', NULL),
(86, 6, 'normac6@book.in.th', 'Norman', 'Clark', 'Male', 'Manager', 41263, '1989-10-29', '2015-05-10 21:39:48', NULL),
(87, 8, 'hicks218@book.in.th', 'Matthew', 'Hicks', 'Male', 'Supervisor', 40295, '2000-07-22', '2022-07-14 12:03:51', NULL),
(88, 1, 'bryant6@book.in.th', 'Rhonda', 'Bryant', 'Female', 'Manager', 34825, '1986-12-17', '2016-04-17 07:46:33', NULL),
(89, 3, 'white7@book.in.th', 'Cindy', 'White', 'Female', 'Sales', 46186, '1998-07-04', '2016-08-10 02:38:24', NULL),
(90, 7, 'gchristine@book.in.th', 'Christine', 'Gordon', 'Female', 'Cashier', 12198, '1981-04-29', '2020-04-06 23:00:59', NULL),
(91, 3, 'medicrystal@book.in.th', 'Crystal', 'Medina', 'Female', 'Supervisor', 22253, '1984-03-27', '2020-02-26 03:39:17', '2024-01-13 01:13:28'),
(92, 3, 'hc5@book.in.th', 'Harry', 'Carter', 'Male', 'Sales', 10032, '1991-12-22', '2016-08-25 04:33:00', NULL),
(93, 6, 'evh@book.in.th', 'Eva', 'Hernandez', 'Female', 'Cashier', 49013, '1999-04-17', '2020-04-26 04:20:28', NULL),
(94, 7, 'ronalgardn@book.in.th', 'Ronald', 'Gardner', 'Male', 'Supervisor', 17564, '1984-02-26', '2022-04-01 09:15:46', NULL),
(95, 7, 'rygla2@book.in.th', 'Gladys', 'Ryan', 'Female', 'Sales', 35055, '1987-08-06', '2016-03-10 08:48:05', NULL),
(96, 9, 'mlu6@book.in.th', 'Luis', 'Medina', 'Male', 'Cashier', 32784, '1986-10-14', '2020-03-29 16:31:27', NULL),
(97, 7, 'martinv615@book.in.th', 'Valerie', 'Martin', 'Female', 'Supervisor', 32690, '1983-03-19', '2024-07-25 15:14:52', NULL),
(98, 9, 'edgraham@book.in.th', 'Edward', 'Graham', 'Male', 'Sales', 36695, '1990-10-29', '2018-08-06 01:32:23', NULL),
(99, 6, 'tammyyoung@book.in.th', 'Tammy', 'Young', 'Female', 'Cashier', 28293, '2002-12-04', '2018-06-27 18:33:31', NULL),
(100, 6, 'brian93@book.in.th', 'Brian', 'Barnes', 'Male', 'Cashier', 40808, '1985-12-31', '2018-08-23 10:18:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `branch_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`branch_id`, `product_id`, `quantity`) VALUES
(1, 1, 50),
(1, 2, 40),
(1, 3, 70),
(1, 4, 30),
(1, 5, 60),
(1, 6, 90),
(1, 7, 20),
(1, 8, 80),
(1, 9, 10),
(1, 10, 0),
(2, 1, 55),
(2, 2, 45),
(2, 3, 75),
(2, 4, 35),
(2, 5, 65),
(2, 6, 95),
(2, 7, 25),
(2, 8, 85),
(2, 9, 15),
(2, 10, 5),
(3, 1, 60),
(3, 2, 50),
(3, 3, 0),
(3, 4, 40),
(3, 5, 70),
(3, 6, 100),
(3, 7, 30),
(3, 8, 90),
(3, 9, 20),
(3, 10, 10),
(4, 1, 65),
(4, 2, 55),
(4, 3, 85),
(4, 4, 45),
(4, 5, 75),
(4, 6, 95),
(4, 7, 35),
(4, 8, 85),
(4, 9, 25),
(4, 10, 15),
(5, 1, 70),
(5, 2, 60),
(5, 3, 90),
(5, 4, 50),
(5, 5, 80),
(5, 6, 100),
(5, 7, 40),
(5, 8, 90),
(5, 9, 30),
(5, 10, 20),
(6, 1, 75),
(6, 2, 0),
(6, 3, 95),
(6, 4, 55),
(6, 5, 85),
(6, 6, 100),
(6, 7, 45),
(6, 8, 95),
(6, 9, 35),
(6, 10, 25),
(7, 1, 80),
(7, 2, 70),
(7, 3, 100),
(7, 4, 60),
(7, 5, 90),
(7, 6, 80),
(7, 7, 50),
(7, 8, 100),
(7, 9, 40),
(7, 10, 30),
(8, 1, 85),
(8, 2, 75),
(8, 3, 95),
(8, 4, 65),
(8, 5, 85),
(8, 6, 90),
(8, 7, 55),
(8, 8, 90),
(8, 9, 45),
(8, 10, 35),
(9, 1, 90),
(9, 2, 80),
(9, 3, 100),
(9, 4, 0),
(9, 5, 90),
(9, 6, 85),
(9, 7, 60),
(9, 8, 95),
(9, 9, 50),
(9, 10, 40),
(10, 1, 95),
(10, 2, 85),
(10, 3, 90),
(10, 4, 75),
(10, 5, 85),
(10, 6, 80),
(10, 7, 65),
(10, 8, 90),
(10, 9, 55),
(10, 10, 45);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `branch_id`, `member_id`, `total`) VALUES
(1, 1, 1, 8930),
(2, 2, 2, 2550),
(3, 3, 3, 350),
(4, 4, 4, 400),
(5, 5, 5, 280),
(6, 6, 6, 320),
(7, 7, 7, 310),
(8, 8, 8, 380),
(9, 9, 9, 360),
(10, 10, 10, 420),
(11, 1, 11, 440),
(12, 2, 12, 340),
(13, 3, 13, 290),
(14, 4, 14, 370),
(15, 5, 15, 330),
(16, 6, 16, 500),
(17, 7, 17, 410),
(18, 8, 18, 365),
(19, 9, 19, 315),
(20, 10, 20, 395),
(21, 1, 21, 2015),
(22, 2, 22, 455),
(23, 3, 23, 355),
(24, 4, 24, 385),
(25, 5, 25, 295),
(26, 6, 1, 300),
(27, 7, 2, 450),
(28, 8, 3, 350),
(29, 9, 4, 400),
(30, 10, 5, 280),
(31, 1, 6, 320),
(32, 2, 7, 310),
(33, 3, 8, 380),
(34, 4, 9, 360),
(35, 5, 10, 420),
(36, 6, 11, 440),
(37, 7, 12, 340),
(38, 8, 13, 290),
(39, 9, 14, 370),
(40, 10, 15, 330),
(41, 1, 16, 500),
(42, 2, 17, 410),
(43, 3, 18, 365),
(44, 4, 19, 315),
(45, 5, 20, 395),
(46, 1, NULL, 49922);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `points` int(11) NOT NULL,
  `status_active` tinyint(1) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `email`, `first_name`, `last_name`, `points`, `status_active`, `created_date`) VALUES
(1, 'somchai.thai@kmitl.ac.th', 'Somchai', 'Thai', 120, 1, '2024-01-01 10:00:00'),
(2, 'suda.sukanya@kmitl.ac.th', 'Suda', 'Sukanya', 150, 1, '2024-01-02 11:30:00'),
(3, 'anong.kasem@kmitl.ac.th', 'Anong', 'Kasem', 200, 1, '2024-01-03 09:45:00'),
(4, 'nitaya.jinda@kmitl.ac.th', 'Nitaya', 'Jinda', 180, 0, '2024-01-04 14:20:00'),
(5, 'preecha.prajak@kmitl.ac.th', 'Preecha', 'Prajak', 220, 1, '2024-01-05 16:10:00'),
(6, 'manop.manee@kmitl.ac.th', 'Manop', 'Manee', 90, 1, '2024-01-06 13:50:00'),
(7, 'pranee.thara@kmitl.ac.th', 'Pranee', 'Thara', 75, 1, '2024-01-07 17:25:00'),
(8, 'chan.kasem@kmitl.ac.th', 'Chan', 'Kasem', 110, 0, '2024-01-08 12:05:00'),
(9, 'malee.srisuk@kmitl.ac.th', 'Malee', 'Srisuk', 160, 1, '2024-01-09 10:15:00'),
(10, 'wanchai.chai@kmitl.ac.th', 'Wanchai', 'Chai', 130, 1, '2024-01-10 08:30:00'),
(11, 'pim.suri@kmitl.ac.th', 'Pim', 'Suri', 95, 0, '2024-01-11 15:40:00'),
(12, 'krit.kritsana@kmitl.ac.th', 'Krit', 'Kritsana', 140, 1, '2024-01-12 13:55:00'),
(13, 'saowalak.yada@kmitl.ac.th', 'Saowalak', 'Yada', 210, 1, '2024-01-13 11:20:00'),
(14, 'athit.sila@kmitl.ac.th', 'Athit', 'Sila', 80, 0, '2024-01-14 16:45:00'),
(15, 'vichai.phuwadon@kmitl.ac.th', 'Vichai', 'Phuwadon', 170, 1, '2024-01-15 09:10:00'),
(16, 'siriwat.silp@kmitl.ac.th', 'Siriwat', 'Silp', 190, 1, '2024-01-16 12:35:00'),
(17, 'nutthida.yada@kmitl.ac.th', 'Nutthida', 'Yada', 115, 1, '2024-01-17 14:50:00'),
(18, 'kanokwan.boon@kmitl.ac.th', 'Kanokwan', 'Boon', 125, 1, '2024-01-18 08:25:00'),
(19, 'pong.sorn@kmitl.ac.th', 'Pong', 'Sorn', 135, 0, '2024-01-19 17:15:00'),
(20, 'ying.laila@kmitl.ac.th', 'Ying', 'Laila', 145, 1, '2024-01-20 10:55:00'),
(21, 'komkrit.prasert@kmitl.ac.th', 'Komkrit', 'Prasert', 155, 1, '2024-01-21 13:40:00'),
(22, 'orawan.yada@kmitl.ac.th', 'Orawan', 'Yada', 165, 1, '2024-01-22 15:30:00'),
(23, 'kamon.kamonwan@kmitl.ac.th', 'Kamon', 'Kamonwan', 175, 0, '2024-01-23 11:10:00'),
(24, 'pongsak.kasem@kmitl.ac.th', 'Pongsak', 'Kasem', 185, 1, '2024-01-24 14:00:00'),
(25, 'weerawat.chai@kmitl.ac.th', 'Weerawat', 'Chai', 195, 1, '2024-01-25 08:45:00'),
(26, 'boonsong.thai@kmitl.ac.th', 'Boonsong', 'Thai', 205, 1, '2024-01-26 12:20:00'),
(27, 'yingyot.sila@kmitl.ac.th', 'Yingyot', 'Sila', 215, 1, '2024-01-27 09:35:00'),
(28, 'pimlapas.jinda@kmitl.ac.th', 'Pimlapas', 'Jinda', 225, 1, '2024-01-28 13:50:00'),
(29, 'anusorn.phuwadon@kmitl.ac.th', 'Anusorn', 'Phuwadon', 235, 0, '2024-01-29 16:15:00'),
(30, 'chanchai.suda@kmitl.ac.th', 'Chanchai', 'Suda', 245, 1, '2024-01-30 10:05:00'),
(31, 'somlak.nakprasert@kmitl.ac.th', 'Somlak', 'Nakprasert', 125, 1, '2024-02-01 10:20:00'),
(32, 'wanida.raksri@kmitl.ac.th', 'Wanida', 'Raksri', 150, 1, '2024-02-02 11:40:00'),
(33, 'chaimongkol.tanawat@kmitl.ac.th', 'Chaimongkol', 'Tanawat', 175, 1, '2024-02-03 12:50:00'),
(34, 'supatra.chai@kmitl.ac.th', 'Supatra', 'Chai', 200, 1, '2024-02-04 13:30:00'),
(35, 'kanchana.phuwadon@kmitl.ac.th', 'Kanchana', 'Phuwadon', 225, 1, '2024-02-05 14:20:00'),
(36, 'prasan.singh@kmitl.ac.th', 'Prasan', 'Singh', 250, 1, '2024-02-06 15:10:00'),
(37, 'bussaba.sawat@kmitl.ac.th', 'Bussaba', 'Sawat', 275, 1, '2024-02-07 16:00:00'),
(38, 'wattana.chu@kmitl.ac.th', 'Wattana', 'Chu', 300, 1, '2024-02-08 17:00:00'),
(39, 'thongchai.suksawat@kmitl.ac.th', 'Thongchai', 'Suksawat', 325, 1, '2024-02-09 18:00:00'),
(40, 'somdet.puwasit@kmitl.ac.th', 'Somdet', 'Puwasit', 350, 1, '2024-02-10 19:00:00'),
(41, 'ratchanee.phannoi@kmitl.ac.th', 'Ratchanee', 'Phannoi', 375, 1, '2024-02-11 20:00:00'),
(42, 'siriporn.singh@kmitl.ac.th', 'Siriporn', 'Singh', 400, 1, '2024-02-12 21:00:00'),
(43, 'pisan.sawat@kmitl.ac.th', 'Pisan', 'Sawat', 425, 1, '2024-02-13 22:00:00'),
(44, 'kanjana.nakprasert@kmitl.ac.th', 'Kanjana', 'Nakprasert', 450, 1, '2024-02-14 23:00:00'),
(45, 'kamol.chai@kmitl.ac.th', 'Kamol', 'Chai', 475, 1, '2024-02-15 09:00:00'),
(46, 'komol.tanawat@kmitl.ac.th', 'Komol', 'Tanawat', 500, 1, '2024-02-16 10:00:00'),
(47, 'kanya.phuwadon@kmitl.ac.th', 'Kanya', 'Phuwadon', 525, 1, '2024-02-17 11:00:00'),
(48, 'sirin.singh@kmitl.ac.th', 'Sirin', 'Singh', 550, 1, '2024-02-18 12:00:00'),
(49, 'napat.sawat@kmitl.ac.th', 'Napat', 'Sawat', 575, 1, '2024-02-19 13:00:00'),
(50, 'nirut.nakprasert@kmitl.ac.th', 'Nirut', 'Nakprasert', 600, 1, '2024-02-20 14:00:00'),
(51, 'phirun.chu@kmitl.ac.th', 'Phirun', 'Chu', 625, 1, '2024-02-21 15:00:00'),
(52, 'pricha.suksawat@kmitl.ac.th', 'Pricha', 'Suksawat', 650, 1, '2024-02-22 16:00:00'),
(53, 'vijit.puwasit@kmitl.ac.th', 'Vijit', 'Puwasit', 675, 1, '2024-02-23 17:00:00'),
(54, 'prateep.phannoi@kmitl.ac.th', 'Prateep', 'Phannoi', 700, 1, '2024-02-24 18:00:00'),
(55, 'nalinee.singh@kmitl.ac.th', 'Nalinee', 'Singh', 725, 1, '2024-02-25 19:00:00'),
(56, 'yongyuth.sawat@kmitl.ac.th', 'Yongyuth', 'Sawat', 750, 1, '2024-02-26 20:00:00'),
(57, 'somboon.nakprasert@kmitl.ac.th', 'Somboon', 'Nakprasert', 775, 1, '2024-02-27 21:00:00'),
(58, 'kamolphan.chai@kmitl.ac.th', 'Kamolphan', 'Chai', 800, 1, '2024-02-28 22:00:00'),
(59, 'vichai.tanawat@kmitl.ac.th', 'Vichai', 'Tanawat', 825, 1, '2024-02-29 23:00:00'),
(60, 'wichai.phuwadon@kmitl.ac.th', 'Wichai', 'Phuwadon', 850, 1, '2024-03-01 09:00:00'),
(61, 'viroj.singh@kmitl.ac.th', 'Viroj', 'Singh', 875, 1, '2024-03-02 10:00:00'),
(62, 'wiroj.sawat@kmitl.ac.th', 'Wiroj', 'Sawat', 900, 1, '2024-03-03 11:00:00'),
(63, 'kamon.nakprasert@kmitl.ac.th', 'Kamon', 'Nakprasert', 925, 1, '2024-03-04 12:00:00'),
(64, 'kamchai.chu@kmitl.ac.th', 'Kamchai', 'Chu', 950, 1, '2024-03-05 13:00:00'),
(65, 'kamchai.suksawat@kmitl.ac.th', 'Kamchai', 'Suksawat', 975, 1, '2024-03-06 14:00:00'),
(66, 'pracha.puwasit@kmitl.ac.th', 'Pracha', 'Puwasit', 1000, 1, '2024-03-07 15:00:00'),
(67, 'prinya.phannoi@kmitl.ac.th', 'Prinya', 'Phannoi', 1025, 1, '2024-03-08 16:00:00'),
(68, 'prom.singh@kmitl.ac.th', 'Prom', 'Singh', 1050, 1, '2024-03-09 17:00:00'),
(69, 'prasert.sawat@kmitl.ac.th', 'Prasert', 'Sawat', 1075, 1, '2024-03-10 18:00:00'),
(70, 'somyot.nakprasert@kmitl.ac.th', 'Somyot', 'Nakprasert', 1100, 1, '2024-03-11 19:00:00'),
(71, 'boonlert.chai@kmitl.ac.th', 'Boonlert', 'Chai', 1125, 1, '2024-03-12 20:00:00'),
(72, 'phongphan.tanawat@kmitl.ac.th', 'Phongphan', 'Tanawat', 1150, 1, '2024-03-13 21:00:00'),
(73, 'samrit.phuwadon@kmitl.ac.th', 'Samrit', 'Phuwadon', 1175, 1, '2024-03-14 22:00:00'),
(74, 'somsak.singh@kmitl.ac.th', 'Somsak', 'Singh', 1200, 1, '2024-03-15 23:00:00'),
(75, 'supot.sawat@kmitl.ac.th', 'Supot', 'Sawat', 1225, 1, '2024-03-16 09:00:00'),
(76, 'suphan.nakprasert@kmitl.ac.th', 'Suphan', 'Nakprasert', 1250, 1, '2024-03-17 10:00:00'),
(77, 'sompong.chu@kmitl.ac.th', 'Sompong', 'Chu', 1275, 1, '2024-03-18 11:00:00'),
(78, 'somphon.suksawat@kmitl.ac.th', 'Somphon', 'Suksawat', 1300, 1, '2024-03-19 12:00:00'),
(79, 'somprasong.puwasit@kmitl.ac.th', 'Somprasong', 'Puwasit', 1325, 1, '2024-03-20 13:00:00'),
(80, 'somprat.phannoi@kmitl.ac.th', 'Somprat', 'Phannoi', 1350, 1, '2024-03-21 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` varchar(10) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category`, `name`, `price`, `description`) VALUES
(1, 'Fiction', 'The Great Gatsby', '300', 'A classic novel by F. Scott Fitzgerald.'),
(2, 'Non-Fiction', 'Sapiens: A Brief History of Humankind', '450', 'A historical book by Yuval Noah Harari.'),
(3, 'Science', 'A Brief History of Time', '350', 'A popular-science book by Stephen Hawking.'),
(4, 'Fantasy', "Harry Potter and the Sorcerer\'s Stone", '400', 'The first book in the Harry Potter series by J.K. Rowling.'),
(5, 'Biography', 'The Diary of a Young Girl', '280', 'The autobiography of Anne Frank.'),
(6, 'Mystery', 'The Da Vinci Code', '320', 'A mystery thriller novel by Dan Brown.'),
(7, 'Fiction', 'To Kill a Mockingbird', '310', 'A novel by Harper Lee published in 1960.'),
(8, 'Non-Fiction', 'Educated', '380', 'A memoir by Tara Westover.'),
(9, 'Science', 'Cosmos', '360', 'A popular science book by Carl Sagan.'),
(10, 'Fantasy', 'The Hobbit', '420', 'A fantasy novel by J.R.R. Tolkien.'),
(11, 'Biography', 'Steve Jobs', '440', 'The biography of Steve Jobs by Walter Isaacson.'),
(12, 'Mystery', 'Gone Girl', '340', 'A thriller novel by Gillian Flynn.'),
(13, 'Fiction', '1984', '290', 'A novel by George Orwell.'),
(14, 'Non-Fiction', 'The Power of Habit', '370', 'A book by Charles Duhigg about habit formation.'),
(15, 'Science', 'The Selfish Gene', '330', 'A book on evolution by Richard Dawkins.'),
(16, 'Fantasy', 'A Game of Thrones', '500', 'The first book in A Song of Ice and Fire series by George R.R. Martin.'),
(17, 'Biography', 'Long Walk to Freedom', '410', 'The autobiography of Nelson Mandela.'),
(18, 'Mystery', 'Big Little Lies', '365', 'A novel by Liane Moriarty.'),
(19, 'Fiction', 'Pride and Prejudice', '315', 'A romantic novel by Jane Austen.'),
(20, 'Non-Fiction', 'Thinking, Fast and Slow', '395', 'A book by Daniel Kahneman about the two systems of thought.'),
(21, 'Science', 'The Gene: An Intimate History', '425', 'A book by Siddhartha Mukherjee on the history of genetics.'),
(22, 'Fantasy', 'The Name of the Wind', '455', 'A fantasy novel by Patrick Rothfuss.'),
(23, 'Biography', 'Becoming', '355', 'A memoir by Michelle Obama.'),
(24, 'Mystery', 'The Girl with the Dragon Tattoo', '385', 'A novel by Stieg Larsson.'),
(25, 'Fiction', 'The Catcher in the Rye', '295', 'A novel by J.D. Salinger.'),
(26, 'Pen', 'SANTOS DE CARTIER BALLPOINT PEN', '34100', 'Santos de Cartier ballpoint pen, large model, cap in striated metal covered with blue PVD with brushed metal body, palladium-finish screw and details.'),
(27, 'Pen', 'SANTOS-DUMONT BALLPOINT PEN', '15500', 'Santos-Dumont ballpoint pen, black composite body and cap, palladium 950/1000 finish details, blue resin cabochon.'),
(28, 'Pen', 'Pilot Acroball 05', '55', 'Quick dry and water resistant.'),
(29, 'Pen', 'Pilot Acroball 07', '55', 'Quick dry and water resistant.'),
(30, 'Pen', 'Pilot Acroball 3 COLORS 07', '161', 'Lift-clip,which is able to clip tight and has high durability'),
(31, 'Pen', 'Pilot DR. GRIP PUREWHITE 07', '309', 'Wide comfort grip helps alleviate writing fatigue'),
(32, 'Pen', 'Pilot DR.GRIP 4+1 WOOD', '866', 'Metal design accented with luxurious wooden grip.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD UNIQUE KEY `contact` (`contact`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`invoice_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`branch_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `details_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`),
  ADD CONSTRAINT `details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
