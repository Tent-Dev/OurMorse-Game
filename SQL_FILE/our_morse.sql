-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 23, 2020 at 12:53 PM
-- Server version: 5.6.37
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `our_morse`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_question`
--

CREATE TABLE IF NOT EXISTS `tbl_question` (
  `question_id` int(11) NOT NULL,
  `question_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_ans` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_encypt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_status` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_reward` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_item` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_question`
--

INSERT INTO `tbl_question` (`question_id`, `question_desc`, `question_ans`, `question_encypt`, `question_status`, `question_reward`, `question_item`) VALUES
(1, '1+1ได้เท่าไหร่', '..---', 'game_test', '', 'ไม่มีโค้ดเพราะนี่เป็นรอบสาธิต อิอิ', 'ขนม2ห่อ'),
(3, 'ชื่อเต็มของ TNI คือ', '-.....-..-....--...-.-......./ /..-....-..-..--./ /---..-./ /-.-.-.....-.---.-..-----.-.--', 'game_9e26adbae8d81a467c85c72b045a3605', '', 'QWERTYUIOP', 'หมอนรองคอ'),
(4, 'รหัสมอร์สเกิดขึ้นในศัตวรรษอะไร', '.-------..', 'game_50d7c2f0be3a23f35255f1934c8432b5', '', '55G0BQSXWD', 'ขนม2ห่อ'),
(6, 'ประเทศไทยมีกี่จังหวัด', '--...--...', 'game_f69bf8126bfae6334077704093b2e078', '', 'F8GG67ASDH', 'ขนม2ห่อ'),
(7, 'เครื่อง Enigma มีต้นกำเนิดมาจากประเทศอะไร', '--...-.--.--.-.--', 'game_2d4dacfc5e348f7cee8fb4d1c9067d27', '', '27GD3WERT', 'แก้วเซรามิก'),
(8, 'ไวรัสอู่ฮั่น มีต้นกำเนิดมาจากประเทศอะไร', '-.-.......-..-', 'game_1d6dff1d772ba2f9c20ba2a0ec537fed', '', '1DGDEGHVBF', 'ขนม2ห่อ'),
(9, 'รหัสมอสได้เข้ามายังประเทศไทย ในรัชกาลที่เท่าไหร่', '.....', 'game_31368cb092d919fecd01c8c21235db14', '', '34G11RFVYG', 'ขนม2ห่อ'),
(10, 'สนามบินนานาชาติที่ใหญ่ที่สุดของไทย มีชื่อว่าอะไร', '.....-...-.-.-.-..--.........---../ /.-...-..--.---.-.-', 'game_f180134ebf9e6d9820111c6aed169a72', '', 'F2G17ZAWRF', 'แก้วเซรามิก'),
(11, 'ใครเป็นผู้ให้กำเนิดภาษาไทย', '-.-..-.--./ /.-..---/ /-.-.....---.....-.-.--./ /-...../ /--..-...--', 'game_b47db495cc469c0091d6e48817283d2b', '', 'BBG42QFGUJ', 'กระติกน้ำ'),
(12, 'น้องจุดตัวกลมๆใน Our MORSE ชื่ออะไร', '-....-', 'game_1d4635dee54c4c35912085db57715974', '', '14GD7OKLII', 'ขนม2ห่อ'),
(13, 'น้องขีดตัวผอมๆใน Our MORSE ชื่ออะไร', '-...-....', 'game_083ba8e7407c37c08b2c3e1d97381fbe', '', '0EG8BYHHUJ', 'ขนม2ห่อ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_Fname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_Lname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_questionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_question`
--
ALTER TABLE `tbl_question`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_questionID` (`user_questionID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_question`
--
ALTER TABLE `tbl_question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `FK_questionID` FOREIGN KEY (`user_questionID`) REFERENCES `tbl_question` (`question_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
