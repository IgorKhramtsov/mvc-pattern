-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 23, 2021 at 08:22 PM
-- Server version: 8.0.24
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tdb_stajer_khram`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_07_06_064523_create_products_table', 1),
(4, '2018_07_11_044735_create_reviews_table', 1),
(5, '2018_07_13_040845_add_image_to_products_table', 1),
(6, '2018_07_17_042401_add_type_user_table', 1),
(7, '2018_07_20_072911_create_sessions_table', 1),
(8, '2018_07_20_082131_create_orders_table', 1),
(9, '2018_07_20_082140_create_order_items_table', 1),
(10, '2018_07_23_034040_add_api_token_to_user_table', 1),
(11, '2018_07_23_070019_add_columns_to_orders_table', 1),
(12, '2018_07_26_050835_add_shipment_payment_to_order_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `home` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(9,2) NOT NULL,
  `shipment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_code` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `first_name`, `middle_name`, `last_name`, `email`, `phone`, `country`, `city`, `zip`, `address`, `home`, `comment`, `status`, `total`, `shipment_method`, `payment_method`, `status_code`) VALUES
(1, '2021-06-23 10:15:14', '2021-06-23 10:15:14', 'Иван', 'Иванович', 'Иванов', 'asd@asd.asd', '+7-928-144-48-36', 'Россия', 'Барнаул', '656000', 'проспект Ленина', '123', NULL, 'pay_awaiting', '750.00', 'ponyexpress', 'visa_mastercard', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `created_at`, `updated_at`, `title`, `price`, `quantity`, `product_id`, `order_id`) VALUES
(1, '2021-06-23 10:15:14', '2021-06-23 10:15:14', 'Кусок воды', '750.00', 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `created_at`, `updated_at`, `image_url`) VALUES
(1, 'Кот и хлеб', '250.00', 'Кот отдельно, хлеб отдельно', '2021-06-23 08:18:40', '2021-06-23 08:18:40', '/storage/products/xaX93nJ5ArV66S0zr2MYn53MeWnYiCDvB7kwT3PI.jpeg'),
(2, 'Синий кот', '150.00', 'Не синий кит', '2021-06-23 08:19:07', '2021-06-23 08:19:07', '/storage/products/vFKcniI8VnA9UFoILGYUX2HHbswFYFvjhaIWTpFe.jpeg'),
(3, 'Очень провославно', '350.00', 'Очень по-русски', '2021-06-23 08:19:26', '2021-06-23 09:11:38', '/storage/products/tZpajOIF5F1gdJvXIZgBS6FMUO92xst5U02cj7pn.jpeg'),
(4, 'Кусок воды', '750.00', 'Очень милый', '2021-06-23 08:19:41', '2021-06-23 08:19:41', '/storage/products/gvIub7Vo2hxJQQNUg0GVoXfzBZvy1ys9popGtv2X.jpeg'),
(5, 'Пюрешка', '250.00', 'smashed potate', '2021-06-23 08:20:35', '2021-06-23 08:45:16', '/storage/products/IVjWs5J71QLdRTaTTKYoJW2RGQoVzJyOTjf0fGUM.jpeg'),
(6, 'Кот', '450.00', 'Стоит', '2021-06-23 08:20:44', '2021-06-23 08:20:44', '/storage/products/Vz0u6FFmsidj9xHQ1lS8bxyJBWKuzEqAmU4ffCW4.jpeg'),
(7, 'monke', '1250.00', 'cigarettes is bad', '2021-06-23 08:44:46', '2021-06-23 08:44:46', '/storage/products/CXQxZd9b9rsfWbuF0QoWMEdmk8FMAEq5PVxyXFxO.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `created_at`, `updated_at`, `text`, `is_published`, `product_id`) VALUES
(1, '2021-06-23 08:57:11', '2021-06-23 09:13:32', 'wow, really cool', 1, 7),
(2, '2021-06-23 09:18:08', '2021-06-23 09:18:08', 'is this real image?', 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Ar7vqTJy2ukccODadZ6FH6VLCEOME200ef54Pm73', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVNpYWx4RHRieGNFbTJtaUk1bjdNVDk2VXR0NEFYS3M2UG16VnNJTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly9sYXJhdmVsL3d3dyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1624462108),
('JV9I4fgIHwDv7YswYXenqATowx0ZOzgI4164nkzq', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoic3g2ZWhKUmVHbFBrOUhsN0J5aUNRY1NiaTZ1Q1daUGVRQXEzNHhtTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTA6Imh0dHA6Ly9sYXIiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MTp7czozMzoiWDJjNDEyZTIyOGQxOTIwYzIxYzI2ZmM1M2FlMmIxN2UwIjtOO319', 1624465534),
('M1MFSz640DKFUI66fpiCgUjct3gfSTJnyLAasTUL', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiWUh4TDJKRlNPSU1PRUVZT2VvVWN2VmE2a3F2dlk2UlZsZG1UaTk0ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sYXIvYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTo0OntzOjMzOiJYZmYwNzMwOGM0YWZkZTY5NjQxMjBjYzg4NDVkNTllYWYiO047czozMzoiWDJlZGNmMWM2ZGQyNWU0ODc3NDRmODJjMjk0NDU5MzZmIjtOO3M6MzM6IlhmN2JkZTY2YzNlZTFiZjY4ZDkxODVlMWIwMDBkMzBhNiI7TjtzOjMzOiJYNzIzZDJkNDY5ZjgyMzQ4ZGNlMWU1NzdjZjVkZDQ1ZTciO047fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo0OiJpbmZvIjthOjQ6e3M6NzoiY29udGFjdCI7YTo1OntzOjU6ImVtYWlsIjtzOjExOiJhc2RAYXNkLmFzZCI7czo1OiJwaG9uZSI7czoxNjoiKzctOTI4LTE0NC00OC0zNiI7czo1OiJmbmFtZSI7czo4OiLQmNCy0LDQvSI7czo1OiJsbmFtZSI7czoxMjoi0JjQstCw0L3QvtCyIjtzOjU6Im1uYW1lIjtzOjE2OiLQmNCy0LDQvdC+0LLQuNGHIjt9czo3OiJhZGRyZXNzIjthOjU6e3M6NzoiY291bnRyeSI7czoxMjoi0KDQvtGB0YHQuNGPIjtzOjQ6ImNpdHkiO3M6MTQ6ItCR0LDRgNC90LDRg9C7IjtzOjM6InppcCI7czo2OiI2NTYwMDAiO3M6NzoiYWRkcmVzcyI7czoyOToi0L/RgNC+0YHQv9C10LrRgiDQm9C10L3QuNC90LAiO3M6NDoiaG9tZSI7czozOiIxMjMiO31zOjE1OiJzaGlwbWVudF9tZXRob2QiO3M6MTE6InBvbnlleHByZXNzIjtzOjE0OiJwYXltZW50X21ldGhvZCI7czoxNToidmlzYV9tYXN0ZXJjYXJkIjt9czozOiJXTUkiO2E6ODp7czo4OiJvcmRlcl9pZCI7aToxO3M6MTU6IldNSV9DVVJSRU5DWV9JRCI7czozOiI2NDMiO3M6MTU6IldNSV9ERVNDUklQVElPTiI7czo0NzoiQkFTRTY0OjBKN1F2OUM3MExEUmd0Q3dJTkMzMExEUXV0Q3cwTGZRc0NBak1RPT0iO3M6MTI6IldNSV9GQUlMX1VSTCI7czoxNToiaHR0cDovL2xhci9jYXJ0IjtzOjE1OiJXTUlfTUVSQ0hBTlRfSUQiO3M6MTI6IjE0NjAwNDAxNTgwNSI7czoxODoiV01JX1BBWU1FTlRfQU1PVU5UIjtkOjc1MDtzOjE1OiJXTUlfU1VDQ0VTU19VUkwiO3M6MjQ6Imh0dHA6Ly9sYXIvb3JkZXIvc3VjY2VzcyI7czoxMzoiV01JX1NJR05BVFVSRSI7czoyNDoibzdsejdDbzYyUVB2T3Z3Yzc1OGc5Zz09Ijt9czo0OiJkYXRhIjtPOjI5OiJJbGx1bWluYXRlXFN1cHBvcnRcQ29sbGVjdGlvbiI6MTp7czo4OiIAKgBpdGVtcyI7YToxOntpOjQ7TzoyOToiSWxsdW1pbmF0ZVxTdXBwb3J0XENvbGxlY3Rpb24iOjE6e3M6ODoiACoAaXRlbXMiO2E6NDp7czo1OiJwcmljZSI7czo2OiI3NTAuMDAiO3M6ODoicXVhbnRpdHkiO2k6MTtzOjU6InRpdGxlIjtzOjE5OiLQmtGD0YHQvtC6INCy0L7QtNGLIjtzOjk6ImltYWdlX3VybCI7czo2MzoiL3N0b3JhZ2UvcHJvZHVjdHMvZ3ZJdWI3Vm8yaHhKUVFOVWcwR1ZvWGZ6Qlp2eTF5czlwb3BHdHYyWC5qcGVnIjt9fX19fQ==', 1624468583);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `type`, `api_token`) VALUES
(1, 'asd', 'asd@asd.asd', '$2y$10$Hay.YJ4hsuH2HycLtPDHCO2FO2L/ZL.rq3a1p5KO5oipCO23DTxzi', NULL, '2021-06-23 07:40:49', '2021-06-23 07:40:49', 'admin', '3DkBuE3YOwgheFKfg9nn73HHFM0WU74lhtbaMGsURkJQRex3JQ6k741pF3H6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_index` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_index` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
