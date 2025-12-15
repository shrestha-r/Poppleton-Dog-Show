-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2020 at 12:25 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cis2360_dog_show`
--

-- --------------------------------------------------------

--
-- Table structure for table `breeds`
--

CREATE TABLE `breeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `breeds`
--

INSERT INTO `breeds` (`id`, `name`) VALUES
(1, 'Bulldog'),
(2, 'Chihuahua'),
(3, 'Terrier'),
(4, 'Mastiff'),
(5, 'Bloodhound'),
(6, 'Beagle'),
(7, 'Labrador'),
(8, 'Great Dane'),
(9, 'Irish Wolfhound'),
(10, 'Lurcher'),
(11, 'Poodle'),
(12, 'Pug'),
(13, 'Chow'),
(14, 'Greyhound'),
(15, 'Husky'),
(16, 'Spaniel'),
(17, 'Boxer'),
(18, 'Dachshund'),
(19, 'American Bulldog'),
(20, 'Pomeranian'),
(21, 'Rottweiler'),
(22, 'Labradoodle'),
(23, 'Mongrel');

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE `competitions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `day` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amOrPm` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `chief_judge_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`id`, `day`, `amOrPm`, `event_id`, `chief_judge_id`) VALUES
(1, 'Wednesday', 'pm', 1, 23),
(2, 'Friday', 'am', 9, 4),
(3, 'Wednesday', 'am', 9, 15),
(4, 'Monday', 'am', 5, 3),
(5, 'Sunday', 'pm', 10, 25),
(6, 'Friday', 'pm', 2, 25),
(7, 'Thursday', 'pm', 4, 19),
(8, 'Sunday', 'pm', 1, 25),
(9, 'Tuesday', 'am', 9, 12),
(10, 'Wednesday', 'am', 6, 19),
(11, 'Friday', 'pm', 2, 15),
(12, 'Wednesday', 'am', 1, 16),
(13, 'Wednesday', 'am', 7, 25),
(14, 'Monday', 'pm', 5, 21),
(15, 'Wednesday', 'am', 10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `dogs`
--

CREATE TABLE `dogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `breed_id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dogs`
--

INSERT INTO `dogs` (`id`, `name`, `breed_id`, `owner_id`) VALUES
(1, 'Kieran', 1, 12),
(2, 'Alexa', 8, 36),
(3, 'Leah', 4, 2),
(4, 'Sonia', 1, 15),
(5, 'Darren', 9, 27),
(6, 'Jack', 18, 42),
(7, 'Jonathan', 4, 6),
(8, 'Cameron', 20, 17),
(9, 'Millie', 23, 39),
(10, 'Natalie', 21, 41),
(11, 'Anthony', 17, 4),
(12, 'Emily', 21, 1),
(13, 'Cameron', 22, 49),
(14, 'Emily', 6, 35),
(15, 'Aiden', 11, 10),
(16, 'Eva', 21, 32),
(17, 'Isla', 13, 35),
(18, 'Anthony', 23, 26),
(19, 'Callum', 4, 17),
(20, 'Isla', 6, 9),
(21, 'Harvey', 16, 39),
(22, 'Aaron', 1, 49),
(23, 'Henry', 18, 7),
(24, 'Ruby', 4, 44),
(25, 'Rosie', 23, 7),
(26, 'Matilda', 9, 24),
(27, 'Rowena', 18, 24),
(28, 'Benjamin', 1, 17),
(29, 'Jodie', 7, 30),
(30, 'Liam', 22, 40),
(31, 'George', 20, 27),
(32, 'Freddie', 5, 47),
(33, 'Frank', 15, 24),
(34, 'Ellie', 6, 9),
(35, 'Jack', 23, 30),
(36, 'Erin', 23, 1),
(37, 'Amber', 21, 38),
(38, 'Freddie', 18, 3),
(39, 'Bradley', 15, 18),
(40, 'Harrison', 19, 17),
(41, 'Gordon', 12, 49),
(42, 'Tyler', 14, 24),
(43, 'Finley', 9, 29),
(44, 'Joseph', 9, 28),
(45, 'Jason', 13, 49),
(46, 'Terry', 2, 26),
(47, 'Mason', 6, 11),
(48, 'Olivia', 12, 28),
(49, 'Jake', 17, 1),
(50, 'Nick', 18, 35),
(51, 'Quentin', 14, 24),
(52, 'Charlie', 16, 50),
(53, 'Damien', 20, 27),
(54, 'Oliver', 18, 49),
(55, 'Tara', 14, 29),
(56, 'Jacob', 22, 23),
(57, 'Linda', 14, 9),
(58, 'Theo', 23, 34),
(59, 'Jonathan', 17, 14),
(60, 'Adrian', 9, 11),
(61, 'Alan', 12, 27),
(62, 'Rob', 21, 10),
(63, 'Gavin', 19, 13),
(64, 'Colin', 11, 31),
(65, 'Joshua', 12, 44),
(66, 'Georgia', 15, 2),
(67, 'Jason', 23, 43),
(68, 'Joseph', 16, 20),
(69, 'Scott', 7, 32),
(70, 'Tanya', 16, 14),
(71, 'Claire', 12, 12),
(72, 'Shannon', 8, 35),
(73, 'Kimberly', 19, 34),
(74, 'Riley', 7, 28),
(75, 'Samuel', 22, 38),
(76, 'Duncan', 2, 48),
(77, 'Wayne', 20, 14),
(78, 'Harvey', 9, 15),
(79, 'Megan', 15, 33),
(80, 'Leo', 19, 2),
(81, 'Yvette', 18, 8),
(82, 'Eva', 12, 45),
(83, 'Harley', 9, 41),
(84, 'Candice', 23, 16),
(85, 'Zach', 11, 42),
(86, 'Isla', 9, 49),
(87, 'Elliot', 2, 31),
(88, 'Finley', 14, 37),
(89, 'Paul', 22, 7),
(90, 'Eden', 2, 13),
(91, 'Harvey', 8, 12),
(92, 'Owen', 22, 18),
(93, 'Kirsty', 18, 46),
(94, 'Ruby', 10, 21),
(95, 'Tina', 8, 34),
(96, 'Andy', 4, 17),
(97, 'Theo', 23, 43),
(98, 'Max', 15, 17),
(99, 'Amelia', 7, 12),
(100, 'Lola', 16, 28),
(101, 'Maisie', 16, 41),
(102, 'Darren', 6, 14),
(103, 'Gordon', 6, 5),
(104, 'Ava', 8, 34),
(105, 'Isabel', 10, 48),
(106, 'Mandy', 15, 6),
(107, 'Henry', 17, 42),
(108, 'Ryan', 3, 15),
(109, 'Joanne', 16, 1),
(110, 'Caroline', 13, 32),
(111, 'Alex', 12, 40),
(112, 'Lexi', 3, 21),
(113, 'Greg', 17, 33),
(114, 'Elizabeth', 12, 50),
(115, 'Jonathan', 16, 31),
(116, 'Edward', 5, 3),
(117, 'Sasha', 23, 2),
(118, 'Callum', 1, 17),
(119, 'Elsie', 20, 5),
(120, 'Alexandra', 21, 24),
(121, 'Dominic', 9, 21),
(122, 'Shannon', 13, 5),
(123, 'Frank', 13, 31),
(124, 'Kelly', 4, 5),
(125, 'Amber', 5, 48),
(126, 'Carmen', 22, 3),
(127, 'Dylan', 6, 28),
(128, 'Lisa', 6, 50),
(129, 'Isabella', 14, 7),
(130, 'Ross', 15, 11),
(131, 'Isaac', 2, 47),
(132, 'Keeley', 20, 6),
(133, 'Greg', 23, 36),
(134, 'Graham', 7, 17),
(135, 'Jacob', 17, 23),
(136, 'Craig', 22, 13),
(137, 'Neil', 21, 35),
(138, 'Amber', 11, 15),
(139, 'Maria', 18, 47),
(140, 'Lisa', 2, 29),
(141, 'Steve', 18, 15),
(142, 'Vicky', 4, 37),
(143, 'Gordon', 15, 48),
(144, 'Leah', 7, 49),
(145, 'William', 4, 32),
(146, 'Samuel', 4, 12),
(147, 'Frank', 16, 23),
(148, 'Ruby', 3, 12),
(149, 'Dean', 12, 27),
(150, 'Cameron', 18, 14),
(151, 'Teagan', 7, 20),
(152, 'Eleanor', 8, 30),
(153, 'Daniel', 3, 47),
(154, 'Amber', 12, 47),
(155, 'Francesca', 10, 33),
(156, 'Quentin', 7, 5),
(157, 'Oscar', 8, 42),
(158, 'Aiden', 18, 25),
(159, 'Theo', 13, 4),
(160, 'Fred', 20, 44),
(161, 'Pauline', 12, 14),
(162, 'Pauline', 21, 1),
(163, 'Oliver', 4, 26),
(164, 'Ken', 6, 28),
(165, 'Oscar', 22, 41),
(166, 'Christopher', 1, 38),
(167, 'Evie', 12, 24),
(168, 'Martin', 3, 32),
(169, 'Tina', 2, 4),
(170, 'David', 1, 26),
(171, 'Dylan', 10, 42),
(172, 'Tyler', 13, 34),
(173, 'Jamie', 16, 14),
(174, 'Lucy', 22, 8),
(175, 'Sienna', 21, 1),
(176, 'Isla', 11, 18),
(177, 'Evelyn', 21, 47),
(178, 'Caitlin', 3, 39),
(179, 'Jake', 14, 33),
(180, 'Damien', 10, 20),
(181, 'Sally', 5, 15),
(182, 'Bradley', 14, 21),
(183, 'Lexi', 10, 4),
(184, 'Terry', 8, 25),
(185, 'Dean', 9, 25),
(186, 'Maisie', 19, 38),
(187, 'Philip', 16, 17),
(188, 'Ruth', 21, 36),
(189, 'Stacey', 1, 9),
(190, 'Elliot', 17, 32),
(191, 'Isla', 12, 28),
(192, 'Finley', 12, 4),
(193, 'Nikki', 1, 41),
(194, 'Isabelle', 5, 34),
(195, 'Eileen', 14, 35),
(196, 'Francesca', 6, 32),
(197, 'Helena', 10, 8),
(198, 'Teagan', 17, 18),
(199, 'Georgia', 17, 7),
(200, 'Michael', 23, 7),
(201, 'Karl', 9, 15),
(202, 'Amy', 13, 45),
(203, 'Carmen', 4, 40),
(204, 'Stefan', 17, 17),
(205, 'Isabelle', 6, 1),
(206, 'Mary', 22, 37),
(207, 'Roxanne', 9, 44),
(208, 'Eva', 12, 25),
(209, 'Sally', 23, 43),
(210, 'Amelia', 19, 22),
(211, 'Neil', 2, 44),
(212, 'Jodie', 22, 29),
(213, 'Jayden', 12, 25),
(214, 'Jackson', 20, 11),
(215, 'Andy', 6, 49),
(216, 'William', 23, 1),
(217, 'Karen', 12, 15),
(218, 'Natalie', 7, 6),
(219, 'Julia', 20, 45),
(220, 'James', 11, 36),
(221, 'Helena', 9, 1),
(222, 'Ryan', 15, 44),
(223, 'Bruce', 13, 44),
(224, 'Daisy', 17, 16),
(225, 'Tyler', 1, 9),
(226, 'Grace', 4, 28),
(227, 'Tanya', 13, 31),
(228, 'Eileen', 2, 28),
(229, 'Pete', 18, 30),
(230, 'Zach', 9, 5),
(231, 'Vicky', 19, 44),
(232, 'Linda', 11, 28),
(233, 'Tyler', 19, 9),
(234, 'Bruce', 22, 43),
(235, 'Melissa', 21, 13),
(236, 'Jonathan', 22, 10),
(237, 'Eden', 5, 10),
(238, 'Alice', 15, 1),
(239, 'Ethan', 23, 28),
(240, 'Frank', 15, 4),
(241, 'Lucy', 3, 32),
(242, 'Caitlin', 7, 16),
(243, 'Dan', 4, 27),
(244, 'Benjamin', 20, 50),
(245, 'Sally', 7, 12),
(246, 'Kyle', 5, 10),
(247, 'Sasha', 1, 6),
(248, 'Ben', 9, 25),
(249, 'Hannah', 4, 4),
(250, 'Joel', 3, 30),
(251, 'Tom', 17, 6),
(252, 'Craig', 5, 34),
(253, 'Rowena', 16, 20),
(254, 'Jack', 13, 19),
(255, 'Owen', 4, 6),
(256, 'Leo', 7, 32),
(257, 'Florence', 7, 45),
(258, 'Edward', 11, 5),
(259, 'Chelsea', 11, 4),
(260, 'Sophia', 13, 35),
(261, 'Ruth', 9, 29),
(262, 'Claire', 23, 35),
(263, 'Jodie', 20, 44),
(264, 'Isaac', 23, 13),
(265, 'Bethany', 5, 32),
(266, 'Elsie', 13, 7),
(267, 'Paula', 12, 13),
(268, 'Alfie', 2, 21),
(269, 'Chelsea', 19, 10),
(270, 'Craig', 8, 31),
(271, 'Natalie', 21, 14),
(272, 'Tom', 11, 31),
(273, 'Ruby', 7, 36),
(274, 'Tracy', 7, 37),
(275, 'Samuel', 11, 34),
(276, 'Faye', 19, 14),
(277, 'Melissa', 15, 41),
(278, 'Candice', 12, 43),
(279, 'Pauline', 19, 2),
(280, 'Alex', 13, 29),
(281, 'Connor', 18, 25),
(282, 'Scarlett', 15, 49),
(283, 'Teagan', 1, 41),
(284, 'Tanya', 5, 11),
(285, 'Henry', 15, 20),
(286, 'Frank', 16, 28),
(287, 'Louis', 19, 15),
(288, 'Ryan', 11, 36),
(289, 'Megan', 2, 21),
(290, 'Sebastian', 5, 45),
(291, 'Becky', 19, 36),
(292, 'Christian', 11, 43),
(293, 'James', 18, 31),
(294, 'Rob', 23, 35),
(295, 'Sabrina', 10, 23),
(296, 'Amelia', 6, 15),
(297, 'Riley', 7, 18),
(298, 'Chelsea', 13, 9),
(299, 'Maisie', 21, 2),
(300, 'Brandon', 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `competition_id` bigint(20) UNSIGNED NOT NULL,
  `dog_id` bigint(20) UNSIGNED NOT NULL,
  `score` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `competition_id`, `dog_id`, `score`) VALUES
(1, 15, 260, 3),
(2, 1, 183, 7),
(3, 8, 214, 9),
(4, 8, 135, 7),
(5, 13, 190, 5),
(6, 9, 265, 8),
(7, 4, 281, 8),
(8, 4, 172, 5),
(9, 5, 50, 2),
(10, 12, 217, 2),
(11, 15, 126, 8),
(12, 11, 40, 3),
(13, 12, 221, 3),
(14, 11, 18, 0),
(15, 12, 153, 8),
(16, 6, 216, 8),
(17, 15, 299, 1),
(18, 11, 154, 10),
(19, 6, 178, 2),
(20, 4, 222, 9),
(21, 5, 294, 5),
(22, 5, 46, 1),
(23, 14, 17, 10),
(24, 2, 230, 8),
(25, 8, 87, 9),
(26, 7, 228, 6),
(27, 12, 283, 5),
(28, 15, 142, 9),
(29, 5, 137, 9),
(30, 4, 160, 3),
(31, 4, 100, 9),
(32, 9, 101, 6),
(33, 10, 91, 3),
(34, 5, 275, 3),
(35, 2, 134, 5),
(36, 11, 277, 7),
(37, 12, 153, 7),
(38, 5, 89, 1),
(39, 13, 24, 7),
(40, 13, 131, 6),
(41, 11, 77, 10),
(42, 1, 166, 10),
(43, 14, 221, 4),
(44, 12, 178, 6),
(45, 3, 170, 7),
(46, 12, 23, 5),
(47, 15, 284, 10),
(48, 7, 4, 10),
(49, 15, 4, 5),
(50, 15, 267, 2),
(51, 2, 290, 9),
(52, 8, 9, 1),
(53, 1, 110, 2),
(54, 3, 67, 4),
(55, 5, 162, 5),
(56, 10, 93, 4),
(57, 8, 6, 7),
(58, 13, 89, 5),
(59, 4, 298, 1),
(60, 9, 192, 7),
(61, 2, 269, 10),
(62, 15, 287, 4),
(63, 14, 262, 10),
(64, 14, 232, 1),
(65, 9, 122, 2),
(66, 2, 204, 7),
(67, 6, 183, 4),
(68, 12, 107, 9),
(69, 1, 265, 0),
(70, 7, 284, 1),
(71, 9, 101, 2),
(72, 4, 296, 5),
(73, 3, 283, 3),
(74, 10, 147, 6),
(75, 11, 215, 4),
(76, 11, 38, 4),
(77, 2, 124, 7),
(78, 14, 238, 1),
(79, 1, 119, 8),
(80, 13, 87, 5),
(81, 2, 178, 8),
(82, 8, 273, 3),
(83, 9, 64, 0),
(84, 14, 274, 2),
(85, 4, 22, 7),
(86, 8, 15, 0),
(87, 5, 158, 8),
(88, 2, 249, 4),
(89, 9, 149, 10),
(90, 11, 50, 1),
(91, 4, 6, 1),
(92, 15, 10, 9),
(93, 6, 255, 6),
(94, 10, 59, 6),
(95, 9, 127, 9),
(96, 12, 76, 4),
(97, 1, 278, 5),
(98, 11, 132, 7),
(99, 13, 79, 2),
(100, 4, 26, 10),
(101, 12, 193, 8),
(102, 2, 174, 9),
(103, 14, 288, 3),
(104, 9, 25, 2),
(105, 11, 213, 1),
(106, 13, 284, 1),
(107, 4, 224, 4),
(108, 3, 59, 8),
(109, 8, 74, 7),
(110, 9, 286, 7),
(111, 10, 244, 8),
(112, 1, 288, 2),
(113, 9, 174, 7),
(114, 1, 23, 9),
(115, 8, 172, 2),
(116, 3, 272, 4),
(117, 11, 215, 2),
(118, 12, 274, 7),
(119, 9, 183, 10),
(120, 5, 62, 2),
(121, 1, 69, 5),
(122, 5, 163, 6),
(123, 2, 294, 10),
(124, 9, 248, 9),
(125, 1, 142, 10),
(126, 1, 134, 0),
(127, 4, 213, 4),
(128, 6, 186, 8),
(129, 4, 260, 7),
(130, 5, 297, 3),
(131, 12, 74, 1),
(132, 14, 277, 2),
(133, 6, 154, 5),
(134, 2, 128, 8),
(135, 15, 198, 6),
(136, 15, 191, 9),
(137, 12, 20, 3),
(138, 3, 245, 9),
(139, 9, 7, 0),
(140, 8, 252, 8),
(141, 12, 291, 8),
(142, 2, 61, 8),
(143, 7, 135, 10),
(144, 10, 201, 3),
(145, 12, 24, 8),
(146, 14, 211, 6),
(147, 13, 95, 5),
(148, 13, 159, 10),
(149, 2, 157, 5),
(150, 3, 12, 10),
(151, 5, 197, 7),
(152, 1, 213, 2),
(153, 9, 177, 3),
(154, 5, 130, 0),
(155, 14, 23, 3),
(156, 7, 243, 2),
(157, 14, 105, 7),
(158, 9, 252, 9),
(159, 3, 6, 10),
(160, 7, 298, 1),
(161, 8, 3, 6),
(162, 1, 8, 7),
(163, 3, 298, 8),
(164, 9, 103, 4),
(165, 3, 140, 5),
(166, 10, 125, 0),
(167, 2, 155, 4),
(168, 12, 246, 0),
(169, 13, 187, 2),
(170, 7, 24, 9),
(171, 4, 282, 0),
(172, 15, 248, 4),
(173, 12, 248, 0),
(174, 15, 12, 10),
(175, 1, 33, 3),
(176, 4, 183, 0),
(177, 14, 283, 0),
(178, 13, 193, 6),
(179, 12, 9, 6),
(180, 3, 50, 7),
(181, 1, 274, 10),
(182, 2, 289, 3),
(183, 13, 57, 0),
(184, 2, 142, 7),
(185, 6, 213, 3),
(186, 1, 39, 6),
(187, 15, 233, 9),
(188, 13, 198, 1),
(189, 13, 133, 7),
(190, 4, 125, 2),
(191, 10, 23, 9),
(192, 5, 198, 6),
(193, 2, 35, 8),
(194, 11, 32, 3),
(195, 7, 178, 9),
(196, 15, 120, 4),
(197, 5, 167, 3),
(198, 4, 176, 10),
(199, 1, 107, 9),
(200, 15, 267, 8);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `description`) VALUES
(1, 'Agility Course'),
(2, 'Waggiest Tail'),
(3, 'Obedience Challenge'),
(4, '100m Race'),
(5, 'Wettest Nose'),
(6, 'Loudest Bark'),
(7, 'Fetching the Tennis Ball'),
(8, 'Hidden Object Challenge'),
(9, 'Dog and Owner Resemblance'),
(10, 'Best in Show');

-- --------------------------------------------------------

--
-- Table structure for table `judges`
--

CREATE TABLE `judges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `judges`
--

INSERT INTO `judges` (`id`, `name`, `address`, `email`, `phone`) VALUES
(1, 'Peter Moore', '833 Katie Lane\nWest Georgiastad\nTW15 3EQ', 'richards.courtney@yahoo.co.uk', '(00914) 80616'),
(2, 'Isabelle Ellis', '0 Owen Stream\nGraceside\nS81 0HT', 'joel.clark@yahoo.co.uk', '08479 51399'),
(3, 'Joanne Kennedy', 'Studio 76\nRoss Turnpike\nNew Rileyland\nSW2 3DJ', 'dmarshall@yahoo.com', '(03266) 535784'),
(4, 'Shannon Wilkinson', 'Flat 28\nPhoebe Pike\nFoxport\nMK9 2AD', 'klewis@hotmail.co.uk', '06250 00527'),
(5, 'Finley Shaw', '56 Amelia Village\nNorth Gavinton\nWA3 3UR', 'smith.bradley@hotmail.com', '(0255) 3473911'),
(6, 'Alexandra Young', '318 Walker Heights\nWendyburgh\nM28 7XP', 'qpatel@yahoo.co.uk', '(0031) 214 9912'),
(7, 'Louis Hill', '7 Ella Isle\nJamesburgh\nPH6 2HW', 'stefan.evans@gmail.co.uk', '0522 474 9293'),
(8, 'Will Hill', '93 Kyle Shore\nLake Jim\nBS5 8PJ', 'muhammad.johnson@gmail.co.uk', '03715 33346'),
(9, 'Elsie Wright', '22 Davies Valley\nStewartport\nTS18 1NS', 'esaunders@hotmail.co.uk', '(07582) 172364'),
(10, 'Ashley Jackson', 'Studio 54p\nSaunders Pass\nMatildahaven\nL35 5JA', 'nathan.hughes@yahoo.com', '04705 346349'),
(11, 'Steve Marshall', 'Studio 50\nRebecca Turnpike\nFinleymouth\nIV2 5EG', 'price.aiden@gmail.com', '09800 999419'),
(12, 'Samantha James', '0 Richards Squares\nNorth Donna\nB92 8HS', 'charlotte20@yahoo.com', '+44(0)974133168'),
(13, 'Adam Richards', '6 Young Well\nMooreberg\nL25 2NW', 'fred.robinson@gmail.co.uk', '(04104) 27372'),
(14, 'Gavin Martin', '287 Carter Light\nSouth Mike\nS70 4DN', 'martin.phillips@hotmail.co.uk', '0841 009 3190'),
(15, 'Steve Davis', 'Studio 81\nCarlie Streets\nLake Lindabury\nCV34 4DF', 'joe.robertson@yahoo.com', '+44(0)7154913350'),
(16, 'Harley Rose', 'Flat 94\nLexi Lock\nNew Chloe\nG83 0SH', 'liam67@yahoo.co.uk', '+44(0)612467067'),
(17, 'Ian Knight', '8 Richards Cliffs\nMatthewport\nPE27 5PP', 'ucook@gmail.co.uk', '0724 9460028'),
(18, 'Tina Khan', '8 Ben Via\nSeanberg\nTN34 9GL', 'mandy.lewis@hotmail.co.uk', '+44(0)0371090525'),
(19, 'George Green', 'Studio 87k\nIsabella Summit\nEast Kyleland\nME15 0JU', 'nwatson@hotmail.co.uk', '0883 442 0700'),
(20, 'Charlie Turner', '5 Morris Stream\nRogersside\nCH45 6UP', 'qwalsh@hotmail.com', '07324 70294'),
(21, 'Tara Young', 'Flat 22k\nKelly Branch\nAidenfort\nSO16 9RJ', 'cook.ben@yahoo.co.uk', '(0923) 6651030'),
(22, 'George Richards', '3 Lilly Field\nNorth Janestad\nSP6 1NH', 'melissa.saunders@yahoo.co.uk', '(0644) 931 9130'),
(23, 'Ashley Ross', 'Studio 14r\nChapman Gardens\nWest Raytown\nCT6 7HL', 'cameron.rose@gmail.com', '(0223) 7664622'),
(24, 'Aaron Owen', 'Flat 74h\nJack Hills\nCandicemouth\nAL3 8RN', 'lily61@gmail.co.uk', '(00276) 691196'),
(25, 'Yasmine Miller', 'Studio 75\nLucas Valley\nSummerstad\nCB2 3EN', 'freddie04@gmail.co.uk', '09936 70467');

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`id`, `name`, `address`, `email`, `phone`) VALUES
(1, 'Dominic Stewart', '937 Gray Underpass\nAllenberg\nDD3 8ES', 'freddie.saunders@gmail.com', '+44(0)4379 865138'),
(2, 'Lindsay Palmer', 'Studio 11\nTracy Underpass\nCharlesshire\nS6 1WR', 'stewart.isla@gmail.com', '0445 4945458'),
(3, 'Yvonne Bell', '749 Cook Mount\nKieranbury\nG77 6DL', 'mia.young@gmail.co.uk', '0372881227'),
(4, 'Helen Evans', '0 Moore Springs\nNew Ken\nHP5 2ED', 'tyler62@hotmail.com', '(01832) 76086'),
(5, 'Isabel Cooper', '2 Harrison Track\nLake Francescaborough\nTS19 9ES', 'hhill@hotmail.com', '(0955) 026 9515'),
(6, 'Natalie Fox', 'Studio 87y\nHeather Circles\nLloydtown\nTW15 3EQ', 'joshua.green@hotmail.co.uk', '+44(0)9687 26658'),
(7, 'Graham Williams', '301 Stewart Streets\nDaleview\nOX11 8JJ', 'dscott@hotmail.com', '0422760818'),
(8, 'Carole Robertson', '0 Murray Junctions\nLake Zoe\nTR16 6EU', 'awalsh@gmail.com', '0920 624 4286'),
(9, 'Oliver Parker', 'Flat 27\nHarrison Extensions\nJuliamouth\nGU1 2SB', 'aiden30@gmail.com', '08224532334'),
(10, 'Reece Rogers', '77 Lucas Estate\nLolashire\nLL12 9NR', 'fox.sebastian@yahoo.com', '+44(0)2436261097'),
(11, 'Quentin Carter', '672 Hughes Orchard\nMarshallport\nBN6 8DA', 'emma.knight@gmail.com', '02626676361'),
(12, 'Ryan Gray', '527 Stevens Flats\nEast Bradley\nW10 6DY', 'kwilson@yahoo.com', '+44(0)9011555546'),
(13, 'Theresa Lloyd', 'Flat 36\nJoanne Track\nEast Lauren\nTN14 5GD', 'mary26@yahoo.co.uk', '+44(0)2936 343403'),
(14, 'Kelly Simpson', 'Flat 52v\nEvans Spurs\nWilliamsside\nCH63 4JT', 'liam02@gmail.co.uk', '+44(0)8085811974'),
(15, 'Amber Taylor', '94 Greg Harbour\nPort Sophia\nHA1 2AG', 'philip23@gmail.co.uk', '(0974) 084 3010'),
(16, 'Riley Brown', 'Flat 13v\nTheresa Streets\nWest Maisieton\nTN15 8JE', 'vanessa76@yahoo.com', '0902 3250125'),
(17, 'Jonathan Knight', '3 Caitlin Station\nWest Maisieburgh\nSW6 2WG', 'gray.scott@gmail.co.uk', '07819316950'),
(18, 'Louis Watson', 'Studio 53\nErin Fort\nNew Naomistad\nTF3 2BG', 'richards.mandy@hotmail.com', '0136197108'),
(19, 'William Young', '933 Sophie Unions\nGrahamview\nIP7 5SS', 'selina93@gmail.com', '0887 5569890'),
(20, 'Ian Cooper', 'Studio 85\nCarmen Extension\nDeanstad\nBT46 5NR', 'lee.miller@gmail.com', '+44(0)8585 89200'),
(21, 'Lily Robertson', '7 Clark Mount\nKellyton\nS81 0HT', 'archie.wilson@gmail.com', '+44(0)543864540'),
(22, 'Dylan Martin', '375 Walker Walk\nKevinland\nS70 5RT', 'cgriffiths@hotmail.co.uk', '(0473) 5355226'),
(23, 'Luke Wright', '3 Megan Gardens\nRichardsview\nEH26 0LE', 'jodie90@yahoo.co.uk', '+44(0)3896731823'),
(24, 'Steve Rogers', '14 Griffiths Hill\nNorth Chelsea\nAL9 5DL', 'kennedy.jane@yahoo.co.uk', '05197 47624'),
(25, 'Charlie Chapman', 'Studio 86x\nOwen Rest\nPort Bradley\nL25 8SJ', 'archie.scott@hotmail.co.uk', '(0102) 274 1716'),
(26, 'Kirsten Bell', '764 Amelia Hill\nDaviesfurt\nAB31 5ZD', 'jamie.ward@gmail.com', '(07108) 945063'),
(27, 'Jim Watson', '8 Lewis Vista\nEast Paulland\nLS28 9NF', 'harvey.owen@hotmail.com', '+44(0)8534 13540'),
(28, 'Sally Holmes', '10 Wright Squares\nMurrayport\nRM9 4UT', 'brown.grace@yahoo.com', '(0272) 918 8177'),
(29, 'Tara Stevens', '3 Harris Avenue\nLake Isabellemouth\nTR16 6EU', 'amelia71@gmail.co.uk', '07877 069518'),
(30, 'Nikki Davies', '319 Wilson Streets\nWalkerbury\nCT13 0PW', 'claire68@hotmail.co.uk', '(07326) 91527'),
(31, 'Hollie Young', 'Studio 23w\nElla Land\nAllentown\nMK9 2AD', 'archie80@gmail.co.uk', '+44(0)349968717'),
(32, 'Harry Bennett', '449 Holmes Cape\nNorth Emmamouth\nMK17 9QX', 'dellis@hotmail.com', '0483 427 3036'),
(33, 'Dominic Wright', 'Flat 23c\nGray Ridges\nButlertown\nNW4 4XL', 'elsie.reid@gmail.com', '(0961) 6374688'),
(34, 'Sienna Hunt', '457 Elsie Rapids\nNew Danfort\nWR2 4HQ', 'victoria97@hotmail.co.uk', '(0265) 205 2722'),
(35, 'Jasmine Lloyd', 'Studio 57\nGary Shoals\nWest Deanborough\nSK2 5XT', 'richards.jason@hotmail.co.uk', '+44(0)9090 99389'),
(36, 'Matthew Hunter', '9 Isobel Ridges\nHarrisonburgh\nCB2 8HH', 'amy.kennedy@yahoo.com', '0492 469 2575'),
(37, 'Harrison Baker', '92 Edward Trace\nSouth Samanthachester\nBH11 9NE', 'georgia.harrison@hotmail.com', '+44(0)2467662852'),
(38, 'Zach Lewis', '29 Ellis Ranch\nNew Peterbury\nDN15 9AU', 'williams.zoe@gmail.co.uk', '(0664) 2393401'),
(39, 'Samantha Reid', 'Flat 34\nParker Pines\nWest Lauren\nSA16 0HY', 'oprice@hotmail.com', '(0420) 437 0360'),
(40, 'Georgia Morgan', 'Studio 57y\nReid Lake\nPort Mia\nIP22 1JW', 'harrison.stephanie@yahoo.com', '(0904) 7080223'),
(41, 'Ellie Taylor', '694 Simpson Park\nJoneston\nW8 7EY', 'matthew.gray@gmail.co.uk', '+44(0)7898447316'),
(42, 'Lee Edwards', 'Studio 42\nEden Falls\nEast Dennis\nSA16 0HY', 'elsie25@yahoo.com', '02135 70436'),
(43, 'Fred Moore', '383 Moore Mews\nWrightfort\nM25 3BY', 'laura73@hotmail.com', '(09931) 978937'),
(44, 'Alfie Ellis', 'Flat 68u\nLeanne Road\nNorth John\nTW12 2RA', 'drose@hotmail.com', '(0438) 903 3692'),
(45, 'Andrew Morgan', '97 Reynolds Groves\nWrightmouth\nCM16 6TT', 'aaron83@yahoo.co.uk', '(02727) 498461'),
(46, 'Ian Kelly', 'Flat 07\nRosie Isle\nAndersonberg\nIP33 9GD', 'connor.murphy@hotmail.com', '+44(0)0633734690'),
(47, 'Mark Morgan', 'Studio 71x\nRoberts Forge\nNorth Scarlett\nTD8 6PQ', 'selina.saunders@yahoo.co.uk', '09366 717054'),
(48, 'Jade Rose', '36 Layla Lodge\nPort Dominic\nB17 0LW', 'simpson.kirsty@hotmail.co.uk', '0420351000'),
(49, 'Lily Morris', '83 Emily Grove\nButlerton\nNG19 7QJ', 'justine.hall@hotmail.com', '0234897933'),
(50, 'Jackson Kennedy', '49 Jamie Trace\nHunterport\nS49 1YZ', 'rob85@gmail.com', '(09227) 02544');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `breeds`
--
ALTER TABLE `breeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `competitions_event_id_foreign` (`event_id`),
  ADD KEY `competitions_chief_judge_id_foreign` (`chief_judge_id`);

--
-- Indexes for table `dogs`
--
ALTER TABLE `dogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dogs_breed_id_foreign` (`breed_id`),
  ADD KEY `dogs_owner_id_foreign` (`owner_id`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_competition_id_foreign` (`competition_id`),
  ADD KEY `entries_dog_id_foreign` (`dog_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `judges`
--
ALTER TABLE `judges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `breeds`
--
ALTER TABLE `breeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `dogs`
--
ALTER TABLE `dogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `entries`
--
ALTER TABLE `entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `judges`
--
ALTER TABLE `judges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `owners`
--
ALTER TABLE `owners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `competitions`
--
ALTER TABLE `competitions`
  ADD CONSTRAINT `competitions_chief_judge_id_foreign` FOREIGN KEY (`chief_judge_id`) REFERENCES `judges` (`id`),
  ADD CONSTRAINT `competitions_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Constraints for table `dogs`
--
ALTER TABLE `dogs`
  ADD CONSTRAINT `dogs_breed_id_foreign` FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`id`),
  ADD CONSTRAINT `dogs_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`);

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_competition_id_foreign` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`),
  ADD CONSTRAINT `entries_dog_id_foreign` FOREIGN KEY (`dog_id`) REFERENCES `dogs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
