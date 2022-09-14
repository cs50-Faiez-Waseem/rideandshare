-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2022 at 04:28 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rideandshare`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_reports`
--

CREATE TABLE `app_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drop_address`
--

CREATE TABLE `drop_address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drop_address`
--

INSERT INTO `drop_address` (`id`, `address`, `longitude`, `latitude`, `city`, `created_at`, `updated_at`) VALUES
(2, 'some place', '46', '98', 'karachi', '2022-09-07 05:30:38', '2022-09-07 05:30:38'),
(3, 'some place', '46', '98', 'karachi', '2022-09-07 05:50:01', '2022-09-07 05:50:01'),
(4, 'some place', '46', '98', 'karachi', '2022-09-07 05:50:04', '2022-09-07 05:50:04'),
(5, 'some place', '46', '98', 'karachi', '2022-09-07 05:50:06', '2022-09-07 05:50:06'),
(6, 'some place', '46', '98', 'karachi', '2022-09-07 08:42:52', '2022-09-07 08:42:52'),
(7, 'some place', '46', '98', 'karachi', '2022-09-07 08:43:04', '2022-09-07 08:43:04'),
(8, 'some place', '46', '98', 'karachi', '2022-09-07 08:43:06', '2022-09-07 08:43:06'),
(9, 'some place', '46', '98', 'karachi', '2022-09-07 08:43:07', '2022-09-07 08:43:07'),
(10, 'some place', '46', '98', 'karachi', '2022-09-07 08:43:08', '2022-09-07 08:43:08'),
(11, 'some place', '46', '98', 'karachi', '2022-09-07 08:43:10', '2022-09-07 08:43:10'),
(12, 'some place', '46', '98', 'karachi', '2022-09-07 08:43:11', '2022-09-07 08:43:11'),
(13, 'some place', '46', '98', 'karachi', '2022-09-07 08:43:12', '2022-09-07 08:43:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fcm_tokens`
--

CREATE TABLE `fcm_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fcm_tokens`
--

INSERT INTO `fcm_tokens` (`id`, `user_id`, `token`, `created_at`, `updated_at`) VALUES
(1, 1, '07T08u4rj04fu48fy48--34545---', '2022-09-07 03:30:45', '2022-09-07 03:31:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_08_08_084553_create_fcm_tokens_table', 1),
(6, '2022_08_08_090709_create_user_address_table', 1),
(7, '2022_08_08_091534_create_user_ip_table', 1),
(8, '2022_08_08_091720_create_pickup_address_table', 1),
(9, '2022_08_08_091942_create_drop_address_table', 1),
(10, '2022_08_08_094906_create_user_vehicle_table', 1),
(11, '2022_08_08_092045_create_ride_table', 2),
(12, '2022_08_08_094137_create_ride_history_table', 3),
(13, '2022_08_08_094356_create_ride_rating_table', 3),
(14, '2022_08_08_094525_create_ride_report_table', 3),
(15, '2022_08_08_095121_create_ride_viehicle_table', 3),
(16, '2022_08_08_095307_create_ride_request_table', 3),
(17, '2022_08_08_095642_create_ride_status_table', 3),
(18, '2022_08_08_095817_create_app_reports_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '78828e7770ecd6ba285f5f095897bda2f51eb45cf3a874d97b907072001b4100', '[\"*\"]', NULL, '2022-09-07 03:28:18', '2022-09-07 03:28:18'),
(2, 'App\\Models\\User', 1, 'auth_token', 'd14ea7adbfd63501a1122d84a12b3f61088838737e35743539f169ede41ae905', '[\"*\"]', '2022-09-07 03:34:38', '2022-09-07 03:29:17', '2022-09-07 03:34:38'),
(3, 'App\\Models\\User', 1, 'auth_token', '816f1f15f1907cae9b74a6d7a9ce88a56f6b018a530ad1a44b8d4bfa3c6fe031', '[\"*\"]', '2022-09-09 00:45:27', '2022-09-07 03:39:53', '2022-09-09 00:45:27'),
(4, 'App\\Models\\User', 2, 'auth_token', 'c01b1f9696a62ba939bdd0225ccb94f291d8b763d45c2e0e4bbae74fe1e06576', '[\"*\"]', '2022-09-09 00:48:22', '2022-09-08 23:41:53', '2022-09-09 00:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `pickup_address`
--

CREATE TABLE `pickup_address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pickup_address`
--

INSERT INTO `pickup_address` (`id`, `address`, `longitude`, `latitude`, `city`, `created_at`, `updated_at`) VALUES
(2, 'some place', '45', '47', 'karachi', '2022-09-07 05:30:38', '2022-09-07 05:30:38'),
(3, 'some place', '45', '47', 'karachi', '2022-09-07 05:50:01', '2022-09-07 05:50:01'),
(4, 'some place', '45', '47', 'karachi', '2022-09-07 05:50:04', '2022-09-07 05:50:04'),
(5, 'some place', '45', '47', 'karachi', '2022-09-07 05:50:06', '2022-09-07 05:50:06'),
(6, 'some place', '45', '47', 'karachi', '2022-09-07 08:42:52', '2022-09-07 08:42:52'),
(7, 'some place', '45', '47', 'karachi', '2022-09-07 08:43:04', '2022-09-07 08:43:04'),
(8, 'some place', '45', '47', 'karachi', '2022-09-07 08:43:06', '2022-09-07 08:43:06'),
(9, 'some place', '45', '47', 'karachi', '2022-09-07 08:43:07', '2022-09-07 08:43:07'),
(10, 'some place', '45', '47', 'karachi', '2022-09-07 08:43:08', '2022-09-07 08:43:08'),
(11, 'some place', '45', '47', 'karachi', '2022-09-07 08:43:10', '2022-09-07 08:43:10'),
(12, 'some place', '45', '47', 'karachi', '2022-09-07 08:43:11', '2022-09-07 08:43:11'),
(13, 'some place', '45', '47', 'karachi', '2022-09-07 08:43:12', '2022-09-07 08:43:12');

-- --------------------------------------------------------

--
-- Table structure for table `ride`
--

CREATE TABLE `ride` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `departure_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departure_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noOfSeats` int(11) NOT NULL,
  `fare` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_id` bigint(20) UNSIGNED NOT NULL,
  `dropOff_id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ride`
--

INSERT INTO `ride` (`id`, `user_id`, `departure_date`, `departure_time`, `status`, `noOfSeats`, `fare`, `description`, `pickup_id`, `dropOff_id`, `vehicle_id`, `created_at`, `updated_at`) VALUES
(3, 1, '7-09-22', '10:30PM', 'pending', 4, 256, 'Something', 3, 3, 2, '2022-09-06 05:50:01', '2022-09-07 05:50:01'),
(5, 1, '1-09-22', '10:30PM', 'finished', 4, 100, 'Something', 5, 5, 2, '2022-09-07 05:50:06', '2022-09-07 05:50:06'),
(6, 1, '8-09-22', '10:30PM', 'pending', 4, 200, 'Something', 6, 6, 2, '2022-09-07 08:42:52', '2022-09-07 08:42:52'),
(7, 1, '8-09-22', '10:30PM', 'pending', 4, 200, 'Something', 7, 7, 2, '2022-09-07 08:43:04', '2022-09-07 08:43:04'),
(8, 1, '8-09-22', '10:30PM', 'pending', 4, 200, 'Something', 8, 8, 2, '2022-09-07 08:43:06', '2022-09-07 08:43:06'),
(9, 1, '8-09-22', '10:30PM', 'pending', 4, 200, 'Something', 9, 9, 2, '2022-09-07 08:43:07', '2022-09-07 08:43:07'),
(10, 1, '8-09-22', '10:30PM', 'pending', 4, 200, 'Something', 10, 10, 2, '2022-09-07 08:43:09', '2022-09-07 08:43:09'),
(11, 1, '8-09-22', '10:30PM', 'pending', 4, 200, 'Something', 11, 11, 2, '2022-09-07 08:43:10', '2022-09-07 08:43:10'),
(12, 1, '8-09-22', '10:30PM', 'pending', 4, 200, 'Something', 12, 12, 2, '2022-09-07 08:43:11', '2022-09-07 08:43:11'),
(13, 1, '8-09-22', '10:30PM', 'pending', 4, 200, 'Something', 13, 13, 2, '2022-09-07 08:43:12', '2022-09-07 08:43:12');

-- --------------------------------------------------------

--
-- Table structure for table `ride_history`
--

CREATE TABLE `ride_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ride_creator_id` bigint(20) UNSIGNED NOT NULL,
  `ride_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ride_rating`
--

CREATE TABLE `ride_rating` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ride_creator_id` bigint(20) UNSIGNED NOT NULL,
  `ride_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ride_report`
--

CREATE TABLE `ride_report` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ride_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ride_request`
--

CREATE TABLE `ride_request` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ride_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `seats_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ride_request`
--

INSERT INTO `ride_request` (`id`, `user_id`, `ride_id`, `status`, `seats_count`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 'accepted', 2, '2022-09-08 23:44:31', '2022-09-09 00:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `ride_status`
--

CREATE TABLE `ride_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ride_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ride_viehicle`
--

CREATE TABLE `ride_viehicle` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ride_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phoneNoVerfication` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `phoneNo`, `email`, `phoneNoVerfication`, `avatar`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Faiez Waseem', '+923001234567', 'fazufaiez@gmail.com', 'true', 'https://randomuser.me/api/user/portraits/thumb/women/91.jpg', '$2y$10$AKTNMZN0viKbzq/U6vOr4ekBGLNrsbQOgu2hcwTzjWs2PBBf4c/3u', NULL, '2022-09-07 03:28:17', '2022-09-07 03:28:17'),
(2, 'Faiez Waseem', '+923161113521', 'fazufaiez11@gmail.com', 'true', 'https://randomuser.me/api/user/portraits/thumb/women/91.jpg', '$2y$10$8y0yjxbEM9jvnSE0FeUENeiUJrXYDa1EsXxAycDJT8.xkj.gEVB2C', NULL, '2022-09-08 23:41:53', '2022-09-08 23:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`id`, `user_id`, `alias`, `address`, `longitude`, `latitude`, `city`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Nazimabad firdouse colony', NULL, NULL, NULL, '2022-09-07 03:34:07', '2022-09-07 03:34:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_ip`
--

CREATE TABLE `user_ip` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_ip`
--

INSERT INTO `user_ip` (`id`, `user_id`, `ip`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', '2022-09-07 03:31:41', '2022-09-07 03:31:41');

-- --------------------------------------------------------

--
-- Table structure for table `user_vehicle`
--

CREATE TABLE `user_vehicle` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_vehicle`
--

INSERT INTO `user_vehicle` (`id`, `user_id`, `type`, `model`, `color`, `created_at`, `updated_at`, `no`, `image`) VALUES
(2, 1, 'car', '2000', 'red', '2022-09-07 05:30:23', '2022-09-07 05:30:23', '2000-JKL', 'someimage.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_reports`
--
ALTER TABLE `app_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_reports_user_id_foreign` (`user_id`);

--
-- Indexes for table `drop_address`
--
ALTER TABLE `drop_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fcm_tokens`
--
ALTER TABLE `fcm_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fcm_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pickup_address`
--
ALTER TABLE `pickup_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ride`
--
ALTER TABLE `ride`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_user_id_foreign` (`user_id`),
  ADD KEY `ride_dropoff_id_foreign` (`dropOff_id`),
  ADD KEY `ride_pickup_id_foreign` (`pickup_id`),
  ADD KEY `ride_vehicle_id_foreign` (`vehicle_id`);

--
-- Indexes for table `ride_history`
--
ALTER TABLE `ride_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_history_ride_creator_id_foreign` (`ride_creator_id`),
  ADD KEY `ride_history_ride_id_foreign` (`ride_id`);

--
-- Indexes for table `ride_rating`
--
ALTER TABLE `ride_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_rating_ride_creator_id_foreign` (`ride_creator_id`),
  ADD KEY `ride_rating_ride_id_foreign` (`ride_id`);

--
-- Indexes for table `ride_report`
--
ALTER TABLE `ride_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_report_user_id_foreign` (`user_id`),
  ADD KEY `ride_report_ride_id_foreign` (`ride_id`);

--
-- Indexes for table `ride_request`
--
ALTER TABLE `ride_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_request_user_id_foreign` (`user_id`),
  ADD KEY `ride_request_ride_id_foreign` (`ride_id`);

--
-- Indexes for table `ride_status`
--
ALTER TABLE `ride_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_status_ride_id_foreign` (`ride_id`);

--
-- Indexes for table `ride_viehicle`
--
ALTER TABLE `ride_viehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_viehicle_ride_id_foreign` (`ride_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phoneno_unique` (`phoneNo`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_address_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_ip`
--
ALTER TABLE `user_ip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_ip_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_vehicle_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_reports`
--
ALTER TABLE `app_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drop_address`
--
ALTER TABLE `drop_address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fcm_tokens`
--
ALTER TABLE `fcm_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pickup_address`
--
ALTER TABLE `pickup_address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ride`
--
ALTER TABLE `ride`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ride_history`
--
ALTER TABLE `ride_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ride_rating`
--
ALTER TABLE `ride_rating`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ride_report`
--
ALTER TABLE `ride_report`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ride_request`
--
ALTER TABLE `ride_request`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ride_status`
--
ALTER TABLE `ride_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ride_viehicle`
--
ALTER TABLE `ride_viehicle`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_ip`
--
ALTER TABLE `user_ip`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_reports`
--
ALTER TABLE `app_reports`
  ADD CONSTRAINT `app_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `fcm_tokens`
--
ALTER TABLE `fcm_tokens`
  ADD CONSTRAINT `fcm_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ride`
--
ALTER TABLE `ride`
  ADD CONSTRAINT `ride_dropoff_id_foreign` FOREIGN KEY (`dropOff_id`) REFERENCES `drop_address` (`id`),
  ADD CONSTRAINT `ride_pickup_id_foreign` FOREIGN KEY (`pickup_id`) REFERENCES `pickup_address` (`id`),
  ADD CONSTRAINT `ride_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ride_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `user_vehicle` (`id`);

--
-- Constraints for table `ride_history`
--
ALTER TABLE `ride_history`
  ADD CONSTRAINT `ride_history_ride_creator_id_foreign` FOREIGN KEY (`ride_creator_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ride_history_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `ride` (`id`);

--
-- Constraints for table `ride_rating`
--
ALTER TABLE `ride_rating`
  ADD CONSTRAINT `ride_rating_ride_creator_id_foreign` FOREIGN KEY (`ride_creator_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ride_rating_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `ride` (`id`);

--
-- Constraints for table `ride_report`
--
ALTER TABLE `ride_report`
  ADD CONSTRAINT `ride_report_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `ride` (`id`),
  ADD CONSTRAINT `ride_report_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ride_request`
--
ALTER TABLE `ride_request`
  ADD CONSTRAINT `ride_request_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `ride` (`id`),
  ADD CONSTRAINT `ride_request_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ride_status`
--
ALTER TABLE `ride_status`
  ADD CONSTRAINT `ride_status_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `ride` (`id`);

--
-- Constraints for table `ride_viehicle`
--
ALTER TABLE `ride_viehicle`
  ADD CONSTRAINT `ride_viehicle_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `ride` (`id`);

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_ip`
--
ALTER TABLE `user_ip`
  ADD CONSTRAINT `user_ip_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  ADD CONSTRAINT `user_vehicle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
