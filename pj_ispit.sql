-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for pj_ispit
DROP DATABASE IF EXISTS `pj_ispit`;
CREATE DATABASE IF NOT EXISTS `pj_ispit` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `pj_ispit`;

-- Dumping structure for table pj_ispit.customer
DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `umcn` varchar(255) NOT NULL,
  `tax_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pj_ispit.customer: ~14 rows (approximately)
INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `email`, `phone`, `umcn`, `tax_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Strahinja', 'Novovic', 'stralekill@gmail.com', '+381653134443', '1231251512', NULL, '2026-04-28 04:48:57', '2026-04-28 03:33:12', '2026-04-28 03:33:29'),
	(2, 'Petar', 'Kresoja', 'pk123@gmail.com', '0631246356', '123456789', NULL, '2026-04-28 03:13:03', NULL, '0000-00-00 00:00:00'),
	(3, 'Jostra', 'Novovic', 'jostranovovic@gmail.com', '0621652334', '2312324515', NULL, '2026-04-28 17:56:17', '2026-04-28 16:04:14', '2026-04-28 16:47:43'),
	(4, 'novovic', 'korisnik', 'test@example.com', '12345667767', '123123123123123123', NULL, '2026-04-28 16:47:11', '2026-04-28 16:47:17', '2026-04-28 16:47:41'),
	(5, 'dankjo', 'novovic', 'dannovovic@gmail.com', '065423242451', '123124151365326', NULL, '2026-04-28 16:47:36', NULL, '2026-04-28 16:47:39'),
	(6, 'Strahinja', 'Novovic', 'stralekill@gmail.com', '0653134443', '1234125412512', NULL, '2026-04-28 16:49:45', NULL, '2026-04-28 16:49:48'),
	(7, '', '', '', '', '', NULL, '2026-04-28 16:52:42', NULL, '2026-04-28 16:52:44'),
	(8, '', '', '', '', '', NULL, '2026-04-28 16:53:47', NULL, '2026-04-28 16:53:49'),
	(9, 'Strahinja', 'Novovic', 'stralekill@gmail.com', '0653134443', '12345215125125', NULL, '2026-04-28 17:17:47', '2026-04-28 17:17:51', '2026-04-28 17:17:53'),
	(10, 'Strahinja', 'Novovic', 'stralekill@gmail.com', '0653134443', '213142412412', NULL, '2026-04-29 22:22:50', NULL, '2026-04-29 22:22:53'),
	(11, 'Strahinja', 'Novovic', 'stralekill@gmail.com', '0653134443', '231241254152', NULL, '2026-04-29 22:23:10', NULL, NULL),
	(12, 'Petar', 'Ljubisic', 'peraljuba@gmail.com', '06453214324', '532563263263', NULL, '2026-04-29 22:23:32', NULL, NULL),
	(13, '', '', '', '', '', NULL, '2026-04-29 23:02:54', NULL, '2026-04-29 23:02:56'),
	(14, 'Marko', 'Petrovic', 'marecare@outlook.com', '12512515125', '13251235512125', NULL, '2026-04-30 00:36:21', NULL, NULL);

-- Dumping structure for table pj_ispit.library
DROP TABLE IF EXISTS `library`;
CREATE TABLE IF NOT EXISTS `library` (
  `library_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0,
  `game_slug` varchar(255) NOT NULL,
  `game_name` varchar(255) NOT NULL,
  `bg_img` varchar(255) DEFAULT NULL,
  `user_rating` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`library_id`),
  UNIQUE KEY `uq_customer_id_game_slug` (`customer_id`,`game_slug`) USING BTREE,
  CONSTRAINT `FK_library_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table pj_ispit.library: ~4 rows (approximately)
INSERT INTO `library` (`library_id`, `customer_id`, `game_slug`, `game_name`, `bg_img`, `user_rating`, `status`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 3, 'cyberpunk-2077', 'Cyberpunk 2077', '', NULL, 'want', 'odlicna', '2026-04-29 23:13:07', NULL, '2026-04-29 21:16:02'),
	(5, 4, 'Cyberpunk 2077', '', '', NULL, 'playing', NULL, '2026-04-30 00:14:47', NULL, '2026-04-29 22:21:30'),
	(6, 11, 'cyber-hook', 'Cyber Hook', NULL, NULL, 'want', '', '2026-04-30 00:27:17', NULL, '2026-04-30 00:35:33'),
	(7, 11, 'grand-theft-auto-v', 'Grand Theft Auto V', 'https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg', NULL, 'want', '', '2026-04-30 00:35:23', NULL, '2026-04-30 00:35:31'),
	(8, 12, 'scorn-episode-one', 'Scorn', 'https://media.rawg.io/media/games/f8c/f8cc3b4834259f8a812ce77804bc12ed.jpg', 3, 'playing', 'uzas zivi\n', '2026-04-30 00:35:52', '2026-04-30 00:48:17', NULL),
	(9, 11, 'spongebob-squarepants-battle-for-bikini-bottom-reh', 'SpongeBob SquarePants: Battle for Bikini Bottom — Rehydrated', 'https://media.rawg.io/media/games/793/79307648580a262f6cac402c3007efe0.jpg', NULL, 'want', '', '2026-04-30 00:36:39', NULL, NULL),
	(10, 14, 'elden-ring', 'Elden Ring', 'https://media.rawg.io/media/games/b29/b294fdd866dcdb643e7bab370a552855.jpg', 10, 'played', 'RISEEEE TARNISHED ', '2026-04-30 00:37:56', NULL, NULL),
	(11, 11, 'stray-2', 'Stray', 'https://media.rawg.io/media/games/cd3/cd3c9c7d3e95cb1608fd6250f1b90b7a.jpg', 9, 'played', 'oijiojohohuihuihuih', '2026-04-30 00:41:00', NULL, NULL),
	(12, 12, 'hearts-of-iron-iv', 'Hearts of Iron IV', 'https://media.rawg.io/media/games/2b6/2b6e8f8efaa2499e9a3a09dc76028d44.jpg', 10, 'played', 'kosovo je srbija', '2026-04-30 00:42:36', NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
