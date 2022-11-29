-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 29, 2022 at 09:55 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sampel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('092b4df0259e5d01b78f8ad02ac7aa1c924f5936da554623446083c6f12c5de3dbc2dd664af14cf9', 1, 3, 'authToken', '[]', 0, '2022-10-22 00:43:40', '2022-10-22 00:43:40', '2022-10-23 06:13:40'),
('11ba5df5fcfc8747643caf98b0bd5149541bf2d48f11427f72c7fa6f2f78cb20fac87eea12d6b2c1', 7, 3, 'authToken', '[]', 0, '2022-11-17 00:50:35', '2022-11-17 00:50:35', '2022-11-18 06:20:34'),
('128a203357a96cddcda0f3406c1eed5f700dc410a6536e0078383053a5db3d52ac6923ec20a3e88f', 7, 3, 'authToken', '[]', 0, '2022-11-29 00:57:34', '2022-11-29 00:57:34', '2022-11-30 06:27:34'),
('157f7c3b0a06c6ea9ed5626dc043f0462017e4fe347cf9cab7596852184e3439b30a616d3da70cf2', 7, 3, 'authToken', '[]', 0, '2022-11-29 01:07:50', '2022-11-29 01:07:50', '2022-11-30 06:37:50'),
('1a80b9168245c560ae192d2e93ecc810622dfeb2f3b71c16a6f0d9e44e2c5df04bd12f8b8f498ba9', 2, 1, 'authToken', '[]', 0, '2022-10-14 00:34:57', '2022-10-14 00:34:57', '2022-10-14 20:34:57'),
('2ae17ee3b37ac9b7ae0b6c2c0669650cc1da4bedeb0e5b18aae20cf36d2ccadd197730bbd2cb4e75', 7, 3, 'authToken', '[]', 0, '2022-11-29 01:32:03', '2022-11-29 01:32:03', '2022-11-30 07:02:03'),
('2ed88e174ab38cc4628a018963f221a8a0d40ff51a80a95e95fb3501c4dfa9247e82e4add641e7ec', 7, 3, 'authToken', '[]', 0, '2022-11-16 23:19:22', '2022-11-16 23:19:22', '2022-11-18 04:49:22'),
('311c61468907690e89f333b73ded43ec1c7b30cec95b9fa0d7cf390bf075981d96a37ae0d310e38b', 7, 3, 'authToken', '[]', 0, '2022-11-16 20:03:24', '2022-11-16 20:03:24', '2022-11-18 01:33:24'),
('31e7b444d9cdb9bdef6675c65508d43c1cc8097be14ab25c3fc2c6fec0c0b1aa344d2494124b053e', 7, 3, 'authToken', '[]', 0, '2022-11-14 08:19:48', '2022-11-14 08:19:48', '2022-11-15 13:49:48'),
('3f8df6d32ad33ed15e640abc95e8e49600bb50cd11ccfa4f513fc8b0525f7d244bfa19abcb875171', 7, 3, 'authToken', '[]', 0, '2022-11-16 20:01:08', '2022-11-16 20:01:08', '2022-11-18 01:31:08'),
('4320832f5e3c2926258b7403e6b9a18f87efe17b370407c433fb31669612d4dd3c4c5ba65a9b4f4e', 8, 1, 'authToken', '[]', 0, '2022-10-14 09:51:22', '2022-10-14 09:51:22', '2022-10-15 05:51:22'),
('46c587694d82babe2906cccdb3e2be2abe2e79bf9057eee8c91be46a770c0dfb8a65bd819f0a3052', 7, 3, 'authToken', '[]', 0, '2022-11-16 18:48:39', '2022-11-16 18:48:39', '2022-11-18 00:18:38'),
('46daf15155b9a982e397f2a44af60b21060061d7d294bbb797723dcb52f749bd7137c614b8593d80', 7, 3, 'authToken', '[]', 0, '2022-11-16 20:02:16', '2022-11-16 20:02:16', '2022-11-18 01:32:16'),
('4aa644ee3dce91213d1d2d9cf4b83ae7805d994c73ee52677aa02f702e8536ecd6b24b94eb5cd07e', 6, 1, 'authToken', '[]', 0, '2022-10-14 13:02:44', '2022-10-14 13:02:44', '2022-10-15 09:02:44'),
('4e4f72e0bbd4524af591a0a6f63796dbbedc52609a0cf9ea838a7dcc2c789393673cd3eff9448678', 7, 3, 'authToken', '[]', 0, '2022-11-14 19:43:09', '2022-11-14 19:43:09', '2022-11-16 01:13:09'),
('4f5163db4c21e422fc653d2a7da409ec6c67c9969a32415cb2615de6c4d32015dd4aacb94ac54a11', 1, 1, 'authToken', '[]', 0, '2022-10-20 13:38:45', '2022-10-20 13:38:45', '2022-10-21 09:38:45'),
('590f8e498c51691d0c8a64ad0580b045620b6e44bf140c0d57766686d0e4968915d0c49a62d16e32', 3, 3, 'authToken', '[]', 0, '2022-10-21 22:10:39', '2022-10-21 22:10:39', '2022-10-23 03:40:38'),
('5912893c009b52661484afdf3867f08945e734655189fcb75bd0fce446c7a7d46a7afbcc23385b4e', 7, 3, 'authToken', '[]', 0, '2022-11-29 01:28:07', '2022-11-29 01:28:07', '2022-11-30 06:58:06'),
('5ea3440b222913f6b7274ad687ed4f3ef05dfaac88a838dc863524680a6c445e7af698000972e499', 7, 1, 'authToken', '[]', 0, '2022-10-14 09:49:21', '2022-10-14 09:49:21', '2022-10-15 05:49:21'),
('8054fb5451a70994b71b5da59ab01e54e21fe6b13ae94899244e569e32766b73599eba66e50a623e', 4, 1, 'authToken', '[]', 0, '2022-10-14 09:48:07', '2022-10-14 09:48:07', '2022-10-15 05:48:07'),
('81b145ef4c7c257450916aaad9bb81db2a4e659167227bfa28907f6336eef74cce60add7d53e4e01', 7, 3, 'authToken', '[]', 0, '2022-11-16 14:05:42', '2022-11-16 14:05:42', '2022-11-17 19:35:42'),
('82135f227d79514c6b837ade2b6172acf961641091db2bfb21206a88b48dd548df89760d53f63dd0', 4, 1, 'authToken', '[]', 0, '2022-10-13 23:23:09', '2022-10-13 23:23:09', '2022-10-14 19:23:09'),
('87996cf4451a4de6dc260d6dc6db3dd0fb55eaf1997bf77dafc45ba1f78cc15b6f863399271786fa', 7, 3, 'authToken', '[]', 0, '2022-11-16 20:02:42', '2022-11-16 20:02:42', '2022-11-18 01:32:42'),
('8bd9902f34a3b4d9ba317d0786aac278df43a52f6b5e69bd28806e45bf6dc9f543e8d38b029cb642', 7, 3, 'authToken', '[]', 0, '2022-11-15 19:18:00', '2022-11-15 19:18:00', '2022-11-17 00:48:00'),
('92f821e63dd6f7b8e324d1416bae31b48e618bbeb490563d21ab77d7922ae3f14818c53bc32c2836', 1, 3, 'authToken', '[]', 0, '2022-10-22 06:42:03', '2022-10-22 06:42:03', '2022-10-23 12:12:02'),
('97597b635700b2c483fcbbea6f94c59cad63d2fa9fdb52b0f3961435608c29322225ac300749c83f', 3, 1, 'authToken', '[]', 0, '2022-10-13 23:07:25', '2022-10-13 23:07:25', '2022-10-14 19:07:24'),
('99bcf3b5fc4c35090766dfe9b04f57f1f628d7aa6cdd385257273d51db372179179b54f11e73d084', 5, 3, 'authToken', '[]', 0, '2022-10-22 01:06:18', '2022-10-22 01:06:18', '2022-10-23 06:36:18'),
('a4f20cbdda6973c29dc84bd6c45ed8324a9fa2528586fc1e8f96229731bc2098aca91e2b644cee21', 7, 3, 'authToken', '[]', 0, '2022-11-29 04:22:23', '2022-11-29 04:22:23', '2022-11-30 09:52:22'),
('a8e0d0e106239784091dc2ae595cb9ef7eec529d87944c5ab403b8c6a56a061d9ecd0e8a52581ae7', 3, 1, 'authToken', '[]', 0, '2022-10-14 09:51:57', '2022-10-14 09:51:57', '2022-10-15 05:51:57'),
('ad3c28fc9bc87a77860f4f0b9f396ef937b81fd6d36ff0cb3c921c71609095b307a8ba649f67d3fd', 7, 3, 'authToken', '[]', 0, '2022-11-29 00:42:13', '2022-11-29 00:42:13', '2022-11-30 06:12:12'),
('aee96bb751d5beb71090efcf8b56263fee8402c31dce46ad989921aea4e9c6b3c8fb115d5e881bcb', 4, 3, 'authToken', '[]', 0, '2022-10-22 01:05:14', '2022-10-22 01:05:14', '2022-10-23 06:35:14'),
('afacb57217a858dbe1fedd92caec86182d63354426294cbf0f29bf4e31c27183e18af09505ad08ac', 7, 3, 'authToken', '[]', 0, '2022-11-29 02:09:41', '2022-11-29 02:09:41', '2022-11-30 07:39:41'),
('b67e5e5a7f568d088a915af70acb6b89440e619c00cf5cc3944bb718d98668d8184dbaf9cc2312cd', 7, 3, 'authToken', '[]', 0, '2022-11-29 00:58:02', '2022-11-29 00:58:02', '2022-11-30 06:28:02'),
('bd797ab0ca82f665f3677c38e4f2a564ca84e003a6ac18ea72e208aae321bae04f8aaac2d35d6342', 7, 3, 'authToken', '[]', 0, '2022-11-16 20:23:16', '2022-11-16 20:23:16', '2022-11-18 01:53:16'),
('c2a7b15f45fd70b6cc9d9955b10e45b06b58669a4bad391257018a62ffbae1d7ec7a514209ef8e23', 7, 3, 'authToken', '[]', 0, '2022-11-14 11:32:13', '2022-11-14 11:32:13', '2022-11-15 17:02:13'),
('c2c066e1e8b729eccf8ef20ad10226a46ceb4e5d445c721dcf5c834b6cbc9d20f33ceb385df519b6', 4, 1, 'authToken', '[]', 0, '2022-10-14 09:50:19', '2022-10-14 09:50:19', '2022-10-15 05:50:19'),
('c48a8053521d7e77e8f3ee44d01c7bb7f4006231b7e26f2bf616275ff3940172ab0d3dc339e99930', 7, 3, 'authToken', '[]', 0, '2022-11-14 11:33:17', '2022-11-14 11:33:17', '2022-11-15 17:03:16'),
('caa5d4126cd32fd426712106d525f62b1440524268d04707e7480cd11f1188ade396ec8376b97d31', 7, 3, 'authToken', '[]', 0, '2022-11-15 19:17:33', '2022-11-15 19:17:33', '2022-11-17 00:47:32'),
('cc6af523bd633ad88bfa7d58fadaab85b5565454099a84e3adcce5396ea0d78bbf049338008f99b1', 7, 3, 'authToken', '[]', 0, '2022-11-16 05:21:04', '2022-11-16 05:21:04', '2022-11-17 10:51:03'),
('cc9dfe2d17ca6eea6d0f858695d1f404d31735f6469b4d5586677bd03dcb59983764f7e586bb2dac', 3, 3, 'authToken', '[]', 0, '2022-10-21 02:11:38', '2022-10-21 02:11:38', '2022-10-22 07:41:38'),
('dcae567059fdc1685b451ac350c7c383a3d06dd49dd5f70a6f2967836bcea88d50f615f35d17dba6', 5, 1, 'authToken', '[]', 0, '2022-10-13 23:25:15', '2022-10-13 23:25:15', '2022-10-14 19:25:15'),
('e08f0a146261fb71b99960a11120b41d95a74693242c861dd2a32f9e7d0b32ccb7cdf88fd2612958', 4, 1, 'authToken', '[]', 0, '2022-10-13 23:24:14', '2022-10-13 23:24:14', '2022-10-14 19:24:14'),
('e753fcb3c4b1160e83bd8a5447ea4e1f0ebe51780abff5a8af84f798799bd7773de347a9d456d5cb', 3, 3, 'authToken', '[]', 0, '2022-10-21 02:53:44', '2022-10-21 02:53:44', '2022-10-22 08:23:43'),
('e9332ef7632fd5e754d3c3f7fddedb05c05afe0bfdb5e99dc592306e38ddc3a082a49658e913569f', 7, 3, 'authToken', '[]', 0, '2022-11-15 10:26:50', '2022-11-15 10:26:50', '2022-11-16 15:56:49'),
('efe7dcea713dc86c1652c65ec7679964900639d2c0c3a094479580987ba8689ce14749419084b332', 7, 3, 'authToken', '[]', 0, '2022-11-14 19:42:15', '2022-11-14 19:42:15', '2022-11-16 01:12:14'),
('f58a965e131b936610a6871ec2102c5b06790608568c0e53c63f8bb20197099f866a6a9658a61641', 7, 3, 'authToken', '[]', 0, '2022-11-16 12:40:01', '2022-11-16 12:40:01', '2022-11-17 18:10:00'),
('f65e9eda983970bd7cc7faf029b4e2da5025647fcc0f9f86f060ca0a913f1f5157963d4eb343f5f3', 7, 3, 'authToken', '[]', 0, '2022-11-29 00:58:24', '2022-11-29 00:58:24', '2022-11-30 06:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'CSIAP Personal Access Client', '3AzehRgL4qB6a8hSyzfKPIxp3JwQgk95qWl9zbcs', NULL, 'http://localhost', 1, 0, 0, '2022-10-05 09:18:09', '2022-10-05 09:18:09'),
(2, NULL, 'CSIAP Password Grant Client', '2XrmkTIjzTzQq3JcRueYtTEyUKevybfW3v2oeXMm', 'users', 'http://localhost', 0, 1, 0, '2022-10-05 09:18:09', '2022-10-05 09:18:09'),
(3, NULL, 'CSIAP Personal Access Client', 'QEFQWsYO9uYEYSYQ3d0z4PqXtSyIhyRjNbC6T9pj', NULL, 'http://localhost', 1, 0, 0, '2022-10-21 02:10:22', '2022-10-21 02:10:22'),
(4, NULL, 'CSIAP Password Grant Client', 'ibOfYirTMAO32c2KalzWZ4GW785g9lZXEsqQtALt', 'users', 'http://localhost', 0, 1, 0, '2022-10-21 02:10:22', '2022-10-21 02:10:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-10-05 09:18:09', '2022-10-05 09:18:09'),
(2, 3, '2022-10-21 02:10:22', '2022-10-21 02:10:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `signature` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `role` text DEFAULT NULL,
  `section` text DEFAULT NULL COMMENT '(PMU, DPD)',
  `province` text DEFAULT NULL COMMENT 'If DPD , need province',
  `district` text DEFAULT NULL COMMENT 'If DPD, need a district name',
  `status` varchar(200) DEFAULT NULL,
  `mobile` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `depend_dpd_id` int(11) DEFAULT NULL COMMENT 'dpd id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `signature`, `password`, `role`, `section`, `province`, `district`, `status`, `mobile`, `created_at`, `updated_at`, `deleted_at`, `depend_dpd_id`) VALUES
(1, 'Chamath', 'af@gmail.com', NULL, '$2y$10$p6k5jeUWseUidm7QH/N/CeNPkgG2UlGm41eBzGi7vgJG4sqhVxxzO', 'AF', 'DPD', 'Southern', 'Hambanthota', NULL, '0714525326', NULL, NULL, NULL, 4),
(2, 'Chamath', 'mobile@gmail.com', NULL, '$2y$10$p6k5jeUWseUidm7QH/N/CeNPkgG2UlGm41eBzGi7vgJG4sqhVxxzO', 'AF', 'DPD', 'Southern', 'Hambanthota', NULL, NULL, NULL, NULL, NULL, 4),
(3, 'Project Director', 'pd@gmail.com', NULL, '$2y$10$p6k5jeUWseUidm7QH/N/CeNPkgG2UlGm41eBzGi7vgJG4sqhVxxzO', 'PD', 'PMU', 'Western', 'Colombo', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Southern DPD', 'dpd@gmail.com', NULL, '$2y$10$pDk/FJWcJNJx6zbnmsVzCe0daeWojegT/TiMndrVrtUIJOHxmR0cW', 'DPD', 'DPD', 'Southern', NULL, NULL, '0714525365', '2022-10-13 19:22:21', '2022-10-13 19:22:21', NULL, NULL),
(5, 'IDCB Southern', 'idcb@gmail.com', NULL, '$2y$10$PPzxMLclzNXxbg4riP0w2eVOBWByprzrtmpFIfb86NHRMMn2fd5Yi', 'IDCB', 'DPD', 'Southern', NULL, NULL, '0415256325', '2022-10-13 19:24:56', '2022-10-13 19:24:56', NULL, 4),
(6, 'Pramodya', 'pramod@gmail.com', NULL, '$2y$10$PPzxMLclzNXxbg4riP0w2eVOBWByprzrtmpFIfb86NHRMMn2fd5Yi', 'AF', 'DPD', 'Southern', 'Colombo', NULL, '0415256325', '2022-10-14 01:36:01', '2022-10-14 01:36:04', NULL, 4),
(7, 'AS South', 'as@gmail.com', NULL, '$2y$10$G8w0CktQOLHuESNoYxaZq.znvnUCQYgiMc8p7K00lD9ZN2vMN7NNi', 'AS', 'DPD', 'Southern', NULL, NULL, '071523562', '2022-10-14 05:48:53', '2022-10-14 05:48:53', NULL, 4),
(8, 'M and E', 'mande@gmail.com', NULL, '$2y$10$EJuYNLROTgqrwdpe96xdGu..m9WKN.Ef3ck4OsQgn.BLqCwvqGCbK', 'MandE', 'DPD', 'Southern', NULL, NULL, '0714525365', '2022-10-14 05:51:05', '2022-10-14 05:51:05', NULL, 4),
(9, 'test', 'test@gmail.com', NULL, '$2y$10$EK8US0OMktPDDkqsHHll2OfdkjxAzUzZ24.mqrn6E15csCEujwdjC', 'client', 'BSREG', 'western province', NULL, NULL, '0715544123', '2022-10-22 14:01:43', '2022-10-22 14:01:43', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
