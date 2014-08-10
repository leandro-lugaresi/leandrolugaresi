-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 10, 2014 at 04:49 PM
-- Server version: 5.5.37-0ubuntu0.13.10.1
-- PHP Version: 5.5.3-1ubuntu2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Table structure for table `acl_privilege`
--

DROP TABLE IF EXISTS `acl_privilege`;
CREATE TABLE IF NOT EXISTS `acl_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `do_log` tinyint(1) NOT NULL DEFAULT '1',
  `display_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acl_privileges_acl_roles_idx` (`role_id`),
  KEY `fk_acl_privileges_acl_resources1_idx` (`resource_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=148 ;

--
-- Dumping data for table `acl_privilege`
--

INSERT INTO `acl_privilege` (`id`, `name`, `do_log`, `display_name`, `role_id`, `resource_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 'view', 0, 'Visualizar', 4, 2, 1, '2014-06-05 22:35:41', '2014-06-16 03:11:35'),
(3, 'create', 0, '', 4, 2, 1, '2014-06-05 22:36:01', '2014-06-05 22:36:01'),
(5, 'delete', 1, '', 3, 2, 1, '2014-06-05 22:36:46', '2014-06-05 22:36:46'),
(6, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus', 4, 3, 1, '2014-06-07 01:54:50', '2014-06-07 03:03:44'),
(7, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/user/activate', 5, 4, 1, '2014-06-07 03:12:32', '2014-06-07 03:12:32'),
(8, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/login', 5, 5, 1, '2014-06-07 03:12:49', '2014-06-07 03:12:49'),
(9, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/forgot', 5, 6, 1, '2014-06-07 03:13:03', '2014-06-07 03:13:03'),
(10, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/recover', 5, 7, 1, '2014-06-07 03:13:15', '2014-06-07 03:13:15'),
(11, 'acessar', 0, 'URL: http://pacman.local/modulus/user/perfil', 4, 8, 1, '2014-06-07 12:22:28', '2014-06-13 21:14:29'),
(12, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/user/logout', 4, 9, 1, '2014-06-07 12:22:45', '2014-06-07 12:22:45'),
(13, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/user', 3, 10, 1, '2014-06-07 12:23:14', '2014-06-07 12:23:14'),
(14, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/user/create', 1, 11, 1, '2014-06-07 12:23:29', '2014-06-07 12:23:29'),
(15, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/user/0/update', 1, 12, 1, '2014-06-07 12:23:47', '2014-06-07 12:23:47'),
(16, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/user/0/delete', 1, 13, 1, '2014-06-07 12:24:02', '2014-06-07 12:24:02'),
(17, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/user/0/view', 3, 14, 1, '2014-06-07 12:24:22', '2014-06-07 12:24:22'),
(18, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/user/resend-email', 1, 15, 1, '2014-06-07 12:24:49', '2014-06-07 12:24:49'),
(19, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/controller', 1, 16, 1, '2014-06-07 12:48:59', '2014-06-07 12:48:59'),
(20, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/controller/create', 1, 17, 1, '2014-06-07 12:49:31', '2014-06-07 12:49:31'),
(21, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/controller/0/update', 1, 18, 1, '2014-06-07 12:49:43', '2014-06-07 12:49:43'),
(22, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/controller/0/delete', 1, 19, 1, '2014-06-07 12:49:57', '2014-06-07 12:49:57'),
(23, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/controller/0/view', 1, 20, 1, '2014-06-07 12:50:14', '2014-06-07 12:50:14'),
(24, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/route', 1, 21, 1, '2014-06-07 12:50:28', '2014-06-07 12:50:28'),
(25, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/route/create', 1, 22, 1, '2014-06-07 12:50:41', '2014-06-11 20:12:50'),
(26, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/route/0/update', 1, 23, 1, '2014-06-07 12:51:26', '2014-06-13 21:13:48'),
(27, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/route/0/delete', 1, 24, 1, '2014-06-07 12:53:11', '2014-06-07 12:53:11'),
(28, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/route/0/view', 1, 25, 1, '2014-06-07 12:53:25', '2014-06-07 12:53:25'),
(29, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/privilege', 1, 26, 1, '2014-06-07 12:53:49', '2014-06-07 12:53:49'),
(30, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/privilege/create', 1, 27, 1, '2014-06-07 12:54:03', '2014-06-07 12:54:03'),
(31, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/privilege/0/update', 1, 28, 1, '2014-06-07 12:54:21', '2014-06-17 20:47:48'),
(32, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/privilege/0/delete', 1, 29, 1, '2014-06-07 12:55:54', '2014-06-07 12:55:54'),
(33, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/privilege/0/view', 1, 30, 1, '2014-06-07 12:56:14', '2014-06-07 12:56:14'),
(34, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/configuration', 1, 31, 1, '2014-06-07 13:00:55', '2014-06-07 13:00:55'),
(35, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/interfacecontent/save', 3, 32, 1, '2014-06-09 14:22:00', '2014-06-16 00:36:02'),
(36, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/pacman/galeria', 4, 33, 0, '2014-06-09 20:46:30', '2014-06-11 00:49:11'),
(37, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/role', 1, 34, 1, '2014-06-11 13:01:56', '2014-06-11 13:01:56'),
(38, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/role/create', 1, 35, 1, '2014-06-11 13:02:12', '2014-06-11 13:02:12'),
(39, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/role/0/update', 1, 36, 1, '2014-06-11 13:02:30', '2014-06-11 13:02:30'),
(40, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/route/0/delete', 1, 24, 0, '2014-06-11 13:02:44', '2014-06-12 14:27:31'),
(41, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/role/0/view', 1, 37, 1, '2014-06-11 13:03:09', '2014-06-11 13:03:09'),
(42, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/privilege', 1, 26, 0, '2014-06-11 20:17:11', '2014-06-16 00:05:39'),
(43, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/ocra_service_manager_yuml', 4, 38, 0, '2014-06-11 21:16:29', '2014-06-13 21:10:03'),
(44, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/resource', 1, 39, 1, '2014-06-16 00:06:26', '2014-06-16 00:06:26'),
(45, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/resource/0/update', 1, 40, 1, '2014-06-16 00:06:45', '2014-06-16 00:06:45'),
(46, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/resource/0/delete', 1, 41, 1, '2014-06-16 00:07:09', '2014-06-16 00:07:09'),
(47, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/resource/0/view', 1, 42, 1, '2014-06-16 00:23:49', '2014-06-16 00:23:49'),
(48, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/galeria', 4, 45, 1, '2014-06-16 00:28:15', '2014-06-16 00:28:15'),
(49, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/log', 1, 46, 1, '2014-06-16 00:43:13', '2014-06-16 00:43:13'),
(50, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/ocra_service_manager_yuml', 5, 38, 0, '2014-06-16 01:30:49', '2014-06-30 01:18:07'),
(51, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/log/view', 1, 47, 1, '2014-06-16 02:52:40', '2014-06-16 02:52:40'),
(52, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/filemanager/execute', 4, 48, 1, '2014-06-17 14:26:46', '2014-06-17 14:26:46'),
(53, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/email', 1, 49, 1, '2014-06-18 19:13:53', '2014-06-18 19:13:53'),
(54, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/filemanager', 4, 50, 1, '2014-06-18 22:46:03', '2014-06-18 22:46:03'),
(55, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/filemanager/execute', 4, 48, 1, '2014-06-18 22:46:19', '2014-06-19 23:52:48'),
(56, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/types', 1, 51, 1, '2014-06-20 02:06:22', '2014-06-20 02:06:22'),
(57, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/types/create', 1, 52, 1, '2014-06-20 02:06:36', '2014-06-20 02:06:36'),
(58, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/types/0/update', 1, 53, 1, '2014-06-20 02:06:51', '2014-06-20 02:06:51'),
(59, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/types/0/delete', 1, 54, 1, '2014-06-20 02:07:06', '2014-06-20 02:07:06'),
(60, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/types/0/view', 1, 55, 1, '2014-06-20 02:07:17', '2014-06-20 02:07:17'),
(61, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/status', 1, 56, 1, '2014-06-20 14:38:34', '2014-06-20 14:38:34'),
(62, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/status/create', 1, 57, 1, '2014-06-20 14:38:48', '2014-06-20 14:38:48'),
(63, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/status/0/update', 1, 58, 1, '2014-06-20 14:39:00', '2014-06-20 14:39:00'),
(64, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/status/0/delete', 1, 59, 1, '2014-06-20 14:39:14', '2014-06-20 14:39:14'),
(65, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/status/0/view', 1, 60, 1, '2014-06-20 14:39:31', '2014-06-20 14:39:31'),
(66, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/posts', 4, 61, 1, '2014-06-20 14:39:50', '2014-06-20 14:39:50'),
(67, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/posts/create', 4, 62, 1, '2014-06-20 14:40:04', '2014-06-20 14:40:04'),
(68, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/posts/0/update', 4, 63, 1, '2014-06-20 14:40:18', '2014-06-20 14:40:18'),
(69, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/posts/0/view', 4, 64, 1, '2014-06-20 14:40:33', '2014-06-20 14:40:33'),
(70, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/pages', 4, 65, 1, '2014-06-20 14:40:44', '2014-06-20 14:40:44'),
(71, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/pages/create', 4, 66, 1, '2014-06-20 14:41:35', '2014-06-20 14:41:35'),
(72, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/pages/0/update', 4, 67, 1, '2014-06-20 14:41:51', '2014-06-20 14:41:51'),
(73, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/pages/0/delete', 4, 68, 1, '2014-06-20 14:42:04', '2014-06-20 14:42:04'),
(74, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/status/0/view', 4, 60, 1, '2014-06-20 14:42:14', '2014-06-20 14:42:14'),
(75, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/pages/updateparts', 3, 69, 1, '2014-06-23 23:46:28', '2014-06-23 23:46:28'),
(76, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/resource/create', 1, 70, 1, '2014-06-24 03:49:09', '2014-06-24 03:49:09'),
(77, 'publish', 1, '', 3, 71, 1, '2014-06-24 03:50:30', '2014-06-24 03:50:30'),
(78, 'acessar', 0, 'Acessou a pÃ¡gina: controller/ModulusUser\\Controller\\Auth:', 5, 72, 1, '2014-06-24 11:09:04', '2014-06-24 11:09:04'),
(79, 'acessar', 0, 'Acessou a pÃ¡gina: controller/ModulusUser\\Controller\\User:', 4, 73, 1, '2014-06-24 11:10:42', '2014-06-24 11:10:42'),
(80, 'acessar', 0, 'Acessou a pÃ¡gina: controller/ModulusUser\\Controller\\Perfil:', 4, 74, 1, '2014-06-24 11:11:00', '2014-06-24 11:11:00'),
(81, 'acessar', 1, 'Acessou a pÃ¡gina: controller/ModulusConfig\\Controller\\Config:', 1, 75, 1, '2014-06-24 11:12:02', '2014-06-24 11:12:02'),
(82, 'acessar', 1, 'Acessou a pÃ¡gina: controller/ModulusAcl\\Controller\\Guard:', 1, 76, 1, '2014-06-24 11:14:10', '2014-06-24 11:14:10'),
(83, 'publish', 1, '', 3, 77, 1, '2014-06-24 15:27:44', '2014-06-24 15:27:44'),
(84, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/', 5, 78, 1, '2014-06-25 02:31:08', '2014-06-25 02:31:08'),
(85, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/content', 5, 79, 1, '2014-06-25 20:10:41', '2014-06-25 20:10:41'),
(86, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/menu', 3, 80, 1, '2014-06-27 02:41:07', '2014-06-27 02:41:07'),
(87, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/menu/create', 1, 81, 1, '2014-06-29 23:59:26', '2014-06-29 23:59:26'),
(88, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/content/posts/0/delete', 3, 82, 1, '2014-06-30 03:49:47', '2014-06-30 03:49:47'),
(89, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/metatags/save', 3, 83, 1, '2014-06-30 17:48:26', '2014-06-30 17:48:26'),
(90, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/metatags/save', 3, 83, 1, '2014-07-01 22:13:26', '2014-07-01 22:13:26'),
(91, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/cache', 4, 84, 1, '2014-07-02 01:29:37', '2014-07-02 01:29:37'),
(92, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/email/log', 1, 85, 1, '2014-07-02 21:03:25', '2014-07-02 21:03:25'),
(93, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/filemanager/image', 4, 86, 1, '2014-07-06 21:08:30', '2014-07-06 21:08:30'),
(94, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/acl/resource/0/delete', 3, 41, 1, '2014-07-07 21:23:25', '2014-07-07 21:23:25'),
(95, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/template-config/save', 4, 87, 1, '2014-07-11 20:48:48', '2014-07-11 20:48:48'),
(96, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/products', 4, 88, 1, '2014-07-16 17:29:02', '2014-07-16 17:29:02'),
(97, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/products/create', 4, 89, 1, '2014-07-16 17:29:21', '2014-07-16 17:29:21'),
(98, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/products/0/update', 4, 90, 1, '2014-07-16 17:29:33', '2014-07-16 17:29:33'),
(99, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/products/0/delete', 3, 91, 1, '2014-07-16 17:29:49', '2014-07-16 17:29:49'),
(100, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/products/0/view', 4, 92, 1, '2014-07-16 17:30:10', '2014-07-16 17:30:10'),
(101, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/categorys', 3, 93, 1, '2014-07-16 17:33:00', '2014-07-16 17:33:00'),
(102, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/categorys/create', 3, 94, 1, '2014-07-16 17:33:16', '2014-07-16 17:33:16'),
(103, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/categorys/0/update', 3, 95, 1, '2014-07-16 17:33:36', '2014-07-16 17:33:36'),
(104, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/categorys/0/delete', 3, 96, 1, '2014-07-16 17:33:57', '2014-07-16 17:33:57'),
(105, 'acessar', 0, 'Acessou a pÃ¡gina: http://pacman.local/modulus/categorys/0/view', 3, 97, 1, '2014-07-16 17:34:15', '2014-07-16 17:34:15'),
(106, 'acessar', 1, 'Acessou a pÃ¡gina: http://pacman.local/modulus/save-basic-privileges', 1, 98, 1, '2014-07-28 17:09:57', '2014-07-28 17:09:57'),
(107, 'update', 1, 'update', 4, 2, 1, '2014-07-29 12:44:25', '2014-07-29 12:44:25'),
(112, 'read', 1, 'read', 4, 2, 1, '2014-08-01 20:09:54', '2014-08-01 20:09:54'),
(113, 'view', 1, 'view', 4, 102, 1, '2014-08-04 13:37:09', '2014-08-04 13:37:09'),
(114, 'upload', 1, 'upload', 4, 102, 1, '2014-08-04 13:37:09', '2014-08-04 13:37:09'),
(115, 'crop', 1, 'crop', 4, 102, 1, '2014-08-04 13:37:09', '2014-08-04 13:37:09'),
(116, 'view', 1, 'view', 4, 103, 1, '2014-08-04 13:37:09', '2014-08-04 13:37:09'),
(117, 'save', 1, 'save', 4, 103, 1, '2014-08-04 13:37:09', '2014-08-04 13:37:09'),
(118, 'view', 1, 'view', 4, 104, 1, '2014-08-04 13:37:09', '2014-08-04 13:37:09'),
(119, 'save', 1, 'save', 4, 104, 1, '2014-08-04 13:37:09', '2014-08-04 13:37:09'),
(120, 'view', 1, 'view', 3, 100, 1, '2014-08-04 13:38:43', '2014-08-04 13:38:43'),
(123, 'rename', 1, 'rename', 3, 102, 1, '2014-08-04 13:38:43', '2014-08-04 13:38:43'),
(124, 'delete', 1, 'delete', 3, 102, 1, '2014-08-04 13:38:43', '2014-08-04 13:38:43'),
(125, 'publish', 1, 'publish', 3, 103, 1, '2014-08-04 13:38:43', '2014-08-04 13:38:43'),
(126, 'delete', 1, 'delete', 3, 103, 1, '2014-08-04 13:38:43', '2014-08-04 13:38:43'),
(127, 'manage_menus', 1, 'manage_menus', 3, 103, 1, '2014-08-04 13:38:43', '2014-08-04 13:38:43'),
(128, 'delete', 1, 'delete', 3, 104, 1, '2014-08-04 13:38:44', '2014-08-04 13:38:44'),
(129, 'manage_categorys', 1, 'manage_categorys', 3, 104, 1, '2014-08-04 13:38:44', '2014-08-04 13:38:44'),
(131, 'config_reset', 1, 'config_reset', 6, 101, 1, '2014-08-04 13:50:26', '2014-08-04 13:50:26'),
(133, 'manage_status', 1, 'manage_status', 6, 103, 1, '2014-08-04 13:50:26', '2014-08-04 13:50:26'),
(134, 'save', 1, 'save', 1, 100, 1, '2014-08-04 13:51:10', '2014-08-04 13:51:10'),
(135, 'delete', 1, 'delete', 1, 100, 1, '2014-08-04 13:51:10', '2014-08-04 13:51:10'),
(137, 'manage_guards', 1, 'manage_guards', 6, 99, 1, '2014-08-04 13:54:31', '2014-08-04 13:54:31'),
(138, 'manage_privileges', 1, 'manage_privileges', 6, 99, 1, '2014-08-04 13:54:31', '2014-08-04 13:54:31'),
(139, 'manage_resources', 1, 'manage_resources', 6, 99, 1, '2014-08-04 13:54:31', '2014-08-04 13:54:31'),
(140, 'manage_roles', 1, 'manage_roles', 1, 99, 1, '2014-08-04 13:54:31', '2014-08-04 13:54:31'),
(141, 'view_logs', 1, 'view_logs', 1, 101, 1, '2014-08-04 14:06:55', '2014-08-04 14:06:55'),
(142, 'interface_save', 1, 'interface_save', 3, 101, 1, '2014-08-04 17:07:48', '2014-08-04 17:07:48'),
(145, 'config_save', 1, 'config_save', 3, 101, 1, '2014-08-04 19:31:12', '2014-08-04 19:31:12'),
(146, 'manage_type', 1, 'manage_type', 6, 103, 1, '2014-08-04 19:41:03', '2014-08-04 19:41:03'),
(147, 'config_reset', 1, 'config_reset', 1, 101, 1, '2014-08-05 14:30:13', '2014-08-05 14:30:13');

-- --------------------------------------------------------

--
-- Table structure for table `acl_resource`
--

DROP TABLE IF EXISTS `acl_resource`;
CREATE TABLE IF NOT EXISTS `acl_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D' COMMENT 'C = Controllers, D = Default',
  `display_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=107 ;

--
-- Dumping data for table `acl_resource`
--

INSERT INTO `acl_resource` (`id`, `name`, `type`, `display_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'contentInterface', 'D', 'Editar textos das interfaces', 1, '2014-05-02 10:54:33', '2014-05-02 10:54:33'),
(2, 'crud', 'D', 'OperaÃ§Ãµes basicas', 1, '2014-06-05 22:19:10', '2014-06-05 22:19:10'),
(3, 'route/modulus', 'R', 'Route: modulus', 1, '2014-06-07 01:54:49', '2014-06-07 01:54:49'),
(4, 'route/modulus/user-activate', 'R', 'pÃ¡gina: http://pacman.local/modulus/user/activate', 1, '2014-06-07 03:12:32', '2014-06-07 03:12:32'),
(5, 'route/modulus/user-auth', 'R', 'pÃ¡gina: http://pacman.local/modulus/login', 1, '2014-06-07 03:12:49', '2014-06-07 03:12:49'),
(6, 'route/modulus/user-forgot', 'R', 'pÃ¡gina: http://pacman.local/modulus/forgot', 1, '2014-06-07 03:13:03', '2014-06-07 03:13:03'),
(7, 'route/modulus/user-recover', 'R', 'pÃ¡gina: http://pacman.local/modulus/recover', 1, '2014-06-07 03:13:15', '2014-06-07 03:13:15'),
(8, 'route/modulus/user-perfil', 'R', 'pÃ¡gina: http://pacman.local/modulus/user/perfil', 1, '2014-06-07 12:22:28', '2014-06-07 12:22:28'),
(9, 'route/modulus/user-logout', 'R', 'pÃ¡gina: http://pacman.local/modulus/user/logout', 1, '2014-06-07 12:22:45', '2014-06-07 12:22:45'),
(10, 'route/modulus/user', 'R', 'pÃ¡gina: http://pacman.local/modulus/user', 1, '2014-06-07 12:23:14', '2014-06-07 12:23:14'),
(11, 'route/modulus/user/create', 'R', 'pÃ¡gina: http://pacman.local/modulus/user/create', 1, '2014-06-07 12:23:29', '2014-06-07 12:23:29'),
(12, 'route/modulus/user/update', 'R', 'pÃ¡gina: http://pacman.local/modulus/user/0/update', 1, '2014-06-07 12:23:47', '2014-06-07 12:23:47'),
(13, 'route/modulus/user/delete', 'R', 'pÃ¡gina: http://pacman.local/modulus/user/0/delete', 1, '2014-06-07 12:24:02', '2014-06-07 12:24:02'),
(14, 'route/modulus/user/view', 'R', 'pÃ¡gina: http://pacman.local/modulus/user/0/view', 1, '2014-06-07 12:24:22', '2014-06-07 12:24:22'),
(15, 'route/modulus/user-resendemail', 'R', 'pÃ¡gina: http://pacman.local/modulus/user/resend-email', 1, '2014-06-07 12:24:49', '2014-06-07 12:24:49'),
(16, 'route/modulus/guard', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/controller', 1, '2014-06-07 12:48:59', '2014-06-07 12:48:59'),
(17, 'route/modulus/guard/create', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/controller/create', 1, '2014-06-07 12:49:31', '2014-06-07 12:49:31'),
(18, 'route/modulus/guard/update', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/controller/0/update', 1, '2014-06-07 12:49:43', '2014-06-07 12:49:43'),
(19, 'route/modulus/guard/delete', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/controller/0/delete', 1, '2014-06-07 12:49:57', '2014-06-07 12:49:57'),
(20, 'route/modulus/guard/view', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/controller/0/view', 1, '2014-06-07 12:50:14', '2014-06-07 12:50:14'),
(21, 'route/modulus/routes', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/route', 1, '2014-06-07 12:50:28', '2014-06-07 12:50:28'),
(22, 'route/modulus/routes/create', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/route/create', 1, '2014-06-07 12:50:41', '2014-06-07 12:50:41'),
(23, 'route/modulus/routes/update', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/route/0/update', 1, '2014-06-07 12:51:26', '2014-06-07 12:51:26'),
(24, 'route/modulus/routes/delete', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/route/0/delete', 1, '2014-06-07 12:53:11', '2014-06-07 12:53:11'),
(25, 'route/modulus/routes/view', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/route/0/view', 1, '2014-06-07 12:53:25', '2014-06-07 12:53:25'),
(26, 'route/modulus/privileges', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/privilege', 1, '2014-06-07 12:53:49', '2014-06-07 12:53:49'),
(27, 'route/modulus/privileges/create', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/privilege/create', 1, '2014-06-07 12:54:03', '2014-06-07 12:54:03'),
(28, 'route/modulus/privileges/update', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/privilege/0/update', 1, '2014-06-07 12:54:21', '2014-06-07 12:54:21'),
(29, 'route/modulus/privileges/delete', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/privilege/0/delete', 1, '2014-06-07 12:55:54', '2014-06-07 12:55:54'),
(30, 'route/modulus/privileges/view', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/privilege/0/view', 1, '2014-06-07 12:56:14', '2014-06-07 12:56:14'),
(31, 'route/modulus/modulus_config', 'R', 'pÃ¡gina: http://pacman.local/modulus/configuration', 1, '2014-06-07 13:00:55', '2014-06-07 13:00:55'),
(32, 'route/modulus/interface-content', 'R', 'pÃ¡gina: http://pacman.local/modulus/interfacecontent/save', 1, '2014-06-09 14:22:00', '2014-06-09 14:22:00'),
(33, 'route/galeria-admin', 'R', 'pÃ¡gina: http://pacman.local/pacman/galeria', 1, '2014-06-09 20:46:30', '2014-06-09 20:46:30'),
(34, 'route/modulus/roles', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/role', 1, '2014-06-11 13:01:56', '2014-06-11 13:01:56'),
(35, 'route/modulus/roles/create', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/role/create', 1, '2014-06-11 13:02:12', '2014-06-11 13:02:12'),
(36, 'route/modulus/roles/update', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/role/0/update', 1, '2014-06-11 13:02:30', '2014-06-11 13:02:30'),
(37, 'route/modulus/roles/view', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/role/0/view', 1, '2014-06-11 13:03:09', '2014-06-11 13:03:09'),
(38, 'route/doctrine_orm_module_yuml', 'R', 'pÃ¡gina: http://pacman.local/ocra_service_manager_yuml', 1, '2014-06-11 21:15:10', '2014-06-11 21:15:10'),
(39, 'route/modulus/resources', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/resource', 1, '2014-06-16 00:06:26', '2014-06-16 00:06:26'),
(40, 'route/modulus/resources/update', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/resource/0/update', 1, '2014-06-16 00:06:45', '2014-06-16 00:06:45'),
(41, 'route/modulus/resources/delete', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/resource/0/delete', 1, '2014-06-16 00:07:09', '2014-06-16 00:07:09'),
(42, 'route/modulus/resources/view', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/resource/0/view', 1, '2014-06-16 00:23:49', '2014-06-16 00:23:49'),
(45, 'route/modulus/galeria', 'R', 'pÃ¡gina: http://pacman.local/modulus/galeria', 1, '2014-06-16 00:28:14', '2014-06-16 00:28:14'),
(46, 'route/modulus/modulus_log', 'R', 'pÃ¡gina: http://pacman.local/modulus/log', 1, '2014-06-16 00:43:13', '2014-06-16 00:43:13'),
(47, 'route/modulus/modulus_log_view', 'R', 'pÃ¡gina: http://pacman.local/modulus/log/view', 1, '2014-06-16 02:52:40', '2014-06-16 02:52:40'),
(48, 'route/modulus/filemanager-execute', 'R', 'pÃ¡gina: http://pacman.local/modulus/filemanager/execute', 1, '2014-06-17 14:26:46', '2014-06-17 14:26:46'),
(49, 'route/modulus/modulus_mail', 'R', 'pÃ¡gina: http://pacman.local/modulus/email', 1, '2014-06-18 19:13:52', '2014-06-18 19:13:52'),
(50, 'route/modulus/filemanager', 'R', 'pÃ¡gina: http://pacman.local/modulus/filemanager', 1, '2014-06-18 22:46:03', '2014-06-18 22:46:03'),
(51, 'route/modulus/content-types', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/types', 1, '2014-06-20 02:06:21', '2014-06-20 02:06:21'),
(52, 'route/modulus/content-types/create', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/types/create', 1, '2014-06-20 02:06:36', '2014-06-20 02:06:36'),
(53, 'route/modulus/content-types/update', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/types/0/update', 1, '2014-06-20 02:06:51', '2014-06-20 02:06:51'),
(54, 'route/modulus/content-types/delete', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/types/0/delete', 1, '2014-06-20 02:07:05', '2014-06-20 02:07:05'),
(55, 'route/modulus/content-types/view', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/types/0/view', 1, '2014-06-20 02:07:17', '2014-06-20 02:07:17'),
(56, 'route/modulus/content-status', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/status', 1, '2014-06-20 14:38:34', '2014-06-20 14:38:34'),
(57, 'route/modulus/content-status/create', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/status/create', 1, '2014-06-20 14:38:48', '2014-06-20 14:38:48'),
(58, 'route/modulus/content-status/update', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/status/0/update', 1, '2014-06-20 14:39:00', '2014-06-20 14:39:00'),
(59, 'route/modulus/content-status/delete', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/status/0/delete', 1, '2014-06-20 14:39:14', '2014-06-20 14:39:14'),
(60, 'route/modulus/content-status/view', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/status/0/view', 1, '2014-06-20 14:39:31', '2014-06-20 14:39:31'),
(61, 'route/modulus/content-posts', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/posts', 1, '2014-06-20 14:39:50', '2014-06-20 14:39:50'),
(62, 'route/modulus/content-posts/create', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/posts/create', 1, '2014-06-20 14:40:04', '2014-06-20 14:40:04'),
(63, 'route/modulus/content-posts/update', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/posts/0/update', 1, '2014-06-20 14:40:18', '2014-06-20 14:40:18'),
(64, 'route/modulus/content-posts/view', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/posts/0/view', 1, '2014-06-20 14:40:33', '2014-06-20 14:40:33'),
(65, 'route/modulus/content-pages', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/pages', 1, '2014-06-20 14:40:44', '2014-06-20 14:40:44'),
(66, 'route/modulus/content-pages/create', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/pages/create', 1, '2014-06-20 14:41:35', '2014-06-20 14:41:35'),
(67, 'route/modulus/content-pages/update', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/pages/0/update', 1, '2014-06-20 14:41:51', '2014-06-20 14:41:51'),
(68, 'route/modulus/content-pages/delete', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/pages/0/delete', 1, '2014-06-20 14:42:04', '2014-06-20 14:42:04'),
(69, 'route/modulus/updateparts-page', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/pages/updateparts', 1, '2014-06-23 23:46:28', '2014-06-23 23:46:28'),
(70, 'route/modulus/resources/create', 'R', 'pÃ¡gina: http://pacman.local/modulus/acl/resource/create', 1, '2014-06-24 03:49:09', '2014-06-24 03:49:09'),
(71, 'page', 'D', 'PÃ¡ginas', 1, '2014-06-24 03:49:32', '2014-06-24 03:49:50'),
(72, 'controller/ModulusUser\\Controller\\Auth', 'C', 'PÃ¡gina: ModulusUser\\Controller\\Authaction: ', 1, '2014-06-24 11:09:04', '2014-06-24 11:09:04'),
(73, 'controller/ModulusUser\\Controller\\User', 'C', 'PÃ¡gina: ModulusUser\\Controller\\Useraction: ', 1, '2014-06-24 11:10:42', '2014-06-24 11:10:42'),
(74, 'controller/ModulusUser\\Controller\\Perfil', 'C', 'PÃ¡gina: ModulusUser\\Controller\\Perfilaction: ', 1, '2014-06-24 11:11:00', '2014-06-24 11:11:00'),
(75, 'controller/ModulusConfig\\Controller\\Config', 'C', 'PÃ¡gina: ModulusConfig\\Controller\\Configaction: ', 1, '2014-06-24 11:12:02', '2014-06-24 11:12:02'),
(76, 'controller/ModulusAcl\\Controller\\Guard', 'C', 'PÃ¡gina: ModulusAcl\\Controller\\Guardaction: ', 1, '2014-06-24 11:14:10', '2014-06-24 11:14:10'),
(77, 'post', 'D', 'Postagem', 1, '2014-06-24 15:27:21', '2014-06-24 15:27:21'),
(78, 'route/home', 'R', 'pÃ¡gina: http://pacman.local/', 1, '2014-06-25 02:31:08', '2014-06-25 02:31:08'),
(79, 'route/home/content', 'R', 'pÃ¡gina: http://pacman.local/content', 1, '2014-06-25 20:10:41', '2014-06-25 20:10:41'),
(80, 'route/modulus/menus', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/menu', 1, '2014-06-27 02:41:07', '2014-06-27 02:41:07'),
(81, 'route/modulus/menus-create', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/menu/create', 1, '2014-06-29 23:59:26', '2014-06-29 23:59:26'),
(82, 'route/modulus/content-posts/delete', 'R', 'pÃ¡gina: http://pacman.local/modulus/content/posts/0/delete', 1, '2014-06-30 03:49:47', '2014-06-30 03:49:47'),
(83, 'route/modulus/metatags-save', 'R', 'pÃ¡gina: http://pacman.local/modulus/metatags/save', 1, '2014-06-30 17:48:26', '2014-06-30 17:48:26'),
(84, 'route/modulus/modulus_cache', 'R', 'pÃ¡gina: http://pacman.local/modulus/cache', 1, '2014-07-02 01:29:37', '2014-07-02 01:29:37'),
(85, 'route/modulus/log_mail', 'R', 'pÃ¡gina: http://pacman.local/modulus/email/log', 1, '2014-07-02 21:03:24', '2014-07-02 21:03:24'),
(86, 'route/modulus/galeria-image', 'R', 'pÃ¡gina: http://pacman.local/modulus/filemanager/image', 1, '2014-07-06 21:08:30', '2014-07-06 21:08:30'),
(87, 'route/modulus/template-config-save', 'R', 'pÃ¡gina: http://pacman.local/modulus/template-config/save', 1, '2014-07-11 20:48:48', '2014-07-11 20:48:48'),
(88, 'route/modulus/products', 'R', 'pÃ¡gina: http://pacman.local/modulus/products', 1, '2014-07-16 17:29:02', '2014-07-16 17:29:02'),
(89, 'route/modulus/products/create', 'R', 'pÃ¡gina: http://pacman.local/modulus/products/create', 1, '2014-07-16 17:29:21', '2014-07-16 17:29:21'),
(90, 'route/modulus/products/update', 'R', 'pÃ¡gina: http://pacman.local/modulus/products/0/update', 1, '2014-07-16 17:29:33', '2014-07-16 17:29:33'),
(91, 'route/modulus/products/delete', 'R', 'pÃ¡gina: http://pacman.local/modulus/products/0/delete', 1, '2014-07-16 17:29:49', '2014-07-16 17:29:49'),
(92, 'route/modulus/products/view', 'R', 'pÃ¡gina: http://pacman.local/modulus/products/0/view', 1, '2014-07-16 17:30:10', '2014-07-16 17:30:10'),
(93, 'route/modulus/categorys', 'R', 'pÃ¡gina: http://pacman.local/modulus/categorys', 1, '2014-07-16 17:33:00', '2014-07-16 17:33:00'),
(94, 'route/modulus/categorys/create', 'R', 'pÃ¡gina: http://pacman.local/modulus/categorys/create', 1, '2014-07-16 17:33:15', '2014-07-16 17:33:15'),
(95, 'route/modulus/categorys/update', 'R', 'pÃ¡gina: http://pacman.local/modulus/categorys/0/update', 1, '2014-07-16 17:33:36', '2014-07-16 17:33:36'),
(96, 'route/modulus/categorys/delete', 'R', 'pÃ¡gina: http://pacman.local/modulus/categorys/0/delete', 1, '2014-07-16 17:33:57', '2014-07-16 17:33:57'),
(97, 'route/modulus/categorys/view', 'R', 'pÃ¡gina: http://pacman.local/modulus/categorys/0/view', 1, '2014-07-16 17:34:15', '2014-07-16 17:34:15'),
(98, 'route/modulus/saveBasicPrivileges', 'R', 'pÃ¡gina: http://pacman.local/modulus/save-basic-privileges', 1, '2014-07-28 17:09:56', '2014-07-28 17:09:56'),
(99, 'modulus_acl', 'D', NULL, 1, '2014-07-28 22:56:21', '2014-07-28 22:56:21'),
(100, 'modulus_users', 'D', 'modulus_users', 1, '2014-08-01 20:04:29', '2014-08-01 20:04:29'),
(101, 'system', 'D', 'system', 1, '2014-08-01 20:04:30', '2014-08-01 20:04:30'),
(102, 'gallery', 'D', 'gallery', 1, '2014-08-01 20:04:30', '2014-08-01 20:04:30'),
(103, 'content', 'D', 'content', 1, '2014-08-01 20:04:30', '2014-08-01 20:04:30'),
(104, 'products', 'D', 'products', 1, '2014-08-01 20:04:30', '2014-08-01 20:04:30'),
(105, 'userid', 'D', 'userid', 1, '2014-08-05 23:42:36', '2014-08-05 23:42:36'),
(106, 'role', 'D', 'role', 1, '2014-08-05 23:42:36', '2014-08-05 23:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `acl_role`
--

DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE IF NOT EXISTS `acl_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_acl_role_acl_role1_idx` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `acl_role`
--

INSERT INTO `acl_role` (`id`, `name`, `display_name`, `status`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 'admin', 'Administrador', 1, '2014-05-02 01:49:00', '2014-08-05 14:33:13', 3),
(3, 'editor', 'Editor', 1, '2014-06-05 22:05:21', '2014-08-06 01:24:57', 4),
(4, 'user', 'UsuÃ¡rio comum', 1, '2014-06-05 22:34:02', '2014-08-06 01:24:18', 5),
(5, 'guest', 'usuÃ¡rio nÃ£o cadastrado', 1, '2014-06-05 23:51:06', '2014-08-06 01:24:57', NULL),
(6, 'developer', 'Desenvolvedor', 1, '2014-08-04 13:48:06', '2014-08-05 14:33:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `acl_role_linker`
--

DROP TABLE IF EXISTS `acl_role_linker`;
CREATE TABLE IF NOT EXISTS `acl_role_linker` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `fk_acl_role_has_user_user1_idx` (`user_id`),
  KEY `fk_acl_role_has_user_acl_role1_idx` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `acl_role_linker`
--

INSERT INTO `acl_role_linker` (`role_id`, `user_id`) VALUES
(1, 1),
(3, 2),
(6, 7);

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `config` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_UNIQUE` (`module`,`config`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=62 ;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `module`, `config`, `value`) VALUES
(23, 'modulus_mail', 'service', '89c10c25548eeaebc62370e55293cf6327d088a7bc70252acdcde39e8384bf84YMCtAMEFYhsfqM20xWv+wv+i82cG0DTCKU/QKMR7CSQ='),
(24, 'modulus_mail', 'mailgun_domain', '76578457038ff3bf50fda59292173f14757d06a16ad7ccd854d907ce9fd5ab854TbSXw1r+FZB9lzNqkDX6EW7bIiyu3dkIqsZVP1V+pf/dR/2zUaJoWetf74h9bMIHYq5/gsIE+5UzpjChlbWneY5ic+H3cJmHpX94rkkbfs='),
(25, 'modulus_mail', 'mailgun_key', '6890f9b3753af9cd493242b37947d81d9104514b165675a78ffef045a57cffce49p5se3uNtjEd+o9WJfrWPlsC9CFNaId6c6uOYBtmLq18iyRVGPSdGAN2meimK16OshRQw8FyvB9+Ww+LD3wKQ=='),
(26, 'modulus_mail', 'smtp_host', 'e4e26cc48fa4596618a8034545d198be78894a760b49c236e1251d61fbdf4b8fO3rcwnVEHqD/DMhLEkwxEJf92G2aOcSaD1Jce6MJIic='),
(27, 'modulus_mail', 'smtp_username', '0fa684aa609f6222b2522f3166c1d5965161bcb027060b7eed30aef0bd9d6340FHdMcgs91oVUqNABNKRmx+dm49wsHa/zmKjqKQc0Hps3F2NOb3js8k7tQmyjpYtR'),
(28, 'modulus_mail', 'smtp_password', ''),
(29, 'modulus_mail', 'smtp_ssl', '1c3106c342d2925f6e07db6767007a29e7ed204a258624465ebbdf247a29b238r/fnoWzR9CXSGXKBGASo0rKx7RGyaPQR8g90sVt/Tx8='),
(30, 'modulus_mail', 'smtp_port', '8c03015cc9ce1552128bee5c3aa889141a805f7dd25fabc19b6ae84cab7e4559eipaS0o1i0ptOQhl1i/B8/xQurRWufVzueX5XmRO4uk='),
(31, 'modulus_mail', 'from', 'af82af7019ef168e931fad60d17528ad27644b686ce26509a655213a2ccfab45HnEZASGLO6TPVREPIL3HzXoMNGhmDp493Tdc2UpMj5zSkk3DVsFm5JkMNvspyMiR'),
(45, 'modulus_filemanager', 'useYearMonthFolder', 'dbb6baa77e719a23955f92c561d9f478ad3a0790f3246d7d8aaf240510234574a2LTYXLoSzu1Nc8Vd0uY5GCFAb7xst8vWEybmjCt3OM='),
(46, 'modulus_filemanager', 'useUniqueUploadName', '39b1b48d484ac4218dcf3debd255e1df95c72a9378879d0d107a7f137423c6b5CXk+6kGcQrTQieEn8U6A1bHvt1hlcuCMxVz6p7B7+IE='),
(47, 'modulus_filemanager', 'renameFile', '9c7963ed90c23c3320ad81b3c635df50d4e40f5fbb682f3eedd4cf5fc937e62d+wI4C8jFjCR6KzeqWOTHxrj8rRmp5evnlWXXj/n0FWk='),
(48, 'modulus_filemanager', 'deleteFile', '055f6c22ee350b597f1617784d20f4d462d0c5d0afb9a3ba251c960242e1c2a6e2cEFP1nHvZ6Ib1m1d8JN33W9Br+MOWtFxKQOjLQBY0='),
(49, 'modulus_filemanager', 'templateImagem', '44c2549ca0f282243bf664f894e769f733228a99016b37a4342412740e47ac70YlblB/OY4W7aS5juh5DVWr0LD5zmf+H8rf/PreAOrZliX6bAGmIyli+ppl6Sgy3ju/4GcfASHqaybVK3fCutSErzBYzJXZVdrpyhjJ2DupE='),
(50, 'modulus_filemanager', 'templateVideo', '64df78b3826e86958b64623c9a7260b3974ad0f920a387624e712d91ac595506GFF2ROzxayY8oD8ncWf9V3taGGkLawsNzxJxwkkcHcNftPtIA7NxIbNwrsbA4zOqEJS06CqnhE2zTWS101KbzPgQPYDH9rQDANfw/kMzCiZhqEjfl5WQaiUrgW/qXmlNfGCF6R1h1yidQWSGQRSJsW5hgNz6gBzR0meWUNhKA9gDbE4QBIPwHk0qrduqc0rinpVxECTSDj2WQ6tOCOw1MOj6bvFo3YJji8ueN/7nDHEi1EfGBI4PkqulD/CsMtWC'),
(51, 'modulus_filemanager', 'ext_img', '25f552bac366f9e13cf868cdad079ce3f62cecb3b264d5f0d6fd1f4153015189taQG6bDPllZp1lRbP/+hNEB2OBvT+OwzOsgtMcBjR9j5L6ob/PiOcqnwxk5guzX8'),
(52, 'modulus_filemanager', 'ext_file', '69d0633b882fcba0cd95066dfa57ce75f7df3df1567a35dd116144b497103971wVKdSYGVgeLdpYeYKg+pKa6grkecXL69CeIJLLDHjzOFwRbJJuyVHyVBVG9fGXsrBOh3kDbUUifFkKGhOVj5H8XBPRgrpQeETpGgdx8yv5LVxZxBVRovdaL3urVHG2LZ1AIL2tTr8JyQEfUAY1w0eEBSPH3iVxM59CVIJf1W9UQQwhTtMGAmWPh93WfQvgbIbSpBYnkAeI/Deosr0ygA4A=='),
(53, 'modulus_filemanager', 'ext_music', '0a2ac24cc21dcfab2e5b8d44834b78ebc79b57d3d92cd43ec399d39506a3ef23mGfFNbJQ2pdP5ErAoMryG6f6pRYaJOtLYgsjIH1ffz6x5woTpR79G3mHLkW/MYeS'),
(54, 'modulus_filemanager', 'ext_misc', '8094962231ea65cf3a5b419730d975b94a1cfa604a5ad751c9fd9e4a17b6993b5qSOtpOSHPc9W3svEFtpRdo1cei4+xOJVD5vx9g7xHuWVLycmguV0My2FOaImoig'),
(55, 'modulus_ceo', 'title', 'a72938332a454ce03439ee79f76584a0c4966c55fbeeaf1cf887a339f30206dbjXWauS03g1ksoSTvgqKQoU/v/3JUWbBktIpBMcsYmuo='),
(56, 'modulus_ceo', 'description', 'b5816ccdfc2a91bb45529205cbb6acbab6d42087b511d3401a144581e2b828acec9Uatev5JU716d/D9hjAXTyszAPB9eUxPrsPwKw18diEL3FAJHxXjnnZpUsIJsS8QaUj3vjeKRyyCoZocRoPg=='),
(57, 'modulus_ceo', 'author', 'cb39e6c9b7de089064f7f00d2f703e327bb5ee1fb736fd28a3c38190133420a9wrJOjMqeXHKjpoXvmtjfPIe6pZFedw21Ld3p5FQhqL8uzgONQfJYtrozRv3+SmtT'),
(58, 'modulus_ceo', 'robots', '5e8bab54dee7425360ebe59fb67af32ccd9912fe6752a8fa40a958c9036320ea+dexNATTfv6OctiUJ5MLWCOK+2Dh/C8MkPzg3dNmGM0='),
(59, 'modulus_ceo', 'googleanalytics_id', '4192ae9acf7fda7263b596417eaf9aed81fa7d8cbff8e04c230da8cf44ec3e4fLQUAYJMjnsK7pVA1h6NVm5JJbzh3e8UTGYGPwMSfgqg='),
(60, 'modulus_ceo', 'googleanalytics_enable', 'ae44e3d6bcfd200418bc9bea1f4c1fc35d4f8419ee1d00996c052695e2a0b454n+xAMQznVnL8haQU+aZqU36pVvJqQ63R2XWrSH0eiFM='),
(61, 'modulus_ceo', 'googleanalytics_enabledisplay', '');

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entity` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `upload_at` datetime NOT NULL,
  `filetype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_file_filetype1_idx` (`filetype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `filetype`
--

DROP TABLE IF EXISTS `filetype`;
CREATE TABLE IF NOT EXISTS `filetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_itens`
--

DROP TABLE IF EXISTS `gallery_itens`;
CREATE TABLE IF NOT EXISTS `gallery_itens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordem` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gallery_has_videos_gallery2_idx` (`gallery_id`),
  KEY `fk_gallery_itens_file1_idx` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `interface`
--

DROP TABLE IF EXISTS `interface`;
CREATE TABLE IF NOT EXISTS `interface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pk` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_UNIQUE` (`pk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=64 ;

--
-- Dumping data for table `interface`
--

INSERT INTO `interface` (`id`, `pk`) VALUES
(62, 'addGuardBasicConfig'),
(53, 'addMetatags'),
(60, 'addTemplateConfig'),
(63, 'config_modulus_mail'),
(55, 'Front\\Controller\\Index-index'),
(13, 'Gallery'),
(19, 'ModulusAcl\\Controller\\Guard-create'),
(12, 'ModulusAcl\\Controller\\Guard-read'),
(27, 'ModulusAcl\\Controller\\Guard-update'),
(26, 'ModulusAcl\\Controller\\Guard-view'),
(17, 'ModulusAcl\\Controller\\Privileges-create'),
(2, 'ModulusAcl\\Controller\\Privileges-read'),
(32, 'ModulusAcl\\Controller\\Privileges-update'),
(31, 'ModulusAcl\\Controller\\Privileges-view'),
(34, 'ModulusAcl\\Controller\\Resources-create'),
(33, 'ModulusAcl\\Controller\\Resources-read'),
(36, 'ModulusAcl\\Controller\\Resources-update'),
(35, 'ModulusAcl\\Controller\\Resources-view'),
(21, 'ModulusAcl\\Controller\\Roles-create'),
(20, 'ModulusAcl\\Controller\\Roles-read'),
(22, 'ModulusAcl\\Controller\\Roles-update'),
(30, 'ModulusAcl\\Controller\\Roles-view'),
(5, 'ModulusAcl\\Controller\\Routes-create'),
(1, 'ModulusAcl\\Controller\\Routes-read'),
(29, 'ModulusAcl\\Controller\\Routes-update'),
(28, 'ModulusAcl\\Controller\\Routes-view'),
(54, 'ModulusBase\\Controller\\Index-index'),
(3, 'ModulusConfig\\Controller\\Config-index'),
(52, 'ModulusContent\\Controller\\Menu-create'),
(51, 'ModulusContent\\Controller\\Menu-index'),
(15, 'ModulusContent\\Controller\\Page-create'),
(18, 'ModulusContent\\Controller\\Page-read'),
(16, 'ModulusContent\\Controller\\Page-update'),
(46, 'ModulusContent\\Controller\\Page-view'),
(48, 'ModulusContent\\Controller\\Post-create'),
(47, 'ModulusContent\\Controller\\Post-read'),
(49, 'ModulusContent\\Controller\\Post-update'),
(50, 'ModulusContent\\Controller\\Post-view'),
(43, 'ModulusContent\\Controller\\Status-create'),
(42, 'ModulusContent\\Controller\\Status-read'),
(45, 'ModulusContent\\Controller\\Status-update'),
(44, 'ModulusContent\\Controller\\Status-view'),
(39, 'ModulusContent\\Controller\\Type-create'),
(38, 'ModulusContent\\Controller\\Type-read'),
(41, 'ModulusContent\\Controller\\Type-update'),
(40, 'ModulusContent\\Controller\\Type-view'),
(58, 'ModulusFileManager\\Controller\\FileManager-index'),
(11, 'ModulusFileManager\\Controller\\Galeria-index'),
(59, 'ModulusFileManager\\Controller\\Imagem-index'),
(6, 'ModulusLog\\Controller\\Index-index'),
(10, 'ModulusLog\\Controller\\Index-view'),
(37, 'ModulusMail\\Controller\\Email-index'),
(57, 'ModulusMail\\Controller\\Email-log'),
(56, 'ModulusMail\\Controller\\Email-test'),
(61, 'ModulusProducts\\Controller\\Products-read'),
(9, 'ModulusUser\\Controller\\Perfil-change-password'),
(8, 'ModulusUser\\Controller\\Perfil-edit'),
(7, 'ModulusUser\\Controller\\Perfil-image-profile'),
(24, 'ModulusUser\\Controller\\User-create'),
(23, 'ModulusUser\\Controller\\User-read'),
(14, 'ModulusUser\\Controller\\User-update'),
(25, 'ModulusUser\\Controller\\User-view');

-- --------------------------------------------------------

--
-- Table structure for table `itens_menu`
--

DROP TABLE IF EXISTS `itens_menu`;
CREATE TABLE IF NOT EXISTS `itens_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordem` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `parent_item_menu_id` int(11) DEFAULT NULL,
  `site_content_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_itens_menus_menus1_idx` (`menu_id`),
  KEY `fk_itens_menus_itens_menus1_idx` (`parent_item_menu_id`),
  KEY `fk_itens_menus_site_content1_idx` (`site_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `description` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `user_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_log_user1_idx` (`user_id`),
  KEY `fk_log_acl_privilege1_idx` (`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`) VALUES
(1, 'Main Navigation');

-- --------------------------------------------------------

--
-- Table structure for table `message_text`
--

DROP TABLE IF EXISTS `message_text`;
CREATE TABLE IF NOT EXISTS `message_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interface_id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_text_interface_text1_idx` (`interface_id`),
  KEY `index_name_page` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=73 ;

--
-- Dumping data for table `message_text`
--

INSERT INTO `message_text` (`id`, `interface_id`, `name`, `text`) VALUES
(1, 1, 'titleHeader', 'Guardian - Rotas'),
(2, 2, 'titleHeader', 'PrivilÃ©gios'),
(3, 3, 'titleHeader', 'ConfiguraÃ§Ãµes do sistema'),
(4, 5, 'titleHeader', 'Guardian - Rotas - Nova'),
(5, 6, 'titleHeader', 'Logs do Sistema'),
(6, 6, 'ListTitle', 'Lista de Logs'),
(7, 7, 'titleHeader', 'Perfil'),
(8, 8, 'titleHeader', 'Perfil'),
(9, 9, 'titleHeader', 'Perfil'),
(10, 10, 'titleHeader', 'Logs do sistema'),
(11, 10, 'ListTitle', 'Detalhe do log'),
(12, 11, 'titleHeader', 'Galeria Multimidia'),
(13, 12, 'titleHeader', 'Guardian - Controller'),
(14, 13, 'header', 'Galeria do Item'),
(15, 14, 'titleHeader', 'UsuÃ¡rios - Editar'),
(16, 11, 'ListDescription', 'Esta Ã© a galeria multimÃ­dia do sistema, adicione os arquivos que vocÃª utilizarÃ¡ em&nbsp;&nbsp;seu site &nbsp;ou se preferir utilize os componentes do item para adicionar os arquivos.<br><br>'),
(17, 15, 'titleHeader', 'Nova PÃ¡gina'),
(18, 16, 'titleHeader', 'Editar PÃ¡gina'),
(19, 17, 'titleHeader', 'PrivilÃ©gios - Novo'),
(20, 18, 'titleHeader', 'PÃ¡ginas'),
(21, 19, 'titleHeader', 'Guardian - Controller - Novo'),
(22, 20, 'titleHeader', 'PapÃ©is'),
(23, 21, 'titleHeader', 'PapÃ©is - Novo'),
(24, 22, 'titleHeader', 'PapÃ©is - Editar'),
(25, 23, 'titleHeader', 'UsuÃ¡rios'),
(26, 24, 'titleHeader', 'UsuÃ¡rios - Novo'),
(27, 25, 'titleHeader', 'UsuÃ¡rios - Visualizar'),
(28, 26, 'titleHeader', 'Guardian - Controller - Visualizar'),
(29, 27, 'titleHeader', 'Guardian - Controller - Editar'),
(30, 28, 'titleHeader', 'Guardian - Rotas - Visualizar'),
(31, 29, 'titleHeader', 'Guardian - Rotas - Editar'),
(32, 30, 'titleHeader', 'PapÃ©is - Visualizar'),
(33, 31, 'titleHeader', 'PrivilÃ©gios - Visualizar'),
(34, 32, 'titleHeader', 'PrivilÃ©gios - Editar'),
(35, 33, 'titleHeader', 'Recursos'),
(36, 34, 'titleHeader', 'Recursos - Novo'),
(37, 35, 'titleHeader', 'Recursos - Visualizar'),
(38, 36, 'titleHeader', 'Recursos - Editar'),
(39, 37, 'titleHeader', 'E-mails do sistema'),
(40, 38, 'titleHeader', 'Tipos de conteÃºdo'),
(41, 39, 'titleHeader', 'Tipos de conteÃºdo - Novo'),
(42, 40, 'titleHeader', 'Tipos de conteÃºdo - Visualizar'),
(43, 41, 'titleHeader', 'Tipos de conteÃºdo - Editar'),
(44, 42, 'titleHeader', 'Status do conteÃºdo'),
(45, 43, 'titleHeader', 'Status do conteÃºdo - Novo'),
(46, 44, 'titleHeader', 'Status do conteÃºdo - Visualizar'),
(47, 45, 'titleHeader', 'Status do conteÃºdo - Editar'),
(48, 46, 'titleHeader', 'Visualizar PÃ¡gina'),
(49, 47, 'titleHeader', 'Postagens'),
(50, 48, 'titleHeader', 'Nova Postagem'),
(51, 13, 'ListDescription', 'Utilize este bloco para salvar as imagens que irÃ£o para a galeria do item (Se estÃ¡ funcionalidade for suportada). Para adicionar um arquivo&nbsp;basta clicar no botÃ£o "Adicionar Arquivo".<br>O arquivo adicionado irÃ¡ para o final da fila, para ordenar os itens pasta clicar e arrastar os itens.<br><b>Cuidado!</b> -&nbsp;SÃ£o suportados apenas vÃ­deos e imagens.'),
(52, 49, 'titleHeader', 'Editar Postagem'),
(53, 50, 'titleHeader', 'Visualizar Postagem'),
(54, 51, 'titleHeader', 'Menus do site'),
(55, 52, 'titleHeader', 'Novo menu'),
(56, 53, 'header', 'Metatags'),
(57, 53, 'ListDescription', 'Utilize este bloco para cadastrar metatags especificas para este conteÃºdo.<br>Caso nÃ£o seja cadastrado o sistema irÃ¡ utilizar as configuraÃ§Ãµes default do sistema.'),
(58, 54, 'titleHeader', 'Dashboard'),
(59, 55, 'endereco', 'Rua Padre Arlindo Marcon, numero: 106, Bairro Triangulo.<br>Carlos Barbosa - RS'),
(60, 56, 'titleHeader', 'Desenvolvedor - Teste de email '),
(61, 57, 'titleHeader', 'Mailgun - Logs'),
(62, 57, 'ListTitle', 'Logs'),
(63, 57, 'ListDescription', 'Abaixo estÃ£o os logs de envio de e-mail no serviÃ§o Mailgun'),
(64, 58, 'ListDescription', 'Selecione o arquivo que vocÃª irÃ¡ querer adicionar ao conteÃºdo! Muito simples e fÃ¡cil ;)'),
(65, 59, 'titleHeader', 'Editar Imagem'),
(66, 59, 'ListDescription', 'Jcrop is the quick and easy way to add image cropping functionality to your web application. It combines the ease-of-use of a typical jQuery plugin with a powerful cross-platform DHTML cropping engine that is faithful to familiar desktop graphics applications.'),
(67, 60, 'header', 'ConfiguraÃ§Ãµes do template'),
(68, 61, 'titleHeader', 'Produtos'),
(69, 62, 'header', 'PermissÃµes'),
(70, 62, 'ListDescription', 'Gerencie as permissÃµes dos usuÃ¡rios que possuem este papel (role). basta habilitar os privilÃ©gios abaixo para liberar.<br>PermissÃµes que foram herdadas de outro papel estÃ£o desabilitadas e ao lado estÃ¡ o papel que libera a permissÃ£o.<br>'),
(71, 60, 'ListDescription', 'OpÃ§Ãµes de template para a personalizaÃ§Ã£o do conteÃºdo.'),
(72, 63, 'config_description', 'Ã‰ possÃ­vel escolher o mÃ©todo de envio&nbsp;entre o SMTP ou a plataforma Mailgun. ApÃ³s selecionar o mÃ©todo de envio, preencha as configuraÃ§Ãµes correspondentes.');

-- --------------------------------------------------------

--
-- Table structure for table `metatags`
--

DROP TABLE IF EXISTS `metatags`;
CREATE TABLE IF NOT EXISTS `metatags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `robots` varchar(45) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `metatags`
--

INSERT INTO `metatags` (`id`, `entity`, `entity_id`, `title`, `description`, `robots`) VALUES
(1, 'ModulusContent\\Entity\\SiteContent', 2, 'Desenvolvimento PHP com Zend Framework 2', '', 'index, follow'),
(2, 'ModulusContent\\Entity\\SiteContent', 3, 'Desenvolvimento', '', 'index, follow'),
(3, 'ModulusContent\\Entity\\SiteContent', 1, 'Quem Somos', '', 'index, follow');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `categorys_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_categorys1_idx` (`categorys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products_category`
--

DROP TABLE IF EXISTS `products_category`;
CREATE TABLE IF NOT EXISTS `products_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `products_category`
--

INSERT INTO `products_category` (`id`, `name`, `deletedAt`) VALUES
(1, 'Cachorros', NULL),
(2, 'teste', '2014-07-16 17:35:33'),
(3, 'sdsdsdsd', '2014-08-07 13:21:45');

-- --------------------------------------------------------

--
-- Table structure for table `site_content`
--

DROP TABLE IF EXISTS `site_content`;
CREATE TABLE IF NOT EXISTS `site_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `date_published` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_url_UNIQUE` (`url`),
  KEY `fk_posts_pacman_status1_idx` (`status_id`),
  KEY `fk_posts_users1_idx` (`author_id`),
  KEY `fk_posts_type1_idx` (`type_id`),
  KEY `fk_site_content_site_content1_idx` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(3, 'Publicado'),
(1, 'Rascunho'),
(2, 'RevisÃ£o pendente');

-- --------------------------------------------------------

--
-- Table structure for table `template_config`
--

DROP TABLE IF EXISTS `template_config`;
CREATE TABLE IF NOT EXISTS `template_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `config` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `template_config`
--

INSERT INTO `template_config` (`id`, `entity`, `entity_id`, `config`, `value`) VALUES
(1, 'ModulusContent\\Entity\\SiteContent', 3, 'imageHeader', '/galeria/2014/06/desenvolvimento_53ace4e0c88d0.jpg'),
(2, 'ModulusContent\\Entity\\SiteContent', 3, 'colorHeader', '#ffffff'),
(3, 'ModulusContent\\Entity\\SiteContent', 1, 'imageHeader', '/galeria/2014/07/Captura-de-tela-de-2014-07-14-16:06:44_53c42fdda203b.png'),
(4, 'ModulusContent\\Entity\\SiteContent', 1, 'colorHeader', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `path_url` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `name`, `path_url`) VALUES
(1, 'Post', 'postagem'),
(2, 'Page', '');

-- --------------------------------------------------------

--
-- Table structure for table `type_menu`
--

DROP TABLE IF EXISTS `type_menu`;
CREATE TABLE IF NOT EXISTS `type_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_type_menu_menu1_idx` (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `type_menu`
--

INSERT INTO `type_menu` (`id`, `name`, `menu_id`) VALUES
(1, 'header', 1),
(2, 'footer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activation_key` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `date_activation_key` date DEFAULT NULL,
  `salt` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'I',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activation_key_UNIQUE` (`activation_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `activation_key`, `date_activation_key`, `salt`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin@moduluscmf.com.br', 'Admin', '$2y$14$PJ9rCfjcDAdwvn.5BFfJXu8dyemBg4j5WcUul9JDfSYH5WzuO0wxa', 'Administrador', '', '2a1522b0d18fc4c970512219cc4720d2', '2014-07-04', '12676e113b33bc15a73024c2200909a3', 'A', '2013-12-27 01:07:43', '2014-08-05 13:47:29'),
(2, 'leandrolugaresi@hotmail.com', 'leandro', '$2y$14$oKfojFEVKaAKYwesGtFFlekBX23MElwQYkg6/FVywfIm4nFawOZaO', 'Leandro', 'Lugaresi', '6e5edfeddd7f1bebe86dd7ab41293936', '2014-07-04', 'd5089d21e733117ec4122e012e05e18f', 'A', '2014-04-30 20:28:35', '2014-08-05 13:41:43'),
(7, 'leandrolugaresi92@gmail.com', 'developer', '$2y$14$zYFsk921E5zF9QarA8GM7OJmVfGyYqluLXaxqtriM0jUvlPS/8QLe', 'Desenvolvedor', '', '42f5fb4b076ddcb2887145bcd105bc5f', '2014-08-05', 'ad9ec52481edcd0b1d08044b3d89b698', 'A', '2014-08-05 13:48:45', '2014-08-05 13:52:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE IF NOT EXISTS `user_profile` (
  `users_id` int(11) NOT NULL,
  `about` text COLLATE utf8_unicode_ci,
  `nickname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`users_id`),
  KEY `fk_pacman_user_profile_pacman_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`users_id`, `about`, `nickname`, `website`, `photo`) VALUES
(1, '<div class="media">\r\n<div class="video-container">&nbsp;</div>\r\n</div>', 'sdsdsdsdd', 'asasasas', '/galeria/users/ToddBretlSharks2_539e8bf441481.jpg'),
(2, '<p>Meu nome &eacute;&nbsp;Leandro Lugaresi, sou ga&uacute;cho de Carlos Barbosa e sou graduando em An&aacute;lise e Desenvolvimento de Sistemas.<br />Programo em PHP com banco de dados MySQL. Fa&ccedil;o sites gerenci&aacute;veis, sistemas e manuten&ccedil;&otilde;es diversas, seja um projeto novo ou j&aacute; existente.</p>', 'asasasasas', 'http://www.leandrolugaresi.com.br', '/galeria/users/perfil2_53ace33a3bed8.jpg'),
(7, '<p>asasasasasas</p>', 'asasasasa', 'sasasassa', '/galeria/users/perfil2_53e11587bf189.jpg');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acl_privilege`
--
ALTER TABLE `acl_privilege`
  ADD CONSTRAINT `fk_acl_privileges_acl_resources1` FOREIGN KEY (`resource_id`) REFERENCES `acl_resource` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_acl_privileges_acl_roles` FOREIGN KEY (`role_id`) REFERENCES `acl_role` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `acl_role`
--
ALTER TABLE `acl_role`
  ADD CONSTRAINT `fk_acl_role_acl_role1` FOREIGN KEY (`parent_id`) REFERENCES `acl_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `acl_role_linker`
--
ALTER TABLE `acl_role_linker`
  ADD CONSTRAINT `fk_acl_role_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_acl_role_has_user_acl_role1` FOREIGN KEY (`role_id`) REFERENCES `acl_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `fk_file_filetype1` FOREIGN KEY (`filetype_id`) REFERENCES `filetype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gallery_itens`
--
ALTER TABLE `gallery_itens`
  ADD CONSTRAINT `fk_gallery` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_gallery_itens_file1` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `itens_menu`
--
ALTER TABLE `itens_menu`
  ADD CONSTRAINT `fk_itens_menus_itens_menus1` FOREIGN KEY (`parent_item_menu_id`) REFERENCES `itens_menu` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_itens_menus_menus1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_itens_menus_site_content1` FOREIGN KEY (`site_content_id`) REFERENCES `site_content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `fk_log_acl_privilege1` FOREIGN KEY (`privilege_id`) REFERENCES `acl_privilege` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `message_text`
--
ALTER TABLE `message_text`
  ADD CONSTRAINT `fk_message_text_interface_text1` FOREIGN KEY (`interface_id`) REFERENCES `interface` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_categorys1` FOREIGN KEY (`categorys_id`) REFERENCES `products_category` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `site_content`
--
ALTER TABLE `site_content`
  ADD CONSTRAINT `fk_site_content_site_content1` FOREIGN KEY (`parent_id`) REFERENCES `site_content` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_posts_pacman_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_posts_type1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_posts_users1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `type_menu`
--
ALTER TABLE `type_menu`
  ADD CONSTRAINT `fk_type_menu_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `fk_pacman_user_profile_pacman_users1` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
