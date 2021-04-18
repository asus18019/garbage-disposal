-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 13, 2021 at 09:04 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `garbage`
--

-- --------------------------------------------------------

--
-- Table structure for table `garbage`
--

CREATE TABLE `garbage` (
  `garbageID` int(11) NOT NULL,
  `garbage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `garbage`
--

INSERT INTO `garbage` (`garbageID`, `garbage`, `description`) VALUES
(1, 'Стекло', 'бутылки, стаканы, стеклянные банкии'),
(2, 'Бумага', 'газеты, журналы, печатная продукция, макулатура'),
(3, 'Органические остатки', 'в частности пищевые отходы: овощи, фрукты, садовые отходы, обрезки, листья, трава');

-- --------------------------------------------------------

--
-- Table structure for table `garbage_house`
--

CREATE TABLE `garbage_house` (
  `garbage_houseID` int(11) NOT NULL,
  `houseID` int(11) NOT NULL,
  `garbageID` int(11) NOT NULL,
  `currentFullness` float DEFAULT '0',
  `maxFullness` float NOT NULL,
  `priceID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `garbage_house`
--

INSERT INTO `garbage_house` (`garbage_houseID`, `houseID`, `garbageID`, `currentFullness`, `maxFullness`, `priceID`) VALUES
(17, 6, 2, 3, 110, 4),
(18, 6, 3, 0, 180, 5),
(19, 6, 1, 14.43, 111, 6);

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

CREATE TABLE `house` (
  `houseID` int(11) NOT NULL,
  `houseTitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `house`
--

INSERT INTO `house` (`houseID`, `houseTitle`, `location`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Бриллиант', 'пушкина 22', 'большой 25 этажный дом', '2021-04-06 21:00:00', '2021-03-19 18:45:23'),
(2, 'Малёк', 'научна 50', '4 этажный домик', '2021-03-19 18:55:30', '2021-03-19 18:55:30'),
(3, 'Малёк', 'научна 50', '4 этажный домик', '2021-03-19 18:58:08', '2021-03-19 18:58:08'),
(4, 'Малёк', 'научна 50', '4 этажный домик', '2021-03-19 18:59:57', '2021-03-19 18:59:57'),
(5, 'Малёк', 'научна 50', '4 этажный домик', '2021-03-19 19:01:10', '2021-03-19 19:01:10'),
(6, 'Малёкич', 'научна 55', '5 этажный домик', '2021-03-19 19:02:52', '2021-03-19 19:02:52'),
(7, 'Murray, King and Dickens', '402 Metz Unions\nEast Jonatanmouth, SD 10199', 'Est soluta consequatur vitae laudantium doloremque consectetur non minima.', '2021-03-26 08:34:23', '2021-03-26 08:34:23'),
(8, 'Cruickshank, Schimmel and Sipes', '778 Connelly Plains\nChrisport, MI 33270-5907', 'Eos inventore in impedit modi praesentium sapiente enim.', '2021-03-26 08:34:23', '2021-03-26 08:34:23'),
(9, 'Corwin-Doyle', '97697 Abby Harbor Suite 560\nDonniechester, KS 14132-0179', 'Atque officiis sed quia quam.', '2021-03-26 08:34:23', '2021-03-26 08:34:23'),
(10, 'Grady-Bailey', '90587 Rolfson Track Suite 724\nEast Mervin, MA 00369-4316', 'Aut possimus provident esse.', '2021-03-26 08:34:23', '2021-03-26 08:34:23'),
(11, 'Roob-Green', '526 Lang Flats Apt. 534\nAbshirebury, NE 38068-7713', 'Ut autem vitae fuga ducimus labore cupiditate.', '2021-03-26 08:34:23', '2021-03-26 08:34:23'),
(12, 'Mills-Effertz', '9863 Stamm Square\nNew Samara, MI 33006-0582', 'Consequatur voluptatum nam aut est.', '2021-03-26 08:34:24', '2021-03-26 08:34:24'),
(13, 'Abernathy, Keeling and Davis', '181 Maximillia Grove\nEleanoramouth, NE 50575-1326', 'Laudantium praesentium non iste nam.', '2021-03-26 08:34:24', '2021-03-26 08:34:24'),
(14, 'Ledner-Bednar', '6520 Viva Square Apt. 163\nWest Winnifred, MS 40414', 'Voluptates aut quis qui et aperiam sit cupiditate ut.', '2021-03-26 08:34:24', '2021-03-26 08:34:24'),
(15, 'Goodwin, Johns and Considine', '94516 Collier River\nLavonmouth, DE 27282', 'Sit dicta eaque eum odio hic deleniti rerum enim.', '2021-03-26 08:34:24', '2021-03-26 08:34:24'),
(16, 'Schaden and Sons', '469 Anya River Suite 098\nCollinsport, IL 11946-8742', 'Quaerat quidem omnis eos rerum eos voluptas repellat.', '2021-03-26 08:34:24', '2021-03-26 08:34:24');

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
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2021_03_11_151108_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 17),
(2, 'App\\Models\\User', 18),
(1, 'App\\Models\\User', 19),
(3, 'App\\Models\\User', 20),
(1, 'App\\Models\\User', 50),
(1, 'App\\Models\\User', 51),
(1, 'App\\Models\\User', 52),
(1, 'App\\Models\\User', 53),
(1, 'App\\Models\\User', 54),
(1, 'App\\Models\\User', 55),
(1, 'App\\Models\\User', 56),
(1, 'App\\Models\\User', 57),
(1, 'App\\Models\\User', 58),
(1, 'App\\Models\\User', 59),
(1, 'App\\Models\\User', 60),
(1, 'App\\Models\\User', 61),
(1, 'App\\Models\\User', 62),
(1, 'App\\Models\\User', 63),
(1, 'App\\Models\\User', 64),
(1, 'App\\Models\\User', 65),
(1, 'App\\Models\\User', 66),
(1, 'App\\Models\\User', 67),
(1, 'App\\Models\\User', 68),
(1, 'App\\Models\\User', 69),
(1, 'App\\Models\\User', 70),
(1, 'App\\Models\\User', 71),
(1, 'App\\Models\\User', 72),
(1, 'App\\Models\\User', 73),
(1, 'App\\Models\\User', 74),
(1, 'App\\Models\\User', 75),
(1, 'App\\Models\\User', 76),
(1, 'App\\Models\\User', 77),
(1, 'App\\Models\\User', 78),
(1, 'App\\Models\\User', 79),
(1, 'App\\Models\\User', 80),
(1, 'App\\Models\\User', 81),
(1, 'App\\Models\\User', 82),
(1, 'App\\Models\\User', 83),
(1, 'App\\Models\\User', 84),
(1, 'App\\Models\\User', 85),
(1, 'App\\Models\\User', 86),
(1, 'App\\Models\\User', 87),
(1, 'App\\Models\\User', 88),
(1, 'App\\Models\\User', 89),
(1, 'App\\Models\\User', 90),
(1, 'App\\Models\\User', 91),
(1, 'App\\Models\\User', 92),
(1, 'App\\Models\\User', 93),
(1, 'App\\Models\\User', 94),
(1, 'App\\Models\\User', 95),
(1, 'App\\Models\\User', 96),
(1, 'App\\Models\\User', 97),
(1, 'App\\Models\\User', 98),
(1, 'App\\Models\\User', 99),
(1, 'App\\Models\\User', 100),
(1, 'App\\Models\\User', 101),
(1, 'App\\Models\\User', 102),
(1, 'App\\Models\\User', 103),
(1, 'App\\Models\\User', 104);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', 'ba8d2ab492c0eb1235cb8d5ee3a7f121c04d247f86ce6bc84260b00560fa420a', '[\"*\"]', NULL, '2021-02-26 12:39:52', '2021-02-26 12:39:52'),
(2, 'App\\Models\\User', 1, 'token', '3a848d5de5ff7751c239efe38a9957b7dded80b70060a0d89fb5f9d691931cc9', '[\"*\"]', NULL, '2021-02-26 12:46:46', '2021-02-26 12:46:46'),
(3, 'App\\Models\\User', 1, 'token', 'bf548611b2cea8fb889bb0696f9a8f734b787c80a4e5a1beafb02ef87a6c6f86', '[\"*\"]', NULL, '2021-02-26 12:48:30', '2021-02-26 12:48:30'),
(4, 'App\\Models\\User', 1, 'token', '9d417d38126652ed5712e404255127166ea87ffedd8c9b1a3f6e71e8fd89798d', '[\"*\"]', NULL, '2021-02-26 12:52:21', '2021-02-26 12:52:21'),
(5, 'App\\Models\\User', 1, 'token', 'b076722b9a319a5b0142b6d89a6fe905797a68416e5aa41c20e371c438268494', '[\"*\"]', NULL, '2021-02-26 13:32:37', '2021-02-26 13:32:37'),
(6, 'App\\Models\\User', 1, 'token', 'a98a19de4e3fe1a14f0bcb3fcd3fc0969743569b84f3a8a9497d829bf8281e64', '[\"*\"]', NULL, '2021-02-26 13:36:47', '2021-02-26 13:36:47'),
(7, 'App\\Models\\User', 1, 'token', 'c6276baa808879f6693115c1fab5e9352f2ef7b85da4497874c1ca4c68bbe8ab', '[\"*\"]', NULL, '2021-02-26 13:39:04', '2021-02-26 13:39:04'),
(8, 'App\\Models\\User', 2, 'token', '9145500fa37459e1ab69ac9bc61ba48a45df430c76e9352cc233d41a4eb0110b', '[\"*\"]', NULL, '2021-02-26 13:40:39', '2021-02-26 13:40:39'),
(9, 'App\\Models\\User', 2, 'token', '718e7aa60b35cee607b6716016039da7f755ffa039486386626e685ee3eca727', '[\"*\"]', '2021-02-26 13:42:55', '2021-02-26 13:42:36', '2021-02-26 13:42:55'),
(10, 'App\\Models\\User', 2, 'token', '492c110ed782d4263ea7335a936b913ec606a853e09150f2b125a97bce6852d0', '[\"*\"]', NULL, '2021-02-26 13:51:18', '2021-02-26 13:51:18'),
(11, 'App\\Models\\User', 2, 'token', '75a43d9a281bef60d415c21731f44fffc729f621da965e36c04b67a96c3dd5d7', '[\"*\"]', '2021-02-26 13:52:55', '2021-02-26 13:51:52', '2021-02-26 13:52:55'),
(12, 'App\\Models\\User', 2, 'token', '9d50e383a98a1b3bfae7d044e84665983badda9f507c38fdf4c9dcd5cea4bc5d', '[\"*\"]', '2021-02-26 13:53:05', '2021-02-26 13:52:57', '2021-02-26 13:53:05'),
(13, 'App\\Models\\User', 2, 'token', '6af9b9f8771ff922cec21f9f1c606c05fdc1a7f85f83c173f93d1c6045a17d60', '[\"*\"]', '2021-02-26 13:59:27', '2021-02-26 13:53:08', '2021-02-26 13:59:27'),
(14, 'App\\Models\\User', 3, 'token', '9cbb50f9c58aea7185d7200589b124913d0e4fdec291783295079dad14572824', '[\"*\"]', '2021-02-26 14:02:16', '2021-02-26 14:01:52', '2021-02-26 14:02:16'),
(15, 'App\\Models\\User', 1, 'token', '7e023da21470851d69009937ccc9baa5462873d80f87c2aff133ad82023600cf', '[\"*\"]', '2021-02-26 15:20:11', '2021-02-26 15:19:34', '2021-02-26 15:20:11'),
(16, 'App\\Models\\User', 1, 'token', '394c9de3fea7a831d795da171a8509c10e8044ea2b312023571afe9f788bc3e9', '[\"*\"]', '2021-02-26 15:27:28', '2021-02-26 15:21:13', '2021-02-26 15:27:28'),
(17, 'App\\Models\\User', 1, 'token', '9740124a3e316501588d88a1c30eb0c908460fb618942f291a700bc029e53e3e', '[\"*\"]', '2021-02-26 15:58:18', '2021-02-26 15:46:59', '2021-02-26 15:58:18'),
(18, 'App\\Models\\User', 2, 'token', 'e63884c827d3abd51122b5defe0f38823e46770e236b6fc9a8c32e9eb7775c0f', '[\"*\"]', '2021-02-26 16:45:55', '2021-02-26 16:41:11', '2021-02-26 16:45:55'),
(19, 'App\\Models\\User', 5, 'token', 'e4d1ddc9191357587ad34454e6a90e1cb66dc2d29eefb9dc004730cf789f98fa', '[\"*\"]', '2021-02-26 16:49:23', '2021-02-26 16:49:14', '2021-02-26 16:49:23'),
(20, 'App\\Models\\User', 12, 'token', '09d496a9111b9b34c9c8b58ffa933b7fa5ac557b0c82766354134ff80befea14', '[\"*\"]', NULL, '2021-03-01 15:32:19', '2021-03-01 15:32:19'),
(21, 'App\\Models\\User', 12, 'token', '849b36b353f5e8963eb660045e4612df08e9868bddcfab67508a67d5562d9d83', '[\"*\"]', NULL, '2021-03-01 15:32:33', '2021-03-01 15:32:33'),
(22, 'App\\Models\\User', 12, 'token', '674a4fec381bc84112cf5987ca68a38994d3b40aa9e7d6be7f1e96301e23e415', '[\"*\"]', NULL, '2021-03-01 15:32:39', '2021-03-01 15:32:39'),
(23, 'App\\Models\\User', 12, 'token', 'b3078f9b68746f90835c5247c21efa9f738d71c52cfc6a41a563f4b44f82b664', '[\"*\"]', NULL, '2021-03-01 15:38:18', '2021-03-01 15:38:18'),
(24, 'App\\Models\\User', 12, 'token', 'cf9de3667c9e4a9745bc31c911a70d87d1a03072f62fffe8ae5ce26fe3b0ad94', '[\"*\"]', NULL, '2021-03-01 15:38:33', '2021-03-01 15:38:33'),
(25, 'App\\Models\\User', 12, 'token', '2d011a6ba48f8a84ab5c96ad0734e00c86039adcf9a70be0359bd234f3287aa3', '[\"*\"]', NULL, '2021-03-01 15:39:08', '2021-03-01 15:39:08'),
(26, 'App\\Models\\User', 12, 'token', '538a2bd65ebf058f173b96653b8c4d7094590562bc864fa4a390db8fb782c48f', '[\"*\"]', NULL, '2021-03-01 15:39:46', '2021-03-01 15:39:46'),
(27, 'App\\Models\\User', 12, 'token', '1f0c637b71e49479bdde7618f9eadf88bdf49fdecb14745ca35606fe9684ff2c', '[\"*\"]', NULL, '2021-03-01 15:40:17', '2021-03-01 15:40:17'),
(28, 'App\\Models\\User', 12, 'token', '90cea0d77c38f74dfe3c6a438ffaa6a3027842f08c4a930313754172adf39bb2', '[\"*\"]', NULL, '2021-03-01 15:41:41', '2021-03-01 15:41:41'),
(29, 'App\\Models\\User', 12, 'token', 'a1a4382b61823aacbb505c1f4466bdbc64c9aac4a4533700ad96f238d80013e8', '[\"*\"]', NULL, '2021-03-01 15:42:09', '2021-03-01 15:42:09'),
(30, 'App\\Models\\User', 12, 'token', 'b142c030b3aac2de78955415d39d2870ccd8625af272cab01a82c49b23cc8f07', '[\"*\"]', NULL, '2021-03-01 15:43:16', '2021-03-01 15:43:16'),
(31, 'App\\Models\\User', 12, 'token', '0b2aa9098f7370d8f8411a16b18517913e3d7ff2cc9abeb740dbebf00187c178', '[\"*\"]', NULL, '2021-03-01 15:44:43', '2021-03-01 15:44:43'),
(32, 'App\\Models\\User', 12, 'token', '5539e310946ea6f4be3fcc8f86c8b7f3fdf4570abed84413f287526b22fb1028', '[\"*\"]', NULL, '2021-03-01 15:45:19', '2021-03-01 15:45:19'),
(33, 'App\\Models\\User', 12, 'token', 'd3bb35d73f20305eba8498a51f10888a5ea0db678370fef739a8fe5a36d24875', '[\"*\"]', NULL, '2021-03-01 15:50:03', '2021-03-01 15:50:03'),
(34, 'App\\Models\\User', 12, 'token', '1adb4e4fd8d8adbd2f3f7054bfbdbd1ed5f0ac8a4fde4289e7be172e7c0058c3', '[\"*\"]', NULL, '2021-03-01 15:50:30', '2021-03-01 15:50:30'),
(35, 'App\\Models\\User', 17, 'token', '1ad83bab585e9176baacdc51b01d6cb011a9966312e76a927d9e077bbb33b7e2', '[\"*\"]', NULL, '2021-03-11 13:33:34', '2021-03-11 13:33:34'),
(36, 'App\\Models\\User', 17, 'token', '61857ea221a787e8605dd62b4217e204cdb2f10280313a8a7e640df0563bc5e0', '[\"*\"]', NULL, '2021-03-11 13:33:57', '2021-03-11 13:33:57'),
(37, 'App\\Models\\User', 17, 'token', '1e0eff2bfeb955dd3dd4e453f638b98764615f74d3170c30c2097286e4914dbf', '[\"*\"]', NULL, '2021-03-11 13:34:51', '2021-03-11 13:34:51'),
(38, 'App\\Models\\User', 17, 'token', '795d3b7fd33fb4aade652ebf1a8c69b3da81d66480d2bb3dc10e2646f11d33e1', '[\"*\"]', NULL, '2021-03-11 13:37:01', '2021-03-11 13:37:01'),
(39, 'App\\Models\\User', 17, 'token', 'cc333185b240b607388daff12929a42496aab6d3eef3855603e781754ff2d1cf', '[\"*\"]', '2021-03-11 13:37:35', '2021-03-11 13:37:30', '2021-03-11 13:37:35'),
(40, 'App\\Models\\User', 18, 'token', 'd04b0773d24763ab525f94cf5d3b01eb8f13567500ce324224d9732e5934bc50', '[\"*\"]', '2021-03-11 13:38:34', '2021-03-11 13:38:02', '2021-03-11 13:38:34'),
(41, 'App\\Models\\User', 18, 'token', '242d5eb1510a5f6c54c855635095df37b0b691ea58dcaca295b015af63e373ee', '[\"*\"]', '2021-03-11 13:40:00', '2021-03-11 13:38:47', '2021-03-11 13:40:00'),
(42, 'App\\Models\\User', 17, 'token', '8cb9fa35af8eca2ee5a1b4f6d8621016c3b279aca34a3be15ad003d85a72d532', '[\"*\"]', NULL, '2021-03-11 13:40:42', '2021-03-11 13:40:42'),
(43, 'App\\Models\\User', 17, 'token', 'f179b5a15b4313862c8627f1ab59f65b3d86baa97db3a2c4e85171221e0f0eda', '[\"*\"]', '2021-03-11 14:08:58', '2021-03-11 14:07:41', '2021-03-11 14:08:58'),
(44, 'App\\Models\\User', 17, 'token', 'd111bdc7c1169cebb16850df932cba43c09309a6a3d885d4c80056cfc66c6d5c', '[\"*\"]', '2021-03-11 14:38:43', '2021-03-11 14:09:28', '2021-03-11 14:38:43'),
(45, 'App\\Models\\User', 18, 'token', 'c125e612d7f2a272019e6b222abbdc0b2bdb9d1aadd63ff1c8d2528506e53372', '[\"*\"]', '2021-03-11 14:43:21', '2021-03-11 14:39:43', '2021-03-11 14:43:21'),
(46, 'App\\Models\\User', 18, 'token', '9c5646a531e2181a5528dbf2d27b8283a923ef38ede26fba45c8a5460a15c900', '[\"*\"]', '2021-03-11 14:43:31', '2021-03-11 14:43:23', '2021-03-11 14:43:31'),
(47, 'App\\Models\\User', 17, 'token', 'dbae37576ef403ccf8e68a77dedf7ae0088a6102f83f6b7c96d2c824851a07d9', '[\"*\"]', '2021-03-11 14:44:23', '2021-03-11 14:44:07', '2021-03-11 14:44:23'),
(48, 'App\\Models\\User', 18, 'token', '29a117ba985b5144cde7aefc8af06f316281e7b98d5e19448f6de0197a31096b', '[\"*\"]', '2021-03-11 14:45:52', '2021-03-11 14:44:34', '2021-03-11 14:45:52'),
(49, 'App\\Models\\User', 17, 'token', '2ddf6c37205a44e32bf2912bb79fbd33b638feefa635e0c60fadb5d259b424a2', '[\"*\"]', '2021-03-11 14:46:16', '2021-03-11 14:46:10', '2021-03-11 14:46:16'),
(50, 'App\\Models\\User', 19, 'token', '8c30e647bbb175dab8ebb876d40fe52ac8039d24b13a2eb7d7ed44734ce9bca1', '[\"*\"]', '2021-03-19 10:33:27', '2021-03-19 10:07:40', '2021-03-19 10:33:27'),
(51, 'App\\Models\\User', 19, 'token', '4b9714cde8c72e2a2ffb0a4bc4df161c1047217981c2ba9fa4da93ed32f5445d', '[\"*\"]', '2021-03-19 10:39:38', '2021-03-19 10:33:58', '2021-03-19 10:39:38'),
(52, 'App\\Models\\User', 19, 'token', '80787ed5ba3e63cb8a9aae1eac1ac928cc93db61493058fdc9b1d1c3e1e8d82d', '[\"*\"]', '2021-03-19 10:40:44', '2021-03-19 10:40:19', '2021-03-19 10:40:44'),
(53, 'App\\Models\\User', 19, 'token', '21fc202f7fc068d182f2f1280c5e9ea3c11478d40e9ea46799f17f9c0cd6c358', '[\"*\"]', '2021-03-19 17:51:35', '2021-03-19 10:43:31', '2021-03-19 17:51:35'),
(54, 'App\\Models\\User', 18, 'token', 'cf791532004742b97110f25345eb6009d3ebf17d1b9e23b214147b4ae644e843', '[\"*\"]', '2021-03-19 18:06:50', '2021-03-19 17:51:58', '2021-03-19 18:06:50'),
(55, 'App\\Models\\User', 18, 'token', '3c084ee3af292cae9d81f894580701579fa26ef0419ed14b807f4125c95ed87d', '[\"*\"]', '2021-03-19 18:19:13', '2021-03-19 18:07:07', '2021-03-19 18:19:13'),
(56, 'App\\Models\\User', 18, 'token', 'f0983bd5dbd574230e7fc07886f7c4bec3f4e8fd983690c9ff009f445c2ee997', '[\"*\"]', '2021-03-19 18:22:59', '2021-03-19 18:22:50', '2021-03-19 18:22:59'),
(57, 'App\\Models\\User', 18, 'token', '8d78fb68cc86db85f3882ab0b4ff1168cd81a6a6c3dcd884028f0e47b1322304', '[\"*\"]', '2021-03-19 19:03:03', '2021-03-19 18:23:06', '2021-03-19 19:03:03'),
(58, 'App\\Models\\User', 20, 'token', '5750ea6eba59550045bb23b14dd1733bbeaea1610e1064881a389b773bf6744f', '[\"*\"]', '2021-03-24 10:31:38', '2021-03-24 09:43:36', '2021-03-24 10:31:38'),
(59, 'App\\Models\\User', 18, 'token', 'd5e4063e233b8d0b1a2f1827278abb478913ba453a01be93d502178a8a57db6c', '[\"*\"]', '2021-03-24 10:55:18', '2021-03-24 10:32:18', '2021-03-24 10:55:18'),
(60, 'App\\Models\\User', 50, 'token', '87986055a988da0c87aa279adf71d41af04bc6f114c1c570b2a4fdc645f4998b', '[\"*\"]', '2021-03-26 08:52:47', '2021-03-26 08:43:17', '2021-03-26 08:52:47'),
(61, 'App\\Models\\User', 20, 'token', '7a8957557584ae0350f9375f5e08032ff13aa01eb14ced6e727426b441585d4b', '[\"*\"]', '2021-03-26 12:32:37', '2021-03-26 08:53:44', '2021-03-26 12:32:37'),
(62, 'App\\Models\\User', 20, 'token', 'a288edd1a46e8f872544dbed6fa75cdd2c5861d5933a4dd983ac2f749ab06568', '[\"*\"]', '2021-03-28 13:24:45', '2021-03-27 14:33:03', '2021-03-28 13:24:45'),
(63, 'App\\Models\\User', 20, 'token', 'b436112c131cca31872f803aacd3717724b9dc364148731571b3145d2d140b5c', '[\"*\"]', NULL, '2021-03-31 11:11:22', '2021-03-31 11:11:22'),
(64, 'App\\Models\\User', 20, 'token', '0d4a623672c66ef6cd695a5d9554ed12eb69c5c06cea363868b7c6ad74a6d17f', '[\"*\"]', NULL, '2021-03-31 11:49:09', '2021-03-31 11:49:09'),
(65, 'App\\Models\\User', 20, 'token', 'd33b9708ce03cf239e77a47f13f0a0b2caed1655d8c6ff3a453a8f3970bdb536', '[\"*\"]', NULL, '2021-03-31 11:49:11', '2021-03-31 11:49:11'),
(66, 'App\\Models\\User', 20, 'token', '56dbbfd28bc1e5da6ac758fc13aa95aaa227745c409a7c2a28edf59fad9bdfe0', '[\"*\"]', NULL, '2021-03-31 11:51:32', '2021-03-31 11:51:32'),
(67, 'App\\Models\\User', 20, 'token', 'f1177e5f6e212a2c83968035868748f757aeeec2ccd0177ed637d1af06479002', '[\"*\"]', NULL, '2021-03-31 12:01:49', '2021-03-31 12:01:49'),
(68, 'App\\Models\\User', 20, 'token', '710d0c4097efc739b714ac0b27f0237de305e6465445c6bb5bea40daea94351c', '[\"*\"]', NULL, '2021-03-31 12:16:43', '2021-03-31 12:16:43'),
(69, 'App\\Models\\User', 20, 'token', 'e71f45b3da8826bf0131cb44f1897433bba62fdd5da66397ba7fdbaaf0d948ec', '[\"*\"]', NULL, '2021-03-31 12:17:40', '2021-03-31 12:17:40'),
(70, 'App\\Models\\User', 20, 'token', 'b8a99b0c35a1038cbd6c1fb5f7832fc7340f119798bb0541d662b89ef5298ce5', '[\"*\"]', NULL, '2021-03-31 12:22:09', '2021-03-31 12:22:09'),
(71, 'App\\Models\\User', 20, 'token', '85f1b70b6c1a9ae733b3f949c16784122cdbebb06c891261d00d7a6c20781725', '[\"*\"]', NULL, '2021-03-31 12:23:13', '2021-03-31 12:23:13'),
(72, 'App\\Models\\User', 20, 'token', 'ca9a86628d68d2fb799ec8263b219ef32d22a671587e52fd6ec86493def52225', '[\"*\"]', NULL, '2021-03-31 12:42:02', '2021-03-31 12:42:02'),
(73, 'App\\Models\\User', 20, 'token', '6b464eecf50e653156c5e288a2e383f7d29ab1552d1a94e91bd203681edd5127', '[\"*\"]', '2021-03-31 12:49:58', '2021-03-31 12:49:34', '2021-03-31 12:49:58'),
(74, 'App\\Models\\User', 20, 'token', '377503985c241626316bf0808553a225576aa3eb78b920126bc2a267f769400e', '[\"*\"]', NULL, '2021-03-31 12:51:36', '2021-03-31 12:51:36'),
(75, 'App\\Models\\User', 20, 'token', '0d64985c061ad119e0d020200b9010606e98fe31edbffd9a7df77a0d43ba0e63', '[\"*\"]', NULL, '2021-03-31 12:52:44', '2021-03-31 12:52:44'),
(76, 'App\\Models\\User', 20, 'token', '145eb9b9392c3d27dfe0aa6988564d562123403b53a9f2b97b0b80df265488ed', '[\"*\"]', NULL, '2021-03-31 12:55:56', '2021-03-31 12:55:56'),
(77, 'App\\Models\\User', 20, 'token', 'ef24364dc878d311a02809ef7c0660f6a6d49c563854d02adf005be222db5671', '[\"*\"]', NULL, '2021-03-31 12:57:00', '2021-03-31 12:57:00'),
(78, 'App\\Models\\User', 20, 'token', '6527f0f36aa349b5de29f25f6ee47c391461a35ff985a672a53fb0f8fc4557df', '[\"*\"]', NULL, '2021-03-31 13:02:23', '2021-03-31 13:02:23'),
(79, 'App\\Models\\User', 20, 'token', '11effaac552165ffcfcf01ab3daeb779b75be4c448dd9a27b278780fc106c448', '[\"*\"]', NULL, '2021-03-31 13:17:17', '2021-03-31 13:17:17'),
(80, 'App\\Models\\User', 20, 'token', '7725307e137af8e2d821d8f8e3ee5adf06214774e1db760cbfd57f1c3bb9b4ef', '[\"*\"]', NULL, '2021-03-31 13:23:20', '2021-03-31 13:23:20'),
(81, 'App\\Models\\User', 20, 'token', 'b1abc261dec94ea56f1fe9e383453644f8b778c865cfb137b21c7c61ce52b359', '[\"*\"]', NULL, '2021-03-31 13:28:35', '2021-03-31 13:28:35'),
(82, 'App\\Models\\User', 20, 'token', '8909e41accd4109148452180fafcb5d162fefb965d68b3dbc3263fd102d22096', '[\"*\"]', NULL, '2021-03-31 13:31:04', '2021-03-31 13:31:04'),
(83, 'App\\Models\\User', 20, 'token', '9783121507c1b0f069a69dc1d73ba61de864f727ecdf225ccf14e92f6a2eaa5b', '[\"*\"]', NULL, '2021-03-31 13:34:20', '2021-03-31 13:34:20'),
(84, 'App\\Models\\User', 20, 'token', '631d7daef96cb539d0f52acacbecf44b62a091ec5062199170b08ff05bce8c06', '[\"*\"]', NULL, '2021-03-31 13:55:32', '2021-03-31 13:55:32'),
(85, 'App\\Models\\User', 20, 'token', '3e457cc443e29555ea8ea2b66cf88a483386f0ad0011b3b7dbba949a126658d3', '[\"*\"]', NULL, '2021-03-31 13:57:39', '2021-03-31 13:57:39'),
(86, 'App\\Models\\User', 20, 'token', 'c25165b1c3f903738665d36bee06bdb44da993bfde453fb10d0e9044ad268ac6', '[\"*\"]', NULL, '2021-03-31 14:07:24', '2021-03-31 14:07:24'),
(87, 'App\\Models\\User', 20, 'token', 'bc0252bd2f0bd0d6950696a9cb1c10b89b0d0cd36e0d36c304d2235f5fb3006e', '[\"*\"]', NULL, '2021-03-31 14:08:59', '2021-03-31 14:08:59'),
(88, 'App\\Models\\User', 20, 'token', 'a7fb48e8f429440b0c34b69b2244694c5e90faf543e5095d957d1f7d68475548', '[\"*\"]', NULL, '2021-03-31 14:13:28', '2021-03-31 14:13:28'),
(89, 'App\\Models\\User', 20, 'token', '26fa3e1acd567b821079c8a486b23e8177a95fbe840117db73695a5cdb10e9aa', '[\"*\"]', NULL, '2021-03-31 14:25:28', '2021-03-31 14:25:28'),
(90, 'App\\Models\\User', 20, 'token', 'bd4cfb9f67792ae6f0c99a7571b8f86e5572d7c2bf71f1ebeb80e6d99b902a30', '[\"*\"]', NULL, '2021-03-31 14:28:03', '2021-03-31 14:28:03'),
(91, 'App\\Models\\User', 20, 'token', 'dd00e240b9f8f321ac0967a88696761213be05800854e0009e9162f57a68b5d4', '[\"*\"]', NULL, '2021-03-31 14:30:00', '2021-03-31 14:30:00'),
(92, 'App\\Models\\User', 20, 'token', 'b795efb951b894feb7aac9ad98180c77ac619be9d6f8d55fd64df489645138e4', '[\"*\"]', NULL, '2021-03-31 15:05:05', '2021-03-31 15:05:05'),
(93, 'App\\Models\\User', 102, 'token', '3a36515d7bff06599b1e6a1193d3cefb0d13ddcce379c23f17545953915f3d1b', '[\"*\"]', NULL, '2021-04-03 11:44:58', '2021-04-03 11:44:58'),
(94, 'App\\Models\\User', 102, 'token', '9da4a0cf04f3edb6e5fc1598b1c6e19d851c8114468a947494376a7542f1f374', '[\"*\"]', NULL, '2021-04-03 11:46:54', '2021-04-03 11:46:54'),
(95, 'App\\Models\\User', 102, 'token', 'a984923542850cb58c3285495f11a367aa004b19d736eeea104df6dd443fb3ad', '[\"*\"]', NULL, '2021-04-03 12:05:20', '2021-04-03 12:05:20'),
(96, 'App\\Models\\User', 102, 'token', 'f0723324a5eec8c8b412ee0bb580e8bc6335c73e9bacdbc8134d10615c6521d5', '[\"*\"]', NULL, '2021-04-03 12:06:00', '2021-04-03 12:06:00'),
(97, 'App\\Models\\User', 103, 'token', '71efbd109710c48b263d8bd512a8073ab07db58e66744a5a7f717640a439356c', '[\"*\"]', NULL, '2021-04-06 07:17:09', '2021-04-06 07:17:09'),
(98, 'App\\Models\\User', 103, 'token', 'b5e6fe085a9132a7bf727b7b24be87e5bd74704236d6c426077935a4f340b9b6', '[\"*\"]', NULL, '2021-04-06 07:19:06', '2021-04-06 07:19:06'),
(99, 'App\\Models\\User', 103, 'token', 'b930372c8f665c8ad6705f521f47410fd66f92fbd08d9765c5c12f0fe19cc1c2', '[\"*\"]', NULL, '2021-04-06 07:22:57', '2021-04-06 07:22:57'),
(100, 'App\\Models\\User', 103, 'token', 'a5a792f90b4a427e662ad7faec6a31f3de9900e2ee6dfd548eb946e822ef055f', '[\"*\"]', NULL, '2021-04-06 09:08:21', '2021-04-06 09:08:21'),
(101, 'App\\Models\\User', 103, 'token', '8c08444a1dd59e5c49a7443625ea0a6e05d67dfe5f718efed7fedb10eb08e5d5', '[\"*\"]', NULL, '2021-04-06 09:09:18', '2021-04-06 09:09:18'),
(102, 'App\\Models\\User', 103, 'token', '26e7d9d48e17616bf9bd76e2cad8e34d9083daf6e8743657533b495a2c422c4f', '[\"*\"]', NULL, '2021-04-06 09:13:06', '2021-04-06 09:13:06'),
(103, 'App\\Models\\User', 103, 'token', 'a4609d54700e01292c720b457d78f11d8719db32f5efcecfd9295792cf4323b4', '[\"*\"]', NULL, '2021-04-06 09:14:25', '2021-04-06 09:14:25'),
(104, 'App\\Models\\User', 103, 'token', '5d04d05e7360c6f04ed4dd0795196fd20c829a58dd09e3c849aa7107585c1952', '[\"*\"]', NULL, '2021-04-06 09:16:03', '2021-04-06 09:16:03'),
(105, 'App\\Models\\User', 103, 'token', '27f5c0dfd523b2b26f396317d35c52dc0c6fefdbf814a17159dc5474aae57c63', '[\"*\"]', NULL, '2021-04-06 09:29:22', '2021-04-06 09:29:22'),
(106, 'App\\Models\\User', 103, 'token', '72aa90088285521c1e0eea4da94f6afcba57a6a2fe0f0ba9d95a3a12b1897577', '[\"*\"]', NULL, '2021-04-06 09:50:59', '2021-04-06 09:50:59'),
(107, 'App\\Models\\User', 103, 'token', 'e4f35b8a93ae29e24c854c500565821a53006179dd3adb95c10d813e42d3bce9', '[\"*\"]', NULL, '2021-04-06 09:58:34', '2021-04-06 09:58:34'),
(108, 'App\\Models\\User', 103, 'token', '2463fdaaa67cd572c58f9bee3b5e78010633aba76d288093f04f67d117cd2829', '[\"*\"]', NULL, '2021-04-06 09:59:05', '2021-04-06 09:59:05'),
(109, 'App\\Models\\User', 103, 'token', '279a9ef467cb32de8d81d273b731ca98f50f1c35c9f4718de3473e05114d5e5f', '[\"*\"]', '2021-04-06 10:02:28', '2021-04-06 09:59:31', '2021-04-06 10:02:28'),
(110, 'App\\Models\\User', 103, 'token', '25f59c411b05a91054d06dc66fec5f561650911b1d5d195f0f62a3876a88780c', '[\"*\"]', '2021-04-06 10:05:40', '2021-04-06 10:02:31', '2021-04-06 10:05:40'),
(111, 'App\\Models\\User', 103, 'token', '32adff7d93d6fef150ffb8f046cec02274a36ae829d2d8249ff6bd21cad5fda4', '[\"*\"]', NULL, '2021-04-06 10:02:44', '2021-04-06 10:02:44'),
(112, 'App\\Models\\User', 103, 'token', '847a4e177d390611b4955536fee10ceef20855878b141ca5fd898598bc549850', '[\"*\"]', NULL, '2021-04-06 10:05:14', '2021-04-06 10:05:14'),
(113, 'App\\Models\\User', 103, 'token', '1c94bc7c4c56e44909f798801f23ada9a46881c99113b225e25f2387a9cd1d59', '[\"*\"]', NULL, '2021-04-06 10:05:51', '2021-04-06 10:05:51'),
(114, 'App\\Models\\User', 103, 'token', '08e28b1cb82dcbad157f9985d91c8cc87556c7c4130ef6dfbb2cd31ac13540c2', '[\"*\"]', NULL, '2021-04-06 10:05:56', '2021-04-06 10:05:56'),
(115, 'App\\Models\\User', 103, 'token', '5651672a24bbb57b2ab2c24ec2d755a71a7d0186154516e0e456f06520f28f2a', '[\"*\"]', NULL, '2021-04-06 10:06:16', '2021-04-06 10:06:16'),
(116, 'App\\Models\\User', 103, 'token', '0c7a11a83d5d13b9c7cce415a17e268bbdc8f761f67b83412e557b4e5fdfa236', '[\"*\"]', NULL, '2021-04-06 10:08:45', '2021-04-06 10:08:45'),
(117, 'App\\Models\\User', 103, 'token', '16224f926b5024e4c39cf8aa77f975e703f11bcad66865b82761fbe5d3b8111e', '[\"*\"]', NULL, '2021-04-06 10:09:00', '2021-04-06 10:09:00'),
(118, 'App\\Models\\User', 103, 'token', '6be2b0a905078085924cc5ebbfc502fca523372af8472170469f6321ad4c539d', '[\"*\"]', '2021-04-06 10:10:10', '2021-04-06 10:09:14', '2021-04-06 10:10:10'),
(119, 'App\\Models\\User', 103, 'token', '4ae93d8ce6a3d0908a36e4c7bb97df277993807490ae36f0592f0fdd5717238b', '[\"*\"]', '2021-04-06 10:10:54', '2021-04-06 10:10:27', '2021-04-06 10:10:54'),
(120, 'App\\Models\\User', 103, 'token', 'dd726587f3f307eb51b6de5f4bcf73c648dbd2b9ba26018b4364491beeb174ed', '[\"*\"]', NULL, '2021-04-06 10:11:01', '2021-04-06 10:11:01'),
(121, 'App\\Models\\User', 103, 'token', '5df772d26373e4c110f831e75c57fa0276ca0e8e4895a891fd6e727a5d396fcc', '[\"*\"]', NULL, '2021-04-06 10:12:43', '2021-04-06 10:12:43'),
(122, 'App\\Models\\User', 103, 'token', '025769a551bde1be10388f48f7bc06ba57ab33a16900488a0cbbc0a13f1651e1', '[\"*\"]', NULL, '2021-04-06 10:13:40', '2021-04-06 10:13:40'),
(123, 'App\\Models\\User', 103, 'token', 'e97a2da900b865d8f7d46b3736cdf0e0595a03e12efd8c601d6a9f0421f7e758', '[\"*\"]', NULL, '2021-04-06 10:13:42', '2021-04-06 10:13:42'),
(124, 'App\\Models\\User', 103, 'token', 'd301f5bc8f3f8c9b2e61a3c210e65c18172b853009a7fcbd53c044e72660e1d7', '[\"*\"]', NULL, '2021-04-06 10:13:43', '2021-04-06 10:13:43'),
(125, 'App\\Models\\User', 103, 'token', 'acc801cfa60e2da057bddd139fd005707c7a7dc51589abe8d2677dc1de767a2a', '[\"*\"]', NULL, '2021-04-06 10:13:44', '2021-04-06 10:13:44'),
(126, 'App\\Models\\User', 103, 'token', 'e7381bed105e39e07912a924f3631dc06f9bab44cf5da8fa459eebaab3a50ddb', '[\"*\"]', NULL, '2021-04-06 10:16:57', '2021-04-06 10:16:57'),
(127, 'App\\Models\\User', 103, 'token', '1fe75b7e3cb26a33e9cd4775eb945a4ab399b37050e67ab01cda64ae7630c0d3', '[\"*\"]', NULL, '2021-04-06 10:17:05', '2021-04-06 10:17:05'),
(128, 'App\\Models\\User', 103, 'token', '4be4bf41d21d5abb032696bdae7236733a17d03cc2a30b8889b9e4d784825d0f', '[\"*\"]', '2021-04-06 10:21:19', '2021-04-06 10:17:20', '2021-04-06 10:21:19'),
(129, 'App\\Models\\User', 103, 'token', 'a35ba7b8a406d6b10ac56994b42bcac33db42e347071786b39f8882d7f5c7081', '[\"*\"]', NULL, '2021-04-06 10:18:13', '2021-04-06 10:18:13'),
(130, 'App\\Models\\User', 103, 'token', '7be7c8842759a4d31286ced7f1705a8aad1dd231ab64e00fbaba786f00818fa5', '[\"*\"]', '2021-04-06 10:23:34', '2021-04-06 10:21:29', '2021-04-06 10:23:34'),
(131, 'App\\Models\\User', 103, 'token', '58dc4faa2d463a06f1db64544c33eb1668e9b1548063024d3d2d62d799b77086', '[\"*\"]', NULL, '2021-04-06 10:22:58', '2021-04-06 10:22:58'),
(132, 'App\\Models\\User', 103, 'token', '6024e720ef91c8398c5134c10ed5a8dfda7906de8b6cab0c14e34bb2159e5753', '[\"*\"]', '2021-04-06 10:24:07', '2021-04-06 10:23:57', '2021-04-06 10:24:07'),
(133, 'App\\Models\\User', 103, 'token', '09855766a29bc3f236d4ed5f3dfd3d004261bafe7dc4089e4bfd029e15cb6610', '[\"*\"]', NULL, '2021-04-06 10:24:18', '2021-04-06 10:24:18'),
(134, 'App\\Models\\User', 103, 'token', '8c95d047b4dc59597d25ad4c1daf63d25803c8956486486144b6ca632ef73f9b', '[\"*\"]', NULL, '2021-04-06 10:25:47', '2021-04-06 10:25:47'),
(135, 'App\\Models\\User', 103, 'token', '55f028f43b8929c8d9cbf57ba0cc9068e34bc5b10c617c72e231e9ac0638d3cd', '[\"*\"]', NULL, '2021-04-06 10:25:59', '2021-04-06 10:25:59'),
(136, 'App\\Models\\User', 103, 'token', '8f8f77fe9db8fbdfd69bbef8a4695ce877168524c3fa379ef4e82a13dc24e6bc', '[\"*\"]', NULL, '2021-04-06 10:26:23', '2021-04-06 10:26:23'),
(137, 'App\\Models\\User', 103, 'token', 'd69cf85df24ab600a12e3dfce8ce689e7f3434b75d6439f4a452e85b301494c5', '[\"*\"]', NULL, '2021-04-06 10:26:38', '2021-04-06 10:26:38'),
(138, 'App\\Models\\User', 103, 'token', 'b86e8a5786d3bcf876d286dd941f6d5a79ea7dcc94c38718c065ae2793ef2c6e', '[\"*\"]', NULL, '2021-04-06 10:26:43', '2021-04-06 10:26:43'),
(139, 'App\\Models\\User', 103, 'token', 'ae5c836eab39bcb9c6d4fd50efa28f2021f6266296bf4619ee0d74de89b0c594', '[\"*\"]', NULL, '2021-04-06 10:27:02', '2021-04-06 10:27:02'),
(140, 'App\\Models\\User', 103, 'token', '67cad7a69d3d42e47da6d179f185a9d5789eb2244e4303498c600548091f6080', '[\"*\"]', NULL, '2021-04-06 10:27:28', '2021-04-06 10:27:28'),
(141, 'App\\Models\\User', 103, 'token', 'ea4f8cfa824159a3fbb13d91b4f7b68863ca1fbf1e22c4c2715ab8e9bcc8b3e0', '[\"*\"]', NULL, '2021-04-06 10:27:50', '2021-04-06 10:27:50'),
(142, 'App\\Models\\User', 103, 'token', 'ae6d739bf550d833561ee3ffaa9d71820fe6187658a35023d2b248b87bf20c77', '[\"*\"]', NULL, '2021-04-06 10:28:08', '2021-04-06 10:28:08'),
(143, 'App\\Models\\User', 103, 'token', 'fdb8201edf342b9e42d91604edb6131039eda869b862e1986a7b5b2dd9d3dc00', '[\"*\"]', NULL, '2021-04-06 10:28:15', '2021-04-06 10:28:15'),
(144, 'App\\Models\\User', 103, 'token', '680c4ac72b3f270173cfff538496946deac932d81fbc5190a93f4f566bfe0c15', '[\"*\"]', NULL, '2021-04-06 10:28:16', '2021-04-06 10:28:16'),
(145, 'App\\Models\\User', 103, 'token', 'f5be1122499ea771839ba74b7d47011aa3748cc72bfe044da45a87dacceff09f', '[\"*\"]', NULL, '2021-04-06 10:28:17', '2021-04-06 10:28:17'),
(146, 'App\\Models\\User', 103, 'token', 'cfbfa5b87ff7a3eed217c81c4e265329555e37ad79b0301fd7e8775f2d590108', '[\"*\"]', NULL, '2021-04-06 10:28:29', '2021-04-06 10:28:29'),
(147, 'App\\Models\\User', 103, 'token', '62c0aa6ff61264cebdce4e84c68332dba57a1319d1dcabd33e83f9ddabdace9f', '[\"*\"]', '2021-04-06 10:29:59', '2021-04-06 10:29:55', '2021-04-06 10:29:59'),
(148, 'App\\Models\\User', 103, 'token', 'c995aa133ad997346b172d61c9d065db0ac1023cd00b0fa2b677b74f2e66a582', '[\"*\"]', NULL, '2021-04-06 10:30:02', '2021-04-06 10:30:02'),
(149, 'App\\Models\\User', 103, 'token', '54570423bf7e57f091553bbd4751579cc97e616a656ed4f6a6d2c504f322506c', '[\"*\"]', NULL, '2021-04-06 10:30:15', '2021-04-06 10:30:15'),
(150, 'App\\Models\\User', 103, 'token', 'de3e3da44b1d5f805084940b568c7b53bbc24072f1ec69f994090fd9aad8e232', '[\"*\"]', NULL, '2021-04-06 10:31:48', '2021-04-06 10:31:48'),
(151, 'App\\Models\\User', 103, 'token', 'c90201daf30d7ddedaad1f0a4a590d643c7761568b6cb516671c58aa88b591fa', '[\"*\"]', NULL, '2021-04-06 10:31:50', '2021-04-06 10:31:50'),
(152, 'App\\Models\\User', 103, 'token', 'fc37a463d8025d79ba67b9047f7b8815d32f988f829a22986823b3d804670a54', '[\"*\"]', NULL, '2021-04-06 10:31:52', '2021-04-06 10:31:52'),
(153, 'App\\Models\\User', 103, 'token', '3171f5cf37f3731b9b5326e72a19bcf2626b8d7d5d80f4b1d63c9d355add7b36', '[\"*\"]', NULL, '2021-04-06 10:31:55', '2021-04-06 10:31:55'),
(154, 'App\\Models\\User', 103, 'token', '54b4cb8a765512de9d0fb556e9359bb3e5c52e616cc0ae99e4540c29e6c288f9', '[\"*\"]', NULL, '2021-04-06 10:32:01', '2021-04-06 10:32:01'),
(155, 'App\\Models\\User', 103, 'token', '3b0fcfe426999e608be880ee9174642bfe17905817fbbed8dfc700318465bae9', '[\"*\"]', NULL, '2021-04-06 10:32:27', '2021-04-06 10:32:27'),
(156, 'App\\Models\\User', 103, 'token', '4d86a969fb7568ace90378948353f3f856f80b5d61e3e8391448bc083661c762', '[\"*\"]', NULL, '2021-04-06 10:32:29', '2021-04-06 10:32:29'),
(157, 'App\\Models\\User', 103, 'token', '7b143c6f8da9c27f4942ee65fc3840feee696c46b91c5ece1aca5900e0196f2b', '[\"*\"]', NULL, '2021-04-06 10:32:37', '2021-04-06 10:32:37'),
(158, 'App\\Models\\User', 103, 'token', '0a23bab5951e4011fd9e99f123c70cfa96001c9e69663ea531bcdb62ffe3515f', '[\"*\"]', NULL, '2021-04-06 10:32:48', '2021-04-06 10:32:48'),
(159, 'App\\Models\\User', 103, 'token', '430a5e6d17abeec763ef060ea51b24b9c76a9246f1abca9b01c28a404ee3497c', '[\"*\"]', NULL, '2021-04-06 10:33:01', '2021-04-06 10:33:01'),
(160, 'App\\Models\\User', 103, 'token', 'f00a6d5b15115fb1d3101f973afd610560889ec0460cfded20b940cdb1be42e8', '[\"*\"]', NULL, '2021-04-06 10:33:09', '2021-04-06 10:33:09'),
(161, 'App\\Models\\User', 103, 'token', 'b63b22b0a055956a61df7c45cd7d99d4be0f80c14c78a3723a3223a551431654', '[\"*\"]', NULL, '2021-04-06 10:33:18', '2021-04-06 10:33:18'),
(162, 'App\\Models\\User', 103, 'token', '9fe3c978110aa258a39cc85e943c2a272bf8456cf39c43cb7ad0752f5cf2a8e2', '[\"*\"]', NULL, '2021-04-06 10:33:28', '2021-04-06 10:33:28'),
(163, 'App\\Models\\User', 103, 'token', '3fcddfb34bc1b97bb35c85916d399ccbf6c7a22dd84d29449dd4742e957b42ea', '[\"*\"]', '2021-04-06 10:37:39', '2021-04-06 10:37:27', '2021-04-06 10:37:39'),
(164, 'App\\Models\\User', 103, 'token', 'a21ca83a87c4016ee831f033d57cc7b3df923e01f374801633ef76523f312d78', '[\"*\"]', '2021-04-06 10:38:00', '2021-04-06 10:37:45', '2021-04-06 10:38:00'),
(165, 'App\\Models\\User', 103, 'token', '967b1437650664194a97d721d014ae08894043e26decd96524e7246bda443706', '[\"*\"]', NULL, '2021-04-06 10:40:05', '2021-04-06 10:40:05'),
(166, 'App\\Models\\User', 103, 'token', '5b99bb98e3e92f4737450f887ff7685e1a5bbea0f0f3d18507f6a1f0c2fd7c77', '[\"*\"]', NULL, '2021-04-06 10:40:08', '2021-04-06 10:40:08'),
(167, 'App\\Models\\User', 103, 'token', '6a99f464b8c12cd75b2d7377ee2796b82328648e498ef30b5d1b6d9f0b109574', '[\"*\"]', '2021-04-06 10:40:39', '2021-04-06 10:40:17', '2021-04-06 10:40:39'),
(168, 'App\\Models\\User', 103, 'token', '3a038c8c7ce1a72dc1ef0ce20793d728cd180275a6a492cf1052b3f799207a81', '[\"*\"]', NULL, '2021-04-06 10:40:57', '2021-04-06 10:40:57'),
(169, 'App\\Models\\User', 103, 'token', '4b968773d38fd1a76d6be3503dbc6cbdb1de9a7ead59b556dc2bfaf583cc2726', '[\"*\"]', NULL, '2021-04-06 10:41:24', '2021-04-06 10:41:24'),
(170, 'App\\Models\\User', 103, 'token', '4002555b1544c27be8a5bafd7ab5e93f79de77dabf8d1b916672d483a2580bf0', '[\"*\"]', NULL, '2021-04-06 10:41:44', '2021-04-06 10:41:44'),
(171, 'App\\Models\\User', 103, 'token', '986b05a10cd2d8ddce862f3a778fb364b88577f2c186fce54a18b265745fc482', '[\"*\"]', '2021-04-06 10:42:00', '2021-04-06 10:41:57', '2021-04-06 10:42:00'),
(172, 'App\\Models\\User', 103, 'token', '0ddde0bc91a237d0d33aa8b946675de2e55da408dbcdfe7ac4fd65abb578590e', '[\"*\"]', NULL, '2021-04-06 10:42:15', '2021-04-06 10:42:15'),
(173, 'App\\Models\\User', 103, 'token', '861152d91d5dd7aeb34a3aa5b38aee0ea633d3fe301560febae9d1ec91b98a7d', '[\"*\"]', '2021-04-06 10:57:00', '2021-04-06 10:42:35', '2021-04-06 10:57:00'),
(174, 'App\\Models\\User', 103, 'token', '4a9be189a7874d400581478fc2e920a3e28047d6a9ce7ea4d6f394648d6152f7', '[\"*\"]', NULL, '2021-04-06 10:43:49', '2021-04-06 10:43:49'),
(175, 'App\\Models\\User', 103, 'token', '99c8962452d33b6f1a6be0d5d57df502384668b75f23c6d1e2119d11061a4408', '[\"*\"]', NULL, '2021-04-06 10:45:40', '2021-04-06 10:45:40'),
(176, 'App\\Models\\User', 103, 'token', '23e6d91cbbe3b7480cc1a47348286344fa3db007d057574bdcd27882f2a7a0fc', '[\"*\"]', '2021-04-07 07:05:40', '2021-04-06 11:10:00', '2021-04-07 07:05:40'),
(177, 'App\\Models\\User', 104, 'token', 'eb4f731f2c2beaffc0b6cb48e040f1b617871d241c2f3abe54c82899bcb505cf', '[\"*\"]', '2021-04-07 07:07:42', '2021-04-07 07:06:04', '2021-04-07 07:07:42'),
(178, 'App\\Models\\User', 104, 'token', 'e47ccf19b73b7cf9561dce422c76dadfb62a0a0c683bf77781db892cd4a9cb83', '[\"*\"]', '2021-04-07 07:54:32', '2021-04-07 07:07:54', '2021-04-07 07:54:32'),
(179, 'App\\Models\\User', 104, 'token', '41f1aa1c123bf959b85f76d461dd173e33ee6563916681db8945e15cd2799ec6', '[\"*\"]', NULL, '2021-04-07 07:20:58', '2021-04-07 07:20:58'),
(180, 'App\\Models\\User', 103, 'token', '4bdce863f421ce5f754de9937b16bb838a689c9ebb4d8d8663560c44cd685006', '[\"*\"]', NULL, '2021-04-07 07:21:47', '2021-04-07 07:21:47'),
(181, 'App\\Models\\User', 104, 'token', '5dde4e2de5b4deb5e97beb3950cbe06c031a6599ee7549df55505696ea473e96', '[\"*\"]', NULL, '2021-04-07 07:22:19', '2021-04-07 07:22:19'),
(182, 'App\\Models\\User', 103, 'token', '1c10f6955065d5aa84b951165d9c0c561a400d515bddcad8a7f7a0e134cd9983', '[\"*\"]', NULL, '2021-04-07 07:29:25', '2021-04-07 07:29:25'),
(183, 'App\\Models\\User', 104, 'token', '8249ac0a04577ceff50ea9a01842bdd1f3bfd581083f934016c11075045658cc', '[\"*\"]', NULL, '2021-04-07 07:48:46', '2021-04-07 07:48:46'),
(184, 'App\\Models\\User', 103, 'token', '5f18fe1c69c97573cd6c54b60de71dcb064fb898bdc3653b4ba95ce2e324332a', '[\"*\"]', '2021-04-07 08:14:34', '2021-04-07 07:54:41', '2021-04-07 08:14:34'),
(185, 'App\\Models\\User', 103, 'token', '35a95ee2a39a43adb3f79b62e208d80de55823d6ef5ae833101a21567c358cc9', '[\"*\"]', NULL, '2021-04-07 07:56:36', '2021-04-07 07:56:36'),
(186, 'App\\Models\\User', 103, 'token', '5e8a97c2519321778979eceada764cec4c9ed363ba2803087be401b37175c847', '[\"*\"]', NULL, '2021-04-07 07:58:00', '2021-04-07 07:58:00'),
(187, 'App\\Models\\User', 103, 'token', '32125b5daa08b8b76b6f09dc0c3b7f6c0e71fa486be04e064f928783afabe22d', '[\"*\"]', NULL, '2021-04-07 07:59:02', '2021-04-07 07:59:02'),
(188, 'App\\Models\\User', 103, 'token', '58ccf516bdcd3c7a41674a89aae3fb51bdde0645aab6c57c2345bfc247306679', '[\"*\"]', NULL, '2021-04-07 07:59:48', '2021-04-07 07:59:48'),
(189, 'App\\Models\\User', 103, 'token', '1601381d3452f41726fd111ece17a0e980a0cdd027cccb332d413c066eb5dc92', '[\"*\"]', NULL, '2021-04-07 08:00:25', '2021-04-07 08:00:25'),
(190, 'App\\Models\\User', 103, 'token', 'd4e22650947ec059e5a2ae963167db90ebc3cc8fa14556c9d0463e52b5762a36', '[\"*\"]', NULL, '2021-04-07 08:00:41', '2021-04-07 08:00:41'),
(191, 'App\\Models\\User', 103, 'token', 'c0e05e19ed235ce63687a78089914f6896af35f1db044de6d91cf2665533bc8b', '[\"*\"]', NULL, '2021-04-07 08:01:19', '2021-04-07 08:01:19'),
(192, 'App\\Models\\User', 103, 'token', 'ec8d31e319217b2744355a08585ea9c7c1b7c997c5119b078051ad7a3ad35492', '[\"*\"]', NULL, '2021-04-07 08:01:53', '2021-04-07 08:01:53'),
(193, 'App\\Models\\User', 103, 'token', '2a4c3cc5ae39049a493c69fa730d3e392d2aa1b3abb8ed1af0bba14ea7b95cb4', '[\"*\"]', NULL, '2021-04-07 08:05:35', '2021-04-07 08:05:35'),
(194, 'App\\Models\\User', 103, 'token', '41f684ba732a395fe4a8d54782f4ebb1103175e4f4cf56b7c5679ce9034fea39', '[\"*\"]', NULL, '2021-04-07 08:07:16', '2021-04-07 08:07:16'),
(195, 'App\\Models\\User', 103, 'token', 'e2910aa640295d167c7e32258b3d79bfe62127e164c59575f78391dc8f19a5e7', '[\"*\"]', NULL, '2021-04-07 08:08:04', '2021-04-07 08:08:04'),
(196, 'App\\Models\\User', 103, 'token', '2e31c8db1147db2d8226b9988d54588ca7121bea66e3c2e2817edfa7e925aac9', '[\"*\"]', NULL, '2021-04-07 08:08:36', '2021-04-07 08:08:36'),
(197, 'App\\Models\\User', 103, 'token', '141932691ca97d09968684b731e5ea5feae30e3e80f1b8e4cf40f40d4882eed8', '[\"*\"]', NULL, '2021-04-07 08:09:52', '2021-04-07 08:09:52'),
(198, 'App\\Models\\User', 103, 'token', 'a4081f121af800f5a69440b01d910fa1c73aa16ca8da6898374a630c269ba3fc', '[\"*\"]', '2021-04-07 08:23:48', '2021-04-07 08:15:55', '2021-04-07 08:23:48'),
(199, 'App\\Models\\User', 103, 'token', '0a5660df76ec54c8c4a76ccf05c767f07fef1d9008ebb3f5eec5acff7eeaebd3', '[\"*\"]', NULL, '2021-04-07 08:18:07', '2021-04-07 08:18:07'),
(200, 'App\\Models\\User', 103, 'token', '4b4e24f6f4a2d8fa9f1364393e4ac9b6e464c6e82b3c5667f0868cfb373654b4', '[\"*\"]', NULL, '2021-04-07 08:20:33', '2021-04-07 08:20:33'),
(201, 'App\\Models\\User', 103, 'token', 'a5f707c987798876d5f257f03fb987a77faeedba129d9c78e0aaf6a7db89b6b6', '[\"*\"]', '2021-04-07 08:57:43', '2021-04-07 08:24:20', '2021-04-07 08:57:43'),
(202, 'App\\Models\\User', 103, 'token', '70d32926b99037304438f9a1d8ffeb0f08aca974285c9151039e8cb3f1214f63', '[\"*\"]', NULL, '2021-04-07 08:48:52', '2021-04-07 08:48:52'),
(203, 'App\\Models\\User', 103, 'token', '7e81b2a3acfa8c6d596a6e2ab73b0dc664ee42887e2d81135df1d16a71550ceb', '[\"*\"]', NULL, '2021-04-07 08:50:30', '2021-04-07 08:50:30'),
(204, 'App\\Models\\User', 103, 'token', '0f86035b32f14f68ecbd82d05f0aa68ba33b153af8d4b9a274a74b7ecde7013f', '[\"*\"]', NULL, '2021-04-07 08:55:12', '2021-04-07 08:55:12'),
(205, 'App\\Models\\User', 104, 'token', 'c951ac1acec984d28eae171ec80f89ec33ef1ec5fd4d10f9cc8d197cad17ea55', '[\"*\"]', NULL, '2021-04-07 08:57:27', '2021-04-07 08:57:27'),
(206, 'App\\Models\\User', 104, 'token', '2d3431d316473e7c90cf027591343e0caae13ef18af70a134eedd3a7d3d8784e', '[\"*\"]', '2021-04-08 06:37:44', '2021-04-07 08:57:51', '2021-04-08 06:37:44'),
(207, 'App\\Models\\User', 103, 'token', 'bdf9d3d4ad1a5d686580de14c32e930114e90b59153db0e56ae9c1c77e9aa626', '[\"*\"]', NULL, '2021-04-07 09:03:44', '2021-04-07 09:03:44'),
(208, 'App\\Models\\User', 103, 'token', '52753a5dc5d9edc0c351e853e0ba09628cf0737e25f0ad44cf01a2206057fcb8', '[\"*\"]', NULL, '2021-04-08 06:14:31', '2021-04-08 06:14:31'),
(209, 'App\\Models\\User', 103, 'token', 'aa79c8e1be81ab58359483ad35d6f6bd15c390eec99d14b84ddffc9242ab8de4', '[\"*\"]', NULL, '2021-04-08 06:15:31', '2021-04-08 06:15:31'),
(210, 'App\\Models\\User', 103, 'token', '0382c2c0bf8291a762649a97b7c0167395d7cd78fd3cfcb994fa87131a670af2', '[\"*\"]', NULL, '2021-04-08 06:18:56', '2021-04-08 06:18:56'),
(211, 'App\\Models\\User', 103, 'token', 'a2ca891ab1b4020188bc8b56ce0fdbf637c490923086162baf650ca6923796d6', '[\"*\"]', NULL, '2021-04-08 06:19:34', '2021-04-08 06:19:34'),
(212, 'App\\Models\\User', 103, 'token', '1252521ae3244537b09e1ac4e4c1c38a99b79a17e01e3c0cc7ea95bf9f51070c', '[\"*\"]', NULL, '2021-04-08 06:20:09', '2021-04-08 06:20:09'),
(213, 'App\\Models\\User', 103, 'token', 'e4aa2933607ec63548ce029dc146674908d18289e696e46f2d5f9c6c892cd196', '[\"*\"]', NULL, '2021-04-08 06:20:47', '2021-04-08 06:20:47'),
(214, 'App\\Models\\User', 103, 'token', '280cd7c3f51b8d586ffa45b8efc1b2dc7266cbd9df33e8e1c7defac0f4ec6169', '[\"*\"]', NULL, '2021-04-08 06:21:23', '2021-04-08 06:21:23'),
(215, 'App\\Models\\User', 103, 'token', '6da1aafb7a8e95270f443fd56c7f2bc57113947fc317b9cb734c271d387128c9', '[\"*\"]', NULL, '2021-04-08 06:32:36', '2021-04-08 06:32:36'),
(216, 'App\\Models\\User', 103, 'token', '72de08a2eebb80b186ee5d1c716db71a3b128b8acaef4f52f33eb8281bfbcc7d', '[\"*\"]', '2021-04-08 07:01:41', '2021-04-08 06:34:32', '2021-04-08 07:01:41'),
(217, 'App\\Models\\User', 103, 'token', '0a4d01ecf4eef5db5819634a4ed6fd3a8c29cbfa272b6ee1626ce64dc6930161', '[\"*\"]', NULL, '2021-04-08 06:38:56', '2021-04-08 06:38:56'),
(218, 'App\\Models\\User', 103, 'token', 'bbe2c97dc1a0f73f20b7e2410827380440e9bc7b84a4d3ada89dda82de841a10', '[\"*\"]', NULL, '2021-04-08 06:40:11', '2021-04-08 06:40:11'),
(219, 'App\\Models\\User', 103, 'token', '79bcb23984bb9dde8254b3f3b20cfc473f0f981dfd7b7bdb7cca7b2788e41c32', '[\"*\"]', '2021-04-08 07:04:48', '2021-04-08 06:41:15', '2021-04-08 07:04:48'),
(220, 'App\\Models\\User', 103, 'token', '92d3a6ae20512d9bc6ce0c7d438397323a54b40af6b4499e67b125283f452965', '[\"*\"]', NULL, '2021-04-08 06:41:57', '2021-04-08 06:41:57'),
(221, 'App\\Models\\User', 103, 'token', 'ed69b5341831905b8dda835f7c5d5eeb2be3db6a205cc76fe2c65e24c8174f8c', '[\"*\"]', NULL, '2021-04-08 06:43:25', '2021-04-08 06:43:25'),
(222, 'App\\Models\\User', 103, 'token', '3d38fbb8bcb82fb3a394ff431043a3154784cc5ed6830d8104d3a6d684acbbeb', '[\"*\"]', NULL, '2021-04-08 06:46:25', '2021-04-08 06:46:25'),
(223, 'App\\Models\\User', 103, 'token', 'e774786d395e0deaf51c993f3eb4e97a6aaa4ae4774f3baae7a27025d91746aa', '[\"*\"]', NULL, '2021-04-08 06:47:28', '2021-04-08 06:47:28'),
(224, 'App\\Models\\User', 103, 'token', 'c5c9b7ae81fbff90bb24268c06d31f239049c31817aaee82cba34c098c59f9ef', '[\"*\"]', '2021-04-08 06:56:16', '2021-04-08 06:48:38', '2021-04-08 06:56:16'),
(225, 'App\\Models\\User', 103, 'token', '7c0ade42061a4d7f49e910098899289019940cf6000357010aba07010326822e', '[\"*\"]', NULL, '2021-04-08 06:51:39', '2021-04-08 06:51:39'),
(226, 'App\\Models\\User', 103, 'token', '04929cb15306eb120b06669a87eaebe5f5c4904d6e6a3c9714f3953a360b0887', '[\"*\"]', '2021-04-08 06:58:42', '2021-04-08 06:58:32', '2021-04-08 06:58:42'),
(227, 'App\\Models\\User', 103, 'token', 'e6d93ff13538348abeaf29c71c9961ccf34a3f247afa3b15063c4e97d3631da4', '[\"*\"]', '2021-04-08 06:59:32', '2021-04-08 06:59:29', '2021-04-08 06:59:32'),
(228, 'App\\Models\\User', 103, 'token', '421a0286331fd59a5e3adcf8ba511f2c1032104b7ed8f77e433ee91ec0e29b9f', '[\"*\"]', NULL, '2021-04-08 06:59:46', '2021-04-08 06:59:46'),
(229, 'App\\Models\\User', 103, 'token', 'a19111f020f637d233883ff1cfd0652c17630ab90301b12b2f8a5f4e05e8b4ca', '[\"*\"]', NULL, '2021-04-08 07:02:41', '2021-04-08 07:02:41'),
(230, 'App\\Models\\User', 103, 'token', '6bfc945c2244da074836871598d118a9418c50d366bbed196bcd0e5552ad328b', '[\"*\"]', NULL, '2021-04-08 07:03:51', '2021-04-08 07:03:51'),
(231, 'App\\Models\\User', 103, 'token', '8db6f634abb65d13166f3e7afe185aec0e28b4fb98e2ceb61a5a39c0e016e9e9', '[\"*\"]', '2021-04-08 07:05:24', '2021-04-08 07:05:20', '2021-04-08 07:05:24'),
(232, 'App\\Models\\User', 103, 'token', 'd5b66ca5df939c45808fd8a75a3c24c1d91e0a4edcf0261479417bde886d0cb6', '[\"*\"]', NULL, '2021-04-08 07:10:45', '2021-04-08 07:10:45'),
(233, 'App\\Models\\User', 103, 'token', '358ce80cecdfbf4e0a90665aa0e20c97eb8b87049a201ad0489a331f3b7d03de', '[\"*\"]', NULL, '2021-04-08 07:10:46', '2021-04-08 07:10:46'),
(234, 'App\\Models\\User', 103, 'token', 'd5af383dd8127f20a99db9dd7de558f178cf8f44a38521da896b7a07bd0abefd', '[\"*\"]', NULL, '2021-04-08 07:22:08', '2021-04-08 07:22:08'),
(235, 'App\\Models\\User', 103, 'token', '3e8b4c3e56f776dc38961444d21e08f5e45cf48fce5fae896ec63a5f66472fcb', '[\"*\"]', NULL, '2021-04-08 07:22:38', '2021-04-08 07:22:38'),
(236, 'App\\Models\\User', 103, 'token', '91af077102d86857004ed5a1175c8121f01f07029a9ebf9ae720c38f7f22f1a2', '[\"*\"]', '2021-04-08 07:23:00', '2021-04-08 07:22:52', '2021-04-08 07:23:00'),
(237, 'App\\Models\\User', 103, 'token', 'ca7ff4cd2db25a9fcdab7e64c621ad21ef3516d33db10491666b456f04d79705', '[\"*\"]', '2021-04-08 07:26:13', '2021-04-08 07:25:36', '2021-04-08 07:26:13'),
(238, 'App\\Models\\User', 103, 'token', '34c9eecf03133ee564e4474d778253480ca2919f6d6925af033f043eb5b79acb', '[\"*\"]', '2021-04-08 07:27:29', '2021-04-08 07:27:28', '2021-04-08 07:27:29'),
(239, 'App\\Models\\User', 103, 'token', 'c57e9c872ef3c2a3d1f45c92e17a3bad52c93609180c652641628e4000ceea59', '[\"*\"]', '2021-04-09 07:57:16', '2021-04-08 08:42:07', '2021-04-09 07:57:16'),
(240, 'App\\Models\\User', 103, 'token', '5489f2a976b8c8457d8d8fee0e14766482a5aec5808c56601f61e03f3b3aa0d7', '[\"*\"]', NULL, '2021-04-09 07:59:44', '2021-04-09 07:59:44'),
(241, 'App\\Models\\User', 103, 'token', 'b6b3f499a670e5e87efc3b4394939d03db0a22660abb91253fbe02b789d67fc8', '[\"*\"]', NULL, '2021-04-09 08:00:01', '2021-04-09 08:00:01'),
(242, 'App\\Models\\User', 103, 'token', '8344255426d188a47c35df6f174629ec403869d369fe5027f0bcec0ebf68484e', '[\"*\"]', '2021-04-09 08:02:39', '2021-04-09 08:00:50', '2021-04-09 08:02:39'),
(243, 'App\\Models\\User', 103, 'token', '0ec1c56198e625e9bffbf5f1107deadebc42b6dddc8d2d6998e28150cfabac8e', '[\"*\"]', '2021-04-11 05:30:50', '2021-04-11 05:27:17', '2021-04-11 05:30:50'),
(244, 'App\\Models\\User', 103, 'token', 'c46940b20a7c69b667ee4a84d5c192e4f147307b0bafda589bc063fcae57a6f3', '[\"*\"]', '2021-04-11 05:31:40', '2021-04-11 05:30:57', '2021-04-11 05:31:40'),
(245, 'App\\Models\\User', 103, 'token', 'eb21eda45e4419fd6675b2a14dcfbee659e272348af290318257259d0d799c39', '[\"*\"]', '2021-04-11 07:52:56', '2021-04-11 05:31:49', '2021-04-11 07:52:56'),
(246, 'App\\Models\\User', 104, 'token', '32bc04ee969852396ceac79c0e7ce5701618a3c6e398aefb7d8984af0f7a531a', '[\"*\"]', '2021-04-11 08:09:06', '2021-04-11 07:53:03', '2021-04-11 08:09:06'),
(247, 'App\\Models\\User', 103, 'token', 'af84ebf3d1a25cd9bbb2f018dd2ad7fa22a6f16debd0af94b83ba32ddffdf895', '[\"*\"]', '2021-04-11 08:09:10', '2021-04-11 08:09:08', '2021-04-11 08:09:10'),
(248, 'App\\Models\\User', 103, 'token', '935734bba7fd5c5d85f5a921bd73ab2ffd9db8101747b3a4e93b6b7fbc91ab5e', '[\"*\"]', '2021-04-11 08:10:25', '2021-04-11 08:09:09', '2021-04-11 08:10:25'),
(249, 'App\\Models\\User', 103, 'token', 'c9f0a30dc3a00b4d6f9294d3d8206707dd955c75adb7333cfdc2ec9f7f7bfc34', '[\"*\"]', '2021-04-11 08:10:40', '2021-04-11 08:10:33', '2021-04-11 08:10:40'),
(250, 'App\\Models\\User', 104, 'token', 'fe226e69d8b074f9510fc7f4e495cecf6dc1dfb9ba7b9b2ef8cf86c54a6cf101', '[\"*\"]', '2021-04-11 08:10:52', '2021-04-11 08:10:46', '2021-04-11 08:10:52'),
(251, 'App\\Models\\User', 103, 'token', 'be7dcd3a2cc4c9a09684c64b8e84fbc88c479b71908b8724285577b17ff28b7c', '[\"*\"]', '2021-04-11 08:11:46', '2021-04-11 08:10:58', '2021-04-11 08:11:46'),
(252, 'App\\Models\\User', 103, 'token', '782755405b1dac76e755adbb9dad1299825126e1215f02ed83c2aa6532d2d11f', '[\"*\"]', '2021-04-11 08:12:27', '2021-04-11 08:11:57', '2021-04-11 08:12:27'),
(253, 'App\\Models\\User', 103, 'token', '246a177540f222833bd6a8a43682beee3dc94ea4bf560b0f1d87ba61691cf6c7', '[\"*\"]', '2021-04-11 09:57:21', '2021-04-11 08:12:33', '2021-04-11 09:57:21'),
(254, 'App\\Models\\User', 103, 'token', '6a6feb7295c45e28e6f764c340fcd67edd811b929b257fa1aba5c8f659953764', '[\"*\"]', '2021-04-11 11:26:33', '2021-04-11 09:58:57', '2021-04-11 11:26:33'),
(255, 'App\\Models\\User', 103, 'token', 'd0b228a6eed5c13c4478a5de4a76e2cc5caad0581ffc613002801273bba46702', '[\"*\"]', '2021-04-11 12:08:39', '2021-04-11 11:26:34', '2021-04-11 12:08:39'),
(256, 'App\\Models\\User', 104, 'token', '57cbec3e806f46356ef58319660efcd602ddb1ae263334eb7b6ab9dd1048ec92', '[\"*\"]', '2021-04-11 12:18:54', '2021-04-11 12:08:55', '2021-04-11 12:18:54'),
(257, 'App\\Models\\User', 103, 'token', 'b1a65acff532083725e865ed70aea65a50ace59056cebd149d4bbca3309b5bd5', '[\"*\"]', NULL, '2021-04-11 12:20:06', '2021-04-11 12:20:06'),
(258, 'App\\Models\\User', 103, 'token', '922690a7b242d9df34d8693fa5cc36e03887086c688b8bca4047e96bc92a77c9', '[\"*\"]', NULL, '2021-04-11 12:20:17', '2021-04-11 12:20:17'),
(259, 'App\\Models\\User', 103, 'token', 'fc811e95bdeb8233a105a5838e944000cfe94cf2ba382167c970e22dff3a7e22', '[\"*\"]', '2021-04-11 12:23:17', '2021-04-11 12:23:05', '2021-04-11 12:23:17'),
(260, 'App\\Models\\User', 104, 'token', '68d9d13cf310de8a3b66c66f3f2402839c983131d6be146d7ac5a95bb807ced4', '[\"*\"]', '2021-04-11 12:41:00', '2021-04-11 12:23:25', '2021-04-11 12:41:00'),
(261, 'App\\Models\\User', 103, 'token', '2661f32f31fd36e2b76a7edf654fbc557b1af8f5149b9e16cbbcb76283933089', '[\"*\"]', '2021-04-11 13:36:16', '2021-04-11 12:42:19', '2021-04-11 13:36:16'),
(262, 'App\\Models\\User', 103, 'token', 'd7c95511fc1582ea3e5c798bcda7c05a4d1af4ab626bfbae148ec0389419e7c9', '[\"*\"]', '2021-04-11 13:36:44', '2021-04-11 13:36:24', '2021-04-11 13:36:44'),
(263, 'App\\Models\\User', 104, 'token', 'a8d658e0495a983f7128f0c80bc6430cc2b34f3f5e81e5150cd98ff5bd7a9177', '[\"*\"]', '2021-04-11 13:58:44', '2021-04-11 13:41:29', '2021-04-11 13:58:44'),
(264, 'App\\Models\\User', 103, 'token', '5ee0136f5aac33080439198ed39cac409a19d5a0913e5a8c299037c56a631fc5', '[\"*\"]', '2021-04-11 15:32:29', '2021-04-11 13:58:54', '2021-04-11 15:32:29'),
(265, 'App\\Models\\User', 104, 'token', '32c0f87ceeb69e1e23c600f26cbbcf6055aa39ce8ccdf76a502524b1dac27d73', '[\"*\"]', '2021-04-11 15:33:45', '2021-04-11 15:32:44', '2021-04-11 15:33:45'),
(266, 'App\\Models\\User', 103, 'token', '3e2390cd45f55a027f1229cc752ecc1e06607c936e85861583e6df06a5c06664', '[\"*\"]', '2021-04-11 15:34:04', '2021-04-11 15:33:54', '2021-04-11 15:34:04'),
(267, 'App\\Models\\User', 104, 'token', 'feba61626d8f2bd46af217ed90293fca5726b080cb9b8836ad4a1db414aba34f', '[\"*\"]', '2021-04-11 15:34:44', '2021-04-11 15:34:10', '2021-04-11 15:34:44'),
(268, 'App\\Models\\User', 20, 'token', '7f6c9a199847dec7f8b3f8ccbe5f39bd3dd2fc99491464ce33ef904263d8e3ff', '[\"*\"]', '2021-04-11 15:35:18', '2021-04-11 15:35:15', '2021-04-11 15:35:18'),
(269, 'App\\Models\\User', 18, 'token', 'f36a1b3fc44a398d0dd587522ae4f38a91e641b045aeb7e75f4c64cfdfec74e3', '[\"*\"]', '2021-04-11 15:54:51', '2021-04-11 15:37:20', '2021-04-11 15:54:51'),
(270, 'App\\Models\\User', 103, 'token', '729c0d0dfe31c23704654ee4560661141c62a6114fb7f2e1ed95289eef203f16', '[\"*\"]', '2021-04-11 18:11:10', '2021-04-11 15:55:06', '2021-04-11 18:11:10'),
(271, 'App\\Models\\User', 18, 'token', 'dded1a9766bd2271200d37c866a111dca5c4c1c2f570de29484412bdb64ee076', '[\"*\"]', NULL, '2021-04-11 18:04:48', '2021-04-11 18:04:48'),
(272, 'App\\Models\\User', 18, 'token', '2a4116e41c2e5afe4e6a9f23c7ba81dce976749cfdc739adda6ab67c7948508c', '[\"*\"]', NULL, '2021-04-11 18:05:19', '2021-04-11 18:05:19'),
(273, 'App\\Models\\User', 18, 'token', '6d50bb5241c9ff33af07f959f02712ddfab935e02527b0cccc80d352616026bf', '[\"*\"]', NULL, '2021-04-11 18:05:49', '2021-04-11 18:05:49'),
(274, 'App\\Models\\User', 18, 'token', 'cd5f65c3ba05bb7b266a376b949232582db7daad2dc45aa6271c903a526d17a4', '[\"*\"]', '2021-04-12 08:33:53', '2021-04-11 18:11:37', '2021-04-12 08:33:53'),
(275, 'App\\Models\\User', 104, 'token', '7171ee19753cf9709691b6f9498d6a44187d2c45927a42894db87fe3bc1fb9e6', '[\"*\"]', '2021-04-12 08:46:50', '2021-04-12 08:36:57', '2021-04-12 08:46:50'),
(276, 'App\\Models\\User', 104, 'token', '08e0dd42685bf4cd2f29cd80d63376102e60e73ddbb938de5890dac72900e58d', '[\"*\"]', '2021-04-12 08:46:59', '2021-04-12 08:46:55', '2021-04-12 08:46:59'),
(277, 'App\\Models\\User', 18, 'token', '828713dcc9abf3fed93f4f6a2bfa339bb6a8b402a3c302ebc537260a74da7e6c', '[\"*\"]', '2021-04-13 08:14:47', '2021-04-12 08:47:21', '2021-04-13 08:14:47'),
(278, 'App\\Models\\User', 18, 'token', '34c336876ceaecbeb20bb31668fe26f5933b80d6126ff2a7edb7c18cd37c34dc', '[\"*\"]', '2021-04-13 11:50:00', '2021-04-13 09:56:39', '2021-04-13 11:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `priceID` int(11) NOT NULL,
  `export_price` float NOT NULL,
  `recycling_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`priceID`, `export_price`, `recycling_price`) VALUES
(4, 13, 4),
(5, 9, 9),
(6, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user', 'web', '2021-03-11 13:13:56', '2021-03-11 13:13:56'),
(2, 'admin', 'web', '2021-03-11 13:14:27', '2021-03-11 13:14:27'),
(3, 'moderator', 'web', '2021-03-19 11:00:08', '2021-03-19 11:00:08');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `houseID` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `houseID`, `created_at`, `updated_at`) VALUES
(1, 'mikkel', 'mike123', 'g3@gmail.com', '$2y$10$j6Aun09nrWHyzj2cBFi5C.GQ4GD90MFmV0exQxwMb.MDWP3LqxdY2', 0, '2021-02-26 12:35:39', '2021-02-26 15:58:06'),
(2, 'Jerry', 'Jerry2123', 'Jerry123@gmail.com', '$2y$10$VFDKOuRcWa3Q3C.f/kPsWuAPvYwvWsAQsmTgYfh1tA6ug7vZ2KwWC', 0, '2021-02-26 12:37:00', '2021-02-26 16:45:55'),
(3, 'Carl', 'Carl123', 'Carl@gmail.com', '$2y$10$hMmGcHFE2cGOmM5pCvKTaeVgUvZf/6gGnayviHquih3qeOBSNFRNC', 0, '2021-02-26 14:01:07', '2021-02-26 14:01:07'),
(4, 'lala', 'lala123', 'Carl1@gmail.com', '$2y$10$173YJSgqMmMCf77ne.8dg.EWC2.0zyXX5l0B2wj74SSMnUfjwvQoC', 0, '2021-02-26 14:23:11', '2021-02-26 14:23:11'),
(5, 'Max', 'Max13', 'Max@gmail.com', '$2y$10$ooKkAVx8O0SslPHRtvSs1urRZD1I14R/ZaFyGyAVRx5z1c0pqnw1G', 0, '2021-02-26 16:48:35', '2021-02-26 16:48:35'),
(6, 'Lary', 'Lary123', 'Lary@gmail.com', '$2y$10$GfQgML5.UsJ6bNHO8FUfDeUEVzOA1t49/.gxc9tGwiw1mr7SVeabG', 1, '2021-02-27 19:18:49', '2021-02-27 19:18:49'),
(7, 'Lary', 'Lary123', 'Lary1@gmail.com', '$2y$10$bti9XGGuwa.W/EGTrsZ8de9WYYaFnPAdb4MlulFXDdjxmQkhZaFNy', 0, '2021-02-27 19:22:03', '2021-02-27 19:22:03'),
(8, 'dddd', 'aaaa', 'ddaa@gmail.com', '$2y$10$Re/WnMbEcTGWaZz5ZE1XneiBVhunrUE6/Pr8vLE3VlAPp7.cLBhS.', 0, '2021-02-27 20:05:35', '2021-02-27 20:05:35'),
(9, 'dddd', 'aaaa', 'ddaa1@gmail.com', '$2y$10$4THvq5tEyBNmsYikUIG4mOPqc/iXq/sY65.uOr6WgORRYBZmVpQCK', 0, '2021-02-27 20:06:19', '2021-02-27 20:06:19'),
(10, 'aadd', 'aadd', 'aadd@gmail.com', '$2y$10$rkOg2RyP/Gw/ijRHPmw2suBrc4cNL.TLgZWRoEB7hjISOxCODrMo.', 0, '2021-02-27 20:07:54', '2021-02-27 20:07:54'),
(11, 'asdads', 'asdasd', 'asdads@gmail.com', '$2y$10$goXXtCyfSrti4j/..JXView80us5/L36.Z3OueGhVVPQKmIgyBdYe', 0, '2021-02-27 20:14:28', '2021-02-27 20:14:28'),
(12, 'Mike123', '13Mike', 'MMM@gmail.com', '$2y$10$pZBXM4wv/OG3jlqPQ9cwRehFrJ4Fw2Ss56bE/44aLe09vZr8bzS2u', 0, '2021-03-01 15:31:48', '2021-03-01 15:31:48'),
(13, 'ooo', 'ooo', 'ooo@gmail.com', '$2y$10$HmOUXkP6/524Hjx0CB8e9OTDx18SHTDTdH3Azbf67n8uSaSnMKIFu', 0, '2021-03-03 09:57:10', '2021-03-03 09:57:10'),
(14, '111', '111', '111@gmail.com', '$2y$10$dXpiV5CXyNrRRCKeHlWSNuc2A7FEaGl1dDI8Nd5gi68G8Od.3Fa5m', 0, '2021-03-03 10:03:55', '2021-03-03 10:03:55'),
(15, '111', '111', '1111@gmail.com', '$2y$10$UM0f3LmiaZSzNM3X3PCr3eVrOi1eo/t8IGaC4oZSpxUiQWc3tPIGy', 0, '2021-03-03 10:04:34', '2021-03-03 10:04:34'),
(16, '111', '111', '11111@gmail.com', '$2y$10$1lSXo2BwhikhPSO8FjBvJeVPJaOhNL7nIcI/VfOBVeZVy4BfvBIE2', 0, '2021-03-03 10:07:56', '2021-03-03 10:07:56'),
(17, 'asd', 'asd', 'lalalala1@gmail.com', '$2y$10$Xzw/MjyU0K8Sm3wWndarFuYTCMHsVu/cud62EPOX/RZndsgiCE8yy', 11, '2021-03-11 13:22:03', '2021-04-12 12:56:34'),
(18, 'Baiek', 'Egy', 'Baiekr@gmail.com', '$2y$10$ll0Mgc/K1TKwBIAVB1G7LuOstuMT8S9X.cA7d3kkmWdyfLUE4kNAG', 11, '2021-03-11 13:22:55', '2021-04-12 13:38:43'),
(19, 'KKKiii', 'RRRooo', 'kkk@gmail.com', '$2y$10$gKDAKG7T.JY54g2nFpVO9eyq8GkWbx3VPUbnkWyu5JfbKSUwMS1iy', 10, '2021-03-19 10:00:40', '2021-04-12 13:47:07'),
(20, 'moderator', 'moderator', 'moderator@gmail.com', '$2y$10$0KMFAvjjQt33/T2l3PPXCOMYFg0GWrxZ1IXOKpODrumyWBNys8cUO', 12, '2021-03-24 09:43:09', '2021-04-13 08:05:02'),
(21, 'Chaim', 'Corkery', 'marley.glover@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 3, '2021-03-26 08:31:44', '2021-03-26 08:31:44'),
(22, 'Seth', 'Wuckert', 'glover.beaulah@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 6, '2021-03-26 08:31:44', '2021-03-26 08:31:44'),
(23, 'Eloisa', 'Thiel', 'gage08@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '2021-03-26 08:31:44', '2021-03-26 08:31:44'),
(24, 'Noemi', 'Ebert', 'marcellus.schoen@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 5, '2021-03-26 08:31:44', '2021-03-26 08:31:44'),
(25, 'Alfonzo', 'Schuster', 'luz80@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 4, '2021-03-26 08:31:44', '2021-03-26 08:31:44'),
(26, 'Maia', 'Torp', 'okozey@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '2021-03-26 08:31:44', '2021-03-26 08:31:44'),
(27, 'Evalyn', 'Luettgen', 'stiedemann.annamae@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '2021-03-26 08:31:44', '2021-03-26 08:31:44'),
(28, 'Dean', 'Hodkiewicz', 'jacobson.danyka@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '2021-03-26 08:31:44', '2021-03-26 08:31:44'),
(29, 'Clair', 'Kemmer', 'easter.cummings@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '2021-03-26 08:31:44', '2021-03-26 08:31:44'),
(30, 'Garth', 'Osinski', 'amari36@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 4, '2021-03-26 08:31:45', '2021-03-26 08:31:45'),
(41, 'Velma', 'Heller', 'fay27@example.com', '$2y$10$k8CbIOArwaeJO1HkTpmNkuE9GEHXfZlMptX6cBxcaDGfcm6b8psWC', 0, '2021-03-26 08:42:13', '2021-03-26 08:42:13'),
(42, 'Amos', 'White', 'myron.bins@example.org', '$2y$10$0kp/oM68/PZRWtabT0VElummOiVKbSpAHVEJhoDkwRTt4o9Or8HU6', 1, '2021-03-26 08:42:13', '2021-03-26 08:42:13'),
(43, 'Marlin', 'Hyatt', 'hill.michelle@example.com', '$2y$10$CPh5cvuDvunmlLlGnuGUIepq5H3z/IDMtdplXfnIY10VP9wvO25i2', 3, '2021-03-26 08:42:13', '2021-03-26 08:42:13'),
(44, 'Abelardo', 'Rath', 'grace95@example.net', '$2y$10$qAFjIN3eMXNyQaXSQTi1PuqWUSuMPkwHs9gpH9fpOxxqVrKPTDhH2', 6, '2021-03-26 08:42:13', '2021-03-26 08:42:13'),
(45, 'Earline', 'Schuppe', 'kunde.obie@example.com', '$2y$10$ai/1Rq.MSIyzhaz2Dav2RuMD8L7FY9akZdye8n.NLG2j6auEzwDae', 0, '2021-03-26 08:42:14', '2021-03-26 08:42:14'),
(46, 'Ibrahim', 'Gislason', 'tmedhurst@example.org', '$2y$10$zmTzlYFEIxKK75f3uY4zbuZAvnKEyE/3Srp/f1c51j4rGj4m0JSEW', 1, '2021-03-26 08:42:14', '2021-03-26 08:42:14'),
(47, 'Will', 'Beahan', 'jewell.huels@example.net', '$2y$10$gh7FKQahy6SyqTpTWB329.gJV0ajUOHNBlbbWTnpNU1.WU.y8ybTK', 4, '2021-03-26 08:42:14', '2021-03-26 08:42:14'),
(48, 'Hermina', 'Luettgen', 'rita14@example.com', '$2y$10$3Q8idJ9zeed/.K4NJ9pREuL693q4cQKHEMHboc.Hdx/hrd3HT72h.', 4, '2021-03-26 08:42:14', '2021-03-26 08:42:14'),
(49, 'Carleton', 'Mitchell', 'tyree79@example.org', '$2y$10$qzv7POguGrd4/O8eaX9G6OLKZ6yy2/EhoBvZTLUOL/hZBcU/u/TpW', 5, '2021-03-26 08:42:14', '2021-03-26 08:42:14'),
(50, 'Jeremie', 'McClure', 'ahuel@example.com', '$2y$10$5z/v6XJK4oI0D1rcaBXvDOcoJ0f1KF3ShQwudNGNYjjStB0UfMJuG', 11, '2021-03-26 08:42:14', '2021-03-26 08:42:14'),
(99, 'asd', 'asd', 'andriy1@gmail.com', '$2y$10$H638WbFkLk4WM2MyjPQwpOo/.0cDMACNRM/ZbjPY7nXImpafLO3bK', 9, '2021-03-31 10:45:49', '2021-03-31 10:45:49'),
(100, 'asdsss', 'asd', 'andriy@gmail.com', '$2y$10$nUtWFjbA79lW/tL4mIqUYOGtoWJhi2ETJPQy1h5TvISqqSSgeAKxe', 8, '2021-03-31 10:47:14', '2021-03-31 10:47:14'),
(101, 'sdadsad', 'asdasd', 'asdasd@gm', '$2y$10$P8vy/3QjPjHl65wSBoHaHOg1jxDepLuCU9FzTCtzz398zgF2AjHr2', 7, '2021-04-03 11:23:40', '2021-04-03 11:23:40'),
(102, 'sadasd', 'asdasd', 'ggg@gmail.com', '$2y$10$zvxPMfceLxRSlbPDj0qFAeELFJ93qp.AJrG9X0Xf4w1tovHEGZVte', 14, '2021-04-03 11:44:26', '2021-04-03 11:44:26'),
(103, 'asasasa', 'asasas', 'aaa@gmail.com', '$2y$10$lo5FwwymGZ.gENOuJJQ/NOyWQSscoEEp.hhZcBC3KPz3iyNVmFUV6', 12, '2021-04-06 07:16:48', '2021-04-06 07:16:48'),
(104, 'fff', 'fff', 'fff@gmail.com', '$2y$10$JcX5YiPy5TvAcUY5hjXamuz89TG8s2UhZrWZWcLXyj7YFmr/y4WNK', 13, '2021-04-07 07:05:57', '2021-04-07 07:05:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_history`
--

CREATE TABLE `user_history` (
  `historyID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `garbageID` int(11) NOT NULL,
  `houseID` int(11) NOT NULL,
  `weight` double NOT NULL,
  `sum` double NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_history`
--

INSERT INTO `user_history` (`historyID`, `userID`, `garbageID`, `houseID`, `weight`, `sum`, `updated_at`, `created_at`) VALUES
(1, NULL, 777, 0, 1.4, 777, '2021-03-28 07:15:57', '2021-03-28 07:15:57'),
(2, 777, 777, 0, 1.4, 777, '2021-03-28 07:17:25', '2021-03-28 07:17:25'),
(3, 777, 777, 0, 1.4, 777, '2021-03-28 07:17:27', '2021-03-28 07:17:27'),
(4, 20, 2, 6, 5, 110, '2021-03-28 08:10:28', '2021-03-28 08:10:28'),
(5, 20, 2, 6, 5, 85, '2021-03-28 08:14:11', '2021-03-28 08:14:11'),
(6, 20, 2, 6, 0.4, 6.8, '2021-03-28 08:14:42', '2021-03-28 08:14:42'),
(7, 20, 2, 6, 0.32, 5.44, '2021-03-28 08:15:29', '2021-03-28 08:15:29'),
(8, 20, 2, 6, 0.31, 5.27, '2021-03-28 08:15:34', '2021-03-28 08:15:34'),
(9, 20, 2, 6, 0.31, 5.27, '2021-03-28 08:18:59', '2021-03-28 08:18:59'),
(10, 20, 2, 6, 0.31, 5.27, '2021-03-28 08:19:06', '2021-03-28 08:19:06'),
(11, 20, 2, 6, 0.3001, 5.1, '2021-03-28 08:19:18', '2021-03-28 08:19:18'),
(12, 20, 2, 6, 0.3099, 5.27, '2021-03-28 08:19:26', '2021-03-28 08:19:26'),
(13, 20, 2, 6, 0.3089, 5.25, '2021-03-28 08:19:32', '2021-03-28 08:19:32'),
(14, 20, 1, 6, 0.3089, 1.85, '2021-03-28 08:20:03', '2021-03-28 08:20:03'),
(15, 20, 1, 6, 0.3089, 1.85, '2021-03-28 08:21:22', '2021-03-28 08:21:22'),
(16, 20, 1, 6, 0.3089, 1.85, '2021-03-28 08:32:25', '2021-03-28 08:32:25'),
(17, 20, 1, 6, 0.3089, 1.85, '2021-03-28 08:32:37', '2021-03-28 08:32:37'),
(18, 20, 3, 6, 0.3089, 5.56, '2021-03-28 08:41:04', '2021-03-28 08:41:04'),
(19, 20, 2, 6, 0.3089, 5.25, '2021-03-28 08:41:15', '2021-03-28 08:41:15'),
(20, 20, 2, 6, 0.3089, 5.25, '2021-03-28 08:41:44', '2021-03-28 08:41:44'),
(21, 20, 2, 6, 0.3089, 5.25, '2021-03-28 08:41:49', '2021-03-28 08:41:49'),
(22, 20, 2, 6, 0.3089, 5.25, '2021-03-28 08:49:23', '2021-03-28 08:49:23'),
(23, 20, 1, 6, 0.3089, 1.85, '2021-03-28 09:24:49', '2021-03-28 09:24:49'),
(24, 20, 1, 6, 0.09, 0.54, '2021-03-28 09:25:00', '2021-03-28 09:25:00'),
(25, 20, 1, 6, 0.09, 0.54, '2021-03-28 09:25:14', '2021-03-28 09:25:14'),
(26, 20, 1, 6, 110, 660, '2021-03-28 09:36:54', '2021-03-28 09:36:54'),
(27, 20, 1, 6, 110, 660, '2021-03-28 09:37:08', '2021-03-28 09:37:08'),
(28, 20, 1, 6, 110, 660, '2021-03-28 09:37:26', '2021-03-28 09:37:26'),
(29, 20, 2, 6, 109, 1853, '2021-03-28 09:37:46', '2021-03-28 09:37:46'),
(30, 20, 3, 6, 109, 1962, '2021-03-28 09:37:49', '2021-03-28 09:37:49'),
(31, 20, 3, 6, 185, 3330, '2021-03-28 09:40:43', '2021-03-28 09:40:43'),
(32, 20, 3, 6, 1852, 33336, '2021-03-28 09:40:47', '2021-03-28 09:40:47'),
(33, 20, 3, 6, 12, 216, '2021-03-28 09:40:52', '2021-03-28 09:40:52'),
(34, 20, 3, 6, 122, 2196, '2021-03-28 09:42:44', '2021-03-28 09:42:44'),
(35, 20, 3, 6, 1222, 21996, '2021-03-28 09:42:48', '2021-03-28 09:42:48'),
(36, 20, 3, 6, 1222, 21996, '2021-03-28 09:42:59', '2021-03-28 09:42:59'),
(37, 20, 3, 6, 122, 2196, '2021-03-28 09:44:43', '2021-03-28 09:44:43'),
(38, 20, 3, 6, 122, 2196, '2021-03-28 09:44:48', '2021-03-28 09:44:48'),
(39, 20, 1, 6, 110, 660, '2021-03-28 09:45:05', '2021-03-28 09:45:05'),
(40, 20, 1, 6, 110, 660, '2021-03-28 13:06:18', '2021-03-28 13:06:18'),
(41, 20, 1, 6, 12, 72, '2021-03-28 13:16:38', '2021-03-28 13:16:38'),
(42, 20, 1, 6, 12, 72, '2021-03-28 13:17:04', '2021-03-28 13:17:04'),
(43, 20, 1, 6, 12, 72, '2021-03-28 13:17:25', '2021-03-28 13:17:25'),
(44, 20, 1, 6, 10, 60, '2021-03-28 13:21:59', '2021-03-28 13:21:59'),
(45, 20, 1, 6, 10, 60, '2021-03-28 13:22:40', '2021-03-28 13:22:40'),
(46, 20, 1, 6, 10, 60, '2021-03-28 13:22:44', '2021-03-28 13:22:44'),
(47, 20, 1, 6, 10, 60, '2021-03-28 13:24:00', '2021-03-28 13:24:00'),
(48, 20, 1, 6, 0.13, 0.78, '2021-03-28 13:24:16', '2021-03-28 13:24:16'),
(49, 20, 1, 6, 4.3, 25.8, '2021-03-28 13:24:36', '2021-03-28 13:24:36'),
(50, 20, 2, 6, 3, 51, '2021-03-28 13:24:45', '2021-03-28 13:24:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `garbage`
--
ALTER TABLE `garbage`
  ADD PRIMARY KEY (`garbageID`);

--
-- Indexes for table `garbage_house`
--
ALTER TABLE `garbage_house`
  ADD PRIMARY KEY (`garbage_houseID`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`houseID`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`priceID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_history`
--
ALTER TABLE `user_history`
  ADD PRIMARY KEY (`historyID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `garbage`
--
ALTER TABLE `garbage`
  MODIFY `garbageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `garbage_house`
--
ALTER TABLE `garbage_house`
  MODIFY `garbage_houseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `house`
--
ALTER TABLE `house`
  MODIFY `houseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;

--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `priceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `user_history`
--
ALTER TABLE `user_history`
  MODIFY `historyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
