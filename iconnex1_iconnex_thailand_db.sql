-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 09, 2025 at 10:13 AM
-- Server version: 10.6.15-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iconnex1_iconnex_thailand_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('superadmin','subadmin','admin') DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password_hash`, `role`) VALUES
(10, 'DevSudLo', 'DevSudLo@gmail.com', '$2y$10$ZY7AO2V1Oj3Pt.ImFWDzOOn9G6RkfArxK9kzQXfYplKo.yOiS0lCS', 'admin'),
(11, 'khong', 'khongpop@gmail.com', '$2y$10$sG7fM2rYxz/Y0Hd0n6eYD.mTVRW3/v27qXh3KhqHO2zh0mzBkeda2', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_url` text NOT NULL,
  `pdf_url` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `category` varchar(100) NOT NULL,
  `is_slide` tinyint(1) DEFAULT 0,
  `status` enum('draft','published') DEFAULT 'draft',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `image_url`, `pdf_url`, `content`, `category`, `is_slide`, `status`, `created_at`) VALUES
(1, 'มารู้จัก Voice Marketing', 'https://www.whatgroupmag.com/wp-content/uploads/2019/10/Alien-1979-1.jpg', NULL, '<p>มารู้จัก Voice Marketing 2023 กลยุทธ์การตลาดยุคใหม่ที่ใช้เสียงเป็นเครื่องมือสื่อสาร...</p><p>Voice Marketing คืออะไร? Voice Marketing คือการใช้เทคโนโลยีเสียง เช่น ผู้ช่วยเสียง (Voice Assistants) อย่าง Siri, Alexa หรือ Google Assistant เพื่อทำการตลาดและสื่อสารกับลูกค้า กลยุทธ์นี้กำลังได้รับความนิยมอย่างมากในยุคดิจิทัล เนื่องจากผู้คนเริ่มใช้เสียงในการค้นหาข้อมูลและสั่งการอุปกรณ์มากขึ้น</p><p>ในปี 2023 Voice Marketing ได้กลายเป็นเครื่องมือสำคัญที่ช่วยให้แบรนด์สามารถเข้าถึงกลุ่มเป้าหมายได้อย่างมีประสิทธิภาพมากขึ้น ไม่ว่าจะเป็นการสร้างแคมเปญที่ตอบโจทย์การค้นหาด้วยเสียง หรือการพัฒนาคอนเทนต์ที่เหมาะสมกับการใช้งานผ่านอุปกรณ์ที่รองรับการสั่งการด้วยเสียง</p><p>ตัวอย่างของ Voice Marketing เช่น การใช้คำสั่งเสียงเพื่อค้นหาสินค้า (\"Hey Google, หาร้านกาแฟใกล้ฉัน\") หรือการสร้างโฆษณาที่สามารถโต้ตอบด้วยเสียงได้ กลยุทธ์นี้ช่วยให้แบรนด์สามารถสร้างประสบการณ์ที่เป็นส่วนตัวและสะดวกสบายให้กับผู้บริโภค</p>', 'การตลาดดิจิทัล', 1, 'published', '2025-03-27 13:38:34'),
(2, '8 Content Marketing Trends 2025 ที่น่าจับตามอง', 'https://t3.ftcdn.net/jpg/05/31/85/62/360_F_531856235_rDIe5W9jSWvtPErSAHRKN0v0KtOCQDPV.jpg', NULL, '<p>รวม 8 Content Marketing Trends 2025 ที่น่าจับตามอง ไม่ว่าจะเป็น Text, Picture หรือ Video...</p><p>ในปี 2025 การตลาดด้วยคอนเทนต์จะมีการเปลี่ยนแปลงครั้งใหญ่ ด้วยเทคโนโลยีที่พัฒนาขึ้นอย่างรวดเร็วและพฤติกรรมของผู้บริโภคที่เปลี่ยนไป ต่อไปนี้คือ 8 เทรนด์ที่คุณควรจับตามอง:</p><p>1. <strong>AI-Generated Content</strong>: การใช้ AI ในการสร้างคอนเทนต์จะกลายเป็นเรื่องปกติมากขึ้น ไม่ว่าจะเป็นการเขียนบทความ, สร้างภาพ หรือผลิตวิดีโอ</p><p>2. <strong>Interactive Content</strong>: คอนเทนต์ที่โต้ตอบได้ เช่น ควิซ, โพล หรือ AR/VR จะช่วยเพิ่มการมีส่วนร่วมของผู้ใช้</p><p>3. <strong>Video Dominance</strong>: วิดีโอยังคงเป็นรูปแบบคอนเทนต์ที่ได้รับความนิยมสูงสุด โดยเฉพาะวิดีโอสั้นบนแพลตฟอร์มอย่าง TikTok และ Instagram Reels</p><p>4. <strong>Voice Search Optimization</strong>: การปรับแต่งคอนเทนต์ให้เหมาะกับการค้นหาด้วยเสียงจะมีความสำคัญมากขึ้น</p><p>5. <strong>Personalization</strong>: คอนเทนต์ที่ปรับแต่งตามความสนใจของผู้ใช้จะช่วยเพิ่มประสิทธิภาพในการเข้าถึงกลุ่มเป้าหมาย</p><p>6. <strong>Sustainability Content</strong>: ผู้บริโภคให้ความสำคัญกับความยั่งยืนมากขึ้น แบรนด์ที่สื่อสารเรื่องนี้จะได้รับความสนใจ</p><p>7. <strong>Community-Driven Content</strong>: การสร้างคอนเทนต์โดยชุมชนหรือผู้ใช้ (User-Generated Content) จะช่วยสร้างความน่าเชื่อถือ</p><p>8. <strong>Metaverse Marketing</strong>: การตลาดในโลกเสมือนจริง (Metaverse) จะเริ่มเข้ามามีบทบาทมากขึ้น</p>', 'การตลาดดิจิทัล', 1, 'published', '2025-03-27 13:38:34'),
(3, 'วิธีเพิ่มยอดขายด้วย Website', 'https://4kwallpapers.com/images/walls/thumbs_2t/8751.jpg', NULL, '<p>รวมเทคนิคเพิ่มยอดขายด้วย Website ให้ปังยิ่งกว่าเดิม...</p><p>การมีเว็บไซต์ที่ดีไม่เพียงแต่ช่วยให้แบรนด์ของคุณดูน่าเชื่อถือ แต่ยังสามารถเพิ่มยอดขายได้อย่างมีประสิทธิภาพ ต่อไปนี้คือเทคนิคที่คุณสามารถนำไปใช้:</p><p>1. <strong>Optimize for Speed</strong>: เว็บไซต์ที่โหลดช้าจะทำให้ผู้ใช้หนีไป ควรปรับแต่งให้โหลดเร็วที่สุด</p><p>2. <strong>Mobile-Friendly Design</strong>: ตรวจสอบให้แน่ใจว่าเว็บไซต์ของคุณใช้งานได้ดีบนมือถือ เพราะผู้ใช้ส่วนใหญ่เข้าถึงผ่านสมาร์ทโฟน</p><p>3. <strong>Clear Call-to-Action (CTA)</strong>: ใช้ปุ่ม CTA ที่ชัดเจน เช่น \"ซื้อเลย\" หรือ \"สมัครสมาชิก\" เพื่อกระตุ้นให้ผู้ใช้ดำเนินการ</p><p>4. <strong>High-Quality Visuals</strong>: รูปภาพและวิดีโอที่มีคุณภาพสูงจะช่วยดึงดูดความสนใจ</p><p>5. <strong>SEO Optimization</strong>: ปรับแต่งเว็บไซต์ให้ติดอันดับในเครื่องมือค้นหา เพื่อเพิ่มโอกาสในการเข้าถึงลูกค้าใหม่</p><p>6. <strong>Customer Reviews</strong>: แสดงรีวิวจากลูกค้าเพื่อสร้างความน่าเชื่อถือ</p><p>7. <strong>Live Chat Support</strong>: เพิ่มฟีเจอร์แชทสดเพื่อช่วยตอบคำถามลูกค้าแบบเรียลไทม์</p><p>8. <strong>Upselling and Cross-Selling</strong>: แนะนำสินค้าที่เกี่ยวข้องเพื่อเพิ่มยอดขายต่อคำสั่งซื้อ</p>', 'เพิ่มยอดขาย', 1, 'published', '2025-03-27 13:38:34');

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `detail1` varchar(255) NOT NULL,
  `detail2` varchar(255) NOT NULL,
  `detail3` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `image_url`, `title`, `detail1`, `detail2`, `detail3`, `description`) VALUES
(11, 'public/img/68187275b5331-test-g.jpg', 'งานWorld  Expo 2025 Osaka Kansai ', 'ออกงานต่างประเทศ', 'งาน Expo 2025', 'Osaka In Japan', 'วันที่ 13 -15 เมษายน 2568 พิธีเปิดอย่างเป็นทางการ งานWorld Expo 2025 Osaka Kansai at Yumeshima Osaka, Japan โดยมี ดร.นายแพทย์ภานุวัฒน์ ปานเกตุ อธิบดีกรมสนับสนุนบริการสุขภาพ ในฐานะ commission general นายแพทย์มณเทียร คณาสวัสดิ์ รองปลัดกระทรวงสาธารณสุข (ผู้แทนปลัดกระทรวงสาธารณสุข) นายแพทย์สุระ วิเศษศักดิ์ prior- Commission general และปัจจุบันตำแหน่งเป็น Pavilion Consultant ท่านอัครพงศ์ เฉลิมนนท์ กงสุลใหญ่ ณ นครโอซากา และนายแพทย์กรกฤช ลิ้มสมมุติ รองอธิบดีกรมสนับสนุนบริการสุขภาพ ร่วมเป็นเกียรติในพิธีดังกล่าวด้วย #Expo2025 #ThailandPavilion2025 #osaka2025 #IconnexThailand'),
(12, 'public/img/6818776a6ff49-487699452_1249550620511790_7486572564686357596_n.jpg', 'คณะสถาปัตย์ฯ สจล. เปิดตัว ‘AAD CREATOR HUB’', 'AAD CREATOR HUB', 'FutureCreator ', 'KMITL', 'คณะสถาปัตย์ฯ สจล. เปิดตัว ‘AAD CREATOR HUB’ จับมือภาคอุตสาหกรรม สร้างนวัตกรรมออกแบบยั่งยืน เชื่อมโลกการเรียนรู้สู่ภาคธุรกิจจริง\r\nผศ.ดร.อันธิกา สวัสดิ์ศรี คณบดีคณะสถาปัตยกรรม ศิลปะและการออกแบบ กล่าวว่า\r\nAAD CREATOR HUB คือพื้นที่ที่นักศึกษาของเรา จะได้ออกแบบ ร่วมมือ และสร้างสรรค์ร่วมกับผู้เชี่ยวชาญจากอุตสาหกรรมจริง เป็นการต่อยอดความรู้สู่การปฏิบัติ และเป็นเครื่องมือสำคัญในการหล่อหลอมให้พวกเขาเป็น #FutureCreator ตัวจริง\r\nโครงการนี้สะท้อนค่านิยมของคณะฯ ภายใต้แนวคิด “We the Future Creator” ที่มุ่งเน้นการสร้างนักออกแบบรุ่นใหม่ ให้เป็นผู้นำการเปลี่ยนแปลง มีความคิดสร้างสรรค์ กล้าทดลอง และสามารถสร้างอนาคตด้วยนวัตกรรมที่มีผลกระทบเชิงบวกต่อสังคมและสิ่งแวดล้อม\r\nโครงการนี้ไม่เพียงสร้างประสบการณ์ตรงให้นักศึกษา แต่ยังเชื่อมโยงการเรียนรู้กับอุตสาหกรรมอย่างเป็นรูปธรรม เปิดโอกาสในการพัฒนาหลักสูตร การทำวิจัย และนวัตกรรมที่ตอบสนองตลาดและความเปลี่ยนแปลงของโลกอนาคต');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'E-books & Template'),
(4, 'Articles'),
(7, 'News'),
(8, 'การตลาดดิจิทัล');

-- --------------------------------------------------------

--
-- Table structure for table `clicks`
--

CREATE TABLE `clicks` (
  `id` int(11) NOT NULL,
  `click_count` int(11) NOT NULL DEFAULT 0,
  `click_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clicks`
--

INSERT INTO `clicks` (`id`, `click_count`, `click_date`) VALUES
(11, 10, '2025-04-11'),
(17, 8, '2025-04-10'),
(22, 6, '2025-04-21'),
(28, 2, '2025-04-22'),
(30, 8, '2025-04-24'),
(38, 17, '2025-04-29'),
(55, 33, '2025-05-01'),
(88, 74, '2025-05-02'),
(162, 78, '2025-05-03'),
(240, 55, '2025-05-04'),
(295, 107, '2025-05-05'),
(402, 65, '2025-05-06'),
(467, 46, '2025-05-07'),
(513, 82, '2025-05-08'),
(595, 8, '2025-05-09');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_logs`
--

CREATE TABLE `device_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `device` varchar(50) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `visited_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `device_logs`
--

INSERT INTO `device_logs` (`id`, `device`, `user_agent`, `ip_address`, `visited_at`) VALUES
(65, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-11 10:00:37'),
(66, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-11 10:00:41'),
(67, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-11 10:00:45'),
(68, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', '::1', '2025-04-11 10:01:40'),
(69, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-11 10:22:26'),
(70, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-11 10:22:29'),
(71, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-11 10:23:08'),
(72, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-11 10:23:10'),
(73, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-11 10:23:27'),
(74, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', '::1', '2025-04-11 10:32:26'),
(75, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '::1', '2025-04-11 10:32:36'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 06:15:27'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 06:24:00'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '49.229.139.40', '2025-04-21 06:29:38'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 06:44:52'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 06:44:57'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 06:44:59'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 06:51:06'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '124.120.154.110', '2025-04-21 07:10:15'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 07:27:24'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 07:27:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 08:20:48'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '124.120.154.110', '2025-04-21 08:21:24'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 08:21:45'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '1.47.151.102', '2025-04-21 08:24:02'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 08:24:11'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '1.47.151.102', '2025-04-21 08:24:21'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 08:24:31'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '1.47.151.102', '2025-04-21 08:24:45'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 08:25:19'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 08:25:31'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 08:25:41'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/364.0.744893471 Mobile/15E148 Safari/604.1', '1.47.151.102', '2025-04-21 08:26:05'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Safari/605.1.15', '124.120.154.110', '2025-04-21 08:26:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.110', '2025-04-21 08:29:00'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.110', '2025-04-21 08:30:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 08:45:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 08:45:26'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 10:13:41'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 10:55:59'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 10:56:15'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 10:58:14'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 11:05:43'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 11:05:51'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 11:34:22'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-21 11:56:33'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-21 11:56:48'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '1.47.151.102', '2025-04-21 11:57:03'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 11:59:29'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-21 12:02:01'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.4.236.211', '2025-04-21 15:43:31'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '66.102.6.198', '2025-04-21 15:43:38'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.4.236.211', '2025-04-21 15:43:55'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.4.236.211', '2025-04-21 15:44:11'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.4.236.211', '2025-04-21 15:44:31'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.4.236.211', '2025-04-21 15:44:50'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.4.236.211', '2025-04-21 15:45:12'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.4.236.211', '2025-04-21 15:45:17'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.234.132', '2025-04-21 19:35:06'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.234.132', '2025-04-21 19:35:13'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.234.132', '2025-04-21 19:35:15'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.234.132', '2025-04-21 19:35:35'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.234.132', '2025-04-21 20:41:44'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.234.132', '2025-04-21 20:41:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.234.132', '2025-04-21 20:41:48'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.234.132', '2025-04-21 21:08:49'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.234.132', '2025-04-21 21:37:38'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.234.132', '2025-04-21 21:37:39'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.234.132', '2025-04-21 21:37:40'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.234.132', '2025-04-21 21:39:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.234.132', '2025-04-21 21:39:49'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.122.147.229', '2025-04-22 00:53:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '116.179.33.137', '2025-04-22 00:54:07'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.122.147.229', '2025-04-22 00:54:22'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 04:26:41'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 04:29:56'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 05:29:58'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 06:05:15'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 06:05:23'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '202.29.231.188', '2025-04-22 06:31:26'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '202.29.231.188', '2025-04-22 06:31:51'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '202.29.231.188', '2025-04-22 06:31:58'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 06:32:15'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 06:32:21'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 06:32:59'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 06:33:05'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 06:33:12'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 06:33:13'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '202.29.231.188', '2025-04-22 06:33:26'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '202.29.231.188', '2025-04-22 06:34:23'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '202.29.231.188', '2025-04-22 06:48:23'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '202.29.231.188', '2025-04-22 06:48:53'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 07:51:57'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:10:29'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:10:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '124.120.154.110', '2025-04-22 08:13:15'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '124.120.154.110', '2025-04-22 08:13:42'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '124.120.154.110', '2025-04-22 08:14:14'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '124.120.154.110', '2025-04-22 08:14:20'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '124.120.154.110', '2025-04-22 08:14:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '124.120.154.110', '2025-04-22 08:17:43'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '124.120.154.110', '2025-04-22 08:17:57'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:19:14'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:19:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:20:07'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:20:10'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:20:23'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:20:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:26:24'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:26:29'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:27:19'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Mobile/15E148 Safari/604.1', '1.46.139.92', '2025-04-22 08:27:38'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Mobile/15E148 Safari/604.1', '1.46.139.92', '2025-04-22 08:28:12'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:37:37'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:45:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:46:21'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:47:16'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:47:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:48:24'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:48:41'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:50:00'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:50:41'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:50:53'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:51:39'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 08:51:40'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:29:34'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:29:42'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:29:44'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:30:12'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:30:15'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:30:17'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:31:03'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:31:18'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:35:55'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:36:34'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:44:06'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:44:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:44:42'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:46:04'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 09:46:23'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:46:44'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:47:05'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:48:11'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:48:17'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:48:23'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:48:26'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:48:33'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:48:37'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:48:41'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:48:44'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:48:52'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:48:59'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:49:05'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-22 09:50:01'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '77.111.246.31', '2025-04-22 09:53:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '77.111.246.51', '2025-04-22 09:55:10'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '77.111.246.51', '2025-04-22 09:56:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '77.111.246.51', '2025-04-22 10:01:27'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-22 10:02:38'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '1.47.151.102', '2025-04-22 14:10:29'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '1.47.151.102', '2025-04-22 14:10:39'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/364.0.744893471 Mobile/15E148 Safari/604.1', '202.176.113.42', '2025-04-22 14:49:10'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D72 Instagram 376.1.0.27.82 (iPhone14,5; iOS 18_3_1; th_TH; th; scale=3.00; 1170x2532; 722575504; IABMV/1)', '171.97.204.118', '2025-04-22 14:51:39'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D72 Instagram 376.1.0.27.82 (iPhone14,5; iOS 18_3_1; th_TH; th; scale=3.00; 1170x2532; 722575504; IABMV/1)', '171.97.204.118', '2025-04-22 14:52:15'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D82 Instagram 376.0.0.24.82 (iPhone15,4; iOS 18_3_2; en_US; en; scale=3.00; 1179x2556; 720728723; IABMV/1)', '49.237.40.249', '2025-04-22 14:52:47'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D72 Instagram 376.1.0.27.82 (iPhone14,5; iOS 18_3_1; th_TH; th; scale=3.00; 1170x2532; 722575504; IABMV/1)', '171.97.204.118', '2025-04-22 14:54:01'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D72 Instagram 376.1.0.27.82 (iPhone14,5; iOS 18_3_1; th_TH; th; scale=3.00; 1170x2532; 722575504; IABMV/1)', '171.97.204.118', '2025-04-22 14:54:06'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D72 Instagram 376.1.0.27.82 (iPhone14,5; iOS 18_3_1; th_TH; th; scale=3.00; 1170x2532; 722575504; IABMV/1)', '171.97.204.118', '2025-04-22 14:55:13'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D72 Instagram 376.1.0.27.82 (iPhone14,5; iOS 18_3_1; th_TH; th; scale=3.00; 1170x2532; 722575504; IABMV/1) NW/3', '171.97.204.118', '2025-04-22 14:56:12'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D72 Instagram 376.1.0.27.82 (iPhone14,5; iOS 18_3_1; th_TH; th; scale=3.00; 1170x2532; 722575504; IABMV/1)', '171.97.204.118', '2025-04-22 14:56:20'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D72 Instagram 376.1.0.27.82 (iPhone14,5; iOS 18_3_1; th_TH; th; scale=3.00; 1170x2532; 722575504; IABMV/1)', '171.97.204.118', '2025-04-22 14:56:49'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D72 Instagram 376.1.0.27.82 (iPhone14,5; iOS 18_3_1; th_TH; th; scale=3.00; 1170x2532; 722575504; IABMV/1)', '171.97.204.118', '2025-04-22 14:59:56'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D72 Instagram 376.1.0.27.82 (iPhone14,5; iOS 18_3_1; th_TH; th; scale=3.00; 1170x2532; 722575504; IABMV/1)', '171.97.204.118', '2025-04-22 15:00:22'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D72 Instagram 376.1.0.27.82 (iPhone14,5; iOS 18_3_1; th_TH; th; scale=3.00; 1170x2532; 722575504; IABMV/1)', '171.97.204.118', '2025-04-22 15:00:27'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '1.47.151.102', '2025-04-22 15:06:23'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.66.194', '2025-04-22 15:41:21'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/364.0.744893471 Mobile/15E148 Safari/604.1', '49.237.45.146', '2025-04-22 17:17:11'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.240.209', '2025-04-22 19:22:42'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.240.209', '2025-04-22 19:22:49'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.123.170.104', '2025-04-22 21:36:47'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.72.176.129', '2025-04-22 21:38:19'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.72.176.129', '2025-04-22 21:40:18'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-04-22 22:51:51'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.136', '2025-04-22 23:28:43'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.233', '2025-04-23 02:34:52'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '124.120.154.110', '2025-04-23 03:34:09'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.113', '2025-04-23 04:46:11'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '205.169.39.197', '2025-04-23 04:46:51'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.197', '2025-04-23 04:47:31'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-23 05:53:15'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-23 06:13:31'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.250.71', '2025-04-23 06:47:19'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 17_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Safari Line/15.5.2', '49.230.146.223', '2025-04-23 08:06:08'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 17_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Safari Line/15.5.2', '49.230.146.223', '2025-04-23 08:06:16'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Safari/605.1.15', '49.230.146.223', '2025-04-23 08:06:22'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 17_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Safari Line/15.5.2', '49.230.146.223', '2025-04-23 08:06:34'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '49.237.9.253', '2025-04-23 08:15:00'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.66.8', '2025-04-23 08:15:07'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/134.0.6998.165 Safari/537.36', '66.249.66.8', '2025-04-23 08:15:07'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.110', '2025-04-23 09:39:19'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.79.73', '2025-04-23 15:58:44'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '205.169.39.27', '2025-04-23 17:30:11'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', '58.8.157.57', '2025-04-23 18:42:58'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', '58.8.157.57', '2025-04-23 18:43:07'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', '58.8.157.57', '2025-04-23 18:43:09'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', '58.8.157.57', '2025-04-23 18:43:14'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', '58.8.157.57', '2025-04-23 18:48:48'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '205.169.39.48', '2025-04-23 19:26:11'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.122.147.229', '2025-04-23 23:53:00'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-04-23 23:53:50'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.72.176.129', '2025-04-23 23:54:20'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.123.170.104', '2025-04-24 00:50:06'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.122.147.229', '2025-04-24 00:55:02'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone13,2; U; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) Version/10.0 Mobile/15E148 Safari/602.1', '34.116.161.207', '2025-04-24 01:13:46'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '124.115.170.7', '2025-04-24 02:28:19'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-04-24 04:18:21'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.72.176.129', '2025-04-24 07:52:42'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.138', '2025-04-24 09:34:23'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.138', '2025-04-24 09:37:21'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.138', '2025-04-24 09:37:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.138', '2025-04-24 09:37:30'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '58.11.11.138', '2025-04-24 09:39:41'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '58.11.11.138', '2025-04-24 09:40:02'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '49.230.63.229', '2025-04-24 09:40:38'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.138', '2025-04-24 09:40:57'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 09:44:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 09:44:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.138', '2025-04-24 09:45:55'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.138', '2025-04-24 09:46:56'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.138', '2025-04-24 09:47:02'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 09:48:00'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 09:48:05'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.138', '2025-04-24 09:48:11'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 09:48:37'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 09:48:51'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 09:48:57'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.138', '2025-04-24 09:49:02'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.138', '2025-04-24 09:49:05'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 09:53:15'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 09:53:17'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 09:53:20'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 09:58:38'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:00:07'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:00:18'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:01:32'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:03:07'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:05:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:05:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:06:16'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:10:08'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:12:18'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:12:26'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:15:45'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:18:49'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:19:31'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:19:33'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 10:19:34'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 11:47:39'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 11:47:48'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 11:47:59'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 11:48:36'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 11:51:12'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Safari/605.1.15', '58.11.11.138', '2025-04-24 11:51:58'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Safari/605.1.15', '58.11.11.138', '2025-04-24 11:52:33'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Safari/605.1.15', '58.11.11.138', '2025-04-24 11:52:45'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Safari/605.1.15', '58.11.11.138', '2025-04-24 11:53:33'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 11:53:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 11:54:10'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 11:54:38'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 12:03:06'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 12:03:39'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 12:07:02'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 12:14:14'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 12:14:44'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.138', '2025-04-24 12:24:09'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', '58.11.11.138', '2025-04-24 12:27:12');
INSERT INTO `device_logs` (`id`, `device`, `user_agent`, `ip_address`, `visited_at`) VALUES
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.198', '2025-04-24 14:00:18'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '182.232.165.212', '2025-04-24 15:00:23'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.136', '2025-04-24 18:27:49'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', '58.8.157.57', '2025-04-24 19:18:41'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', '58.8.157.57', '2025-04-24 19:19:49'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', '58.8.157.57', '2025-04-24 19:19:56'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '44.205.211.254', '2025-04-25 01:42:01'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '207.244.82.18', '2025-04-25 01:42:42'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '38.205.130.10', '2025-04-25 01:43:07'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.72.176.129', '2025-04-25 23:14:58'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.72.176.129', '2025-04-25 23:15:42'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '1.46.137.193', '2025-04-26 11:11:08'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '1.46.137.193', '2025-04-26 11:11:33'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-04-26 14:56:36'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.123.170.104', '2025-04-26 14:57:30'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.123.170.104', '2025-04-26 14:58:44'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.122.147.229', '2025-04-26 14:59:10'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.7.248.253', '2025-04-26 15:16:21'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/100.0.4896.127 Safari/537.36', '40.77.189.252', '2025-04-26 21:09:40'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.75.130', '2025-04-26 21:44:25'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.123.170.104', '2025-04-27 00:06:55'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.123.170.104', '2025-04-27 00:07:40'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-04-27 00:07:44'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.123.170.104', '2025-04-27 00:09:00'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.123.170.104', '2025-04-27 00:10:45'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '205.169.39.48', '2025-04-27 05:47:27'),
(0, 'Desktop', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '49.12.36.194', '2025-04-27 07:53:50'),
(0, 'Desktop', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '195.201.233.83', '2025-04-27 09:36:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '167.235.204.72', '2025-04-27 10:15:34'),
(0, 'Desktop', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '49.13.222.100', '2025-04-27 10:24:22'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '49.13.222.103', '2025-04-27 10:29:22'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '49.13.82.87', '2025-04-27 11:41:58'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '49.13.94.162', '2025-04-27 12:38:33'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '116.179.33.209', '2025-04-27 13:35:11'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '49.13.12.7', '2025-04-27 13:36:30'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.241.170', '2025-04-27 18:32:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.124', '2025-04-27 20:01:10'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '58.8.169.67', '2025-04-27 20:02:40'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.241.170', '2025-04-27 21:03:33'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.81', '2025-04-27 23:03:36'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.235', '2025-04-27 23:04:36'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.73', '2025-04-27 23:11:51'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', '52.167.144.173', '2025-04-27 23:42:39'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/134.0.6998.165 Safari/537.36', '66.249.79.66', '2025-04-28 02:06:33'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.71.97', '2025-04-28 02:06:36'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-28 04:22:12'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '110.168.142.67', '2025-04-28 04:43:00'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '110.168.142.67', '2025-04-28 04:43:37'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '74.125.215.130', '2025-04-28 04:43:46'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '110.168.142.67', '2025-04-28 04:44:13'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '110.168.142.67', '2025-04-28 04:44:16'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '110.168.142.67', '2025-04-28 04:46:34'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '110.168.142.67', '2025-04-28 04:46:39'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-28 05:54:56'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-28 05:56:23'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-28 05:56:33'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-28 05:56:34'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', '110.168.142.67', '2025-04-28 06:36:23'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '110.168.142.67', '2025-04-28 06:48:48'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/27.0 Chrome/125.0.0.0 Mobile Safari/537.36', '61.19.1.196', '2025-04-28 06:48:58'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', '110.168.142.67', '2025-04-28 06:52:10'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '110.168.142.67', '2025-04-28 06:55:34'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/100.0.4896.127 Safari/537.36', '40.77.190.165', '2025-04-28 07:28:06'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.241.170', '2025-04-28 08:05:12'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '184.22.34.7', '2025-04-28 08:35:22'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.71.195', '2025-04-28 09:33:27'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '171.102.217.10', '2025-04-28 10:50:08'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '171.102.217.10', '2025-04-28 10:50:27'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '171.102.217.10', '2025-04-28 10:50:45'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '171.102.217.10', '2025-04-28 10:51:56'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.122.147.229', '2025-04-28 11:00:24'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.122.147.229', '2025-04-28 11:11:44'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-28 11:47:26'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.116', '2025-04-28 23:41:46'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.122.147.229', '2025-04-29 00:01:20'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.103', '2025-04-29 01:18:33'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 05:00:31'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 05:00:35'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 05:02:00'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 05:07:16'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 07:49:36'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-04-29 07:54:10'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.72.176.129', '2025-04-29 07:54:43'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.123.170.104', '2025-04-29 07:54:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 08:00:34'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 08:00:51'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 08:02:50'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 08:02:56'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 08:02:59'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 08:19:01'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 08:19:07'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 08:19:48'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 08:19:56'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 08:20:02'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '119.76.35.247', '2025-04-29 10:00:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '119.76.35.247', '2025-04-29 10:07:07'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '119.76.35.247', '2025-04-29 10:07:41'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '119.76.35.247', '2025-04-29 10:11:53'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '119.76.35.247', '2025-04-29 10:11:53'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '119.76.35.247', '2025-04-29 10:12:53'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', '119.76.35.247', '2025-04-29 10:14:21'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:27:01'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:27:23'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:28:33'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:28:38'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:28:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:31:56'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:32:50'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:33:21'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:33:29'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:33:34'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:33:39'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:33:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:35:09'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:35:14'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:46:11'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:46:15'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:46:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:46:56'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:47:14'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:47:16'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:47:17'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:47:18'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:47:19'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:47:19'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:47:19'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:47:38'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:47:42'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:48:03'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:48:07'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:48:36'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:48:39'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:49:42'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 10:50:11'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:53:19'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 10:59:50'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:00:44'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-04-29 11:00:57'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:01:44'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:01:52'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-04-29 11:01:57'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:05:06'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:05:09'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:05:16'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:05:26'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:06:03'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '119.76.35.247', '2025-04-29 11:06:23'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:06:43'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:06:44'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:07:04'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:08:25'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:08:26'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:08:26'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:08:27'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:08:27'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:08:28'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:08:28'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:10:26'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:11:06'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:12:07'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:14:03'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:14:29'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:14:32'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:16:32'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:16:34'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:16:35'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:20:48'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:21:14'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:21:17'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:22:23'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:22:36'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:22:37'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:24:24'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:24:27'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:31:41'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:31:46'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:31:56'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:35:25'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:37:20'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:39:43'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:39:45'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:39:46'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:40:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:40:52'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:41:24'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:41:32'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:41:54'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-04-29 11:42:01'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:47:41'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:47:51'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 11:47:54'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '119.76.35.247', '2025-04-29 12:09:16'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '119.76.35.247', '2025-04-29 12:09:41'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '119.76.35.247', '2025-04-29 12:11:38'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '119.76.35.247', '2025-04-29 12:11:42'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '119.76.35.247', '2025-04-29 12:12:18'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 12:33:37'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-29 12:34:02'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.190', '2025-04-29 15:28:07'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', '124.120.119.19', '2025-04-29 16:03:29'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', '124.120.119.19', '2025-04-29 16:03:37'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', '124.120.119.19', '2025-04-29 16:03:43'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', '124.120.119.19', '2025-04-29 16:04:42'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '223.24.185.60', '2025-04-29 18:05:51'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', '40.77.167.144', '2025-04-29 19:15:51'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', '40.77.167.144', '2025-04-29 19:16:04'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.77.131', '2025-04-29 20:38:48'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-04-30 04:53:01'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.72.176.129', '2025-04-30 04:53:05'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.122.147.229', '2025-04-30 04:53:10'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-04-30 04:53:42'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.72.176.129', '2025-04-30 04:53:56'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone13,2; U; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) Version/10.0 Mobile/15E148 Safari/602.1', '34.118.63.125', '2025-04-30 04:58:16'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.72.176.129', '2025-04-30 04:58:38'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.123.170.104', '2025-04-30 04:59:27'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Safari/605.1.15', '27.145.4.123', '2025-04-30 07:14:34'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.75.129', '2025-04-30 07:37:26'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '119.76.35.247', '2025-04-30 08:16:20'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '119.76.35.247', '2025-04-30 08:16:21'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '119.76.35.247', '2025-04-30 08:19:59'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '101.108.124.24', '2025-04-30 08:24:14'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '101.108.124.24', '2025-04-30 08:24:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '101.108.124.24', '2025-04-30 08:25:06'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '119.76.35.247', '2025-04-30 08:25:36'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '101.108.124.24', '2025-04-30 08:25:42'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '52.21.79.48', '2025-04-30 08:56:31'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '38.205.128.205', '2025-04-30 08:57:00'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '108.62.233.172', '2025-04-30 08:57:02'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-30 09:15:03'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-30 10:10:32'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-30 10:24:13'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-04-30 10:24:18'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '223.206.155.70', '2025-04-30 12:44:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', '49.231.105.134', '2025-04-30 12:44:35'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '223.206.155.70', '2025-04-30 12:44:38'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '223.206.155.70', '2025-04-30 12:45:25'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '223.206.155.70', '2025-04-30 12:45:49'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '223.206.155.70', '2025-04-30 12:46:03'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '223.206.155.70', '2025-04-30 12:46:14'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '223.206.155.70', '2025-04-30 12:46:15'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.241', '2025-04-30 16:09:37'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', '40.77.167.55', '2025-04-30 20:51:10'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.75.130', '2025-04-30 21:33:40'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', '52.167.144.192', '2025-05-01 06:41:48'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '171.7.248.253', '2025-05-01 08:45:32'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '171.7.248.253', '2025-05-01 08:46:04'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '171.7.248.253', '2025-05-01 08:49:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-01 11:10:43'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-01 11:17:53'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-01 11:18:02'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-01 11:36:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-01 11:37:10'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-01 11:37:29'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-01 11:37:39'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-01 11:37:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-01 11:37:57'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-01 11:38:37'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-01 11:47:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.179', '2025-05-01 12:20:49'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.120.154.179', '2025-05-01 12:28:54'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.79.194', '2025-05-01 12:41:47'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/134.0.6998.165 Safari/537.36', '66.249.79.196', '2025-05-01 12:41:47'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.71.102', '2025-05-01 13:20:05'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '184.22.249.113', '2025-05-01 14:45:43'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '103.173.211.21', '2025-05-01 16:36:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 04:39:53'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '1.46.84.11', '2025-05-02 05:58:59'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/135.0.7049.83 Mobile/15E148 Safari/604.1', '1.46.84.11', '2025-05-02 05:59:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 06:08:24'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.231.105.133', '2025-05-02 06:08:34'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '49.231.105.134', '2025-05-02 06:08:34'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 06:08:45'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 06:09:16'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 06:09:19'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 06:09:37'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 06:09:40'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 06:27:17'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 06:27:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 06:33:31'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 06:34:20');
INSERT INTO `device_logs` (`id`, `device`, `user_agent`, `ip_address`, `visited_at`) VALUES
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 06:41:20'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 06:41:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 06:43:45'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 06:43:55'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 06:44:00'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 06:44:08'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 06:44:12'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 06:44:14'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 06:48:41'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 06:48:45'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-05-02 06:51:03'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 06:59:11'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 07:00:14'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-05-02 07:17:41'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-05-02 07:17:54'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-05-02 07:18:08'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-05-02 07:18:10'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-05-02 07:18:11'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-05-02 07:18:20'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '119.76.35.247', '2025-05-02 07:18:23'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 08:02:05'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '49.231.105.134', '2025-05-02 08:02:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 08:55:00'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 08:55:12'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 08:55:14'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 08:55:15'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 08:55:17'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 08:58:23'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '119.76.35.247', '2025-05-02 08:58:33'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 10:37:22'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 10:37:34'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 10:38:09'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 11:30:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 11:31:18'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 11:31:42'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 11:35:16'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 11:50:30'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 11:53:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '119.76.35.247', '2025-05-02 11:56:54'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.72.176.129', '2025-05-02 15:51:52'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-05-02 15:52:13'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-05-02 15:53:02'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '49.237.202.193', '2025-05-02 17:12:40'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '66.102.6.198', '2025-05-02 17:12:44'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '49.237.202.193', '2025-05-02 17:12:54'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '49.237.202.193', '2025-05-02 17:21:12'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-02 17:44:06'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-02 17:44:08'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.179', '2025-05-02 17:50:43'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '49.237.202.193', '2025-05-02 18:00:08'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '182.232.40.157', '2025-05-02 18:39:06'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', '182.232.40.157', '2025-05-02 18:39:26'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', '182.232.40.157', '2025-05-02 18:39:44'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '64.233.173.71', '2025-05-02 18:39:51'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', '182.232.40.157', '2025-05-02 18:39:59'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', '182.232.40.157', '2025-05-02 18:40:08'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', '182.232.44.1', '2025-05-03 00:00:51'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.111', '2025-05-03 02:02:01'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '49.49.248.157', '2025-05-03 02:17:41'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '49.49.248.157', '2025-05-03 02:21:09'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', '223.207.235.2', '2025-05-03 07:51:56'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', '223.207.235.2', '2025-05-03 07:53:21'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', '223.207.235.2', '2025-05-03 07:54:09'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', '223.207.235.2', '2025-05-03 07:54:24'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', '223.207.235.2', '2025-05-03 07:54:30'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', '223.207.235.2', '2025-05-03 07:55:22'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', '223.207.235.2', '2025-05-03 07:55:34'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', '223.207.235.2', '2025-05-03 07:57:38'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', '223.207.235.2', '2025-05-03 07:57:57'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', '223.207.235.2', '2025-05-03 08:00:24'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', '223.207.235.2', '2025-05-03 08:00:45'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', '182.232.44.1', '2025-05-03 09:30:54'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', '182.232.44.1', '2025-05-03 11:41:28'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 12:32:42'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '74.125.215.132', '2025-05-03 12:32:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '116.179.33.81', '2025-05-03 15:52:14'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '61.90.30.71', '2025-05-03 16:42:51'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:49:14'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:49:24'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:50:09'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:50:18'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/134.0.6998.165 Safari/537.36', '66.249.68.8', '2025-05-03 16:50:43'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.68.7', '2025-05-03 16:50:44'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:51:51'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:52:01'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:53:40'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:53:51'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:54:05'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:54:21'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:54:27'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:54:28'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:54:33'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:54:34'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:54:49'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:54:53'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/366.0.751101837 Mobile/15E148 Safari/604.1', '184.22.231.61', '2025-05-03 16:57:10'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', '223.204.169.160', '2025-05-03 17:04:16'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-05-04 04:23:27'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-05-04 04:24:01'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.122.147.229', '2025-05-04 04:24:13'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.123.170.104', '2025-05-04 04:24:17'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '205.169.39.23', '2025-05-04 04:24:30'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.122.147.229', '2025-05-04 04:26:10'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-05-04 04:28:29'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.173', '2025-05-04 06:09:31'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.198', '2025-05-04 06:10:15'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.121', '2025-05-04 08:04:22'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '124.120.154.121', '2025-05-04 08:39:03'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '1.46.146.75', '2025-05-04 09:53:19'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '1.46.146.75', '2025-05-04 11:34:24'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '1.46.146.75', '2025-05-04 11:40:53'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '1.46.146.75', '2025-05-04 11:40:56'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '1.46.146.75', '2025-05-04 11:48:42'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '1.46.146.75', '2025-05-04 11:48:48'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '1.46.146.75', '2025-05-04 11:54:25'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; U; Android 14; th-th; CPH2359 Build/UKQ1.230924.001) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.88 Mobile Safari/537.36 HeyTapBrowser/45.12.4.1', '1.46.79.201', '2025-05-04 15:26:28'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; U; Android 14; th-th; CPH2359 Build/UKQ1.230924.001) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.88 Mobile Safari/537.36 HeyTapBrowser/45.12.4.1', '1.46.79.201', '2025-05-04 15:26:43'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; U; Android 14; th-th; CPH2359 Build/UKQ1.230924.001) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.88 Mobile Safari/537.36 HeyTapBrowser/45.12.4.1', '1.46.79.201', '2025-05-04 15:27:08'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '171.97.101.110', '2025-05-04 17:06:01'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '171.97.101.110', '2025-05-04 17:06:45'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '171.97.101.110', '2025-05-04 17:07:14'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '171.97.101.110', '2025-05-04 17:08:01'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '171.97.101.110', '2025-05-04 17:08:06'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '171.97.101.110', '2025-05-04 17:39:20'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '171.97.101.110', '2025-05-04 17:39:37'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '171.97.101.110', '2025-05-04 17:41:19'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:45:38'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:46:28'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:46:51'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:47:28'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:47:35'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:47:40'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:55:06'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:55:10'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:55:20'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:55:24'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:59:25'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:59:29'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:59:33'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:59:34'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:59:36'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:59:37'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:59:39'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:59:40'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:59:52'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 17:59:53'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 18:57:26'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 18:57:44'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 18:57:59'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '171.97.101.110', '2025-05-04 18:59:34'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 19:00:10'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 19:00:30'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 19:00:39'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '171.97.101.110', '2025-05-04 19:01:55'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '171.97.101.110', '2025-05-04 19:02:28'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '171.97.101.110', '2025-05-04 19:52:08'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', '52.167.144.163', '2025-05-04 20:51:38'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.71.102', '2025-05-04 22:20:43'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '1.47.136.202', '2025-05-05 02:47:49'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '74.125.215.131', '2025-05-05 02:47:57'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '1.47.136.202', '2025-05-05 02:48:16'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '64.233.173.70', '2025-05-05 02:48:23'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '171.97.101.110', '2025-05-05 02:51:16'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.66.194', '2025-05-05 04:41:06'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '1.46.146.75', '2025-05-05 04:41:08'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 04:43:44'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 04:43:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 04:52:00'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 04:52:09'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 04:52:46'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '58.11.11.121', '2025-05-05 07:25:44'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.121', '2025-05-05 07:45:55'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.121', '2025-05-05 07:46:06'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '49.49.232.11', '2025-05-05 07:51:26'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.121', '2025-05-05 07:51:52'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.121', '2025-05-05 07:52:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 07:54:38'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.121', '2025-05-05 08:02:51'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.121', '2025-05-05 08:09:19'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.121', '2025-05-05 08:09:49'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.121', '2025-05-05 08:12:00'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '58.11.11.121', '2025-05-05 08:16:16'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '58.11.11.121', '2025-05-05 08:16:43'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '58.11.11.121', '2025-05-05 08:17:06'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '58.11.11.121', '2025-05-05 08:17:21'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 08:17:50'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 08:20:00'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 08:20:45'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 08:20:48'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 08:26:32'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.121', '2025-05-05 08:28:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 08:31:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 08:34:50'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 08:34:57'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 08:34:59'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.121', '2025-05-05 08:38:23'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 09:30:29'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-05-05 09:56:36'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.123.170.104', '2025-05-05 09:57:14'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.72.176.129', '2025-05-05 09:57:17'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.94', '2025-05-05 09:58:03'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.122.147.229', '2025-05-05 09:58:05'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '205.169.39.115', '2025-05-05 09:58:20'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.122.147.229', '2025-05-05 09:59:13'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.121', '2025-05-05 10:01:09'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-05-05 10:01:35'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.11.11.121', '2025-05-05 10:13:06'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/136.0.7103.56 Mobile/15E148 Safari/604.1', '58.11.11.121', '2025-05-05 10:33:41'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/136.0.7103.56 Mobile/15E148 Safari/604.1', '58.11.11.121', '2025-05-05 10:33:57'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/136.0.7103.56 Mobile/15E148 Safari/604.1', '58.11.11.121', '2025-05-05 10:34:04'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/136.0.7103.56 Mobile/15E148 Safari/604.1', '58.11.11.121', '2025-05-05 10:34:15'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/136.0.7103.56 Mobile/15E148 Safari/604.1', '58.11.11.121', '2025-05-05 10:34:47'),
(0, 'Tablet', 'Mozilla/5.0 (iPad; CPU OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/136.0.7103.56 Mobile/15E148 Safari/604.1', '58.11.11.121', '2025-05-05 10:35:03'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-05 10:41:09'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '171.7.238.131', '2025-05-05 12:39:07'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '171.7.238.131', '2025-05-05 12:39:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '171.97.101.110', '2025-05-05 13:11:52'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '1.47.136.202', '2025-05-05 15:12:36'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.165 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.71.96', '2025-05-05 16:20:55'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '1.47.136.202', '2025-05-05 16:40:23'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '1.47.136.202', '2025-05-05 17:04:22'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.7 Mobile/15E148 Safari/604.1', '49.229.175.46', '2025-05-05 19:23:23'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', '207.46.13.116', '2025-05-06 01:21:45'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.123.170.104', '2025-05-06 03:22:22'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '34.72.176.129', '2025-05-06 03:22:43'),
(0, 'Desktop', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '104.197.69.115', '2025-05-06 03:22:45'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-06 04:33:41'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-06 05:03:49'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.241.71', '2025-05-06 05:49:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.241.71', '2025-05-06 05:56:05'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.241.71', '2025-05-06 05:58:41'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.241.71', '2025-05-06 06:00:09'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '49.49.241.71', '2025-05-06 06:00:13'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.7049.114 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.71.96', '2025-05-06 06:03:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '124.121.95.122', '2025-05-06 10:40:21'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '124.121.95.122', '2025-05-06 10:41:02'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '124.121.95.122', '2025-05-06 10:41:26'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-06 10:47:17'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '124.121.95.122', '2025-05-06 10:51:27'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '124.121.95.122', '2025-05-06 11:00:37'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-06 11:13:50'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 14; SM-A528B Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.60 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/505.0.0.62.82;]', '171.101.114.166', '2025-05-06 11:15:32'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 14; SM-A528B Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.60 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/505.0.0.62.82;]', '171.101.114.166', '2025-05-06 11:19:13'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 14; SM-A528B Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.60 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/505.0.0.62.82;]', '171.101.114.166', '2025-05-06 11:19:24'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 14; SM-A528B Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.60 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/505.0.0.62.82;]', '171.101.114.166', '2025-05-06 11:28:05'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 14; SM-A528B Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.60 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/505.0.0.62.82;]', '171.101.114.166', '2025-05-06 11:28:15'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 14; SM-A528B Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.60 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/505.0.0.62.82;]', '171.101.114.166', '2025-05-06 11:29:17'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 14; SM-A528B Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.60 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/505.0.0.62.82;]', '171.101.114.166', '2025-05-06 11:29:18'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 14; SM-A528B Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.60 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/505.0.0.62.82;]', '171.101.114.166', '2025-05-06 11:29:22'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 14; SM-A528B Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/136.0.7103.60 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/505.0.0.62.82;]', '171.101.114.166', '2025-05-06 11:29:32'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.101.114.166', '2025-05-06 11:38:31'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.101.114.166', '2025-05-06 11:38:43'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.101.114.166', '2025-05-06 11:38:50'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '64.233.173.70', '2025-05-06 11:38:57'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.101.114.166', '2025-05-06 11:40:53'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.101.114.166', '2025-05-06 11:40:57'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '171.101.114.166', '2025-05-06 11:41:11'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '124.121.95.122', '2025-05-06 11:41:49'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '124.121.95.122', '2025-05-06 11:42:44'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '124.121.95.122', '2025-05-06 11:43:03'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '124.121.95.122', '2025-05-06 11:43:31'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-06 11:44:56'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '124.121.95.122', '2025-05-06 14:09:41'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0.1 Mobile/15E148 Safari/604.1', '49.228.234.155', '2025-05-06 14:44:50'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0.1 Mobile/15E148 Safari/604.1', '49.228.234.155', '2025-05-06 14:45:17'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0.1 Mobile/15E148 Safari/604.1', '49.228.234.155', '2025-05-06 14:45:34');
INSERT INTO `device_logs` (`id`, `device`, `user_agent`, `ip_address`, `visited_at`) VALUES
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', '223.24.161.5', '2025-05-06 20:09:55'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.7049.114 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '66.249.66.193', '2025-05-06 22:39:10'),
(0, 'Tablet', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', '110.77.197.44', '2025-05-07 09:08:55'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-07 10:43:01'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-07 11:35:01'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-07 12:46:21'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', '52.167.144.174', '2025-05-07 13:58:31'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', '52.167.144.174', '2025-05-07 13:58:37'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '27.55.68.212', '2025-05-07 15:01:43'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '27.55.68.212', '2025-05-07 15:01:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '58.10.244.190', '2025-05-07 15:38:49'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Mobile/15E148 Safari/604.1', '49.237.6.231', '2025-05-07 15:42:20'),
(0, 'Mobile', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Mobile/15E148 Safari/604.1', '49.237.6.231', '2025-05-07 15:42:54'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 04:59:44'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 05:04:13'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 05:44:59'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:08:33'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:16:45'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:16:52'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:17:09'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:21:17'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:21:20'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:21:24'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:21:27'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:21:27'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:21:35'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:21:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:21:51'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:21:59'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:22:24'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:22:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:22:27'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:22:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:22:30'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:22:36'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:22:41'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:22:43'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:22:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 06:22:48'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 08:41:56'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 08:42:09'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 08:43:36'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 08:43:40'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 08:43:59'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 08:44:01'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.121', '2025-05-08 08:44:11'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '58.11.11.121', '2025-05-08 10:14:32'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '1.47.20.156', '2025-05-08 10:14:36'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '58.11.11.121', '2025-05-08 10:14:53'),
(0, 'Mobile', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Mobile Safari/537.36', '58.11.11.121', '2025-05-08 10:18:49'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.239.171', '2025-05-08 12:39:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.239.171', '2025-05-08 12:40:24'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.239.171', '2025-05-08 12:40:34'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '58.11.11.94', '2025-05-08 12:42:02'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.239.171', '2025-05-08 12:42:03'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.239.171', '2025-05-08 12:42:19'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.239.171', '2025-05-08 12:42:24'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.239.171', '2025-05-08 12:43:43'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.225.62', '2025-05-08 14:25:45'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.225.62', '2025-05-08 14:25:52'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.225.62', '2025-05-08 14:26:05'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.225.62', '2025-05-08 14:26:25'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.225.62', '2025-05-08 14:27:07'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.225.62', '2025-05-08 14:27:16'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.225.62', '2025-05-08 14:29:00'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.225.62', '2025-05-08 14:29:01'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.239.171', '2025-05-08 14:31:10'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.225.62', '2025-05-08 14:44:21'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.225.62', '2025-05-08 14:44:30'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.225.62', '2025-05-08 15:26:05'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.225.62', '2025-05-08 15:26:07'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.137.122', '2025-05-08 16:31:29'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.137.122', '2025-05-08 16:31:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.137.122', '2025-05-08 16:33:33'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.137.122', '2025-05-08 16:33:38'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.137.122', '2025-05-08 16:33:46'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.137.122', '2025-05-08 16:33:58'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.137.122', '2025-05-08 16:35:41'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.137.122', '2025-05-08 16:38:44'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.137.122', '2025-05-08 16:39:00'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.137.122', '2025-05-08 16:39:02'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.137.122', '2025-05-08 16:39:47'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.137.122', '2025-05-08 16:39:51'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', '223.206.137.122', '2025-05-08 16:40:00'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '124.121.90.222', '2025-05-08 16:56:05'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '184.22.32.226', '2025-05-08 18:39:28'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '184.22.32.226', '2025-05-08 18:52:14'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '184.22.32.226', '2025-05-08 18:52:16'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '184.22.32.226', '2025-05-08 18:52:17'),
(0, 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '184.22.32.226', '2025-05-08 18:52:20'),
(0, 'Desktop', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', '52.167.144.190', '2025-05-08 21:07:41');

-- --------------------------------------------------------

--
-- Table structure for table `ip_country`
--

CREATE TABLE `ip_country` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ip_country`
--

INSERT INTO `ip_country` (`id`, `ip_address`, `country_code`, `country_name`, `created_at`) VALUES
(5, '66.102.6.198', 'US', 'United States', '2025-04-21 15:43:38'),
(6, '49.49.234.132', 'TH', 'Thailand', '2025-04-21 19:35:06'),
(7, '34.122.147.229', 'US', 'United States', '2025-04-22 00:53:25'),
(8, '116.179.33.137', 'CN', 'China', '2025-04-22 00:54:07'),
(9, '124.120.154.110', 'TH', 'Thailand', '2025-04-22 04:26:41'),
(10, '202.29.231.188', 'TH', 'Thailand', '2025-04-22 06:31:26'),
(11, '1.46.139.92', 'TH', 'Thailand', '2025-04-22 08:27:38'),
(12, '77.111.246.31', 'US', 'United States', '2025-04-22 09:53:47'),
(13, '77.111.246.51', 'US', 'United States', '2025-04-22 09:55:10'),
(14, '1.47.151.102', 'TH', 'Thailand', '2025-04-22 14:10:29'),
(15, '202.176.113.42', 'TH', 'Thailand', '2025-04-22 14:49:10'),
(16, '171.97.204.118', 'TH', 'Thailand', '2025-04-22 14:51:39'),
(17, '49.237.40.249', 'TH', 'Thailand', '2025-04-22 14:52:47'),
(18, '66.249.66.194', 'US', 'United States', '2025-04-22 15:41:21'),
(19, '49.237.45.146', 'TH', 'Thailand', '2025-04-22 17:17:11'),
(20, '49.49.240.209', 'TH', 'Thailand', '2025-04-22 19:22:42'),
(21, '34.123.170.104', 'US', 'United States', '2025-04-22 21:36:47'),
(22, '34.72.176.129', 'US', 'United States', '2025-04-22 21:38:19'),
(23, '104.197.69.115', 'US', 'United States', '2025-04-22 22:51:51'),
(24, '205.169.39.136', 'US', 'United States', '2025-04-22 23:28:43'),
(25, '205.169.39.233', 'US', 'United States', '2025-04-23 02:34:52'),
(26, '124.120.154.110', 'TH', 'Thailand', '2025-04-23 03:34:09'),
(27, '205.169.39.113', 'US', 'United States', '2025-04-23 04:46:11'),
(28, '205.169.39.197', 'US', 'United States', '2025-04-23 04:46:51'),
(29, '49.49.250.71', 'TH', 'Thailand', '2025-04-23 06:47:19'),
(30, '49.230.146.223', 'TH', 'Thailand', '2025-04-23 08:06:08'),
(31, '49.237.9.253', 'TH', 'Thailand', '2025-04-23 08:15:00'),
(32, '66.249.66.8', 'US', 'United States', '2025-04-23 08:15:07'),
(33, '66.249.66.8', 'US', 'United States', '2025-04-23 08:15:07'),
(34, '66.249.79.73', 'US', 'United States', '2025-04-23 15:58:44'),
(35, '205.169.39.27', 'US', 'United States', '2025-04-23 17:30:11'),
(36, '58.8.157.57', 'TH', 'Thailand', '2025-04-23 18:42:58'),
(37, '205.169.39.48', 'US', 'United States', '2025-04-23 19:26:11'),
(38, '34.122.147.229', 'US', 'United States', '2025-04-23 23:53:00'),
(39, '104.197.69.115', 'US', 'United States', '2025-04-23 23:53:50'),
(40, '34.72.176.129', 'US', 'United States', '2025-04-23 23:54:20'),
(41, '34.123.170.104', 'US', 'United States', '2025-04-24 00:50:06'),
(42, '34.116.161.207', 'PL', 'Poland', '2025-04-24 01:13:46'),
(43, '124.115.170.7', 'CN', 'China', '2025-04-24 02:28:19'),
(44, '58.11.11.138', 'TH', 'Thailand', '2025-04-24 09:34:23'),
(45, '49.230.63.229', 'TH', 'Thailand', '2025-04-24 09:40:38'),
(46, '205.169.39.198', 'US', 'United States', '2025-04-24 14:00:18'),
(47, '182.232.165.212', 'TH', 'Thailand', '2025-04-24 15:00:23'),
(48, '205.169.39.136', 'US', 'United States', '2025-04-24 18:27:49'),
(49, '58.8.157.57', 'TH', 'Thailand', '2025-04-24 19:18:41'),
(50, '44.205.211.254', 'US', 'United States', '2025-04-25 01:42:01'),
(51, '207.244.82.18', 'US', 'United States', '2025-04-25 01:42:42'),
(52, '38.205.130.10', 'US', 'United States', '2025-04-25 01:43:07'),
(53, '34.72.176.129', 'US', 'United States', '2025-04-25 23:14:58'),
(54, '1.46.137.193', 'TH', 'Thailand', '2025-04-26 11:11:08'),
(55, '104.197.69.115', 'US', 'United States', '2025-04-26 14:56:36'),
(56, '34.123.170.104', 'US', 'United States', '2025-04-26 14:57:30'),
(57, '34.122.147.229', 'US', 'United States', '2025-04-26 14:59:10'),
(58, '171.7.248.253', 'TH', 'Thailand', '2025-04-26 15:16:21'),
(59, '40.77.189.252', 'US', 'US', '2025-04-26 21:09:40'),
(60, '66.249.75.130', 'US', 'US', '2025-04-26 21:44:25'),
(61, '34.123.170.104', 'US', 'United States', '2025-04-27 00:06:55'),
(62, '104.197.69.115', 'US', 'United States', '2025-04-27 00:07:44'),
(63, '205.169.39.48', 'US', 'United States', '2025-04-27 05:47:27'),
(64, '49.12.36.194', 'DE', 'Germany', '2025-04-27 07:53:50'),
(65, '195.201.233.83', 'DE', 'Germany', '2025-04-27 09:36:25'),
(66, '167.235.204.72', 'DE', 'Germany', '2025-04-27 10:15:34'),
(67, '49.13.222.100', 'DE', 'Germany', '2025-04-27 10:24:22'),
(68, '49.13.222.103', 'DE', 'Germany', '2025-04-27 10:29:22'),
(69, '49.13.82.87', 'DE', 'Germany', '2025-04-27 11:41:58'),
(70, '49.13.94.162', 'DE', 'Germany', '2025-04-27 12:38:33'),
(71, '116.179.33.209', 'CN', 'China', '2025-04-27 13:35:11'),
(72, '49.13.12.7', 'DE', 'Germany', '2025-04-27 13:36:30'),
(73, '49.49.241.170', 'TH', 'Thailand', '2025-04-27 18:32:47'),
(74, '205.169.39.124', 'US', 'United States', '2025-04-27 20:01:10'),
(75, '58.8.169.67', 'TH', 'Thailand', '2025-04-27 20:02:40'),
(76, '205.169.39.81', 'US', 'United States', '2025-04-27 23:03:36'),
(77, '205.169.39.235', 'US', 'United States', '2025-04-27 23:04:36'),
(78, '205.169.39.73', 'US', 'United States', '2025-04-27 23:11:51'),
(79, '52.167.144.173', 'US', 'United States', '2025-04-27 23:42:39'),
(80, '66.249.79.66', 'US', 'United States', '2025-04-28 02:06:33'),
(81, '66.249.71.97', 'TW', 'Taiwan', '2025-04-28 02:06:36'),
(82, '119.76.35.247', 'TH', 'Thailand', '2025-04-28 04:22:12'),
(83, '110.168.142.67', 'TH', 'Thailand', '2025-04-28 04:43:00'),
(84, '74.125.215.130', 'US', 'United States', '2025-04-28 04:43:46'),
(85, '61.19.1.196', 'TH', 'Thailand', '2025-04-28 06:48:58'),
(86, '40.77.190.165', 'US', 'United States', '2025-04-28 07:28:06'),
(87, '184.22.34.7', 'TH', 'Thailand', '2025-04-28 08:35:22'),
(88, '66.249.71.195', 'TW', 'Taiwan', '2025-04-28 09:33:27'),
(89, '171.102.217.10', 'TH', 'Thailand', '2025-04-28 10:50:08'),
(90, '34.122.147.229', 'US', 'United States', '2025-04-28 11:00:24'),
(91, '205.169.39.116', 'US', 'United States', '2025-04-28 23:41:46'),
(92, '34.122.147.229', 'US', 'United States', '2025-04-29 00:01:20'),
(93, '205.169.39.103', 'US', 'United States', '2025-04-29 01:18:33'),
(94, '119.76.35.247', 'TH', 'Thailand', '2025-04-29 05:00:31'),
(95, '104.197.69.115', 'US', 'United States', '2025-04-29 07:54:10'),
(96, '34.72.176.129', 'US', 'United States', '2025-04-29 07:54:43'),
(97, '34.123.170.104', 'US', 'United States', '2025-04-29 07:54:47'),
(98, '205.169.39.190', 'US', 'United States', '2025-04-29 15:28:07'),
(99, '124.120.119.19', 'TH', 'Thailand', '2025-04-29 16:03:29'),
(100, '223.24.185.60', 'TH', 'Thailand', '2025-04-29 18:05:51'),
(101, '40.77.167.144', 'US', 'US', '2025-04-29 19:15:51'),
(102, '66.249.77.131', 'US', 'US', '2025-04-29 20:38:48'),
(103, '104.197.69.115', 'US', 'United States', '2025-04-30 04:53:01'),
(104, '34.72.176.129', 'US', 'United States', '2025-04-30 04:53:05'),
(105, '34.122.147.229', 'US', 'United States', '2025-04-30 04:53:10'),
(106, '34.118.63.125', 'PL', 'Poland', '2025-04-30 04:58:16'),
(107, '34.123.170.104', 'US', 'United States', '2025-04-30 04:59:27'),
(108, '27.145.4.123', 'TH', 'Thailand', '2025-04-30 07:14:34'),
(109, '66.249.75.129', 'US', 'United States', '2025-04-30 07:37:26'),
(110, '119.76.35.247', 'TH', 'Thailand', '2025-04-30 08:16:20'),
(111, '101.108.124.24', 'TH', 'Thailand', '2025-04-30 08:24:14'),
(112, '52.21.79.48', 'US', 'United States', '2025-04-30 08:56:31'),
(113, '38.205.128.205', 'US', 'United States', '2025-04-30 08:57:00'),
(114, '108.62.233.172', 'US', 'United States', '2025-04-30 08:57:02'),
(115, '223.206.155.70', 'TH', 'Thailand', '2025-04-30 12:44:28'),
(116, '49.231.105.134', 'TH', 'Thailand', '2025-04-30 12:44:35'),
(117, '205.169.39.241', 'US', 'United States', '2025-04-30 16:09:37'),
(118, '40.77.167.55', 'US', 'US', '2025-04-30 20:51:10'),
(119, '66.249.75.130', 'US', 'United States', '2025-04-30 21:33:40'),
(120, '52.167.144.192', 'US', 'United States', '2025-05-01 06:41:48'),
(121, '171.7.248.253', 'TH', 'Thailand', '2025-05-01 08:45:32'),
(122, '124.120.154.179', 'TH', 'Thailand', '2025-05-01 11:10:43'),
(123, '66.249.79.194', 'US', 'United States', '2025-05-01 12:41:47'),
(124, '66.249.79.196', 'US', 'United States', '2025-05-01 12:41:47'),
(125, '66.249.71.102', 'TW', 'Taiwan', '2025-05-01 13:20:05'),
(126, '184.22.249.113', 'TH', 'Thailand', '2025-05-01 14:45:43'),
(127, '103.173.211.21', 'IN', 'India', '2025-05-01 16:36:47'),
(128, '119.76.35.247', 'TH', 'Thailand', '2025-05-02 04:39:53'),
(129, '1.46.84.11', 'TH', 'Thailand', '2025-05-02 05:58:59'),
(130, '49.231.105.133', 'TH', 'Thailand', '2025-05-02 06:08:34'),
(131, '49.231.105.134', 'TH', 'Thailand', '2025-05-02 06:08:34'),
(132, '34.72.176.129', 'US', 'United States', '2025-05-02 15:51:52'),
(133, '104.197.69.115', 'US', 'United States', '2025-05-02 15:52:13'),
(134, '49.237.202.193', 'TH', 'Thailand', '2025-05-02 17:12:40'),
(135, '66.102.6.198', 'US', 'United States', '2025-05-02 17:12:44'),
(136, '124.120.154.179', 'TH', 'Thailand', '2025-05-02 17:44:06'),
(137, '182.232.40.157', 'TH', 'Thailand', '2025-05-02 18:39:06'),
(138, '64.233.173.71', 'SG', 'Singapore', '2025-05-02 18:39:51'),
(139, '182.232.44.1', 'TH', 'Thailand', '2025-05-03 00:00:51'),
(140, '205.169.39.111', 'US', 'United States', '2025-05-03 02:02:01'),
(141, '49.49.248.157', 'TH', 'Thailand', '2025-05-03 02:17:41'),
(142, '223.207.235.2', 'TH', 'Thailand', '2025-05-03 07:51:56'),
(143, '184.22.231.61', 'TH', 'Thailand', '2025-05-03 12:32:42'),
(144, '74.125.215.132', 'US', 'United States', '2025-05-03 12:32:46'),
(145, '116.179.33.81', 'CN', 'China', '2025-05-03 15:52:14'),
(146, '61.90.30.71', 'TH', 'Thailand', '2025-05-03 16:42:51'),
(147, '66.249.68.8', 'US', 'United States', '2025-05-03 16:50:43'),
(148, '66.249.68.7', 'US', 'United States', '2025-05-03 16:50:44'),
(149, '223.204.169.160', 'TH', 'Thailand', '2025-05-03 17:04:16'),
(150, '104.197.69.115', 'US', 'United States', '2025-05-04 04:23:27'),
(151, '34.122.147.229', 'US', 'United States', '2025-05-04 04:24:13'),
(152, '34.123.170.104', 'US', 'United States', '2025-05-04 04:24:17'),
(153, '205.169.39.23', 'US', 'United States', '2025-05-04 04:24:30'),
(154, '205.169.39.173', 'US', 'United States', '2025-05-04 06:09:31'),
(155, '205.169.39.198', 'US', 'United States', '2025-05-04 06:10:15'),
(156, '124.120.154.121', 'TH', 'Thailand', '2025-05-04 08:04:22'),
(157, '1.46.146.75', 'TH', 'Thailand', '2025-05-04 09:53:19'),
(158, '1.46.79.201', 'TH', 'Thailand', '2025-05-04 15:26:28'),
(159, '171.97.101.110', 'TH', 'Thailand', '2025-05-04 17:06:01'),
(160, '52.167.144.163', 'US', 'United States', '2025-05-04 20:51:38'),
(161, '66.249.71.102', 'TW', 'Taiwan', '2025-05-04 22:20:43'),
(162, '1.47.136.202', 'TH', 'Thailand', '2025-05-05 02:47:49'),
(163, '74.125.215.131', 'US', 'United States', '2025-05-05 02:47:57'),
(164, '64.233.173.70', 'SG', 'Singapore', '2025-05-05 02:48:23'),
(165, '66.249.66.194', 'US', 'United States', '2025-05-05 04:41:06'),
(166, '1.46.146.75', 'TH', 'Thailand', '2025-05-05 04:41:08'),
(167, '58.11.11.121', 'TH', 'Thailand', '2025-05-05 04:43:44'),
(168, '49.49.232.11', 'TH', 'Thailand', '2025-05-05 07:51:26'),
(169, '104.197.69.115', 'US', 'United States', '2025-05-05 09:56:36'),
(170, '34.123.170.104', 'US', 'United States', '2025-05-05 09:57:14'),
(171, '34.72.176.129', 'US', 'United States', '2025-05-05 09:57:17'),
(172, '205.169.39.94', 'US', 'United States', '2025-05-05 09:58:03'),
(173, '34.122.147.229', 'US', 'United States', '2025-05-05 09:58:05'),
(174, '205.169.39.115', 'US', 'United States', '2025-05-05 09:58:20'),
(175, '171.7.238.131', 'TH', 'Thailand', '2025-05-05 12:39:07'),
(176, '66.249.71.96', 'TW', 'Taiwan', '2025-05-05 16:20:55'),
(177, '1.47.136.202', 'TH', 'Thailand', '2025-05-05 17:04:22'),
(178, '49.229.175.46', 'TH', 'Thailand', '2025-05-05 19:23:23'),
(179, '207.46.13.116', 'US', 'United States', '2025-05-06 01:21:45'),
(180, '34.123.170.104', 'US', 'United States', '2025-05-06 03:22:22'),
(181, '34.72.176.129', 'US', 'United States', '2025-05-06 03:22:43'),
(182, '104.197.69.115', 'US', 'United States', '2025-05-06 03:22:45'),
(183, '58.11.11.121', 'TH', 'Thailand', '2025-05-06 04:33:41'),
(184, '49.49.241.71', 'TH', 'Thailand', '2025-05-06 05:49:25'),
(185, '66.249.71.96', 'TW', 'Taiwan', '2025-05-06 06:03:25'),
(186, '124.121.95.122', 'TH', 'Thailand', '2025-05-06 10:40:21'),
(187, '171.101.114.166', 'TH', 'Thailand', '2025-05-06 11:15:32'),
(188, '64.233.173.70', 'SG', 'Singapore', '2025-05-06 11:38:57'),
(189, '49.228.234.155', 'TH', 'Thailand', '2025-05-06 14:44:50'),
(190, '223.24.161.5', 'TH', 'TH', '2025-05-06 20:09:55'),
(191, '66.249.66.193', 'US', 'United States', '2025-05-06 22:39:10'),
(192, '110.77.197.44', 'TH', 'Thailand', '2025-05-07 09:08:55'),
(193, '58.11.11.121', 'TH', 'Thailand', '2025-05-07 10:43:01'),
(194, '52.167.144.174', 'US', 'United States', '2025-05-07 13:58:31'),
(195, '27.55.68.212', 'TH', 'Thailand', '2025-05-07 15:01:43'),
(196, '58.10.244.190', 'TH', 'Thailand', '2025-05-07 15:38:49'),
(197, '49.237.6.231', 'TH', 'Thailand', '2025-05-07 15:42:20'),
(198, '58.11.11.121', 'TH', 'Thailand', '2025-05-08 04:59:44'),
(199, '1.47.20.156', 'TH', 'Thailand', '2025-05-08 10:14:36'),
(200, '223.206.239.171', 'TH', 'Thailand', '2025-05-08 12:39:28'),
(201, '58.11.11.94', 'TH', 'Thailand', '2025-05-08 12:42:02'),
(202, '223.206.225.62', 'TH', 'Thailand', '2025-05-08 14:25:45'),
(203, '223.206.137.122', 'TH', 'Thailand', '2025-05-08 16:31:29'),
(204, '124.121.90.222', 'TH', 'Thailand', '2025-05-08 16:56:05'),
(205, '184.22.32.226', 'TH', 'Thailand', '2025-05-08 18:39:28'),
(206, '52.167.144.190', 'US', 'United States', '2025-05-08 21:07:41');

-- --------------------------------------------------------

--
-- Table structure for table `logos`
--

CREATE TABLE `logos` (
  `id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `alt_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logos`
--

INSERT INTO `logos` (`id`, `image_url`, `alt_text`) VALUES
(4, 'https://static.wixstatic.com/media/ab332b_2ab230e943c640a5b5e9c776413b22b7~mv2.png/v1/fill/w_123,h_125,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/LINE_ALBUM_%E0%B8%A3%E0%B8%A7%E0%B8%A1%E0%B9%82%E0%B8%A5%E0%B9%82%E0%B8%81%E0%B9%89%E0%B8%AA%E0%B8%9B', 'Friendly Design'),
(5, 'https://static.wixstatic.com/media/ab332b_2f174b6a39fd4b4fb34ff2087f4cf0c7~mv2.png/v1/fill/w_134,h_81,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/LINE_ALBUM_Logo%20%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%95%E0%B8%B9%E0%B8%99%E0%B8%9E%E0%B8%B5%E0', 'Friendly Design'),
(6, 'https://static.wixstatic.com/media/ab332b_6d85d3ca9828464fa85f77ff85540187~mv2.png/v1/fill/w_107,h_107,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/94274946_107082947653094_301984397743305.png', 'มูลนิธิ'),
(7, 'https://static.wixstatic.com/media/ab332b_9b8ddd0f092a435ea25e49b1f79ea745~mv2.jpg/v1/fill/w_156,h_62,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/ab332b_9b8ddd0f092a435ea25e49b1f79ea745~mv2.jpg', 'Friendly Design'),
(8, 'https://www.jobbkk.com/upload/employer/04/DF4/030DF4/images/200180.webp?864.7999999998137', 'kw'),
(9, 'https://future-tech.co.th/wp-content/uploads/2023/06/logo-FT-horizon.png', 'future-tech');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `icon_url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `list_item1` varchar(255) DEFAULT NULL,
  `list_item2` varchar(255) DEFAULT NULL,
  `list_item3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `icon_url`, `title`, `list_item1`, `list_item2`, `list_item3`) VALUES
(1, 'img/icon-document.png', 'การบริการครอบคลุม 360°', 'บริการครบวงจร', 'การวิเคราะห์ข้อมูล', 'การสนับสนุนตลอด 24/7'),
(9, 'img/icon-growth.png', 'ลูกค้ากว่า 3,800 ราย', 'ความพึงพอใจสูง', 'การเติบโตอย่างยั่งยืน', 'ผลลัพธ์ที่พิสูจน์แล้ว'),
(10, 'img/icon-user.png', 'ประสบการณ์ผู้ใช้ที่ยอดเยี่ยม', 'อินเตอร์เฟซที่ใช้งานง่าย', 'การสนับสนุนส่วนบุคคล', 'การปรับแต่งได้'),
(11, 'img/icon-funnel.png', 'การตลาด Full-Funnel', 'กลยุทธ์ครบวงจร', 'การติดตามผล', 'การเพิ่มยอดขาย');

-- --------------------------------------------------------

--
-- Table structure for table `service_cards`
--

CREATE TABLE `service_cards` (
  `id` int(11) NOT NULL,
  `icon_url` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `list_item1` varchar(255) NOT NULL,
  `list_item2` varchar(255) NOT NULL,
  `list_item3` varchar(255) NOT NULL,
  `list_item4` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_cards`
--

INSERT INTO `service_cards` (`id`, `icon_url`, `title`, `description`, `list_item1`, `list_item2`, `list_item3`, `list_item4`) VALUES
(1, 'img/icon-funnel.png', 'การตลาด Full-Funnel', 'เพิ่มยอดขายด้วยกลยุทธ์ครบวงจร ตั้งแต่สร้างการรับรู้ไปจนถึงปิดการขาย ทีมงานของเราจะช่วยคุณออกแบบแคมเปญที่เข้าถึงกลุ่มเป้าหมายได้อย่างแม่นยำ', 'SEO & SEM Optimization', 'Social Media Advertising', 'Conversion Rate Optimization (CRO)', 'Remarketing Campaigns'),
(2, 'img/icon-document.png', 'การผลิตคอนเทนต์', 'สร้างคอนเทนต์คุณภาพสูงที่ดึงดูดและเพิ่มการมีส่วนร่วม ไม่ว่าจะเป็นวิดีโอ ภาพกราฟิก หรือบทความ เรามีทีมครีเอทีฟที่พร้อมนำเสนอไอเดียใหม่ ๆ', 'วิดีโอโปรโมทและแอนิเมชัน', 'กราฟิกดีไซน์สำหรับโซเชียลมีเดีย', 'บทความ SEO และ Blogging', 'Infographic และ Visual Storytelling'),
(3, 'img/icon-growth.png', 'การวิเคราะห์ข้อมูล', 'ตัดสินใจด้วยข้อมูลเชิงลึก เพื่อผลลัพธ์ที่ดีที่สุด เราใช้เครื่องมือล่าสุดในการวิเคราะห์พฤติกรรมลูกค้าและปรับปรุงกลยุทธ์แบบเรียลไทม์', 'Data Insights & Dashboard', 'Performance Reports รายสัปดาห์', 'A/B Testing และ Experimentation', 'Predictive Analytics'),
(4, 'img/icon-user.png', 'การสร้างแบรนด์', 'พัฒนาเอกลักษณ์แบรนด์ที่แข็งแกร่งและน่าจดจำ ด้วยการออกแบบโลโก้ การเล่าเรื่อง และกลยุทธ์ที่สร้างความแตกต่างในตลาด', 'Brand Identity & Logo Design', 'Storytelling และ Brand Voice', 'Visual Design และ Guidelines', 'Brand Positioning Strategy');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `session_token` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `admin_id`, `session_token`, `created_at`) VALUES
(15, 10, '4f1abf72969d88c7842ded2488b221b4', '2025-03-20 00:59:19'),
(16, 10, 'a716590d1b57fb6335f47604fcd9ef77', '2025-03-21 12:48:40'),
(17, 10, '7805eb2da51927c3f908baf87a0a7e4d', '2025-03-21 14:54:45'),
(18, 10, '78da79a9cb2b055ac40ea2ac3bff0d6a', '2025-03-25 13:11:27'),
(19, 10, 'b0ce1b77b815112a274c24d0cc3b1f8c', '2025-03-25 15:33:20'),
(20, 10, '12109f1a2e28743ac03376f703fd06a5', '2025-03-27 02:32:18'),
(21, 10, '82f94cf468204f085eea730dfdf53af8', '2025-04-21 13:16:38'),
(57, 11, '1c06e019893f313243fee64e3fb6eb41', '2025-05-04 18:49:18'),
(58, 11, 'b61cd0878f221c716fd3367a1429f596', '2025-05-05 11:44:36'),
(59, 11, 'e0e44070230c79947bfe7fa5e0ff7f86', '2025-05-05 11:49:25'),
(60, 11, 'b3fcda237f3fbe1a083aeda8270f412a', '2025-05-05 14:50:44'),
(61, 11, '1b9b9c174b67ec9ee3f135888461e585', '2025-05-07 18:51:45'),
(62, 11, 'c6f1b306a9ac4fe9ab586600412b3d38', '2025-05-08 12:00:11'),
(63, 11, '0d7864eecae94f009c1f3f330d72d5ef', '2025-05-08 13:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `quote` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `author_name` varchar(100) NOT NULL,
  `author_location` varchar(100) NOT NULL,
  `avatar_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `quote`, `text`, `author_name`, `author_location`, `avatar_url`) VALUES
(3, 'The best marketing', 'เป็นบริษัทที่ให้คำแนะนำเกี่ยวกับการตลาดได้ดีและเข้าใจมากเลยค่ะ หวังว่าจะได้ร่วมงานกันอีกค่ะ', 'Anonymous', 'Thailand', 'https://t3.ftcdn.net/jpg/03/94/89/90/360_F_394899054_4TMgw6eiMYUfozaZU3Kgr5e0LdH4ZrsU.jpg'),
(4, 'The best marketing', 'ขอบคุณสำหรับการเป็นที่ปรึกษาครับ ผมสามารถต่อยอดได้หลายแนวทางมาก ขอบพระคุณเป็นอย่างสูงครับ', 'Khong', 'Thailand', 'https://t3.ftcdn.net/jpg/03/94/89/90/360_F_394899054_4TMgw6eiMYUfozaZU3Kgr5e0LdH4ZrsU.jpg'),
(5, 'Managing is effortless with Iconnex', 'Thanks to Iconnex, we can manage our company and products more efficiently than ever.', 'Smart', 'Thailand', 'https://t3.ftcdn.net/jpg/03/94/89/90/360_F_394899054_4TMgw6eiMYUfozaZU3Kgr5e0LdH4ZrsU.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_activity`
--

CREATE TABLE `user_activity` (
  `user_id` varchar(64) NOT NULL,
  `last_activity` datetime NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_activity`
--

INSERT INTO `user_activity` (`user_id`, `last_activity`, `id`) VALUES
('p6r46m29hiedo22dscc1j37gap', '2025-05-08 13:21:17', 832),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 13:21:20', 833),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 13:21:24', 834),
('p6r46m29hiedo22dscc1j37gap', '2025-05-08 13:21:27', 835),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 13:21:27', 836),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 13:21:35', 837),
('p6r46m29hiedo22dscc1j37gap', '2025-05-08 13:21:46', 838),
('p6r46m29hiedo22dscc1j37gap', '2025-05-08 13:21:51', 839),
('p6r46m29hiedo22dscc1j37gap', '2025-05-08 13:21:59', 840),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 13:22:24', 841),
('p6r46m29hiedo22dscc1j37gap', '2025-05-08 13:22:25', 842),
('p6r46m29hiedo22dscc1j37gap', '2025-05-08 13:22:27', 843),
('p6r46m29hiedo22dscc1j37gap', '2025-05-08 13:22:28', 844),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 13:22:30', 845),
('p6r46m29hiedo22dscc1j37gap', '2025-05-08 13:22:36', 846),
('p6r46m29hiedo22dscc1j37gap', '2025-05-08 13:22:41', 847),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 13:22:43', 848),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 13:22:47', 849),
('p6r46m29hiedo22dscc1j37gap', '2025-05-08 13:22:48', 850),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 15:41:56', 851),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 15:42:09', 852),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 15:43:36', 853),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 15:43:40', 854),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 15:43:59', 855),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 15:44:01', 856),
('th2t33n2bc9nm61p85okbkb53s', '2025-05-08 15:44:11', 857),
('2ljif5t5ob4a57bkqjd7s4e3il', '2025-05-08 17:14:32', 858),
('bsa3eussfivu2gaq6bqeervtpn', '2025-05-08 17:14:36', 859),
('2ljif5t5ob4a57bkqjd7s4e3il', '2025-05-08 17:14:53', 860),
('2ljif5t5ob4a57bkqjd7s4e3il', '2025-05-08 17:18:49', 861),
('q67nejbrvia9p71iqt27o5ch1q', '2025-05-08 19:39:28', 862),
('q67nejbrvia9p71iqt27o5ch1q', '2025-05-08 19:40:24', 863),
('q67nejbrvia9p71iqt27o5ch1q', '2025-05-08 19:40:34', 864),
('p6r46m29hiedo22dscc1j37gap', '2025-05-08 19:42:02', 865),
('q67nejbrvia9p71iqt27o5ch1q', '2025-05-08 19:42:03', 866),
('q67nejbrvia9p71iqt27o5ch1q', '2025-05-08 19:42:19', 867),
('q67nejbrvia9p71iqt27o5ch1q', '2025-05-08 19:42:24', 868),
('q67nejbrvia9p71iqt27o5ch1q', '2025-05-08 19:43:43', 869),
('04k3ml2als5opjc0583fja9ped', '2025-05-08 21:25:45', 870),
('04k3ml2als5opjc0583fja9ped', '2025-05-08 21:25:52', 871),
('04k3ml2als5opjc0583fja9ped', '2025-05-08 21:26:05', 872),
('04k3ml2als5opjc0583fja9ped', '2025-05-08 21:26:25', 873),
('04k3ml2als5opjc0583fja9ped', '2025-05-08 21:27:07', 874),
('04k3ml2als5opjc0583fja9ped', '2025-05-08 21:27:16', 875),
('04k3ml2als5opjc0583fja9ped', '2025-05-08 21:29:00', 876),
('04k3ml2als5opjc0583fja9ped', '2025-05-08 21:29:01', 877),
('q67nejbrvia9p71iqt27o5ch1q', '2025-05-08 21:31:10', 878),
('04k3ml2als5opjc0583fja9ped', '2025-05-08 21:44:21', 879),
('04k3ml2als5opjc0583fja9ped', '2025-05-08 21:44:30', 880),
('04k3ml2als5opjc0583fja9ped', '2025-05-08 22:26:05', 881),
('04k3ml2als5opjc0583fja9ped', '2025-05-08 22:26:07', 882),
('2t3cmr80q27g29oi9sdi577j2s', '2025-05-08 23:31:29', 883),
('2t3cmr80q27g29oi9sdi577j2s', '2025-05-08 23:31:46', 884),
('2t3cmr80q27g29oi9sdi577j2s', '2025-05-08 23:33:33', 885),
('2t3cmr80q27g29oi9sdi577j2s', '2025-05-08 23:33:38', 886),
('2t3cmr80q27g29oi9sdi577j2s', '2025-05-08 23:33:46', 887),
('2t3cmr80q27g29oi9sdi577j2s', '2025-05-08 23:33:58', 888),
('2t3cmr80q27g29oi9sdi577j2s', '2025-05-08 23:35:41', 889),
('2t3cmr80q27g29oi9sdi577j2s', '2025-05-08 23:38:44', 890),
('2t3cmr80q27g29oi9sdi577j2s', '2025-05-08 23:39:00', 891),
('2t3cmr80q27g29oi9sdi577j2s', '2025-05-08 23:39:02', 892),
('2t3cmr80q27g29oi9sdi577j2s', '2025-05-08 23:39:47', 893),
('2t3cmr80q27g29oi9sdi577j2s', '2025-05-08 23:39:51', 894),
('2t3cmr80q27g29oi9sdi577j2s', '2025-05-08 23:40:00', 895),
('rpmvsvp20kemblq76gf75j4160', '2025-05-08 23:56:05', 896),
('85g7lr670oen0jutfegdo0712v', '2025-05-09 01:39:28', 897),
('85g7lr670oen0jutfegdo0712v', '2025-05-09 01:52:14', 898),
('85g7lr670oen0jutfegdo0712v', '2025-05-09 01:52:16', 899),
('85g7lr670oen0jutfegdo0712v', '2025-05-09 01:52:17', 900),
('85g7lr670oen0jutfegdo0712v', '2025-05-09 01:52:20', 901),
('1spcd8oqi387foc8uc3o5ngd0u', '2025-05-09 04:07:41', 902);

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `visit_time` datetime DEFAULT NULL,
  `user_agent` text NOT NULL,
  `page` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `ip`, `visit_time`, `user_agent`, `page`) VALUES
(1, '127.0.0.1', '2025-04-07 15:30:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36…', '/home');

-- --------------------------------------------------------

--
-- Table structure for table `why_choose_us`
--

CREATE TABLE `why_choose_us` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `why_choose_us`
--

INSERT INTO `why_choose_us` (`id`, `title`, `description`) VALUES
(1, 'ประสบการณ์กว่า 10 ปี', 'ด้วยประสบการณ์ในวงการการตลาดดิจิทัลมากว่า 10 ปี ทีมงานของเราได้ทำงานร่วมกับลูกค้าหลากหลายอุตสาหกรรม'),
(2, 'ทีมงานมืออาชีพ', 'เราคัดเลือกผู้เชี่ยวชาญในทุกสาขา เพื่อให้มั่นใจว่าทุกบริการจะส่งมอบผลลัพธ์ที่ยอดเยี่ยม'),
(3, 'ผลลัพธ์ที่วัดได้', 'ทุกแคมเปญมาพร้อมรายงานผลลัพธ์ที่ชัดเจนและเข้าใจง่าย'),
(4, 'โซลูชันเฉพาะตัว', 'กลยุทธ์ทุกชิ้นถูกออกแบบมาเพื่อธุรกิจของคุณโดยเฉพาะ');

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

CREATE TABLE `works` (
  `id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `list_item1` varchar(255) DEFAULT NULL,
  `list_item2` varchar(255) DEFAULT NULL,
  `list_item3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`id`, `image_url`, `title`, `list_item1`, `list_item2`, `list_item3`) VALUES
(1, 'https://iconnexthailand.com/public/img/team-1.jpg', 'การทำงานร่วมกันเป็นทีม', 'การวางแผนเชิงกลยุทธ์', 'การประสานงานที่มีประสิทธิภาพ', 'ผลลัพธ์ที่ยอดเยี่ยม'),
(4, 'img/team-2.jpg', 'ความสำเร็จของลูกค้า', 'เพิ่มยอดขาย 200%', 'ลูกค้าพึงพอใจสูง', 'โครงการที่ส่งมอบตรงเวลา'),
(7, 'img/team-3.jpg', 'การออกแบบสร้างสรรค์', 'ดีไซน์ทันสมัย', 'แบรนด์ที่โดดเด่น', 'ความคิดสร้างสรรค์ไร้ขีดจำกัด'),
(8, 'img/team-4.jpg', 'การตลาดดิจิทัล', 'แคมเปญที่ทรงพลัง', 'การวิเคราะห์ข้อมูลเชิงลึก', 'เข้าถึงกลุ่มเป้าหมาย');

-- --------------------------------------------------------

--
-- Table structure for table `work_process`
--

CREATE TABLE `work_process` (
  `id` int(11) NOT NULL,
  `step` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `work_process`
--

INSERT INTO `work_process` (`id`, `step`, `title`, `description`) VALUES
(1, 'ขั้นตอนที่ 1', 'วิเคราะห์และวางแผน', 'ศึกษาและทำความเข้าใจธุรกิจของคุณอย่างลึกซึ้ง'),
(4, 'ขั้นตอนที่ 2', 'ออกแบบและพัฒนา', 'สร้างสรรค์คอนเทนต์และพัฒนาโซลูชันที่ตอบโจทย์'),
(5, 'ขั้นตอนที่ 3', 'ดำเนินการและปรับแต่ง', 'ดูแลแคมเปญและปรับแต่งแบบเรียลไทม์'),
(6, 'ขั้นตอนที่ 4', 'วัดผลและรายงาน', 'สรุปผลลัพธ์ด้วยรายงานที่ชัดเจน');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clicks`
--
ALTER TABLE `clicks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_date` (`click_date`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ip_country`
--
ALTER TABLE `ip_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logos`
--
ALTER TABLE `logos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_cards`
--
ALTER TABLE `service_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `why_choose_us`
--
ALTER TABLE `why_choose_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_process`
--
ALTER TABLE `work_process`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `clicks`
--
ALTER TABLE `clicks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=603;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ip_country`
--
ALTER TABLE `ip_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `logos`
--
ALTER TABLE `logos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `service_cards`
--
ALTER TABLE `service_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_activity`
--
ALTER TABLE `user_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=903;

--
-- AUTO_INCREMENT for table `why_choose_us`
--
ALTER TABLE `why_choose_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `works`
--
ALTER TABLE `works`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `work_process`
--
ALTER TABLE `work_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
