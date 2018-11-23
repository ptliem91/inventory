-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 20, 2018 lúc 09:55 AM
-- Phiên bản máy phục vụ: 10.1.35-MariaDB
-- Phiên bản PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `spring_inventory`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `cid` int(10) UNSIGNED NOT NULL,
  `cname` varchar(45) NOT NULL,
  `phone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`cid`, `cname`, `phone`) VALUES
(1, 'zubayer', '01515634889'),
(2, 'rasel', '01914008411'),
(3, 'uzzol', '01670813134'),
(4, 'sharmin', '01715491885'),
(6, 'bithi', '01864203231'),
(8, 'akram', '01515634889'),
(9, 'liem', '1234');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `odid` int(10) UNSIGNED NOT NULL,
  `oid` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`odid`, `oid`, `pid`, `price`, `qty`) VALUES
(1, 1, 1, 500, 1),
(2, 0, 0, 0, 0),
(3, 2, 2, 700, 10),
(4, 1, 4, 700, 2),
(5, 1, 1, 500, 1),
(6, 1, 1, 500, 2),
(7, 2, 8, 1600, 10),
(8, 3, 1, 500, 10),
(9, 3, 1, 500, 10),
(10, 4, 1, 500, 10),
(11, 5, 9, 300, 10),
(12, 6, 9, 300, 10),
(13, 7, 9, 300, 10),
(14, 7, 8, 1600, 10),
(15, 8, 1, 500, 200),
(16, 9, 1, 500, 1),
(17, 9, 4, 700, 2),
(18, 10, 1, 500, 1),
(19, 11, 1, 500, 2),
(20, 12, 1, 500, 6),
(21, 13, 1, 500, 1),
(22, 13, 1, 500, 11),
(23, 14, 1, 500, 18800),
(24, 14, 1, 500, 9),
(25, 16, 1, 500, 12),
(26, 17, 1, 500, 88),
(27, 18, 1, 500, 0),
(28, 19, 1, 500, 1),
(29, 20, 1, 500, 1),
(30, 21, 1, 500, 2),
(31, 22, 1, 500, 2),
(32, 23, 1, 500, 1),
(33, 24, 1, 500, 1),
(34, 25, 1, 500, 1),
(35, 26, 10, 5500, 1),
(36, 26, 9, 300, 1),
(37, 27, 4, 700, 2),
(38, 27, 1, 500, 1),
(39, 28, 5, 15000, 1),
(40, 28, 1, 500, 1),
(41, 29, 7, 76000, 1),
(42, 29, 1, 500, 4),
(43, 29, 8, 1600, 1),
(44, 30, 1, 500, 5),
(45, 31, 1, 500, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `oid` int(10) UNSIGNED NOT NULL,
  `cid` int(10) UNSIGNED NOT NULL,
  `total` double NOT NULL,
  `orderType` varchar(45) NOT NULL,
  `orderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`oid`, `cid`, `total`, `orderType`, `orderDate`) VALUES
(1, 1, 1000, 'sell', '2017-09-19'),
(2, 6, 166000, 'sell', '2017-09-01'),
(3, 1, 5000, 'sell', '2017-09-21'),
(4, 1, 5000, 'sell', '2017-09-19'),
(5, 2, 3000, 'sell', '2017-09-30'),
(6, 4, 19000, 'sell', '2017-09-20'),
(7, 3, 19000, 'sell', '2017-09-01'),
(8, 1, 100000, 'purchase', '2017-09-27'),
(9, 1, 1900, 'sell', '2017-09-01'),
(10, 1, 500, 'sell', '2017-09-01'),
(11, 1, 1000, 'sell', '2017-09-01'),
(12, 2, 3000, 'sell', '2017-09-19'),
(13, 1, 5500, 'purchase', '2017-09-19'),
(14, 1, 9400000, 'sell', '2017-09-19'),
(15, 1, 4500, 'purchase', '2017-09-19'),
(16, 1, 6000, 'purchase', '2017-09-19'),
(17, 1, 44000, 'purchase', '2017-09-19'),
(18, 0, 0, 'sell', '2017-09-20'),
(19, 0, 500, 'sell', '2017-09-20'),
(20, 1, 500, 'sell', '2017-09-20'),
(21, 1, 1000, 'sell', '2017-09-20'),
(22, 2, 1000, 'sell', '2017-09-20'),
(23, 1, 500, 'sell', '2017-09-20'),
(24, 1, 500, 'sell', '2017-09-20'),
(25, 1, 500, 'sell', '2017-09-20'),
(26, 7, 5800, 'sell', '2017-09-15'),
(27, 1, 1900, 'sell', '2017-09-22'),
(28, 1, 15500, 'sell', '2017-09-24'),
(29, 1, 79600, 'sell', '2017-09-30'),
(30, 2, 6500, 'sell', '2017-10-11'),
(31, 1, 1000, 'sell', '2018-11-19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `pid` int(10) UNSIGNED NOT NULL,
  `pname` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`pid`, `pname`, `price`, `qty`) VALUES
(1, 'shirt', 500, 78),
(4, 'pant', 700, 16),
(5, 'mobile', 15000, 49),
(6, 'sunglass', 4000, 40),
(7, 'laptop', 76000, 79),
(8, 'bag', 1600, 189),
(9, 'mouse', 300, 119),
(10, 'hdd', 5500, 119),
(11, 'printer', 5000, 100),
(12, 'AAA', 123, 123);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `userId` int(10) UNSIGNED NOT NULL,
  `userName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`userId`, `userName`, `email`, `password`) VALUES
(1, 'admin', 'admin@gmail.com', '12345');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cid`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`odid`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oid`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `cid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `odid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `pid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;