-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 09, 2017 at 02:05 PM
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
(175, 'Germany', 16, 0),
(178, 'test correct', 38, 1),
(179, 'test correct', 39, 1),
(180, 'test correct', 40, 1),
(181, 'test correct', 41, 1),
(182, 'test correct', 42, 1),
(183, 'test correct', 43, 1),
(184, 'test correct', 44, 1),
(185, 'test correct', 45, 1),
(186, 'test correct', 46, 1),
(187, 'test correct', 47, 1),
(188, 'test correct', 48, 1),
(189, 'test correct', 49, 1),
(190, 'test correct', 41, 1),
(191, 'test correct', 50, 1),
(192, 'test correct', 51, 1),
(193, 'test correct', 52, 1),
(194, 'test correct', 53, 1),
(195, 'test correct', 54, 1),
(196, 'test correct', 55, 1),
(197, 'test correct', 56, 1),
(198, 'test correct', 57, 1),
(199, 'test correct', 58, 1),
(200, 'test correct', 59, 1),
(201, 'test correct', 60, 1),
(202, 'test correct', 61, 1),
(203, 'test correct', 62, 1),
(204, 'test correct', 63, 1),
(205, 'test correct', 64, 1),
(206, 'test correct', 65, 1),
(207, 'test correct', 66, 1),
(208, 'test correct', 67, 1),
(209, 'test correct', 68, 1),
(210, 'test correct', 69, 1),
(211, 'test correct', 70, 1),
(212, 'test correct', 71, 1),
(213, 'test correct', 72, 1),
(214, 'test correct', 73, 1),
(215, 'test correct', 74, 1),
(216, 'test correct', 75, 1),
(217, 'test correct', 76, 1),
(218, 'test correct', 77, 1),
(219, 'test correct', 78, 1),
(220, 'test correct', 79, 1),
(221, 'test correct', 80, 1),
(222, 'test correct', 81, 1),
(223, 'test correct', 82, 1),
(224, 'test correct', 83, 1),
(225, 'test correct', 84, 1),
(226, 'test correct', 85, 1),
(227, 'test correct', 86, 1),
(228, 'test correct', 87, 1),
(229, 'test correct', 88, 1),
(230, 'test correct', 89, 1),
(231, 'test correct', 90, 1),
(232, 'test correct', 91, 1),
(233, 'test correct', 92, 1),
(234, 'test correct', 93, 1),
(235, 'test correct', 94, 1),
(236, 'test correct', 95, 1),
(237, 'test correct', 96, 1),
(238, 'test correct', 97, 1),
(239, 'test correct', 98, 1),
(240, 'test correct', 99, 1),
(241, 'test correct', 100, 1),
(242, 'test correct', 101, 1),
(243, 'test correct', 102, 1),
(244, 'test correct', 103, 1),
(245, 'test correct', 104, 1),
(246, 'test correct', 105, 1),
(247, 'test correct', 106, 1),
(248, 'test correct', 107, 1),
(249, 'wrong1', 38, 0),
(250, 'wrong1', 39, 0),
(251, 'wrong1', 40, 0),
(252, 'wrong1', 41, 0),
(253, 'wrong1', 42, 0),
(254, 'wrong1', 43, 0),
(255, 'wrong1', 44, 0),
(256, 'wrong1', 45, 0),
(257, 'wrong1', 46, 0),
(258, 'wrong1', 47, 0),
(259, 'wrong1', 48, 0),
(260, 'wrong1', 49, 0),
(261, 'wrong1', 41, 0),
(262, 'wrong1', 50, 0),
(263, 'wrong1', 51, 0),
(264, 'wrong1', 52, 0),
(265, 'wrong1', 53, 0),
(266, 'wrong1', 54, 0),
(267, 'wrong1', 55, 0),
(268, 'wrong1', 56, 0),
(269, 'wrong1', 57, 0),
(270, 'wrong1', 58, 0),
(271, 'wrong1', 59, 0),
(272, 'wrong1', 60, 0),
(273, 'wrong1', 61, 0),
(274, 'wrong1', 62, 0),
(275, 'wrong1', 63, 0),
(276, 'wrong1', 64, 0),
(277, 'wrong1', 65, 0),
(278, 'wrong1', 66, 0),
(279, 'wrong1', 67, 0),
(280, 'wrong1', 68, 0),
(281, 'wrong1', 69, 0),
(282, 'wrong1', 70, 0),
(283, 'wrong1', 71, 0),
(284, 'wrong1', 72, 0),
(285, 'wrong1', 73, 0),
(286, 'wrong1', 74, 0),
(287, 'wrong1', 75, 0),
(288, 'wrong1', 76, 0),
(289, 'wrong1', 77, 0),
(290, 'wrong1', 78, 0),
(291, 'wrong1', 79, 0),
(292, 'wrong1', 80, 0),
(293, 'wrong1', 81, 0),
(294, 'wrong1', 82, 0),
(295, 'wrong1', 83, 0),
(296, 'wrong1', 84, 0),
(297, 'wrong1', 85, 0),
(298, 'wrong1', 86, 0),
(299, 'wrong1', 87, 0),
(300, 'wrong1', 88, 0),
(301, 'wrong1', 89, 0),
(302, 'wrong1', 90, 0),
(303, 'wrong1', 91, 0),
(304, 'wrong1', 92, 0),
(305, 'wrong1', 93, 0),
(306, 'wrong1', 94, 0),
(307, 'wrong1', 95, 0),
(308, 'wrong1', 96, 0),
(309, 'wrong1', 97, 0),
(310, 'wrong1', 98, 0),
(311, 'wrong1', 99, 0),
(312, 'wrong1', 100, 0),
(313, 'wrong1', 101, 0),
(314, 'wrong1', 102, 0),
(315, 'wrong1', 103, 0),
(316, 'wrong1', 104, 0),
(317, 'wrong1', 105, 0),
(318, 'wrong1', 106, 0),
(319, 'wrong1', 107, 0),
(320, 'wrong2', 38, 0),
(321, 'wrong2', 39, 0),
(322, 'wrong2', 40, 0),
(323, 'wrong2', 41, 0),
(324, 'wrong2', 42, 0),
(325, 'wrong2', 43, 0),
(326, 'wrong2', 44, 0),
(327, 'wrong2', 45, 0),
(328, 'wrong2', 46, 0),
(329, 'wrong2', 47, 0),
(330, 'wrong2', 48, 0),
(331, 'wrong2', 49, 0),
(332, 'wrong2', 41, 0),
(333, 'wrong2', 50, 0),
(334, 'wrong2', 51, 0),
(335, 'wrong2', 52, 0),
(336, 'wrong2', 53, 0),
(337, 'wrong2', 54, 0),
(338, 'wrong2', 55, 0),
(339, 'wrong2', 56, 0),
(340, 'wrong2', 57, 0),
(341, 'wrong2', 58, 0),
(342, 'wrong2', 59, 0),
(343, 'wrong2', 60, 0),
(344, 'wrong2', 61, 0),
(345, 'wrong2', 62, 0),
(346, 'wrong2', 63, 0),
(347, 'wrong2', 64, 0),
(348, 'wrong2', 65, 0),
(349, 'wrong2', 66, 0),
(350, 'wrong2', 67, 0),
(351, 'wrong2', 68, 0),
(352, 'wrong2', 69, 0),
(353, 'wrong2', 70, 0),
(354, 'wrong2', 71, 0),
(355, 'wrong2', 72, 0),
(356, 'wrong2', 73, 0),
(357, 'wrong2', 74, 0),
(358, 'wrong2', 75, 0),
(359, 'wrong2', 76, 0),
(360, 'wrong2', 77, 0),
(361, 'wrong2', 78, 0),
(362, 'wrong2', 79, 0),
(363, 'wrong2', 80, 0),
(364, 'wrong2', 81, 0),
(365, 'wrong2', 82, 0),
(366, 'wrong2', 83, 0),
(367, 'wrong2', 84, 0),
(368, 'wrong2', 85, 0),
(369, 'wrong2', 86, 0),
(370, 'wrong2', 87, 0),
(371, 'wrong2', 88, 0),
(372, 'wrong2', 89, 0),
(373, 'wrong2', 90, 0),
(374, 'wrong2', 91, 0),
(375, 'wrong2', 92, 0),
(376, 'wrong2', 93, 0),
(377, 'wrong2', 94, 0),
(378, 'wrong2', 95, 0),
(379, 'wrong2', 96, 0),
(380, 'wrong2', 97, 0),
(381, 'wrong2', 98, 0),
(382, 'wrong2', 99, 0),
(383, 'wrong2', 100, 0),
(384, 'wrong2', 101, 0),
(385, 'wrong2', 102, 0),
(386, 'wrong2', 103, 0),
(387, 'wrong2', 104, 0),
(388, 'wrong2', 105, 0),
(389, 'wrong2', 106, 0),
(390, 'wrong2', 107, 0),
(391, 'wrong3', 38, 0),
(392, 'wrong3', 39, 0),
(393, 'wrong3', 40, 0),
(394, 'wrong3', 41, 0),
(395, 'wrong3', 42, 0),
(396, 'wrong3', 43, 0),
(397, 'wrong3', 44, 0),
(398, 'wrong3', 45, 0),
(399, 'wrong3', 46, 0),
(400, 'wrong3', 47, 0),
(401, 'wrong3', 48, 0),
(402, 'wrong3', 49, 0),
(403, 'wrong3', 41, 0),
(404, 'wrong3', 50, 0),
(405, 'wrong3', 51, 0),
(406, 'wrong3', 52, 0),
(407, 'wrong3', 53, 0),
(408, 'wrong3', 54, 0),
(409, 'wrong3', 55, 0),
(410, 'wrong3', 56, 0),
(411, 'wrong3', 57, 0),
(412, 'wrong3', 58, 0),
(413, 'wrong3', 59, 0),
(414, 'wrong3', 60, 0),
(415, 'wrong3', 61, 0),
(416, 'wrong3', 62, 0),
(417, 'wrong3', 63, 0),
(418, 'wrong3', 64, 0),
(419, 'wrong3', 65, 0),
(420, 'wrong3', 66, 0),
(421, 'wrong3', 67, 0),
(422, 'wrong3', 68, 0),
(423, 'wrong3', 69, 0),
(424, 'wrong3', 70, 0),
(425, 'wrong3', 71, 0),
(426, 'wrong3', 72, 0),
(427, 'wrong3', 73, 0),
(428, 'wrong3', 74, 0),
(429, 'wrong3', 75, 0),
(430, 'wrong3', 76, 0),
(431, 'wrong3', 77, 0),
(432, 'wrong3', 78, 0),
(433, 'wrong3', 79, 0),
(434, 'wrong3', 80, 0),
(435, 'wrong3', 81, 0),
(436, 'wrong3', 82, 0),
(437, 'wrong3', 83, 0),
(438, 'wrong3', 84, 0),
(439, 'wrong3', 85, 0),
(440, 'wrong3', 86, 0),
(441, 'wrong3', 87, 0),
(442, 'wrong3', 88, 0),
(443, 'wrong3', 89, 0),
(444, 'wrong3', 90, 0),
(445, 'wrong3', 91, 0),
(446, 'wrong3', 92, 0),
(447, 'wrong3', 93, 0),
(448, 'wrong3', 94, 0),
(449, 'wrong3', 95, 0),
(450, 'wrong3', 96, 0),
(451, 'wrong3', 97, 0),
(452, 'wrong3', 98, 0),
(453, 'wrong3', 99, 0),
(454, 'wrong3', 100, 0),
(455, 'wrong3', 101, 0),
(456, 'wrong3', 102, 0),
(457, 'wrong3', 103, 0),
(458, 'wrong3', 104, 0),
(459, 'wrong3', 105, 0),
(460, 'wrong3', 106, 0),
(461, 'wrong3', 107, 0),
(462, 'wrong4', 38, 0),
(463, 'wrong4', 39, 0),
(464, 'wrong4', 40, 0),
(465, 'wrong4', 41, 0),
(466, 'wrong4', 42, 0),
(467, 'wrong4', 43, 0),
(468, 'wrong4', 44, 0),
(469, 'wrong4', 45, 0),
(470, 'wrong4', 46, 0),
(471, 'wrong4', 47, 0),
(472, 'wrong4', 48, 0),
(473, 'wrong4', 49, 0),
(474, 'wrong4', 41, 0),
(475, 'wrong4', 50, 0),
(476, 'wrong4', 51, 0),
(477, 'wrong4', 52, 0),
(478, 'wrong4', 53, 0),
(479, 'wrong4', 54, 0),
(480, 'wrong4', 55, 0),
(481, 'wrong4', 56, 0),
(482, 'wrong4', 57, 0),
(483, 'wrong4', 58, 0),
(484, 'wrong4', 59, 0),
(485, 'wrong4', 60, 0),
(486, 'wrong4', 61, 0),
(487, 'wrong4', 62, 0),
(488, 'wrong4', 63, 0),
(489, 'wrong4', 64, 0),
(490, 'wrong4', 65, 0),
(491, 'wrong4', 66, 0),
(492, 'wrong4', 67, 0),
(493, 'wrong4', 68, 0),
(494, 'wrong4', 69, 0),
(495, 'wrong4', 70, 0),
(496, 'wrong4', 71, 0),
(497, 'wrong4', 72, 0),
(498, 'wrong4', 73, 0),
(499, 'wrong4', 74, 0),
(500, 'wrong4', 75, 0),
(501, 'wrong4', 76, 0),
(502, 'wrong4', 77, 0),
(503, 'wrong4', 78, 0),
(504, 'wrong4', 79, 0),
(505, 'wrong4', 80, 0),
(506, 'wrong4', 81, 0),
(507, 'wrong4', 82, 0),
(508, 'wrong4', 83, 0),
(509, 'wrong4', 84, 0),
(510, 'wrong4', 85, 0),
(511, 'wrong4', 86, 0),
(512, 'wrong4', 87, 0),
(513, 'wrong4', 88, 0),
(514, 'wrong4', 89, 0),
(515, 'wrong4', 90, 0),
(516, 'wrong4', 91, 0),
(517, 'wrong4', 92, 0),
(518, 'wrong4', 93, 0),
(519, 'wrong4', 94, 0),
(520, 'wrong4', 95, 0),
(521, 'wrong4', 96, 0),
(522, 'wrong4', 97, 0),
(523, 'wrong4', 98, 0),
(524, 'wrong4', 99, 0),
(525, 'wrong4', 100, 0),
(526, 'wrong4', 101, 0),
(527, 'wrong4', 102, 0),
(528, 'wrong4', 103, 0),
(529, 'wrong4', 104, 0),
(530, 'wrong4', 105, 0),
(531, 'wrong4', 106, 0),
(532, 'wrong4', 107, 0),
(533, 'wrong5', 38, 0),
(534, 'wrong5', 39, 0),
(535, 'wrong5', 40, 0),
(536, 'wrong5', 41, 0),
(537, 'wrong5', 42, 0),
(538, 'wrong5', 43, 0),
(539, 'wrong5', 44, 0),
(540, 'wrong5', 45, 0),
(541, 'wrong5', 46, 0),
(542, 'wrong5', 47, 0),
(543, 'wrong5', 48, 0),
(544, 'wrong5', 49, 0),
(545, 'wrong5', 41, 0),
(546, 'wrong5', 50, 0),
(547, 'wrong5', 51, 0),
(548, 'wrong5', 52, 0),
(549, 'wrong5', 53, 0),
(550, 'wrong5', 54, 0),
(551, 'wrong5', 55, 0),
(552, 'wrong5', 56, 0),
(553, 'wrong5', 57, 0),
(554, 'wrong5', 58, 0),
(555, 'wrong5', 59, 0),
(556, 'wrong5', 60, 0),
(557, 'wrong5', 61, 0),
(558, 'wrong5', 62, 0),
(559, 'wrong5', 63, 0),
(560, 'wrong5', 64, 0),
(561, 'wrong5', 65, 0),
(562, 'wrong5', 66, 0),
(563, 'wrong5', 67, 0),
(564, 'wrong5', 68, 0),
(565, 'wrong5', 69, 0),
(566, 'wrong5', 70, 0),
(567, 'wrong5', 71, 0),
(568, 'wrong5', 72, 0),
(569, 'wrong5', 73, 0),
(570, 'wrong5', 74, 0),
(571, 'wrong5', 75, 0),
(572, 'wrong5', 76, 0),
(573, 'wrong5', 77, 0),
(574, 'wrong5', 78, 0),
(575, 'wrong5', 79, 0),
(576, 'wrong5', 80, 0),
(577, 'wrong5', 81, 0),
(578, 'wrong5', 82, 0),
(579, 'wrong5', 83, 0),
(580, 'wrong5', 84, 0),
(581, 'wrong5', 85, 0),
(582, 'wrong5', 86, 0),
(583, 'wrong5', 87, 0),
(584, 'wrong5', 88, 0),
(585, 'wrong5', 89, 0),
(586, 'wrong5', 90, 0),
(587, 'wrong5', 91, 0),
(588, 'wrong5', 92, 0),
(589, 'wrong5', 93, 0),
(590, 'wrong5', 94, 0),
(591, 'wrong5', 95, 0),
(592, 'wrong5', 96, 0),
(593, 'wrong5', 97, 0),
(594, 'wrong5', 98, 0),
(595, 'wrong5', 99, 0),
(596, 'wrong5', 100, 0),
(597, 'wrong5', 101, 0),
(598, 'wrong5', 102, 0),
(599, 'wrong5', 103, 0),
(600, 'wrong5', 104, 0),
(601, 'wrong5', 105, 0),
(602, 'wrong5', 106, 0),
(603, 'wrong5', 107, 0),
(604, 'wrong6', 38, 0),
(605, 'wrong6', 39, 0),
(606, 'wrong6', 40, 0),
(607, 'wrong6', 41, 0),
(608, 'wrong6', 42, 0),
(609, 'wrong6', 43, 0),
(610, 'wrong6', 44, 0),
(611, 'wrong6', 45, 0),
(612, 'wrong6', 46, 0),
(613, 'wrong6', 47, 0),
(614, 'wrong6', 48, 0),
(615, 'wrong6', 49, 0),
(616, 'wrong6', 41, 0),
(617, 'wrong6', 50, 0),
(618, 'wrong6', 51, 0),
(619, 'wrong6', 52, 0),
(620, 'wrong6', 53, 0),
(621, 'wrong6', 54, 0),
(622, 'wrong6', 55, 0),
(623, 'wrong6', 56, 0),
(624, 'wrong6', 57, 0),
(625, 'wrong6', 58, 0),
(626, 'wrong6', 59, 0),
(627, 'wrong6', 60, 0),
(628, 'wrong6', 61, 0),
(629, 'wrong6', 62, 0),
(630, 'wrong6', 63, 0),
(631, 'wrong6', 64, 0),
(632, 'wrong6', 65, 0),
(633, 'wrong6', 66, 0),
(634, 'wrong6', 67, 0),
(635, 'wrong6', 68, 0),
(636, 'wrong6', 69, 0),
(637, 'wrong6', 70, 0),
(638, 'wrong6', 71, 0),
(639, 'wrong6', 72, 0),
(640, 'wrong6', 73, 0),
(641, 'wrong6', 74, 0),
(642, 'wrong6', 75, 0),
(643, 'wrong6', 76, 0),
(644, 'wrong6', 77, 0),
(645, 'wrong6', 78, 0),
(646, 'wrong6', 79, 0),
(647, 'wrong6', 80, 0),
(648, 'wrong6', 81, 0),
(649, 'wrong6', 82, 0),
(650, 'wrong6', 83, 0),
(651, 'wrong6', 84, 0),
(652, 'wrong6', 85, 0),
(653, 'wrong6', 86, 0),
(654, 'wrong6', 87, 0),
(655, 'wrong6', 88, 0),
(656, 'wrong6', 89, 0),
(657, 'wrong6', 90, 0),
(658, 'wrong6', 91, 0),
(659, 'wrong6', 92, 0),
(660, 'wrong6', 93, 0),
(661, 'wrong6', 94, 0),
(662, 'wrong6', 95, 0),
(663, 'wrong6', 96, 0),
(664, 'wrong6', 97, 0),
(665, 'wrong6', 98, 0),
(666, 'wrong6', 99, 0),
(667, 'wrong6', 100, 0),
(668, 'wrong6', 101, 0),
(669, 'wrong6', 102, 0),
(670, 'wrong6', 103, 0),
(671, 'wrong6', 104, 0),
(672, 'wrong6', 105, 0),
(673, 'wrong6', 106, 0),
(674, 'wrong6', 107, 0),
(675, 'wrong7', 38, 0),
(676, 'wrong7', 39, 0),
(677, 'wrong7', 40, 0),
(678, 'wrong7', 41, 0),
(679, 'wrong7', 42, 0),
(680, 'wrong7', 43, 0),
(681, 'wrong7', 44, 0),
(682, 'wrong7', 45, 0),
(683, 'wrong7', 46, 0),
(684, 'wrong7', 47, 0),
(685, 'wrong7', 48, 0),
(686, 'wrong7', 49, 0),
(687, 'wrong7', 41, 0),
(688, 'wrong7', 50, 0),
(689, 'wrong7', 51, 0),
(690, 'wrong7', 52, 0),
(691, 'wrong7', 53, 0),
(692, 'wrong7', 54, 0),
(693, 'wrong7', 55, 0),
(694, 'wrong7', 56, 0),
(695, 'wrong7', 57, 0),
(696, 'wrong7', 58, 0),
(697, 'wrong7', 59, 0),
(698, 'wrong7', 60, 0),
(699, 'wrong7', 61, 0),
(700, 'wrong7', 62, 0),
(701, 'wrong7', 63, 0),
(702, 'wrong7', 64, 0),
(703, 'wrong7', 65, 0),
(704, 'wrong7', 66, 0),
(705, 'wrong7', 67, 0),
(706, 'wrong7', 68, 0),
(707, 'wrong7', 69, 0),
(708, 'wrong7', 70, 0),
(709, 'wrong7', 71, 0),
(710, 'wrong7', 72, 0),
(711, 'wrong7', 73, 0),
(712, 'wrong7', 74, 0),
(713, 'wrong7', 75, 0),
(714, 'wrong7', 76, 0),
(715, 'wrong7', 77, 0),
(716, 'wrong7', 78, 0),
(717, 'wrong7', 79, 0),
(718, 'wrong7', 80, 0),
(719, 'wrong7', 81, 0),
(720, 'wrong7', 82, 0),
(721, 'wrong7', 83, 0),
(722, 'wrong7', 84, 0),
(723, 'wrong7', 85, 0),
(724, 'wrong7', 86, 0),
(725, 'wrong7', 87, 0),
(726, 'wrong7', 88, 0),
(727, 'wrong7', 89, 0),
(728, 'wrong7', 90, 0),
(729, 'wrong7', 91, 0),
(730, 'wrong7', 92, 0),
(731, 'wrong7', 93, 0),
(732, 'wrong7', 94, 0),
(733, 'wrong7', 95, 0),
(734, 'wrong7', 96, 0),
(735, 'wrong7', 97, 0),
(736, 'wrong7', 98, 0),
(737, 'wrong7', 99, 0),
(738, 'wrong7', 100, 0),
(739, 'wrong7', 101, 0),
(740, 'wrong7', 102, 0),
(741, 'wrong7', 103, 0),
(742, 'wrong7', 104, 0),
(743, 'wrong7', 105, 0),
(744, 'wrong7', 106, 0),
(745, 'wrong7', 107, 0);

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
(24, 'Which is the most famous soccer team in Germany?', 2),
(25, 'Who is the best soccer player in the world?', 2),
(26, 'What sport was brought to Japan by the Americans during World War 2?', 2),
(27, 'Which NBA basketball team is from New York?', 2),
(28, 'How many points are scored for a free-throw shot in basketball?', 2),
(29, 'Which baseball team is from New York?', 2),
(30, 'Which hockey team is from New York City?', 2),
(31, 'What is the primary color of Bayern Munchen?', 2),
(32, 'How many players are on the field for the defensive team in baseball?', 2),
(33, 'How many quarterbacks are on the field in American Football?', 2),
(34, 'How many points are scored from one Touchdown in American Football?', 2),
(35, 'How many runs are scored in baseball from a Grand Slam?', 2),
(36, 'Who was the 44th President of the USA?', 3),
(37, 'Who was the 43rd President of the USA?', 3),
(38, 'test question?', 3),
(39, 'test question?', 3),
(40, 'test question?', 3),
(41, 'test question?', 3),
(42, 'test question?', 3),
(43, 'test question?', 3),
(44, 'test question?', 3),
(45, 'test question?', 3),
(46, 'test question?', 3),
(47, 'test question?', 3),
(48, 'test question?', 4),
(49, 'test question?', 4),
(50, 'test question?', 4),
(51, 'test question?', 4),
(52, 'test question?', 4),
(53, 'test question?', 4),
(54, 'test question?', 4),
(55, 'test question?', 4),
(56, 'test question?', 4),
(57, 'test question?', 4),
(58, 'test question?', 4),
(59, 'test question?', 4),
(60, 'test question?', 5),
(61, 'test question?', 5),
(62, 'test question?', 5),
(63, 'test question?', 5),
(64, 'test question?', 5),
(65, 'test question?', 5),
(66, 'test question?', 5),
(67, 'test question?', 5),
(68, 'test question?', 5),
(69, 'test question?', 5),
(70, 'test question?', 5),
(71, 'test question?', 5),
(72, 'test question?', 6),
(73, 'test question?', 6),
(74, 'test question?', 6),
(75, 'test question?', 6),
(76, 'test question?', 6),
(77, 'test question?', 6),
(78, 'test question?', 6),
(79, 'test question?', 6),
(80, 'test question?', 6),
(81, 'test question?', 6),
(82, 'test question?', 6),
(83, 'test question?', 6),
(84, 'test question?', 7),
(85, 'test question?', 7),
(86, 'test question?', 7),
(87, 'test question?', 7),
(88, 'test question?', 7),
(89, 'test question?', 7),
(90, 'test question?', 7),
(91, 'test question?', 7),
(92, 'test question?', 7),
(93, 'test question?', 7),
(94, 'test question?', 7),
(95, 'test question?', 7),
(96, 'test question?', 8),
(97, 'test question?', 8),
(98, 'test question?', 8),
(99, 'test question?', 8),
(100, 'test question?', 8),
(101, 'test question?', 8),
(102, 'test question?', 8),
(103, 'test question?', 8),
(104, 'test question?', 8),
(105, 'test question?', 8),
(106, 'test question?', 8),
(107, 'test question?', 8);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=746;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
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
