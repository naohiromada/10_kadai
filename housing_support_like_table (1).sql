-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2021-07-29 12:58:27
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
-- テーブルの構造 `housing_support_like_table`
--

CREATE TABLE `housing_support_like_table` (
  `id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `housing_support_id` int(12) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `housing_support_like_table`
--

INSERT INTO `housing_support_like_table` (`id`, `user_id`, `housing_support_id`, `created_at`) VALUES
(12, 3, 3, '2021-07-28 10:51:30'),
(13, 4, 4, '2021-07-28 12:11:31'),
(14, 2, 2, '2021-07-28 12:14:18'),
(15, 1, 1, '2021-07-28 12:14:27');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `housing_support_like_table`
--
ALTER TABLE `housing_support_like_table`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `housing_support_like_table`
--
ALTER TABLE `housing_support_like_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
