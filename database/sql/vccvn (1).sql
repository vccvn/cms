-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 04, 2020 lúc 12:13 PM
-- Phiên bản máy phục vụ: 10.3.16-MariaDB
-- Phiên bản PHP: 7.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `vccvn`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `category_map` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `value_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'varchar',
  `advance_value_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `show_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'dropdown',
  `value_unit` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` int(11) DEFAULT 0,
  `is_query` int(11) DEFAULT 0,
  `is_order_option` int(11) DEFAULT 0,
  `has_price` int(11) DEFAULT 0,
  `price_type` int(11) DEFAULT 0,
  `is_unique` int(11) DEFAULT 0,
  `use_list` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `int_value` bigint(20) DEFAULT 0,
  `decimal_value` decimal(12,2) DEFAULT 0.00,
  `varchar_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advance_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dynamic_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `dynamic_id`, `parent_id`, `name`, `type`, `slug`, `keywords`, `description`, `feature_image`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 'Outsourcing', 'project', 'outsourcing', NULL, NULL, NULL, 0, '2020-03-26 18:18:52', '2020-03-26 18:39:09'),
(2, 0, 0, 'Product', 'project', 'product', NULL, NULL, NULL, 0, '2020-03-26 18:37:50', '2020-03-26 18:38:12'),
(3, 3, 0, 'Tài liệu', 'post', 'tai-lieu', NULL, NULL, NULL, 0, '2020-05-02 02:59:42', '2020-05-02 02:59:42'),
(4, 3, 0, 'Công Nghệ', 'post', 'cong-nghe', NULL, NULL, NULL, 0, '2020-05-02 03:05:40', '2020-05-02 03:05:40'),
(5, 2, 0, 'Thiết kế website', 'post', 'thiet-ke-website', NULL, NULL, NULL, 0, '2020-06-01 04:21:12', '2020-06-01 04:21:12'),
(6, 2, 0, 'Web 1-0-2', 'post', 'web-1-0-2', NULL, NULL, NULL, 0, '2020-06-01 04:24:26', '2020-06-01 04:24:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_refs`
--

CREATE TABLE `category_refs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `client_feedback`
--

CREATE TABLE `client_feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT 0,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT 0,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'post',
  `ref_id` bigint(20) UNSIGNED DEFAULT 0,
  `author_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT 0,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) DEFAULT 0,
  `approved_id` bigint(20) UNSIGNED DEFAULT 0,
  `privacy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'public',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `parent_id`, `ref`, `ref_id`, `author_name`, `author_email`, `author_phone`, `author_website`, `author_id`, `message`, `approved`, `approved_id`, `privacy`, `created_at`, `updated_at`) VALUES
(1, 0, 'post', 8, 'Lê Ngọc Doãn', 'doanln16@gmail.com', NULL, NULL, 1, 'crazy-message-content', 1, 0, 'public', '2020-05-05 07:58:37', '2020-05-05 07:58:37'),
(2, 0, 'post', 8, 'Lê Ngọc Doãn', 'doanln16@gmail.com', NULL, NULL, 1, 'crazy-message-content', 1, 0, 'public', '2020-05-05 07:59:17', '2020-05-05 07:59:17'),
(3, 1, 'post', 8, 'Lê Ngọc Doãn', 'doanln16@gmail.com', NULL, NULL, 1, '<i class=\"fa fa-reply\"></i>', 1, 0, 'public', '2020-05-05 08:17:59', '2020-05-05 08:17:59'),
(4, 3, 'post', 8, 'Lê Ngọc Doãn', 'doanln16@gmail.com', NULL, NULL, 1, '4545', 1, 0, 'public', '2020-05-05 08:38:50', '2020-05-05 08:38:50'),
(5, 4, 'post', 8, 'Lê Ngọc Doãn', 'doanln16@gmail.com', NULL, NULL, 1, '&.reply-level-5{', 1, 0, 'public', '2020-05-05 09:13:16', '2020-05-05 09:13:16'),
(6, 0, 'post', 16, 'Lê Ngọc Doãn', 'doanln16@gmail.com', NULL, NULL, 1, ',\n    \'module_class\' => \'single\'', 1, 0, 'public', '2020-06-01 08:56:43', '2020-06-01 08:56:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `components`
--

CREATE TABLE `components` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'custom',
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_id` bigint(20) UNSIGNED DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inputs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `components`
--

INSERT INTO `components` (`id`, `type`, `ref`, `ref_id`, `name`, `path`, `inputs`, `data`) VALUES
(1, 'blade', 'theme', 1, 'Banner quảng cáo (1248 x 130)', 'block-ads-wide', '{\"banner\":{\"type\":\"file\",\"label\":\"Banner\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"text\":{\"type\":\"text\",\"label\":\"Text\"},\"type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i qu\\u1ea3ng c\\u00e1o\",\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"},\"code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\",\"placeholder\":\"Nh\\u1eadp m\\u00e3 qu\\u1ea3ng c\\u00e1o\"}}', '[]'),
(2, 'blade', 'theme', 1, 'Footer Column: Giới thiệu', 'footer-column-about', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\",\"value\":\"Gi\\u1edbi thi\\u1ec7u\"},\"about_content\":{\"type\":\"textarea\",\"label\":\"N\\u1ed9i dung\",\"className\":\"auto-height\"},\"show_logo\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb logo\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"show_text_logo\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb text logo\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"text_logo_primary\":{\"type\":\"text\",\"label\":\"Text Logo (ch\\u00ednh)\",\"value\":\"Tin T\\u1ee9c\"},\"text_logo_second\":{\"type\":\"text\",\"Label\":\"Text Logo (b\\u1ed5 xung)\",\"value\":\"24\\/7\"},\"highlight\":{\"type\":\"select\",\"label\":\"l\\u00e0m n\\u1ed5i b\\u1eadt\",\"data\":{\"none\":\"Kh\\u00f4ng\",\"primary\":\"Text ch\\u00ednh\",\"second\":\"Text ph\\u1ee5\",\"both\":\"T\\u1ea5t c\\u1ea3\"},\"default\":\"second\"},\"text_logo_slogan\":{\"type\":\"text\",\"Label\":\"Kh\\u1ea9u hi\\u1ec7u\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"}}', '[]'),
(3, 'blade', 'theme', 1, 'Footer Column: tin bài', 'footer-column-posts', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 \"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":4}}', '[]'),
(4, 'blade', 'theme', 1, 'Footer Column: Thẻ bài viết (tags)', 'footer-column-tags', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 \"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_tag_sortby_options\"},\"tag_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":4}}', '[]'),
(5, 'blade', 'theme', 1, 'Home: Lưới với tin đầu làm nổi bật', 'grid-first-large-thumbail', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1\",\"call\":\"get_number_options\",\"params\":[1,12]},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"content_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i n\\u1ed9i dung\",\"call\":\"get_content_type_options\",\"params\":[\"T\\u1ea5t c\\u1ea3\"]},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":4}}', '[]'),
(6, 'blade', 'theme', 1, 'Home: Banner quảng cáo (820 x 130)', 'home-ads-wide', '{\"banner\":{\"type\":\"file\",\"label\":\"Banner\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"text\":{\"type\":\"text\",\"label\":\"Text\"},\"type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i qu\\u1ea3ng c\\u00e1o\",\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"},\"code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\",\"placeholder\":\"Nh\\u1eadp m\\u00e3 qu\\u1ea3ng c\\u00e1o\"}}', '[]'),
(7, 'blade', 'theme', 1, 'Home: Banner quảng cáo (1240 x 130)', 'home-bottom-ads', '{\"banner\":{\"type\":\"file\",\"label\":\"Banner\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"text\":{\"type\":\"text\",\"label\":\"Text\"},\"type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i qu\\u1ea3ng c\\u00e1o\",\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"},\"code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\",\"placeholder\":\"Nh\\u1eadp m\\u00e3 qu\\u1ea3ng c\\u00e1o\"}}', '[]'),
(8, 'blade', 'theme', 1, 'Breaking news & Slider', 'home-breaking-and-slider', '{\"slider_sort_type\":{\"type\":\"crazyselect\",\"label\":\"Ki\\u1ec3u s\\u1eafp x\\u1ebfp tin trong ph\\u1ea7n slider news\",\"call\":\"get_post_sortby_options\",\"default\":1},\"slider_number_post\":{\"type\":\"crazyswlect\",\"label\":\"S\\u1ed1 l\\u01b0\\u1ee3ng tin trong ph\\u1ea7n slider news\",\"data\":{\"4\":\"4 Tin (1 slider)\",\"8\":\"8 Tin (2 slider)\",\"12\":\"12 Tin (3 slider)\",\"16\":\"16 Tin (4 slider)\",\"20\":\"20 Tin (5 slider)\"},\"default\":16}}', '[]'),
(9, 'blade', 'theme', 1, 'Home: Tin bài dạng slider (Carousel)', 'home-carouse', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"content_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i n\\u1ed9i dung\",\"call\":\"get_content_type_options\",\"params\":[\"T\\u1ea5t c\\u1ea3\"]},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}}', '[]'),
(10, 'blade', 'theme', 1, 'Home: Danh sách dạng lưới', 'home-grid-list', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1\",\"call\":\"get_number_options\",\"params\":[1,12]},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"group_by_category\":{\"type\":\"switch\",\"label\":\"Nh\\u00f3m theo danh m\\u1ee5c\",\"value_type\":\"boolean\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":4}}', '[]'),
(11, 'blade', 'theme', 1, 'Home: Lưới & sidebar (style 2)', 'home-grid-sidebar-style-2', '{\"first_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 1 (T\\u00f9y ch\\u1ecdn)\"},\"first_sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"first_bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 1\",\"call\":\"get_number_options\",\"params\":[1,12]},\"first_dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"K\\u00eanh \\u0111\\u0103ng b\\u00e0i c\\u1ee7a m\\u1ee5c 1 (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"data-ref\":\"first_category_id\",\"required\":\"true\"},\"first_category_id\":{\"type\":\"crazyselect\",\"label\":\"Ch\\u1ee7 \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 1\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#first_dynamic_id\"},true],\"@label-type\":\"value\"},\"first_sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp c\\u1ee7a m\\u1ee5c 1 \",\"call\":\"get_post_sortby_options\"},\"second_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 2 (T\\u00f9y ch\\u1ecdn)\"},\"second_sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"second_bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 2\",\"call\":\"get_number_options\",\"params\":[1,12]},\"second_dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"K\\u00eanh \\u0111\\u0103ng b\\u00e0i c\\u1ee7a m\\u1ee5c 2 (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"data-ref\":\"second_category_id\",\"required\":\"true\"},\"second_category_id\":{\"type\":\"crazyselect\",\"label\":\"Ch\\u1ee7 \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 2\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#second_dynamic_id\"},true],\"@label-type\":\"value\"},\"second_sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp c\\u1ee7a m\\u1ee5c 2 \",\"call\":\"get_post_sortby_options\"}}', '[]'),
(12, 'blade', 'theme', 1, 'Home: Lưới 2 mục & sidebar', 'home-grid-sidebar', '{\"first_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 1 (T\\u00f9y ch\\u1ecdn)\"},\"first_sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"first_bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 1\",\"call\":\"get_number_options\",\"params\":[1,12]},\"first_dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"K\\u00eanh \\u0111\\u0103ng b\\u00e0i c\\u1ee7a m\\u1ee5c 1 (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"data-ref\":\"first_category_id\",\"required\":\"true\"},\"first_category_id\":{\"type\":\"crazyselect\",\"label\":\"Ch\\u1ee7 \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 1\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#first_dynamic_id\"},true],\"@label-type\":\"value\"},\"first_sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp c\\u1ee7a m\\u1ee5c 1 \",\"call\":\"get_post_sortby_options\"},\"second_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 2 (T\\u00f9y ch\\u1ecdn)\"},\"second_sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"second_bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 2\",\"call\":\"get_number_options\",\"params\":[1,12]},\"second_dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"K\\u00eanh \\u0111\\u0103ng b\\u00e0i c\\u1ee7a m\\u1ee5c 2 (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"data-ref\":\"second_category_id\",\"required\":\"true\"},\"second_category_id\":{\"type\":\"crazyselect\",\"label\":\"Ch\\u1ee7 \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 2\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#second_dynamic_id\"},true],\"@label-type\":\"value\"},\"second_sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp c\\u1ee7a m\\u1ee5c 2 \",\"call\":\"get_post_sortby_options\"},\"sidebar_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a sidebar (T\\u00f9y ch\\u1ecdn)\"},\"sidebar_link\":{\"type\":\"text\",\"label\":\"Url (T\\u00f9y ch\\u1ecdn)\"},\"sidebar_bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a sidebar\",\"call\":\"get_number_options\",\"params\":[1,12]},\"sidebar_dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"K\\u00eanh \\u0111\\u0103ng b\\u00e0i c\\u1ee7a sidebar (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"data-ref\":\"sidebar_category_id\",\"required\":\"true\"},\"sidebar_category_id\":{\"type\":\"crazyselect\",\"label\":\"Ch\\u1ee7 \\u0111\\u1ec1 c\\u1ee7a sidebar\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#sidebar_dynamic_id\"},true],\"@label-type\":\"value\"},\"sidebar_sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp c\\u1ee7a sidebar \",\"call\":\"get_post_sortby_options\"},\"sidebar_post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}}', '[]'),
(13, 'blade', 'theme', 1, 'Home: Intro (Giới thiệu)', 'home-intro', '{\"image\":{\"type\":\"file\",\"label\":\"\\u1ea2nh\"},\"text\":{\"type\":\"textarea\",\"label\":\"Text\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"button_text\":{\"type\":\"text\",\"label\":\"Button Text\"}}', '{\"button_text\":\"Xem th\\u00eam\"}'),
(14, 'blade', 'theme', 1, 'Home: Danh sách & sidebar style 2', 'home-list-sidebar-2', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1\",\"call\":\"get_number_options\",\"params\":[1,12]},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"group_by_category\":{\"type\":\"switch\",\"label\":\"Nh\\u00f3m theo danh m\\u1ee5c\",\"value_type\":\"boolean\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":5},\"sidebar_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 sidebar (T\\u00f9y ch\\u1ecdn)\"},\"sidebar_dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c \\u1edf sidebar (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"data-ref\":\"sidebar_category_id\",\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"sidebar_category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c \\u1edf sidebar\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#sidebar_dynamic_id\"},true],\"@label-type\":\"value\"},\"sidebar_sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp \\u1edf sidebar\",\"call\":\"get_post_sortby_options\"},\"sidebar_post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i \\u1edf sidebar\",\"min\":1,\"step\":1,\"default\":10},\"show_news_video\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb video m\\u1edbi nh\\u1ea5t\"}}', '{\"sidebar_title\":\"Tin m\\u1edbi nh\\u1ea5t\"}'),
(15, 'blade', 'theme', 1, 'Home: Danh sách & sidebar', 'home-list-sidebar', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1\",\"call\":\"get_number_options\",\"params\":[1,12,\"default\",\"default\"]},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"group_by_category\":{\"type\":\"switch\",\"label\":\"Nh\\u00f3m theo danh m\\u1ee5c\",\"value_type\":\"boolean\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":5},\"sidebar_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 sidebar (T\\u00f9y ch\\u1ecdn)\"},\"sidebar_post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i \\u1edf sidebar\",\"min\":1,\"step\":1,\"default\":10},\"sidebar_banner\":{\"type\":\"file\",\"label\":\"Sidebar Banner\"},\"sidebar_link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"ads_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i qu\\u1ea3ng c\\u00e1o\",\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"},\"ads_code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\",\"placeholder\":\"Nh\\u1eadp m\\u00e3 qu\\u1ea3ng c\\u00e1o\"}}', '{\"sidebar_title\":\"Tin m\\u1edbi nh\\u1ea5t\"}'),
(16, 'blade', 'theme', 1, 'Home: Danh sách & Menu danh mục', 'home-list-with-children-category', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1\",\"call\":\"get_number_options\",\"params\":[1,12]},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"children_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 danh m\\u1ee5c con\",\"min\":1,\"step\":1,\"default\":15},\"group_by_category\":{\"type\":\"switch\",\"label\":\"Nh\\u00f3m theo danh m\\u1ee5c\",\"value_type\":\"boolean\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":5},\"menu_type\":{\"type\":\"crazyselect\",\"label\":\"Ki\\u1ec3u menu\",\"data\":{\"children\":\"Danh m\\u1ee5c con\",\"menu\":\"Menu\"},\"default\":\"children\"},\"menu_id\":{\"type\":\"crazyselect\",\"label\":\"Menu\",\"call\":\"get_menu_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"]},\"sidebar_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 sidebar (T\\u00f9y ch\\u1ecdn)\"},\"sidebar_post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i \\u1edf sidebar\",\"min\":1,\"step\":1,\"default\":10}}', '{\"sidebar_title\":\"Tin m\\u1edbi nh\\u1ea5t\"}'),
(17, 'blade', 'theme', 1, 'Home: Giói thiệu (Hình nền và text)', 'home-parallax', '{\"background\":{\"type\":\"file\",\"label\":\"\\u1ea2nh\"},\"medium_caption\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 tr\\u00ean (T\\u00f9y ch\\u1ecdn)\"},\"large_caption\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ch\\u00ednh\"},\"second_caption\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3 ng\\u1eafn\"}}', '[]'),
(18, 'blade', 'theme', 1, 'Home: Tin bài dạng slider (Carousel Gallery)', 'home-post-gallery', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft trong ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"text\":{\"type\":\"text\",\"label\":\"Text c\\u1ee7a li\\u00ean k\\u1ebft trong ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"mark_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 b\\u00f4i m\\u00e0u (T\\u00f9y ch\\u1ecdn)\"},\"gallery_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 gallery (T\\u00f9y ch\\u1ecdn)\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"content_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i n\\u1ed9i dung\",\"call\":\"get_content_type_options\",\"params\":[\"T\\u1ea5t c\\u1ea3\"]},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}}', '[]'),
(19, 'blade', 'theme', 1, 'Home: Quote - trính dẫn', 'home-quote', '{\"label\":{\"type\":\"text\",\"label\":\"Nh\\u00e3n (T\\u00f9y ch\\u1ecdn)\"},\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\"},\"description\":{\"type\":\"text\",\"label\":\"M\\u00f4 t\\u1ea3 ()\"},\"image\":{\"type\":\"file\",\"label\":\"\\u1ea2nh\"},\"button_text\":{\"type\":\"text\",\"label\":\"Button Text\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"}}', '{\"button_text\":\"Xem th\\u00eam\"}'),
(20, 'blade', 'theme', 1, 'Home: Video', 'home-videos', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 sidebar\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":3}}', '[]'),
(21, 'blade', 'theme', 1, 'Home: Parallax', 'parallax', '{\"sub_title_before\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 nh\\u1ecf (t\\u00f9y ch\\u1ecdn)\"},\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ch\\u00ednh\"},\"sub_title_after\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (t\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3\"},\"background\":{\"type\":\"file\",\"label\":\"H\\u00ecnh n\\u1ec1n (T\\u00f9y ch\\u1ecdn)\"}}', '[]'),
(22, 'blade', 'theme', 1, 'Tin bài dạng slider (Carousel)', 'posts-carousel', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"content_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i n\\u1ed9i dung\",\"call\":\"get_content_type_options\",\"params\":[\"T\\u1ea5t c\\u1ea3\"]},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}}', '[]'),
(23, 'blade', 'theme', 1, 'Sidebar: Banner quảng cáo (400 x __)', 'sidebar-ads', '{\"banner\":{\"type\":\"file\",\"label\":\"Banner\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"text\":{\"type\":\"text\",\"label\":\"Text\"},\"type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i qu\\u1ea3ng c\\u00e1o\",\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"},\"code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\",\"placeholder\":\"Nh\\u1eadp m\\u00e3 qu\\u1ea3ng c\\u00e1o\"}}', '[]'),
(24, 'blade', 'theme', 1, 'Sidebar: Lịch', 'sidebar-calendar', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"lang\":{\"type\":\"radio\",\"label\":\"Ng\\u00f4n ng\\u1eef\",\"data\":{\"vi\":\"Ti\\u1ebfng Vi\\u1ec7t\",\"en\":\"Ti\\u1ebfng Anh\"},\"default\":\"vi\"}}', '[]'),
(25, 'blade', 'theme', 1, 'Sidebar: Đăng ký nhận tin', 'sidebar-newsletter', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"V\\u00ed d\\u1ee5: \\u0110\\u0103ng k\\u00fd theo d\\u00f5i\"},\"placeholder\":{\"type\":\"text\",\"label\":\"Placeholder (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"V\\u00ed d\\u1ee5: Nh\\u1eadp email c\\u1ee7a b\\u1ea1n\"},\"button\":{\"type\":\"text\",\"label\":\"N\\u00fat \\u0111\\u0103ng k\\u00fd\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"}}', '{\"title\":\"D\\u0103ng k\\u00fd nh\\u1eadn tin\",\"placeholder\":\"V\\u00ed d\\u1ee5: Nh\\u1eadp email c\\u1ee7a b\\u1ea1n\",\"button\":\"N\\u00fat \\u0111\\u0103ng k\\u00fd\"}'),
(26, 'blade', 'theme', 1, 'Sidebar: Danh sách tin bài (style 1)', 'sidebar-post-list-1', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\",\"default\":\"Tin m\\u1edbi nh\\u1ea5t\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"content_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i n\\u1ed9i dung\",\"call\":\"get_content_type_options\",\"params\":[\"T\\u1ea5t c\\u1ea3\"]},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}}', '[]'),
(27, 'blade', 'theme', 1, 'Sidebar: Liên kết mạng xã hội', 'sidebar-socials', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"V\\u00ed d\\u1ee5 k\\u1ebft n\\u1ed1i v\\u1edbi ch\\u00fang t\\u00f4i\"},\"facebook\":{\"type\":\"text\",\"label\":\"facebook (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"},\"twitter\":{\"type\":\"text\",\"label\":\"twitter (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"},\"youtube\":{\"type\":\"text\",\"label\":\"youtube (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"},\"linkedin\":{\"type\":\"text\",\"label\":\"Linkedin (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"},\"instagram\":{\"type\":\"text\",\"label\":\"instagram (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"},\"pinterest\":{\"type\":\"text\",\"label\":\"Pinterest (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"}}', '{\"title\":\"K\\u1ebft n\\u1ed1i v\\u1edbi ch\\u00fang t\\u00f4i\"}'),
(28, 'blade', 'theme', 1, 'Sidebar: Thông tin thời tiết', 'sidebar-weather', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"scale\":{\"type\":\"crazyselect\",\"label\":\"Thang nhi\\u1ec7u \\u0111\\u1ed9\",\"template\":\"crazyselect\",\"data\":{\"C\":\"\\u0110\\u1ed9 C\",\"F\":\"\\u0110\\u1ed9 F\"},\"required\":\"true\"},\"lat\":{\"type\":\"text\",\"label\":\"V\\u0129 \\u0111\\u1ed9 (latitude)\"},\"long\":{\"type\":\"text\",\"label\":\"V\\u0129 \\u0111\\u1ed9 (longitude)\"}}', '[]'),
(29, 'blade', 'theme', 1, 'Chi tiết tin: Tin lên quan', 'single-related-posts', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"select\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"data\":{\"3\":3,\"6\":6,\"9\":0,\"12\":12},\"default\":3}}', '[]'),
(30, 'blade', 'theme', 2, 'Gói dịch vụ (Package Item)', 'package-item', '{\"name\":{\"type\":\"text\",\"label\":\"T\\u00ean g\\u00f3i\",\"placeholder\":\"V\\u00ed d\\u1ee5: Tin t\\u1ee9c\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3 ng\\u1eafn\",\"placeholder\":\"V\\u00ed d\\u1ee5: 1 n\\u0103m b\\u1ea3o h\\u00e0nh\\nMi\\u1ec3n ph\\u00ed hosting\\nNi\\u1ec5n ph\\u00ed t\\u00ean mi\\u1ec1n\\n...\"},\"price_text\":{\"type\":\"text\",\"label\":\"Gi\\u00e1\",\"value\":\"0\"},\"active\":{\"type\":\"switch\",\"label\":\"N\\u1ed5i b\\u1eadt\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"btn_text\":{\"type\":\"text\",\"label\":\"N\\u00fat xem th\\u00eam\",\"value\":\"\\u0110\\u0103ng k\\u00fd\"},\"class_name\":{\"type\":\"text\",\"label\":\"Class Name\",\"value\":\"col-md-6\"}}', '[]'),
(31, 'blade', 'theme', 2, 'Promo Item', 'promo-item', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\"},\"description\":{\"type\":\"text\",\"label\":\"M\\u00f4 t\\u1ea3 ng\\u1eafn\"},\"icon\":{\"type\":\"text\",\"label\":\"Icon ClassName\",\"placeholder\":\"V\\u00ed d\\u1ee5: ti-vector\"}}', '[]'),
(32, 'blade', 'theme', 2, 'Dịch vụ (service item)', 'service-item', '{\"name\":{\"type\":\"text\",\"label\":\"T\\u00ean d\\u1ecbch v\\u1ee5\",\"placeholder\":\"V\\u00ed d\\u1ee5: thi\\u1ebft k\\u1ebf website\"},\"description\":{\"type\":\"text\",\"label\":\"M\\u00f4 t\\u1ea3 ng\\u1eafn\",\"value\":\"\",\"placeholder\":\"\"},\"use_label\":{\"type\":\"switch\",\"label\":\"Th\\u00eam nh\\u00e3n\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\"},\"label_text\":{\"type\":\"text\",\"label\":\"Nh\\u00e3n\",\"value\":\"\",\"placeholder\":\"V\\u00ed d\\u1ee5 Good\"},\"label_class\":{\"type\":\"crazyselect\",\"label\":\"Lo\\u1ea1i nh\\u00e3n\",\"value\":\"success\",\"data\":{\"success\":\"Success (Xanh l\\u00e1)\",\"danger\":\"Danger (\\u0110\\u1ecf)\"}},\"icon\":{\"type\":\"text\",\"label\":\"Icon ClassName\",\"placeholder\":\"V\\u00ed d\\u1ee5: fa fa-bolt\",\"value\":\"fa fa-bolt\"}}', '[]'),
(33, 'blade', 'theme', 2, 'Thành viên trong nhóm (team member)', 'team-member', '{\"name\":{\"type\":\"text\",\"label\":\"T\\u00ean th\\u00e0nh vi\\u00ean\",\"placeholder\":\"V\\u00ed d\\u1ee5: Thi\\u1ec7n CH\"},\"avatar\":{\"type\":\"file\",\"label\":\"Avatar\"},\"job\":{\"type\":\"text\",\"label\":\"c\\u00f4ng vi\\u1ec7c (V\\u1ecb tr\\u00ed l\\u00e0m vi\\u1ec7c)\"},\"is_loader\":{\"type\":\"switch\",\"label\":\"Tr\\u01b0\\u1edfng nh\\u00f3m?\",\"value_type\":\"boolean\"}}', '[]'),
(34, 'blade', 'theme', 2, 'Thông tin phản hồi (Testimonial item)', 'testimonial-item', '{\"name\":{\"type\":\"text\",\"label\":\"t\\u00ean ng\\u01b0\\u1eddi ph\\u1ea3n h\\u1ed3i\",\"placeholder\":\"V\\u00ed d\\u1ee5: Nguy\\u1ec5n V\\u0103n A\"},\"image\":{\"type\":\"file\",\"label\":\"\\u00c3nh \\u0111\\u1ea1i di\\u1ec7n\"},\"job\":{\"type\":\"text\",\"label\":\"C\\u00f4ng vi\\u1ec7c\",\"placeholder\":\"V\\u00ed d\\u1ee5: CEO\"},\"content\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3 ng\\u1eafn\",\"placeholder\":\"V\\u00ed d\\u1ee5: Very grateful to have found this app. D&L team did a fantastic job...\"}}', '[]'),
(35, 'blade', 'theme', 3, 'Footer: Giới thiệu', 'footer.about', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"Gi\\u1edbi thi\\u1ec7u\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"}}', '[]'),
(36, 'blade', 'theme', 3, 'Footer: Liên hệ', 'footer.contact', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"email\":{\"type\":\"text\",\"Label\":\"Email\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb m\\u1ee5c li\\u00ean h\\u1ec7\"},\"phone_number\":{\"type\":\"text\",\"Label\":\"S\\u1ed1 \\u0111i\\u1ec7n tho\\u1ea1i\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb m\\u1ee5c li\\u00ean h\\u1ec7\"},\"address\":{\"type\":\"text\",\"Label\":\"\\u0110\\u1ecba ch\\u1ec9\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb m\\u1ee5c li\\u00ean h\\u1ec7\"}}', '[]'),
(37, 'blade', 'theme', 3, 'Footer: Liên kết / menu', 'footer.limks', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"menu_id\":{\"type\":\"crazyselect\",\"label\":\"Menu\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"call\":\"get_menu_options\"}}', '[]'),
(38, 'blade', 'theme', 3, 'Footer: Danh sách bài viết', 'footer.possts', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":4}}', '[]'),
(39, 'blade', 'theme', 3, 'Home: banner > Style 1', 'home.banners.style-1', '{\"slider_id\":{\"type\":\"crazyselect\",\"label\":\"Slider\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"call\":\"get_slider_options\"},\"btn_text\":{\"type\":\"text\",\"label\":\"N\\u00fat b\\u1ea5m\",\"placeholder\":\"Ch\\u1eef s\\u1ebd \\u0111\\u01b0\\u1ee3c hi\\u1ec3n th\\u1ecb tr\\u00ean n\\u00fat xem th\\u00eam\"}}', '[]'),
(40, 'blade', 'theme', 3, 'Home: Giới thiệu', 'home.about.style-1', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"content\":{\"type\":\"textarea\",\"label\":\"Gi\\u1edbi thi\\u1ec7u\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"image\":{\"type\":\"file\",\"label\":\"\\u1ea2nh minh h\\u1ecda\"},\"youtube_url\":{\"type\":\"text\",\"label\":\"Video Youtube\"},\"services\":{\"type\":\"textarea\",\"label\":\"D\\u1ecbch v\\u1ee5 n\\u1edfi b\\u1eadt\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\\nM\\u1ed5i d\\u1ecbch v\\u1ee5 m\\u1ed9t d\\u00f2ng\",\"className\":\"auto-height\"}}', '[]'),
(41, 'blade', 'theme', 3, 'Home: Các dịch vụ (Service Area)', 'home.services.area', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"}}', '[]'),
(42, 'blade', 'theme', 3, 'Home: Dịch vụ (Service Item)', 'home.services.item', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 \"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"link\":{\"type\":\"text\",\"label\":\"\\u0110\\u01b0\\u1eddng d\\u1eabn\"},\"icon\":{\"type\":\"text\",\"label\":\"Bi\\u1ec3u t\\u01b0\\u1ee3ng (ti-...)\",\"template\":\"iconpicker\"}}', '[]'),
(43, 'blade', 'theme', 3, 'Home: Facts', 'home.facts', '{\"fact_1\":{\"type\":\"textarea\",\"label\":\"Fact 1\",\"placeholder\":\"Ti\\u00eau \\u0111\\u1ec1 (ho\\u1eb7c s\\u1ed1)...\\nTi\\u00eau \\u0111\\u1ec1 ph\\u1ee5..\\nN\\u1ed9i dung... \",\"className\":\"auto-height\"},\"fact_2\":{\"type\":\"textarea\",\"label\":\"Fact 2\",\"placeholder\":\"Ti\\u00eau \\u0111\\u1ec1 (ho\\u1eb7c s\\u1ed1)...\\nTi\\u00eau \\u0111\\u1ec1 ph\\u1ee5..\\nN\\u1ed9i dung... \",\"className\":\"auto-height\"},\"line_1\":{\"type\":\"text\",\"label\":\"Ti\\u1ebfn tr\\u00ecnh 1\",\"placeholder\":\"Ti\\u00eau \\u0111\\u1ec1 = s\\u1ed1 (%)\"},\"line_2\":{\"type\":\"text\",\"label\":\"Ti\\u1ebfn tr\\u00ecnh 2\",\"placeholder\":\"Ti\\u00eau \\u0111\\u1ec1 = s\\u1ed1 (%)\"},\"line_3\":{\"type\":\"text\",\"label\":\"Ti\\u1ebfn tr\\u00ecnh 3\",\"placeholder\":\"Ti\\u00eau \\u0111\\u1ec1 = s\\u1ed1 (%)\"}}', '[]'),
(44, 'blade', 'theme', 3, 'Home: Portfolio', 'home.portfolio', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\",\"value\":\"D\\u1ef1 \\u00e1n\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"sorttype\":{\"type\":\"crazyselect\",\"label\":\"Ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_project_sortby_options\",\"value\":1},\"project_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 l\\u01b0\\u1ee3ng\",\"value\":10}}', '[]'),
(45, 'blade', 'theme', 3, 'Home: Testimonials (area)', 'home.testimonials.area', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"list_type\":{\"type\":\"radio\",\"label\":\"Ki\\u1ec3u danh s\\u00e1ch\",\"data\":{\"data\":\"Trong b\\u1ea3ng ph\\u1ea3n h\\u1ed3i\",\"custom\":\"Danh s\\u00e1ch t\\u00f9y bi\\u1ebfn\"},\"value\":\"custom\"},\"item_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 l\\u01b0\\u1ee3ng\",\"value\":5},\"sort_type\":{\"type\":\"crazyselect\",\"label\":\"S\\u1eafp x\\u1ebfp\",\"data\":{\"id-ASC\":\"M\\u1eb7c \\u0111\\u1ecbnh\",\"id-DESC\":\"M\\u1edbi nh\\u1ea5t\",\"name-ASC\":\"h\\u1ee9 t\\u1ef1 b\\u1ea3ng ch\\u1ef1 c\\u00e1i\"},\"value\":\"id-ASC\"}}', '[]'),
(46, 'blade', 'theme', 3, 'Home: Testimonials Item', 'home.testimonials.item', '{\"name\":{\"type\":\"text\",\"label\":\"t\\u00ean ng\\u01b0\\u1eddi ph\\u1ea3n h\\u1ed3i\",\"placeholder\":\"V\\u00ed d\\u1ee5: Nguy\\u1ec5n V\\u0103n A\"},\"image\":{\"type\":\"file\",\"label\":\"\\u00c3nh \\u0111\\u1ea1i di\\u1ec7n\"},\"job\":{\"type\":\"text\",\"label\":\"C\\u00f4ng vi\\u1ec7c\",\"placeholder\":\"V\\u00ed d\\u1ee5: CEO\"},\"content\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3 ng\\u1eafn\",\"placeholder\":\"V\\u00ed d\\u1ee5: Very grateful to have found this app. D&L team did a fantastic job...\"}}', '[]'),
(47, 'blade', 'theme', 3, 'Home: Team (area)', 'home.team.area', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"background\":{\"type\":\"file\",\"label\":\"H\\u00ecnh n\\u1ec1n (T\\u00f9y ch\\u1ecdn)\"},\"list_type\":{\"type\":\"radio\",\"label\":\"Ki\\u1ec3u danh s\\u00e1ch\",\"data\":{\"data\":\"Trong b\\u1ea3ng Nh\\u00f3m\",\"custom\":\"Danh s\\u00e1ch t\\u00f9y bi\\u1ebfn\"},\"value\":\"custom\"},\"team_id\":{\"type\":\"crazyselect\",\"label\":\"Nh\\u00f3m\",\"call\":\"get_team_options\",\"params\":[[],\"Ch\\u1ecdn nh\\u00f3m\"]},\"item_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 l\\u01b0\\u1ee3ng\",\"value\":4},\"sort_type\":{\"type\":\"crazyselect\",\"label\":\"S\\u1eafp x\\u1ebfp\",\"data\":{\"id-ASC\":\"M\\u1eb7c \\u0111\\u1ecbnh\",\"id-DESC\":\"M\\u1edbi nh\\u1ea5t\",\"users.name-ASC\":\"th\\u1ee9 t\\u1ef1 b\\u1ea3ng ch\\u1ef1 c\\u00e1i\",\"is_leader-DESC\":\"\\u01afu ti\\u00ean tr\\u01b0\\u1edfng nh\\u00f3m\",\"job-ASC\":\"C\\u00f4ng vi\\u1ec7c (A-z)\",\"rand()\":\"Ng\\u1eabu nhi\\u00ean\"},\"value\":\"id-ASC\"}}', '[]'),
(48, 'blade', 'theme', 3, 'Home: Team Member', 'home.team.item', '{\"name\":{\"type\":\"text\",\"label\":\"T\\u00ean th\\u00e0nh vi\\u00ean\",\"placeholder\":\"V\\u00ed d\\u1ee5: Thi\\u1ec7n CH\"},\"avatar\":{\"type\":\"file\",\"label\":\"Avatar\"},\"job\":{\"type\":\"text\",\"label\":\"c\\u00f4ng vi\\u1ec7c (V\\u1ecb tr\\u00ed l\\u00e0m vi\\u1ec7c)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft (T\\u00f9y ch\\u1ecdn)\"},\"is_loader\":{\"type\":\"switch\",\"label\":\"Tr\\u01b0\\u1edfng nh\\u00f3m?\",\"value_type\":\"boolean\"}}', '[]'),
(49, 'blade', 'theme', 3, 'Home: Mục liên hệ', 'home.contact.area', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"faq_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 FAQ (T\\u00f9y ch\\u1ecdn)\"}}', '[]'),
(50, 'blade', 'theme', 3, 'Home: Mục liên hệ - FAQ', 'home.contact.faq', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 \"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"}}', '[]'),
(51, 'blade', 'theme', 3, 'Home: Danh sách bài viết', 'home.posts', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3 (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"background\":{\"type\":\"file\",\"label\":\"H\\u00ecnh n\\u1ec1n (T\\u00f9y ch\\u1ecdn)\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"group_by_category\":{\"type\":\"switch\",\"label\":\"Nh\\u00f3m theo danh m\\u1ee5c\",\"value_type\":\"boolean\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":3}}', '[]'),
(52, 'blade', 'theme', 3, 'Home: Báo giá (area)', 'home.pricing.area', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"}}', '[]'),
(53, 'blade', 'theme', 3, 'Home: Báo giá (item)', 'home.pricing.item', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\",\"placeholder\":\"V\\u00ed d\\u1ee5: Th\\u01b0\\u01a1ng m\\u1ea1i \\u0111i\\u1ec7n t\\u1eed\"},\"label\":{\"type\":\"text\",\"label\":\"Nh\\u00e3n (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"V\\u00ed d\\u1ee5: HOT\"},\"price_label\":{\"type\":\"text\",\"label\":\"Nh\\u00e3n gi\\u00e1 (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"V\\u00ed d\\u1ee5: Ch\\u1ec9 t\\u1eeb\",\"default\":\"Ch\\u1ec9 t\\u1eeb\"},\"price\":{\"type\":\"number\",\"label\":\"Gi\\u00e1\",\"default\":0,\"min\":0},\"unit\":{\"type\":\"text\",\"label\":\"\\u0110\\u01a1n v\\u1ecb ti\\u1ec1n\",\"placeholder\":\"V\\u00ed d\\u1ee5: VN\\u0110, $, ...\",\"default\":\"VN\\u0110\"},\"content\":{\"type\":\"textarea\",\"label\":\"N\\u1ed9i dung (danh s\\u00e1ch t\\u00ednh n\\u0103ng)\",\"placeholder\":\"V\\u00ed d\\u1ee5: [true] Mi\\u1ec3n ph\\u00ed hosting\\n[false] Gi\\u1edbi h\\u1ea1n t\\u00ean mi\\u1ec1n\",\"className\":\"auto-height\"},\"active\":{\"type\":\"switch\",\"label\":\"Active (k\\u00edch ho\\u1ea1t)\",\"value_type\":\"boolean\"},\"link\":{\"type\":\"text\",\"label\":\"Link \\u0111\\u0103ng k\\u00fd\",\"placeholder\":\"Nh\\u1eadp link\"}}', '[]'),
(54, 'blade', 'theme', 3, 'Sidebar: Danh mục', 'sidebar.categories', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"get_by_dynamic_active\":{\"type\":\"switch\",\"label\":\"\\u01afu ti\\u00ean m\\u1ee5c \\u0111ang xem\",\"value_type\":\"boolean\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"data-ref\":\"parent_id\"},\"parent_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c Cha\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_category_sortby_options\"}}', '[]'),
(55, 'blade', 'theme', 3, 'Sidebar: Danh sách tin bài', 'sidebar.posts', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\",\"default\":\"Tin m\\u1edbi nh\\u1ea5t\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"content_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i n\\u1ed9i dung\",\"call\":\"get_content_type_options\",\"params\":[\"T\\u1ea5t c\\u1ea3\"]},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}}', '[]'),
(56, 'blade', 'theme', 3, 'Sidebar: Tìm kiếm', 'sidebar.search', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\",\"default\":\"T\\u00ecm ki\\u1ebfm\"}}', '[]');
INSERT INTO `components` (`id`, `type`, `ref`, `ref_id`, `name`, `path`, `inputs`, `data`) VALUES
(57, 'blade', 'theme', 3, 'Mạng xã hội', 'sidebar.social', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"facebook\":{\"type\":\"text\",\"label\":\"facebook (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c (M\\u1eb7c \\u0111\\u1ecbnh theo m\\u1ee5c social)\"},\"twitter\":{\"type\":\"text\",\"label\":\"twitter (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c (M\\u1eb7c \\u0111\\u1ecbnh theo m\\u1ee5c social)\"},\"youtube\":{\"type\":\"text\",\"label\":\"youtube (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c (M\\u1eb7c \\u0111\\u1ecbnh theo m\\u1ee5c social)\"},\"linkedin\":{\"type\":\"text\",\"label\":\"Linkedin (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c (M\\u1eb7c \\u0111\\u1ecbnh theo m\\u1ee5c social)\"},\"instagram\":{\"type\":\"text\",\"label\":\"instagram (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c (M\\u1eb7c \\u0111\\u1ecbnh theo m\\u1ee5c social)\"},\"pinterest\":{\"type\":\"text\",\"label\":\"Pinterest (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c (M\\u1eb7c \\u0111\\u1ecbnh theo m\\u1ee5c social)\"}}', '[]'),
(58, 'blade', 'theme', 3, 'Sidebar: Thẻ bài viết (tags)', 'sidebar.tags', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_tag_sortby_options\"},\"tag_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}}', '[]'),
(59, 'blade', 'theme', 3, 'Project Sidebar: Danh mục Dự án', 'sidebar-project.categories', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_project_category_sortby_options\"}}', '[]'),
(60, 'blade', 'theme', 3, 'Home: Mục liên hệ', 'contacts.area', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"faq_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 FAQ (T\\u00f9y ch\\u1ecdn)\"}}', '[]'),
(61, 'blade', 'theme', 3, 'Mục liên hệ - FAQ', 'contacts.faq', '{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 \"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"}}', '[]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone_number`, `address`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Lê Ngọc Doãn', 'doanln16@gmail.com', '0945786960', NULL, NULL, 'theme_asset', '2020-05-01 18:44:15', '2020-05-01 18:44:15'),
(2, 'Doãn Lê Ngọc', 'doanln16@gmail.com', '0945786960', NULL, NULL, '2222222222', '2020-05-01 18:58:19', '2020-05-01 18:58:19'),
(3, 'Doãn Lê Ngọc', 'doanln16@gmail.com', '0945786960', NULL, NULL, '21', '2020-05-27 15:49:46', '2020-05-27 15:49:46'),
(4, 'Doãn Lê Ngọc', 'doanln16@gmail.com', '0945786960', NULL, NULL, '10', '2020-05-28 09:09:37', '2020-05-28 09:09:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `crawler_frames`
--

CREATE TABLE `crawler_frames` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'post',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Frame name',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `index` int(11) NOT NULL DEFAULT 0,
  `selectors` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `crawler_tasks`
--

CREATE TABLE `crawler_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dynamic_id` bigint(20) UNSIGNED DEFAULT 0,
  `frame_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'post',
  `task_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_url_selector` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT 0,
  `crawl_resources` int(11) DEFAULT 0,
  `custom_run_time` int(10) UNSIGNED DEFAULT 0,
  `repeat_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crawl_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crawl_datetime` datetime DEFAULT NULL,
  `crawl_last_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `district_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `ward_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(14,2) NOT NULL DEFAULT 0.00,
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(11) DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_with_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dynamics`
--

CREATE TABLE `dynamics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'article',
  `use_category` tinyint(1) NOT NULL DEFAULT 0,
  `use_gallery` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dynamics`
--

INSERT INTO `dynamics` (`id`, `name`, `slug`, `description`, `content`, `keywords`, `feature_image`, `post_type`, `use_category`, `use_gallery`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'Lê Ngọc Doãn', 'le-ngoc-doan', NULL, NULL, NULL, 'best-ways-to-come-up-with-company-goals-feature-5e6cadef74530.png', 'custom', 1, 0, 1, '2020-03-14 10:11:59', '2020-03-14 10:22:20'),
(2, 'Dịch vụ', 'dich-vu', 'Các dịch vụ hàng đầu của web 102', NULL, NULL, 'preview-large-preview-5e7797e85fc9e.png', 'article', 1, 0, 0, '2020-03-22 16:52:56', '2020-06-01 04:18:44'),
(3, 'Blog', 'blog', NULL, NULL, 'blog', NULL, 'custom', 1, 0, 0, '2020-05-02 02:55:55', '2020-05-02 02:55:55'),
(4, 'Tài liệu', 'tai-lieu', NULL, NULL, NULL, NULL, 'custom', 1, 0, 0, '2020-05-15 01:42:41', '2020-05-15 01:44:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_tokens`
--

CREATE TABLE `email_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'confirm',
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_id` bigint(20) UNSIGNED DEFAULT 0,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `email_tokens`
--

INSERT INTO `email_tokens` (`id`, `email`, `type`, `ref`, `ref_id`, `token`, `code`, `expired_at`, `created_at`, `updated_at`) VALUES
(1, 'doanln1611@gmail.com', 'verify', 'account', 0, '5ebe0c6fc9193', '747927', '2020-05-16 10:28:47', '2020-05-15 03:28:47', '2020-05-15 03:28:47'),
(2, 'doanln1614@gmail.com', 'verify', 'account', 0, '5ebe112399657', '260757', '2020-05-16 10:48:51', '2020-05-15 03:48:51', '2020-05-15 03:48:51'),
(4, 'hoangtrungexpress@gmail.com', 'verify', 'account', 0, '5ecfe50f1f831', '285929', '2020-05-29 23:21:35', '2020-05-28 16:21:35', '2020-05-28 16:21:35'),
(5, 'hacker@gmail.com', 'verify', 'account', 0, '5ed07a505e20d', '638495', '2020-05-30 09:58:24', '2020-05-29 02:58:24', '2020-05-29 02:58:24'),
(7, 'aaa1@gmail.com', 'verify', 'account', 0, '5ed860a6cf86e', '564852', '2020-06-05 09:47:02', '2020-06-04 02:47:02', '2020-06-04 02:47:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `experiences`
--

CREATE TABLE `experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_id` bigint(20) UNSIGNED NOT NULL,
  `org_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT 'work',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_start_date` int(10) UNSIGNED DEFAULT 0,
  `has_finish_date` int(10) UNSIGNED DEFAULT 0,
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `upload_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `sid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `folder_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `date_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filetype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` double(10,2) DEFAULT 0.00,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `files`
--

INSERT INTO `files` (`id`, `upload_by`, `sid`, `privacy`, `ref`, `ref_id`, `folder_id`, `date_path`, `filename`, `original_filename`, `filetype`, `mime`, `size`, `extension`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, '7b9c21adf2dea6ff6449291d028bc688', 'public', 'theme', 3, 0, '2020/04/30', 'webtmdt1-5eaae4a4bd932.jpg', 'webtmdt1.jpg', NULL, NULL, 76.29, 'jpg', NULL, NULL, '2020-04-30 14:45:56', '2020-04-30 14:45:56'),
(2, 1, 'fbe799f8fbfd6f77b1923cccd29ac294', 'public', 'project', 1, 0, '2020/04/30', '002-5e120ed917e4c-5eaaedd33a4e9.png', '002-5e120ed917e4c.png', NULL, NULL, 911.80, 'png', NULL, NULL, '2020-04-30 15:25:07', '2020-04-30 15:25:07'),
(3, 1, '98b07955c3e322874b55c046285ef854', 'public', 'project', 1, 0, '2020/04/30', '003-5e120ed91bfbb-5eaaedd34f9a7.png', '003-5e120ed91bfbb.png', NULL, NULL, 921.92, 'png', NULL, NULL, '2020-04-30 15:25:07', '2020-04-30 15:25:07'),
(4, 1, '53783743547723f7e1a9e00b1e017220', 'public', 'project', 1, 0, '2020/04/30', '004-5e120ed91f080-5eaaedd365d5b.png', '004-5e120ed91f080.png', NULL, NULL, 618.28, 'png', NULL, NULL, '2020-04-30 15:25:07', '2020-04-30 15:25:07'),
(5, 1, '8db766850716313285b191441c476bb2', 'public', 'project', 1, 0, '2020/04/30', '006-5e120ed92434a-5eaaedd372d69.png', '006-5e120ed92434a.png', NULL, NULL, 333.99, 'png', NULL, NULL, '2020-04-30 15:25:07', '2020-04-30 15:25:07'),
(6, 1, '1c93d832fe29dcdae204fc04fc818761', 'public', 'gallery', 0, 0, '2020/05/28', 'screencapture-moondental-vn-2020-05-28-17_18_14-5ecf9104dd9e9.png', 'screencapture-moondental-vn-2020-05-28-17_18_14.png', 'image', 'image/png', 5023.65, 'png', NULL, NULL, '2020-05-28 10:23:01', '2020-05-28 10:23:01'),
(7, 1, '6f4e5025ac972798dc4a020a091e9525', 'public', 'transaction', 1, 0, '2020/06/03', 'business-corporate-website-inspiration-web-design-ui-07-5ed78bc97cdf5.jpg', 'business-corporate-website-inspiration-web-design-ui-07-5ed78bc97cdf5.jpg', 'image', 'image/jpeg', 103.16, 'jpg', NULL, NULL, '2020-06-03 11:38:49', '2020-06-03 11:38:49'),
(8, 1, 'ac2e1ac18185b1a2a3f44f28ef9192bb', 'public', 'transaction', 2, 0, '2020/06/03', 'business-corporate-website-inspiration-web-design-ui-07-5ed78eec5466a.jpg', 'business-corporate-website-inspiration-web-design-ui-07-5ed78eec5466a.jpg', 'image', 'image/jpeg', 103.16, 'jpg', NULL, NULL, '2020-06-03 11:52:12', '2020-06-03 11:52:12'),
(9, 1, '9c9371d2e200c1a7c236e0f0c9660e20', 'public', 'transaction', 3, 0, '2020/06/03', 'business-corporate-website-inspiration-web-design-ui-07-5ed78efecb75a.jpg', 'business-corporate-website-inspiration-web-design-ui-07-5ed78efecb75a.jpg', 'image', 'image/jpeg', 103.16, 'jpg', NULL, NULL, '2020-06-03 11:52:30', '2020-06-03 11:52:30'),
(10, 1, '31022ecf338e08f289a1f7d7c3e40158', 'public', 'transaction', 4, 0, '2020/06/04', 'logo-1024-5ed8624d7e54d.png', 'logo-1024-5ed8624d7e54d.png', 'image', 'image/png', 293.03, 'png', NULL, NULL, '2020-06-04 02:54:05', '2020-06-04 02:54:05'),
(11, 1, 'fdfb46d1f413e6c08044fbe15640c05b', 'public', 'transaction', 5, 0, '2020/06/04', '003-5ed8b44ca8a49.jpg', '003-5ed8b44ca8a49.jpg', 'image', 'image/jpeg', 58.17, 'jpg', NULL, NULL, '2020-06-04 08:43:56', '2020-06-04 08:43:56'),
(12, 1, 'b9bd2b702bf137fe3087d528b56b6328', 'public', 'transaction', 6, 0, '2020/06/04', 'logo-2-5ed8c5bf321ef.png', 'logo-2-5ed8c5bf321ef.png', 'image', 'image/png', 1.99, 'png', NULL, NULL, '2020-06-04 09:58:23', '2020-06-04 09:58:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `html_areas`
--

CREATE TABLE `html_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'system',
  `ref_id` bigint(20) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `html_areas`
--

INSERT INTO `html_areas` (`id`, `name`, `slug`, `ref`, `ref_id`) VALUES
(1, 'Head (css Hoặc js)', 'head', 'default', 0),
(2, 'Top (js: GA, FB,...)', 'top', 'default', 0),
(3, 'Header', 'header', 'default', 0),
(4, 'Đầu nội dung', 'article_top', 'default', 0),
(5, 'Main', 'main', 'default', 0),
(6, 'Cuối nội dung', 'article_bottom', 'default', 0),
(7, 'Sidebar', 'sidebar', 'default', 0),
(8, 'Đầu sidebar', 'sidebar_top', 'default', 0),
(9, 'Cuối sidebar', 'sidebar_bottom', 'default', 0),
(10, 'Footer', 'footer', 'default', 0),
(11, 'Bottom (js)', 'bottom', 'default', 0),
(12, 'Tùy chỉnh (custom)', 'custom', 'default', 0),
(13, 'Promo Area', 'promos', 'theme', 2),
(14, 'Các dịch vụ', 'services', 'theme', 2),
(15, 'Danh sách khách hàng', 'clients', 'theme', 2),
(16, 'Danh sách phản hồi', 'testimonials', 'theme', 2),
(17, 'Gói dịch vụ tab 1', 'tab_1_packages', 'theme', 2),
(18, 'Gói dịch vụ tab 2', 'tab_2_packages', 'theme', 2),
(19, 'Gói dịch vụ tab 3', 'tab_3_packages', 'theme', 2),
(20, 'Nhóm làm việc', 'team_members', 'theme', 2),
(21, 'Footer', 'news_footer', 'theme', 1),
(22, 'News Sidebar', 'news_sidebar', 'theme', 1),
(23, 'Trang Chủ', 'home', 'theme', 1),
(24, 'Trang chi tiết bài viết', 'single_post', 'theme', 1),
(25, 'Trang chi tiết page', 'single_page', 'theme', 1),
(26, 'Trang Chủ', 'home', 'theme', 3),
(27, 'Dịch vụ trên trang chủ', 'home_services', 'theme', 3),
(28, 'Danh sách phản hồi', 'testimonials', 'theme', 3),
(29, 'Nhóm làm việc', 'team_members', 'theme', 3),
(30, 'Các câu hỏi thường gap96', 'contact_faq', 'theme', 3),
(31, 'Báo giá (trên trang chủ)', 'home_pricing', 'theme', 3),
(32, 'Post Sidebar', 'sidebar_post', 'theme', 3),
(33, 'Project Sidebar', 'sidebar_project', 'theme', 3),
(34, 'Page Sidebar', 'sidebar_page', 'theme', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `html_components`
--

CREATE TABLE `html_components` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `component_id` bigint(20) UNSIGNED DEFAULT 0,
  `area_id` bigint(20) DEFAULT 0,
  `priority` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `html_components`
--

INSERT INTO `html_components` (`id`, `component_id`, `area_id`, `priority`, `data`) VALUES
(1, 35, 10, 1, '{\"title\":\"Gi\\u1edbi thi\\u1ec7u\",\"description\":\"Web 1-0-2 l\\u00e0 m\\u1ed9t n\\u1ec1n t\\u1ea3ng web n\\u01a1i ai ai c\\u0169ng c\\u00f3 th\\u1ec3 t\\u1ea1o n\\u00ean nh\\u1eefng \\u0111i\\u1ec1u tuy\\u1ec7t v\\u1eddi ch\\u1ec9 c\\u1ea7n c\\u00f3 1 \\u00fd t\\u01b0\\u1edfng \\u0111\\u1ed9c \\u0111\\u00e1o hay \\u0111i\\u00ean r\\u1ed3 nh\\u1ea5t\"}'),
(2, 37, 10, 2, '{\"title\":\"D\\u1ecbch v\\u1ee5\",\"menu_id\":\"5\"}'),
(3, 38, 10, 3, '{\"title\":null,\"dynamic_id\":\"0\",\"category_id\":\"0\",\"sorttype\":\"1\",\"post_number\":\"2\"}'),
(4, 36, 10, 4, '{\"title\":\"Li\\u00ean H\\u1ec7\",\"email\":\"doanln16@gmail.com\",\"phone_number\":\"0945786960\",\"address\":\"172, d\\u01b0\\u1eddng B\\u00e0 Tri\\u1ec7u, p. D\\u00e2n ch\\u1ee7, tp. H\\u00f2a B\\u00ecnh, t\\u1ec9nh H\\u00f2a B\\u00ecnh\"}'),
(5, 39, 26, 1, '{\"slider_id\":\"1\",\"btn_text\":\"Chi ti\\u1ebft\"}'),
(6, 40, 26, 2, '{\"title\":\"B\\u1ea1n ch\\u1ec9 c\\u1ea7n n\\u00eau ra nh\\u1eefng <strong>\\u00fd t\\u01b0\\u1edfng<\\/strong>, ph\\u1ea7n c\\u00f2n l\\u1ea1i \\u0111\\u1ec3 ch\\u00fang t\\u00f4i lo!\",\"content\":\"<strong>\\u0110\\u1eebng kinh doanh khi b\\u1ea1n ch\\u01b0a c\\u00f3 t\\u00ean mi\\u1ec1n!<\\/strong> - \\u0110\\u00f3 l\\u00e0 c\\u00e2u qu\\u1ea3ng c\\u00e1o c\\u1ee7a c\\u00e1c nh\\u00e0 \\u0111\\u0103ng k\\u00fd t\\u00ean mi\\u1ec1n. \\r\\nC\\u00f2n ch\\u00fang t\\u00f4i th\\u00ec th\\u1ea5y r\\u1eb1ng <strong>\\u0110\\u00e3 kinh doanh th\\u00ec n\\u00ean t\\u1ea1o m\\u1ed9t website<\\/strong>.\\r\\n\\r\\nH\\u00e3y b\\u1eaft \\u0111\\u1ea7u v\\u1edbi vi\\u1ec7c l\\u00ean \\u00fd t\\u01b0\\u1edfng v\\u00e0o t\\u1ea1o cho m\\u00ecnh m\\u1ed9t trang web ngay h\\u00f4m nay!\",\"image\":\"5e7b8c368d0af.png\",\"youtube_url\":\"https:\\/\\/www.youtube.com\\/watch?v=58_KE6_ksRM\",\"services\":\"Thi\\u1ebft k\\u1ebf website\\r\\nThi\\u1ebft k\\u1ebf logo\\r\\nCho thu\\u00ea t\\u00ean mi\\u1ec1n\\r\\nCho thu\\u00ea hosting\"}'),
(7, 41, 26, 3, '{\"title\":\"C\\u00e1c d\\u1ecbch v\\u1ee5\",\"description\":\"Ch\\u00fang t\\u00f4i lu\\u00f4n c\\u1ed1 g\\u1eafng mang \\u0111\\u1ebfn cho b\\u1ea1n nh\\u1eefng d\\u1ecbch v\\u1ee5 t\\u1ed1t nh\\u1ea5t tr\\u00ean chi ph\\u00ed m\\u00e0 b\\u1ea1n ph\\u1ea3i b\\u1ecf ra!\"}'),
(8, 42, 27, 1, '{\"title\":\"Thi\\u1ebft k\\u1ebf website\",\"description\":\"Giao di\\u1ec7n b\\u1eaft m\\u1eaft, nh\\u1eb9, chu\\u1ea9n SEO, th\\u00edch \\u1ee9ng tr\\u00ean m\\u1ecdi thi\\u1ebft b\\u1ecb\",\"link\":\"\\/\",\"icon\":\"ti-write\"}'),
(9, 42, 27, 3, '{\"title\":\"Thi\\u1ebft K\\u1ebf Logo\",\"description\":\"T\\u1ea1o n\\u00ean n\\u1ed9 nh\\u1eadn di\\u1ec7n th\\u01b0\\u01a1ng hi\\u1ec7u kh\\u00f4ng l\\u1eabn v\\u00e0o \\u0111\\u00e2u \\u0111\\u01b0\\u1ee3c\",\"link\":\"\\/\",\"icon\":\"ti-palette\"}'),
(10, 42, 27, 2, '{\"title\":\"Nh\\u1eadn di\\u1ec7n tr\\u00ean internet\",\"description\":\"Microsite \\u2013 Facebook Fanpage \\u2013 Banner ads \\u2013 Email marketing\",\"link\":\"\\/\",\"icon\":\"ti-world\"}'),
(11, 42, 27, 4, '{\"title\":\"Nh\\u1eadn di\\u1ec7n v\\u0103n ph\\u00f2ng\",\"description\":\"Name card \\u2013 Phong b\\u00ec th\\u01b0, ti\\u2013 Name card \\u2013 Phong b\\u00ec th\\u01b0, ti\\u00eau \\u0111\\u1ec1 th\\u01b0 \\u2013 H\\u00f3a \\u0111\\u01a1n...\",\"link\":\"\\/\",\"icon\":\"ti-home\"}'),
(12, 42, 27, 5, '{\"title\":\"SEO\",\"description\":\"T\\u1ed1i \\u01b0u h\\u00f3a cho c\\u00e1c c\\u00f4ng c\\u1ee5 t\\u00ecm ki\\u1ebfm, d\\u1ec5 d\\u00e0ng ti\\u1ebfp c\\u1eadn kh\\u00e1ch h\\u00e0ng\",\"link\":\"\\/\",\"icon\":\"ti-google\"}'),
(13, 42, 27, 6, '{\"title\":\"HOSTING GI\\u00c1 R\\u1eba\",\"description\":\"Cho thu\\u00ea hosting ch\\u1ea5t l\\u01b0\\u1ee3ng cao v\\u1edbi gi\\u00e1 c\\u1ea3 ph\\u1ea3i ch\\u0103ng nh\\u1ea5t\",\"link\":\"\\/\",\"icon\":\"ti-harddrives\"}'),
(14, 43, 26, 4, '{\"fact_1\":\"144\\r\\nD\\u1ef1 \\u00e1n \\r\\nL\\u00e0 s\\u1ed1 d\\u1ef1 \\u00e1n \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c tri\\u1ec3n khai v\\u00e0 th\\u00e0nh c\\u00f4ng\",\"fact_2\":\"42\\r\\nKh\\u00e1ch h\\u00e0ng\\r\\n92% Kh\\u00e1ch h\\u00e0ng ti\\u1ebfp t\\u1ee5c h\\u1ee3p t\\u00e1c l\\u00e2u d\\u00e0i\",\"line_1\":\"Thi\\u1ebft k\\u1ebf website = 95\",\"line_2\":\"Thi\\u1ebft k\\u1ebf logo = 58\",\"line_3\":\"D\\u1ecbch v\\u1ee5 hosting - t\\u00ean mi\\u1ec1n = 89\"}'),
(15, 44, 26, 7, '{\"title\":\"D\\u1ef1 \\u00e1n\",\"description\":\"While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old\",\"sorttype\":\"1\",\"project_number\":\"10\"}'),
(16, 45, 26, 6, '{\"title\":\"Ph\\u1ea3n h\\u1ed3i t\\u1eeb kh\\u00e1ch h\\u00e0ng\",\"description\":\"While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old\",\"list_type\":\"custom\",\"item_number\":\"5\",\"sort_type\":\"id-ASC\"}'),
(17, 46, 28, 1, '{\"name\":\"T\\u00f9ng \\u0110K\",\"image\":\"5eaafbe0728dd.jpg\",\"job\":\"Gi\\u00e1m \\u0111\\u1ed1c XiaomiWorld.vn\",\"content\":\"T\\u00f4i r\\u1ea5t h\\u00e0i l\\u00f2ng v\\u1ec1 ch\\u1ea5t l\\u01b0\\u1ee3ng d\\u1ecbch v\\u1ee5 c\\u0169ng phong c\\u00e1ch l\\u00e0m vi\\u1ec7c c\\u1ee7a DH Team\"}'),
(18, 46, 28, 2, '{\"name\":\"Hi\\u1ec1n Tr\\u01b0\\u01a1ng\",\"image\":\"5eaafc3ba57c8.jpg\",\"job\":\"Ch\\u1ee7 ahop luxurysell.vn\",\"content\":\"Thi\\u1ebft k\\u1ebf \\u0111\\u1eb9p, nhanh ch\\u00f3ng. Gi\\u00e1 c\\u1ea3 h\\u1ee3p l\\u00fd. N\\u00f3i chung t\\u00f4i r\\u1ea5t h\\u00e0i l\\u00f2ng\"}'),
(19, 48, 29, 1, '{\"name\":\"L\\u00ea Ng\\u1ecdc Do\\u00e3n\",\"avatar\":\"5eab16ab65bcc.png\",\"job\":\"DEV\",\"description\":\"Middleton in objection discovery as agreeable. Edward thrown dining so he my around to.\",\"link\":\"#\",\"is_loader\":null}'),
(20, 48, 29, 2, '{\"name\":\"\\u0110o\\u00e0n Linh\",\"avatar\":\"5eab16e917fe3.png\",\"job\":\"Designer\",\"description\":\"Middleton in objection discovery as agreeable. Edward thrown dining so he my around to.\",\"link\":\"#\",\"is_loader\":null}'),
(21, 48, 29, 3, '{\"name\":\"C\\u1ed3 Tri\\u1ec7u Phong\",\"avatar\":\"5eab171a8408d.png\",\"job\":\"DEV\",\"description\":\"Middleton in objection discovery as agreeable. Edward thrown dining so he my around to.\",\"link\":\"#\",\"is_loader\":null}'),
(22, 47, 26, 8, '{\"title\":\"\\u0110\\u1ed9i ng\\u0169\",\"description\":\"While mirth large of on front. Ye he greater related adapted proceed entered an. Through it examine express promise no. Past add size game cold girl off how old\",\"background\":\"\",\"list_type\":\"custom\",\"team_id\":\"0\",\"item_number\":\"4\",\"sort_type\":\"id-ASC\"}'),
(23, 49, 26, 9, '{\"title\":\"H\\u00e3y n\\u00f3i v\\u1ec1 \\u00fd t\\u01b0\\u1edfng c\\u1ee7a b\\u1ea1n\",\"description\":\"H\\u00e3y b\\u1eaft \\u0111\\u1ea7u v\\u1edbi vi\\u1ec7c l\\u00ean \\u00fd t\\u01b0\\u1edfng v\\u00e0o t\\u1ea1o cho m\\u00ecnh m\\u1ed9t trang web ngay h\\u00f4m nay!\",\"faq_title\":\"C\\u00e1c c\\u00e2u h\\u1ecfi th\\u01b0\\u1eddng g\\u1eb7p\"}'),
(24, 50, 30, 1, '{\"title\":\"\\u0110\\u0103ng k\\u00fd t\\u00e0i kho\\u00e0n nh\\u01b0 th\\u1ebf n\\u00e0o?\",\"description\":\"Middleton in objection discovery as agreeable. Edward thrown dining so he my around to.\"}'),
(25, 50, 30, 2, '{\"title\":\"C\\u00e1ch t\\u1ea1o nhanh m\\u1ed9t trang web\",\"description\":\"Middleton in objection discovery as agreeable. Edward thrown dining so he my around to.\"}'),
(26, 50, 30, 3, '{\"title\":\"L\\u00e0m sao \\u0111\\u1ec3 thay \\u0111\\u1ed5i giao di\\u1ec7n\",\"description\":\"Middleton in objection discovery as agreeable. Edward thrown dining so he my around to.\"}'),
(27, 50, 30, 4, '{\"title\":\"C\\u00e1ch t\\u1ef1 t\\u1ea1o giao di\\u1ec7n \\u0111\\u1ed9c \\u0111\\u00e1o\",\"description\":\"Middleton in objection discovery as agreeable. Edward thrown dining so he my around to.\"}'),
(28, 51, 26, 10, '{\"title\":\"Blog\",\"description\":null,\"dynamic_id\":\"3\",\"category_id\":\"0\",\"group_by_category\":null,\"sorttype\":\"1\",\"post_number\":\"3\"}'),
(29, 52, 26, 5, '{\"title\":\"B\\u1ea3ng gi\\u00e1\",\"description\":\"D\\u01b0\\u1edbi \\u0111\\u00e2y l\\u00e0 b\\u00e1o gi\\u00e1 m\\u1ed9t s\\u1ed1 d\\u1ecbch v\\u1ee5 c\\u1ee7a WEB102\"}'),
(30, 53, 31, 3, '{\"title\":\"Th\\u01b0\\u01a1ng m\\u1ea1i \\u0111i\\u1ec7n t\\u1eed\",\"label\":null,\"price\":\"10000000\",\"unit\":\"VN\\u0110\",\"content\":\"[t] Mi\\u1ec5n ph\\u00ed hosting\\r\\n[t] Mi\\u1ec5n ph\\u00ed t\\u00ean mi\\u1ec1n\",\"active\":null,\"link\":\"#\",\"price_label\":\"Ch\\u1ec9 t\\u1eeb\"}'),
(31, 53, 31, 2, '{\"title\":\"Trang tin t\\u1ee9c\",\"label\":\"HOT\",\"price\":\"5000000\",\"unit\":\"VN\\u0110\",\"content\":\"[t] Mi\\u1ec5n ph\\u00ed hosting\\r\\n[t] Mi\\u1ec5n ph\\u00ed t\\u00ean mi\\u1ec1n\",\"active\":\"on\",\"link\":null,\"price_label\":\"Ch\\u1ec9 t\\u1eeb\"}'),
(32, 53, 31, 1, '{\"title\":\"D\\u00f9ng th\\u1eed\",\"label\":null,\"price\":\"0\",\"unit\":\"VN\\u0110\",\"content\":\"[t] Mi\\u1ec5n ph\\u00ed hosting\\r\\n[t] Mi\\u1ec5n ph\\u00ed t\\u00ean mi\\u1ec1n\",\"active\":null,\"link\":null,\"price_label\":\"Ch\\u1ec9 t\\u1eeb\"}'),
(33, 56, 32, 1, '{\"title\":\"T\\u00ecm ki\\u1ebfm\"}'),
(34, 54, 32, 2, '{\"title\":\"Danh m\\u1ee5c\",\"dynamic_id\":\"0\",\"parent_id\":\"0\",\"sorttype\":\"6\",\"get_by_dynamic_active\":\"on\"}'),
(35, 57, 32, 3, '{\"facebook\":null,\"twitter\":null,\"youtube\":null,\"linkedin\":null,\"instagram\":null,\"pinterest\":null,\"title\":\"MXH\"}'),
(36, 55, 32, 4, '{\"title\":\"Tin m\\u1edbi nh\\u1ea5t\",\"dynamic_id\":\"0\",\"category_id\":\"0\",\"content_type\":null,\"sorttype\":\"1\",\"post_number\":\"10\"}'),
(37, 58, 32, 5, '{\"title\":\"Th\\u1ebb\",\"sorttype\":\"1\",\"tag_number\":\"10\"}'),
(38, 56, 33, 38, '{\"title\":\"T\\u00ecm ki\\u1ebfm\"}'),
(39, 59, 33, 39, '{\"title\":\"Danh m\\u1ee5c\",\"sorttype\":\"6\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `html_embeds`
--

CREATE TABLE `html_embeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Menu',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `ref_id` bigint(20) DEFAULT 0,
  `priority` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_main` tinyint(1) DEFAULT 0,
  `positions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT 4
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `type`, `ref_id`, `priority`, `is_main`, `positions`, `depth`) VALUES
(1, 'Liên hệ', 'topleft', 'theme', 1, 2, 0, ' topleft,', 1),
(2, 'Top Right', 'topright', 'theme', 1, 3, 0, ' topright,', 1),
(4, 'Menu Chính', 'menu-chinh', 'default', 0, 1, 0, ' primary,', 3),
(5, 'Dịch vụ', 'dich-vu', 'default', 2, 4, 0, ' custom,', 1),
(6, 'Menu Bize', 'bize', 'theme', 2, 5, 0, ' primary, bize,', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT 0,
  `priority` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_id` bigint(20) UNSIGNED DEFAULT 0,
  `sub_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `props` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `parent_id`, `priority`, `type`, `ref`, `ref_id`, `sub_type`, `props`) VALUES
(1, 1, 0, 1, 'url', NULL, 0, 'default', '{\"text\":\"\",\"url\":\"#\",\"link_class\":\"faxebook\",\"icon\":\"fa fa-facebook\"}'),
(2, 1, 0, 2, 'url', NULL, 0, 'default', '{\"text\":\"\",\"url\":\"#\",\"link_class\":\"twitter\",\"icon\":\"fa fa-twitter\"}'),
(3, 1, 0, 3, 'url', NULL, 0, 'default', '{\"text\":\"\",\"url\":\"#\",\"link_class\":\"youtube\",\"icon\":\"fa fa-youtube\"}'),
(4, 1, 0, 4, 'url', NULL, 0, 'default', '{\"text\":\"\",\"url\":\"#\",\"link_class\":\"linkedin\",\"icon\":\"fa fa-linkedin\"}'),
(5, 1, 0, 5, 'url', NULL, 0, 'default', '{\"text\":\"\",\"url\":\"#\",\"link_class\":\"instagram\",\"icon\":\"fa fa-instagram\"}'),
(6, 1, 0, 6, 'url', NULL, 0, 'default', '{\"text\":\"(+84) 945.786.960\",\"url\":\"tel:0945786960\",\"class\":\"address\",\"icon\":\"fa fa-phone\"}'),
(7, 1, 0, 7, 'url', NULL, 0, 'default', '{\"text\":\"doanln16@gmail.com\",\"url\":\"mailto:doanln16@gmail.com\",\"class\":\"address\",\"icon\":\"fa fa-envelope-o\"}'),
(8, 2, 0, 1, 'url', NULL, 0, 'default', '{\"text\":\"\",\"url\":\"#\",\"class\":\"contact\",\"icon\":\"fa fa-map-marker fa-i\"}'),
(9, 2, 0, 2, 'url', NULL, 0, 'default', '{\"text\":\"\",\"url\":\"#\",\"class\":\"about\",\"icon\":\"fa fa-user fa-i\"}'),
(16, 4, 0, 1, 'route', NULL, 0, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"text\":\"Trang ch\\u1ee7\",\"route\":\"home\",\"target\":\"none\",\"show_submenu\":\"show\",\"active_key\":\"home\"}'),
(17, 4, 0, 7, 'route', NULL, 0, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"active_key\":null,\"text\":\"Li\\u00ean h\\u1ec7\",\"route\":\"client.contacts.form\",\"target\":\"none\",\"show_submenu\":\"show\"}'),
(22, 5, 0, 0, 'url', NULL, 0, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"active_key\":null,\"text\":\"Thi\\u1ebft k\\u1ebf website\",\"url\":\"#service\",\"target\":\"none\",\"show_submenu\":\"show\"}'),
(23, 5, 0, 0, 'url', NULL, 0, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"active_key\":null,\"text\":\"SEO\",\"url\":\"#service\",\"target\":\"none\",\"show_submenu\":\"show\"}'),
(24, 5, 0, 0, 'url', NULL, 0, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"active_key\":null,\"text\":\"THI\\u1ebeT K\\u1ebe LOGO\",\"url\":\"#team\",\"target\":\"none\",\"show_submenu\":\"show\"}'),
(25, 5, 0, 0, 'url', NULL, 0, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"active_key\":null,\"text\":\"HOSTING GI\\u00c1 R\\u1eba\",\"url\":\"\\/\",\"target\":\"none\",\"show_submenu\":\"show\"}'),
(26, 4, 0, 2, 'page', 'page', 10, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"active_key\":null,\"page_id\":\"10\",\"target\":\"none\",\"show_submenu\":\"show\",\"text\":\"Gi\\u1edbi thi\\u1ec7u\"}'),
(27, 4, 0, 4, 'route', NULL, 0, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"active_key\":null,\"text\":\"D\\u1ef1 \\u00e1n\",\"route\":\"client.projects\",\"target\":\"none\",\"show_submenu\":\"show\"}'),
(28, 4, 0, 3, 'dynamic', 'dynamic', 2, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"active_key\":null,\"dynamic_id\":\"2\",\"target\":\"none\",\"show_submenu\":\"show\",\"text\":\"D\\u1ecbch v\\u1ee5\"}'),
(29, 4, 0, 5, 'dynamic', 'dynamic', 4, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"active_key\":null,\"dynamic_id\":\"4\",\"target\":\"none\",\"show_submenu\":\"show\",\"text\":\"T\\u00e0i li\\u1ec7u\"}'),
(30, 4, 0, 6, 'dynamic', 'dynamic', 3, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"active_key\":null,\"dynamic_id\":\"3\",\"target\":\"none\",\"show_submenu\":\"show\",\"text\":\"Blog\"}'),
(31, 4, 0, 8, 'route', NULL, 0, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"active_key\":null,\"text\":\"\\u0110\\u0103ng k\\u00fd\",\"route\":\"client.services.add\",\"target\":\"none\",\"show_submenu\":\"show\"}'),
(32, 4, 27, 1, 'project_category', 'project_category', 1, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"active_key\":null,\"project_category_id\":\"1\",\"target\":\"none\",\"show_submenu\":\"show\",\"text\":\"Outsourcing\"}'),
(33, 4, 27, 2, 'project_category', 'project_category', 2, 'default', '{\"icon\":null,\"class\":null,\"link_class\":null,\"active_key\":null,\"project_category_id\":\"2\",\"target\":\"none\",\"show_submenu\":\"show\",\"text\":\"Product\"}'),
(34, 6, 0, 1, 'url', NULL, 0, 'default', '{\"text\":\"Home\",\"url\":\"#main\"}'),
(35, 6, 0, 2, 'url', NULL, 0, 'default', '{\"text\":\"Gi\\u1edbi thi\\u1ec7u\",\"url\":\"#about\"}'),
(36, 6, 0, 3, 'url', NULL, 0, 'default', '{\"text\":\"D\\u1ecbch v\\u1ee5\",\"url\":\"#service\"}'),
(37, 6, 0, 4, 'url', NULL, 0, 'default', '{\"text\":\"C\\u00e1c d\\u1ef1 \\u00e1n\",\"url\":\"#work\"}'),
(38, 6, 0, 5, 'url', NULL, 0, 'default', '{\"text\":\"Nh\\u00f3m l\\u00e0m vi\\u1ec7c\",\"url\":\"#team\"}'),
(39, 6, 0, 6, 'url', NULL, 0, 'default', '{\"text\":\"Li\\u00ean h\\u1ec7\",\"url\":\"#contact\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `metadatas`
--

CREATE TABLE `metadatas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'data',
  `ref_id` bigint(20) UNSIGNED DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'name',
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `metadatas`
--

INSERT INTO `metadatas` (`id`, `ref`, `ref_id`, `name`, `value`) VALUES
(1, 'theme', 1, 'components', '[{\"path\":\"block-ads-wide\",\"name\":\"Banner qu\\u1ea3ng c\\u00e1o (1248 x 130)\",\"inputs\":{\"banner\":{\"type\":\"file\",\"label\":\"Banner\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"text\":{\"type\":\"text\",\"label\":\"Text\"},\"type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i qu\\u1ea3ng c\\u00e1o\",\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"},\"code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\",\"placeholder\":\"Nh\\u1eadp m\\u00e3 qu\\u1ea3ng c\\u00e1o\"}}},{\"path\":\"footer-column-about\",\"name\":\"Footer Column: Gi\\u1edbi thi\\u1ec7u\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\",\"value\":\"Gi\\u1edbi thi\\u1ec7u\"},\"about_content\":{\"type\":\"textarea\",\"label\":\"N\\u1ed9i dung\",\"className\":\"auto-height\"},\"show_logo\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb logo\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"show_text_logo\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb text logo\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"text_logo_primary\":{\"type\":\"text\",\"label\":\"Text Logo (ch\\u00ednh)\",\"value\":\"Tin T\\u1ee9c\"},\"text_logo_second\":{\"type\":\"text\",\"Label\":\"Text Logo (b\\u1ed5 xung)\",\"value\":\"24\\/7\"},\"highlight\":{\"type\":\"select\",\"label\":\"l\\u00e0m n\\u1ed5i b\\u1eadt\",\"data\":{\"none\":\"Kh\\u00f4ng\",\"primary\":\"Text ch\\u00ednh\",\"second\":\"Text ph\\u1ee5\",\"both\":\"T\\u1ea5t c\\u1ea3\"},\"default\":\"second\"},\"text_logo_slogan\":{\"type\":\"text\",\"Label\":\"Kh\\u1ea9u hi\\u1ec7u\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"}}},{\"path\":\"footer-column-posts\",\"name\":\"Footer Column: tin b\\u00e0i\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 \"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":4}}},{\"path\":\"footer-column-tags\",\"name\":\"Footer Column: Th\\u1ebb b\\u00e0i vi\\u1ebft (tags)\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 \"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_tag_sortby_options\"},\"tag_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":4}}},{\"path\":\"grid-first-large-thumbail\",\"name\":\"Home: L\\u01b0\\u1edbi v\\u1edbi tin \\u0111\\u1ea7u l\\u00e0m n\\u1ed5i b\\u1eadt\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1\",\"call\":\"get_number_options\",\"params\":[1,12]},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"content_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i n\\u1ed9i dung\",\"call\":\"get_content_type_options\",\"params\":[\"T\\u1ea5t c\\u1ea3\"]},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":4}}},{\"path\":\"home-ads-wide\",\"name\":\"Home: Banner qu\\u1ea3ng c\\u00e1o (820 x 130)\",\"inputs\":{\"banner\":{\"type\":\"file\",\"label\":\"Banner\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"text\":{\"type\":\"text\",\"label\":\"Text\"},\"type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i qu\\u1ea3ng c\\u00e1o\",\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"},\"code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\",\"placeholder\":\"Nh\\u1eadp m\\u00e3 qu\\u1ea3ng c\\u00e1o\"}}},{\"path\":\"home-bottom-ads\",\"name\":\"Home: Banner qu\\u1ea3ng c\\u00e1o (1240 x 130)\",\"inputs\":{\"banner\":{\"type\":\"file\",\"label\":\"Banner\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"text\":{\"type\":\"text\",\"label\":\"Text\"},\"type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i qu\\u1ea3ng c\\u00e1o\",\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"},\"code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\",\"placeholder\":\"Nh\\u1eadp m\\u00e3 qu\\u1ea3ng c\\u00e1o\"}}},{\"path\":\"home-breaking-and-slider\",\"name\":\"Breaking news & Slider\",\"inputs\":{\"slider_sort_type\":{\"type\":\"crazyselect\",\"label\":\"Ki\\u1ec3u s\\u1eafp x\\u1ebfp tin trong ph\\u1ea7n slider news\",\"call\":\"get_post_sortby_options\",\"default\":1},\"slider_number_post\":{\"type\":\"crazyswlect\",\"label\":\"S\\u1ed1 l\\u01b0\\u1ee3ng tin trong ph\\u1ea7n slider news\",\"data\":{\"4\":\"4 Tin (1 slider)\",\"8\":\"8 Tin (2 slider)\",\"12\":\"12 Tin (3 slider)\",\"16\":\"16 Tin (4 slider)\",\"20\":\"20 Tin (5 slider)\"},\"default\":16}}},{\"path\":\"home-carouse\",\"name\":\"Home: Tin b\\u00e0i d\\u1ea1ng slider (Carousel)\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"content_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i n\\u1ed9i dung\",\"call\":\"get_content_type_options\",\"params\":[\"T\\u1ea5t c\\u1ea3\"]},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}}},{\"path\":\"home-grid-list\",\"name\":\"Home: Danh s\\u00e1ch d\\u1ea1ng l\\u01b0\\u1edbi\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1\",\"call\":\"get_number_options\",\"params\":[1,12]},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"group_by_category\":{\"type\":\"switch\",\"label\":\"Nh\\u00f3m theo danh m\\u1ee5c\",\"value_type\":\"boolean\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":4}}},{\"path\":\"home-grid-sidebar-style-2\",\"name\":\"Home: L\\u01b0\\u1edbi & sidebar (style 2)\",\"inputs\":{\"first_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 1 (T\\u00f9y ch\\u1ecdn)\"},\"first_sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"first_bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 1\",\"call\":\"get_number_options\",\"params\":[1,12]},\"first_dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"K\\u00eanh \\u0111\\u0103ng b\\u00e0i c\\u1ee7a m\\u1ee5c 1 (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"data-ref\":\"first_category_id\",\"required\":\"true\"},\"first_category_id\":{\"type\":\"crazyselect\",\"label\":\"Ch\\u1ee7 \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 1\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#first_dynamic_id\"},true],\"@label-type\":\"value\"},\"first_sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp c\\u1ee7a m\\u1ee5c 1 \",\"call\":\"get_post_sortby_options\"},\"second_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 2 (T\\u00f9y ch\\u1ecdn)\"},\"second_sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"second_bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 2\",\"call\":\"get_number_options\",\"params\":[1,12]},\"second_dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"K\\u00eanh \\u0111\\u0103ng b\\u00e0i c\\u1ee7a m\\u1ee5c 2 (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"data-ref\":\"second_category_id\",\"required\":\"true\"},\"second_category_id\":{\"type\":\"crazyselect\",\"label\":\"Ch\\u1ee7 \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 2\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#second_dynamic_id\"},true],\"@label-type\":\"value\"},\"second_sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp c\\u1ee7a m\\u1ee5c 2 \",\"call\":\"get_post_sortby_options\"}}},{\"path\":\"home-grid-sidebar\",\"name\":\"Home: L\\u01b0\\u1edbi 2 m\\u1ee5c & sidebar\",\"inputs\":{\"first_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 1 (T\\u00f9y ch\\u1ecdn)\"},\"first_sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"first_bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 1\",\"call\":\"get_number_options\",\"params\":[1,12]},\"first_dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"K\\u00eanh \\u0111\\u0103ng b\\u00e0i c\\u1ee7a m\\u1ee5c 1 (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"data-ref\":\"first_category_id\",\"required\":\"true\"},\"first_category_id\":{\"type\":\"crazyselect\",\"label\":\"Ch\\u1ee7 \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 1\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#first_dynamic_id\"},true],\"@label-type\":\"value\"},\"first_sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp c\\u1ee7a m\\u1ee5c 1 \",\"call\":\"get_post_sortby_options\"},\"second_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 2 (T\\u00f9y ch\\u1ecdn)\"},\"second_sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"second_bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 2\",\"call\":\"get_number_options\",\"params\":[1,12]},\"second_dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"K\\u00eanh \\u0111\\u0103ng b\\u00e0i c\\u1ee7a m\\u1ee5c 2 (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"data-ref\":\"second_category_id\",\"required\":\"true\"},\"second_category_id\":{\"type\":\"crazyselect\",\"label\":\"Ch\\u1ee7 \\u0111\\u1ec1 c\\u1ee7a m\\u1ee5c 2\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#second_dynamic_id\"},true],\"@label-type\":\"value\"},\"second_sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp c\\u1ee7a m\\u1ee5c 2 \",\"call\":\"get_post_sortby_options\"},\"sidebar_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a sidebar (T\\u00f9y ch\\u1ecdn)\"},\"sidebar_link\":{\"type\":\"text\",\"label\":\"Url (T\\u00f9y ch\\u1ecdn)\"},\"sidebar_bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1 c\\u1ee7a sidebar\",\"call\":\"get_number_options\",\"params\":[1,12]},\"sidebar_dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"K\\u00eanh \\u0111\\u0103ng b\\u00e0i c\\u1ee7a sidebar (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"data-ref\":\"sidebar_category_id\",\"required\":\"true\"},\"sidebar_category_id\":{\"type\":\"crazyselect\",\"label\":\"Ch\\u1ee7 \\u0111\\u1ec1 c\\u1ee7a sidebar\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#sidebar_dynamic_id\"},true],\"@label-type\":\"value\"},\"sidebar_sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp c\\u1ee7a sidebar \",\"call\":\"get_post_sortby_options\"},\"sidebar_post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}}},{\"path\":\"home-intro\",\"name\":\"Home: Intro (Gi\\u1edbi thi\\u1ec7u)\",\"inputs\":{\"image\":{\"type\":\"file\",\"label\":\"\\u1ea2nh\"},\"text\":{\"type\":\"textarea\",\"label\":\"Text\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"button_text\":{\"type\":\"text\",\"label\":\"Button Text\"}},\"data\":{\"button_text\":\"Xem th\\u00eam\"}},{\"path\":\"home-list-sidebar-2\",\"name\":\"Home: Danh s\\u00e1ch & sidebar style 2\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1\",\"call\":\"get_number_options\",\"params\":[1,12]},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"group_by_category\":{\"type\":\"switch\",\"label\":\"Nh\\u00f3m theo danh m\\u1ee5c\",\"value_type\":\"boolean\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":5},\"sidebar_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 sidebar (T\\u00f9y ch\\u1ecdn)\"},\"sidebar_dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c \\u1edf sidebar (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"data-ref\":\"sidebar_category_id\",\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"sidebar_category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c \\u1edf sidebar\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#sidebar_dynamic_id\"},true],\"@label-type\":\"value\"},\"sidebar_sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp \\u1edf sidebar\",\"call\":\"get_post_sortby_options\"},\"sidebar_post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i \\u1edf sidebar\",\"min\":1,\"step\":1,\"default\":10},\"show_news_video\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb video m\\u1edbi nh\\u1ea5t\"}},\"data\":{\"sidebar_title\":\"Tin m\\u1edbi nh\\u1ea5t\"}},{\"path\":\"home-list-sidebar\",\"name\":\"Home: Danh s\\u00e1ch & sidebar\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1\",\"call\":\"get_number_options\",\"params\":[1,12,\"default\",\"default\"]},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"group_by_category\":{\"type\":\"switch\",\"label\":\"Nh\\u00f3m theo danh m\\u1ee5c\",\"value_type\":\"boolean\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":5},\"sidebar_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 sidebar (T\\u00f9y ch\\u1ecdn)\"},\"sidebar_post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i \\u1edf sidebar\",\"min\":1,\"step\":1,\"default\":10},\"sidebar_banner\":{\"type\":\"file\",\"label\":\"Sidebar Banner\"},\"sidebar_link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"ads_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i qu\\u1ea3ng c\\u00e1o\",\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"},\"ads_code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\",\"placeholder\":\"Nh\\u1eadp m\\u00e3 qu\\u1ea3ng c\\u00e1o\"}},\"data\":{\"sidebar_title\":\"Tin m\\u1edbi nh\\u1ea5t\"}},{\"path\":\"home-list-with-children-category\",\"name\":\"Home: Danh s\\u00e1ch & Menu danh m\\u1ee5c\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"bg_style\":{\"type\":\"crazyselect\",\"label\":\"N\\u1ec1n ti\\u00eau \\u0111\\u1ec1\",\"call\":\"get_number_options\",\"params\":[1,12]},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"children_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 danh m\\u1ee5c con\",\"min\":1,\"step\":1,\"default\":15},\"group_by_category\":{\"type\":\"switch\",\"label\":\"Nh\\u00f3m theo danh m\\u1ee5c\",\"value_type\":\"boolean\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":5},\"menu_type\":{\"type\":\"crazyselect\",\"label\":\"Ki\\u1ec3u menu\",\"data\":{\"children\":\"Danh m\\u1ee5c con\",\"menu\":\"Menu\"},\"default\":\"children\"},\"menu_id\":{\"type\":\"crazyselect\",\"label\":\"Menu\",\"call\":\"get_menu_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"]},\"sidebar_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 sidebar (T\\u00f9y ch\\u1ecdn)\"},\"sidebar_post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i \\u1edf sidebar\",\"min\":1,\"step\":1,\"default\":10}},\"data\":{\"sidebar_title\":\"Tin m\\u1edbi nh\\u1ea5t\"}},{\"path\":\"home-parallax\",\"name\":\"Home: Gi\\u00f3i thi\\u1ec7u (H\\u00ecnh n\\u1ec1n v\\u00e0 text)\",\"inputs\":{\"background\":{\"type\":\"file\",\"label\":\"\\u1ea2nh\"},\"medium_caption\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 tr\\u00ean (T\\u00f9y ch\\u1ecdn)\"},\"large_caption\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ch\\u00ednh\"},\"second_caption\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3 ng\\u1eafn\"}}},{\"path\":\"home-post-gallery\",\"name\":\"Home: Tin b\\u00e0i d\\u1ea1ng slider (Carousel Gallery)\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft trong ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"text\":{\"type\":\"text\",\"label\":\"Text c\\u1ee7a li\\u00ean k\\u1ebft trong ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"mark_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 b\\u00f4i m\\u00e0u (T\\u00f9y ch\\u1ecdn)\"},\"gallery_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 gallery (T\\u00f9y ch\\u1ecdn)\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"content_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i n\\u1ed9i dung\",\"call\":\"get_content_type_options\",\"params\":[\"T\\u1ea5t c\\u1ea3\"]},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}}},{\"path\":\"home-quote\",\"name\":\"Home: Quote - tr\\u00ednh d\\u1eabn\",\"inputs\":{\"label\":{\"type\":\"text\",\"label\":\"Nh\\u00e3n (T\\u00f9y ch\\u1ecdn)\"},\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\"},\"description\":{\"type\":\"text\",\"label\":\"M\\u00f4 t\\u1ea3 ()\"},\"image\":{\"type\":\"file\",\"label\":\"\\u1ea2nh\"},\"button_text\":{\"type\":\"text\",\"label\":\"Button Text\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"}},\"data\":{\"button_text\":\"Xem th\\u00eam\"}},{\"path\":\"home-videos\",\"name\":\"Home: Video\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 sidebar\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":3}}},{\"path\":\"parallax\",\"name\":\"Home: Parallax\",\"inputs\":{\"sub_title_before\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 nh\\u1ecf (t\\u00f9y ch\\u1ecdn)\"},\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ch\\u00ednh\"},\"sub_title_after\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (t\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3\"},\"background\":{\"type\":\"file\",\"label\":\"H\\u00ecnh n\\u1ec1n (T\\u00f9y ch\\u1ecdn)\"}}},{\"path\":\"posts-carousel\",\"name\":\"Tin b\\u00e0i d\\u1ea1ng slider (Carousel)\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"content_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i n\\u1ed9i dung\",\"call\":\"get_content_type_options\",\"params\":[\"T\\u1ea5t c\\u1ea3\"]},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}}},{\"path\":\"sidebar-ads\",\"name\":\"Sidebar: Banner qu\\u1ea3ng c\\u00e1o (400 x __)\",\"inputs\":{\"banner\":{\"type\":\"file\",\"label\":\"Banner\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"text\":{\"type\":\"text\",\"label\":\"Text\"},\"type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i qu\\u1ea3ng c\\u00e1o\",\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"},\"code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\",\"placeholder\":\"Nh\\u1eadp m\\u00e3 qu\\u1ea3ng c\\u00e1o\"}}},{\"path\":\"sidebar-calendar\",\"name\":\"Sidebar: L\\u1ecbch\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"lang\":{\"type\":\"radio\",\"label\":\"Ng\\u00f4n ng\\u1eef\",\"data\":{\"vi\":\"Ti\\u1ebfng Vi\\u1ec7t\",\"en\":\"Ti\\u1ebfng Anh\"},\"default\":\"vi\"}}},{\"path\":\"sidebar-newsletter\",\"name\":\"Sidebar: \\u0110\\u0103ng k\\u00fd nh\\u1eadn tin\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"V\\u00ed d\\u1ee5: \\u0110\\u0103ng k\\u00fd theo d\\u00f5i\"},\"placeholder\":{\"type\":\"text\",\"label\":\"Placeholder (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"V\\u00ed d\\u1ee5: Nh\\u1eadp email c\\u1ee7a b\\u1ea1n\"},\"button\":{\"type\":\"text\",\"label\":\"N\\u00fat \\u0111\\u0103ng k\\u00fd\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"}},\"data\":{\"title\":\"D\\u0103ng k\\u00fd nh\\u1eadn tin\",\"placeholder\":\"V\\u00ed d\\u1ee5: Nh\\u1eadp email c\\u1ee7a b\\u1ea1n\",\"button\":\"N\\u00fat \\u0111\\u0103ng k\\u00fd\"}},{\"path\":\"sidebar-post-list-1\",\"name\":\"Sidebar: Danh s\\u00e1ch tin b\\u00e0i (style 1)\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\",\"default\":\"Tin m\\u1edbi nh\\u1ea5t\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"content_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i n\\u1ed9i dung\",\"call\":\"get_content_type_options\",\"params\":[\"T\\u1ea5t c\\u1ea3\"]},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}}},{\"path\":\"sidebar-socials\",\"name\":\"Sidebar: Li\\u00ean k\\u1ebft m\\u1ea1ng x\\u00e3 h\\u1ed9i\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"V\\u00ed d\\u1ee5 k\\u1ebft n\\u1ed1i v\\u1edbi ch\\u00fang t\\u00f4i\"},\"facebook\":{\"type\":\"text\",\"label\":\"facebook (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"},\"twitter\":{\"type\":\"text\",\"label\":\"twitter (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"},\"youtube\":{\"type\":\"text\",\"label\":\"youtube (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"},\"linkedin\":{\"type\":\"text\",\"label\":\"Linkedin (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"},\"instagram\":{\"type\":\"text\",\"label\":\"instagram (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"},\"pinterest\":{\"type\":\"text\",\"label\":\"Pinterest (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y theo m\\u1ee5c li\\u00ean h\\u1ec7 h\\u1ecdc th\\u00f4ng tin website\"}},\"data\":{\"title\":\"K\\u1ebft n\\u1ed1i v\\u1edbi ch\\u00fang t\\u00f4i\"}},{\"path\":\"sidebar-weather\",\"name\":\"Sidebar: Th\\u00f4ng tin th\\u1eddi ti\\u1ebft\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"scale\":{\"type\":\"crazyselect\",\"label\":\"Thang nhi\\u1ec7u \\u0111\\u1ed9\",\"template\":\"crazyselect\",\"data\":{\"C\":\"\\u0110\\u1ed9 C\",\"F\":\"\\u0110\\u1ed9 F\"},\"required\":\"true\"},\"lat\":{\"type\":\"text\",\"label\":\"V\\u0129 \\u0111\\u1ed9 (latitude)\"},\"long\":{\"type\":\"text\",\"label\":\"V\\u0129 \\u0111\\u1ed9 (longitude)\"}}},{\"path\":\"single-related-posts\",\"name\":\"Chi ti\\u1ebft tin: Tin l\\u00ean quan\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5 (T\\u00f9y ch\\u1ecdn)\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"select\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"data\":{\"3\":3,\"6\":6,\"9\":0,\"12\":12},\"default\":3}}}]'),
(2, 'theme', 1, 'options', '{\"title\":\"247 News\",\"groups\":{\"styling\":{\"label\":\"Styling\",\"inputs\":{\"color\":{\"type\":\"colorselect\",\"label\":\"M\\u00e0u ch\\u1ee7 d\\u1ea1o\",\"@colors\":{\"red\":{\"text\":\"\\u0110\\u1ecf\",\"color\":\"#e4000d\",\"value\":\"red\"},\"blue\":{\"text\":\"Xanh da tr\\u1eddi\",\"color\":\"#53b1ff\",\"value\":\"blue\"},\"dark-blue\":{\"text\":\"Xanh da tr\\u1eddi \\u0110\\u1eadm\",\"color\":\"#00469a\",\"value\":\"dark-blue\"},\"green\":{\"text\":\"Xanh l\\u00e1\",\"color\":\"#4cb050\",\"value\":\"green\"},\"orange\":{\"text\":\"Cam\",\"color\":\"#fb8c00\",\"value\":\"orange\"},\"deep-orange\":{\"text\":\"Cam \\u0111\\u1ecf\",\"color\":\"#ff4011\",\"value\":\"deep-orange\"},\"turquoise\":{\"text\":\"Xanh san h\\u00f4\",\"color\":\"#39c9bb\",\"value\":\"turquoise\"},\"pink\":{\"text\":\"H\\u1ed3ng\",\"color\":\"#ea0253\",\"value\":\"pink\"},\"purple\":{\"text\":\"T\\u00edm\",\"color\":\"#6441a5\",\"value\":\"purple\"},\"slate\":{\"text\":\"X\\u00e1m l\\u00f4ng chu\\u1ed9t\",\"color\":\"#64666c\",\"value\":\"slate\"}},\"value\":\"blue\"},\"show_pageloader\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb page loader\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true}}},\"header\":{\"label\":\"Header\",\"inputs\":{\"show_text_logo\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb text logo\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"text_logo_primary\":{\"type\":\"text\",\"label\":\"Text Logo (ch\\u00ednh)\",\"value\":\"Tin T\\u1ee9c\"},\"text_logo_second\":{\"type\":\"text\",\"Label\":\"Text Logo (b\\u1ed5 xung)\",\"value\":\"24\\/7\"},\"highlight\":{\"type\":\"select\",\"label\":\"l\\u00e0m n\\u1ed5i b\\u1eadt\",\"data\":{\"none\":\"Kh\\u00f4ng\",\"primary\":\"Text ch\\u00ednh\",\"second\":\"Text ph\\u1ee5\",\"both\":\"T\\u1ea5t c\\u1ea3\"}},\"text_logo_slogan\":{\"type\":\"text\",\"Label\":\"Kh\\u1ea9u hi\\u1ec7u\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"},\"show_banner\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb banner qu\\u1ea3ng c\\u00e1o\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"banner_image\":{\"type\":\"file\",\"label\":\"Banner 720 x 90\",\"template\":\"cropit\",\"data-width\":720,\"data-height\":90},\"banner_alt\":{\"type\":\"text\",\"label\":\"Ch\\u00fa th\\u00edch banner\"},\"banner_link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"ads_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i qu\\u1ea3ng c\\u00e1o\",\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"},\"ads_code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\",\"placeholder\":\"Nhap76 m\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"show_datetime\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb th\\u1eddi gian\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"datetime_lang\":{\"type\":\"radio\",\"label\":\"Ng\\u00f4n ng\\u1eef\",\"data\":{\"vi\":\"Ti\\u1ebfng Vi\\u1ec7t\",\"en\":\"Ti\\u1ebfng Anh\"},\"value\":\"vi\"},\"date_format\":{\"type\":\"text\",\"label\":\"\\u0110\\u1ecbnh d\\u1ea1ng ng\\u00e0y th\\u00e1ng\",\"placeholder\":\"v\\u00ed d\\u1ee5: w, d\\/m\\/y\",\"comment\":\"trong \\u0111\\u00f3: %w l\\u00e0 ng\\u00e0y trong tu\\u1ea7n, %d l\\u00e0 ng\\u00e0y trong th\\u00e1ng, %m l\\u00e0 th\\u00e1ng b\\u00e0ng s\\u1ed1, %M l\\u00e0 th\\u00e1ng b\\u00e0ng t\\u00ean, %yy l\\u00e0 n\\u0103m\",\"value\":\"%w, ng\\u00e0y %d $M %y\"}},\"config\":{\"name\":\"Header\",\"layout_type\":\"single\",\"form_groups\":{\"logos\":{\"title\":\"Logo\",\"inputs\":[\"show_text_logo\",\"text_logo_primary\",\"text_logo_second\",\"highlight\",\"text_logo_slogan\"]},\"banner\":{\"title\":\"Banner qu\\u1ea3ng c\\u00e1o\",\"inputs\":[\"show_banner\",\"banner_image\",\"banner_alt\",\"banner_link\",\"ads_type\",\"ads_code\"]},\"datetime\":{\"title\":\"Ng\\u00e0y th\\u00e1ng\",\"inputs\":[\"show_datetime\",\"datetime_lang\",\"date_format\"]}}}},\"footer\":{\"label\":\"Footer\",\"inputs\":{\"news_footer\":{\"type\":\"area\",\"label\":\"footer Widget\",\"value\":\"news_footer\"},\"copyright\":{\"type\":\"text\",\"label\":\"Copyright\"},\"facebook\":{\"type\":\"text\",\"label\":\"Facebook\",\"placeholder\":\"Li\\u00ean k\\u1ebft Facebook\"},\"twitter\":{\"type\":\"text\",\"label\":\"Twitter\",\"placeholder\":\"Li\\u00ean k\\u1ebft Twitter\"},\"linkedin\":{\"type\":\"text\",\"label\":\"LinkedIn\",\"placeholder\":\"Li\\u00ean k\\u1ebft LinkedIn\"},\"youtube\":{\"type\":\"text\",\"label\":\"Youtube\",\"placeholder\":\"Li\\u00ean k\\u1ebft Youtube\"}}},\"sidebar\":{\"label\":\"Sidebar\",\"inputs\":{\"widgets\":{\"type\":\"area\",\"label\":\"Widgets\",\"value\":\"news_sidebar\"}}},\"home\":{\"label\":\"Trang ch\\u1ee7\",\"inputs\":{\"sections\":{\"type\":\"area\",\"label\":\"C\\u00e1c m\\u1ee5c xu\\u1ea5t hi\\u1ec7n tr\\u00ean trang ch\\u1ee7\",\"value\":\"home\"}}},\"contacts\":{\"label\":\"Li\\u00ean h\\u1ec7\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 gi\\u1edbi thi\\u1ec7u (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3 (T\\u00f9y ch\\u1ecdn)\"},\"show_map\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb B\\u1ea3n \\u0111\\u1ed3\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\"},\"place\":{\"type\":\"text\",\"label\":\"T\\u00ean \\u0111\\u1ecba \\u0111i\\u1ec3m\"},\"lat\":{\"type\":\"text\",\"label\":\"V\\u0129 \\u0111\\u1ed9 (latitude)\"},\"long\":{\"type\":\"text\",\"label\":\"V\\u0129 \\u0111\\u1ed9 (longitude)\"},\"map_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i b\\u1ea3n \\u0111\\u1ed3\",\"data\":{\"lib\":\"D\\u00f9ng th\\u01b0 vi\\u1ec7n\",\"code\":\"D\\u00f9ng m\\u00e3 nh\\u00fang\"},\"default\":\"lib\"},\"map_code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 nh\\u00fang b\\u1ea3n \\u0111\\u1ed3\",\"placeholder\":\"Nh\\u1eadp m\\u00e3 M\\u00e3 nh\\u00fang\"},\"email\":{\"type\":\"text\",\"Label\":\"Email\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"},\"phone_number\":{\"type\":\"text\",\"Label\":\"S\\u1ed1 \\u0111i\\u1ec7n tho\\u1ea1i\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"},\"address\":{\"type\":\"text\",\"Label\":\"\\u0110\\u1ecba ch\\u1ec9\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"},\"facebook\":{\"type\":\"text\",\"label\":\"facebook (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"},\"twitter\":{\"type\":\"text\",\"label\":\"twitter (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"},\"youtube\":{\"type\":\"text\",\"label\":\"youtube (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"},\"linkedin\":{\"type\":\"text\",\"label\":\"Linkedin (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"},\"instagram\":{\"type\":\"text\",\"label\":\"instagram (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"},\"pinterest\":{\"type\":\"text\",\"label\":\"Pinterest (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}},\"config\":{\"name\":\"Th\\u00f4ng tin trang li\\u00ean h\\u1ec7\",\"layout_type\":\"single\",\"form_groups\":[{\"title\":\"Trang li\\u00ean h\\u1ec7\",\"inputs\":[\"title\",\"description\",\"show_map\",\"place\",\"lat\",\"long\",\"map_type\",\"map_code\"]},{\"title\":\"Th\\u00f4ng tin li\\u00ean h\\u1ec7\",\"inputs\":[\"address\",\"phone_number\",\"email\"]},{\"title\":\"Li\\u00ean k\\u1ebft m\\u1ea1ng x\\u00e3 h\\u1ed9i\",\"inputs\":[\"facebook\",\"twitter\",\"youtube\",\"linkedin\",\"instagram\",\"pinterest\",\"tumblr\"]}]}},\"single\":{\"label\":\"Chi ti\\u1ebft tin\",\"inputs\":{\"show_banner\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb banner qu\\u1ea3ng c\\u00e1o\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"banner_image\":{\"type\":\"file\",\"label\":\"Banner 1248 x 130\"},\"banner_alt\":{\"type\":\"text\",\"label\":\"Ch\\u00fa th\\u00edch banner\"},\"banner_link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"ads_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i qu\\u1ea3ng c\\u00e1o\",\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"},\"ads_code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\",\"placeholder\":\"Nh\\u1eadp m\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"show_related_url\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb link c\\u00e1c tin b\\u00e0i li\\u00ean quan\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"single_post\":{\"type\":\"area\",\"label\":\"C\\u00e1c m\\u1ee5c b\\u1ed5 xung\",\"value\":\"single_post\"}}},\"page\":{\"label\":\"Chi ti\\u1ebft Page\",\"inputs\":{\"single_page\":{\"type\":\"area\",\"label\":\"C\\u00e1c m\\u1ee5c b\\u1ed5 xung\",\"value\":\"single_post\"}}}}}'),
(3, 'theme', 1, 'areas', '{\"news_footer\":\"Footer\",\"news_sidebar\":\"News Sidebar\",\"home\":\"Trang Ch\\u1ee7\",\"single_post\":\"Trang chi ti\\u1ebft b\\u00e0i vi\\u1ebft\",\"single_page\":\"Trang chi ti\\u1ebft page\"}'),
(4, 'theme', 1, 'layout', '{\"news_footer\":[{\"component\":\"footer-column-about\",\"data\":{\"title\":\"Gi\\u1edbi thi\\u1ec7u\",\"show_logo\":1,\"show_text_logo\":1}},{\"component\":\"footer-column-posts\",\"data\":{\"title\":\"Tin m\\u1edbi nh\\u1ea5t\",\"post_number\":4}},{\"component\":\"footer-column-posts\",\"data\":{\"title\":\"Ng\\u1eabu nhi\\u00ean\",\"post_number\":4,\"shorttype\":\"rand()\"}},{\"component\":\"footer-column-tags\",\"data\":{\"title\":\"Tags\",\"tag_number\":16,\"shorttype\":\"popuular\"}}],\"home\":[{\"component\":\"home-breaking-and-slider\",\"data\":{\"slider_sort_type\":1,\"slider_number_post\":16}},{\"component\":\"home-grid-list\",\"data\":{\"title\":\"Tin t\\u1ee9c\",\"sub_title\":\"n\\u1ed5i b\\u1eadt\",\"bg_style\":\"default\",\"sorttype\":\"rand()\",\"post_number\":4}},{\"component\":\"home-list-sidebar\",\"data\":{\"title\":\"Tin t\\u1ee9c\",\"sub_title\":\"m\\u1edbi nh\\u1ea5t\",\"bg_style\":4,\"sorttype\":1,\"post_number\":5,\"sidebar_title\":\"Tin m\\u1edbi nh\\u1ea5t\",\"sidebar_post_number\":20}},{\"component\":\"home-videos\",\"data\":{\"title\":\"Video\",\"sorttype\":1,\"post_number\":3}}],\"news_sidebar\":[{\"component\":\"sidebar-ads\",\"data\":[]},{\"component\":\"sidebar-post-list-1\",\"data\":{\"title\":\"Tin m\\u1edbi\",\"sorttype\":1,\"post_number\":20}},{\"component\":\"sidebar-calendar\",\"data\":{\"title\":\"L\\u1ecbch\",\"lang\":\"vi\"}},{\"component\":\"sidebar-weather\",\"data\":{\"title\":\"Th\\u1eddi ti\\u1ebft\",\"scale\":\"C\",\"lat\":\"\",\"long\":\"\"}},{\"component\":\"sidebar-newsletter\",\"data\":{\"title\":\"D\\u0103ng k\\u00fd nh\\u1eadn tin\",\"placeholder\":\"V\\u00ed d\\u1ee5: Nh\\u1eadp email c\\u1ee7a b\\u1ea1n\",\"button\":\"N\\u00fat \\u0111\\u0103ng k\\u00fd\"}},{\"component\":\"sidebar-socials\",\"data\":{\"title\":\"K\\u1ebft n\\u1ed1i v\\u1edbi ch\\u00fang t\\u00f4i\",\"facebook\":\"#\",\"twitter\":\"#\",\"youtube\":\"#\",\"instagram\":\"#\"}}],\"single_post\":[{\"component\":\"single-related\",\"data\":{\"post_number\":3}},{\"component\":\"block-ads-wide\",\"data\":[]}]}'),
(5, 'theme', 1, 'menus', '{\"positions\":{\"topleft\":\"Top Left\",\"topright\":\"Top Right\"},\"menus\":{\"topleft\":{\"name\":\"Li\\u00ean h\\u1ec7\",\"type\":\"theme\",\"depth\":1,\"positions\":[\"topleft\"],\"items\":[{\"type\":\"url\",\"text\":\"\",\"url\":\"#\",\"link_class\":\"faxebook\",\"icon\":\"fa fa-facebook\"},{\"type\":\"url\",\"text\":\"\",\"url\":\"#\",\"link_class\":\"twitter\",\"icon\":\"fa fa-twitter\"},{\"type\":\"url\",\"text\":\"\",\"url\":\"#\",\"link_class\":\"youtube\",\"icon\":\"fa fa-youtube\"},{\"type\":\"url\",\"text\":\"\",\"url\":\"#\",\"link_class\":\"linkedin\",\"icon\":\"fa fa-linkedin\"},{\"type\":\"url\",\"text\":\"\",\"url\":\"#\",\"link_class\":\"instagram\",\"icon\":\"fa fa-instagram\"},{\"type\":\"url\",\"text\":\"(+84) 945.786.960\",\"url\":\"tel:0945786960\",\"class\":\"address\",\"icon\":\"fa fa-phone\"},{\"type\":\"url\",\"text\":\"doanln16@gmail.com\",\"url\":\"mailto:doanln16@gmail.com\",\"class\":\"address\",\"icon\":\"fa fa-envelope-o\"}]},\"topright\":{\"name\":\"Top Right\",\"type\":\"theme\",\"depth\":1,\"positions\":[\"topright\"],\"items\":[{\"type\":\"url\",\"text\":\"\",\"url\":\"#\",\"class\":\"contact\",\"icon\":\"fa fa-map-marker fa-i\"},{\"type\":\"url\",\"text\":\"\",\"url\":\"#\",\"class\":\"about\",\"icon\":\"fa fa-user fa-i\"}]}}}'),
(6, 'data', 0, 'theme_active_list', '[1,2,3]'),
(7, 'theme', 2, 'components', '[{\"path\":\"package-item\",\"name\":\"G\\u00f3i d\\u1ecbch v\\u1ee5 (Package Item)\",\"inputs\":{\"name\":{\"type\":\"text\",\"label\":\"T\\u00ean g\\u00f3i\",\"placeholder\":\"V\\u00ed d\\u1ee5: Tin t\\u1ee9c\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3 ng\\u1eafn\",\"placeholder\":\"V\\u00ed d\\u1ee5: 1 n\\u0103m b\\u1ea3o h\\u00e0nh\\nMi\\u1ec3n ph\\u00ed hosting\\nNi\\u1ec5n ph\\u00ed t\\u00ean mi\\u1ec1n\\n...\"},\"price_text\":{\"type\":\"text\",\"label\":\"Gi\\u00e1\",\"value\":\"0\"},\"active\":{\"type\":\"switch\",\"label\":\"N\\u1ed5i b\\u1eadt\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft\"},\"btn_text\":{\"type\":\"text\",\"label\":\"N\\u00fat xem th\\u00eam\",\"value\":\"\\u0110\\u0103ng k\\u00fd\"},\"class_name\":{\"type\":\"text\",\"label\":\"Class Name\",\"value\":\"col-md-6\"}}},{\"path\":\"promo-item\",\"name\":\"Promo Item\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\"},\"description\":{\"type\":\"text\",\"label\":\"M\\u00f4 t\\u1ea3 ng\\u1eafn\"},\"icon\":{\"type\":\"text\",\"label\":\"Icon ClassName\",\"placeholder\":\"V\\u00ed d\\u1ee5: ti-vector\"}}},{\"path\":\"service-item\",\"name\":\"D\\u1ecbch v\\u1ee5 (service item)\",\"inputs\":{\"name\":{\"type\":\"text\",\"label\":\"T\\u00ean d\\u1ecbch v\\u1ee5\",\"placeholder\":\"V\\u00ed d\\u1ee5: thi\\u1ebft k\\u1ebf website\"},\"description\":{\"type\":\"text\",\"label\":\"M\\u00f4 t\\u1ea3 ng\\u1eafn\",\"value\":\"\",\"placeholder\":\"\"},\"use_label\":{\"type\":\"switch\",\"label\":\"Th\\u00eam nh\\u00e3n\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\"},\"label_text\":{\"type\":\"text\",\"label\":\"Nh\\u00e3n\",\"value\":\"\",\"placeholder\":\"V\\u00ed d\\u1ee5 Good\"},\"label_class\":{\"type\":\"crazyselect\",\"label\":\"Lo\\u1ea1i nh\\u00e3n\",\"value\":\"success\",\"data\":{\"success\":\"Success (Xanh l\\u00e1)\",\"danger\":\"Danger (\\u0110\\u1ecf)\"}},\"icon\":{\"type\":\"text\",\"label\":\"Icon ClassName\",\"placeholder\":\"V\\u00ed d\\u1ee5: fa fa-bolt\",\"value\":\"fa fa-bolt\"}}},{\"path\":\"team-member\",\"name\":\"Th\\u00e0nh vi\\u00ean trong nh\\u00f3m (team member)\",\"inputs\":{\"name\":{\"type\":\"text\",\"label\":\"T\\u00ean th\\u00e0nh vi\\u00ean\",\"placeholder\":\"V\\u00ed d\\u1ee5: Thi\\u1ec7n CH\"},\"avatar\":{\"type\":\"file\",\"label\":\"Avatar\"},\"job\":{\"type\":\"text\",\"label\":\"c\\u00f4ng vi\\u1ec7c (V\\u1ecb tr\\u00ed l\\u00e0m vi\\u1ec7c)\"},\"is_loader\":{\"type\":\"switch\",\"label\":\"Tr\\u01b0\\u1edfng nh\\u00f3m?\",\"value_type\":\"boolean\"}}},{\"path\":\"testimonial-item\",\"name\":\"Th\\u00f4ng tin ph\\u1ea3n h\\u1ed3i (Testimonial item)\",\"inputs\":{\"name\":{\"type\":\"text\",\"label\":\"t\\u00ean ng\\u01b0\\u1eddi ph\\u1ea3n h\\u1ed3i\",\"placeholder\":\"V\\u00ed d\\u1ee5: Nguy\\u1ec5n V\\u0103n A\"},\"image\":{\"type\":\"file\",\"label\":\"\\u00c3nh \\u0111\\u1ea1i di\\u1ec7n\"},\"job\":{\"type\":\"text\",\"label\":\"C\\u00f4ng vi\\u1ec7c\",\"placeholder\":\"V\\u00ed d\\u1ee5: CEO\"},\"content\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3 ng\\u1eafn\",\"placeholder\":\"V\\u00ed d\\u1ee5: Very grateful to have found this app. D&L team did a fantastic job...\"}},\"data\":[]}]');
INSERT INTO `metadatas` (`id`, `ref`, `ref_id`, `name`, `value`) VALUES
(8, 'theme', 2, 'options', '{\"title\":\"Bize\",\"groups\":{\"hero\":{\"label\":\"Banner\",\"inputs\":{\"show\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb Text Slider (hero) \",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"background\":{\"type\":\"file\",\"Label\":\"H\\u00ecnh n\\u1ec1n\"},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 tr\\u00ean\",\"value\":\"Connecting to the future\"},\"static_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 t\\u0129nh\",\"value\":\"We are\"},\"typed_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 \\u0111\\u1ed9ng (typed text)\",\"value\":\"Web Developer, Web Designer\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"value\":\"Our work is the presentation of our capabilities. Professionally myocardinate\\n high standards in infrastructures and focused solutions. Completely actualize\\n multifunctional best practices\",\"placeholder\":\"Nh\\u1eadp m\\u00f4 t\\u1ea3\"},\"button_link\":{\"type\":\"text\",\"label\":\"Button Link\",\"value\":\"#service\"},\"button_text\":{\"type\":\"text\",\"label\":\"Button Text\",\"value\":\"Our Services\"}}},\"promo\":{\"label\":\"Promo\",\"inputs\":{\"show\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb promo \",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"extra_class\":{\"type\":\"text\",\"label\":\"Extra class\",\"value\":\"\",\"placeholder\":\"V\\u00ed d\\u1ee5: bg-gray\"},\"promos\":{\"type\":\"area\",\"label\":\"Promo Items\",\"value\":\"promos\"}}},\"about\":{\"label\":\"Gi\\u1edbi thi\\u1ec7u\",\"inputs\":{\"show\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb ph\\u1ea7n gi\\u1edbi thi\\u1ec7u \",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"section_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 section\",\"value\":\"Gi\\u1edbi thi\\u1ec7u\"},\"page_id\":{\"type\":\"crazyselect\",\"label\":\"Trang gi\\u1edbi thi\\u1ec7u (t\\u00f9y ch\\u1ecdn)\",\"call\":\"get_page_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"]},\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 gi\\u1edbi thi\\u1ec7u\",\"value\":\"\\u0110\\u00f4i n\\u00e9t v\\u1ec1 ch\\u00fang t\\u00f4i\"},\"description\":{\"type\":\"ckeditor\",\"label\":\"N\\u1ed9i dung Gi\\u1edbi thi\\u1ec7u\",\"height\":\"200\"},\"image\":{\"type\":\"file\",\"label\":\"\\u1ea2nh minh h\\u1ecda\"}}},\"services\":{\"label\":\"D\\u1ecbch v\\u1ee5\",\"inputs\":{\"show\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb ph\\u1ea7n d\\u1ecbch v\\u1ee5 \",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 nh\\u1ecf (t\\u00f9y ch\\u1ecdn)\",\"value\":\"\"},\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\",\"value\":\"D\\u1ecbch v\\u1ee5\"},\"services\":{\"type\":\"area\",\"label\":\"C\\u00e1c d\\u1ecbch v\\u1ee5\",\"value\":\"services\"}}},\"projects\":{\"label\":\"D\\u1ef1 \\u00e1n\",\"inputs\":{\"show\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb m\\u1ee5c D\\u1ef1 \\u00e1n\",\"props\":{\"check_label\":\"C\\u00f3\"},\"value_type\":\"boolean\",\"value\":true},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5\"},\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\",\"value\":\"D\\u1ef1 \\u00e1n\"},\"sorttype\":{\"type\":\"crazyselect\",\"label\":\"Ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_project_sortby_options\",\"value\":1},\"project_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 l\\u01b0\\u1ee3ng\",\"value\":10}}},\"pricing\":{\"label\":\"B\\u00e1o gi\\u00e1\",\"inputs\":{\"show\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb trang B\\u00e1o gi\\u00e1\",\"props\":{\"check_label\":\"C\\u00f3\"},\"value_type\":\"boolean\",\"value\":true},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5\"},\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\",\"value\":\"B\\u1ea3ng gi\\u00e1\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3 \"},\"layout\":{\"type\":\"crazyselect\",\"label\":\"Layout\",\"data\":{\"1\":\"4 \\/ 7\",\"2\":\"4 \\/ 8\",\"3\":\"3 \\/ 8\",\"4\":\"3 \\/ 9\"},\"value\":1},\"tab_active\":{\"type\":\"radio\",\"label\":\"Tab k\\u00edch ho\\u1ea1t\",\"data\":{\"1\":\"Tab 1\",\"2\":\"Tab 2\",\"3\":\"Tab 3\"}},\"tab_1_show\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb Tab 1\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\",\"value\":true},\"tab_1_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 tab 1\",\"value\":\"Basic\"},\"tab_1_packages\":{\"type\":\"area\",\"label\":\"C\\u00e1c g\\u00f3i trong tab 1\",\"value\":\"tab_1_packages\"},\"tab_2_show\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb Tab 2\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\"},\"tab_2_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 tab 2\",\"value\":\"\"},\"tab_2_packages\":{\"type\":\"area\",\"label\":\"C\\u00e1c g\\u00f3i trong tab 2\",\"value\":\"tab_2_packages\"},\"tab_3_show\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb Tab 3\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\"},\"tab_3_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 tab 3\"},\"tab_3_packages\":{\"type\":\"area\",\"label\":\"C\\u00e1c g\\u00f3i trong tab 3\",\"value\":\"tab_3_packages\"}}},\"testimonials\":{\"label\":\"Testimonials\",\"inputs\":{\"show\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb Testimonials\",\"value_type\":\"boolean\",\"value\":true},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5\"},\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\",\"value\":\"Ph\\u1ea3n h\\u1ed3i t\\u1eeb kh\\u00e1ch h\\u00e0ng\"},\"background\":{\"type\":\"file\",\"Label\":\"H\\u00ecnh n\\u1ec1n\"},\"list_type\":{\"type\":\"radio\",\"label\":\"Ki\\u1ec3u danh s\\u00e1ch\",\"props\":{\"data\":{\"data\":\"Trong b\\u1ea3ng ph\\u1ea3n h\\u1ed3i\",\"custom\":\"Danh s\\u00e1ch t\\u00f9y bi\\u1ebfn\"}},\"value\":\"custom\"},\"item_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 l\\u01b0\\u1ee3ng\",\"value\":0},\"sort_type\":{\"type\":\"crazyselect\",\"label\":\"S\\u1eafp x\\u1ebfp\",\"props\":{\"data\":{\"id-ASC\":\"M\\u1eb7c \\u0111\\u1ecbnh\",\"id-DESC\":\"M\\u1edbi nh\\u1ea5t\",\"name-ASC\":\"h\\u1ee9 t\\u1ef1 b\\u1ea3ng ch\\u1ef1 c\\u00e1i\"}},\"value\":\"id-ASC\"},\"testimonials\":{\"type\":\"area\",\"label\":\"Danh s\\u00e1ch ph\\u1ea3n h\\u1ed3i t\\u00f9y bi\\u1ebfn\",\"value\":\"testimonials\",\"props\":{\"@title-by\":\"name\"}}}},\"team\":{\"label\":\"Team\",\"inputs\":{\"show\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb Nh\\u00f3m l\\u00e0m vi\\u1ec7c\",\"value_type\":\"boolean\",\"value\":true},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5\"},\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\",\"value\":\"Team\"},\"list_type\":{\"type\":\"radio\",\"label\":\"Ki\\u1ec3u danh s\\u00e1ch\",\"props\":{\"data\":{\"data\":\"Trong b\\u1ea3ng Nh\\u00f3m\",\"custom\":\"Danh s\\u00e1ch t\\u00f9y bi\\u1ebfn\"}},\"value\":\"custom\"},\"team_id\":{\"type\":\"crazyselect\",\"label\":\"Nh\\u00f3m\",\"call\":\"get_team_options\",\"params\":[[],\"Ch\\u1ecdn nh\\u00f3m\"]},\"item_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 l\\u01b0\\u1ee3ng\",\"value\":4},\"sort_type\":{\"type\":\"crazyselect\",\"label\":\"S\\u1eafp x\\u1ebfp\",\"props\":{\"data\":{\"id-ASC\":\"M\\u1eb7c \\u0111\\u1ecbnh\",\"id-DESC\":\"M\\u1edbi nh\\u1ea5t\",\"users.name-ASC\":\"th\\u1ee9 t\\u1ef1 b\\u1ea3ng ch\\u1ef1 c\\u00e1i\",\"is_leader-DESC\":\"\\u01afu ti\\u00ean tr\\u01b0\\u1edfng nh\\u00f3m\",\"job-ASC\":\"C\\u00f4ng vi\\u1ec7c (A-z)\",\"rand()\":\"Ng\\u1eabu nhi\\u00ean\"}},\"value\":\"id-ASC\"},\"members\":{\"type\":\"area\",\"label\":\"Danh s\\u00e1ch th\\u00e0nh vi\\u00ean t\\u00f9y bi\\u1ebfn\",\"value\":\"team_members\",\"props\":{\"@title-by\":\"name\"}}}},\"contact\":{\"label\":\"Li\\u00ean h\\u1ec7\",\"inputs\":{\"show\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb m\\u1ee5c li\\u00ean h\\u1ec7\",\"props\":{\"check_label\":\"C\\u00f3\"},\"value_type\":\"boolean\",\"value\":true},\"sub_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 ph\\u1ee5\"},\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\",\"value\":\"D\\u1ef1 \\u00e1n\"},\"button_text\":{\"type\":\"text\",\"label\":\"N\\u00fat g\\u1eedi\",\"value\":\"G\\u1eedi li\\u00ean h\\u1ec7\"},\"project_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 l\\u01b0\\u1ee3ng\",\"value\":10}}},\"footer\":{\"label\":\"Footer\",\"inputs\":{\"copyright\":{\"type\":\"text\",\"label\":\"Tuy\\u00ean b\\u1ed1 b\\u1ea3n quy\\u1ec1n\"},\"show_socials\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb MXH\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\"},\"facebook\":{\"type\":\"text\",\"label\":\"Facebook\",\"placeholder\":\"Li\\u00ean k\\u1ebft Facebook\"},\"twitter\":{\"type\":\"text\",\"label\":\"Twitter\",\"placeholder\":\"Li\\u00ean k\\u1ebft Twitter\"},\"linkedin\":{\"type\":\"text\",\"label\":\"LinkedIn\",\"placeholder\":\"Li\\u00ean k\\u1ebft LinkedIn\"},\"youtube\":{\"type\":\"text\",\"label\":\"Youtube\",\"placeholder\":\"Li\\u00ean k\\u1ebft Youtube\"}}}}}'),
(9, 'theme', 2, 'areas', '{\"promos\":\"Promo Area\",\"services\":\"C\\u00e1c d\\u1ecbch v\\u1ee5\",\"clients\":\"Danh s\\u00e1ch kh\\u00e1ch h\\u00e0ng\",\"testimonials\":\"Danh s\\u00e1ch ph\\u1ea3n h\\u1ed3i\",\"tab_1_packages\":\"G\\u00f3i d\\u1ecbch v\\u1ee5 tab 1\",\"tab_2_packages\":\"G\\u00f3i d\\u1ecbch v\\u1ee5 tab 2\",\"tab_3_packages\":\"G\\u00f3i d\\u1ecbch v\\u1ee5 tab 3\",\"team_members\":\"Nh\\u00f3m l\\u00e0m vi\\u1ec7c\"}'),
(10, 'theme', 2, 'layout', '[]'),
(11, 'theme', 2, 'menus', '{\"positions\":{\"bize\":\"Bize\"},\"menus\":{\"bize\":{\"name\":\"Menu Bize\",\"type\":\"theme\",\"positions\":[\"primary\",\"bize\"],\"items\":[{\"text\":\"Home\",\"type\":\"url\",\"url\":\"#main\"},{\"text\":\"Gi\\u1edbi thi\\u1ec7u\",\"type\":\"url\",\"url\":\"#about\"},{\"text\":\"D\\u1ecbch v\\u1ee5\",\"type\":\"url\",\"url\":\"#service\"},{\"text\":\"C\\u00e1c d\\u1ef1 \\u00e1n\",\"type\":\"url\",\"url\":\"#work\"},{\"text\":\"Nh\\u00f3m l\\u00e0m vi\\u1ec7c\",\"type\":\"url\",\"url\":\"#team\"},{\"text\":\"Li\\u00ean h\\u1ec7\",\"type\":\"url\",\"url\":\"#contact\"}]}}}'),
(12, 'dynamic', 1, 'default_fields', '[\"title\",\"slug\",\"description\",\"content_type\",\"content\",\"gallery\",\"video_url\",\"source\",\"feature_image\",\"meta_title\",\"meta_description\",\"keywords\",\"tags\",\"privacy\"]'),
(13, 'dynamic', 1, 'advance_props', '[]'),
(14, 'dynamic', 1, 'custom_slug', '0'),
(15, 'dynamic', 1, 'prop_inputs', '[]'),
(16, 'dynamic', 1, 'form_config', '{\"name\":\"Th\\u00f4ng tin L\\u00ea Ng\\u1ecdc Do\\u00e3n\",\"layout_type\":\"column\",\"form_groups\":[{\"title\":\"Th\\u00f4ng tin c\\u01a1 b\\u1ea3n\",\"class\":\"col-12 col-lg-7\",\"inputs\":[\"title\",\"slug\",\"category_id\",\"description\"]},{\"title\":\"\\u1ea2nh v\\u00e0 ri\\u00eang t\\u01b0\",\"class\":\"col-12 col-lg-5\",\"inputs\":[\"feature_image\"]},{\"title\":\"Th\\u00f4ng tim chi ti\\u1ebft\",\"class\":\"col-12\",\"inputs\":[\"content\",\"content_type\",\"video_url\",\"gallery\",\"source\"]},{\"title\":\"Th\\u00f4ng tim SEO\",\"class\":\"col-12 col-lg-6\",\"inputs\":[\"meta_title\",\"meta_description\",\"keywords\"]},{\"title\":\"\",\"class\":\"col-12 col-lg-6\",\"inputs\":[\"tags\",\"privacy\"]}]}'),
(17, 'theme', 3, 'components', '{\"contacts.area\":{\"name\":\"Home: M\\u1ee5c li\\u00ean h\\u1ec7\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"faq_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 FAQ (T\\u00f9y ch\\u1ecdn)\"}},\"path\":\"contacts.area\"},\"contacts.faq\":{\"name\":\"M\\u1ee5c li\\u00ean h\\u1ec7 - FAQ\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 \"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"}},\"path\":\"contacts.faq\"},\"footer.about\":{\"name\":\"Footer: Gi\\u1edbi thi\\u1ec7u\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"Gi\\u1edbi thi\\u1ec7u\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"}},\"path\":\"footer.about\"},\"footer.contact\":{\"name\":\"Footer: Li\\u00ean h\\u1ec7\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"email\":{\"type\":\"text\",\"Label\":\"Email\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb m\\u1ee5c li\\u00ean h\\u1ec7\"},\"phone_number\":{\"type\":\"text\",\"Label\":\"S\\u1ed1 \\u0111i\\u1ec7n tho\\u1ea1i\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb m\\u1ee5c li\\u00ean h\\u1ec7\"},\"address\":{\"type\":\"text\",\"Label\":\"\\u0110\\u1ecba ch\\u1ec9\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb m\\u1ee5c li\\u00ean h\\u1ec7\"}},\"path\":\"footer.contact\"},\"footer.limks\":{\"name\":\"Footer: Li\\u00ean k\\u1ebft \\/ menu\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"menu_id\":{\"type\":\"crazyselect\",\"label\":\"Menu\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"call\":\"get_menu_options\"}},\"path\":\"footer.limks\"},\"footer.possts\":{\"name\":\"Footer: Danh s\\u00e1ch b\\u00e0i vi\\u1ebft\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":4}},\"path\":\"footer.possts\"},\"home.about.style-1\":{\"name\":\"Home: Gi\\u1edbi thi\\u1ec7u\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"content\":{\"type\":\"textarea\",\"label\":\"Gi\\u1edbi thi\\u1ec7u\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"image\":{\"type\":\"file\",\"label\":\"\\u1ea2nh minh h\\u1ecda\"},\"youtube_url\":{\"type\":\"text\",\"label\":\"Video Youtube\"},\"services\":{\"type\":\"textarea\",\"label\":\"D\\u1ecbch v\\u1ee5 n\\u1edfi b\\u1eadt\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\\nM\\u1ed5i d\\u1ecbch v\\u1ee5 m\\u1ed9t d\\u00f2ng\",\"className\":\"auto-height\"}},\"path\":\"home.about.style-1\"},\"home.banners.style-1\":{\"name\":\"Home: banner > Style 1\",\"inputs\":{\"slider_id\":{\"type\":\"crazyselect\",\"label\":\"Slider\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"call\":\"get_slider_options\"},\"btn_text\":{\"type\":\"text\",\"label\":\"N\\u00fat b\\u1ea5m\",\"placeholder\":\"Ch\\u1eef s\\u1ebd \\u0111\\u01b0\\u1ee3c hi\\u1ec3n th\\u1ecb tr\\u00ean n\\u00fat xem th\\u00eam\"}},\"path\":\"home.banners.style-1\"},\"home.contact.area\":{\"name\":\"Home: M\\u1ee5c li\\u00ean h\\u1ec7\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"faq_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 FAQ (T\\u00f9y ch\\u1ecdn)\"}},\"path\":\"home.contact.area\"},\"home.contact.faq\":{\"name\":\"Home: M\\u1ee5c li\\u00ean h\\u1ec7 - FAQ\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 \"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"}},\"path\":\"home.contact.faq\"},\"home.facts\":{\"name\":\"Home: Facts\",\"inputs\":{\"fact_1\":{\"type\":\"textarea\",\"label\":\"Fact 1\",\"placeholder\":\"Ti\\u00eau \\u0111\\u1ec1 (ho\\u1eb7c s\\u1ed1)...\\nTi\\u00eau \\u0111\\u1ec1 ph\\u1ee5..\\nN\\u1ed9i dung... \",\"className\":\"auto-height\"},\"fact_2\":{\"type\":\"textarea\",\"label\":\"Fact 2\",\"placeholder\":\"Ti\\u00eau \\u0111\\u1ec1 (ho\\u1eb7c s\\u1ed1)...\\nTi\\u00eau \\u0111\\u1ec1 ph\\u1ee5..\\nN\\u1ed9i dung... \",\"className\":\"auto-height\"},\"line_1\":{\"type\":\"text\",\"label\":\"Ti\\u1ebfn tr\\u00ecnh 1\",\"placeholder\":\"Ti\\u00eau \\u0111\\u1ec1 = s\\u1ed1 (%)\"},\"line_2\":{\"type\":\"text\",\"label\":\"Ti\\u1ebfn tr\\u00ecnh 2\",\"placeholder\":\"Ti\\u00eau \\u0111\\u1ec1 = s\\u1ed1 (%)\"},\"line_3\":{\"type\":\"text\",\"label\":\"Ti\\u1ebfn tr\\u00ecnh 3\",\"placeholder\":\"Ti\\u00eau \\u0111\\u1ec1 = s\\u1ed1 (%)\"}},\"path\":\"home.facts\"},\"home.portfolio\":{\"name\":\"Home: Portfolio\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\",\"value\":\"D\\u1ef1 \\u00e1n\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"sorttype\":{\"type\":\"crazyselect\",\"label\":\"Ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_project_sortby_options\",\"value\":1},\"project_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 l\\u01b0\\u1ee3ng\",\"value\":10}},\"path\":\"home.portfolio\"},\"home.posts\":{\"name\":\"Home: Danh s\\u00e1ch b\\u00e0i vi\\u1ebft\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3 (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"background\":{\"type\":\"file\",\"label\":\"H\\u00ecnh n\\u1ec1n (T\\u00f9y ch\\u1ecdn)\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"group_by_category\":{\"type\":\"switch\",\"label\":\"Nh\\u00f3m theo danh m\\u1ee5c\",\"value_type\":\"boolean\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":3}},\"path\":\"home.posts\"},\"home.pricing.area\":{\"name\":\"Home: B\\u00e1o gi\\u00e1 (area)\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"}},\"path\":\"home.pricing.area\"},\"home.pricing.item\":{\"name\":\"Home: B\\u00e1o gi\\u00e1 (item)\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\",\"placeholder\":\"V\\u00ed d\\u1ee5: Th\\u01b0\\u01a1ng m\\u1ea1i \\u0111i\\u1ec7n t\\u1eed\"},\"label\":{\"type\":\"text\",\"label\":\"Nh\\u00e3n (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"V\\u00ed d\\u1ee5: HOT\"},\"price_label\":{\"type\":\"text\",\"label\":\"Nh\\u00e3n gi\\u00e1 (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"V\\u00ed d\\u1ee5: Ch\\u1ec9 t\\u1eeb\",\"default\":\"Ch\\u1ec9 t\\u1eeb\"},\"price\":{\"type\":\"number\",\"label\":\"Gi\\u00e1\",\"default\":0,\"min\":0},\"unit\":{\"type\":\"text\",\"label\":\"\\u0110\\u01a1n v\\u1ecb ti\\u1ec1n\",\"placeholder\":\"V\\u00ed d\\u1ee5: VN\\u0110, $, ...\",\"default\":\"VN\\u0110\"},\"content\":{\"type\":\"textarea\",\"label\":\"N\\u1ed9i dung (danh s\\u00e1ch t\\u00ednh n\\u0103ng)\",\"placeholder\":\"V\\u00ed d\\u1ee5: [true] Mi\\u1ec3n ph\\u00ed hosting\\n[false] Gi\\u1edbi h\\u1ea1n t\\u00ean mi\\u1ec1n\",\"className\":\"auto-height\"},\"active\":{\"type\":\"switch\",\"label\":\"Active (k\\u00edch ho\\u1ea1t)\",\"value_type\":\"boolean\"},\"link\":{\"type\":\"text\",\"label\":\"Link \\u0111\\u0103ng k\\u00fd\",\"placeholder\":\"Nh\\u1eadp link\"}},\"path\":\"home.pricing.item\"},\"home.services.area\":{\"name\":\"Home: C\\u00e1c d\\u1ecbch v\\u1ee5 (Service Area)\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"}},\"path\":\"home.services.area\"},\"home.services.item\":{\"name\":\"Home: D\\u1ecbch v\\u1ee5 (Service Item)\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 \"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"link\":{\"type\":\"text\",\"label\":\"\\u0110\\u01b0\\u1eddng d\\u1eabn\"},\"icon\":{\"type\":\"text\",\"label\":\"Bi\\u1ec3u t\\u01b0\\u1ee3ng (ti-...)\",\"template\":\"iconpicker\"}},\"path\":\"home.services.item\"},\"home.team.area\":{\"name\":\"Home: Team (area)\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"background\":{\"type\":\"file\",\"label\":\"H\\u00ecnh n\\u1ec1n (T\\u00f9y ch\\u1ecdn)\"},\"list_type\":{\"type\":\"radio\",\"label\":\"Ki\\u1ec3u danh s\\u00e1ch\",\"data\":{\"data\":\"Trong b\\u1ea3ng Nh\\u00f3m\",\"custom\":\"Danh s\\u00e1ch t\\u00f9y bi\\u1ebfn\"},\"value\":\"custom\"},\"team_id\":{\"type\":\"crazyselect\",\"label\":\"Nh\\u00f3m\",\"call\":\"get_team_options\",\"params\":[[],\"Ch\\u1ecdn nh\\u00f3m\"]},\"item_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 l\\u01b0\\u1ee3ng\",\"value\":4},\"sort_type\":{\"type\":\"crazyselect\",\"label\":\"S\\u1eafp x\\u1ebfp\",\"data\":{\"id-ASC\":\"M\\u1eb7c \\u0111\\u1ecbnh\",\"id-DESC\":\"M\\u1edbi nh\\u1ea5t\",\"users.name-ASC\":\"th\\u1ee9 t\\u1ef1 b\\u1ea3ng ch\\u1ef1 c\\u00e1i\",\"is_leader-DESC\":\"\\u01afu ti\\u00ean tr\\u01b0\\u1edfng nh\\u00f3m\",\"job-ASC\":\"C\\u00f4ng vi\\u1ec7c (A-z)\",\"rand()\":\"Ng\\u1eabu nhi\\u00ean\"},\"value\":\"id-ASC\"}},\"path\":\"home.team.area\"},\"home.team.item\":{\"name\":\"Home: Team Member\",\"inputs\":{\"name\":{\"type\":\"text\",\"label\":\"T\\u00ean th\\u00e0nh vi\\u00ean\",\"placeholder\":\"V\\u00ed d\\u1ee5: Thi\\u1ec7n CH\"},\"avatar\":{\"type\":\"file\",\"label\":\"Avatar\"},\"job\":{\"type\":\"text\",\"label\":\"c\\u00f4ng vi\\u1ec7c (V\\u1ecb tr\\u00ed l\\u00e0m vi\\u1ec7c)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"link\":{\"type\":\"text\",\"label\":\"Li\\u00ean k\\u1ebft (T\\u00f9y ch\\u1ecdn)\"},\"is_loader\":{\"type\":\"switch\",\"label\":\"Tr\\u01b0\\u1edfng nh\\u00f3m?\",\"value_type\":\"boolean\"}},\"path\":\"home.team.item\"},\"home.testimonials.area\":{\"name\":\"Home: Testimonials (area)\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3...\",\"className\":\"auto-height\"},\"list_type\":{\"type\":\"radio\",\"label\":\"Ki\\u1ec3u danh s\\u00e1ch\",\"data\":{\"data\":\"Trong b\\u1ea3ng ph\\u1ea3n h\\u1ed3i\",\"custom\":\"Danh s\\u00e1ch t\\u00f9y bi\\u1ebfn\"},\"value\":\"custom\"},\"item_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 l\\u01b0\\u1ee3ng\",\"value\":5},\"sort_type\":{\"type\":\"crazyselect\",\"label\":\"S\\u1eafp x\\u1ebfp\",\"data\":{\"id-ASC\":\"M\\u1eb7c \\u0111\\u1ecbnh\",\"id-DESC\":\"M\\u1edbi nh\\u1ea5t\",\"name-ASC\":\"h\\u1ee9 t\\u1ef1 b\\u1ea3ng ch\\u1ef1 c\\u00e1i\"},\"value\":\"id-ASC\"}},\"path\":\"home.testimonials.area\"},\"home.testimonials.item\":{\"name\":\"Home: Testimonials Item\",\"inputs\":{\"name\":{\"type\":\"text\",\"label\":\"t\\u00ean ng\\u01b0\\u1eddi ph\\u1ea3n h\\u1ed3i\",\"placeholder\":\"V\\u00ed d\\u1ee5: Nguy\\u1ec5n V\\u0103n A\"},\"image\":{\"type\":\"file\",\"label\":\"\\u00c3nh \\u0111\\u1ea1i di\\u1ec7n\"},\"job\":{\"type\":\"text\",\"label\":\"C\\u00f4ng vi\\u1ec7c\",\"placeholder\":\"V\\u00ed d\\u1ee5: CEO\"},\"content\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 t\\u1ea3 ng\\u1eafn\",\"placeholder\":\"V\\u00ed d\\u1ee5: Very grateful to have found this app. D&L team did a fantastic job...\"}},\"path\":\"home.testimonials.item\"},\"sidebar.categories\":{\"name\":\"Sidebar: Danh m\\u1ee5c\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"get_by_dynamic_active\":{\"type\":\"switch\",\"label\":\"\\u01afu ti\\u00ean m\\u1ee5c \\u0111ang xem\",\"value_type\":\"boolean\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"data-ref\":\"parent_id\"},\"parent_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c Cha\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_category_sortby_options\"}},\"path\":\"sidebar.categories\"},\"sidebar.posts\":{\"name\":\"Sidebar: Danh s\\u00e1ch tin b\\u00e0i\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\",\"default\":\"Tin m\\u1edbi nh\\u1ea5t\"},\"dynamic_id\":{\"type\":\"crazyselect\",\"label\":\"M\\u1ee5c (t\\u00f9y ch\\u1ecdn)\",\"template\":\"crazyselect\",\"call\":\"get_dynamic_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"],\"@change\":\"Crazy.posts.changeDynamicID\",\"required\":\"true\"},\"category_id\":{\"type\":\"crazyselect\",\"label\":\"Danh m\\u1ee5c\",\"template\":\"crazyselect\",\"call\":\"get_post_category_options\",\"params\":[{\"dynamic_id\":\"#dynamic_id\"},true],\"@label-type\":\"value\"},\"content_type\":{\"type\":\"radio\",\"label\":\"Lo\\u1ea1i n\\u1ed9i dung\",\"call\":\"get_content_type_options\",\"params\":[\"T\\u1ea5t c\\u1ea3\"]},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_post_sortby_options\"},\"post_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}},\"path\":\"sidebar.posts\"},\"sidebar.search\":{\"name\":\"Sidebar: T\\u00ecm ki\\u1ebfm\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\",\"default\":\"T\\u00ecm ki\\u1ebfm\"}},\"path\":\"sidebar.search\"},\"sidebar.social\":{\"name\":\"M\\u1ea1ng x\\u00e3 h\\u1ed9i\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"facebook\":{\"type\":\"text\",\"label\":\"facebook (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c (M\\u1eb7c \\u0111\\u1ecbnh theo m\\u1ee5c social)\"},\"twitter\":{\"type\":\"text\",\"label\":\"twitter (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c (M\\u1eb7c \\u0111\\u1ecbnh theo m\\u1ee5c social)\"},\"youtube\":{\"type\":\"text\",\"label\":\"youtube (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c (M\\u1eb7c \\u0111\\u1ecbnh theo m\\u1ee5c social)\"},\"linkedin\":{\"type\":\"text\",\"label\":\"Linkedin (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c (M\\u1eb7c \\u0111\\u1ecbnh theo m\\u1ee5c social)\"},\"instagram\":{\"type\":\"text\",\"label\":\"instagram (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c (M\\u1eb7c \\u0111\\u1ecbnh theo m\\u1ee5c social)\"},\"pinterest\":{\"type\":\"text\",\"label\":\"Pinterest (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c (M\\u1eb7c \\u0111\\u1ecbnh theo m\\u1ee5c social)\"}},\"path\":\"sidebar.social\"},\"sidebar.tags\":{\"name\":\"Sidebar: Th\\u1ebb b\\u00e0i vi\\u1ebft (tags)\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_tag_sortby_options\"},\"tag_number\":{\"type\":\"number\",\"label\":\"S\\u1ed1 tin b\\u00e0i\",\"min\":1,\"step\":1,\"default\":10}},\"path\":\"sidebar.tags\"},\"sidebar-project.categories\":{\"name\":\"Project Sidebar: Danh m\\u1ee5c D\\u1ef1 \\u00e1n\",\"inputs\":{\"title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 (T\\u00f9y ch\\u1ecdn)\"},\"sorttype\":{\"type\":\"select\",\"label\":\"ki\\u1ec3u s\\u1eafp x\\u1ebfp\",\"call\":\"get_project_category_sortby_options\"}},\"path\":\"sidebar-project.categories\"}}'),
(18, 'theme', 3, 'options', '{\"title\":\"Bunas\",\"groups\":{\"header\":{\"label\":\"Header\",\"inputs\":{\"show_top\":{\"type\":\"switch\",\"label\":\"Hi\\u1ec3n th\\u1ecb text trung t\\u00e2m\",\"check_label\":\"C\\u00f3\",\"value_type\":\"boolean\"},\"logo\":{\"type\":\"file\",\"label\":\"Logo\"},\"logo_light\":{\"type\":\"file\",\"label\":\"Logo Tr\\u1eafng (light)\"},\"page_header_background\":{\"type\":\"file\",\"label\":\"H\\u00ecnh n\\u1ec1n \\u0111\\u1ea7u trang m\\u1eb7c \\u0111\\u1ecbnh (T\\u00f9y ch\\u1ecdn)\"},\"page_header_padding_y\":{\"type\":\"number\",\"label\":\"C\\u0103n tr\\u00ean d\\u01b0\\u1edbi \\u0111\\u1ea7u trang (px)\",\"default\":\"160\"},\"page_header_breadcrumb_bottom\":{\"type\":\"number\",\"label\":\"breakcrumb position-Bottom (px)\",\"default\":\"-180\"}}},\"footer\":{\"label\":\"Footer\",\"inputs\":{\"footer\":{\"type\":\"area\",\"label\":\"footer Widget\",\"value\":\"footer\"},\"copyright\":{\"type\":\"text\",\"label\":\"Copyright\"}}},\"sidebar\":{\"label\":\"Sidebar\",\"inputs\":{\"widgets\":{\"type\":\"area\",\"label\":\"Post sidebar Widgets\",\"value\":\"sidebar_post\"},\"project_widgets\":{\"type\":\"area\",\"label\":\"project sidebar Widgets\",\"value\":\"sidebar_project\"},\"page_widgets\":{\"type\":\"area\",\"label\":\"page sidebar Widgets\",\"value\":\"sidebar_page\",\"default\":\"sidebar_page\"}}},\"home\":{\"label\":\"Trang ch\\u1ee7\",\"inputs\":{\"home\":{\"type\":\"area\",\"label\":\"Th\\u00e0nh ph\\u00e0n trang ch\\u1ee7\",\"value\":\"home\",\"@title-by\":\"title\"},\"home_services\":{\"type\":\"area\",\"label\":\"Danh s\\u00e1ch d\\u1ecbch v\\u1ee5\",\"value\":\"home_services\",\"@title-by\":\"title\"},\"testimonials\":{\"type\":\"area\",\"label\":\"Danh s\\u00e1ch ph\\u1ea3n h\\u1ed3i t\\u00f9y bi\\u1ebfn\",\"value\":\"testimonials\",\"@title-by\":\"name\"},\"members\":{\"type\":\"area\",\"label\":\"Danh s\\u00e1ch th\\u00e0nh vi\\u00ean t\\u00f9y bi\\u1ebfn\",\"value\":\"team_members\",\"@title-by\":\"name\"},\"contact_faq\":{\"type\":\"area\",\"label\":\"C\\u00e1c C\\u00e2u h\\u1ecfi th\\u01b0\\u1eddng g\\u1eb7p\",\"value\":\"contact_faq\",\"@title-by\":\"title\"},\"home_pricing\":{\"type\":\"area\",\"label\":\"b\\u00e1o gi\\u00e1 C\\u00e1c g\\u00f3i d\\u1ecbch v\\u1ee5\",\"value\":\"home_pricing\",\"@title-by\":\"title\"}}},\"contacts\":{\"label\":\"Li\\u00ean h\\u1ec7\",\"inputs\":{\"page_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 Trang li\\u00ean h\\u1ec7\",\"value\":\"Li\\u00ean h\\u1ec7\"},\"page_description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 r\\u1ea3 trang li\\u00ean h\\u1ec7\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3\"},\"email\":{\"type\":\"text\",\"Label\":\"Email\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"},\"phone_number\":{\"type\":\"text\",\"Label\":\"S\\u1ed1 \\u0111i\\u1ec7n tho\\u1ea1i\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"},\"address\":{\"type\":\"text\",\"Label\":\"\\u0110\\u1ecba ch\\u1ec9\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"},\"form_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 Form li\\u00ean h\\u1ec7\",\"value\":\"H\\u00e3y n\\u00f3i v\\u1ec1 nh\\u1eefng \\u00fd t\\u01b0\\u1edfng c\\u1ee7a b\\u1ea1n\"},\"form_description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 r\\u1ea3 \\/ Gi\\u1edbi thi\\u1ec7u\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3\"},\"button_text\":{\"type\":\"text\",\"label\":\"N\\u00fat g\\u1eedi\",\"value\":\"G\\u1eedi li\\u00ean h\\u1ec7\"},\"map_code\":{\"type\":\"textarea\",\"label\":\"M\\u00e3 nh\\u00fang b\\u1ea3n \\u0111\\u1ed3\",\"placeholder\":\"Nh\\u1eadp m\\u00e3 M\\u00e3 nh\\u00fang\"},\"faq_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 FAQ (T\\u00f9y ch\\u1ecdn)\"},\"contact_faq\":{\"type\":\"area\",\"label\":\"C\\u00e1c C\\u00e2u h\\u1ecfi th\\u01b0\\u1eddng g\\u1eb7p\",\"value\":\"contact_faq\",\"@title-by\":\"title\"}}},\"socials\":{\"label\":\"MXH\",\"inputs\":{\"facebook\":{\"type\":\"text\",\"label\":\"facebook (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"},\"twitter\":{\"type\":\"text\",\"label\":\"twitter (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"},\"youtube\":{\"type\":\"text\",\"label\":\"youtube (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"},\"linkedin\":{\"type\":\"text\",\"label\":\"Linkedin (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"},\"instagram\":{\"type\":\"text\",\"label\":\"instagram (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"},\"pinterest\":{\"type\":\"text\",\"label\":\"Pinterest (T\\u00f9y ch\\u1ecdn)\",\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}}},\"posts\":{\"label\":\"B\\u00e0i vi\\u1ebft\",\"inputs\":{\"page_header_background\":{\"type\":\"file\",\"label\":\"H\\u00ecnh n\\u1ec1n \\u0111\\u1ea7u trang m\\u1eb7c \\u0111\\u1ecbnh (T\\u00f9y ch\\u1ecdn)\"}}},\"pages\":{\"label\":\"Trang\",\"inputs\":{\"page_header_background\":{\"type\":\"file\",\"label\":\"H\\u00ecnh n\\u1ec1n \\u0111\\u1ea7u trang m\\u1eb7c \\u0111\\u1ecbnh (T\\u00f9y ch\\u1ecdn)\"}}},\"projects\":{\"label\":\"D\\u1ef1 \\u00e1n\",\"inputs\":{\"page_header_background\":{\"type\":\"file\",\"label\":\"H\\u00ecnh n\\u1ec1n \\u0111\\u1ea7u trang m\\u1eb7c \\u0111\\u1ecbnh (T\\u00f9y ch\\u1ecdn)\"}}},\"search\":{\"label\":\"Search\",\"inputs\":{\"page_header_background\":{\"type\":\"file\",\"label\":\"H\\u00ecnh n\\u1ec1n \\u0111\\u1ea7u trang m\\u1eb7c \\u0111\\u1ecbnh (T\\u00f9y ch\\u1ecdn)\"},\"page_header_padding_y\":{\"type\":\"number\",\"label\":\"C\\u0103n tr\\u00ean d\\u01b0\\u1edbi \\u0111\\u1ea7u trang (px)\",\"default\":\"160\"},\"page_header_breakcrumb_bottom\":{\"type\":\"number\",\"label\":\"Link position-Bottom (px)\",\"default\":\"-180\"}}},\"forms\":{\"label\":\"Forms\",\"inputs\":{\"logo\":{\"type\":\"file\",\"label\":\"Logo\"},\"logo_light\":{\"type\":\"file\",\"label\":\"Logo Tr\\u1eafng (light)\"},\"register_title\":{\"type\":\"text\",\"label\":\"Ti\\u00eau \\u0111\\u1ec1 m\\u1ee5c \\u0111\\u0103ng k\\u00fd\",\"value\":\"\\u0110\\u0103ng k\\u00fd \\u0111\\u1ec3 nh\\u1eadn t\\u00e0i kho\\u1ea3n d\\u00f9ng th\\u1eed mi\\u1ec3n ph\\u00ed\"},\"register_description\":{\"type\":\"textarea\",\"label\":\"M\\u00f4 r\\u1ea3 m\\u1ee5c \\u0111\\u0103ng k\\u00fd\",\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3\"}}}}}'),
(19, 'theme', 3, 'areas', '{\"home\":\"Trang Ch\\u1ee7\",\"home_services\":\"D\\u1ecbch v\\u1ee5 tr\\u00ean trang ch\\u1ee7\",\"testimonials\":\"Danh s\\u00e1ch ph\\u1ea3n h\\u1ed3i\",\"team_members\":\"Nh\\u00f3m l\\u00e0m vi\\u1ec7c\",\"contact_faq\":\"C\\u00e1c c\\u00e2u h\\u1ecfi th\\u01b0\\u1eddng g\\u1eb7p\",\"home_pricing\":\"B\\u00e1o gi\\u00e1 (tr\\u00ean trang ch\\u1ee7)\",\"sidebar_post\":\"Post Sidebar\",\"sidebar_project\":\"Project Sidebar\",\"sidebar_page\":\"Page Sidebar\"}'),
(20, 'theme', 3, 'layout', '[]'),
(21, 'theme', 3, 'menus', '[]'),
(22, 'dynamic', 2, 'default_fields', '[\"title\",\"slug\",\"description\",\"content_type\",\"content\",\"feature_image\",\"meta_title\",\"meta_description\",\"keywords\",\"tags\",\"privacy\"]'),
(23, 'dynamic', 2, 'advance_props', '[{\"name\":\"service_id\",\"type\":\"select\",\"label\":\"G\\u00f3i d\\u1ecbch v\\u1ee5\",\"validate\":null,\"prop_list\":[{\"key\":\"call\",\"value\":\"get_service_options\"}]}]'),
(24, 'dynamic', 2, 'custom_slug', '0'),
(25, 'dynamic', 2, 'prop_inputs', '{\"service_id\":{\"name\":\"service_id\",\"type\":\"select\",\"label\":\"G\\u00f3i d\\u1ecbch v\\u1ee5\",\"validate\":null,\"call\":\"get_service_options\"}}'),
(26, 'dynamic', 2, 'form_config', '{\"name\":\"Th\\u00f4ng tin D\\u1ecbch v\\u1ee5\",\"layout_type\":\"column\",\"form_groups\":[{\"title\":\"Th\\u00f4ng tin c\\u01a1 b\\u1ea3n\",\"class\":\"col-12 col-lg-7\",\"inputs\":[\"title\",\"slug\",\"category_id\",\"service_id\",\"description\"]},{\"title\":\"\\u1ea2nh v\\u00e0 ri\\u00eang t\\u01b0\",\"class\":\"col-12 col-lg-5\",\"inputs\":[\"feature_image\"]},{\"title\":\"Th\\u00f4ng tim chi ti\\u1ebft\",\"class\":\"col-12\",\"inputs\":[\"content\",\"content_type\"]},{\"title\":\"Th\\u00f4ng tim SEO\",\"class\":\"col-12 col-lg-6\",\"inputs\":[\"meta_title\",\"meta_description\",\"keywords\"]},{\"title\":null,\"class\":\"col-12 col-lg-6\",\"inputs\":[\"tags\",\"privacy\"]}]}'),
(27, 'project', 1, 'custom_slug', NULL),
(28, 'project', 1, 'client_id', '0'),
(29, 'project', 1, 'website', NULL),
(30, 'project', 1, 'link', NULL),
(31, 'project', 1, 'feature_image_keep_original', NULL),
(32, 'project', 1, 'og_image_width', '400'),
(33, 'project', 1, 'og_image_height', '400'),
(34, 'project', 2, 'custom_slug', NULL),
(35, 'project', 2, 'client_id', '0'),
(36, 'project', 2, 'website', NULL),
(37, 'project', 2, 'link', NULL),
(38, 'project', 2, 'feature_image_keep_original', NULL),
(39, 'project', 2, 'og_image_width', '400'),
(40, 'project', 2, 'og_image_height', '400'),
(41, 'project', 3, 'custom_slug', NULL),
(42, 'project', 3, 'client_id', '0'),
(43, 'project', 3, 'website', NULL),
(44, 'project', 3, 'link', NULL),
(45, 'project', 3, 'feature_image_keep_original', NULL),
(46, 'project', 3, 'og_image_width', '400'),
(47, 'project', 3, 'og_image_height', '400'),
(48, 'project', 4, 'custom_slug', NULL),
(49, 'project', 4, 'client_id', '0'),
(50, 'project', 4, 'website', NULL),
(51, 'project', 4, 'link', NULL),
(52, 'project', 4, 'feature_image_keep_original', NULL),
(53, 'project', 4, 'og_image_width', '400'),
(54, 'project', 4, 'og_image_height', '400'),
(55, 'project', 5, 'custom_slug', NULL),
(56, 'project', 5, 'client_id', '0'),
(57, 'project', 5, 'website', NULL),
(58, 'project', 5, 'link', NULL),
(59, 'project', 5, 'feature_image_keep_original', NULL),
(60, 'project', 5, 'og_image_width', '400'),
(61, 'project', 5, 'og_image_height', '400'),
(62, 'project', 6, 'custom_slug', NULL),
(63, 'project', 6, 'client_id', '0'),
(64, 'project', 6, 'website', NULL),
(65, 'project', 6, 'link', NULL),
(66, 'project', 6, 'feature_image_keep_original', NULL),
(67, 'project', 6, 'og_image_width', '400'),
(68, 'project', 6, 'og_image_height', '400'),
(69, 'dynamic', 3, 'default_fields', '[\"title\",\"slug\",\"description\",\"content_type\",\"content\",\"gallery\",\"video_url\",\"source\",\"feature_image\",\"meta_title\",\"meta_description\",\"keywords\",\"tags\",\"privacy\"]'),
(70, 'dynamic', 3, 'advance_props', '[]'),
(71, 'dynamic', 3, 'custom_slug', '0'),
(72, 'dynamic', 3, 'prop_inputs', '[]'),
(73, 'dynamic', 3, 'form_config', '{\"name\":\"Th\\u00f4ng tin Blog\",\"layout_type\":\"column\",\"form_groups\":[{\"title\":\"Th\\u00f4ng tin c\\u01a1 b\\u1ea3n\",\"class\":\"col-12 col-lg-7\",\"inputs\":[\"title\",\"slug\",\"category_id\",\"description\"]},{\"title\":\"\\u1ea2nh v\\u00e0 ri\\u00eang t\\u01b0\",\"class\":\"col-12 col-lg-5\",\"inputs\":[\"feature_image\"]},{\"title\":\"Th\\u00f4ng tim chi ti\\u1ebft\",\"class\":\"col-12\",\"inputs\":[\"content\",\"content_type\",\"video_url\",\"gallery\",\"source\"]},{\"title\":\"Th\\u00f4ng tim SEO\",\"class\":\"col-12 col-lg-6\",\"inputs\":[\"meta_title\",\"meta_description\",\"keywords\"]},{\"title\":null,\"class\":\"col-12 col-lg-6\",\"inputs\":[\"tags\",\"privacy\"]}]}'),
(74, 'post', 7, 'custom_slug', NULL),
(75, 'post', 7, 'meta_title', NULL),
(76, 'post', 7, 'meta_description', NULL),
(77, 'post', 7, 'feature_image_keep_original', NULL),
(78, 'post', 7, 'og_image_width', '600'),
(79, 'post', 7, 'og_image_height', '315'),
(80, 'post', 8, 'custom_slug', NULL),
(81, 'post', 8, 'meta_title', NULL),
(82, 'post', 8, 'meta_description', NULL),
(83, 'post', 8, 'feature_image_keep_original', NULL),
(84, 'post', 8, 'og_image_width', '600'),
(85, 'post', 8, 'og_image_height', '315'),
(86, 'post', 9, 'custom_slug', NULL),
(87, 'post', 9, 'meta_title', NULL),
(88, 'post', 9, 'meta_description', NULL),
(89, 'post', 9, 'feature_image_keep_original', NULL),
(90, 'post', 9, 'og_image_width', '600'),
(91, 'post', 9, 'og_image_height', '315'),
(92, 'page', 10, 'custom_slug', NULL),
(93, 'page', 10, 'meta_title', NULL),
(94, 'page', 10, 'meta_description', NULL),
(95, 'page', 10, 'feature_image_keep_original', NULL),
(96, 'page', 10, 'og_image_width', '600'),
(97, 'page', 10, 'og_image_height', '315'),
(98, 'dynamic', 4, 'default_fields', '[\"title\",\"slug\",\"description\",\"content_type\",\"content\",\"gallery\",\"video_url\",\"source\",\"feature_image\",\"meta_title\",\"meta_description\",\"keywords\",\"tags\",\"privacy\"]'),
(99, 'dynamic', 4, 'advance_props', '[]'),
(100, 'dynamic', 4, 'custom_slug', '0'),
(101, 'dynamic', 4, 'prop_inputs', '[]'),
(102, 'dynamic', 4, 'form_config', '{\"name\":\"Th\\u00f4ng tin T\\u00e0i li\\u1ec7u\",\"layout_type\":\"column\",\"form_groups\":[{\"title\":\"Th\\u00f4ng tin c\\u01a1 b\\u1ea3n\",\"class\":\"col-12 col-lg-7\",\"inputs\":[\"title\",\"slug\",\"category_id\",\"description\"]},{\"title\":\"\\u1ea2nh v\\u00e0 ri\\u00eang t\\u01b0\",\"class\":\"col-12 col-lg-5\",\"inputs\":[\"feature_image\"]},{\"title\":\"Th\\u00f4ng tim chi ti\\u1ebft\",\"class\":\"col-12\",\"inputs\":[\"content\",\"content_type\",\"video_url\",\"gallery\",\"source\"]},{\"title\":\"Th\\u00f4ng tim SEO\",\"class\":\"col-12 col-lg-6\",\"inputs\":[\"meta_title\",\"meta_description\",\"keywords\"]},{\"title\":\"\",\"class\":\"col-12 col-lg-6\",\"inputs\":[\"tags\",\"privacy\"]}]}'),
(103, 'project', 11, 'custom_slug', NULL),
(104, 'project', 11, 'client_id', '0'),
(105, 'project', 11, 'website', NULL),
(106, 'project', 11, 'link', NULL),
(107, 'project', 11, 'feature_image_keep_original', NULL),
(108, 'project', 11, 'og_image_width', '400'),
(109, 'project', 11, 'og_image_height', '400'),
(110, 'post', 12, 'custom_slug', NULL),
(111, 'post', 12, 'meta_title', NULL),
(112, 'post', 12, 'meta_description', NULL),
(113, 'post', 12, 'feature_image_keep_original', NULL),
(114, 'post', 12, 'service_id', '1'),
(115, 'post', 12, 'og_image_width', '275'),
(116, 'post', 12, 'og_image_height', '276'),
(117, 'post', 13, 'custom_slug', NULL),
(118, 'post', 13, 'meta_title', NULL),
(119, 'post', 13, 'meta_description', NULL),
(120, 'post', 13, 'feature_image_keep_original', NULL),
(121, 'post', 13, 'service_id', '2'),
(122, 'post', 13, 'og_image_width', '315'),
(123, 'post', 13, 'og_image_height', '276'),
(124, 'post', 14, 'custom_slug', NULL),
(125, 'post', 14, 'meta_title', NULL),
(126, 'post', 14, 'meta_description', NULL),
(127, 'post', 14, 'feature_image_keep_original', NULL),
(128, 'post', 14, 'service_id', '3'),
(129, 'post', 14, 'og_image_width', '275'),
(130, 'post', 14, 'og_image_height', '276'),
(131, 'post', 15, 'custom_slug', NULL),
(132, 'post', 15, 'meta_title', NULL),
(133, 'post', 15, 'meta_description', NULL),
(134, 'post', 15, 'feature_image_keep_original', NULL),
(135, 'post', 15, 'service_id', '4'),
(136, 'post', 15, 'og_image_width', '315'),
(137, 'post', 15, 'og_image_height', '276'),
(138, 'post', 16, 'custom_slug', NULL),
(139, 'post', 16, 'meta_title', NULL),
(140, 'post', 16, 'meta_description', NULL),
(141, 'post', 16, 'feature_image_keep_original', NULL),
(142, 'post', 16, 'service_id', '5'),
(143, 'post', 16, 'og_image_width', '315'),
(144, 'post', 16, 'og_image_height', '276'),
(145, 'post', 17, 'custom_slug', NULL),
(146, 'post', 17, 'meta_title', NULL),
(147, 'post', 17, 'meta_description', NULL),
(148, 'post', 17, 'feature_image_keep_original', NULL),
(149, 'post', 17, 'service_id', '6'),
(150, 'post', 17, 'og_image_width', '276'),
(151, 'post', 17, 'og_image_height', '276'),
(152, 'user_services', 1, 'domain', 'chinhlatoi.vn'),
(153, 'user_services', 1, 'subdomain', '124055'),
(154, 'user_services', 1, 'alias_domain', NULL),
(155, 'user_services', 2, 'domain', 'chinhlatoi.vn'),
(156, 'user_services', 2, 'subdomain', 'doandt'),
(157, 'user_services', 2, 'alias_domain', NULL),
(158, 'user_services', 3, 'domain', 'chinhlatoi.com'),
(159, 'user_services', 3, 'subdomain', '12345'),
(160, 'user_services', 3, 'alias_domain', 'moondental1.vn'),
(161, 'user_services', 4, 'domain', 'chinhlatoi.com'),
(162, 'user_services', 4, 'subdomain', 'mua123'),
(163, 'user_services', 4, 'alias_domain', NULL),
(164, 'user_services', 5, 'domain', 'chinhlatoi.vn'),
(165, 'user_services', 5, 'subdomain', '123456'),
(166, 'user_services', 5, 'alias_domain', NULL),
(167, 'user_services', 6, 'domain', 'vcc.vn'),
(168, 'user_services', 6, 'subdomain', 'doanln12'),
(169, 'user_services', 6, 'alias_domain', NULL),
(170, 'user_services', 7, 'domain', 'chinhlatoi.vn'),
(171, 'user_services', 7, 'subdomain', '3455'),
(172, 'user_services', 7, 'alias_domain', NULL),
(173, 'user_services', 8, 'domain', 'chinhlatoi.vn'),
(174, 'user_services', 8, 'subdomain', '12356'),
(175, 'user_services', 8, 'alias_domain', NULL),
(176, 'user_services', 9, 'domain', 'chinhlatoi.vn'),
(177, 'user_services', 9, 'subdomain', 'doanlnc'),
(178, 'user_services', 9, 'alias_domain', NULL),
(179, 'user_services', 10, 'domain', 'vcc.vn'),
(180, 'user_services', 10, 'subdomain', 'hieuvm'),
(181, 'user_services', 10, 'alias_domain', NULL),
(182, 'user_services', 11, 'domain', 'chinhlatoi.com'),
(183, 'user_services', 11, 'subdomain', 'doanln1'),
(184, 'user_services', 11, 'alias_domain', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_03_02_102714_create_email_tokens_table', 1),
(4, '2019_03_02_103421_create_metadatas_table', 1),
(5, '2019_03_29_174347_create_notices_table', 1),
(6, '2019_03_29_174510_create_user_notices_table', 1),
(7, '2019_04_05_094037_create_themes_table', 1),
(8, '2019_04_09_150339_create_permission_modules_table', 1),
(9, '2019_04_09_151002_create_permission_roles_table', 1),
(10, '2019_04_09_151028_create_permission_module_roles_table', 1),
(11, '2019_04_09_151052_create_permission_user_roles_table', 1),
(12, '2019_04_14_084914_create_dynamics_table', 1),
(13, '2019_04_14_085134_create_categories_table', 1),
(14, '2019_04_14_085248_create_posts_table', 1),
(15, '2019_04_17_082353_create_files_table', 1),
(16, '2019_04_28_100816_create_tags_table', 1),
(17, '2019_04_28_101017_create_tag_refs_table', 1),
(18, '2019_05_05_151126_create_crawler_frames_table', 1),
(19, '2019_05_07_151730_create_crawler_tasks_table', 1),
(20, '2019_05_11_170754_create_products_table', 1),
(21, '2019_05_12_095625_create_attributes_table', 1),
(22, '2019_05_13_091038_create_attribute_values_table', 1),
(23, '2019_05_13_093547_create_product_attributes_table', 1),
(24, '2019_05_13_110614_create_product_attribute_price_table', 1),
(25, '2019_06_03_123048_create_promos_table', 1),
(26, '2019_06_05_080541_create_product_refs_table', 1),
(27, '2019_06_06_183552_create_customers_table', 1),
(28, '2019_06_07_103423_create_orders_table', 1),
(29, '2019_06_07_103620_create_order_items_table', 1),
(30, '2019_06_14_175911_create_product_reviews_table', 1),
(31, '2019_06_14_180735_create_order_feedback_table', 1),
(32, '2019_06_16_181021_create_warehouse_table', 1),
(33, '2019_06_24_172715_create_transactions_table', 1),
(34, '2019_07_04_083936_create_experiences_table', 1),
(35, '2019_07_12_084351_create_clients_table', 1),
(36, '2019_07_12_111812_create_client_feedback_table', 1),
(37, '2019_07_12_162359_create_teams_table', 1),
(38, '2019_07_12_162803_create_team_members_table', 1),
(39, '2019_07_15_080241_create_contacts_table', 1),
(40, '2019_07_15_081024_create_contact_replies_table', 1),
(41, '2019_07_15_175449_create_subcribes_table', 1),
(42, '2019_07_15_235748_create_jobs_table', 1),
(43, '2019_07_16_002911_create_failed_jobs_table', 1),
(44, '2019_07_23_174639_create_sliders_table', 1),
(45, '2019_07_23_181110_create_slider_items_table', 1),
(46, '2019_07_31_101312_create_options_table', 1),
(47, '2019_07_31_173240_create_option_groups_table', 1),
(48, '2019_07_31_173526_create_option_datas_table', 1),
(49, '2019_08_10_150630_create_menus_table', 1),
(50, '2019_08_10_151408_create_menu_items_table', 1),
(51, '2019_08_16_101122_create_html_areas_table', 1),
(52, '2019_08_16_152505_create_html_embeds_table', 1),
(53, '2019_08_24_091126_create_components_table', 1),
(54, '2019_08_25_165401_create_html_components_table', 1),
(55, '2019_09_13_122300_create_comments_table', 1),
(56, '2019_11_09_112428_create_regions_table', 1),
(57, '2019_11_09_153135_create_districts_table', 1),
(58, '2019_11_09_153142_create_wards_table', 1),
(59, '2019_12_11_161802_create_category_refs_table', 1),
(60, '2019_12_18_012434_create_order_address_table', 1),
(61, '2019_12_25_112256_create_testimonials_table', 1),
(62, '2020_02_12_093859_create_post_views_table', 1),
(66, '2020_05_29_110901_create_services_table', 2),
(67, '2020_05_29_112959_create_service_packages_table', 2),
(68, '2020_05_29_114619_create_user_services_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notices`
--

CREATE TABLE `notices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT 0,
  `to_id` bigint(20) DEFAULT 0,
  `to_group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'personal',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Bạn có thông báo mới',
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_id` bigint(20) UNSIGNED DEFAULT 0,
  `seen` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Options',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'option',
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'base',
  `ref_id` bigint(20) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `options`
--

INSERT INTO `options` (`id`, `title`, `slug`, `ref`, `ref_id`) VALUES
(1, 'Thiết lập', 'settings', NULL, 0),
(2, '247 News', '247-news', 'theme', 1),
(3, 'Bize', 'bize', 'theme', 2),
(4, 'Bunas', 'bunas', 'theme', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `option_datas`
--

CREATE TABLE `option_datas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'option_name',
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Option Name',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `value_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(10) UNSIGNED DEFAULT 12,
  `props` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `can_delete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `option_datas`
--

INSERT INTO `option_datas` (`id`, `group_id`, `name`, `label`, `type`, `value_type`, `value`, `priority`, `props`, `can_delete`) VALUES
(1, 1, 'cache_data_time', 'Thời gian lưu cache của Dữ liệu từ DB', 'number', 'number', '0', 3, '[]', 0),
(2, 1, 'cache_view_time', 'Thời gian lưu cache của view', 'number', 'number', '0', 4, '[]', 0),
(3, 1, 'send_mail_notification', 'Gửi mail thông báo', 'checkbox', 'boolean', '1', 5, '{\"template\":\"switch\"}', 0),
(4, 1, 'mail_notification', 'Email nhận thông báo', 'email', 'text', 'doanln16@gmail.com', 6, '[]', 0),
(5, 2, 'site_name', 'Tên trang web', 'text', 'text', 'Web 1-0-2', 1, '[]', 0),
(6, 2, 'slogan', 'Khẩu hiệu', 'text', 'text', 'Nghĩ lớn - Làm lớn', 2, '[]', 0),
(7, 2, 'title', 'Tiêu đề trang', 'text', 'text', 'Web 1-0-2', 3, '[]', 0),
(8, 2, 'logo', 'Logo', 'file', 'text', 'logo.png', 4, '[]', 0),
(9, 2, 'web_image', 'Hình ảnh đại diện cho web', 'file', 'text', '', 9, '[]', 0),
(10, 2, 'favicon', 'Biệu tượng cho trang web', 'file', 'text', 'favicon.png', 10, '[]', 0),
(11, 2, 'meta_title', 'Tiêu đề seo', 'text', 'text', 'Web 1-0-2', 11, '[]', 0),
(12, 2, 'meta_description', 'Mô tả website', 'textarea', 'text', 'Đôi nét về website của bạn', 12, '[]', 0),
(13, 2, 'keywords', 'Từ khóa', 'text', 'text', 'Web 1-0-2', 13, '[]', 0),
(14, 2, 'email', 'Địa chỉ email', 'email', 'text', 'doanln16@gmail.com', 14, '[]', 0),
(15, 2, 'phone_number', 'Số điện thoại', 'tel', 'text', '0945786960', 15, '[]', 0),
(16, 2, 'address', 'Địa chỉ', 'text', 'text', '172, đường Bà Triệu, p. Dân Chủ tp. Hòa Bình, tỉnh Hòa Bình', 16, '[]', 0),
(17, 2, 'facebook', 'Facebook', 'text', 'text', 'https://www.facebook.com/thegioivuong', 17, NULL, 1),
(18, 19, 'decimals', 'Số ký tự thập phân', 'number', 'number', '0', 1, '[]', 0),
(19, 19, 'decimal_poiter', 'Ký tự ngăn cách phẩn thập phân', 'select', 'text', ',', 2, '{\"data\":{\",\":\"\\u0110\\u1ea5u ph\\u1ea9y (.)\",\".\":\"\\u0110\\u1ea5u ch\\u1ea5m (.)\"}}', 0),
(20, 19, 'thousands_sep', 'Ký tự ngăn cách hàng nghìn', 'select', 'text', '.', 3, '{\"data\":{\".\":\"\\u0110\\u1ea5u ch\\u1ea5m (.)\",\",\":\"\\u0110\\u1ea5u ph\\u1ea9y (.)\"}}', 0),
(21, 19, 'currency_type', 'Loại tiền tệ', 'text', 'text', 'Đ', 4, '[]', 0),
(22, 19, 'currency_position', 'Vị trí đơn vị tiền', 'select', 'text', 'right', 5, '{\"data\":{\"left\":\"Tr\\u00e1i\",\"right\":\"Ph\\u1ea3i\"}}', 0),
(23, 29, 'bank_account_number', 'Số tài khoản', 'text', 'text', '45510000802371', 1, '[]', 0),
(24, 29, 'bank_account_owner', 'Chủ tài khoản', 'text', 'text', 'Lê Ngọc Doãn', 2, '[]', 0),
(25, 29, 'bank_name', 'Tên ngân hàng', 'text', 'text', 'BIDV', 3, '[]', 0),
(26, 29, 'bank_branch', 'Chi nhánh', 'text', 'text', 'Hòa Bình', 4, '[]', 0),
(27, 30, 'mail_driver', 'Mail Drive', 'text', 'text', 'smtp', 1, '{\"placeholder\":\"V\\u00ed d\\u1ee5: smtp\"}', 0),
(28, 30, 'mail_host', 'Mail host', 'text', 'text', 'smtp.gmail.com', 2, '{\"placeholder\":\"V\\u00ed d\\u1ee5: smtp.gmail.com\"}', 0),
(29, 30, 'mail_post', 'Mail Port', 'number', 'text', '587', 3, '{\"placeholder\":\"V\\u00ed d\\u1ee5: 587\"}', 0),
(30, 30, 'mail_encryption', 'Chuẩn mã hóa', 'text', 'text', 'tls', 4, '{\"placeholder\":\"V\\u00ed d\\u1ee5: tls\"}', 0),
(31, 30, 'mail_username', 'Tài khoản đăng nhập mail', 'text', 'text', 'lightservicesvn@gmail.com', 5, '{\"placeholder\":\"V\\u00ed d\\u1ee5: example@domain.com\"}', 0),
(32, 30, 'mail_password', 'Mật khẩu', 'password', 'text', 'Light>=2025', 6, '{\"placeholder\":\"Nh\\u1eadp m\\u1eadt kh\\u1ea9u \\u0111\\u0103ng nh\\u1eadp email\"}', 0),
(33, 30, 'mail_from_address', 'Email gửi đi (fake)', 'text', 'text', 'hoangtrungexpress@gmail.com', 7, '{\"placeholder\":\"V\\u00ed d\\u1ee5: example@domain.com\"}', 0),
(34, 30, 'mail_from_name', 'Tên người gửi', 'text', 'text', 'Hoàng Trung Express', 8, '{\"placeholder\":\"V\\u00ed d\\u1ee5: Nguy\\u1ec5n V\\u0103n A ho\\u1eb7c t\\u00ean c\\u00f4ng ty\"}', 0),
(35, 2, 'mobile_logo', 'Mobile Logo', 'file', 'text', 'mobile_logo.png', 5, '[]', 0),
(36, 2, 'footer_logo', 'Footer Logo', 'file', 'text', 'footer_logo.png', 6, '[]', 0),
(37, 63, 'post_per_page', 'Số lượng bài viết hiển thị trên một trang', 'number', 'number', '12', 0, '{\"min\":1}', 0),
(38, 63, 'page_per_page', 'Số lượng trang con hiển thị trên một trang', 'number', 'number', '12', 0, '{\"min\":1}', 0),
(39, 63, 'product_per_page', 'Số lượng sản phẩm hiển thị trên một trang', 'number', 'number', '12', 0, '{\"min\":1}', 0),
(40, 63, 'project_per_page', 'Số lượng dự án hiển thị trên một trang', 'number', 'number', '10', 0, '{\"min\":1}', 0),
(41, 63, 'result_per_page', 'Số lượng kết quả tìm kiếm hiển thị trên một trang', 'number', 'number', '10', 0, '{\"min\":1}', 0),
(42, 63, 'post_show_list_type', 'Ưu tiên hiển thị trong các mục bài viết', 'radio', 'text', 'post', 0, '{\"data\":{\"post\":\"T\\u1ea5t c\\u1ea3 tin b\\u00e0i\",\"category\":\"Danh m\\u1ee5c ho\\u1eb7c danh m\\u1ee5c con\"}}', 0),
(43, 259, 'facebook', 'Facebook JS SDK', 'textarea', 'text', '<div id=\"fb-root\"></div>\r\n            <script>(function(d, s, id) {\r\n              var js, fjs = d.getElementsByTagName(s)[0];\r\n              if (d.getElementById(id)) return;\r\n              js = d.createElement(s); js.id = id;\r\n              js.src = \"https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0\";\r\n              fjs.parentNode.insertBefore(js, fjs);\r\n            }(document, \'script\', \'facebook-jssdk\'));</script>', 1, '{\"placeholder\":\"M\\u00e3 SDK t\\u1eeb \\u1ee9ng d\\u1ee5ng c\\u1ee7a b\\u1ea1n\",\"className\":\"auto-height\"}', 0),
(44, 259, 'twitter', 'Twitter JS SDK', 'textarea', 'text', '<script>window.twttr = (function(d, s, id) {\r\n                var js, fjs = d.getElementsByTagName(s)[0],\r\n                  t = window.twttr || {};\r\n                if (d.getElementById(id)) return t;\r\n                js = d.createElement(s);\r\n                js.id = id;\r\n                js.src = \"https://platform.twitter.com/widgets.js\";\r\n                fjs.parentNode.insertBefore(js, fjs);\r\n              \r\n                t._e = [];\r\n                t.ready = function(f) {\r\n                  t._e.push(f);\r\n                };\r\n              \r\n                return t;\r\n              }(document, \"script\", \"twitter-wjs\"));</script>', 2, '{\"placeholder\":\"M\\u00e3 SDK t\\u1eeb \\u1ee9ng d\\u1ee5ng c\\u1ee7a b\\u1ea1n\",\"className\":\"auto-height\"}', 0),
(45, 260, 'show_mode', 'Ưu tiên hiển thị', 'radio', 'text', 'posts', 1, '{\"data\":{\"posts\":\"T\\u1ea5t c\\u1ea3 tin b\\u00e0i\",\"categories\":\"Danh m\\u1ee5c ho\\u1eb7c danh m\\u1ee5c con\"}}', 0),
(46, 260, 'per_page', 'Số bài viết hiển thị trên một trang', 'number', 'number', '12', 2, '{\"min\":1}', 0),
(47, 260, 'comment_approve_request', 'Duyệt bình luận', 'checkbox', 'boolean', NULL, 3, '{\"template\":\"switch\"}', 0),
(48, 261, 'per_page', 'Số sản phẩm hiển thị trên một trang', 'number', 'number', '12', 1, '{\"min\":1}', 0),
(49, 261, 'comment_approve_request', 'Duyệt bình luận', 'checkbox', 'boolean', NULL, 2, '{\"template\":\"switch\"}', 0),
(50, 261, 'review_approve_request', 'Đánh giá luận', 'checkbox', 'boolean', NULL, 3, '{\"template\":\"switch\"}', 0),
(51, 262, 'show_mode', 'Ưu tiên hiển thị', 'radio', 'text', 'posts', 1, '{\"data\":{\"projects\":\"T\\u1ea5t c\\u1ea3 d\\u1ef1 \\u00e1n\",\"categories\":\"Danh m\\u1ee5c ho\\u1eb7c danh m\\u1ee5c con\"}}', 0),
(52, 262, 'per_page', 'Số Dự án hiển thị trên một trang', 'number', 'number', '12', 2, '{\"min\":1}', 0),
(53, 262, 'comment_approve_request', 'Duyệt bình luận', 'checkbox', 'boolean', NULL, 3, '{\"template\":\"switch\"}', 0),
(54, 1, 'theme_id', 'theme_id', 'hidden', 'number', '3', 7, '[]', 0),
(55, 263, 'web_type', 'web_type', 'hidden', 'text', 'default', 1, '[]', 0),
(56, 263, 'theme_id', 'theme_id', 'hidden', 'number', '1', 2, '[]', 0),
(57, 264, 'color', 'Màu chủ dạo', 'colorselect', 'text', 'orange', 1, '{\"@colors\":{\"red\":{\"text\":\"\\u0110\\u1ecf\",\"color\":\"#e4000d\",\"value\":\"red\"},\"blue\":{\"text\":\"Xanh da tr\\u1eddi\",\"color\":\"#53b1ff\",\"value\":\"blue\"},\"dark-blue\":{\"text\":\"Xanh da tr\\u1eddi \\u0110\\u1eadm\",\"color\":\"#00469a\",\"value\":\"dark-blue\"},\"green\":{\"text\":\"Xanh l\\u00e1\",\"color\":\"#4cb050\",\"value\":\"green\"},\"orange\":{\"text\":\"Cam\",\"color\":\"#fb8c00\",\"value\":\"orange\"},\"deep-orange\":{\"text\":\"Cam \\u0111\\u1ecf\",\"color\":\"#ff4011\",\"value\":\"deep-orange\"},\"turquoise\":{\"text\":\"Xanh san h\\u00f4\",\"color\":\"#39c9bb\",\"value\":\"turquoise\"},\"pink\":{\"text\":\"H\\u1ed3ng\",\"color\":\"#ea0253\",\"value\":\"pink\"},\"purple\":{\"text\":\"T\\u00edm\",\"color\":\"#6441a5\",\"value\":\"purple\"},\"slate\":{\"text\":\"X\\u00e1m l\\u00f4ng chu\\u1ed9t\",\"color\":\"#64666c\",\"value\":\"slate\"}}}', 0),
(58, 264, 'show_pageloader', 'Hiển thị page loader', 'switch', 'boolean', '1', 2, '{\"check_label\":\"C\\u00f3\"}', 0),
(59, 265, 'show_text_logo', 'Hiển thị text logo', 'switch', 'boolean', '1', 1, '{\"check_label\":\"C\\u00f3\"}', 0),
(60, 265, 'text_logo_primary', 'Text Logo (chính)', 'text', 'text', 'Tin Tức', 2, '[]', 0),
(61, 265, 'text_logo_second', 'text_logo_second', 'text', 'text', '24/7', 3, '{\"Label\":\"Text Logo (b\\u1ed5 xung)\"}', 0),
(62, 265, 'highlight', 'làm nổi bật', 'select', 'text', NULL, 4, '{\"data\":{\"none\":\"Kh\\u00f4ng\",\"primary\":\"Text ch\\u00ednh\",\"second\":\"Text ph\\u1ee5\",\"both\":\"T\\u1ea5t c\\u1ea3\"}}', 0),
(63, 265, 'text_logo_slogan', 'text_logo_slogan', 'text', 'text', NULL, 5, '{\"Label\":\"Kh\\u1ea9u hi\\u1ec7u\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"}', 0),
(64, 265, 'show_banner', 'Hiển thị banner quảng cáo', 'switch', 'boolean', '1', 6, '{\"check_label\":\"C\\u00f3\"}', 0),
(65, 265, 'banner_image', 'Banner 720 x 90', 'file', 'text', NULL, 7, '{\"template\":\"cropit\",\"data-width\":720,\"data-height\":90}', 0),
(66, 265, 'banner_alt', 'Chú thích banner', 'text', 'text', NULL, 8, '[]', 0),
(67, 265, 'banner_link', 'Liên kết', 'text', 'text', NULL, 9, '[]', 0),
(68, 265, 'ads_type', 'Loại quảng cáo', 'radio', 'text', NULL, 10, '{\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"}', 0),
(69, 265, 'ads_code', 'Mã quảng cáo', 'textarea', 'text', NULL, 11, '{\"placeholder\":\"Nhap76 m\\u00e3 qu\\u1ea3ng c\\u00e1o\"}', 0),
(70, 265, 'show_datetime', 'Hiển thị thời gian', 'switch', 'boolean', '1', 12, '{\"check_label\":\"C\\u00f3\"}', 0),
(71, 265, 'datetime_lang', 'Ngôn ngữ', 'radio', 'text', 'vi', 13, '{\"data\":{\"vi\":\"Ti\\u1ebfng Vi\\u1ec7t\",\"en\":\"Ti\\u1ebfng Anh\"}}', 0),
(72, 265, 'date_format', 'Định dạng ngày tháng', 'text', 'text', '%w, ngày %d $M %y', 14, '{\"placeholder\":\"v\\u00ed d\\u1ee5: w, d\\/m\\/y\",\"comment\":\"trong \\u0111\\u00f3: %w l\\u00e0 ng\\u00e0y trong tu\\u1ea7n, %d l\\u00e0 ng\\u00e0y trong th\\u00e1ng, %m l\\u00e0 th\\u00e1ng b\\u00e0ng s\\u1ed1, %M l\\u00e0 th\\u00e1ng b\\u00e0ng t\\u00ean, %yy l\\u00e0 n\\u0103m\"}', 0),
(73, 266, 'news_footer', 'footer Widget', 'area', 'text', 'news_footer', 1, '[]', 0),
(74, 266, 'copyright', 'Copyright', 'text', 'text', NULL, 2, '[]', 0),
(75, 266, 'facebook', 'Facebook', 'text', 'text', NULL, 3, '{\"placeholder\":\"Li\\u00ean k\\u1ebft Facebook\"}', 0),
(76, 266, 'twitter', 'Twitter', 'text', 'text', NULL, 4, '{\"placeholder\":\"Li\\u00ean k\\u1ebft Twitter\"}', 0),
(77, 266, 'linkedin', 'LinkedIn', 'text', 'text', NULL, 5, '{\"placeholder\":\"Li\\u00ean k\\u1ebft LinkedIn\"}', 0),
(78, 266, 'youtube', 'Youtube', 'text', 'text', NULL, 6, '{\"placeholder\":\"Li\\u00ean k\\u1ebft Youtube\"}', 0),
(79, 267, 'widgets', 'Widgets', 'area', 'text', 'news_sidebar', 1, '[]', 0),
(80, 268, 'sections', 'Các mục xuất hiện trên trang chủ', 'area', 'text', 'home', 1, '[]', 0),
(81, 269, 'title', 'Tiêu đề giới thiệu (Tùy chọn)', 'text', 'text', NULL, 1, '[]', 0),
(82, 269, 'description', 'Mô tả (Tùy chọn)', 'textarea', 'text', NULL, 2, '[]', 0),
(83, 269, 'show_map', 'Hiển thị Bản đồ', 'switch', 'boolean', NULL, 3, '{\"check_label\":\"C\\u00f3\"}', 0),
(84, 269, 'place', 'Tên địa điểm', 'text', 'text', NULL, 4, '[]', 0),
(85, 269, 'lat', 'Vĩ độ (latitude)', 'text', 'text', NULL, 5, '[]', 0),
(86, 269, 'long', 'Vĩ độ (longitude)', 'text', 'text', NULL, 6, '[]', 0),
(87, 269, 'map_type', 'Loại bản đồ', 'radio', 'text', NULL, 7, '{\"data\":{\"lib\":\"D\\u00f9ng th\\u01b0 vi\\u1ec7n\",\"code\":\"D\\u00f9ng m\\u00e3 nh\\u00fang\"},\"default\":\"lib\"}', 0),
(88, 269, 'map_code', 'Mã nhúng bản đồ', 'textarea', 'text', NULL, 8, '{\"placeholder\":\"Nh\\u1eadp m\\u00e3 M\\u00e3 nh\\u00fang\"}', 0),
(89, 269, 'email', 'email', 'text', 'text', NULL, 9, '{\"Label\":\"Email\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"}', 0),
(90, 269, 'phone_number', 'phone_number', 'text', 'text', NULL, 10, '{\"Label\":\"S\\u1ed1 \\u0111i\\u1ec7n tho\\u1ea1i\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"}', 0),
(91, 269, 'address', 'address', 'text', 'text', NULL, 11, '{\"Label\":\"\\u0110\\u1ecba ch\\u1ec9\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"}', 0),
(92, 269, 'facebook', 'facebook (Tùy chọn)', 'text', 'text', NULL, 12, '{\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}', 0),
(93, 269, 'twitter', 'twitter (Tùy chọn)', 'text', 'text', NULL, 13, '{\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}', 0),
(94, 269, 'youtube', 'youtube (Tùy chọn)', 'text', 'text', NULL, 14, '{\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}', 0),
(95, 269, 'linkedin', 'Linkedin (Tùy chọn)', 'text', 'text', NULL, 15, '{\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}', 0),
(96, 269, 'instagram', 'instagram (Tùy chọn)', 'text', 'text', NULL, 16, '{\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}', 0),
(97, 269, 'pinterest', 'Pinterest (Tùy chọn)', 'text', 'text', NULL, 17, '{\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}', 0),
(98, 270, 'show_banner', 'Hiển thị banner quảng cáo', 'switch', 'boolean', '1', 1, '{\"check_label\":\"C\\u00f3\"}', 0),
(99, 270, 'banner_image', 'Banner 1248 x 130', 'file', 'text', NULL, 2, '[]', 0),
(100, 270, 'banner_alt', 'Chú thích banner', 'text', 'text', NULL, 3, '[]', 0),
(101, 270, 'banner_link', 'Liên kết', 'text', 'text', NULL, 4, '[]', 0),
(102, 270, 'ads_type', 'Loại quảng cáo', 'radio', 'text', NULL, 5, '{\"data\":{\"banner\":\"Banner\",\"code\":\"M\\u00e3 qu\\u1ea3ng c\\u00e1o\"},\"default\":\"banner\"}', 0),
(103, 270, 'ads_code', 'Mã quảng cáo', 'textarea', 'text', NULL, 6, '{\"placeholder\":\"Nh\\u1eadp m\\u00e3 qu\\u1ea3ng c\\u00e1o\"}', 0),
(104, 270, 'show_related_url', 'Hiển thị link các tin bài liên quan', 'switch', 'boolean', '1', 7, '{\"check_label\":\"C\\u00f3\"}', 0),
(105, 270, 'single_post', 'Các mục bổ xung', 'area', 'text', 'single_post', 8, '[]', 0),
(106, 271, 'single_page', 'Các mục bổ xung', 'area', 'text', 'single_post', 1, '[]', 0),
(107, 272, 'show', 'Hiển thị Text Slider (hero) ', 'switch', 'boolean', '1', 1, '{\"check_label\":\"C\\u00f3\"}', 0),
(108, 272, 'background', 'background', 'file', 'text', NULL, 2, '{\"Label\":\"H\\u00ecnh n\\u1ec1n\"}', 0),
(109, 272, 'sub_title', 'Tiêu đề trên', 'text', 'text', 'Connecting to the future', 3, '[]', 0),
(110, 272, 'static_title', 'Tiêu đề tĩnh', 'text', 'text', 'We are', 4, '[]', 0),
(111, 272, 'typed_title', 'Tiêu đề động (typed text)', 'text', 'text', 'Web Developer, Web Designer', 5, '[]', 0),
(112, 272, 'description', 'Mô tả', 'textarea', 'text', 'Our work is the presentation of our capabilities. Professionally myocardinate\n high standards in infrastructures and focused solutions. Completely actualize\n multifunctional best practices', 6, '{\"placeholder\":\"Nh\\u1eadp m\\u00f4 t\\u1ea3\"}', 0),
(113, 272, 'button_link', 'Button Link', 'text', 'text', '#service', 7, '[]', 0),
(114, 272, 'button_text', 'Button Text', 'text', 'text', 'Our Services', 8, '[]', 0),
(115, 273, 'show', 'Hiển thị promo ', 'switch', 'boolean', '1', 1, '{\"check_label\":\"C\\u00f3\"}', 0),
(116, 273, 'extra_class', 'Extra class', 'text', 'text', '', 2, '{\"placeholder\":\"V\\u00ed d\\u1ee5: bg-gray\"}', 0),
(117, 273, 'promos', 'Promo Items', 'area', 'text', 'promos', 3, '[]', 0),
(118, 274, 'show', 'Hiển thị phần giới thiệu ', 'switch', 'boolean', '1', 1, '{\"check_label\":\"C\\u00f3\"}', 0),
(119, 274, 'section_title', 'Tiêu đề section', 'text', 'text', 'Giới thiệu', 2, '[]', 0),
(120, 274, 'page_id', 'Trang giới thiệu (tùy chọn)', 'crazyselect', 'text', NULL, 3, '{\"call\":\"get_page_options\",\"params\":[[],\"Ch\\u1ecdn m\\u1ed9t\"]}', 0),
(121, 274, 'title', 'Tiêu đề giới thiệu', 'text', 'text', 'Đôi nét về chúng tôi', 4, '[]', 0),
(122, 274, 'description', 'Nội dung Giới thiệu', 'ckeditor', 'text', NULL, 5, '{\"height\":\"200\"}', 0),
(123, 274, 'image', 'Ảnh minh họa', 'file', 'text', NULL, 6, '[]', 0),
(124, 275, 'show', 'Hiển thị phần dịch vụ ', 'switch', 'boolean', '1', 1, '{\"check_label\":\"C\\u00f3\"}', 0),
(125, 275, 'sub_title', 'Tiêu đề nhỏ (tùy chọn)', 'text', 'text', '', 2, '[]', 0),
(126, 275, 'title', 'Tiêu đề', 'text', 'text', 'Dịch vụ', 3, '[]', 0),
(127, 275, 'services', 'Các dịch vụ', 'area', 'text', 'services', 4, '[]', 0),
(128, 276, 'show', 'Hiển thị mục Dự án', 'switch', 'boolean', '1', 1, '{\"check_label\":\"C\\u00f3\"}', 0),
(129, 276, 'sub_title', 'Tiêu đề phụ', 'text', 'text', NULL, 2, '[]', 0),
(130, 276, 'title', 'Tiêu đề', 'text', 'text', 'Dự án', 3, '[]', 0),
(131, 276, 'sorttype', 'Kiểu sắp xếp', 'crazyselect', 'text', '1', 4, '{\"call\":\"get_project_sortby_options\"}', 0),
(132, 276, 'project_number', 'Số lượng', 'number', 'text', '10', 5, '[]', 0),
(133, 277, 'show', 'Hiển thị trang Báo giá', 'switch', 'boolean', '1', 1, '{\"check_label\":\"C\\u00f3\"}', 0),
(134, 277, 'sub_title', 'Tiêu đề phụ', 'text', 'text', NULL, 2, '[]', 0),
(135, 277, 'title', 'Tiêu đề', 'text', 'text', 'Bảng giá', 3, '[]', 0),
(136, 277, 'description', 'Mô tả ', 'textarea', 'text', NULL, 4, '[]', 0),
(137, 277, 'layout', 'Layout', 'crazyselect', 'text', '1', 5, '{\"data\":{\"1\":\"4 \\/ 7\",\"2\":\"4 \\/ 8\",\"3\":\"3 \\/ 8\",\"4\":\"3 \\/ 9\"}}', 0),
(138, 277, 'tab_active', 'Tab kích hoạt', 'radio', 'text', NULL, 6, '{\"data\":{\"1\":\"Tab 1\",\"2\":\"Tab 2\",\"3\":\"Tab 3\"}}', 0),
(139, 277, 'tab_1_show', 'Hiển thị Tab 1', 'switch', 'boolean', '1', 7, '{\"check_label\":\"C\\u00f3\"}', 0),
(140, 277, 'tab_1_title', 'Tiêu đề tab 1', 'text', 'text', 'Basic', 8, '[]', 0),
(141, 277, 'tab_1_packages', 'Các gói trong tab 1', 'area', 'text', 'tab_1_packages', 9, '[]', 0),
(142, 277, 'tab_2_show', 'Hiển thị Tab 2', 'switch', 'boolean', NULL, 10, '{\"check_label\":\"C\\u00f3\"}', 0),
(143, 277, 'tab_2_title', 'Tiêu đề tab 2', 'text', 'text', '', 11, '[]', 0),
(144, 277, 'tab_2_packages', 'Các gói trong tab 2', 'area', 'text', 'tab_2_packages', 12, '[]', 0),
(145, 277, 'tab_3_show', 'Hiển thị Tab 3', 'switch', 'boolean', NULL, 13, '{\"check_label\":\"C\\u00f3\"}', 0),
(146, 277, 'tab_3_title', 'Tiêu đề tab 3', 'text', 'text', NULL, 14, '[]', 0),
(147, 277, 'tab_3_packages', 'Các gói trong tab 3', 'area', 'text', 'tab_3_packages', 15, '[]', 0),
(148, 278, 'show', 'Hiển thị Testimonials', 'switch', 'boolean', '1', 1, '[]', 0),
(149, 278, 'sub_title', 'Tiêu đề phụ', 'text', 'text', NULL, 2, '[]', 0),
(150, 278, 'title', 'Tiêu đề', 'text', 'text', 'Phản hồi từ khách hàng', 3, '[]', 0),
(151, 278, 'background', 'background', 'file', 'text', NULL, 4, '{\"Label\":\"H\\u00ecnh n\\u1ec1n\"}', 0),
(152, 278, 'list_type', 'Kiểu danh sách', 'radio', 'text', 'custom', 5, '{\"data\":{\"data\":\"Trong b\\u1ea3ng ph\\u1ea3n h\\u1ed3i\",\"custom\":\"Danh s\\u00e1ch t\\u00f9y bi\\u1ebfn\"}}', 0),
(153, 278, 'item_number', 'Số lượng', 'number', 'text', '0', 6, '[]', 0),
(154, 278, 'sort_type', 'Sắp xếp', 'crazyselect', 'text', 'id-ASC', 7, '{\"data\":{\"id-ASC\":\"M\\u1eb7c \\u0111\\u1ecbnh\",\"id-DESC\":\"M\\u1edbi nh\\u1ea5t\",\"name-ASC\":\"h\\u1ee9 t\\u1ef1 b\\u1ea3ng ch\\u1ef1 c\\u00e1i\"}}', 0),
(155, 278, 'testimonials', 'Danh sách phản hồi tùy biến', 'area', 'text', 'testimonials', 8, '{\"@title-by\":\"name\"}', 0),
(156, 279, 'show', 'Hiển thị Nhóm làm việc', 'switch', 'boolean', '1', 1, '[]', 0),
(157, 279, 'sub_title', 'Tiêu đề phụ', 'text', 'text', NULL, 2, '[]', 0),
(158, 279, 'title', 'Tiêu đề', 'text', 'text', 'Team', 3, '[]', 0),
(159, 279, 'list_type', 'Kiểu danh sách', 'radio', 'text', 'custom', 4, '{\"data\":{\"data\":\"Trong b\\u1ea3ng Nh\\u00f3m\",\"custom\":\"Danh s\\u00e1ch t\\u00f9y bi\\u1ebfn\"}}', 0),
(160, 279, 'team_id', 'Nhóm', 'crazyselect', 'text', NULL, 5, '{\"call\":\"get_team_options\",\"params\":[[],\"Ch\\u1ecdn nh\\u00f3m\"]}', 0),
(161, 279, 'item_number', 'Số lượng', 'number', 'text', '4', 6, '[]', 0),
(162, 279, 'sort_type', 'Sắp xếp', 'crazyselect', 'text', 'id-ASC', 7, '{\"data\":{\"id-ASC\":\"M\\u1eb7c \\u0111\\u1ecbnh\",\"id-DESC\":\"M\\u1edbi nh\\u1ea5t\",\"users.name-ASC\":\"th\\u1ee9 t\\u1ef1 b\\u1ea3ng ch\\u1ef1 c\\u00e1i\",\"is_leader-DESC\":\"\\u01afu ti\\u00ean tr\\u01b0\\u1edfng nh\\u00f3m\",\"job-ASC\":\"C\\u00f4ng vi\\u1ec7c (A-z)\",\"rand()\":\"Ng\\u1eabu nhi\\u00ean\"}}', 0),
(163, 279, 'members', 'Danh sách thành viên tùy biến', 'area', 'text', 'team_members', 8, '{\"@title-by\":\"name\"}', 0),
(164, 280, 'show', 'Hiển thị mục liên hệ', 'switch', 'boolean', '1', 1, '{\"check_label\":\"C\\u00f3\"}', 0),
(165, 280, 'sub_title', 'Tiêu đề phụ', 'text', 'text', NULL, 2, '[]', 0),
(166, 280, 'title', 'Tiêu đề', 'text', 'text', 'Dự án', 3, '[]', 0),
(167, 280, 'button_text', 'Nút gửi', 'text', 'text', 'Gửi liên hệ', 4, '[]', 0),
(168, 280, 'project_number', 'Số lượng', 'number', 'text', '10', 5, '[]', 0),
(169, 281, 'copyright', 'Tuyên bố bản quyền', 'text', 'text', NULL, 1, '[]', 0),
(170, 281, 'show_socials', 'Hiển thị MXH', 'switch', 'boolean', NULL, 2, '{\"check_label\":\"C\\u00f3\"}', 0),
(171, 281, 'facebook', 'Facebook', 'text', 'text', NULL, 3, '{\"placeholder\":\"Li\\u00ean k\\u1ebft Facebook\"}', 0),
(172, 281, 'twitter', 'Twitter', 'text', 'text', NULL, 4, '{\"placeholder\":\"Li\\u00ean k\\u1ebft Twitter\"}', 0),
(173, 281, 'linkedin', 'LinkedIn', 'text', 'text', NULL, 5, '{\"placeholder\":\"Li\\u00ean k\\u1ebft LinkedIn\"}', 0),
(174, 281, 'youtube', 'Youtube', 'text', 'text', NULL, 6, '{\"placeholder\":\"Li\\u00ean k\\u1ebft Youtube\"}', 0),
(175, 1, 'web_type', 'Loại web', 'radio', 'text', 'business', 1, '{\"required\":\"true\",\"template\":\"checklist\",\"call\":\"get_system_config\",\"params\":[\"web_type_list\"]}', 0),
(176, 282, 'show_top', 'Hiển thị text trung tâm', 'switch', 'boolean', '0', 1, '{\"check_label\":\"C\\u00f3\"}', 0),
(177, 283, 'footer', 'footer Widget', 'area', 'text', 'footer', 1, '[]', 0),
(178, 283, 'copyright', 'Copyright', 'text', 'text', NULL, 2, '[]', 0),
(179, 284, 'widgets', 'Post sidebar Widgets', 'area', 'text', 'sidebar_post', 1, '[]', 0),
(180, 286, 'page_title', 'Tiêu đề Trang liên hệ', 'text', 'text', 'Liên hệ', 1, '[]', 0),
(181, 286, 'page_description', 'Mô rả trang liên hệ', 'textarea', 'text', NULL, 2, '{\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3\"}', 0),
(182, 286, 'email', 'email', 'text', 'text', 'doanln16@gmail.com', 3, '{\"Label\":\"Email\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"}', 0),
(183, 286, 'phone_number', 'phone_number', 'text', 'text', '0945786960', 4, '{\"Label\":\"S\\u1ed1 \\u0111i\\u1ec7n tho\\u1ea1i\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"}', 0),
(184, 286, 'address', 'address', 'text', 'text', '172, đường Bà Triệu, tp. Hòa Bình', 5, '{\"Label\":\"\\u0110\\u1ecba ch\\u1ec9\",\"placeholder\":\"M\\u1eb7c d\\u1ecbnh s\\u1ebd l\\u1ea5y t\\u1eeb thi\\u1ebft l\\u1eadp th\\u00f4ng tin wwbsite\"}', 0),
(185, 286, 'form_title', 'Tiêu đề Form liên hệ', 'text', 'text', 'Hãy nói về những ý tưởng của bạn', 6, '[]', 0),
(186, 286, 'form_description', 'Mô rả / Giới thiệu', 'textarea', 'text', NULL, 7, '{\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3\"}', 0),
(187, 286, 'button_text', 'Nút gửi', 'text', 'text', 'Gửi liên hệ', 8, '[]', 0),
(188, 286, 'map_code', 'Mã nhúng bản đồ', 'textarea', 'text', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7460.325174749554!2d105.34500953207903!3d20.784709252940647!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31346b301d6dc449%3A0xd79703248d7378cb!2zMTcyIELDoCBUcmnhu4d1LCBDaMSDbSBNw6F0LCBIw7JhIELDrG5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1589342330149!5m2!1svi!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\" tabindex=\"0\"></iframe>', 9, '{\"placeholder\":\"Nh\\u1eadp m\\u00e3 M\\u00e3 nh\\u00fang\"}', 0),
(189, 287, 'facebook', 'facebook (Tùy chọn)', 'text', 'text', 'https://www.facebook.com/LeNgocDoan', 1, '{\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}', 0),
(190, 287, 'twitter', 'twitter (Tùy chọn)', 'text', 'text', 'https://twitter.com/NgocDoanLe', 2, '{\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}', 0),
(191, 287, 'youtube', 'youtube (Tùy chọn)', 'text', 'text', 'https://www.youtube.com/channel/UCIPikHMH4Br5xRWW_YIOOTw', 3, '{\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}', 0),
(192, 287, 'linkedin', 'Linkedin (Tùy chọn)', 'text', 'text', NULL, 4, '{\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}', 0),
(193, 287, 'instagram', 'instagram (Tùy chọn)', 'text', 'text', NULL, 5, '{\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}', 0),
(194, 287, 'pinterest', 'Pinterest (Tùy chọn)', 'text', 'text', NULL, 6, '{\"placeholder\":\"Kh\\u00f4ng b\\u1eaft bu\\u1ed9c\"}', 0),
(195, 282, 'logo_light', 'Logo Trắng (light)', 'file', 'text', 'logo_light.png', 3, '[]', 0),
(196, 282, 'logo', 'Logo', 'file', 'text', 'logo.png', 2, '[]', 0),
(197, 285, 'home', 'Thành phàn trang chủ', 'area', 'text', 'home', 1, '{\"@title-by\":\"title\"}', 0),
(198, 285, 'home_services', 'Danh sách dịch vụ', 'area', 'text', 'home_services', 2, '{\"@title-by\":\"title\"}', 0),
(199, 285, 'testimonials', 'Danh sách phản hồi tùy biến', 'area', 'text', 'testimonials', 3, '{\"@title-by\":\"name\"}', 0),
(200, 285, 'members', 'Danh sách thành viên tùy biến', 'area', 'text', 'team_members', 4, '{\"@title-by\":\"name\"}', 0),
(201, 285, 'contact_faq', 'Các Câu hỏi thường gặp', 'area', 'text', 'contact_faq', 5, '{\"@title-by\":\"title\"}', 0),
(202, 285, 'home_pricing', 'báo giá Các gói dịch vụ', 'area', 'text', 'home_pricing', 6, '{\"@title-by\":\"title\"}', 0),
(203, 282, 'page_header_background', 'Hình nền đầu trang mặc định (Tùy chọn)', 'file', 'text', NULL, 4, '[]', 0),
(204, 282, 'page_header_padding_y', 'Căn trên dưới đầu trang (px)', 'number', 'text', '100', 5, '{\"default\":\"160\"}', 0),
(205, 282, 'page_header_breakcrumb_bottom', 'breakcrumb position-Bottom (px)', 'number', 'text', '-125', 6, '{\"default\":\"-180\"}', 0),
(206, 288, 'page_header_background', 'Hình nền đầu trang mặc định (Tùy chọn)', 'file', 'text', NULL, 1, '[]', 0),
(207, 289, 'page_header_background', 'Hình nền đầu trang mặc định (Tùy chọn)', 'file', 'text', NULL, 1, '[]', 0),
(208, 290, 'page_header_background', 'Hình nền đầu trang mặc định (Tùy chọn)', 'file', 'text', NULL, 1, '[]', 0),
(209, 291, 'page_header_background', 'Hình nền đầu trang mặc định (Tùy chọn)', 'file', 'text', NULL, 1, '[]', 0),
(210, 291, 'page_header_padding_y', 'Căn trên dưới đầu trang (px)', 'number', 'text', NULL, 2, '{\"default\":\"160\"}', 0),
(211, 291, 'page_header_breakcrumb_bottom', 'Link position-Bottom (px)', 'number', 'text', NULL, 3, '{\"default\":\"-180\"}', 0),
(212, 282, 'page_header_breadcrumb_bottom', 'breakcrumb position-Bottom (px)', 'number', 'text', '-125', 6, '{\"default\":\"-180\"}', 0),
(213, 284, 'project_widgets', 'project sidebar Widgets', 'area', 'text', 'sidebar_project', 2, '[]', 0),
(214, 284, 'page_widgets', 'page sidebar Widgets', 'area', 'text', 'sidebar_page', 3, '{\"default\":\"sidebar_page\"}', 0),
(215, 286, 'faq_title', 'Tiêu đề FAQ (Tùy chọn)', 'text', 'text', NULL, 10, '[]', 0),
(216, 286, 'contact_faq', 'Các Câu hỏi thường gặp', 'area', 'text', 'contact_faq', 11, '{\"@title-by\":\"title\"}', 0),
(217, 292, 'logo', 'Logo', 'file', 'text', NULL, 1, '[]', 0),
(218, 292, 'logo_light', 'Logo Trắng (light)', 'file', 'text', NULL, 2, '[]', 0),
(219, 292, 'register_title', 'Tiêu đề mục đăng ký', 'text', 'text', 'Đăng ký để nhận tài khoản dùng thử miển phí', 3, '[]', 0),
(220, 292, 'register_description', 'Mô rả mục đăng ký', 'textarea', 'text', 'Bạn chỉ cần nêu ra những ý tưởng, phần còn lại để chúng tôi lo!', 4, '{\"placeholder\":\"Vi\\u1ebft g\\u00ec \\u0111\\u00f3\"}', 0),
(221, 2, 'admin_page_logo', 'Logo trang admin', 'file', 'text', 'admin_page_logo.png', 7, NULL, 1),
(222, 2, 'admin_login_logo', 'Logo trang login', 'file', 'text', 'admin_login_logo.png', 8, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `option_groups`
--

CREATE TABLE `option_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'settings',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'settings',
  `config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `option_groups`
--

INSERT INTO `option_groups` (`id`, `option_id`, `label`, `slug`, `config`) VALUES
(1, 1, 'Cài đặt hệ thống', 'system', NULL),
(2, 1, 'Thông tin website', 'siteinfo', NULL),
(19, 1, 'Thiết lập cửa hàng', 'ecommerce', NULL),
(29, 1, 'Thiết lập thanh toán', 'payments', NULL),
(30, 1, 'Thiết lập Email', 'mailer', NULL),
(63, 1, 'Thiết lập hiển thị', 'display', NULL),
(259, 1, 'Javascript SDK', 'jssdk', NULL),
(260, 1, 'Thiết lập tin bài', 'posts', NULL),
(261, 1, 'Thiết lập trang Sản phẩm', 'products', NULL),
(262, 1, 'Thiết lập trang Dự án', 'projects', NULL),
(263, 1, 'Web Setting', 'websettings', NULL),
(264, 2, 'Styling', 'styling', '[]'),
(265, 2, 'Header', 'header', '{\"name\":\"Header\",\"layout_type\":\"single\",\"form_groups\":{\"logos\":{\"title\":\"Logo\",\"inputs\":[\"show_text_logo\",\"text_logo_primary\",\"text_logo_second\",\"highlight\",\"text_logo_slogan\"]},\"banner\":{\"title\":\"Banner qu\\u1ea3ng c\\u00e1o\",\"inputs\":[\"show_banner\",\"banner_image\",\"banner_alt\",\"banner_link\",\"ads_type\",\"ads_code\"]},\"datetime\":{\"title\":\"Ng\\u00e0y th\\u00e1ng\",\"inputs\":[\"show_datetime\",\"datetime_lang\",\"date_format\"]}}}'),
(266, 2, 'Footer', 'footer', '[]'),
(267, 2, 'Sidebar', 'sidebar', '[]'),
(268, 2, 'Trang chủ', 'home', '[]'),
(269, 2, 'Liên hệ', 'contacts', '{\"name\":\"Th\\u00f4ng tin trang li\\u00ean h\\u1ec7\",\"layout_type\":\"single\",\"form_groups\":[{\"title\":\"Trang li\\u00ean h\\u1ec7\",\"inputs\":[\"title\",\"description\",\"show_map\",\"place\",\"lat\",\"long\",\"map_type\",\"map_code\"]},{\"title\":\"Th\\u00f4ng tin li\\u00ean h\\u1ec7\",\"inputs\":[\"address\",\"phone_number\",\"email\"]},{\"title\":\"Li\\u00ean k\\u1ebft m\\u1ea1ng x\\u00e3 h\\u1ed9i\",\"inputs\":[\"facebook\",\"twitter\",\"youtube\",\"linkedin\",\"instagram\",\"pinterest\",\"tumblr\"]}]}'),
(270, 2, 'Chi tiết tin', 'single', '[]'),
(271, 2, 'Chi tiết Page', 'page', '[]'),
(272, 3, 'Banner', 'hero', '[]'),
(273, 3, 'Promo', 'promo', '[]'),
(274, 3, 'Giới thiệu', 'about', '[]'),
(275, 3, 'Dịch vụ', 'services', '[]'),
(276, 3, 'Dự án', 'projects', '[]'),
(277, 3, 'Báo giá', 'pricing', '[]'),
(278, 3, 'Testimonials', 'testimonials', '[]'),
(279, 3, 'Team', 'team', '[]'),
(280, 3, 'Liên hệ', 'contact', '[]'),
(281, 3, 'Footer', 'footer', '[]'),
(282, 4, 'Header', 'header', '[]'),
(283, 4, 'Footer', 'footer', '[]'),
(284, 4, 'Sidebar', 'sidebar', '[]'),
(285, 4, 'Trang chủ', 'home', '[]'),
(286, 4, 'Liên hệ', 'contacts', '[]'),
(287, 4, 'MXH', 'socials', '[]'),
(288, 4, 'Bài viết', 'posts', '[]'),
(289, 4, 'Trang', 'pages', '[]'),
(290, 4, 'Dự án', 'projects', '[]'),
(291, 4, 'Search', 'search', '[]'),
(292, 4, 'Forms', 'forms', '[]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT 0,
  `customer_id` bigint(20) UNSIGNED DEFAULT 0,
  `secret_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'cart',
  `ship_to_different_address` tinyint(1) NOT NULL DEFAULT 0,
  `payment_method` int(11) NOT NULL DEFAULT 0,
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(14,2) NOT NULL DEFAULT 0.00,
  `sub_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_money` decimal(14,2) NOT NULL DEFAULT 0.00,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_address`
--

CREATE TABLE `order_address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'billing',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `district_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `ward_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_feedback`
--

CREATE TABLE `order_feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT 0,
  `user_id` bigint(20) UNSIGNED DEFAULT 0,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'feedback',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solved` int(11) NOT NULL DEFAULT 0,
  `solved_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attr_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `list_price` decimal(12,2) UNSIGNED DEFAULT 0.00,
  `final_price` decimal(12,2) UNSIGNED DEFAULT 0.00,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_modules`
--

CREATE TABLE `permission_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission_modules`
--

INSERT INTO `permission_modules` (`id`, `type`, `name`, `parent_id`, `ref`, `description`, `created_at`, `updated_at`) VALUES
(1, 'prefix', 'Trang quản trị', 0, 'admin', NULL, '2020-03-14 08:23:53', '2020-03-14 08:23:53'),
(2, 'prefix', 'Quản lý user', 0, 'admin/users', NULL, '2020-03-14 08:29:06', '2020-03-14 08:29:06'),
(3, 'prefix', 'Quản lý phân quyền: Quyền truy cập', 0, 'admin/permissions/roles', NULL, '2020-03-14 08:30:21', '2020-03-14 08:30:21'),
(4, 'prefix', 'Quản lý phân quyền: Module', 0, 'admin/permissions/modules', NULL, '2020-03-14 08:34:00', '2020-03-14 08:34:00'),
(5, 'prefix', 'Quản lý trang', 0, 'admin/pages', NULL, '2020-03-14 08:41:40', '2020-03-14 08:41:40'),
(6, 'prefix', 'Quản lý nội dung', 0, 'admin/dynamics', NULL, '2020-03-14 08:42:45', '2020-03-14 08:42:45'),
(7, 'prefix', 'Quản lý giao diện', 0, 'admin/themes', NULL, '2020-03-14 08:43:29', '2020-03-14 08:43:29'),
(8, 'prefix', 'Quản lý thiết lập', 0, 'admin/settings', NULL, '2020-03-14 09:06:11', '2020-03-14 09:06:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_module_roles`
--

CREATE TABLE `permission_module_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission_module_roles`
--

INSERT INTO `permission_module_roles` (`id`, `module_id`, `role_id`) VALUES
(2, 2, 1),
(3, 1, 2),
(4, 3, 1),
(5, 4, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_roles`
--

CREATE TABLE `permission_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'redirect',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission_roles`
--

INSERT INTO `permission_roles` (`id`, `name`, `level`, `description`, `handle`, `return_type`, `created_at`, `updated_at`) VALUES
(1, 'Quyền quản trị', 3, NULL, NULL, 'redirect', '2020-03-14 08:13:55', '2020-03-14 08:13:55'),
(2, 'Quyền truy cập', 1, NULL, NULL, 'redirect', '2020-03-14 08:14:15', '2020-03-14 08:14:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_user_roles`
--

CREATE TABLE `permission_user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission_user_roles`
--

INSERT INTO `permission_user_roles` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `dynamic_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `category_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `category_map` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `privacy` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `dynamic_id`, `parent_id`, `category_id`, `category_map`, `type`, `content_type`, `title`, `slug`, `keywords`, `description`, `content`, `feature_image`, `views`, `privacy`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 2, ' 2,', 'project', 'text', 'Mua Gì đây', 'mua-gi-day', NULL, 'Trang web bán hàng demo dịch vụ của DoanLN - DH Team', '<p>Hệ thống được x&acirc;y dựng tr&ecirc;n nền tảng PHP kết hợp sử dụng framework Laravel cho tốc độ xử l&yacute; nhanh, mạnh mẽ v&agrave; bảo mật. Hệ thống quản l&yacute; sản phẩm, đơn h&agrave;ng được thiết kế để tối ưu cho trang b&aacute;n h&agrave;ng - Thương mại điện tử</p>', '000-5e120ed904999-5eaaedd17ff65.png', 0, 'public', 0, '2020-04-30 15:25:06', '2020-05-28 10:04:52'),
(2, 1, 0, 0, 1, ' 1,', 'project', 'text', 'Hoàng Trung Express', 'hoang-trung-express', NULL, 'Trang web quản lý nhà xe, tra cứu lịch trình, thông tin giá vé...', '<div class=\"biz-project-popup-text\">\r\n<p>Hệ thống được x&acirc;y dựng tr&ecirc;n nền tảng PHP kết hợp sử dụng framework Laravel cho tốc độ xử l&yacute; nhanh, mạnh mẽ v&agrave; bảo mật</p>\r\n</div>\r\n<div class=\"project-meta\">&nbsp;</div>', 'hoang-trung-5e120a18d113d-5eaaefb052e33.png', 0, 'public', 0, '2020-04-30 15:32:25', '2020-05-28 10:05:10'),
(3, 1, 0, 0, 1, ' 1,', 'project', 'text', 'An Lộc Phát', 'an-loc-phat', NULL, 'Website chính thức của AN LOC PHAT INTERNATIONAL, JSC.', '<p>Hệ thống được x&acirc;y dựng tr&ecirc;n nền tảng PHP kết hợp sử dụng framework Laravel cho tốc độ xử l&yacute; nhanh, mạnh mẽ v&agrave; bảo mật</p>', 'hoang-trung-5e120a18d113d-5eaaf06357ded.png', 0, 'public', 0, '2020-04-30 15:36:03', '2020-05-28 10:13:52'),
(4, 1, 0, 0, 1, ' 1,', 'project', 'text', 'Laptop Xiaomi', 'laptop-xiaomi', NULL, 'Website chính thức chuyên bán laptop và các sản phẩm của Xiaomi tại Việt Nam.', '<div class=\"biz-project-popup-text\">\r\n<p>Được ph&aacute;t triển v&agrave; sử dụng CMS Wordpress, trang web c&oacute; c&aacute;c dặc t&iacute;nh dễ d&agrave;ng sử dụng v&agrave; th&acirc;n tiện với người d&ugrave;ng,bộ c&ocirc;ng cũ quản l&yacute; mạnh mẽ</p>\r\n</div>\r\n<div class=\"project-meta\">&nbsp;</div>', 'laptop-gio-hang-5e120809eba32-5eaaf10d863f7.png', 0, 'public', 0, '2020-04-30 15:38:53', '2020-05-28 10:14:22'),
(5, 1, 0, 0, 1, ' 1,', 'project', 'text', 'Xiaomi Ninh Bình', 'xiaomi-ninh-binh', NULL, 'Trang web Chuyên Điện Thoại – Phụ Kiện – Thiết bị thông minh Xiaomi chính hãng – Giao hàng nhanh toàn quốc.', '<p>Được ph&aacute;t triển v&agrave; sử dụng CMS Wordpress, trang web c&oacute; c&aacute;c dặc t&iacute;nh dễ d&agrave;ng sử dụng v&agrave; th&acirc;n tiện với người d&ugrave;ng,bộ c&ocirc;ng cũ quản l&yacute; mạnh mẽ</p>', 'xiao-mi-nb-2-5e1206bebcaf8-5eaaf1ce2f00f.png', 0, 'public', 0, '2020-04-30 15:42:06', '2020-05-28 10:14:33'),
(6, 1, 0, 0, 1, ' 1,', 'project', 'text', 'Trồng Trọt Công Nghệ Cao', 'trong-trot-cong-nghe-cao', NULL, 'Trồng Trọt Công nghệ Cao là bộ phận trực thuộc Công ty cổ phần Nông nghiệp và Thực phẩm Agricook, tiền thân là Trung Tâm Công Nghệ, Môi Trường và Tài Nguyên (CTER).', '<p>Trồng Trọt C&ocirc;ng nghệ Cao l&agrave; bộ phận trực thuộc C&ocirc;ng ty cổ phần N&ocirc;ng nghiệp v&agrave; Thực phẩm Agricook, tiền th&acirc;n l&agrave; Trung T&acirc;m C&ocirc;ng Nghệ, M&ocirc;i Trường v&agrave; T&agrave;i Nguy&ecirc;n (CTER).<br /><br />Trang web được ph&aacute;t triển dựa tr&ecirc;n nền tảng PHP v&agrave; sử dụng Framework Laravel</p>', 'untitled-5e1201c220269-5eaaf22e95696.png', 0, 'public', 0, '2020-04-30 15:43:42', '2020-05-28 10:14:45'),
(7, 1, 3, 0, 3, ' 3,', 'post', 'text', 'Điều giúp iPhone SE 2020 rẻ, camera đơn vẫn chụp đẹp', 'dieu-giup-iphone-se-2020-re-camera-don-van-chup-dep', NULL, 'Dù trang bị cảm biến máy ảnh giống như iPhone 8, iPhone SE lại được Apple ưu ái về mặt phần mềm và hiện đại hơn rất nhiều.', NULL, 'screenshot-4-5eace350c6882.png', 0, 'public', 0, '2020-05-02 03:04:49', '2020-05-02 03:04:49'),
(8, 1, 3, 0, 4, ' 4,', 'post', 'text', 'CÔNG NGHỆ  Laptop cũ của bạn sắp chạy mượt hơn', 'cong-nghe-laptop-cu-cua-ban-sap-chay-muot-hon', NULL, 'Một vấn đề \"kinh điển\" khiến laptop chạy chậm sẽ được khắc phục trong bản cập nhật Windows dự kiến phát hành vào tháng sau.', NULL, 'z23729042020-5eace3c4280f0.jpg', 0, 'public', 0, '2020-05-02 03:06:44', '2020-05-02 03:06:44'),
(9, 1, 3, 0, 4, ' 4,', 'post', 'text', 'Google tìm ra rất nhiều lỗ hổng của Apple', 'google-tim-ra-rat-nhieu-lo-hong-cua-apple', NULL, 'Nhóm chuyên tìm lỗi Project Zero của Google đã phát hiện loạt lỗ hổng bảo mật “zero-click” trên iPhone và các sản phẩm phần cứng nhà Táo.', NULL, 'maxresdefault-5eace425a8749.jpg', 0, 'public', 0, '2020-05-02 03:08:21', '2020-05-02 03:08:21'),
(10, 1, 0, 0, 0, NULL, 'page', 'text', 'Giới thiệu', 'gioi-thieu', NULL, 'Không phải chỉ vì miếng cơm manh áo, chúng tôi làm web vì tình yêu và đam mê cùng với khao khát thể hiện bãn thân. Với chiết lý: Dám nghĩ - dám làm, Dám ước mơ và dám thực hiện. Chúng tôi luôn cố gắng để mang đến bạn những dịch vụ tốt nhất với giá cả phải chăng nhất.', '<p>Ch&uacute;ng t&ocirc;i với hoạt động duy nhất l&agrave; nghi&ecirc;n cứu kỹ thuật v&agrave; thiết kế website. Cho tới nay đ&atilde; x&acirc;y dựng website cho nhiều đối t&aacute;c trong v&agrave; ngo&agrave;i nước. B&ecirc;n cạnh đ&oacute; l&agrave; h&agrave;ng loạt website cho những kh&aacute;ch h&agrave;ng tầm cỡ v&agrave; c&oacute; thứ hạng truy cập cao dựa tr&ecirc;n c&ocirc;ng nghệ lập tr&igrave;nh, DH Team cung cấp nhiều giải ph&aacute;p v&agrave; c&ocirc;ng nghệ tối ưu h&oacute;a cho việc quản trị &ndash; quảng b&aacute; website, giảm chi ph&iacute; nh&acirc;n sự, gi&uacute;p cho việc quản trị trở n&ecirc;n đơn giản, dễ hiểu, bạn chỉ cần xem qua l&agrave; c&oacute; thể quản trị m&agrave; kh&ocirc;ng cần đọc hướng dẫn sử dụng. Đội ngũ lập tr&igrave;nh vi&ecirc;n của DH Team c&oacute; tư duy tốt, kỹ thuật chuy&ecirc;n m&ocirc;n cao, say m&ecirc; c&ocirc;ng việc, lu&ocirc;n &aacute;p dụng c&ocirc;ng nghệ mới nhất v&agrave;o sản phẩm.</p>', 'skills-for-web-designer-5e11ae6fa777d-5ebdf582c02ab.jpg', 0, 'public', 0, '2020-05-15 01:30:23', '2020-05-15 01:50:59'),
(11, 1, 0, 0, 2, ' 2,', 'project', 'text', 'Moon Dental Studio', 'moon-dental-studio', NULL, 'Hệ thống Nha khoa thẩm mỹ Uy tín hàng đầu Việt Nam', '<p>Hệ thống Nha khoa thẩm mỹ Uy t&iacute;n h&agrave;ng đầu Việt Nam</p>\r\n<p><img src=\"/static/files/2020/05/28/screencapture-moondental-vn-2020-05-28-17_18_14-5ecf9104dd9e9.png\" alt=\"screencapture-moondental-vn-2020-05-28-17_18_14.png\" /></p>', 'screencapture-moondental-vn-2020-05-28-17-18-14-5ecf91178d350.png', 0, 'public', 0, '2020-05-28 10:23:19', '2020-05-28 10:23:19'),
(12, 1, 2, 0, 6, ' 6,', 'post', 'text', 'Gói tiêu chuẩn', 'goi-tieu-chuan', NULL, 'Gói dịch vụ web trọn gói tiêu chuẩn bao gồm Hosting và tên miền', '<p>G&oacute;i dịch vụ web trọn g&oacute;i ti&ecirc;u chuẩn bao gồm Hosting v&agrave; t&ecirc;n miền</p>\r\n<p>{$pricing_table}</p>', 'unnamed-5ed4861f994ea.jpg', 0, 'public', 0, '2020-06-01 04:37:51', '2020-06-01 11:42:12'),
(13, 1, 2, 0, 6, ' 6,', 'post', 'text', 'Gói Blog', 'goi-blog', NULL, 'Trang blog cá nhân', '<p>Trang blog c&aacute; nh&acirc;n</p>\r\n<p>{$pricing_table}</p>', 'aaaa-5ed487d673458.jpg', 0, 'public', 0, '2020-06-01 04:45:10', '2020-06-01 11:41:43'),
(14, 1, 2, 0, 6, ' 6,', 'post', 'text', 'Trang Cá nhân', 'trang-ca-nhan', NULL, 'Trang cá nhân. nơi lưu trữ các thông tin như là 1 CV Online', '<p>Trang c&aacute; nh&acirc;n. nơi lưu trữ c&aacute;c th&ocirc;ng tin như l&agrave; 1 CV Online</p>\r\n<p>{$pricing_table}</p>', 'portfolio-la-gi-01-24-5ed4b418b0e87.jpg', 0, 'public', 0, '2020-06-01 07:54:00', '2020-06-01 11:41:26'),
(15, 1, 2, 0, 6, ' 6,', 'post', 'text', 'Business', 'business', NULL, 'Trang web giới thiệu doanh nghiệp', '<p>Trang web giới thiệu doanh nghiệp</p>\r\n<p>{$pricing_table}</p>', 'business-corporate-website-inspiration-web-design-ui-07-5ed4bdec5447e.jpg', 0, 'public', 0, '2020-06-01 08:35:56', '2020-06-01 11:40:59'),
(16, 1, 2, 0, 6, ' 6,', 'post', 'text', 'Trang tin tức', 'trang-tin-tuc', NULL, 'Trang tin tức với các công cụ hỗ trợ chuyên biệt', '<p>Trang tin tức với c&aacute;c c&ocirc;ng cụ hỗ trợ chuy&ecirc;n biệt</p>\r\n<p>{$pricing_table}</p>', 'google-news-t-5ed4bf58de3cb.jpg', 0, 'public', 0, '2020-06-01 08:42:01', '2020-06-01 11:40:43'),
(17, 1, 2, 0, 6, ' 6,', 'post', 'text', 'Thương mại điện tử', 'thuong-mai-dien-tu', NULL, 'Thương mại điện tử. Với các tính năng và công cụ hỗ trợ cho Thương mại điện tử', '<p>Thương mại điện tử. Với c&aacute;c t&iacute;nh năng v&agrave; c&ocirc;ng cụ hỗ trợ cho Thương mại điện tử</p>\r\n<p>{$pricing_table}</p>', 'ecommerce-01-5ed4c0125b385.png', 0, 'public', 0, '2020-06-01 08:45:06', '2020-06-01 11:03:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_views`
--

CREATE TABLE `post_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `view_date` date DEFAULT NULL,
  `view_total` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_price` decimal(12,2) UNSIGNED DEFAULT 0.00,
  `sale_price` decimal(12,2) UNSIGNED DEFAULT 0.00,
  `on_sale` int(10) UNSIGNED DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `privacy` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `category_map` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `shop_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_value_id` bigint(20) UNSIGNED NOT NULL,
  `advance_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,2) UNSIGNED DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_attribute_price`
--

CREATE TABLE `product_attribute_price` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_price` decimal(12,2) UNSIGNED DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_refs`
--

CREATE TABLE `product_refs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'link',
  `ref_id` bigint(20) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT 0,
  `rating` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `approved_id` bigint(20) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promos`
--

CREATE TABLE `promos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(10) UNSIGNED DEFAULT 0,
  `down_price` decimal(12,2) DEFAULT 0.00,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) DEFAULT 0,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `web_type`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'Basic', 'Gói dịch vụ web tiêu chuẩn', 'default', 0, '2020-05-30 18:07:24', '2020-06-01 02:50:05'),
(2, 'Blog', 'Trang blog cá nhân', 'blog', 0, '2020-06-01 02:23:18', '2020-06-01 02:50:51'),
(3, 'Trang Cá nhân', 'Trang cá nhân. nơi lưu trữ các thông tin như là 1 CV Online', 'personal', 0, '2020-06-01 02:26:02', '2020-06-01 02:52:35'),
(4, 'Business', 'Trang web giới thiệu doanh nghiệp', 'business', 0, '2020-06-01 02:30:38', '2020-06-01 02:53:33'),
(5, 'Tin tức', 'Trang tin tức với các công cụ hỗ trợ chuyên biệt', 'news', 0, '2020-06-01 02:37:28', '2020-06-01 02:55:13'),
(6, 'Thương mại điện tử', 'Thương mại điện tử. Với các tính năng và công cụ hỗ trợ cho Thương mại điện tử', 'ecommerce', 0, '2020-06-01 02:47:51', '2020-06-01 02:56:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service_packages`
--

CREATE TABLE `service_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Demo',
  `account_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'demo',
  `service_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `features` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` bigint(20) DEFAULT 0,
  `maintenance_fee` bigint(20) DEFAULT 0,
  `cycle_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'year',
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `service_packages`
--

INSERT INTO `service_packages` (`id`, `package_name`, `account_type`, `service_id`, `features`, `price`, `maintenance_fee`, `cycle_unit`, `deleted`, `created_at`, `updated_at`) VALUES
(2, 'Dùng thử', 'demo', 1, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[f] Hỗ trợ trỏ domain\r\n[f] Hỗ trợ kỹ thuật\r\n[f] Full tính năng\r\n[f] Toàn quyền sử dụng mã nguồn', NULL, NULL, 'year', 0, '2020-06-01 01:58:14', '2020-06-01 11:39:54'),
(3, 'Pro', 'pro', 1, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[t] Hỗ trợ trỏ domain\r\n[t] Hỗ trợ kỹ thuật\r\n[f] Full tính năng\r\n[f] Toàn quyền sử dụng mã nguồn', 4000000, 1200000, 'year', 0, '2020-06-01 01:58:14', '2020-06-01 11:39:54'),
(4, 'Max', 'max', 1, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[t] Hỗ trợ trỏ domain\r\n[t] Hỗ trợ kỹ thuật\r\n[t] Full tính năng\r\n[t] Toàn quyền sử dụng mã nguồn', 6000000, 1200000, 'year', 0, '2020-06-01 01:58:14', '2020-06-01 11:39:54'),
(5, 'Dùng thử', 'demo', 2, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[f] Hỗ trợ trỏ domain\r\n[f] Hỗ trợ kỹ thuật\r\n[f] Full tính năng\r\n[f] Toàn quyền sử dụng mã nguồn', NULL, NULL, 'year', 0, '2020-06-01 02:23:18', '2020-06-01 11:38:40'),
(6, 'Pro', 'pro', 2, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[t] Hỗ trợ trỏ domain\r\n[t] Hỗ trợ kỹ thuật\r\n[f] Full tính năng\r\n[f] Toàn quyền sử dụng mã nguồn', 2000000, 800000, 'year', 0, '2020-06-01 02:23:18', '2020-06-01 11:38:40'),
(7, 'Max', 'max', 2, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[t] Hỗ trợ trỏ domain\r\n[t] Hỗ trợ kỹ thuật\r\n[t] Full tính năng\r\n[t] Toàn quyền sử dụng mã nguồn', 3000000, 1000000, 'year', 0, '2020-06-01 02:23:18', '2020-06-01 11:38:40'),
(8, 'Dùng thử', 'demo', 3, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[f] Hỗ trợ trỏ domain\r\n[f] Hỗ trợ kỹ thuật\r\n[f] Full tính năng\r\n[f] Toàn quyền sử dụng mã nguồn', NULL, NULL, 'year', 0, '2020-06-01 02:26:02', '2020-06-01 11:36:34'),
(9, 'Pro', 'pro', 3, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[t] Hỗ trợ trỏ domain\r\n[t] Hỗ trợ kỹ thuật\r\n[f] Full tính năng\r\n[f] Toàn quyền sử dụng mã nguồn', 2000000, 800000, 'year', 0, '2020-06-01 02:26:02', '2020-06-01 11:36:34'),
(10, 'Max', 'max', 3, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[t] Hỗ trợ trỏ domain\r\n[t] Hỗ trợ kỹ thuật\r\n[t] Full tính năng\r\n[t] Toàn quyền sử dụng mã nguồn', 3000000, 1000000, 'year', 0, '2020-06-01 02:26:02', '2020-06-01 11:36:34'),
(11, 'Dùng thử', 'demo', 4, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[f] Hỗ trợ trỏ domain\r\n[f] Hỗ trợ kỹ thuật\r\n[f] Full tính năng\r\n[f] Toàn quyền sử dụng mã nguồn', NULL, NULL, 'year', 0, '2020-06-01 02:30:38', '2020-06-01 11:35:13'),
(12, 'Pro', 'pro', 4, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[t] Hỗ trợ trỏ domain\r\n[f] Hỗ trợ kỹ thuật\r\n[t] Full tính năng\r\n[f] Toàn quyền sử dụng mã nguồn', 4000000, 1000000, 'year', 0, '2020-06-01 02:30:38', '2020-06-04 09:54:28'),
(13, 'Max', 'max', 4, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[t] Hỗ trợ trỏ domain\r\n[t] Hỗ trợ kỹ thuật\r\n[t] Full tính năng\r\n[t] Toàn quyền sử dụng mã nguồn', 6000000, 12000000, 'year', 0, '2020-06-01 02:30:38', '2020-06-04 09:54:28'),
(14, 'Dùng thử', 'demo', 5, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[f] Hỗ trợ trỏ domain\r\n[f] Hỗ trợ kỹ thuật\r\n[f] Full tính năng\r\n[f] Toàn quyền sử dụng mã nguồn', NULL, NULL, 'year', 0, '2020-06-01 02:37:28', '2020-06-01 11:33:52'),
(15, 'Pro', 'pro', 5, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[t] Hỗ trợ trỏ domain\r\n[t] Hỗ trợ kỹ thuật\r\n[f] Full tính năng\r\n[f] Toàn quyền sử dụng mã nguồn', 4000000, 1200000, 'year', 0, '2020-06-01 02:37:28', '2020-06-01 11:33:52'),
(16, 'Max', 'max', 5, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[t] Hỗ trợ trỏ domain\r\n[t] Hỗ trợ kỹ thuật\r\n[t] Full tính năng\r\n[t] Toàn quyền sử dụng mã nguồn', 6000000, 1500000, 'year', 0, '2020-06-01 02:37:29', '2020-06-01 11:33:52'),
(17, 'Dùng thử', 'demo', 6, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[f] Hỗ trợ trỏ domain\r\n[f] Hỗ trợ kỹ thuật\r\n[f] Full tính năng\r\n[f] Toàn quyền sử dụng mã nguồn', NULL, NULL, 'year', 0, '2020-06-01 02:47:51', '2020-06-01 11:20:09'),
(18, 'Pro', 'pro', 6, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[t] Hỗ trợ trỏ domain\r\n[t] Hỗ trợ kỹ thuật\r\n[f] Full tính năng\r\n[f] Toàn quyền sử dụng mã nguồn', 8000000, 1500000, 'year', 0, '2020-06-01 02:47:51', '2020-06-01 11:20:09'),
(19, 'Max', 'max', 6, '[t] Miễn phí hosting\r\n[t] Miễn phí tên miền cấp 2\r\n[t] Hỗ trợ trỏ domain\r\n[t] Hỗ trợ kỹ thuật\r\n[t] Full tính năng\r\n[t] Toàn quyền sử dụng mã nguồn', 12000000, 2000000, 'year', 0, '2020-06-01 02:47:51', '2020-06-01 11:20:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Slider',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'slider',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `crop` tinyint(1) DEFAULT 0,
  `width` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `height` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `slug`, `description`, `priority`, `crop`, `width`, `height`, `status`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'Main', 'test', '00000000', 1, 0, 1200, 400, 1, 0, '2020-03-14 10:09:28', '2020-03-25 14:26:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider_items`
--

CREATE TABLE `slider_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_id` bigint(20) UNSIGNED DEFAULT 0,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `props` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider_items`
--

INSERT INTO `slider_items` (`id`, `slider_id`, `title`, `sub_title`, `description`, `image`, `link`, `url`, `priority`, `props`) VALUES
(2, 1, 'Giải pháp tối ưu cho doanh nghiệp', NULL, NULL, 'spotkanie-biznesowe-5e7b6b115626f.jpg', NULL, NULL, 0, NULL),
(3, 1, 'Test', NULL, NULL, 'fastest-way-to-earn-money-5e7b6b80457bf.webp', NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subcribes`
--

CREATE TABLE `subcribes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subcribes`
--

INSERT INTO `subcribes` (`id`, `email`) VALUES
(1, 'doanln16@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_lower` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'undefined',
  `tagged_count` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tags`
--

INSERT INTO `tags` (`id`, `name`, `name_lower`, `keyword`, `slug`, `tagged_count`) VALUES
(1, 'Phát triển website', 'phát triển website', 'Phat trien website', 'phat-trien-website', 0),
(2, ' Thiết kế website', ' thiết kế website', ' Thiet ke website', 'thiet-ke-website', 0),
(3, ' Laravel', ' laravel', ' Laravel', 'laravel', 0),
(4, ' Thương mại điện tử', ' thương mại điện tử', ' Thuong mai dien tu', 'thuong-mai-dien-tu', 0),
(5, ' WordPress', ' wordpress', ' WordPress', 'wordpress', 0),
(6, 'dịch vụ web', 'dịch vụ web', 'dich vu web', 'dich-vu-web', 0),
(7, 'portfolio', 'portfolio', 'portfolio', 'portfolio', 0),
(8, 'web102', 'web102', 'web102', 'web102', 0),
(9, 'news', 'news', 'news', 'news', 0),
(10, ' Tin tức', ' tin tức', ' Tin tuc', 'tin-tuc', 0),
(11, 'dịch vụ web trọn gói', 'dịch vụ web trọn gói', 'dich vu web tron goi', 'dich-vu-web-tron-goi', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag_refs`
--

CREATE TABLE `tag_refs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'post',
  `ref_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tag_refs`
--

INSERT INTO `tag_refs` (`id`, `tag_id`, `ref`, `ref_id`) VALUES
(1, 1, 'project', 1),
(2, 2, 'project', 1),
(3, 3, 'project', 1),
(4, 4, 'project', 1),
(5, 1, 'project', 2),
(6, 3, 'project', 2),
(7, 2, 'project', 2),
(8, 1, 'project', 3),
(9, 2, 'project', 3),
(10, 3, 'project', 3),
(11, 1, 'project', 4),
(12, 5, 'project', 4),
(13, 2, 'project', 4),
(14, 1, 'project', 5),
(15, 5, 'project', 5),
(16, 4, 'project', 5),
(17, 1, 'project', 6),
(18, 2, 'project', 6),
(19, 3, 'project', 6),
(20, 3, 'project', 11),
(21, 2, 'project', 11),
(22, 1, 'project', 11),
(23, 6, 'post', 14),
(24, 7, 'post', 14),
(25, 8, 'post', 14),
(26, 9, 'post', 16),
(27, 10, 'post', 16),
(28, 8, 'post', 16),
(29, 11, 'post', 16),
(32, 4, 'post', 17),
(33, 11, 'post', 17),
(34, 8, 'post', 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `teams`
--

INSERT INTO `teams` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Developer', NULL, '2020-04-30 16:43:31', '2020-04-30 16:43:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `team_members`
--

CREATE TABLE `team_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `is_leader` int(10) UNSIGNED DEFAULT 0,
  `job` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `team_members`
--

INSERT INTO `team_members` (`id`, `team_id`, `member_id`, `is_leader`, `job`) VALUES
(1, 1, 1, 1, 'DEV');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `secret_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'CrazyTheme',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'multi-page',
  `web_types` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` double(5,2) DEFAULT 1.00,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'protected',
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `available` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `themes`
--

INSERT INTO `themes` (`id`, `secret_id`, `name`, `slug`, `view_type`, `web_types`, `version`, `description`, `privacy`, `zip`, `image`, `available`, `deleted`, `created_at`, `updated_at`) VALUES
(1, '5e6c4ba89fabe', '247 News', '247-news', 'multi-page', 'news, default', 1.00, 'Giao diện tin tức', 'protected', '247-news.zip', '24hnews-preview-5e6c4ba89ef03.png', 1, 0, '2020-03-14 03:12:40', '2020-03-14 03:16:54'),
(2, '5e6c85638ef24', 'Bize', 'bize', 'multi-page', 'business', 1.00, NULL, 'protected', 'bize.zip', 'magneto-development-and-features-5e6c85638dce7.png', 1, 0, '2020-03-14 07:18:59', '2020-03-14 09:14:50'),
(3, '5e6e6ba90f67c', 'Bunas', 'bunas', 'multi-page', 'default, business', 1.00, NULL, 'public', 'bunas.zip', 'preview-large-preview-5e6e6ba908046.png', 1, 0, '2020-03-15 17:53:45', '2020-05-28 03:31:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'transfer',
  `customer_id` bigint(20) UNSIGNED DEFAULT 0,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_id` bigint(20) UNSIGNED DEFAULT 0,
  `approved_id` bigint(20) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transactions`
--

INSERT INTO `transactions` (`id`, `ref`, `ref_id`, `type`, `customer_id`, `code`, `amount`, `note`, `time`, `status`, `deleted`, `created_id`, `approved_id`, `created_at`, `updated_at`) VALUES
(1, 'service', 0, 'payment', 1, NULL, '4000000.00', NULL, '2020-06-03 18:38:48', 0, 0, 0, 0, '2020-06-03 11:38:49', '2020-06-03 11:38:49'),
(2, 'service', 0, 'payment', 1, NULL, '4000000.00', NULL, '2020-06-03 18:52:12', 0, 0, 0, 0, '2020-06-03 11:52:12', '2020-06-03 11:52:12'),
(3, 'service', 0, 'payment', 1, NULL, '4000000.00', NULL, '2020-06-03 18:52:30', 0, 0, 0, 0, '2020-06-03 11:52:30', '2020-06-03 11:52:30'),
(4, 'service', 10, 'payment', 1, NULL, '2000000.00', NULL, '2020-06-04 09:54:05', 0, 0, 1, 0, '2020-06-04 02:54:05', '2020-06-04 05:10:26'),
(5, 'service', 10, 'payment', 1, NULL, '2000000.00', NULL, '2020-06-04 15:43:56', 1, 0, 1, 0, '2020-06-04 08:43:56', '2020-06-04 09:38:26'),
(6, 'service', 11, 'payment', 1, NULL, '4000000.00', NULL, '2020-06-04 16:58:23', 1, 0, 1, 0, '2020-06-04 09:58:23', '2020-06-04 10:00:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google2fa_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `phone_number`, `facebook_id`, `google_id`, `google2fa_secret`, `remember_token`, `type`, `avatar`, `status`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'Lê Ngọc Doãn', 'doanln16@gmail.com', 'doanln', NULL, '$2y$10$o8RSCpagY2cEyg0l.jJIWuR1N6.gG5oUNTUGS9KMwoQ32zslnWnbO', '0945786960', NULL, NULL, NULL, 'W0VVG47WmrHkI6I7YJCRjJbenkU1jMZdmLQhqLbGAlEwQZ3b50wdv2c64mhD', 'admin', '18342541-1417276298335398-2035896623801337457-n-5e01cdad34d0f.png', 1, 0, '2020-03-12 13:34:18', '2020-05-29 03:07:22'),
(6, 'Lê Ngọc Doãn', 'aaa1@gmail.com', 'aaa1', NULL, '$2y$10$n4ugJ0QooayhAe6TANggTuCgS8HuZEOZbCqmbVRXxVAmZmrw1Lynm', NULL, NULL, NULL, NULL, NULL, 'user', NULL, 0, 0, '2020-06-04 02:47:02', '2020-06-04 02:47:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_notices`
--

CREATE TABLE `user_notices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT 0,
  `notice_id` bigint(20) UNSIGNED DEFAULT 0,
  `seen` int(11) NOT NULL DEFAULT 0,
  `seen_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_services`
--

CREATE TABLE `user_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT 0,
  `paid` bigint(20) DEFAULT 0,
  `expired_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_services`
--

INSERT INTO `user_services` (`id`, `service_id`, `package_id`, `user_id`, `account_id`, `paid`, `expired_at`, `status`, `deleted`, `created_at`, `updated_at`) VALUES
(3, 2, 5, 1, 69, 0, '0000-00-00 00:00:00', 1, 0, '2020-06-03 03:49:41', '2020-06-03 03:49:41'),
(4, 4, 11, 1, 70, 0, '0000-00-00 00:00:00', 1, 0, '2020-06-03 04:44:37', '2020-06-03 04:44:37'),
(5, 6, 17, 1, 71, 0, '0000-00-00 00:00:00', 1, 0, '2020-06-03 08:24:35', '2020-06-03 08:24:35'),
(6, 3, 8, 1, 72, 0, '0000-00-00 00:00:00', 1, 0, '2020-06-03 08:30:02', '2020-06-03 08:30:02'),
(7, 1, 2, 1, 73, 0, '2036-12-31 16:00:00', 1, 0, '2020-06-03 08:35:31', '2020-06-03 08:35:31'),
(8, 1, 2, 1, 74, 0, '2036-12-31 16:00:00', 1, 0, '2020-06-03 08:41:38', '2020-06-03 08:41:38'),
(9, 1, 3, 1, 75, 0, NULL, 0, 0, '2020-06-03 09:37:08', '2020-06-03 09:37:08'),
(10, 3, 9, 1, 76, 2000000, '2035-12-31 16:00:00', 1, 0, '2020-06-04 02:52:41', '2020-06-04 09:38:26'),
(11, 4, 12, 1, 77, 4000000, '2021-06-04 10:00:27', 1, 0, '2020-06-04 09:55:31', '2020-06-04 10:00:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wards`
--

CREATE TABLE `wards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse`
--

CREATE TABLE `warehouse` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'import',
  `total` int(11) NOT NULL DEFAULT 0,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_refs`
--
ALTER TABLE `category_refs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `client_feedback`
--
ALTER TABLE `client_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `crawler_frames`
--
ALTER TABLE `crawler_frames`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `crawler_tasks`
--
ALTER TABLE `crawler_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `dynamics`
--
ALTER TABLE `dynamics`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `email_tokens`
--
ALTER TABLE `email_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `html_areas`
--
ALTER TABLE `html_areas`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `html_components`
--
ALTER TABLE `html_components`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `html_embeds`
--
ALTER TABLE `html_embeds`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `metadatas`
--
ALTER TABLE `metadatas`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `option_datas`
--
ALTER TABLE `option_datas`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `option_groups`
--
ALTER TABLE `option_groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_address`
--
ALTER TABLE `order_address`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_feedback`
--
ALTER TABLE `order_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permission_modules`
--
ALTER TABLE `permission_modules`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permission_module_roles`
--
ALTER TABLE `permission_module_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_module_roles_module_id_foreign` (`module_id`),
  ADD KEY `permission_module_roles_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `permission_roles`
--
ALTER TABLE `permission_roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permission_user_roles`
--
ALTER TABLE `permission_user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_user_roles_user_id_foreign` (`user_id`),
  ADD KEY `permission_user_roles_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `post_views`
--
ALTER TABLE `post_views`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_attribute_price`
--
ALTER TABLE `product_attribute_price`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_refs`
--
ALTER TABLE `product_refs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `service_packages`
--
ALTER TABLE `service_packages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider_items`
--
ALTER TABLE `slider_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subcribes`
--
ALTER TABLE `subcribes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tag_refs`
--
ALTER TABLE `tag_refs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_refs_tag_id_foreign` (`tag_id`);

--
-- Chỉ mục cho bảng `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_notices`
--
ALTER TABLE `user_notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notices_user_id_foreign` (`user_id`),
  ADD KEY `user_notices_notice_id_foreign` (`notice_id`);

--
-- Chỉ mục cho bảng `user_services`
--
ALTER TABLE `user_services`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `category_refs`
--
ALTER TABLE `category_refs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `client_feedback`
--
ALTER TABLE `client_feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `components`
--
ALTER TABLE `components`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `crawler_frames`
--
ALTER TABLE `crawler_frames`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `crawler_tasks`
--
ALTER TABLE `crawler_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `dynamics`
--
ALTER TABLE `dynamics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `email_tokens`
--
ALTER TABLE `email_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `html_areas`
--
ALTER TABLE `html_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `html_components`
--
ALTER TABLE `html_components`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `html_embeds`
--
ALTER TABLE `html_embeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `metadatas`
--
ALTER TABLE `metadatas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `option_datas`
--
ALTER TABLE `option_datas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT cho bảng `option_groups`
--
ALTER TABLE `option_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_address`
--
ALTER TABLE `order_address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_feedback`
--
ALTER TABLE `order_feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `permission_modules`
--
ALTER TABLE `permission_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `permission_module_roles`
--
ALTER TABLE `permission_module_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `permission_roles`
--
ALTER TABLE `permission_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `permission_user_roles`
--
ALTER TABLE `permission_user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `post_views`
--
ALTER TABLE `post_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_attribute_price`
--
ALTER TABLE `product_attribute_price`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_refs`
--
ALTER TABLE `product_refs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `promos`
--
ALTER TABLE `promos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `service_packages`
--
ALTER TABLE `service_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `slider_items`
--
ALTER TABLE `slider_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `subcribes`
--
ALTER TABLE `subcribes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `tag_refs`
--
ALTER TABLE `tag_refs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `user_notices`
--
ALTER TABLE `user_notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_services`
--
ALTER TABLE `user_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `wards`
--
ALTER TABLE `wards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `permission_module_roles`
--
ALTER TABLE `permission_module_roles`
  ADD CONSTRAINT `permission_module_roles_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `permission_modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_module_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `permission_roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `permission_user_roles`
--
ALTER TABLE `permission_user_roles`
  ADD CONSTRAINT `permission_user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `permission_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `tag_refs`
--
ALTER TABLE `tag_refs`
  ADD CONSTRAINT `tag_refs_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_notices`
--
ALTER TABLE `user_notices`
  ADD CONSTRAINT `user_notices_notice_id_foreign` FOREIGN KEY (`notice_id`) REFERENCES `notices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_notices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
