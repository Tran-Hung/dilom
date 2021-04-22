-- -------------------------------------------------------------
-- TablePlus 3.12.5(364)
--
-- https://tableplus.com/
--
-- Database: laravel_travel
-- Generation Time: 2021-04-20 19:41:27.4460
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 0, 0, 0, 0, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 0, 0, 0, 0, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 0, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'rich_text_box', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '{}', 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 4),
(48, 6, 'body', 'rich_text_box', 'Body', 0, 0, 1, 1, 1, 1, '{}', 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 1, 1, 0, '{}', 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, '{}', 12),
(56, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 1, 1, 1, 1, '{}', 6),
(57, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(58, 7, 'location_id', 'text', 'Location Id', 1, 0, 1, 1, 1, 1, '{}', 2),
(59, 7, 'limit_user', 'text', 'Limit User', 1, 1, 1, 1, 1, 1, '{}', 6),
(60, 7, 'check_in_at', 'timestamp', 'Check In At', 1, 1, 1, 1, 1, 1, '{}', 7),
(61, 7, 'check_out_at', 'timestamp', 'Check Out At', 1, 1, 1, 1, 1, 1, '{}', 8),
(62, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 1, '{}', 9),
(63, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(64, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(65, 7, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, '{}', 5),
(67, 7, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{}', 4),
(100, 17, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(101, 17, 'user_id', 'text', 'User Id', 1, 0, 0, 0, 0, 0, '{}', 2),
(102, 17, 'travel_id', 'text', 'Travel Id', 1, 0, 0, 0, 0, 0, '{}', 3),
(103, 17, 'quality', 'text', 'Quality', 1, 1, 1, 1, 1, 1, '{}', 6),
(104, 17, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 7),
(105, 17, 'amount', 'text', 'Amount', 1, 1, 1, 1, 1, 1, '{}', 8),
(106, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(107, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(108, 17, 'order_belongsto_travel_relationship', 'relationship', 'travel', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Travel\",\"table\":\"travels\",\"type\":\"belongsTo\",\"column\":\"travel_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(109, 17, 'order_belongsto_user_relationship', 'relationship', 'user', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(110, 1, 'two_factor_secret', 'text', 'Two Factor Secret', 0, 0, 1, 1, 1, 1, '{}', 8),
(111, 1, 'two_factor_recovery_codes', 'text', 'Two Factor Recovery Codes', 0, 0, 1, 1, 1, 1, '{}', 9);

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'App\\Http\\Controllers\\Voyager\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-03-28 12:49:09', '2021-04-20 12:24:43'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-03-28 12:49:09', '2021-04-03 04:47:47'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-03-28 12:49:09', '2021-04-04 03:09:00'),
(7, 'travels', 'travels', 'Travel', 'Travel', 'voyager-list-add', 'App\\Models\\Travel', NULL, 'App\\Http\\Controllers\\Voyager\\VoyagerTravelController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-04-03 01:51:31', '2021-04-04 11:43:44'),
(17, 'orders', 'orders', 'Order', 'Orders', 'voyager-list-add', 'App\\Models\\Order', NULL, 'App\\Http\\Controllers\\Voyager\\VoyagerOrderController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-04-11 02:43:27', '2021-04-11 03:39:00');

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(2, 'browse_bread', NULL, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(3, 'browse_database', NULL, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(4, 'browse_media', NULL, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(5, 'browse_compass', NULL, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(6, 'browse_menus', 'menus', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(7, 'read_menus', 'menus', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(8, 'edit_menus', 'menus', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(9, 'add_menus', 'menus', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(10, 'delete_menus', 'menus', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(11, 'browse_roles', 'roles', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(12, 'read_roles', 'roles', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(13, 'edit_roles', 'roles', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(14, 'add_roles', 'roles', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(15, 'delete_roles', 'roles', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(16, 'browse_users', 'users', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(17, 'read_users', 'users', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(19, 'add_users', 'users', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(20, 'delete_users', 'users', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(21, 'browse_settings', 'settings', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(22, 'read_settings', 'settings', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(23, 'edit_settings', 'settings', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(24, 'add_settings', 'settings', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(25, 'delete_settings', 'settings', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(26, 'browse_categories', 'categories', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(27, 'read_categories', 'categories', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(28, 'edit_categories', 'categories', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(29, 'add_categories', 'categories', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(30, 'delete_categories', 'categories', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(31, 'browse_posts', 'posts', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(32, 'read_posts', 'posts', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(33, 'edit_posts', 'posts', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(34, 'add_posts', 'posts', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(35, 'delete_posts', 'posts', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(36, 'browse_pages', 'pages', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(37, 'read_pages', 'pages', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(38, 'edit_pages', 'pages', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(39, 'add_pages', 'pages', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(40, 'delete_pages', 'pages', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(41, 'browse_hooks', NULL, '2021-03-28 12:49:10', '2021-03-28 12:49:10'),
(42, 'browse_travels', 'travels', '2021-04-03 01:51:31', '2021-04-03 01:51:31'),
(43, 'read_travels', 'travels', '2021-04-03 01:51:31', '2021-04-03 01:51:31'),
(44, 'edit_travels', 'travels', '2021-04-03 01:51:31', '2021-04-03 01:51:31'),
(45, 'add_travels', 'travels', '2021-04-03 01:51:31', '2021-04-03 01:51:31'),
(46, 'delete_travels', 'travels', '2021-04-03 01:51:31', '2021-04-03 01:51:31'),
(52, 'browse_orders', 'orders', '2021-04-11 02:43:27', '2021-04-11 02:43:27'),
(53, 'read_orders', 'orders', '2021-04-11 02:43:27', '2021-04-11 02:43:27'),
(54, 'edit_orders', 'orders', '2021-04-11 02:43:27', '2021-04-11 02:43:27'),
(55, 'add_orders', 'orders', '2021-04-11 02:43:27', '2021-04-11 02:43:27'),
(56, 'delete_orders', 'orders', '2021-04-11 02:43:27', '2021-04-11 02:43:27');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;