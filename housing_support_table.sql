-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2021-07-29 12:57:27
-- サーバのバージョン： 10.4.19-MariaDB
-- PHP のバージョン: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gsacf_d08_13`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `housing_support_table`
--

CREATE TABLE `housing_support_table` (
  `id` int(12) NOT NULL,
  `facility` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Postal_code` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Prefectures` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Addres_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Addres_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Addres_3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tel_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fax_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `housing_support_table`
--

INSERT INTO `housing_support_table` (`id`, `facility`, `Postal_code`, `Prefectures`, `Addres_1`, `Addres_2`, `Addres_3`, `Tel_no`, `Fax_no`, `image`) VALUES
(1, '寄り合いステーション さくら坂', '849-0101', '佐賀県', '三養基郡', 'みやき町大字原古賀', '三本松7471', '0942-94-2071', '0942-94-2072', NULL),
(2, 'ケアハウスみやき', '839-1225', '福岡県', '久留米市', '田主丸町', '菅原１３６８', '090-9300-8589', '0943-73-7708', NULL),
(3, '花のみね弐番館特別養護老人ホーム', '849-0114', '佐賀県', '三養基郡', 'みやき町', '中津隈５９１９', '0942-89-1855', '0942-89-1855', NULL),
(4, '青葉園', '841-0005', '佐賀県', '鳥栖市', '弥生が丘', '二丁目135番地１', '0942-84-0090', '0942-84-009１', NULL),
(5, 'こどもステーションあそび家・上峰', '1830053', '東京都', '府中市天神町', '1-12-1-203', 'エアリーレジデンス２０３', '09093008589', '0943-73-7718', 'upload/20210728104351dd6257a3506887da267b55ac1b285686.jpg');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `housing_support_table`
--
ALTER TABLE `housing_support_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`facility`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `housing_support_table`
--
ALTER TABLE `housing_support_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
