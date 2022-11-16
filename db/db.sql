-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2022 at 07:30 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kya_banau`
--

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL COMMENT 'Unique Code',
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_image` varchar(255) DEFAULT NULL,
  `type` enum('veg','non-veg') NOT NULL COMMENT '0 = Veg, 1 = Non Veg',
  `category` varchar(255) NOT NULL,
  `sub_category` varchar(255) NOT NULL,
  `cuisines` varchar(255) NOT NULL,
  `healt_score` varchar(255) DEFAULT NULL,
  `cooking_time` varchar(255) DEFAULT NULL,
  `taste_type` varchar(255) DEFAULT NULL,
  `tags` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `uuid`, `slug`, `name`, `display_image`, `type`, `category`, `sub_category`, `cuisines`, `healt_score`, `cooking_time`, `taste_type`, `tags`, `created_at`, `modified_at`) VALUES
(3, '', 'dal-makhani', 'Dal Makhani', 'https://www.cookwithmanali.com/wp-content/uploads/2019/04/Restaurant-Style-Dal-Makhani-500x500.jpg', 'veg', 'dinner', '', '', '50', '60', 'Salty', 'Dinner, Lunch', '2022-11-06 19:09:09', '2022-11-06 19:09:09'),
(4, '', 'dosa', 'Dosa', 'https://upload.wikimedia.org/wikipedia/commons/9/9f/Dosa_at_Sri_Ganesha_Restauran%2C_Bangkok_%2844570742744%29.jpg', 'veg', 'break-fast', '', 'South Indian', '75', '120', NULL, 'Dosa, Dinner, AnyTime, South Indian, Indian Food', '2022-11-06 19:11:36', '2022-11-07 23:25:37'),
(5, '', 'samosa', 'Samosa', 'https://static.toiimg.com/thumb/61050397.cms?imgsize=246859&width=800&height=800', 'veg', 'snack', '', 'North Indian', '20', '15', 'Spicy', 'Samosa, Snack, Breakfast, Indian Food', '2022-11-06 19:13:06', '2022-11-07 23:20:08'),
(6, '', 'aloo-paratha', 'Aloo Paratha', 'https://www.vegrecipesofindia.com/wp-content/uploads/2009/08/aloo-paratha-recipe-2.jpg', 'veg', 'break-fast', '', 'North Indian', '40', '10', 'Salty, Spicy', 'Breakfast, Dinner, Lunch', '2022-11-06 19:15:28', '2022-11-06 19:32:56');

-- --------------------------------------------------------

--
-- Table structure for table `dishes_category`
--

CREATE TABLE `dishes_category` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dishes_category`
--

INSERT INTO `dishes_category` (`id`, `uuid`, `name`, `slug`, `created_at`, `modified_at`) VALUES
(1, '', 'Breakfast', 'break-fast', '2022-11-06 19:05:11', '2022-11-06 19:05:11'),
(2, '', 'Lunch', 'lunch', '2022-11-06 19:05:11', '2022-11-06 19:05:11'),
(3, '', 'Dinner', 'dinner', '2022-11-06 19:05:11', '2022-11-06 19:05:11'),
(4, '', 'Snack', 'snack', '2022-11-06 19:05:11', '2022-11-06 19:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `dishes_love_hate`
--

CREATE TABLE `dishes_love_hate` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `love_or_hate` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dishes_sub_category`
--

CREATE TABLE `dishes_sub_category` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `mobile_verified` tinyint(4) NOT NULL DEFAULT 0,
  `country` char(100) DEFAULT NULL COMMENT 'ISO3 of the Country, Ref - Countries Table',
  `state` char(100) DEFAULT NULL COMMENT 'State Id - Ref states table',
  `region` varchar(255) DEFAULT NULL,
  `pref_max_cooking_time` varchar(255) DEFAULT NULL,
  `pref_taste_type` varchar(255) DEFAULT NULL,
  `pref_min_health_socre` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `username`, `name`, `email`, `password`, `mobile`, `mobile_verified`, `country`, `state`, `region`, `pref_max_cooking_time`, `pref_taste_type`, `pref_min_health_socre`, `created_at`, `modified_at`) VALUES
(17, '75d34e9f-99d5-4d99-9fac-9be80ad40e5c83', 'guest_75d34e9f93780', '', NULL, NULL, '9999806228', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-06 15:01:00', '2022-11-06 15:01:00'),
(18, 'c40d6973-dff9-4652-830d-bbfd0250817819', 'guest_c40d697376311', '', NULL, NULL, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-06 15:01:19', '2022-11-06 15:01:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes_category`
--
ALTER TABLE `dishes_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes_love_hate`
--
ALTER TABLE `dishes_love_hate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes_sub_category`
--
ALTER TABLE `dishes_sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dishes_category`
--
ALTER TABLE `dishes_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dishes_love_hate`
--
ALTER TABLE `dishes_love_hate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dishes_sub_category`
--
ALTER TABLE `dishes_sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
