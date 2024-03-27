-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2024 at 03:36 PM
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
-- Database: `lv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('admin','agent','user') NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `address`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', NULL, '$2y$12$ThLMe4Qor1ON4ZRjfpcfKe5Zf/ikF87/fEHXOBuDRIrrjPsAohZaO', NULL, NULL, NULL, 'admin', 'active', NULL, NULL, NULL),
(2, 'Agent', 'agent', 'agent@gmail.com', NULL, '$2y$12$ZEht11ysIEG9roh6xvavJe2.bSwlzRT9zWja.Qhj0pBKOb3BPB.My', NULL, NULL, NULL, 'agent', 'active', NULL, NULL, NULL),
(4, 'Ariel McCullough V', NULL, 'craig.stoltenberg@example.net', '2024-03-15 08:41:39', '$2y$12$xCbjUesDa5vh/56xily.pekr6Q6.MYlPBv64I/ckSkwOWJ7YAmmTK', 'https://via.placeholder.com/60x60.png/003300?text=nisi', '+1 (279) 479-2483', '7964 Everardo Fields\nWest Sterling, OK 98908-6097', 'user', 'inactive', 'DK922FM4ot', '2024-03-15 08:41:39', '2024-03-15 08:41:39'),
(5, 'Prof. Joaquin Ledner', NULL, 'neal33@example.org', '2024-03-15 08:41:39', '$2y$12$xCbjUesDa5vh/56xily.pekr6Q6.MYlPBv64I/ckSkwOWJ7YAmmTK', 'https://via.placeholder.com/60x60.png/0011aa?text=magni', '1-858-839-2257', '29853 Lakin Manor\nLake Devonteton, CT 75007', 'agent', 'inactive', 'azUJ33SIYk', '2024-03-15 08:41:39', '2024-03-15 08:41:39'),
(6, 'Gustave Welch', NULL, 'ijacobs@example.com', '2024-03-15 08:41:39', '$2y$12$xCbjUesDa5vh/56xily.pekr6Q6.MYlPBv64I/ckSkwOWJ7YAmmTK', 'https://via.placeholder.com/60x60.png/0000bb?text=quas', '+1.743.481.3811', '9416 Cronin Row\nEast Dedric, TX 60163', 'admin', 'inactive', 'b9N7LQ8LOo', '2024-03-15 08:41:39', '2024-03-15 08:41:39'),
(7, 'Dejon Stamm', NULL, 'mckayla.spencer@example.com', '2024-03-15 08:41:39', '$2y$12$xCbjUesDa5vh/56xily.pekr6Q6.MYlPBv64I/ckSkwOWJ7YAmmTK', 'https://via.placeholder.com/60x60.png/0011ff?text=voluptas', '+1 (267) 412-7221', '2163 Kadin Rapid Apt. 086\nSouth Haylie, AK 47034-2906', 'agent', 'inactive', 'neWgu6e7iD', '2024-03-15 08:41:39', '2024-03-15 08:41:39'),
(8, 'Sylvan Murray', NULL, 'weber.americo@example.com', '2024-03-15 08:41:39', '$2y$12$xCbjUesDa5vh/56xily.pekr6Q6.MYlPBv64I/ckSkwOWJ7YAmmTK', 'https://via.placeholder.com/60x60.png/009933?text=velit', '+1.747.542.7337', '9215 Reynolds Ports\nKosschester, VA 84409-2408', 'agent', 'inactive', 'CtQ7xhUlZY', '2024-03-15 08:41:39', '2024-03-15 08:41:39'),
(9, 'Ilham Hafiz Mudzakir', NULL, 'ilhamhafiz98@gmail.com', NULL, '$2y$12$NeRUrrzeznxzrqXuAypuYuJXSwzkHETaGwR0MUbMtkyHPmJZhcoli', '202403161411ilham.JPG', '089691916393', 'usa', 'admin', 'active', NULL, '2024-03-16 07:04:27', '2024-03-16 07:26:41');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
