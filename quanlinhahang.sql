-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 10, 2025 lúc 03:31 PM
-- Phiên bản máy phục vụ: 8.4.6
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlinhahang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `table_id` int DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(12,2) NOT NULL,
  `status` enum('pending','in_progress','completed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `table_id`, `order_date`, `total_amount`, `status`) VALUES
(42, 5, 3, '2025-06-07 05:31:44', 1135000.00, 'completed'),
(43, 5, 3, '2025-06-07 16:58:13', 490000.00, 'completed'),
(44, 5, 3, '2025-06-09 00:07:44', 700000.00, 'completed'),
(45, 11, 2, '2025-06-09 00:20:08', 770000.00, 'completed'),
(46, 13, 2, '2025-06-09 15:24:59', 1050000.00, 'completed'),
(47, 5, 1, '2025-06-09 15:34:25', 705000.00, 'completed'),
(48, 5, 2, '2025-06-13 13:31:54', 1200000.00, 'completed'),
(49, 14, 2, '2025-06-15 15:46:28', 430000.00, 'completed'),
(50, 5, 2, '2025-06-15 15:55:58', 320000.00, 'completed'),
(51, 15, 1, '2025-06-17 06:49:20', 90000.00, 'completed'),
(52, 15, 8, '2025-09-28 15:52:45', 1240000.00, 'completed'),
(53, 5, 2, '2025-10-29 22:22:42', 430000.00, 'completed'),
(54, 5, 9, '2025-12-09 06:44:58', 430000.00, 'completed'),
(55, 5, 1, '2025-12-09 13:23:20', 600000.00, 'completed'),
(56, 5, 3, '2025-12-09 14:02:03', 1010000.00, 'completed'),
(57, 5, 8, '2025-12-10 08:24:09', 320000.00, 'pending');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` decimal(12,2) NOT NULL,
  `total` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(78, 42, 1, 1, 400000.00, 400000.00),
(79, 42, 11, 1, 150000.00, 150000.00),
(80, 42, 16, 1, 65000.00, 65000.00),
(81, 42, 24, 1, 200000.00, 200000.00),
(82, 42, 21, 1, 120000.00, 120000.00),
(83, 42, 44, 10, 20000.00, 200000.00),
(84, 43, 1, 1, 400000.00, 400000.00),
(86, 43, 12, 1, 90000.00, 90000.00),
(87, 44, 1, 1, 430000.00, 430000.00),
(88, 44, 11, 2, 150000.00, 150000.00),
(89, 44, 44, 6, 20000.00, 120000.00),
(90, 45, 3, 1, 320000.00, 320000.00),
(91, 45, 10, 1, 80000.00, 80000.00),
(92, 45, 25, 1, 220000.00, 220000.00),
(93, 45, 26, 1, 150000.00, 150000.00),
(94, 46, 53, 1, 450000.00, 450000.00),
(95, 46, 27, 1, 170000.00, 170000.00),
(96, 46, 31, 1, 120000.00, 120000.00),
(97, 46, 36, 1, 160000.00, 160000.00),
(98, 46, 33, 1, 150000.00, 150000.00),
(99, 47, 9, 1, 320000.00, 320000.00),
(100, 47, 19, 1, 75000.00, 75000.00),
(101, 47, 21, 1, 120000.00, 120000.00),
(102, 47, 23, 1, 190000.00, 190000.00),
(103, 48, 2, 1, 400000.00, 400000.00),
(106, 48, 36, 1, 160000.00, 160000.00),
(107, 48, 44, 4, 20000.00, 80000.00),
(108, 49, 1, 1, 430000.00, 430000.00),
(109, 50, 3, 1, 320000.00, 320000.00),
(110, 51, 12, 1, 90000.00, 90000.00),
(111, 52, 1, 2, 430000.00, 860000.00),
(112, 52, 4, 1, 380000.00, 380000.00),
(114, 54, 1, 1, 430000.00, 430000.00),
(115, 55, 18, 3, 70000.00, 70000.00),
(116, 55, 1, 1, 430000.00, 430000.00),
(117, 55, 40, 5, 20000.00, 100000.00),
(118, 56, 15, 1, 70000.00, 70000.00),
(119, 56, 3, 2, 320000.00, 640000.00),
(120, 56, 44, 15, 20000.00, 300000.00),
(121, 57, 3, 1, 320000.00, 320000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `payment_id` int NOT NULL,
  `order_id` int NOT NULL,
  `payment_method` enum('cash','online') NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_method`, `amount`, `payment_date`) VALUES
(11, 42, 'online', 964750.00, '2025-06-07 05:33:39'),
(12, 43, 'cash', 416500.00, '2025-06-07 16:58:50'),
(13, 44, 'online', 722500.00, '2025-06-09 00:09:30'),
(14, 45, 'online', 731500.00, '2025-06-09 00:21:53'),
(15, 46, 'cash', 997500.00, '2025-06-09 15:25:53'),
(16, 47, 'online', 599250.00, '2025-06-09 15:36:01'),
(17, 48, 'online', 544000.00, '2025-06-13 13:35:06'),
(18, 49, 'cash', 408500.00, '2025-06-15 15:47:08'),
(19, 50, 'online', 272000.00, '2025-06-17 06:13:57'),
(20, 51, 'online', 85500.00, '2025-06-17 06:50:50'),
(21, 55, 'cash', 629000.00, '2025-12-09 13:39:35'),
(22, 56, 'online', 858500.00, '2025-12-09 14:03:25'),
(23, 57, 'cash', 272000.00, '2025-12-10 08:25:41'),
(24, 57, 'cash', 272000.00, '2025-12-10 08:29:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `category` varchar(100) DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('available','out_of_stock') DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `category`, `price`, `image`, `status`) VALUES
(1, 'Lẩu 4 ngăn', 'Nồi lẩu với 4 ngăn chứa các loại nước dùng khác nhau, cho phép thưởng thức đa dạng vị cay, thanh, và ngọt trong cùng một bữa ăn.', 'Lẩu', 430000.00, 'http://localhost/webnhahang/FE/assets/img/products/lau-4-ngan.jpg', 'available'),
(2, 'Lẩu 3 ngăn', 'Lẩu 3 ngăn phong cách Trung Hoa, với nước dùng cay, ngọt và thanh, kèm đa dạng nguyên liệu tươi ngon như thịt bò, đậu hũ và rau củ.', 'Lẩu', 400000.00, 'http://localhost/webnhahang/FE/assets/img/products/lau-3-ngan.jpg', 'available'),
(3, 'Lẩu thập cẩm', 'Nồi lẩu thập cẩm nhiều loại nguyên liệu như hải sản, rau củ, nấm và thịt, nước dùng đậm đà thích hợp cho bữa ăn gia đình.', 'Lẩu', 320000.00, './assets/img/products/lau-thap-cam.jpg', 'available'),
(4, 'Lẩu bao tử bò', 'Lẩu đặc trưng với bao tử bò cùng nước dùng cay nồng, dùng kèm nhiều loại rau và gia vị phong phú.', 'Lẩu', 380000.00, './assets/img/products/lau-bao-tu-bo.jpg', 'available'),
(5, 'Lẩu bao ngư', 'Lẩu hải sản cao cấp với bao ngư, mực, tôm và các loại nấm, nước dùng thơm ngon đậm đà.', 'Lẩu', 420000.00, './assets/img/products/lau-bao-ngu.jpg', 'available'),
(6, 'Lẩu bò', 'Lẩu truyền thống với nước dùng đậm đà và thịt bò thái lát mỏng, kèm rau tươi và đồ nhúng phong phú.', 'Lẩu', 300000.00, './assets/img/products/lau-bo.jpg', 'available'),
(7, 'Lẩu cá tầm', 'Lẩu cá tầm thanh ngọt, kết hợp với rau củ tươi và gia vị đặc trưng, tạo nên hương vị độc đáo.', 'Lẩu', 390000.00, './assets/img/products/lau-ca-tam.jpg', 'available'),
(8, 'Lẩu Thái Tom Yum', 'Lẩu Thái chua cay Tom Yum với hương thơm đặc trưng của sả, lá chanh và ớt, vị đậm đà kích thích vị giác.', 'Lẩu', 350000.00, './assets/img/products/lau-thai-tomyum.jpeg', 'available'),
(9, 'Lẩu Thái nấm chay', 'Lẩu Thái chay thanh nhẹ với các loại nấm tươi ngon và nước dùng chua cay đặc trưng.', 'Lẩu', 320000.00, './assets/img/products/lau-thai-nam-chay.png', 'available'),
(10, 'Súp bí ngô sadsad', 'Súp bí ngô mịn màng, thơm ngọt, trang trí dầu giấm balsamic và rau mùi tươi.', 'Súp', 80000.00, 'http://localhost/webnhahang/FE/assets/img/products/sup-bi-ngo.jpg', 'available'),
(11, 'Súp bào ngư hải sâm', 'Súp hải sản thượng hạng với bào ngư, hải sâm và tôm tươi, nước dùng đậm đà.', 'Súp', 150000.00, './assets/img/products/sup-bao-ngu-hai-sam.jpeg', 'available'),
(12, 'Súp hải sản', 'Súp hải sản đa dạng với tôm, mực, nấm kim châm và rau củ tươi ngon.', 'Súp', 90000.00, './assets/img/products/sup-hai-san.jpg', 'available'),
(13, 'Súp su hào', 'Súp su hào dịu nhẹ, kết hợp cùng thịt mềm và cà rốt, mang đến hương vị thanh thanh, bổ dưỡng và dễ ăn.', 'Súp', 80000.00, './assets/img/products/sup-su-hao.jpg', 'available'),
(14, 'Súp củ cải', 'Súp củ cải trắng béo ngậy, điểm xuyến hạt hạch và dầu ô liu thơm lừng.', 'Súp', 85000.00, './assets/img/products/sup-cu-cai.jpg', 'available'),
(15, 'Đậu hũ xào nấm', 'Đậu hũ chiên giòn xào cùng nấm tươi và rau củ, thơm ngon, đậm đà hương vị chay.', 'Món chay', 70000.00, './assets/img/products/chay-dau-hu-xao-nam.png', 'available'),
(16, 'Chả cuốn nấm', 'Cuốn chay với bánh tráng mềm, nhân nấm và rau tươi, ăn kèm nước chấm chua ngọt đặc trưng.', 'Món chay', 65000.00, './assets/img/products/chay-cuon-nam.png', 'available'),
(17, 'Chả chiên quế chay', 'Chả chay giòn bên ngoài, mềm dai bên trong, gia vị quế thơm nhẹ, phục vụ kèm nước mắm chay.', 'Món chay', 60000.00, './assets/img/products/chay-cha-que.png', 'available'),
(18, 'Bún trộn chay', 'Bún trộn thanh đạm với rau củ, đậu hũ chiên, nấm và nước chấm đặc biệt.', 'Món chay', 70000.00, './assets/img/products/chay-bun-tron.png', 'available'),
(19, 'Bún riêu chay', 'Món bún riêu chay với nước dùng chua nhẹ, đậu hũ, cà chua, và rau thơm tươi.', 'Món chay', 75000.00, './assets/img/products/chay-bun-rieu.png', 'available'),
(20, 'Bột chiên chay', 'Bột chiên giòn, ăn kèm trứng, rau thơm và nước sốt cay đặc trưng.', 'Món chay', 65000.00, './assets/img/products/chay-bot-chien.jpg', 'available'),
(21, 'Cá hồi xông khói', 'Cá hồi xông khói tươi ngon, ăn kèm kem phô mai và bánh quy giòn.', 'Hải sản', 120000.00, './assets/img/products/haisan-ca-hoi.jpg', 'available'),
(22, 'Tôm sú luộc rần thịt', 'Tôm sú luộc chín tới, thịt chắc và ngọt, giữ nguyên hương vị biển.', 'Hải sản', 180000.00, './assets/img/products/haisan-tom_su_luot_ran_thit.png', 'available'),
(23, 'Tôm sú rang muối', 'Tôm sú rang muối thơm phức, giòn rụm với lớp muối thấm đều.', 'Hải sản', 190000.00, './assets/img/products/haisan-tom-su-rang-muoi.jpeg', 'available'),
(24, 'Tôm sú rang bơ tỏi', 'Tôm sú rang bơ tỏi thơm lừng, béo ngậy và đậm đà hương vị.', 'Hải sản', 200000.00, './assets/img/products/haisan-tom-su-rang-bo-toi.jpeg', 'available'),
(25, 'Cua luộc', 'Cua luộc tươi ngon, thịt chắc, ăn kèm nước chấm chua cay đậm đà.', 'Hải sản', 220000.00, './assets/img/products/haisan-cua-luoc.jpg', 'available'),
(26, 'Hàu tươi sống', 'Hàu tươi sống được trình bày đẹp mắt, kèm nước mắm chua cay đặc trưng.', 'Hải sản', 150000.00, './assets/img/products/haisan-hau.jpg', 'available'),
(27, 'Tôm chiên giòn', 'Tôm chiên giòn vàng ruộm, thơm ngon, ăn kèm sốt mayonnaise đặc biệt.', 'Hải sản', 170000.00, './assets/img/products/haisan-tom-chien-gion.jpg', 'available'),
(28, 'Salad rau củ quả', 'Salad tươi mát với các loại rau xanh và cà chua bi, hòa quyện cùng nước sốt đặc biệt.', 'Rau', 70000.00, './assets/img/products/rau-salad-ca-chua.jpg', 'available'),
(29, 'Salad xà lách', 'Xà lách tươi giòn ăn kèm nước sốt kem thanh mát, thích hợp cho bữa ăn nhẹ và dinh dưỡng.', 'Rau', 65000.00, './assets/img/products/rau-salad-xa-lach.jpg', 'available'),
(30, 'Salad cà chua', 'Cà chua đỏ mọng kết hợp với rau thơm, tạo nên món salad thanh đạm và dễ ăn.', 'Rau', 60000.00, './assets/img/products/rau-salad-cachua.jpg', 'available'),
(31, 'Salad tôm hùm', 'Salad tươi ngon với tôm hùm kết hợp rau xanh, tạo hương vị đậm đà, sang trọng.', 'Rau', 120000.00, './assets/img/products/rau-salad-tomhum.jpg', 'available'),
(32, 'Rau su hào sợi', 'Su hào bào sợi tươi ngon, trộn cùng nước sốt chua cay đặc trưng, món ăn thanh nhẹ, dễ tiêu.', 'Rau', 70000.00, './assets/img/products/rau-xu-hao-soi.jpg', 'available'),
(33, 'Heo nướng giòn da', 'Thịt heo nướng giòn da, mềm mọng, thơm lừng với gia vị đậm đà.', 'Món nướng', 150000.00, './assets/img/products/nuong-heo-gion-bi.jpg', 'available'),
(34, 'Gà nướng thảo mộc', 'Gà nướng ướp thảo mộc thơm phức, da vàng giòn, thịt mềm ngon.', 'Món nướng', 140000.00, './assets/img/products/nuong-ga.png', 'available'),
(35, 'Thịt cừu nướng', 'Thịt cừu tươi nướng vừa chín tới, giữ nguyên vị ngọt tự nhiên và hương thơm đặc trưng.', 'Món nướng', 180000.00, './assets/img/products/nuong-thit-cuu.jpg', 'available'),
(36, 'Sườn heo nướng mật ong', 'Sườn heo nướng mềm, thấm vị mật ong ngọt dịu, kết hợp nước sốt đặc biệt.', 'Món nướng', 160000.00, './assets/img/products/nuong-suon-heo.jpg', 'available'),
(37, 'Xúc xích nướng', 'Xúc xích nướng vàng ươm, thơm ngon, ăn kèm bánh mì hoặc rau sống.', 'Món nướng', 90000.00, './assets/img/products/nuong-xuc-xich.jpg', 'available'),
(38, 'Thịt nướng rau củ', 'Thịt nướng kết hợp cùng rau củ tươi ngon, thơm lừng và đầy màu sắc.', 'Món nướng', 140000.00, './assets/img/products/nuong-thit-rau-cu.jpg', 'available'),
(39, 'Sườn cừu nướng BBQ', 'Sườn cừu nướng BBQ cay nhẹ, thấm đẫm gia vị, mềm và đậm đà hương vị.', 'Món nướng', 190000.00, './assets/img/products/nuong-suon-cuu.jpg', 'available'),
(40, 'Pepsi lon', 'Nước ngọt Pepsi lon lạnh sảng khoái, giải khát nhanh chóng.', 'Nước uống', 20000.00, './assets/img/products/nuocuong-pepsi.jpg', 'available'),
(41, 'Trà đào chanh sả', 'Trà đào thanh mát kết hợp chanh và sả thơm dịu, giải nhiệt ngày hè.', 'Nước uống', 35000.00, './assets/img/products/nuocuong-tra-dao-chanh-sa.jpg', 'available'),
(42, 'Soda chanh', 'Soda chanh sủi tăm thơm mát, tươi ngon, kích thích vị giác.', 'Nước uống', 30000.00, './assets/img/products/nuonguong-soda-chanh.jpg', 'available'),
(43, 'Trà chanh', 'Trà chanh truyền thống đậm đà, thơm nồng hương chanh tươi.', 'Nước uống', 25000.00, './assets/img/products/nuonguong-tra-chanh.jpg', 'available'),
(44, 'Coca Cola lon', 'Nước ngọt Coca Cola lon đặc trưng, vị ngọt đậm đà, kích thích vị giác.', 'Nước uống', 20000.00, './assets/img/products/nuocuong-coca.jpg', 'available'),
(53, 'Combo 1', 'Món gồm các món: 1 lẩu tứ xuyên, 1 phần trứng ốp la, 1 bánh hỏi , 1 cơm rang hải sản.', 'Lẩu', 450000.00, 'http://localhost/webnhahang/FE/assets/img/products/contact.jpg', 'available');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ranks`
--

CREATE TABLE `ranks` (
  `rank_id` int NOT NULL,
  `rank_name` varchar(50) NOT NULL,
  `discount` decimal(5,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ranks`
--

INSERT INTO `ranks` (`rank_id`, `rank_name`, `discount`) VALUES
(1, 'Đồng', 5.00),
(2, 'Bạc', 10.00),
(3, 'Vàng', 15.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff_accounts`
--

CREATE TABLE `staff_accounts` (
  `staff_id` int NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `salary` decimal(12,2) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `staff_accounts`
--

INSERT INTO `staff_accounts` (`staff_id`, `phone`, `password`, `fullname`, `position`, `salary`, `status`) VALUES
(1, '0868698389', '$2y$10$Bfky3w6R30WN2ifkhUVpB.Pt2JmAnNFiMH.b3ltceKn17wnjS8EwK', 'Bùi Văn Huy', 'admin', 8000000.00, 'active'),
(7, '0396048599', '$2y$10$3t1MxnQmfhVOA3mUy1bY5.qf2y7.N3ASx5naM31yqGC2aOxWnsIB2', 'Hoàng Mai Kiều', 'Nhân viên', NULL, 'active'),
(8, '0123456789', '$2y$10$g59vxQb0VJsWqUL0M/Hj/eOeALWG6LLZ2OUJ34iNaQRbI07IRM7xW', 'Lê Thị Tuyết Băng ', 'Nhân viên', NULL, 'active'),
(10, '1234567890', '$2y$10$HFSrtJcIW7nYPA67vLh2z./v0DQqeOOiqRF80CGenGQRCJ47rrsAy', 'Lê Trọng Kiên', 'Nhân viên', NULL, 'active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tables`
--

CREATE TABLE `tables` (
  `table_id` int NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `status` enum('available','occupied','reserved') DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tables`
--

INSERT INTO `tables` (`table_id`, `table_name`, `status`) VALUES
(1, 'Bàn 1', 'available'),
(2, 'Bàn 2', 'available'),
(3, 'Bàn 3', 'available'),
(4, 'Bàn 4', 'available'),
(5, 'Bàn 5', 'available'),
(6, 'Bàn 6', 'available'),
(7, 'Bàn 7', 'available'),
(8, 'Bàn 8', 'occupied'),
(9, 'Bàn 9', 'available'),
(10, 'Bàn 10', 'available'),
(11, 'Bàn 11', 'available'),
(12, 'Bàn 12', 'available'),
(13, 'Bàn 13', 'available'),
(14, 'Bàn 14', 'available'),
(15, 'Bàn 15', 'available');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `rank_id` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `lastname`, `firstname`, `phone`, `rank_id`, `created_at`) VALUES
(5, 'Bùi Văn ', 'Huy', '0868698389', 3, '2025-05-16 08:04:17'),
(11, 'Lê Thị Tuyết ', 'Băng ', '0987654321', 1, '2025-05-24 14:26:21'),
(12, 'Lê Thị Tuyết ', 'Băng', '1472589021', 1, '2025-06-09 00:04:47'),
(13, 'Võ Thanh ', 'Trúc', '0979025109', 1, '2025-06-09 15:22:55'),
(14, 'Bùi Văn ', 'Kiên', '1234567890', 1, '2025-06-15 15:45:50'),
(15, 'Lê Trọng ', 'Kiên', '0843335539', 1, '2025-06-17 06:48:49');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `table_id` (`table_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`rank_id`);

--
-- Chỉ mục cho bảng `staff_accounts`
--
ALTER TABLE `staff_accounts`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Chỉ mục cho bảng `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`table_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `rank_id` (`rank_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `ranks`
--
ALTER TABLE `ranks`
  MODIFY `rank_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `staff_accounts`
--
ALTER TABLE `staff_accounts`
  MODIFY `staff_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `tables`
--
ALTER TABLE `tables`
  MODIFY `table_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`table_id`) REFERENCES `tables` (`table_id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`rank_id`) REFERENCES `ranks` (`rank_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
