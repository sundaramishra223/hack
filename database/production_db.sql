-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 31, 2025 at 07:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u523895309_vbind_agencyu523895309_vbind_agency`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand_logos`
--

CREATE TABLE `brand_logos` (
  `id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `logo_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand_logos`
--

INSERT INTO `brand_logos` (`id`, `brand_name`, `logo_path`, `created_at`, `updated_at`, `status`) VALUES
(4, 'Somesa Modular Kitchen', 'uploads/brand-logos/686d137d4ae47.svg', '2025-07-08 12:47:57', '2025-07-08 12:47:57', 'active'),
(5, 'Rental Space', 'uploads/brand-logos/686d137d4b445.svg', '2025-07-08 12:47:57', '2025-07-08 12:47:57', 'active'),
(6, 'Vaibhav_s Hair & Beyond', 'uploads/brand-logos/686d137d4b714.svg', '2025-07-08 12:47:57', '2025-07-08 12:47:57', 'active'),
(7, 'Gravityy Motors', 'uploads/brand-logos/686d137d4ba41.svg', '2025-07-08 12:47:57', '2025-07-08 12:47:57', 'active'),
(8, 'Crystal Detailing Studio', 'uploads/brand-logos/686d137d4bf59.svg', '2025-07-08 12:47:57', '2025-07-08 12:47:57', 'active'),
(9, 'Vartak_s Competitive Academy', 'uploads/brand-logos/686d137d4c2a9.svg', '2025-07-08 12:47:57', '2025-07-08 12:47:57', 'active'),
(10, 'Daley Caterers', 'uploads/brand-logos/686d137d4d17c.svg', '2025-07-08 12:47:57', '2025-07-08 12:47:57', 'active'),
(11, 'Dum de Biryani', 'uploads/brand-logos/686d137d4d45c.svg', '2025-07-08 12:47:57', '2025-07-08 12:47:57', 'active'),
(12, 'Ishwar Motors', 'uploads/brand-logos/686d137d4e5a7.svg', '2025-07-08 12:47:57', '2025-07-08 12:47:57', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `industry` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_form`
--

CREATE TABLE `contact_form` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `industry` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_form`
--

INSERT INTO `contact_form` (`id`, `name`, `email`, `industry`, `message`, `submitted_at`, `status`) VALUES
(3, 'Devendra', 'connect.vbind@gmail.com', 'Branding', 'hii', '2025-07-15 12:37:57', 'pending'),
(4, 'devendra kate', 'katedevendra@gmail.com', 'Video Production', 'Hey', '2025-07-19 05:00:44', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `contact_submissions`
--

CREATE TABLE `contact_submissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `featured_slider`
--

CREATE TABLE `featured_slider` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `featured_slider`
--

INSERT INTO `featured_slider` (`id`, `title`, `subtitle`, `image_path`, `display_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Bold Brand Reveal', 'Launch Teaser • Motion + Sound Design', 'uploads/featured/slide1.jpg', 1, 1, '2025-07-31 07:58:00', '2025-07-31 07:58:00'),
(2, 'Summer Drop Film', 'Fashion Promo • Color‑graded & Cutdowns', 'uploads/featured/slide2.jpg', 2, 1, '2025-07-31 07:58:00', '2025-07-31 07:58:00'),
(3, 'App Intro Sequence', 'UI Animations • 3D Transitions', 'uploads/featured/slide3.jpg', 3, 1, '2025-07-31 07:58:00', '2025-07-31 07:58:00'),
(4, 'Product Hero Loop', 'CGI Packshot • Realistic Lighting', 'uploads/featured/slide4.jpg', 4, 1, '2025-07-31 07:58:00', '2025-07-31 07:58:00'),
(5, 'Festival Opener', 'Kinetic Type • Beat‑Synced Edits', 'uploads/featured/slide5.jpg', 5, 1, '2025-07-31 07:58:00', '2025-07-31 07:58:00');

-- --------------------------------------------------------

--
-- Table structure for table `hero_reels`
--

CREATE TABLE `hero_reels` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `video_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `categories` varchar(255) NOT NULL,
  `services_provided` text NOT NULL,
  `timeline` varchar(100) DEFAULT NULL,
  `brand_essence` text DEFAULT NULL,
  `brand_agenda` text DEFAULT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `video_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `photo1` varchar(255) DEFAULT NULL,
  `photo2` varchar(255) DEFAULT NULL,
  `photo3` varchar(255) DEFAULT NULL,
  `photo4` varchar(255) DEFAULT NULL,
  `photo5` varchar(255) DEFAULT NULL,
  `photo6` varchar(255) DEFAULT NULL,
  `photo7` varchar(255) DEFAULT NULL,
  `photo8` varchar(255) DEFAULT NULL,
  `photo9` varchar(255) DEFAULT NULL,
  `photo10` varchar(255) DEFAULT NULL,
  `photo11` varchar(255) DEFAULT NULL,
  `photo12` varchar(255) DEFAULT NULL,
  `photo13` varchar(255) DEFAULT NULL,
  `photo14` varchar(255) DEFAULT NULL,
  `photo15` varchar(255) DEFAULT NULL,
  `photo16` varchar(255) DEFAULT NULL,
  `photo17` varchar(255) DEFAULT NULL,
  `photo18` varchar(255) DEFAULT NULL,
  `photo19` varchar(255) DEFAULT NULL,
  `photo20` varchar(255) DEFAULT NULL,
  `extra_images` text DEFAULT NULL,
  `video_story1` varchar(255) DEFAULT NULL,
  `video_story2` varchar(255) DEFAULT NULL,
  `video1` varchar(255) DEFAULT NULL,
  `video2` varchar(255) DEFAULT NULL,
  `video3` varchar(255) DEFAULT NULL,
  `video4` varchar(255) DEFAULT NULL,
  `video5` varchar(255) DEFAULT NULL,
  `video6` varchar(255) DEFAULT NULL,
  `video7` varchar(255) DEFAULT NULL,
  `video8` varchar(255) DEFAULT NULL,
  `video9` varchar(255) DEFAULT NULL,
  `video10` varchar(255) DEFAULT NULL,
  `video11` varchar(255) DEFAULT NULL,
  `video12` varchar(255) DEFAULT NULL,
  `video13` varchar(255) DEFAULT NULL,
  `video14` varchar(255) DEFAULT NULL,
  `video15` varchar(255) DEFAULT NULL,
  `video16` varchar(255) DEFAULT NULL,
  `video17` varchar(255) DEFAULT NULL,
  `video18` varchar(255) DEFAULT NULL,
  `video19` varchar(255) DEFAULT NULL,
  `video20` varchar(255) DEFAULT NULL,
  `reel1` varchar(255) DEFAULT NULL,
  `reel2` varchar(255) DEFAULT NULL,
  `reel3` varchar(255) DEFAULT NULL,
  `reel4` varchar(255) DEFAULT NULL,
  `extra_videos` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`id`, `title`, `roles`, `description`, `categories`, `services_provided`, `timeline`, `brand_essence`, `brand_agenda`, `thumbnail`, `video_path`, `created_at`, `updated_at`, `photo1`, `photo2`, `photo3`, `photo4`, `photo5`, `photo6`, `photo7`, `photo8`, `photo9`, `photo10`, `photo11`, `photo12`, `photo13`, `photo14`, `photo15`, `photo16`, `photo17`, `photo18`, `photo19`, `photo20`, `extra_images`, `video_story1`, `video_story2`, `video1`, `video2`, `video3`, `video4`, `video5`, `video6`, `video7`, `video8`, `video9`, `video10`, `video11`, `video12`, `video13`, `video14`, `video15`, `video16`, `video17`, `video18`, `video19`, `video20`, `reel1`, `reel2`, `reel3`, `reel4`, `extra_videos`, `status`) VALUES
(14, 'Ishwar Motors', NULL, '', '', '', '', NULL, NULL, 'uploads/portfolio/thumbnails/68693962138c3.webp', NULL, '2025-07-05 14:24:24', '2025-07-07 14:21:41', 'uploads/portfolio/images/68693aefde629.webp', 'uploads/portfolio/images/68693aefde9b0.heic', 'uploads/portfolio/images/68693aefdec19.heic', 'uploads/portfolio/images/68693aefdee47.heic', 'uploads/portfolio/images/686bd7f5bd2d0.heic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/658170-Storymp4-Story.mp4', 'uploads/portfolio/videos/822870-Story2mp4-Story 2.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/897857-2mp4-2.mp4', 'uploads/portfolio/videos/598491-3mp4-3.mp4', 'uploads/portfolio/videos/1194158-4mp4-4.mp4', '', NULL, 'active'),
(15, 'Vaibhav_s Hair &amp; Beyond', NULL, '', '', '', '', NULL, NULL, 'uploads/portfolio/thumbnails/686bfffe2d096.png', NULL, '2025-07-07 17:12:30', '2025-07-07 17:12:30', 'uploads/portfolio/images/686bfffe2d403.png', 'uploads/portfolio/images/686bfffe2e6d0.png', 'uploads/portfolio/images/686bfffe300ce.png', 'uploads/portfolio/images/686bfffe3126b.jpg', 'uploads/portfolio/images/686bfffe31e46.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/27523046-1mp4-1.mp4', 'uploads/portfolio/videos/8228765-VHB_3mp4-VH&B_3.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/15194207-VHB1mp4-VH&B1.mp4', 'uploads/portfolio/videos/2864555-VHB2mp4-VH&B2.mp4', '', '', NULL, 'active'),
(16, 'DUM DE BIRYANI', NULL, '', '', '', '', NULL, NULL, 'uploads/portfolio/thumbnails/686c015eba6e6.png', NULL, '2025-07-07 17:18:22', '2025-07-07 17:18:22', 'uploads/portfolio/images/686c015ebccee.png', 'uploads/portfolio/images/686c015ebee02.png', 'uploads/portfolio/images/686c015ec104a.png', 'uploads/portfolio/images/686c015ec2c49.png', 'uploads/portfolio/images/686c015ec47a3.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/34621102-7_Decmp4-7_Dec.mp4', 'uploads/portfolio/videos/15307041-13_Oct_1mp4-13_Oct_1.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/10158321-27_Novmp4-27_Nov.mp4', 'uploads/portfolio/videos/28140388-28_Sept_ASMRmp4-28_Sept_ASMR.mp4', '', '', NULL, 'active'),
(17, 'Somesa Modular Kitchen', NULL, '', '', '', '', NULL, NULL, 'uploads/portfolio/thumbnails/686c2a310d113.png', NULL, '2025-07-07 20:12:33', '2025-07-07 20:12:33', 'uploads/portfolio/images/686c2a310f76b.png', 'uploads/portfolio/images/686c2a31157cc.png', 'uploads/portfolio/images/686c2a3116e35.png', 'uploads/portfolio/images/686c2a3117ec4.png', 'uploads/portfolio/images/686c2a31195a6.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/13473839-22_July_D2mp4-22_July_D2.mp4', 'uploads/portfolio/videos/17535437-25_July_2mp4-25_July_2.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/11594907-21_July_D3mp4-21_July_D3.mp4', 'uploads/portfolio/videos/1695377-SMK1mp4-SMK1.mp4', '', '', NULL, 'active'),
(18, 'Vartak_s Competitive Academy', NULL, '', '', '', '', NULL, NULL, 'uploads/portfolio/thumbnails/686c2b728033c.png', NULL, '2025-07-07 20:17:54', '2025-07-07 20:31:40', 'uploads/portfolio/images/686c2b72818e9.png', 'uploads/portfolio/images/686c2b7284212.png', 'uploads/portfolio/images/686c2b7288186.png', 'uploads/portfolio/images/686c2b728afad.png', 'uploads/portfolio/images/686c2b728fbe5.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/1425339-VCAFestivesStoriespng-VCA Festives Stories.png', 'uploads/portfolio/videos/3245425-VCAGudiPadwaFestivesStoriespng-VCA Gudi Padwa Festives Stories.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/96115154-TSD_Reel_02mp4-TSD_Reel_02.mp4', 'uploads/portfolio/videos/77127401-17_May_2mp4-17_May_2.mp4', 'uploads/portfolio/videos/41150014-Cond_Vs_Insump4-Cond_Vs_Insu.mp4', 'uploads/portfolio/videos/2891613-VCA_1mp4-VCA_1.mp4', NULL, 'active'),
(19, 'Rental Space', NULL, '', '', '', '', NULL, NULL, 'uploads/portfolio/thumbnails/686c3031e1f6b.webp', NULL, '2025-07-07 20:38:09', '2025-07-07 20:38:09', 'uploads/portfolio/images/686c3031e2481.webp', 'uploads/portfolio/images/686c3031e27d8.webp', 'uploads/portfolio/images/686c3031e29da.webp', 'uploads/portfolio/images/686c3031e2c16.webp', 'uploads/portfolio/images/686c3031e2dbe.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/8050215-Blur_Main_1mp4-Blur_Main_1.mp4', 'uploads/portfolio/videos/1216597-RS_1mp4-RS_1.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/1411324-RS_2mp4-RS_2.mp4', 'uploads/portfolio/videos/3044299-RS_3mp4-RS_3.mp4', '', '', NULL, 'active'),
(20, 'Crystal Detailing Studio', NULL, '', '', '', '', NULL, NULL, 'uploads/portfolio/thumbnails/686c317eedb63.png', NULL, '2025-07-07 20:43:42', '2025-07-07 20:43:42', 'uploads/portfolio/images/686c317eeea73.png', 'uploads/portfolio/images/686c317eef32f.png', 'uploads/portfolio/images/686c317ef0bcf.png', 'uploads/portfolio/images/686c317ef172e.png', 'uploads/portfolio/images/686c317ef2521.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/4509811-17png-17.png', 'uploads/portfolio/videos/8571126-18png-18.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/85259896-Car_Ad_Finalmp4-Car_Ad_Final.mp4', 'uploads/portfolio/videos/1884267-CDS_1mp4-CDS_1.mp4', 'uploads/portfolio/videos/4852664-CDS_2mp4-CDS_2.mp4', 'uploads/portfolio/videos/11537488-CDS_DiwaliADsmp4-CDS_Diwali ADs.mp4', NULL, 'active'),
(21, 'Daley Caterers', NULL, '', '', '', '', NULL, NULL, 'uploads/portfolio/thumbnails/686c33694254b.png', NULL, '2025-07-07 20:51:53', '2025-07-07 20:51:53', 'uploads/portfolio/images/686c33694461d.png', 'uploads/portfolio/images/686c336950052.png', 'uploads/portfolio/images/686c336955614.png', 'uploads/portfolio/images/686c33695c907.png', 'uploads/portfolio/images/686c33695e7b4.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/12712517-DaleyCaterersStorypng-Daley Caterers Story.png', 'uploads/portfolio/videos/5721730-DaleyCaterersStory1png-Daley Caterers Story (1).png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/57346709-Vid_1_DC_20Decmp4-Vid_1_DC_20Dec.mp4', 'uploads/portfolio/videos/14201304-19_Marchmp4-19_March.mp4', 'uploads/portfolio/videos/32691584-31_Jan_00mp4-31_Jan_00.mp4', 'uploads/portfolio/videos/28853785-Holi_QTmp4-Holi_QT.mp4', NULL, 'active'),
(22, 'Gravityy Motors', NULL, '', '', '', '', NULL, NULL, 'uploads/portfolio/thumbnails/686c3650db62a.png', NULL, '2025-07-07 21:04:16', '2025-07-07 21:04:16', 'uploads/portfolio/images/686c3650dff7d.png', 'uploads/portfolio/images/686c3650e40b0.png', 'uploads/portfolio/images/686c3650e7fd0.png', 'uploads/portfolio/images/686c3650eda1c.png', 'uploads/portfolio/images/686c3650ee56c.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/4314756-1png-1.png', 'uploads/portfolio/videos/24219807-GravityyMotorsFestiveStories_Hanuman_Jayanti1mp4-Gravityy Motors Festive Stories_Hanuman_Jayanti1.mp4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/74258822-1_1mp4-1_1.mp4', 'uploads/portfolio/videos/68168790-Skoda_01mp4-Skoda_01.mp4', 'uploads/portfolio/videos/3731839-GRVTY_1mp4-GRVTY_1.mp4', 'uploads/portfolio/videos/24652068-GRVTY_2mp4-GRVTY_2.mp4', NULL, 'active'),
(23, 'Riddika Panchal', NULL, '', '', '', '', NULL, NULL, 'uploads/portfolio/thumbnails/686c37d8046f6.png', NULL, '2025-07-07 21:10:48', '2025-07-07 21:10:48', 'uploads/portfolio/images/686c37d807db9.png', 'uploads/portfolio/images/686c37d81068b.png', 'uploads/portfolio/images/686c37d817a10.png', 'uploads/portfolio/images/686c37d821203.png', 'uploads/portfolio/images/686c37d822d39.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/24916841-RP_Coverpage11png-RP_Coverpage 1 (1).png', 'uploads/portfolio/videos/13537386-RP_Coverpage13png-RP_Coverpage 1 (3).png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/portfolio/videos/93246827-2nd_Reel_1mp4-2nd_Reel_1.mp4', 'uploads/portfolio/videos/41212293-4th_Reel_Changedmp4-4th_Reel_Changed.mp4', 'uploads/portfolio/videos/56002185-20_1mp4-20_1.mp4', 'uploads/portfolio/videos/9308821-RP_1mp4-RP_1.mp4', NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_extras`
--

CREATE TABLE `portfolio_extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portfolio_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_type` enum('image','video') NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_images`
--

CREATE TABLE `portfolio_images` (
  `id` int(11) NOT NULL,
  `portfolio_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `position` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_reels`
--

CREATE TABLE `portfolio_reels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portfolio_id` int(11) NOT NULL,
  `video_path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_small_photos`
--

CREATE TABLE `portfolio_small_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portfolio_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_stories`
--

CREATE TABLE `portfolio_stories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portfolio_id` int(11) NOT NULL,
  `video_path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `sub_services` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `icon`, `description`, `sub_services`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Branding', 'fas fa-paint-brush', '- Brand Name Curationrn- Brand Identityrn- Packagingrn- Brand Story Brandrn- Collateralsrn- Brand story', '', '2025-04-29 07:19:15', '2025-05-07 08:00:26', 'active'),
(2, 'Social Media Marketing', 'fas fa-hashtag', '- Social Media Managementrn- Social Media Strategyrn- Platform Optimizationrn- Content Creationrn- Paid ads', '', '2025-04-29 07:19:15', '2025-05-07 07:51:16', 'active'),
(3, 'Video &amp; Designing', 'fas fa-video', 'Short/Long form videos, Social media posts, Campaign videos, Motion graphics, Product/Lifestyle videos', '', '2025-04-29 07:19:15', '2025-05-04 11:10:25', 'active'),
(4, 'CGI Ads', 'fas fa-cube', 'Campaign videos , Cooperate 3d videos, CGI animated video', '- Campaign videos \\r\\n- Cooperate 3d videos\\r\\n- CGI animated video', '2025-04-29 07:19:15', '2025-05-04 11:03:26', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `bio` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `position`, `bio`, `image`, `linkedin`, `instagram`, `facebook`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Prashant Katalia', 'Creative Director', 'With over 10 years of experience in creative design and branding, Prashant leads our creative team with vision and expertise.', 'uploads/team/687156996e1fc.png', 'https://www.linkedin.com/', 'https://www.instagram.com/', '', '2025-04-29 07:19:15', '2025-07-11 18:23:21', 'active'),
(2, 'Parshwa Panchal', 'Marketing Strategist', 'Parshwa specializes in developing comprehensive marketing strategies that drive growth and enhance brand presence.', 'uploads/team/default-parshwa.jpg', 'https://www.linkedin.com/', 'https://www.instagram.com/', NULL, '2025-04-29 07:19:15', '2025-04-29 07:19:15', 'active'),
(3, 'Om Vishwakarma', 'CGI Specialist', 'Om brings digital creations to life with his expertise in 3D modeling, animation, and visual effects.', 'uploads/team/default-om.jpg', 'https://www.linkedin.com/', 'https://www.instagram.com/', NULL, '2025-04-29 07:19:15', '2025-04-29 07:19:15', 'active'),
(4, 'Rishi Rathod', 'Brand Designer', 'Rishi combines artistic talent with strategic thinking to create memorable brand identities and visual assets.', 'uploads/team/6871567d58915.png', 'https://www.linkedin.com/', 'https://www.instagram.com/', '', '2025-04-29 07:19:15', '2025-07-11 18:22:53', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand_logos`
--
ALTER TABLE `brand_logos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_form`
--
ALTER TABLE `contact_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featured_slider`
--
ALTER TABLE `featured_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hero_reels`
--
ALTER TABLE `hero_reels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio_extras`
--
ALTER TABLE `portfolio_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_id` (`portfolio_id`);

--
-- Indexes for table `portfolio_images`
--
ALTER TABLE `portfolio_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_id` (`portfolio_id`);

--
-- Indexes for table `portfolio_reels`
--
ALTER TABLE `portfolio_reels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_id` (`portfolio_id`);

--
-- Indexes for table `portfolio_small_photos`
--
ALTER TABLE `portfolio_small_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_id` (`portfolio_id`);

--
-- Indexes for table `portfolio_stories`
--
ALTER TABLE `portfolio_stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_id` (`portfolio_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand_logos`
--
ALTER TABLE `brand_logos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_form`
--
ALTER TABLE `contact_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `featured_slider`
--
ALTER TABLE `featured_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hero_reels`
--
ALTER TABLE `hero_reels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `portfolio_extras`
--
ALTER TABLE `portfolio_extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio_images`
--
ALTER TABLE `portfolio_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `portfolio_reels`
--
ALTER TABLE `portfolio_reels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio_small_photos`
--
ALTER TABLE `portfolio_small_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio_stories`
--
ALTER TABLE `portfolio_stories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `portfolio_extras`
--
ALTER TABLE `portfolio_extras`
  ADD CONSTRAINT `portfolio_extras_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolio` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `portfolio_images`
--
ALTER TABLE `portfolio_images`
  ADD CONSTRAINT `portfolio_images_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolio` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `portfolio_reels`
--
ALTER TABLE `portfolio_reels`
  ADD CONSTRAINT `portfolio_reels_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolio` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `portfolio_small_photos`
--
ALTER TABLE `portfolio_small_photos`
  ADD CONSTRAINT `portfolio_small_photos_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolio` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `portfolio_stories`
--
ALTER TABLE `portfolio_stories`
  ADD CONSTRAINT `portfolio_stories_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolio` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;