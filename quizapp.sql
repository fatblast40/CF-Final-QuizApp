-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 09, 2017 at 12:05 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `FK_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `FK_users`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `FK_question` int(11) NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `answer`, `FK_question`, `correct`) VALUES
(1, 'Vienna', 1, 1),
(2, 'New York Jets', 2, 1),
(3, 'Emmanuel Macron', 3, 1),
(4, 'cat', 4, 1),
(5, '196', 5, 1),
(6, 'Wienerschnitzel', 6, 1),
(7, 'Arnold Schwarzenegger', 7, 1),
(8, 'Bratislava', 1, 0),
(9, 'Budapest', 1, 0),
(10, 'Berlin', 1, 0),
(11, 'Salzburg', 1, 0),
(12, 'Innsbruck', 1, 0),
(13, 'Venice', 1, 0),
(14, 'Warsaw', 1, 0),
(15, 'Vientiane', 1, 0),
(16, 'Sydney', 1, 0),
(17, 'Canberra', 1, 0),
(18, 'New York Giants', 2, 0),
(19, 'Los Angeles Rams', 2, 0),
(20, 'Las Vegas Raiders', 2, 0),
(21, 'Miami Dolphins', 2, 0),
(22, 'Dallas Cowboys', 2, 0),
(23, 'San Francisco 49ers', 2, 0),
(24, 'Napoleon Bonaparte', 3, 0),
(25, 'Marine Le Pen', 3, 0),
(26, 'Charles De Gaulle', 3, 0),
(27, 'Donald Trump', 3, 0),
(28, 'Tony Blair', 3, 0),
(29, 'Angela Merkel', 3, 0),
(30, 'Jean Reno', 3, 0),
(31, 'dog', 4, 0),
(32, 'monkey', 4, 0),
(33, 'cow', 4, 0),
(34, 'sloth', 4, 0),
(35, 'fish', 4, 0),
(36, 'snake', 4, 0),
(37, 'rabbit', 4, 0),
(38, '197', 5, 0),
(39, '200', 5, 0),
(40, '199', 5, 0),
(41, '297', 5, 0),
(42, '100', 5, 0),
(43, '179', 5, 0),
(44, '169', 5, 0),
(45, 'Hamburger', 6, 0),
(46, 'Milka', 6, 0),
(47, 'Billa', 6, 0),
(48, 'frankfurter', 6, 0),
(49, 'croissant', 6, 0),
(50, 'eggs', 6, 0),
(51, 'bratwurst', 6, 0),
(52, 'David Hasselhoff', 7, 0),
(53, 'Lisa Duschek', 7, 0),
(54, 'Crocodile Hunter', 7, 0),
(55, 'Franz Joseph', 7, 0),
(56, 'Amadeus Mozart', 7, 0),
(57, 'Ludwig Von Beethoven', 7, 0),
(58, 'Christiano Ronaldo', 7, 0),
(59, 'Donald Trump', 7, 0),
(60, 'Angela Merkel', 7, 0),
(61, 'Austin Oosterland', 7, 0),
(62, 'Iceland', 8, 1),
(63, 'Italy', 8, 0),
(64, 'Germany', 8, 0),
(65, 'Austria', 8, 0),
(66, 'Switzerland', 8, 0),
(67, 'South Africa', 8, 0),
(68, 'Northern Ireland', 8, 0),
(69, 'Denmark', 8, 0),
(70, 'USA', 8, 0),
(71, 'Argentina', 8, 0),
(72, 'Australia', 8, 0),
(73, 'Saudi Arabia', 8, 0),
(74, 'India', 8, 0),
(75, 'Mexico', 8, 0),
(76, 'Thailand', 8, 0),
(77, 'North Korea', 8, 0),
(78, 'Sri Lanka', 8, 0),
(79, 'USA', 9, 1),
(80, 'Kazakhstan', 9, 1),
(81, 'Spain', 9, 0),
(82, 'Germany', 9, 0),
(83, 'Andorra', 9, 0),
(84, 'Switzerland', 9, 0),
(85, 'Belgium', 9, 0),
(86, 'Luxembourg', 9, 0),
(87, 'Monaco', 9, 0),
(88, 'Portugal', 9, 1),
(89, 'Mexico', 9, 0),
(90, 'Iceland', 9, 0),
(91, '4', 10, 1),
(92, '5', 10, 0),
(93, '3', 10, 0),
(94, '2', 10, 0),
(95, '6', 10, 0),
(96, '7', 10, 0),
(97, '8', 10, 0),
(98, 'Africa', 11, 1),
(99, 'Europe', 11, 0),
(100, 'Asia', 11, 0),
(101, 'Middle East', 11, 0),
(102, 'Mediterranean', 11, 0),
(103, 'South America', 11, 0),
(104, 'Brazil', 12, 1),
(105, 'Belize', 12, 1),
(106, 'Bolivia', 12, 0),
(107, 'Argentina', 12, 0),
(108, 'Ecuador', 12, 0),
(109, 'Peru', 12, 0),
(110, 'Uruguay', 12, 0),
(111, 'Paraguay', 12, 0),
(112, 'Colombia', 12, 0),
(113, 'Venezuela', 12, 0),
(114, 'Chile', 12, 0),
(115, 'Mexico', 12, 0),
(116, 'Spain', 12, 0),
(117, 'Panama', 12, 0),
(118, 'Costa Rica', 12, 0),
(119, 'Nicaragua', 12, 0),
(120, 'Cuba', 12, 0),
(121, 'Guatemala', 12, 0),
(122, 'Berlin', 13, 1),
(123, 'Hamburg', 13, 0),
(124, 'Dusseldorf', 13, 0),
(125, 'Frankfurt', 13, 0),
(126, 'Munich', 13, 0),
(127, 'Cologne', 13, 0),
(128, 'Nuremburg', 13, 0),
(129, 'Stuttgart', 13, 0),
(130, 'Bonn', 13, 0),
(131, 'Ankara', 14, 1),
(132, 'Istanbul', 14, 0),
(133, 'Antalya', 14, 0),
(134, 'Izmir', 14, 0),
(135, 'Konya', 14, 0),
(136, 'Bursa', 14, 0),
(137, 'Cappadocia', 14, 0),
(138, 'Edirne', 14, 0),
(139, 'Athens', 14, 0),
(140, 'Cairo', 14, 0),
(141, 'Sofia', 14, 0),
(142, 'Tbilisi', 14, 0),
(143, 'Yerevan', 14, 0),
(144, 'Damascus', 14, 0),
(145, 'Ashgabat', 14, 0),
(146, 'Tehran', 14, 0),
(147, 'Brussels', 15, 1),
(148, 'Berlin', 15, 0),
(149, 'Strasbourg', 15, 0),
(150, 'Paris', 15, 0),
(151, 'Washington D.C.', 15, 0),
(152, 'Reykjavik', 15, 0),
(153, 'Copenhagen', 15, 0),
(154, 'Luxembourg', 15, 0),
(155, 'Amsterdam', 15, 0),
(156, 'Vienna', 15, 0),
(157, 'Warsaw', 15, 0),
(158, 'Versailles', 15, 0),
(159, 'Prague', 15, 0),
(160, 'Geneva', 15, 0),
(161, 'Vaduz', 15, 0),
(162, 'Canada', 16, 1),
(163, 'Mexico', 16, 1),
(164, 'Cuba', 16, 0),
(165, 'Greenland', 16, 0),
(166, 'Russia', 16, 0),
(167, 'Bermuda', 16, 0),
(168, 'Guatemala', 16, 0),
(169, 'Panama', 16, 0),
(170, 'South Korea', 16, 0),
(171, 'Australia', 16, 0),
(172, 'Antarctica', 16, 0),
(173, 'Austria', 16, 0),
(174, 'France', 16, 0),
(175, 'Germany', 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `avatars`
--

CREATE TABLE `avatars` (
  `id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `avatars`
--

INSERT INTO `avatars` (`id`, `location`) VALUES
(1, 'pictures/avatar1.jpg'),
(2, 'pictures/avatar2.jpg'),
(3, 'pictures/avatar3.jpg'),
(4, 'pictures/avatar4.jpg'),
(5, 'pictures/avatar5.jpg'),
(6, 'pictures/avatar6.jpg'),
(7, 'pictures/avatar7.jpg'),
(8, 'pictures/avatar8.jpg'),
(9, 'pictures/avatar9.jpg'),
(10, 'pictures/avatar10.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `amount_questions` int(11) NOT NULL DEFAULT '8'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `image`, `amount_questions`) VALUES
(0, 'Mixed', 'mixed_category.png', 8),
(1, 'Geography', 'cat1.png', 8),
(2, 'Sports', 'cat2.png', 8),
(3, 'Politics', 'cat3.png', 8),
(4, 'Entertainment', 'cat4.png', 8),
(5, 'Travel', 'cat5.png', 8),
(6, 'Food', 'cat6.png', 8),
(7, 'Animals', 'cat7.png', 8),
(8, 'Web Development', 'cat8.png', 8);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(200) NOT NULL,
  `FK_categories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `FK_categories`) VALUES
(1, 'What is the capital of Austria?', 1),
(2, 'Which American Football team has a primary color of green?', 2),
(3, 'Who is the new President of France?', 3),
(4, 'What is the funniest animal on Youtube?', 7),
(5, 'How many countries are there in the world?', 5),
(6, 'What is the signature dish from Austria?', 6),
(7, 'Who is the most famous celebrity from Austria?', 4),
(8, 'Which country is furthest north?', 1),
(9, 'Which country does not share a border with France?', 1),
(10, 'How many countries border Thailand?', 1),
(11, 'Which continent is Egypt located in?', 1),
(12, 'Which country does not speak Spanish as a primary language?', 1),
(13, 'What is the capital city of Germany?', 1),
(14, 'What is the capital city of Turkey?', 1),
(15, 'What is the capital of the European Union?', 1),
(16, 'Which countries border the USA?', 1),
(17, '', 1),
(18, '', 1),
(19, '', 1),
(20, '', 1),
(21, '', 1),
(22, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL,
  `FK_users` int(11) NOT NULL,
  `FK_categories` int(11) NOT NULL,
  `scores` decimal(3,2) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `FK_users`, `FK_categories`, `scores`, `time_stamp`) VALUES
(1, 1, 0, '0.90', '2017-05-09 09:35:27'),
(2, 1, 0, '1.00', '2017-05-09 09:35:27'),
(3, 1, 4, '0.88', '2017-05-09 09:35:27'),
(4, 1, 4, '0.80', '2017-05-09 09:35:27'),
(5, 1, 4, '0.80', '2017-05-09 09:35:27'),
(6, 1, 2, '0.73', '2017-05-09 09:35:27'),
(7, 1, 7, '0.91', '2017-05-09 09:35:27'),
(8, 1, 1, '0.52', '2017-05-09 09:35:27'),
(9, 1, 5, '0.43', '2017-05-09 09:35:27'),
(10, 1, 3, '0.39', '2017-05-09 09:35:27'),
(11, 1, 0, '0.08', '2017-05-09 09:35:27'),
(12, 1, 8, '0.10', '2017-05-09 09:35:27'),
(13, 1, 6, '0.65', '2017-05-09 09:35:27'),
(14, 1, 4, '0.25', '2017-05-09 09:35:27'),
(15, 1, 1, '1.00', '2017-05-09 09:35:27'),
(16, 1, 7, '0.84', '2017-05-09 09:35:27'),
(17, 1, 3, '0.72', '2017-05-09 09:35:27'),
(18, 1, 2, '0.62', '2017-05-09 09:35:27'),
(19, 1, 5, '0.51', '2017-05-09 09:35:27'),
(20, 1, 8, '0.44', '2017-05-09 09:35:27'),
(21, 1, 6, '0.37', '2017-05-09 09:35:27'),
(22, 1, 2, '0.22', '2017-05-09 09:35:27'),
(23, 1, 4, '0.10', '2017-05-09 09:35:27'),
(24, 1, 0, '0.05', '2017-05-09 09:35:27'),
(25, 1, 8, '0.96', '2017-05-09 09:35:27'),
(26, 1, 4, '0.82', '2017-05-09 09:35:27'),
(27, 1, 2, '0.70', '2017-05-09 09:35:27'),
(28, 1, 7, '0.98', '2017-05-09 09:35:27'),
(29, 1, 1, '0.50', '2017-05-09 09:35:27'),
(30, 1, 5, '0.43', '2017-05-09 09:35:27'),
(31, 1, 3, '0.31', '2017-05-09 09:35:27'),
(32, 1, 0, '0.02', '2017-05-09 09:35:27'),
(33, 1, 8, '0.19', '2017-05-09 09:35:27'),
(34, 1, 6, '0.68', '2017-05-09 09:35:27'),
(35, 1, 4, '0.20', '2017-05-09 09:35:27'),
(36, 1, 1, '1.70', '2017-05-09 09:35:27'),
(37, 1, 7, '0.80', '2017-05-09 09:35:27'),
(38, 1, 3, '0.76', '2017-05-09 09:35:27'),
(39, 1, 2, '0.65', '2017-05-09 09:35:27'),
(40, 1, 5, '0.50', '2017-05-09 09:35:27'),
(41, 1, 8, '0.40', '2017-05-09 09:35:27'),
(42, 1, 6, '0.34', '2017-05-09 09:35:27'),
(43, 1, 2, '0.20', '2017-05-09 09:35:27'),
(44, 1, 4, '0.10', '2017-05-09 09:35:27'),
(45, 1, 0, '0.03', '2017-05-09 09:35:27'),
(46, 1, 8, '0.90', '2017-05-09 09:35:27'),
(47, 1, 4, '0.80', '2017-05-09 09:35:27'),
(48, 1, 2, '0.76', '2017-05-09 09:35:27'),
(49, 1, 7, '0.90', '2017-05-09 09:35:27'),
(50, 1, 1, '0.50', '2017-05-09 09:35:27'),
(51, 1, 5, '0.48', '2017-05-09 09:35:27'),
(52, 1, 3, '0.32', '2017-05-09 09:35:27'),
(53, 1, 0, '0.00', '2017-05-09 09:35:27'),
(54, 1, 8, '0.10', '2017-05-09 09:35:27'),
(55, 1, 6, '0.63', '2017-05-09 09:35:27'),
(56, 1, 4, '0.20', '2017-05-09 09:35:27'),
(57, 1, 1, '1.00', '2017-05-09 09:35:27'),
(58, 1, 7, '0.81', '2017-05-09 09:35:27'),
(59, 1, 3, '0.70', '2017-05-09 09:35:27'),
(60, 1, 2, '0.60', '2017-05-09 09:35:27'),
(61, 1, 5, '0.51', '2017-05-09 09:35:27'),
(62, 1, 8, '0.42', '2017-05-09 09:35:27'),
(63, 1, 6, '0.33', '2017-05-09 09:35:27'),
(64, 1, 2, '0.24', '2017-05-09 09:35:27'),
(65, 1, 4, '0.16', '2017-05-09 09:35:27'),
(66, 1, 0, '0.05', '2017-05-09 09:35:27'),
(67, 1, 8, '0.97', '2017-05-09 09:35:27'),
(68, 1, 4, '0.86', '2017-05-09 09:35:27'),
(69, 1, 2, '0.78', '2017-05-09 09:35:27'),
(70, 1, 7, '0.99', '2017-05-09 09:35:27'),
(71, 1, 1, '0.51', '2017-05-09 09:35:27'),
(72, 1, 5, '0.42', '2017-05-09 09:35:27'),
(73, 1, 3, '0.30', '2017-05-09 09:35:27'),
(74, 1, 0, '0.03', '2017-05-09 09:35:27'),
(75, 1, 8, '0.10', '2017-05-09 09:35:27'),
(76, 1, 6, '0.65', '2017-05-09 09:35:27'),
(77, 1, 4, '0.26', '2017-05-09 09:35:27'),
(78, 1, 1, '1.00', '2017-05-09 09:35:27'),
(79, 1, 7, '0.86', '2017-05-09 09:35:27'),
(80, 1, 3, '0.77', '2017-05-09 09:35:27'),
(81, 1, 2, '0.68', '2017-05-09 09:35:27'),
(82, 1, 5, '0.59', '2017-05-09 09:35:27'),
(83, 1, 8, '0.40', '2017-05-09 09:35:27'),
(84, 1, 6, '0.31', '2017-05-09 09:35:27'),
(85, 1, 2, '0.22', '2017-05-09 09:35:27'),
(86, 1, 4, '0.13', '2017-05-09 09:35:27'),
(87, 1, 0, '0.04', '2017-05-09 09:35:27'),
(88, 1, 8, '0.95', '2017-05-09 09:35:27'),
(89, 1, 4, '0.86', '2017-05-09 09:35:27'),
(90, 1, 2, '0.77', '2017-05-09 09:35:27'),
(91, 1, 7, '0.98', '2017-05-09 09:35:27'),
(92, 1, 1, '0.59', '2017-05-09 09:35:27'),
(93, 1, 5, '0.40', '2017-05-09 09:35:27'),
(94, 1, 3, '0.31', '2017-05-09 09:35:27'),
(95, 1, 0, '0.02', '2017-05-09 09:35:27'),
(96, 1, 8, '0.13', '2017-05-09 09:35:27'),
(97, 1, 6, '0.68', '2017-05-09 09:35:27'),
(98, 1, 4, '0.23', '2017-05-09 09:35:27'),
(99, 1, 1, '1.00', '2017-05-09 09:35:27'),
(100, 1, 7, '0.82', '2017-05-09 09:35:27'),
(101, 1, 3, '0.71', '2017-05-09 09:35:27'),
(102, 1, 2, '0.64', '2017-05-09 09:35:27'),
(103, 1, 5, '0.55', '2017-05-09 09:35:27'),
(104, 1, 8, '0.42', '2017-05-09 09:35:27'),
(105, 1, 6, '0.37', '2017-05-09 09:35:27'),
(106, 1, 2, '0.28', '2017-05-09 09:35:27'),
(107, 1, 4, '0.15', '2017-05-09 09:35:27'),
(108, 1, 0, '0.03', '2017-05-09 09:35:27'),
(109, 1, 8, '0.92', '2017-05-09 09:35:27');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL,
  `FK_quizzes` int(11) NOT NULL,
  `FK_questions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `FK_avatars` int(11) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `FK_avatars`, `nickname`, `email`, `password`) VALUES
(1, 1, 'Admin', 'admin@CodeBus.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(2, 1, 'Goran', 'goran.steviccc@codebus.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(3, 1, 'Igor', 'igor.stevic@codebus.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(4, 2, 'Lisa', 'lisa.duschek@codebus.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(5, 2, 'Nathalie', 'nathalie.stiefsohn@codemasters.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(6, 1, 'Nicky', 'nicky.pallas@codemasters.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(7, 1, 'Test', 'test@test.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(8, 1, 'Christoph', 'chris@test.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(9, 2, 'Ema', 'ema@test.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`FK_users`),
  ADD KEY `id` (`id`,`FK_users`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answer` (`answer`),
  ADD KEY `FK_question` (`FK_question`),
  ADD KEY `correct` (`correct`);

--
-- Indexes for table `avatars`
--
ALTER TABLE `avatars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `FK_categories` (`FK_categories`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `users` (`FK_users`),
  ADD KEY `FK_categories` (`FK_categories`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`FK_quizzes`,`FK_questions`),
  ADD KEY `FK_questions` (`FK_questions`),
  ADD KEY `FK_quizzes` (`FK_quizzes`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_avatars` (`FK_avatars`),
  ADD KEY `id` (`id`,`FK_avatars`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;
--
-- AUTO_INCREMENT for table `avatars`
--
ALTER TABLE `avatars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`FK_users`) REFERENCES `users` (`id`);

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`FK_question`) REFERENCES `questions` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`FK_categories`) REFERENCES `categories` (`id`);

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`FK_users`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_2` FOREIGN KEY (`FK_categories`) REFERENCES `categories` (`id`);

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `quiz_questions_ibfk_1` FOREIGN KEY (`FK_questions`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `quiz_questions_ibfk_2` FOREIGN KEY (`FK_quizzes`) REFERENCES `quizzes` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`FK_avatars`) REFERENCES `avatars` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
