-- -------------------------------------------------------------
-- TablePlus 3.12.5(364)
--
-- https://tableplus.com/
--
-- Database: laravel_travel
-- Generation Time: 2021-03-28 21:44:11.3430
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `inform_users`;
CREATE TABLE `inform_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `phone` varchar(99) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(99) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_type` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-03-28 12:49:09', '2021-03-28 12:49:09');

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
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
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
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
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6);

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'App\\Http\\Controllers\\UserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-03-28 12:49:09', '2021-03-28 14:23:49'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-03-28 12:49:09', '2021-03-28 12:49:09');

INSERT INTO `inform_users` (`id`, `user_id`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 4, '238.603.365', '880 Mitchell PlainsLake Percivalport, LA 20182', '2021-03-28 14:30:19', '2021-03-28 14:30:34'),
(2, 5, '+1-531-990-5305', '73647 Esteban Port Suite 638\nNew Wilhelmine, NH 78170-7998', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(3, 6, '797-395-1664', '733 Ally Route\nWest Tanya, OR 26021-1206', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(4, 7, '+1 (450) 214-6934', '76339 Rodrigo Mountain\nLangoshton, ME 54220', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(5, 8, '1-747-236-6575', '445 Hayes River\nPort Fabiolafort, OH 63366-6850', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(6, 9, '572-990-2057', '915 Myles Glen\nNew Ashtynborough, IA 28551-9880', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(7, 10, '+1-937-978-0931', '5800 Mann Land\nBrionnaville, IN 61195-0169', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(8, 11, '+1 (227) 539-0025', '9840 Wehner Parkway\nMaximilianmouth, MT 28772-7260', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(9, 12, '(958) 210-1708', '515 Brekke Greens\nSouth Alba, HI 05855-1743', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(10, 13, '+1 (923) 676-6933', '47645 Sipes Well Suite 606\nCarissafurt, KS 51402-4105', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(11, 14, '539-434-6374', '8941 Ethel Club Apt. 821\nJanetberg, NY 64132', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(12, 15, '585.381.2696', '14832 Collier Walk Suite 846\nEast Abagailburgh, CT 68474-9233', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(13, 16, '1-685-688-9039', '2526 Paucek Haven\nSouth Sierrahaven, MA 74919-8220', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(14, 17, '(813) 708-9919', '74845 Hyatt Turnpike\nEast Ozellaport, WI 35704', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(15, 18, '510.473.0278', '43718 Yost Vista\nPriceland, TN 73577', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(16, 19, '598-439-8222', '968 Kiera Harbors Apt. 528\nGreenfelderborough, KY 48579', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(17, 20, '+16256343587', '5218 Terry Rapids Suite 919\nCarystad, KY 12041-1983', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(18, 21, '1-901-479-0908', '84156 Maida Locks Suite 594\nMillershire, CT 74171-6076', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(19, 22, '+1.252.968.8728', '518 Jacinthe Hills Suite 919\nPort Rosinahaven, ND 88448-2235', '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(20, 23, '330-257-1964', '87509 Reinger Lodge\nSouth Carloborough, UT 58827', '2021-03-28 14:30:19', '2021-03-28 14:30:19');

INSERT INTO `locations` (`id`, `name`, `area_type`, `created_at`, `updated_at`) VALUES
(1, 'Hà Nội', 1, NULL, NULL),
(2, 'Hồ Chí Minh', 3, NULL, NULL),
(3, 'Hải Phòng', 1, NULL, NULL),
(4, 'Đà Nẵng', 2, NULL, NULL),
(5, 'Hà Giang', 1, NULL, NULL),
(6, 'Cao Bằng', 1, NULL, NULL),
(7, 'Lai Châu', 1, NULL, NULL),
(8, 'Lào Cai', 1, NULL, NULL),
(9, 'Tuyên Quang', 1, NULL, NULL),
(10, 'Lạng Sơn', 1, NULL, NULL),
(11, 'Bắc Kạn', 1, NULL, NULL),
(12, 'Thái Nguyên', 1, NULL, NULL),
(13, 'Yên Bái', 1, NULL, NULL),
(14, 'Sơn La', 1, NULL, NULL),
(15, 'Phú Thọ', 1, NULL, NULL),
(16, 'Vĩnh Phúc', 1, NULL, NULL),
(17, 'Quảng Ninh', 1, NULL, NULL),
(18, 'Bắc Giang', 1, NULL, NULL),
(19, 'Bắc Ninh', 1, NULL, NULL),
(20, 'Hải Dương', 1, NULL, NULL),
(21, 'Hưng Yên', 1, NULL, NULL),
(22, 'Hòa Bình', 1, NULL, NULL),
(23, 'TỈNH HÀ NAM', 1, NULL, NULL),
(24, 'Nam Định', 1, NULL, NULL),
(25, 'Thái Bình', 1, NULL, NULL),
(26, 'Ninh Bình', 1, NULL, NULL),
(27, 'Thanh Hóa', 2, NULL, NULL),
(28, 'Nghệ An', 2, NULL, NULL),
(29, 'Hà Tĩnh', 2, NULL, NULL),
(30, 'Quảng Bình', 2, NULL, NULL),
(31, 'Quảng Trị', 2, NULL, NULL),
(32, 'Thừa Thiên Huế', 2, NULL, NULL),
(33, 'Quảng Nam', 2, NULL, NULL),
(34, 'Quảng Ngãi', 2, NULL, NULL),
(35, 'Kon Tum', 2, NULL, NULL),
(36, 'Bình Định', 2, NULL, NULL),
(37, 'Gia Lai', 2, NULL, NULL),
(38, 'Phú Yên', 2, NULL, NULL),
(39, 'Đăk Lăk', 2, NULL, NULL),
(40, 'Khánh Hòa', 2, NULL, NULL),
(41, 'Lâm Đồng', 2, NULL, NULL),
(42, 'Bình Phước', 3, NULL, NULL),
(43, 'Bình Dương', 3, NULL, NULL),
(44, 'Ninh Thuận', 2, NULL, NULL),
(45, 'Tây Ninh', 3, NULL, NULL),
(46, 'Bình Thuận', 2, NULL, NULL),
(47, 'Đồng Nai', 3, NULL, NULL),
(48, 'Long An', 3, NULL, NULL),
(49, 'Đồng Tháp', 3, NULL, NULL),
(50, 'An Giang', 3, NULL, NULL),
(51, 'Bà Rịa Vũng Tàu', 3, NULL, NULL),
(52, 'Tiền Giang', 3, NULL, NULL),
(53, 'Kiên Giang', 3, NULL, NULL),
(54, 'Trà Vinh', 3, NULL, NULL),
(55, 'Bến Tre', 3, NULL, NULL),
(56, 'Vĩnh Long', 3, NULL, NULL),
(57, 'Sóc Trăng', 3, NULL, NULL),
(58, 'Bạc Liêu', 3, NULL, NULL),
(59, 'Cà Mau', 3, NULL, NULL),
(60, 'Điện Biên', 1, NULL, NULL),
(61, 'Đắk Nông', 2, NULL, NULL),
(62, 'Hậu Giang', 3, NULL, NULL),
(63, 'Cần Thơ', 3, NULL, NULL);

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-03-28 12:49:09', '2021-03-28 12:49:09', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-03-28 12:49:09', '2021-03-28 12:49:09', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-03-28 12:49:09', '2021-03-28 12:49:09', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-03-28 12:49:09', '2021-03-28 12:49:09', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-03-28 12:49:09', '2021-03-28 12:49:09', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-03-28 12:49:09', '2021-03-28 12:49:09', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-03-28 12:49:09', '2021-03-28 12:49:09', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-03-28 12:49:09', '2021-03-28 12:49:09', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-03-28 12:49:09', '2021-03-28 12:49:09', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-03-28 12:49:09', '2021-03-28 12:49:09', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2021-03-28 12:49:09', '2021-03-28 12:49:09', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2021-03-28 12:49:09', '2021-03-28 12:49:09', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2021-03-28 12:49:09', '2021-03-28 12:49:09', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2021-03-28 12:49:10', '2021-03-28 12:49:10', 'voyager.hooks', NULL);

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-03-28 12:49:09', '2021-03-28 12:49:09');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(29, '2021_03_28_104655_create_travel_table', 2),
(60, '2014_10_12_000000_create_users_table', 3),
(61, '2014_10_12_100000_create_password_resets_table', 3),
(62, '2016_01_01_000000_add_voyager_user_fields', 3),
(63, '2016_01_01_000000_create_data_types_table', 3),
(64, '2016_01_01_000000_create_pages_table', 3),
(65, '2016_01_01_000000_create_posts_table', 3),
(66, '2016_02_15_204651_create_categories_table', 3),
(67, '2016_05_19_173453_create_menu_table', 3),
(68, '2016_10_21_190000_create_roles_table', 3),
(69, '2016_10_21_190000_create_settings_table', 3),
(70, '2016_11_30_135954_create_permission_table', 3),
(71, '2016_11_30_141208_create_permission_role_table', 3),
(72, '2016_12_26_201236_data_types__add__server_side', 3),
(73, '2017_01_13_000000_add_route_to_menu_items_table', 3),
(74, '2017_01_14_005015_create_translations_table', 3),
(75, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 3),
(76, '2017_03_06_000000_add_controller_to_data_types_table', 3),
(77, '2017_04_11_000000_alter_post_nullable_fields_table', 3),
(78, '2017_04_21_000000_add_order_to_data_rows_table', 3),
(79, '2017_07_05_210000_add_policyname_to_data_types_table', 3),
(80, '2017_08_05_000000_add_group_to_settings_table', 3),
(81, '2017_11_26_013050_add_user_role_relationship', 3),
(82, '2017_11_26_015000_create_user_roles_table', 3),
(83, '2018_03_11_000000_add_user_settings', 3),
(84, '2018_03_14_000000_add_details_to_data_types_table', 3),
(85, '2018_03_16_000000_make_settings_value_nullable', 3),
(86, '2019_08_19_000000_create_failed_jobs_table', 3),
(87, '2021_03_27_141512_create_inform_users_table', 3),
(89, '2021_03_28_105316_create_locations_table', 4);

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-03-28 12:49:09', '2021-03-28 12:49:09');

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1);

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
(18, 'edit_users', 'users', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
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
(41, 'browse_hooks', NULL, '2021-03-28 12:49:10', '2021-03-28 12:49:10');

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-03-28 12:49:09', '2021-03-28 12:49:09');

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(2, 'user', 'Normal User', '2021-03-28 12:49:09', '2021-03-28 12:49:09');

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-03-28 12:49:09', '2021-03-28 12:49:09'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-03-28 12:49:09', '2021-03-28 12:49:09');

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tet', 'johnbuyer@gmail.com', 'users/default.png', NULL, '$2y$10$EytwK2F1fJha4XnWQhWOKuJx7SSOHQc3UyIhN96pL0HQ44AUzs2xC', 'vvA0NpnksGNLHKPCC38wc03yhTMGMqt5gxVmcTZEw6j1olyyBCHMW6areDQv', '{\"locale\":\"en\"}', '2021-03-28 12:49:09', '2021-03-28 14:25:32'),
(4, 2, 'Ms. Stacy Kiehn', 'jbeer@example.net', 'users/default.png', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Xp7UijO7GV', '{\"locale\":\"en\"}', '2021-03-28 14:30:19', '2021-03-28 14:30:27'),
(5, 2, 'Landen Kassulke', 'gusikowski.roxane@example.net', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'r82Fb7rTwL', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(6, 2, 'Prof. Brendan Mann MD', 'murphy.dubuque@example.com', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VTbtFYNMh4', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(7, 2, 'Dr. Boyd Kiehn IV', 'qrosenbaum@example.com', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KREzg7BYbT', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(8, 2, 'Darrell Douglas', 'reinger.meagan@example.org', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 't1w8eH3YUP', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(9, 2, 'Brenden Harris', 'harber.zachery@example.com', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9AJJLGx5K9', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(10, 2, 'Blanche Terry', 'spencer64@example.com', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cZQOFMNvFB', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(11, 2, 'Gardner Ratke', 'rkemmer@example.net', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'h4nY5f7cfQ', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(12, 2, 'Cindy Hyatt', 'edyth79@example.net', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jGDHzdIxR7', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(13, 2, 'Mrs. Rosalind Walker', 'brooke15@example.net', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1FlgEeVQtT', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(14, 2, 'Burnice Hodkiewicz', 'hans10@example.net', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SbhgIBuGpS', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(15, 2, 'Mr. Kory Ziemann', 'mae68@example.com', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EvJ8d2ELOy', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(16, 2, 'Stephanie Bayer', 'rledner@example.org', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KAEOpWcjOB', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(17, 2, 'Tianna Kuhlman DVM', 'heathcote.gustave@example.net', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'B8cKazAv2O', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(18, 2, 'Clifford Upton', 'rnikolaus@example.com', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gJFCXu5y4H', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(19, 2, 'Carlie Prohaska', 'gmcglynn@example.org', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jnOLQsPEKw', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(20, 2, 'Zula Luettgen', 'anissa26@example.net', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'm2tfzR0aYB', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(21, 2, 'Mrs. Lilliana Graham', 'jamar73@example.com', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FumNjbKoqO', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(22, 2, 'Prof. Kiana Bins I', 'schulist.destin@example.net', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wVzVhQkZag', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19'),
(23, 2, 'Miss Daphne Bahringer I', 'ekilback@example.com', 'users/default.png', '2021-03-28 14:30:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EyDMDoXir4', NULL, '2021-03-28 14:30:19', '2021-03-28 14:30:19');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;