-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Mai 2017 um 18:39
-- Server-Version: 10.1.21-MariaDB
-- PHP-Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `quizapp`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `FK_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `admins`
--

INSERT INTO `admins` (`id`, `FK_users`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `FK_question` int(11) NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  `id_string` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `answers`
--

INSERT INTO `answers` (`id`, `answer`, `FK_question`, `correct`, `id_string`) VALUES
(3, 'Emmanuel Macron', 3, 1, NULL),
(4, 'cat', 4, 1, NULL),
(5, '196', 5, 1, NULL),
(6, 'Wienerschnitzel', 6, 1, NULL),
(7, 'Arnold Schwarzenegger', 7, 1, NULL),
(24, 'Napoleon Bonaparte', 3, 0, NULL),
(25, 'Marine Le Pen', 3, 0, NULL),
(26, 'Charles De Gaulle', 3, 0, NULL),
(27, 'Donald Trump', 3, 0, NULL),
(28, 'Tony Blair', 3, 0, NULL),
(29, 'Angela Merkel', 3, 0, NULL),
(30, 'Jean Reno', 3, 0, NULL),
(31, 'dog', 4, 0, NULL),
(32, 'monkey', 4, 0, NULL),
(33, 'cow', 4, 0, NULL),
(34, 'sloth', 4, 0, NULL),
(35, 'fish', 4, 0, NULL),
(36, 'snake', 4, 0, NULL),
(37, 'rabbit', 4, 0, NULL),
(38, '197', 5, 0, NULL),
(39, '200', 5, 0, NULL),
(40, '199', 5, 0, NULL),
(41, '297', 5, 0, NULL),
(42, '100', 5, 0, NULL),
(43, '179', 5, 0, NULL),
(44, '169', 5, 0, NULL),
(46, 'Milka', 6, 0, NULL),
(47, 'Billa', 6, 0, NULL),
(48, 'frankfurter', 6, 0, NULL),
(49, 'croissant', 6, 0, NULL),
(51, 'bratwurst', 6, 0, NULL),
(52, 'David Hasselhoff', 7, 0, NULL),
(53, 'Lisa Duschek', 7, 0, NULL),
(54, 'Crocodile Hunter', 7, 0, NULL),
(55, 'Franz Joseph', 7, 0, NULL),
(56, 'Amadeus Mozart', 7, 0, NULL),
(57, 'Ludwig Von Beethoven', 7, 0, NULL),
(58, 'Christiano Ronaldo', 7, 0, NULL),
(59, 'Donald Trump', 7, 0, NULL),
(60, 'Angela Merkel', 7, 0, NULL),
(61, 'Austin Oosterland', 7, 0, NULL),
(62, 'Iceland', 8, 1, NULL),
(63, 'Italy', 8, 0, NULL),
(64, 'Germany', 8, 0, NULL),
(65, 'Austria', 8, 0, NULL),
(66, 'Switzerland', 8, 0, NULL),
(67, 'South Africa', 8, 0, NULL),
(68, 'Northern Ireland', 8, 0, NULL),
(69, 'Denmark', 8, 0, NULL),
(70, 'USA', 8, 0, NULL),
(71, 'Argentina', 8, 0, NULL),
(72, 'Australia', 8, 0, NULL),
(73, 'Saudi Arabia', 8, 0, NULL),
(74, 'India', 8, 0, NULL),
(75, 'Mexico', 8, 0, NULL),
(76, 'Thailand', 8, 0, NULL),
(77, 'North Korea', 8, 0, NULL),
(78, 'Sri Lanka', 8, 0, NULL),
(79, 'USA', 9, 1, NULL),
(80, 'Kazakhstan', 9, 1, NULL),
(81, 'Spain', 9, 0, NULL),
(82, 'Germany', 9, 0, NULL),
(83, 'Andorra', 9, 0, NULL),
(84, 'Switzerland', 9, 0, NULL),
(85, 'Belgium', 9, 0, NULL),
(86, 'Luxembourg', 9, 0, NULL),
(87, 'Monaco', 9, 0, NULL),
(88, 'Portugal', 9, 1, NULL),
(89, 'Mexico', 9, 0, NULL),
(90, 'Iceland', 9, 0, NULL),
(91, '4', 10, 1, NULL),
(92, '5', 10, 0, NULL),
(93, '3', 10, 0, NULL),
(94, '2', 10, 0, NULL),
(95, '6', 10, 0, NULL),
(96, '7', 10, 0, NULL),
(97, '8', 10, 0, NULL),
(98, 'Africa', 11, 1, NULL),
(99, 'Europe', 11, 0, NULL),
(100, 'Asia', 11, 0, NULL),
(101, 'Middle East', 11, 0, NULL),
(102, 'Mediterranean', 11, 0, NULL),
(103, 'South America', 11, 0, NULL),
(104, 'Brazil', 12, 1, NULL),
(105, 'Belize', 12, 1, NULL),
(106, 'Bolivia', 12, 0, NULL),
(107, 'Argentina', 12, 0, NULL),
(108, 'Ecuador', 12, 0, NULL),
(109, 'Peru', 12, 0, NULL),
(110, 'Uruguay', 12, 0, NULL),
(111, 'Paraguay', 12, 0, NULL),
(112, 'Colombia', 12, 0, NULL),
(113, 'Venezuela', 12, 0, NULL),
(114, 'Chile', 12, 0, NULL),
(115, 'Mexico', 12, 0, NULL),
(116, 'Spain', 12, 0, NULL),
(117, 'Panama', 12, 0, NULL),
(118, 'Costa Rica', 12, 0, NULL),
(119, 'Nicaragua', 12, 0, NULL),
(120, 'Cuba', 12, 0, NULL),
(121, 'Guatemala', 12, 0, NULL),
(122, 'Berlin', 13, 1, NULL),
(123, 'Hamburg', 13, 0, NULL),
(124, 'Dusseldorf', 13, 0, NULL),
(125, 'Frankfurt', 13, 0, NULL),
(126, 'Munich', 13, 0, NULL),
(127, 'Cologne', 13, 0, NULL),
(128, 'Nuremburg', 13, 0, NULL),
(129, 'Stuttgart', 13, 0, NULL),
(130, 'Bonn', 13, 0, NULL),
(131, 'Ankara', 14, 1, NULL),
(132, 'Istanbul', 14, 0, NULL),
(133, 'Antalya', 14, 0, NULL),
(134, 'Izmir', 14, 0, NULL),
(135, 'Konya', 14, 0, NULL),
(136, 'Bursa', 14, 0, NULL),
(137, 'Cappadocia', 14, 0, NULL),
(138, 'Edirne', 14, 0, NULL),
(139, 'Athens', 14, 0, NULL),
(140, 'Cairo', 14, 0, NULL),
(141, 'Sofia', 14, 0, NULL),
(142, 'Tbilisi', 14, 0, NULL),
(143, 'Yerevan', 14, 0, NULL),
(144, 'Damascus', 14, 0, NULL),
(145, 'Ashgabat', 14, 0, NULL),
(146, 'Tehran', 14, 0, NULL),
(147, 'Brussels', 15, 1, NULL),
(148, 'Berlin', 15, 0, NULL),
(149, 'Strasbourg', 15, 0, NULL),
(150, 'Paris', 15, 0, NULL),
(151, 'Washington D.C.', 15, 0, NULL),
(152, 'Reykjavik', 15, 0, NULL),
(153, 'Copenhagen', 15, 0, NULL),
(154, 'Luxembourg', 15, 0, NULL),
(155, 'Amsterdam', 15, 0, NULL),
(156, 'Vienna', 15, 0, NULL),
(157, 'Warsaw', 15, 0, NULL),
(158, 'Versailles', 15, 0, NULL),
(159, 'Prague', 15, 0, NULL),
(160, 'Geneva', 15, 0, NULL),
(161, 'Vaduz', 15, 0, NULL),
(162, 'Canada', 16, 1, NULL),
(163, 'Mexico', 16, 1, NULL),
(164, 'Cuba', 16, 0, NULL),
(165, 'Greenland', 16, 0, NULL),
(166, 'Russia', 16, 0, NULL),
(167, 'Bermuda', 16, 0, NULL),
(168, 'Guatemala', 16, 0, NULL),
(169, 'Panama', 16, 0, NULL),
(170, 'South Korea', 16, 0, NULL),
(171, 'Australia', 16, 0, NULL),
(172, 'Antarctica', 16, 0, NULL),
(173, 'Austria', 16, 0, NULL),
(174, 'France', 16, 0, NULL),
(175, 'Germany', 16, 0, NULL),
(178, 'Alexander Van der Bellen', 38, 1, NULL),
(179, 'Angela Merkel', 39, 1, NULL),
(180, '100', 40, 1, NULL),
(181, 'Independence Party', 41, 1, NULL),
(182, 'test correct', 42, 1, NULL),
(183, 'test correct', 43, 1, NULL),
(184, 'test correct', 44, 1, NULL),
(185, 'test correct', 45, 1, NULL),
(186, 'test correct', 46, 1, NULL),
(187, 'test correct', 47, 1, NULL),
(188, '8', 48, 0, NULL),
(189, 'Mel Gibson', 49, 0, NULL),
(191, 'Normandy, France', 50, 1, NULL),
(192, 'Cyberdyne Systems', 51, 1, NULL),
(193, 'Salzburg', 52, 1, NULL),
(194, '1982', 53, 0, NULL),
(195, 'test correct', 54, 1, NULL),
(196, 'test correct', 55, 1, NULL),
(197, 'test correct', 56, 1, NULL),
(198, 'test correct', 57, 1, NULL),
(199, 'test correct', 58, 1, NULL),
(200, 'test correct', 59, 1, NULL),
(201, 'test correct', 60, 1, NULL),
(202, 'test correct', 61, 1, NULL),
(203, 'test correct', 62, 1, NULL),
(204, 'test correct', 63, 1, NULL),
(205, 'test correct', 64, 1, NULL),
(206, 'test correct', 65, 1, NULL),
(207, 'test correct', 66, 1, NULL),
(208, 'test correct', 67, 1, NULL),
(209, 'test correct', 68, 1, NULL),
(210, 'test correct', 69, 1, NULL),
(211, 'test correct', 70, 1, NULL),
(212, 'test correct', 71, 1, NULL),
(215, 'test correct', 74, 1, NULL),
(216, 'test correct', 75, 1, NULL),
(217, 'test correct', 76, 1, NULL),
(218, 'test correct', 77, 1, NULL),
(219, 'test correct', 78, 1, NULL),
(220, 'test correct', 79, 1, NULL),
(221, 'test correct', 80, 1, NULL),
(222, 'test correct', 81, 1, NULL),
(223, 'test correct', 82, 1, NULL),
(224, 'test correct', 83, 1, NULL),
(226, 'test correct', 85, 1, NULL),
(227, 'test correct', 86, 1, NULL),
(228, 'test correct', 87, 1, NULL),
(229, 'test correct', 88, 1, NULL),
(230, 'test correct', 89, 1, NULL),
(231, 'test correct', 90, 1, NULL),
(232, 'test correct', 91, 1, NULL),
(233, 'test correct', 92, 1, NULL),
(234, 'test correct', 93, 1, NULL),
(235, 'test correct', 94, 1, NULL),
(236, 'test correct', 95, 1, NULL),
(237, 'test correct', 96, 1, NULL),
(238, 'test correct', 97, 1, NULL),
(239, 'test correct', 98, 1, NULL),
(240, 'test correct', 99, 1, NULL),
(241, 'test correct', 100, 1, NULL),
(242, 'test correct', 101, 1, NULL),
(243, 'test correct', 102, 1, NULL),
(244, 'test correct', 103, 1, NULL),
(245, 'test correct', 104, 1, NULL),
(246, 'test correct', 105, 1, NULL),
(247, 'test correct', 106, 1, NULL),
(248, 'test correct', 107, 1, NULL),
(249, 'Heinz Fischer', 38, 0, NULL),
(250, 'Manuel Neuer', 39, 0, NULL),
(251, '52', 40, 0, NULL),
(252, 'Bright Future', 41, 0, NULL),
(253, 'wrong1', 42, 0, NULL),
(254, 'wrong1', 43, 0, NULL),
(255, 'wrong1', 44, 0, NULL),
(256, 'wrong1', 45, 0, NULL),
(257, 'wrong1', 46, 0, NULL),
(258, 'wrong1', 47, 0, NULL),
(259, '5', 48, 1, NULL),
(260, 'Arnold Schwarzenegger', 49, 0, NULL),
(261, 'Pirate Party', 41, 0, NULL),
(262, 'London, England', 50, 0, NULL),
(263, 'CodeFactory', 51, 0, NULL),
(264, 'Paris', 52, 0, NULL),
(265, '2002', 53, 0, NULL),
(266, 'wrong1', 54, 0, NULL),
(267, 'wrong1', 55, 0, NULL),
(268, 'wrong1', 56, 0, NULL),
(269, 'wrong1', 57, 0, NULL),
(270, 'wrong1', 58, 0, NULL),
(271, 'wrong1', 59, 0, NULL),
(272, 'wrong1', 60, 0, NULL),
(273, 'wrong1', 61, 0, NULL),
(274, 'wrong1', 62, 0, NULL),
(275, 'wrong1', 63, 0, NULL),
(276, 'wrong1', 64, 0, NULL),
(277, 'wrong1', 65, 0, NULL),
(278, 'wrong1', 66, 0, NULL),
(279, 'wrong1', 67, 0, NULL),
(280, 'wrong1', 68, 0, NULL),
(281, 'wrong1', 69, 0, NULL),
(282, 'wrong1', 70, 0, NULL),
(283, 'wrong1', 71, 0, NULL),
(286, 'wrong1', 74, 0, NULL),
(287, 'wrong1', 75, 0, NULL),
(288, 'wrong1', 76, 0, NULL),
(289, 'wrong1', 77, 0, NULL),
(290, 'wrong1', 78, 0, NULL),
(291, 'wrong1', 79, 0, NULL),
(292, 'wrong1', 80, 0, NULL),
(293, 'wrong1', 81, 0, NULL),
(294, 'wrong1', 82, 0, NULL),
(295, 'wrong1', 83, 0, NULL),
(298, 'wrong1', 86, 0, NULL),
(299, 'wrong1', 87, 0, NULL),
(300, 'wrong1', 88, 0, NULL),
(301, 'wrong1', 89, 0, NULL),
(302, 'wrong1', 90, 0, NULL),
(303, 'wrong1', 91, 0, NULL),
(304, 'wrong1', 92, 0, NULL),
(305, 'wrong1', 93, 0, NULL),
(306, 'wrong1', 94, 0, NULL),
(307, 'wrong1', 95, 0, NULL),
(308, 'wrong1', 96, 0, NULL),
(309, 'wrong1', 97, 0, NULL),
(310, 'wrong1', 98, 0, NULL),
(311, 'wrong1', 99, 0, NULL),
(312, 'wrong1', 100, 0, NULL),
(313, 'wrong1', 101, 0, NULL),
(314, 'wrong1', 102, 0, NULL),
(315, 'wrong1', 103, 0, NULL),
(316, 'wrong1', 104, 0, NULL),
(317, 'wrong1', 105, 0, NULL),
(318, 'wrong1', 106, 0, NULL),
(319, 'wrong1', 107, 0, NULL),
(320, 'Amadeus Mozart', 38, 0, NULL),
(321, 'Hermann Goring', 39, 0, NULL),
(322, '49', 40, 0, NULL),
(323, 'Republican Party', 41, 0, NULL),
(324, 'wrong2', 42, 0, NULL),
(325, 'wrong2', 43, 0, NULL),
(326, 'wrong2', 44, 0, NULL),
(327, 'wrong2', 45, 0, NULL),
(328, 'wrong2', 46, 0, NULL),
(329, 'wrong2', 47, 0, NULL),
(330, '6', 48, 0, NULL),
(331, 'Hugh Jackman', 49, 1, NULL),
(333, 'New York, USA', 50, 0, NULL),
(334, 'Samsung', 51, 0, NULL),
(335, 'Budapest', 52, 0, NULL),
(336, '1989', 53, 0, NULL),
(337, 'wrong2', 54, 0, NULL),
(338, 'wrong2', 55, 0, NULL),
(339, 'wrong2', 56, 0, NULL),
(340, 'wrong2', 57, 0, NULL),
(341, 'wrong2', 58, 0, NULL),
(342, 'wrong2', 59, 0, NULL),
(343, 'wrong2', 60, 0, NULL),
(344, 'wrong2', 61, 0, NULL),
(345, 'wrong2', 62, 0, NULL),
(346, 'wrong2', 63, 0, NULL),
(347, 'wrong2', 64, 0, NULL),
(348, 'wrong2', 65, 0, NULL),
(349, 'wrong2', 66, 0, NULL),
(350, 'wrong2', 67, 0, NULL),
(351, 'wrong2', 68, 0, NULL),
(352, 'wrong2', 69, 0, NULL),
(353, 'wrong2', 70, 0, NULL),
(354, 'wrong2', 71, 0, NULL),
(357, 'wrong2', 74, 0, NULL),
(358, 'wrong2', 75, 0, NULL),
(359, 'wrong2', 76, 0, NULL),
(360, 'wrong2', 77, 0, NULL),
(361, 'wrong2', 78, 0, NULL),
(362, 'wrong2', 79, 0, NULL),
(363, 'wrong2', 80, 0, NULL),
(364, 'wrong2', 81, 0, NULL),
(365, 'wrong2', 82, 0, NULL),
(366, 'wrong2', 83, 0, NULL),
(368, 'wrong2', 85, 0, NULL),
(369, 'wrong2', 86, 0, NULL),
(370, 'wrong2', 87, 0, NULL),
(371, 'wrong2', 88, 0, NULL),
(372, 'wrong2', 89, 0, NULL),
(373, 'wrong2', 90, 0, NULL),
(374, 'wrong2', 91, 0, NULL),
(375, 'wrong2', 92, 0, NULL),
(376, 'wrong2', 93, 0, NULL),
(377, 'wrong2', 94, 0, NULL),
(378, 'wrong2', 95, 0, NULL),
(379, 'wrong2', 96, 0, NULL),
(380, 'wrong2', 97, 0, NULL),
(381, 'wrong2', 98, 0, NULL),
(382, 'wrong2', 99, 0, NULL),
(383, 'wrong2', 100, 0, NULL),
(384, 'wrong2', 101, 0, NULL),
(385, 'wrong2', 102, 0, NULL),
(386, 'wrong2', 103, 0, NULL),
(387, 'wrong2', 104, 0, NULL),
(388, 'wrong2', 105, 0, NULL),
(389, 'wrong2', 106, 0, NULL),
(390, 'wrong2', 107, 0, NULL),
(391, 'Reinhold Mitterlehner', 38, 0, NULL),
(392, 'Horst Köhler', 39, 0, NULL),
(393, '101', 40, 0, NULL),
(395, 'wrong3', 42, 0, NULL),
(396, 'wrong3', 43, 0, NULL),
(397, 'wrong3', 44, 0, NULL),
(398, 'wrong3', 45, 0, NULL),
(399, 'wrong3', 46, 0, NULL),
(400, 'wrong3', 47, 0, NULL),
(401, '4', 48, 0, NULL),
(402, 'Tom Cruise', 49, 0, NULL),
(403, 'Social Democratic Alliance', 41, 0, NULL),
(404, 'Tangiers, Morocco', 50, 0, NULL),
(405, 'Apple', 51, 0, NULL),
(406, 'New York', 52, 0, NULL),
(407, '2012', 53, 0, NULL),
(408, 'wrong3', 54, 0, NULL),
(409, 'wrong3', 55, 0, NULL),
(410, 'wrong3', 56, 0, NULL),
(411, 'wrong3', 57, 0, NULL),
(412, 'wrong3', 58, 0, NULL),
(413, 'wrong3', 59, 0, NULL),
(414, 'wrong3', 60, 0, NULL),
(415, 'wrong3', 61, 0, NULL),
(416, 'wrong3', 62, 0, NULL),
(417, 'wrong3', 63, 0, NULL),
(418, 'wrong3', 64, 0, NULL),
(419, 'wrong3', 65, 0, NULL),
(420, 'wrong3', 66, 0, NULL),
(421, 'wrong3', 67, 0, NULL),
(422, 'wrong3', 68, 0, NULL),
(423, 'wrong3', 69, 0, NULL),
(424, 'wrong3', 70, 0, NULL),
(425, 'wrong3', 71, 0, NULL),
(428, 'wrong3', 74, 0, NULL),
(429, 'wrong3', 75, 0, NULL),
(430, 'wrong3', 76, 0, NULL),
(431, 'wrong3', 77, 0, NULL),
(432, 'wrong3', 78, 0, NULL),
(433, 'wrong3', 79, 0, NULL),
(434, 'wrong3', 80, 0, NULL),
(435, 'wrong3', 81, 0, NULL),
(436, 'wrong3', 82, 0, NULL),
(437, 'wrong3', 83, 0, NULL),
(439, 'wrong3', 85, 0, NULL),
(440, 'wrong3', 86, 0, NULL),
(441, 'wrong3', 87, 0, NULL),
(442, 'wrong3', 88, 0, NULL),
(443, 'wrong3', 89, 0, NULL),
(444, 'wrong3', 90, 0, NULL),
(445, 'wrong3', 91, 0, NULL),
(446, 'wrong3', 92, 0, NULL),
(447, 'wrong3', 93, 0, NULL),
(448, 'wrong3', 94, 0, NULL),
(449, 'wrong3', 95, 0, NULL),
(450, 'wrong3', 96, 0, NULL),
(451, 'wrong3', 97, 0, NULL),
(452, 'wrong3', 98, 0, NULL),
(453, 'wrong3', 99, 0, NULL),
(454, 'wrong3', 100, 0, NULL),
(455, 'wrong3', 101, 0, NULL),
(456, 'wrong3', 102, 0, NULL),
(457, 'wrong3', 103, 0, NULL),
(458, 'wrong3', 104, 0, NULL),
(459, 'wrong3', 105, 0, NULL),
(460, 'wrong3', 106, 0, NULL),
(461, 'wrong3', 107, 0, NULL),
(462, 'Rudolf Hundstorfer', 38, 0, NULL),
(463, 'David Hasselhoff', 39, 0, NULL),
(464, '51', 40, 0, NULL),
(465, 'Left-Green Movement', 41, 0, NULL),
(466, 'wrong4', 42, 0, NULL),
(467, 'wrong4', 43, 0, NULL),
(468, 'wrong4', 44, 0, NULL),
(469, 'wrong4', 45, 0, NULL),
(470, 'wrong4', 46, 0, NULL),
(471, 'wrong4', 47, 0, NULL),
(472, '9', 48, 0, NULL),
(473, 'Russel Crowe', 49, 1, NULL),
(475, 'Vienna, Austria', 50, 0, NULL),
(476, 'Microsoft', 51, 0, NULL),
(477, 'Innsbruck', 52, 0, NULL),
(478, '1991', 53, 1, NULL),
(479, 'wrong4', 54, 0, NULL),
(480, 'wrong4', 55, 0, NULL),
(481, 'wrong4', 56, 0, NULL),
(482, 'wrong4', 57, 0, NULL),
(483, 'wrong4', 58, 0, NULL),
(484, 'wrong4', 59, 0, NULL),
(485, 'wrong4', 60, 0, NULL),
(486, 'wrong4', 61, 0, NULL),
(487, 'wrong4', 62, 0, NULL),
(488, 'wrong4', 63, 0, NULL),
(489, 'wrong4', 64, 0, NULL),
(490, 'wrong4', 65, 0, NULL),
(491, 'wrong4', 66, 0, NULL),
(492, 'wrong4', 67, 0, NULL),
(493, 'wrong4', 68, 0, NULL),
(494, 'wrong4', 69, 0, NULL),
(495, 'wrong4', 70, 0, NULL),
(496, 'wrong4', 71, 0, NULL),
(499, 'wrong4', 74, 0, NULL),
(500, 'wrong4', 75, 0, NULL),
(501, 'wrong4', 76, 0, NULL),
(502, 'wrong4', 77, 0, NULL),
(503, 'wrong4', 78, 0, NULL),
(504, 'wrong4', 79, 0, NULL),
(505, 'wrong4', 80, 0, NULL),
(506, 'wrong4', 81, 0, NULL),
(507, 'wrong4', 82, 0, NULL),
(508, 'wrong4', 83, 0, NULL),
(510, 'wrong4', 85, 0, NULL),
(511, 'wrong4', 86, 0, NULL),
(512, 'wrong4', 87, 0, NULL),
(513, 'wrong4', 88, 0, NULL),
(514, 'wrong4', 89, 0, NULL),
(515, 'wrong4', 90, 0, NULL),
(516, 'wrong4', 91, 0, NULL),
(517, 'wrong4', 92, 0, NULL),
(518, 'wrong4', 93, 0, NULL),
(519, 'wrong4', 94, 0, NULL),
(520, 'wrong4', 95, 0, NULL),
(521, 'wrong4', 96, 0, NULL),
(522, 'wrong4', 97, 0, NULL),
(523, 'wrong4', 98, 0, NULL),
(524, 'wrong4', 99, 0, NULL),
(525, 'wrong4', 100, 0, NULL),
(526, 'wrong4', 101, 0, NULL),
(527, 'wrong4', 102, 0, NULL),
(528, 'wrong4', 103, 0, NULL),
(529, 'wrong4', 104, 0, NULL),
(530, 'wrong4', 105, 0, NULL),
(531, 'wrong4', 106, 0, NULL),
(532, 'wrong4', 107, 0, NULL),
(533, 'Sebastian Kurz', 38, 0, NULL),
(534, 'Gerhard Schröder', 39, 0, NULL),
(535, '50', 40, 0, NULL),
(537, 'wrong5', 42, 0, NULL),
(538, 'wrong5', 43, 0, NULL),
(539, 'wrong5', 44, 0, NULL),
(540, 'wrong5', 45, 0, NULL),
(541, 'wrong5', 46, 0, NULL),
(542, 'wrong5', 47, 0, NULL),
(543, '7', 48, 0, NULL),
(544, 'Hugh Grant', 49, 0, NULL),
(545, 'Reform Party', 41, 0, NULL),
(546, 'Berlin, Germany', 50, 0, NULL),
(547, 'Billa', 51, 0, NULL),
(548, 'Munich', 52, 0, NULL),
(549, '1992', 53, 0, NULL),
(550, 'wrong5', 54, 0, NULL),
(551, 'wrong5', 55, 0, NULL),
(552, 'wrong5', 56, 0, NULL),
(553, 'wrong5', 57, 0, NULL),
(554, 'wrong5', 58, 0, NULL),
(555, 'wrong5', 59, 0, NULL),
(556, 'wrong5', 60, 0, NULL),
(557, 'wrong5', 61, 0, NULL),
(558, 'wrong5', 62, 0, NULL),
(559, 'wrong5', 63, 0, NULL),
(560, 'wrong5', 64, 0, NULL),
(561, 'wrong5', 65, 0, NULL),
(562, 'wrong5', 66, 0, NULL),
(563, 'wrong5', 67, 0, NULL),
(564, 'wrong5', 68, 0, NULL),
(565, 'wrong5', 69, 0, NULL),
(566, 'wrong5', 70, 0, NULL),
(567, 'wrong5', 71, 0, NULL),
(570, 'wrong5', 74, 0, NULL),
(571, 'wrong5', 75, 0, NULL),
(572, 'wrong5', 76, 0, NULL),
(573, 'wrong5', 77, 0, NULL),
(574, 'wrong5', 78, 0, NULL),
(575, 'wrong5', 79, 0, NULL),
(576, 'wrong5', 80, 0, NULL),
(577, 'wrong5', 81, 0, NULL),
(578, 'wrong5', 82, 0, NULL),
(579, 'wrong5', 83, 0, NULL),
(581, 'wrong5', 85, 0, NULL),
(582, 'wrong5', 86, 0, NULL),
(583, 'wrong5', 87, 0, NULL),
(584, 'wrong5', 88, 0, NULL),
(585, 'wrong5', 89, 0, NULL),
(586, 'wrong5', 90, 0, NULL),
(587, 'wrong5', 91, 0, NULL),
(588, 'wrong5', 92, 0, NULL),
(589, 'wrong5', 93, 0, NULL),
(590, 'wrong5', 94, 0, NULL),
(591, 'wrong5', 95, 0, NULL),
(592, 'wrong5', 96, 0, NULL),
(593, 'wrong5', 97, 0, NULL),
(594, 'wrong5', 98, 0, NULL),
(595, 'wrong5', 99, 0, NULL),
(596, 'wrong5', 100, 0, NULL),
(597, 'wrong5', 101, 0, NULL),
(598, 'wrong5', 102, 0, NULL),
(599, 'wrong5', 103, 0, NULL),
(600, 'wrong5', 104, 0, NULL),
(601, 'wrong5', 105, 0, NULL),
(602, 'wrong5', 106, 0, NULL),
(603, 'wrong5', 107, 0, NULL),
(604, 'Arnold Schwarzenegger', 38, 0, NULL),
(605, 'Wolfgang Schäuble', 39, 0, NULL),
(606, '7', 40, 0, NULL),
(607, 'Democratic Party', 41, 0, NULL),
(608, 'wrong6', 42, 0, NULL),
(609, 'wrong6', 43, 0, NULL),
(610, 'wrong6', 44, 0, NULL),
(611, 'wrong6', 45, 0, NULL),
(612, 'wrong6', 46, 0, NULL),
(613, 'wrong6', 47, 0, NULL),
(614, '100', 48, 0, NULL),
(615, 'David Hasselhoff', 49, 0, NULL),
(617, 'Paris, France', 50, 0, NULL),
(618, 'Fox Studios', 51, 0, NULL),
(619, 'Milan', 52, 0, NULL),
(620, '1990', 53, 0, NULL),
(621, 'wrong6', 54, 0, NULL),
(622, 'wrong6', 55, 0, NULL),
(623, 'wrong6', 56, 0, NULL),
(624, 'wrong6', 57, 0, NULL),
(625, 'wrong6', 58, 0, NULL),
(626, 'wrong6', 59, 0, NULL),
(627, 'wrong6', 60, 0, NULL),
(628, 'wrong6', 61, 0, NULL),
(629, 'wrong6', 62, 0, NULL),
(630, 'wrong6', 63, 0, NULL),
(631, 'wrong6', 64, 0, NULL),
(632, 'wrong6', 65, 0, NULL),
(633, 'wrong6', 66, 0, NULL),
(634, 'wrong6', 67, 0, NULL),
(635, 'wrong6', 68, 0, NULL),
(636, 'wrong6', 69, 0, NULL),
(637, 'wrong6', 70, 0, NULL),
(638, 'wrong6', 71, 0, NULL),
(641, 'wrong6', 74, 0, NULL),
(642, 'wrong6', 75, 0, NULL),
(643, 'wrong6', 76, 0, NULL),
(644, 'wrong6', 77, 0, NULL),
(645, 'wrong6', 78, 0, NULL),
(646, 'wrong6', 79, 0, NULL),
(647, 'wrong6', 80, 0, NULL),
(648, 'wrong6', 81, 0, NULL),
(649, 'wrong6', 82, 0, NULL),
(650, 'wrong6', 83, 0, NULL),
(652, 'wrong6', 85, 0, NULL),
(653, 'wrong6', 86, 0, NULL),
(654, 'wrong6', 87, 0, NULL),
(655, 'wrong6', 88, 0, NULL),
(656, 'wrong6', 89, 0, NULL),
(657, 'wrong6', 90, 0, NULL),
(658, 'wrong6', 91, 0, NULL),
(659, 'wrong6', 92, 0, NULL),
(660, 'wrong6', 93, 0, NULL),
(661, 'wrong6', 94, 0, NULL),
(662, 'wrong6', 95, 0, NULL),
(663, 'wrong6', 96, 0, NULL),
(664, 'wrong6', 97, 0, NULL),
(665, 'wrong6', 98, 0, NULL),
(666, 'wrong6', 99, 0, NULL),
(667, 'wrong6', 100, 0, NULL),
(668, 'wrong6', 101, 0, NULL),
(669, 'wrong6', 102, 0, NULL),
(670, 'wrong6', 103, 0, NULL),
(671, 'wrong6', 104, 0, NULL),
(672, 'wrong6', 105, 0, NULL),
(673, 'wrong6', 106, 0, NULL),
(674, 'wrong6', 107, 0, NULL),
(675, 'Norbert Hofer', 38, 0, NULL),
(676, 'Franz Joseph', 39, 0, NULL),
(677, '102', 40, 0, NULL),
(679, 'wrong7', 42, 0, NULL),
(680, 'wrong7', 43, 0, NULL),
(681, 'wrong7', 44, 0, NULL),
(682, 'wrong7', 45, 0, NULL),
(683, 'wrong7', 46, 0, NULL),
(684, 'wrong7', 47, 0, NULL),
(685, '3', 48, 0, NULL),
(686, 'Nicole Kidman', 49, 1, NULL),
(687, 'Progressive Party', 41, 0, NULL),
(688, 'Okinawa, Japan', 50, 0, NULL),
(689, 'Novomatic', 51, 0, NULL),
(690, 'Vienna', 52, 0, NULL),
(691, '1984', 53, 0, NULL),
(692, 'wrong7', 54, 0, NULL),
(693, 'wrong7', 55, 0, NULL),
(694, 'wrong7', 56, 0, NULL),
(695, 'wrong7', 57, 0, NULL),
(696, 'wrong7', 58, 0, NULL),
(697, 'wrong7', 59, 0, NULL),
(698, 'wrong7', 60, 0, NULL),
(699, 'wrong7', 61, 0, NULL),
(700, 'wrong7', 62, 0, NULL),
(701, 'wrong7', 63, 0, NULL),
(702, 'wrong7', 64, 0, NULL),
(703, 'wrong7', 65, 0, NULL),
(704, 'wrong7', 66, 0, NULL),
(705, 'wrong7', 67, 0, NULL),
(706, 'wrong7', 68, 0, NULL),
(707, 'wrong7', 69, 0, NULL),
(708, 'wrong7', 70, 0, NULL),
(709, 'wrong7', 71, 0, NULL),
(712, 'wrong7', 74, 0, NULL),
(713, 'wrong7', 75, 0, NULL),
(714, 'wrong7', 76, 0, NULL),
(715, 'wrong7', 77, 0, NULL),
(716, 'wrong7', 78, 0, NULL),
(717, 'wrong7', 79, 0, NULL),
(718, 'wrong7', 80, 0, NULL),
(719, 'wrong7', 81, 0, NULL),
(720, 'wrong7', 82, 0, NULL),
(721, 'wrong7', 83, 0, NULL),
(723, 'wrong7', 85, 0, NULL),
(724, 'wrong7', 86, 0, NULL),
(725, 'wrong7', 87, 0, NULL),
(726, 'wrong7', 88, 0, NULL),
(727, 'wrong7', 89, 0, NULL),
(728, 'wrong7', 90, 0, NULL),
(729, 'wrong7', 91, 0, NULL),
(730, 'wrong7', 92, 0, NULL),
(731, 'wrong7', 93, 0, NULL),
(732, 'wrong7', 94, 0, NULL),
(733, 'wrong7', 95, 0, NULL),
(734, 'wrong7', 96, 0, NULL),
(735, 'wrong7', 97, 0, NULL),
(736, 'wrong7', 98, 0, NULL),
(737, 'wrong7', 99, 0, NULL),
(738, 'wrong7', 100, 0, NULL),
(739, 'wrong7', 101, 0, NULL),
(740, 'wrong7', 102, 0, NULL),
(741, 'wrong7', 103, 0, NULL),
(742, 'wrong7', 104, 0, NULL),
(743, 'wrong7', 105, 0, NULL),
(744, 'wrong7', 106, 0, NULL),
(745, 'wrong7', 107, 0, NULL),
(875, 'wrong7', 24, 1, NULL),
(876, 'wrong7', 24, 0, NULL),
(877, 'wrong7', 24, 0, NULL),
(878, 'wrong7', 24, 0, NULL),
(879, 'wrong7', 24, 0, NULL),
(880, 'wrong7', 24, 0, NULL),
(881, 'wrong7', 25, 1, NULL),
(882, 'wrong7', 25, 0, NULL),
(883, 'wrong7', 25, 0, NULL),
(884, 'wrong7', 25, 0, NULL),
(885, 'wrong7', 25, 0, NULL),
(886, 'wrong7', 25, 0, NULL),
(887, 'wrong7', 26, 1, NULL),
(888, 'wrong7', 26, 0, NULL),
(889, 'wrong7', 26, 0, NULL),
(890, 'wrong7', 26, 0, NULL),
(891, 'wrong7', 26, 0, NULL),
(892, 'wrong7', 26, 0, NULL),
(893, 'wrong7', 27, 1, NULL),
(894, 'wrong7', 27, 0, NULL),
(895, 'wrong7', 27, 0, NULL),
(896, 'wrong7', 27, 0, NULL),
(897, 'wrong7', 27, 0, NULL),
(898, 'wrong7', 27, 0, NULL),
(899, 'wrong7', 28, 1, NULL),
(900, 'wrong7', 28, 0, NULL),
(901, 'wrong7', 28, 0, NULL),
(902, 'wrong7', 28, 0, NULL),
(903, 'wrong7', 28, 0, NULL),
(904, 'wrong7', 28, 0, NULL),
(905, 'wrong7', 29, 1, NULL),
(906, 'wrong7', 29, 0, NULL),
(907, 'wrong7', 29, 0, NULL),
(908, 'wrong7', 29, 0, NULL),
(909, 'wrong7', 29, 0, NULL),
(910, 'wrong7', 29, 0, NULL),
(911, 'wrong7', 30, 1, NULL),
(912, 'wrong7', 30, 0, NULL),
(913, 'wrong7', 30, 0, NULL),
(914, 'wrong7', 30, 0, NULL),
(915, 'wrong7', 30, 0, NULL),
(916, 'wrong7', 30, 0, NULL),
(917, 'wrong7', 31, 1, NULL),
(918, 'wrong7', 31, 0, NULL),
(919, 'wrong7', 31, 0, NULL),
(920, 'wrong7', 31, 0, NULL),
(921, 'wrong7', 31, 0, NULL),
(922, 'wrong7', 31, 0, NULL),
(923, 'wrong7', 32, 1, NULL),
(924, 'wrong7', 32, 0, NULL),
(925, 'wrong7', 32, 0, NULL),
(926, 'wrong7', 32, 0, NULL),
(927, 'wrong7', 32, 0, NULL),
(928, 'wrong7', 32, 0, NULL),
(929, 'wrong7', 33, 1, NULL),
(930, 'wrong7', 33, 0, NULL),
(931, 'wrong7', 33, 0, NULL),
(932, 'wrong7', 33, 0, NULL),
(933, 'wrong7', 33, 0, NULL),
(934, 'wrong7', 33, 0, NULL),
(935, 'wrong7', 34, 1, NULL),
(936, 'wrong7', 34, 0, NULL),
(937, 'wrong7', 34, 0, NULL),
(938, 'wrong7', 34, 0, NULL),
(939, 'wrong7', 34, 0, NULL),
(940, 'wrong7', 34, 0, NULL),
(941, 'wrong7', 35, 1, NULL),
(942, 'wrong7', 35, 0, NULL),
(943, 'wrong7', 35, 0, NULL),
(944, 'wrong7', 35, 0, NULL),
(945, 'wrong7', 35, 0, NULL),
(946, 'wrong7', 35, 0, NULL),
(947, 'Barack Obama', 36, 1, NULL),
(948, 'Hillary Clinton', 36, 0, NULL),
(949, 'Joseph Biden', 36, 0, NULL),
(950, 'Donald Trump', 36, 0, NULL),
(951, 'Bill Clinton', 36, 0, NULL),
(952, 'George Bush', 36, 0, NULL),
(953, 'George Bush', 37, 1, NULL),
(954, 'Barack Obama', 37, 0, NULL),
(955, 'Mike Pence', 37, 0, NULL),
(956, 'Bill Clinton', 37, 0, NULL),
(957, 'Al Gore', 37, 0, NULL),
(958, 'John McCain', 37, 0, NULL),
(963, '4', 109, 1, '65552602-3723-11e7-8b17-d0bf9cde7694'),
(964, '3', 109, 0, '6555c445-3723-11e7-8b17-d0bf9cde7694'),
(965, '2', 109, 0, '6556032c-3723-11e7-8b17-d0bf9cde7694'),
(966, '5', 109, 0, '6556400d-3723-11e7-8b17-d0bf9cde7694'),
(967, '6', 109, 0, '65567ea8-3723-11e7-8b17-d0bf9cde7694'),
(968, '0', 109, 0, '6556c4d2-3723-11e7-8b17-d0bf9cde7694'),
(969, '10', 110, 1, '752959d5-3723-11e7-8b17-d0bf9cde7694'),
(970, '11', 110, 0, '75299a5c-3723-11e7-8b17-d0bf9cde7694'),
(971, '9', 110, 0, '7529d31a-3723-11e7-8b17-d0bf9cde7694'),
(972, '8', 110, 0, '752a097b-3723-11e7-8b17-d0bf9cde7694'),
(973, '12', 110, 0, '752a4342-3723-11e7-8b17-d0bf9cde7694');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `avatars`
--

CREATE TABLE `avatars` (
  `id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `avatars`
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
-- Tabellenstruktur für Tabelle `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(13) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'default.png',
  `amount_questions` int(11) NOT NULL DEFAULT '8',
  `tries` int(11) NOT NULL DEFAULT '5',
  `passed_at` decimal(3,2) NOT NULL DEFAULT '0.60'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `categories`
--

INSERT INTO `categories` (`id`, `category`, `image`, `amount_questions`, `tries`, `passed_at`) VALUES
(0, 'Mixed', 'mixed_category.png', 8, 5, '0.60'),
(1, 'Geography', 'cat1.png', 8, 5, '0.90'),
(2, 'Sports', 'cat2.png', 8, 5, '0.60'),
(3, 'Politics', 'cat3.png', 8, 5, '0.60'),
(4, 'Entertainment', 'cat4.png', 8, 5, '0.60'),
(5, 'Travel', 'cat5.png', 8, 5, '0.60'),
(6, 'Food', 'cat6.png', 8, 500, '0.60'),
(7, 'Animals', 'cat7.png', 8, 5, '0.60'),
(8, 'Programming', 'cat8.png', 8, 3, '0.90'),
(12, 'Test category', 'default.png', 2, 1000, '0.50');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `classes`
--

INSERT INTO `classes` (`id`, `name`, `from`, `to`) VALUES
(1, 'SS2017', '2017-02-12', '2017-05-12');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(200) NOT NULL,
  `FK_categories` int(11) NOT NULL,
  `id_string` varchar(255) DEFAULT NULL,
  `answers_displayed` int(11) NOT NULL DEFAULT '4'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `questions`
--

INSERT INTO `questions` (`id`, `question`, `FK_categories`, `id_string`, `answers_displayed`) VALUES
(3, 'Who is the new President of France?', 3, NULL, 4),
(4, 'What is the funniest animal on Youtube?', 3, NULL, 4),
(5, 'How many countries are there in the world?', 5, NULL, 4),
(6, 'What is the signature dish from Austria?', 6, NULL, 4),
(7, 'Who is the most famous celebrity from Austria?', 4, NULL, 4),
(8, 'Which country is furthest north?', 1, NULL, 4),
(9, 'Which country does not share a border with France?', 1, NULL, 4),
(10, 'How many countries border Thailand?', 1, NULL, 4),
(11, 'Which continent is Egypt located in?', 1, NULL, 4),
(12, 'Which country does not speak Spanish as a primary language?', 1, NULL, 4),
(13, 'What is the capital city of Germany?', 1, NULL, 4),
(14, 'What is the capital city of Turkey?', 1, NULL, 4),
(15, 'What is the capital of the European Union?', 1, NULL, 4),
(16, 'Which countries border the USA?', 1, NULL, 4),
(24, 'Which is the most famous soccer team in Germany?', 2, NULL, 3),
(25, 'Who is the best soccer player in the world?', 2, NULL, 4),
(26, 'What sport was brought to Japan by the Americans during World War 2?', 2, NULL, 4),
(27, 'Which NBA basketball team is from New York?', 2, NULL, 4),
(28, 'How many points are scored for a free-throw shot in basketball?', 2, NULL, 4),
(29, 'Which baseball team is from New York?', 2, NULL, 4),
(30, 'Which hockey team is from New York City?', 2, NULL, 4),
(31, 'What is the primary color of Bayern Munchen?', 2, NULL, 4),
(32, 'How many players are on the field for the defensive team in baseball?', 2, NULL, 4),
(33, 'How many quarterbacks are on the field in American Football?', 2, NULL, 4),
(34, 'How many points are scored from one Touchdown in American Football?', 2, NULL, 4),
(35, 'How many runs are scored in baseball from a Grand Slam?', 2, NULL, 4),
(36, 'Who was the 44th President of the USA?', 3, NULL, 4),
(37, 'Who was the 43rd President of the USA?', 3, NULL, 4),
(38, 'Who is the President of Austria?', 3, NULL, 4),
(39, 'Who is the Chancellor of Germany?', 3, NULL, 4),
(40, 'How many Senators are in the Congress of the USA?', 3, NULL, 4),
(41, 'Which political party has the most seats in the Parliament of Iceland?', 3, NULL, 4),
(42, 'test question?', 3, NULL, 4),
(43, 'test question?', 3, NULL, 4),
(44, 'test question?', 3, NULL, 4),
(45, 'test question?', 3, NULL, 4),
(46, 'test question?', 3, NULL, 4),
(47, 'test question?', 3, NULL, 4),
(48, 'How many Terminator films have been produced?', 4, NULL, 4),
(49, 'Which famous actor is from Australia?', 4, NULL, 4),
(50, 'What is the setting of the famous D-Day invasion scene of the film Saving Private Ryan?', 4, NULL, 4),
(51, 'Which company produces the Terminator machines?', 4, NULL, 4),
(52, 'What is the primary city depicted in the film The Sound of Music?', 4, NULL, 4),
(53, 'What year was the film Terminator 2 released?', 4, NULL, 4),
(54, 'test question?', 4, NULL, 4),
(55, 'test question?', 4, NULL, 4),
(56, 'test question?', 4, NULL, 4),
(57, 'test question?', 4, NULL, 4),
(58, 'test question?', 4, NULL, 4),
(59, 'test question?', 4, NULL, 4),
(60, 'test question?', 5, NULL, 4),
(61, 'test question?', 5, NULL, 4),
(62, 'test question?', 5, NULL, 4),
(63, 'test question?', 5, NULL, 4),
(64, 'test question?', 5, NULL, 4),
(65, 'test question?', 5, NULL, 4),
(66, 'test question?', 5, NULL, 4),
(67, 'test question?', 5, NULL, 4),
(68, 'test question?', 5, NULL, 4),
(69, 'test question?', 5, NULL, 4),
(70, 'test question?', 5, NULL, 4),
(71, 'test question?', 5, NULL, 4),
(74, 'test question?', 6, NULL, 4),
(75, 'test question?', 6, NULL, 4),
(76, 'test question?', 6, NULL, 4),
(77, 'test question?', 6, NULL, 4),
(78, 'test question?', 6, NULL, 4),
(79, 'test question?', 6, NULL, 4),
(80, 'test question?', 6, NULL, 4),
(81, 'test question?', 6, NULL, 4),
(82, 'test question?', 6, NULL, 4),
(83, 'test question?', 6, NULL, 4),
(85, 'test question?', 7, NULL, 4),
(86, 'test question?', 7, NULL, 4),
(87, 'test question?', 7, NULL, 4),
(88, 'test question?', 7, NULL, 4),
(89, 'test question?', 7, NULL, 4),
(90, 'test question?', 7, NULL, 4),
(91, 'test question?', 7, NULL, 4),
(92, 'test question?', 7, NULL, 4),
(93, 'test question?', 7, NULL, 4),
(94, 'test question?', 7, NULL, 4),
(95, 'test question?', 7, NULL, 4),
(96, 'test question?', 8, NULL, 4),
(97, 'test question?', 8, NULL, 4),
(98, 'test question?', 8, NULL, 4),
(99, 'test question?', 8, NULL, 4),
(100, 'test question?', 8, NULL, 4),
(101, 'test question?', 8, NULL, 4),
(102, 'test question?', 8, NULL, 4),
(103, 'test question?', 8, NULL, 4),
(104, 'test question?', 8, NULL, 4),
(105, 'test question?', 8, NULL, 4),
(106, 'test question?', 8, NULL, 4),
(107, 'test question?', 8, NULL, 4),
(109, '2+2', 12, '6554b089-3723-11e7-8b17-d0bf9cde7694', 2),
(110, '5+5', 12, '7528e509-3723-11e7-8b17-d0bf9cde7694', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL,
  `FK_users` int(11) NOT NULL,
  `FK_categories` int(11) NOT NULL,
  `scores` decimal(3,2) DEFAULT NULL,
  `start_timestamp` datetime NOT NULL,
  `end_timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `quizzes`
--

INSERT INTO `quizzes` (`id`, `FK_users`, `FK_categories`, `scores`, `start_timestamp`, `end_timestamp`) VALUES
(1, 1, 0, '0.90', '2017-05-12 09:14:20', NULL),
(2, 1, 0, '1.00', '2017-05-10 23:14:20', NULL),
(3, 1, 4, '0.88', '2017-05-12 09:14:20', NULL),
(4, 1, 4, '0.80', '2017-05-10 23:14:20', NULL),
(5, 1, 4, '0.80', '2017-05-10 23:14:20', NULL),
(6, 1, 2, '0.73', '2017-05-12 09:14:20', NULL),
(7, 1, 7, '0.91', '2017-05-12 09:14:20', NULL),
(8, 1, 1, '0.52', '2017-05-12 09:14:20', NULL),
(9, 1, 5, '0.43', '2017-05-12 09:14:20', NULL),
(10, 1, 3, '0.39', '2017-05-12 09:14:20', NULL),
(11, 1, 0, '0.08', '2017-05-10 23:14:20', NULL),
(12, 1, 8, '0.10', '2017-05-12 09:14:20', NULL),
(13, 1, 6, '0.65', '2017-05-12 09:14:20', NULL),
(14, 1, 4, '0.25', '2017-05-10 23:14:20', NULL),
(16, 1, 7, '0.84', '2017-05-10 23:14:20', NULL),
(17, 1, 3, '0.72', '2017-05-10 23:14:20', NULL),
(18, 1, 2, '0.62', '2017-05-10 23:14:20', NULL),
(19, 1, 5, '0.51', '2017-05-10 23:14:20', NULL),
(20, 1, 8, '0.44', '2017-05-10 23:14:20', NULL),
(21, 1, 6, '0.37', '2017-05-10 23:14:20', NULL),
(22, 1, 2, '0.22', '2017-05-10 23:14:20', NULL),
(23, 1, 4, '0.10', '2017-05-10 23:14:20', NULL),
(24, 1, 0, '0.05', '2017-05-10 23:14:20', NULL),
(25, 1, 8, '0.96', '2017-05-10 23:14:20', NULL),
(26, 1, 4, '0.82', '2017-05-10 23:14:20', NULL),
(27, 1, 2, '0.70', '2017-05-10 23:14:20', NULL),
(28, 1, 7, '0.98', '2017-05-10 23:14:20', NULL),
(29, 1, 1, '0.50', '2017-05-10 23:14:20', NULL),
(30, 1, 5, '0.43', '2017-05-10 23:14:20', NULL),
(31, 1, 3, '0.31', '2017-05-10 23:14:20', NULL),
(32, 1, 0, '0.02', '2017-05-10 23:14:20', NULL),
(33, 1, 8, '0.19', '2017-05-10 23:14:20', NULL),
(34, 1, 6, '0.68', '2017-05-10 23:14:20', NULL),
(35, 1, 4, '0.20', '2017-05-10 23:14:20', NULL),
(36, 1, 1, '1.70', '2017-05-10 23:14:20', NULL),
(37, 1, 7, '0.80', '2017-05-10 23:14:20', NULL),
(38, 1, 3, '0.76', '2017-05-10 23:14:20', NULL),
(39, 1, 2, '0.65', '2017-05-10 23:14:20', NULL),
(40, 1, 5, '0.50', '2017-05-10 23:14:20', NULL),
(41, 1, 8, '0.40', '2017-05-10 23:14:20', NULL),
(42, 1, 6, '0.34', '2017-05-10 23:14:20', NULL),
(43, 1, 2, '0.20', '2017-05-10 23:14:20', NULL),
(44, 1, 4, '0.10', '2017-05-10 23:14:20', NULL),
(45, 1, 0, '0.03', '2017-05-10 23:14:20', NULL),
(46, 1, 8, '0.90', '2017-05-10 23:14:20', NULL),
(47, 1, 4, '0.80', '2017-05-10 23:14:20', NULL),
(48, 1, 2, '0.76', '2017-05-10 23:14:20', NULL),
(49, 1, 7, '0.90', '2017-05-10 23:14:20', NULL),
(50, 1, 1, '0.50', '2017-05-10 23:14:20', NULL),
(51, 1, 5, '0.48', '2017-05-10 23:14:20', NULL),
(52, 1, 3, '0.32', '2017-05-10 23:14:20', NULL),
(53, 1, 0, '0.00', '2017-05-10 23:14:20', NULL),
(54, 1, 8, '0.10', '2017-05-10 23:14:20', NULL),
(55, 1, 6, '0.63', '2017-05-10 23:14:20', NULL),
(56, 1, 4, '0.20', '2017-05-10 23:14:20', NULL),
(57, 1, 1, '1.00', '2017-05-10 23:14:20', NULL),
(58, 1, 7, '0.81', '2017-05-10 23:14:20', NULL),
(59, 1, 3, '0.70', '2017-05-10 23:14:20', NULL),
(60, 1, 2, '0.60', '2017-05-10 23:14:20', NULL),
(61, 1, 5, '0.51', '2017-05-10 23:14:20', NULL),
(62, 1, 8, '0.42', '2017-05-10 23:14:20', NULL),
(63, 1, 6, '0.33', '2017-05-10 23:14:20', NULL),
(64, 1, 2, '0.24', '2017-05-10 23:14:20', NULL),
(65, 1, 4, '0.16', '2017-05-10 23:14:20', NULL),
(66, 1, 0, '0.05', '2017-05-10 23:14:20', NULL),
(67, 1, 8, '0.97', '2017-05-10 23:14:20', NULL),
(68, 1, 4, '0.86', '2017-05-10 23:14:20', NULL),
(69, 1, 2, '0.78', '2017-05-10 23:14:20', NULL),
(70, 1, 7, '0.99', '2017-05-10 23:14:20', NULL),
(71, 1, 1, '0.51', '2017-05-10 23:14:20', NULL),
(72, 1, 5, '0.42', '2017-05-10 23:14:20', NULL),
(73, 1, 3, '0.30', '2017-05-10 23:14:20', NULL),
(74, 1, 0, '0.03', '2017-05-10 23:14:20', NULL),
(75, 1, 8, '0.10', '2017-05-10 23:14:20', NULL),
(76, 1, 6, '0.65', '2017-05-10 23:14:20', NULL),
(77, 1, 4, '0.26', '2017-05-10 23:14:20', NULL),
(78, 1, 1, '1.00', '2017-05-10 23:14:20', NULL),
(79, 1, 7, '0.86', '2017-05-10 23:14:20', NULL),
(80, 1, 3, '0.77', '2017-05-10 23:14:20', NULL),
(81, 1, 2, '0.68', '2017-05-10 23:14:20', NULL),
(82, 1, 5, '0.59', '2017-05-10 23:14:20', NULL),
(83, 1, 8, '0.40', '2017-05-10 23:14:20', NULL),
(84, 1, 6, '0.31', '2017-05-10 23:14:20', NULL),
(85, 1, 2, '0.22', '2017-05-10 23:14:20', NULL),
(86, 1, 4, '0.13', '2017-05-10 23:14:20', NULL),
(87, 1, 0, '0.04', '2017-05-10 23:14:20', NULL),
(88, 1, 8, '0.95', '2017-05-10 23:14:20', NULL),
(89, 1, 4, '0.86', '2017-05-10 23:14:20', NULL),
(90, 1, 2, '0.77', '2017-05-10 23:14:20', NULL),
(91, 1, 7, '0.98', '2017-05-10 23:14:20', NULL),
(92, 1, 1, '0.59', '2017-05-10 23:14:20', NULL),
(93, 1, 5, '0.40', '2017-05-10 23:14:20', NULL),
(94, 1, 3, '0.31', '2017-05-10 23:14:20', NULL),
(95, 1, 0, '0.02', '2017-05-10 23:14:20', NULL),
(96, 1, 8, '0.13', '2017-05-10 23:14:20', NULL),
(97, 1, 6, '0.68', '2017-05-10 23:14:20', NULL),
(98, 1, 4, '0.23', '2017-05-10 23:14:20', NULL),
(99, 1, 1, '1.00', '2017-05-10 23:14:20', NULL),
(100, 1, 7, '0.82', '2017-05-10 23:14:20', NULL),
(101, 1, 3, '0.71', '2017-05-10 23:14:20', NULL),
(102, 1, 2, '0.64', '2017-05-10 23:14:20', NULL),
(103, 1, 5, '0.55', '2017-05-10 23:14:20', NULL),
(104, 1, 8, '0.42', '2017-05-10 23:14:20', NULL),
(105, 1, 6, '0.37', '2017-05-10 23:14:20', NULL),
(106, 1, 2, '0.28', '2017-05-10 23:14:20', NULL),
(107, 1, 4, '0.15', '2017-05-10 23:14:20', NULL),
(108, 1, 0, '0.03', '2017-05-10 23:14:20', NULL),
(109, 1, 8, '0.92', '2017-05-10 23:14:20', NULL),
(110, 1, 1, '0.55', '2017-05-10 23:14:20', NULL),
(111, 2, 4, '0.83', '2017-05-08 13:18:00', NULL),
(112, 2, 7, '0.52', '2017-05-08 13:18:00', NULL),
(113, 2, 0, '0.43', '2017-05-08 13:18:00', NULL),
(114, 2, 1, '0.25', '2017-05-08 13:18:00', NULL),
(115, 2, 3, '0.65', '2017-05-08 13:18:00', NULL),
(116, 2, 2, '0.62', '2017-05-08 13:18:00', NULL),
(117, 2, 5, '0.44', '2017-05-08 13:18:00', NULL),
(118, 2, 6, '0.96', '2017-05-08 13:18:00', NULL),
(119, 2, 8, '0.92', '2017-05-08 13:18:00', NULL),
(120, 3, 4, '0.13', '2017-05-07 22:15:00', NULL),
(121, 3, 7, '0.12', '2017-05-07 22:15:00', NULL),
(122, 3, 0, '0.13', '2017-05-07 22:15:00', NULL),
(123, 3, 1, '0.15', '2017-05-07 22:15:00', NULL),
(124, 3, 3, '0.15', '2017-05-07 22:15:00', NULL),
(125, 3, 2, '0.12', '2017-05-07 22:15:00', NULL),
(126, 3, 5, '0.14', '2017-05-07 22:15:00', NULL),
(127, 3, 6, '0.16', '2017-05-07 22:15:00', NULL),
(128, 3, 8, '0.12', '2017-05-07 22:15:00', NULL),
(129, 4, 4, '0.53', '2017-05-06 22:15:00', NULL),
(130, 4, 7, '0.52', '2017-05-06 22:15:00', NULL),
(131, 4, 0, '0.15', '2017-05-06 22:15:00', NULL),
(132, 4, 1, '0.15', '2017-05-06 22:15:00', NULL),
(133, 4, 3, '0.55', '2017-05-06 22:15:00', NULL),
(134, 4, 2, '0.15', '2017-05-06 22:15:00', NULL),
(135, 4, 5, '0.14', '2017-05-06 22:15:00', NULL),
(136, 4, 6, '0.56', '2017-05-06 22:15:00', NULL),
(137, 4, 8, '0.15', '2017-05-06 22:15:00', NULL),
(138, 5, 4, '0.03', '2017-05-07 21:14:20', NULL),
(139, 5, 7, '0.52', '2017-05-07 21:14:20', NULL),
(140, 5, 0, '0.15', '2017-05-07 21:14:20', NULL),
(141, 5, 5, '0.25', '2017-05-07 21:14:20', NULL),
(142, 5, 3, '0.20', '2017-05-07 21:14:20', NULL),
(143, 5, 2, '0.25', '2017-05-07 21:14:20', NULL),
(144, 5, 1, '0.24', '2017-05-07 21:14:20', NULL),
(145, 5, 8, '0.52', '2017-05-07 21:14:20', NULL),
(146, 5, 6, '0.25', '2017-05-07 21:14:20', NULL),
(147, 6, 1, '0.83', '2017-05-01 09:14:20', NULL),
(148, 6, 7, '0.52', '2017-05-01 09:14:20', NULL),
(149, 6, 0, '0.18', '2017-05-01 09:14:20', NULL),
(150, 6, 5, '0.85', '2017-05-01 09:14:20', NULL),
(151, 6, 2, '0.20', '2017-05-01 09:14:20', NULL),
(152, 6, 3, '0.28', '2017-05-01 09:14:20', NULL),
(153, 6, 4, '0.24', '2017-05-01 09:14:20', NULL),
(154, 6, 8, '0.52', '2017-05-01 09:14:20', NULL),
(155, 6, 6, '0.85', '2017-05-01 09:14:20', NULL),
(156, 7, 1, '0.13', '2017-04-01 08:14:20', NULL),
(157, 7, 6, '0.58', '2017-04-01 08:14:20', NULL),
(158, 7, 3, '0.38', '2017-04-01 08:14:20', NULL),
(159, 7, 5, '0.85', '2017-04-01 08:14:20', NULL),
(160, 7, 4, '0.52', '2017-04-01 08:14:20', NULL),
(161, 7, 0, '0.28', '2017-04-01 08:14:20', NULL),
(162, 7, 2, '0.27', '2017-04-01 08:14:20', NULL),
(163, 7, 8, '0.52', '2017-04-01 08:14:20', NULL),
(164, 7, 7, '0.45', '2017-04-01 08:14:20', NULL),
(165, 8, 7, '0.93', '2017-04-19 08:14:20', NULL),
(166, 8, 6, '0.78', '2017-04-19 08:14:20', NULL),
(167, 8, 5, '0.38', '2017-04-19 08:14:20', NULL),
(168, 8, 3, '0.97', '2017-04-19 08:14:20', NULL),
(169, 8, 4, '0.57', '2017-04-19 08:14:20', NULL),
(170, 8, 2, '0.78', '2017-04-19 08:14:20', NULL),
(171, 8, 0, '0.27', '2017-04-19 08:14:20', NULL),
(172, 8, 8, '0.92', '2017-04-19 08:14:20', NULL),
(173, 8, 1, '0.47', '2017-04-19 08:14:20', NULL),
(176, 1, 2, NULL, '2017-05-10 23:14:20', NULL),
(177, 1, 1, '0.10', '2017-05-10 17:45:55', '2017-05-10 17:46:05'),
(179, 1, 1, '1.00', '2017-05-11 17:07:12', '2017-05-11 17:08:02'),
(180, 1, 1, '0.67', '2017-05-11 17:10:05', '2017-05-11 17:10:09'),
(181, 1, 1, '0.44', '2017-05-11 17:12:33', '2017-05-11 17:12:38'),
(182, 1, 1, '0.11', '2017-05-11 17:18:37', '2017-05-11 17:18:58'),
(183, 1, 8, NULL, '2017-05-11 17:33:26', NULL),
(184, 1, 12, '1.00', '2017-05-12 16:59:14', '2017-05-12 17:00:25'),
(185, 1, 12, '0.00', '2017-05-12 17:09:46', '2017-05-12 17:09:50'),
(186, 1, 12, '0.00', '2017-05-12 17:10:30', '2017-05-12 17:10:36'),
(187, 1, 12, '0.50', '2017-05-12 17:11:31', '2017-05-12 17:11:34'),
(188, 1, 12, '0.00', '2017-05-12 17:14:25', '2017-05-12 17:14:29'),
(189, 1, 12, '0.50', '2017-05-12 17:18:11', '2017-05-12 17:18:15'),
(190, 1, 12, '0.50', '2017-05-12 17:27:54', '2017-05-12 17:27:55'),
(191, 1, 12, '0.50', '2017-05-12 18:17:19', '2017-05-12 18:17:22'),
(192, 1, 12, '0.00', '2017-05-12 18:17:29', '2017-05-12 18:17:34');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL,
  `FK_quizzes` int(11) NOT NULL,
  `FK_questions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `FK_quizzes`, `FK_questions`) VALUES
(1, 177, 10),
(2, 177, 8),
(3, 177, 9),
(4, 177, 15),
(5, 177, 11),
(7, 177, 14),
(8, 177, 13),
(9, 177, 16),
(10, 177, 12),
(20, 179, 10),
(21, 179, 8),
(22, 179, 9),
(23, 179, 15),
(24, 179, 12),
(25, 179, 11),
(26, 179, 16),
(27, 179, 13),
(28, 179, 14),
(29, 180, 14),
(30, 180, 16),
(31, 180, 10),
(32, 180, 15),
(33, 180, 12),
(34, 180, 9),
(35, 180, 11),
(36, 180, 8),
(37, 180, 13),
(38, 181, 15),
(39, 181, 10),
(40, 181, 14),
(41, 181, 11),
(42, 181, 8),
(43, 181, 12),
(44, 181, 16),
(45, 181, 9),
(46, 181, 13),
(47, 182, 12),
(48, 182, 11),
(49, 182, 13),
(50, 182, 8),
(51, 182, 10),
(52, 182, 14),
(53, 182, 15),
(54, 182, 16),
(55, 182, 9),
(56, 183, 107),
(57, 183, 103),
(58, 183, 102),
(59, 183, 100),
(60, 183, 97),
(61, 183, 105),
(62, 183, 98),
(63, 183, 101),
(64, 183, 99),
(65, 183, 106),
(66, 184, 110),
(67, 184, 109),
(68, 185, 110),
(69, 185, 109),
(70, 186, 109),
(71, 186, 110),
(72, 187, 110),
(73, 187, 109),
(74, 188, 109),
(75, 188, 110),
(76, 189, 109),
(77, 189, 110),
(78, 190, 109),
(79, 190, 110),
(80, 191, 110),
(81, 191, 109),
(82, 192, 110),
(83, 192, 109);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `FK_avatars` int(11) NOT NULL,
  `FK_classes` int(11) NOT NULL DEFAULT '1',
  `nickname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `family_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL DEFAULT '1993-07-30'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `FK_avatars`, `FK_classes`, `nickname`, `email`, `password`, `first_name`, `family_name`, `date_of_birth`) VALUES
(1, 6, 1, 'Admin', 'admin@CodeBus.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Max', 'Mustermann', '1993-07-30'),
(2, 1, 1, 'Goran', 'goran.stevic@codebus.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Goran', 'Stevic', '1993-07-30'),
(3, 1, 1, 'Igor', 'igor.stevic@codebus.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Igor', 'Stevic', '1993-07-30'),
(4, 2, 1, 'Lisa', 'lisa.duschek@codebus.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Lisa', 'Duschek', '1993-07-30'),
(5, 2, 1, 'Nathalie', 'nathalie.stiefsohn@codemasters.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Nathalie', 'Stiefsohn', '1993-07-30'),
(6, 1, 1, 'Nicky', 'nicky.pallas@codemasters.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Nicky', 'Pallas', '1993-07-30'),
(7, 1, 1, 'Test', 'test@test.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Test', 'Test', '1993-07-30'),
(8, 1, 1, 'Christoph', 'chris@test.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Christoph', 'Test', '1993-07-30'),
(9, 2, 1, 'Ema', 'ema@test.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Ema', 'Test', '1993-07-30'),
(10, 5, 1, 'funnynati1', 'funnynati1@hotmail.com', '16954afbacd788f977ef6e8da44d5d7df5eb9098b71bdbbb40596b0c2e3191f6', 'Nathalie', 'Stiefsohn', '1993-07-30'),
(11, 1, 1, '', '$email', '$password', '$first_name', '$family_name', '1993-07-30'),
(12, 2, 1, '', 'maria@musterfrau.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Maria', 'Musterfrau', '2017-03-14');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`FK_users`),
  ADD KEY `id` (`id`,`FK_users`);

--
-- Indizes für die Tabelle `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answer` (`answer`),
  ADD KEY `FK_question` (`FK_question`),
  ADD KEY `correct` (`correct`);

--
-- Indizes für die Tabelle `avatars`
--
ALTER TABLE `avatars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `FK_categories` (`FK_categories`);

--
-- Indizes für die Tabelle `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `users` (`FK_users`),
  ADD KEY `FK_categories` (`FK_categories`);

--
-- Indizes für die Tabelle `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`FK_quizzes`,`FK_questions`),
  ADD KEY `FK_questions` (`FK_questions`),
  ADD KEY `FK_quizzes` (`FK_quizzes`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_avatars` (`FK_avatars`),
  ADD KEY `id` (`id`,`FK_avatars`),
  ADD KEY `FK_classes` (`FK_classes`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=974;
--
-- AUTO_INCREMENT für Tabelle `avatars`
--
ALTER TABLE `avatars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT für Tabelle `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT für Tabelle `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;
--
-- AUTO_INCREMENT für Tabelle `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`FK_users`) REFERENCES `users` (`id`);

--
-- Constraints der Tabelle `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`FK_question`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`FK_categories`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`FK_users`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_2` FOREIGN KEY (`FK_categories`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `quiz_questions_ibfk_3` FOREIGN KEY (`FK_questions`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quiz_questions_ibfk_4` FOREIGN KEY (`FK_quizzes`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`FK_avatars`) REFERENCES `avatars` (`id`),
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`FK_classes`) REFERENCES `classes` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
