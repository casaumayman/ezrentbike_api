-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 21, 2019 lúc 06:15 PM
-- Phiên bản máy phục vụ: 8.0.13-4
-- Phiên bản PHP: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `gVL9kMwMNK`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  `token` longtext COLLATE utf8_unicode_ci,
  `profileId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `role`, `token`, `profileId`) VALUES
('677a8d7c-e901-4e1b-ae94-8832fdf5a2b9', 'casaumayman', '123', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiSHV5IFR14bqlbiBBZG1pbiIsInVzZXJuYW1lIjoiY2FzYXVtYXltYW4iLCJyb2xlIjoxLCJwaG9uZU51bWJlciI6IjA5MzgwMjkwNDAiLCJlbWFpbCI6ImNhc2F1bWF5bWFuMUBnbWFpbC5jb20iLCJhdmF0YXIiOiIxNTYxMDI0Nzk3MzYzLmpwZyIsImFkZHJlc3MiOiI0QS8yLzEwIMSRxrDhu51uZyBEMSwgUDI1LCBRdeG6rW4gQsOsbmggVGjhuqFuaCwgSOG7kyBDaMOtIE1pbmgiLCJjYXJkTGVuZ3RoIjoyLCJpYXQiOjE1NjExNDA3MTJ9.vW84DK9UVQkaFaCFDxAKPvQjZBl-uUZ065htMKs6g_4', 1),
('e8c79c57-2811-4a1c-815f-2d4e69d79063', 'casaumayman1', '123', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiY2FzYXVtYXltYW4ga2FrYSIsInVzZXJuYW1lIjoiY2FzYXVtYXltYW4xIiwicm9sZSI6MCwicGhvbmVOdW1iZXIiOiI0MjU0MTI1NDEyIiwiZW1haWwiOiJjYXNhdW1heW1hbjFAZ21haWwuY29tIiwiYXZhdGFyIjoiMTU2MDM4OTY1NTgwMy5wbmciLCJhZGRyZXNzIjoiNEEvMi8xMCDEkcaw4budbmcgRDEsIFAyNSIsImNhcmRMZW5ndGgiOjAsImlhdCI6MTU2MTExNDA0NX0.DZ9su1aiwmATKuH3PNPBZt0xyCll_n9Qn1TY1VyvsPU', 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Xe số'),
(2, 'Xe tay ga');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `type` bit(1) NOT NULL,
  `isPercent` tinyint(4) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `accountId` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id`, `content`, `accountId`) VALUES
('ce5b227f-201b-4f2a-b4b5-2f6788f63928', '', '677a8d7c-e901-4e1b-ae94-8832fdf5a2b9'),
('d6ef0504-51ff-4a4d-bc9c-f5464d3bbd40', '\'-- -', '677a8d7c-e901-4e1b-ae94-8832fdf5a2b9'),
('d754255c-794b-4af7-a9bc-d122558bc786', 'Nhân viên thái độ lòi lõm với khách hàng!', '677a8d7c-e901-4e1b-ae94-8832fdf5a2b9');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lease`
--

CREATE TABLE `lease` (
  `id` int(11) NOT NULL,
  `startTime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `endTime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `accountId` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lease`
--

INSERT INTO `lease` (`id`, `startTime`, `endTime`, `productId`, `accountId`) VALUES
(7, '1561029149000', '1561222800000', 22, '677a8d7c-e901-4e1b-ae94-8832fdf5a2b9'),
(8, '1562086800000', '1562864400000', 22, '677a8d7c-e901-4e1b-ae94-8832fdf5a2b9'),
(9, '1561136400000', '1561136400000', 24, '677a8d7c-e901-4e1b-ae94-8832fdf5a2b9');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `producer`
--

CREATE TABLE `producer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `producer`
--

INSERT INTO `producer` (`id`, `name`) VALUES
(1, 'Honda'),
(2, 'Yamaha'),
(3, 'Piaggio'),
(4, 'SYM'),
(5, 'Kymco');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `cost` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `producerId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `cost`, `image`, `producerId`, `categoryId`) VALUES
(3, 'Click 125i 2019', 'Mẫu xe tay ga giá dưới 70 triệu Click thái 125 mang kiểu dáng thể thao, nam tính mạnh mẽ, nhưng vẫn nhỏ gọn để chạy trên đường phố đông đúc, kiểu dáng tổng thể cơ bản sẽ có phần đầu thấp, dàn đuôi cao rất thể thao. Dùng động cơ xylanh đơn 125 phân khối, công nghệ eSP, phun xăng điện tử Fi đã được tối ưu lại giúp xe vận hành mạnh mẽ hơn.', 1000000, '1560618790926.jpg', 1, 2),
(4, 'Honda PCX 2019', 'Honda PCX 2019 là mẫu xe “toàn cầu” khi mang thiết kế phù hợp với cả vóc dáng cao lớn của người châu Âu và vóc dáng nhỏ nhắn của người châu Á với tư thế ngồi lái thoải mái, nhanh chóng chiếm được cảm tình của những khách hàng ưa thích kiểu dáng sang trọng nhưng vẫn gần gũi và tiện ích. Hiện giá xe PCX 2019 tại Việt Nam đã có giá bán chính thức cho 2 phiên bản 125 và 150 phân khối, với giá bán lần lượt là 56,5 và 70,5 triệu đồng. Đặc biệt cả 2 phiên bản tại Việt Nam chỉ được trang bị hệ thống phanh CBS và không có phanh dĩa sau như 2 thị trường còn lại..', 2000000, '1560618961917.jpg', 1, 2),
(5, 'Honda Lead 2019 Smartkey', 'Mẫu xe tay ga dưới 40 triệu Honda LEAD có thiết kế mới hiện đại dựa trên hình ảnh về sự di chuyển hàng ngày quen thuộc của người dân thành thị mang phong cách thật mới mẻ, năng động giúp người sử dụng trải nghiệm thật khác biệt so với bất cứ dòng xe tay ga nào khác trong cùng phân khúc.', 700000, '1560619229844.jpg', 1, 2),
(6, 'Yamaha Janus 125', 'Yamaha Janus 2019 là mẫu xe tay ga mới 2019 với thiết kế hoàn toàn mới trông không giống bất kì mẫu xe nào trong gia đình xe tay ga của hãng xe Nhật. Là một mẫu xe máy giá rẻ xe tay ga dành cho nam, nữ trẻ tuổi là chủ yếu. Janus 2019 sở hữu những đường nét thiết kế mềm mại, sử dụng nhiều công nghệ hiện đại giúp mẫu xe này phù hợp với phong cách trẻ trung năng động. sở hữu khối động cơ Blue Core, 4 thì, cam đơn SOHC, dung tích 125 phân khối đi kèm công nghệ phun xăng điện tử. Cùng với hệ thống truyền động CVT, xe có khả năng sản sinh công suất tối đa 9,5 mã lực tại 8.000 vòng/phút, mô-men xoắn cực đại 9,6 Nm tại 5.500 vòng/phút.', 700000, '1560619302334.jpg', 2, 2),
(7, 'Vespa Sei Giorni', 'Xe tay ga Vespa Sei Giorni vừa được hãng Piaggio giới thiệu tới mọi người đã thu hút được rất nhiều sự quan tâm thích thú với mẫu xe này. Vespa Sei Giorni 2019 là phiên bản đặc biệt được sản xuất với số lượng giới hạn chỉ 300 chiếc với thiết kế kết hợp tinh tế giữa công nghệ, phong cách một chiếc xe touring điển hình mang phong cách đặc trưng của hãng xe đến từ Ý đã đi vào biểu tượng với thân xe sử dụng khung thép liền khối nhưng lại sử dụng nền tảng công nghệ trên mẫu xe GTS 300.', 500000, '1560619346255.jpg', 3, 2),
(8, 'Kymco AK 550', 'Mẫu xe Maxi – Scooter Kymco AK 550 xứng đáng là mẫu xe tay ga mới 2019 đáng mua nhất với thiết kế hiện đại mang hơi thở tương lai cùng khối động cơ 550cc mang tới sự tiện lợi trong quá trình sử dụng hàng ngày cũng như sự mạnh mẽ, thoải mái trong các hành trình dài với các công nghệ tiện ích như hệ thống đèn lái trước sau Full LED, hệ thống đồng hồ LCD tích hợp công nghệ Noodoe.', 1000000, '1560619428640.jpg', 5, 2),
(9, 'SYM Abela 110', 'Vào cuối tháng 5 vừa qua, mẫu xe tay ga mới ra mắt 2019 Abela 110 đã được hãng SYM giới thiệu ra mắt lần đầu tiên tại Việt Nam với khối động cơ 110 EFI mạnh mẽ, mẫu xe Scooter dành riêng cho các cô gái văn phòng với thiết kế năng động, trẻ trung, tập trung vào tính tiện dụng hứa hẹn sẽ thu hút được sự quan tâm tại thị trường Việt Nam.', 200000, '1560619472956.jpg', 4, 2),
(10, 'SYM Fancy 125', 'Fancy 125 ABS được định hướng cho giới nữ văn phòng, công sở hiện đại khi ra mắt đã phá vỡ kỉ lục về giá bán thấp nhất cho một mẫu xe tay ga có trang bị hệ thống phanh ABS. Giá xe Fancy 125 đề xuất lần lượt là 35.900.000 và 38.900.000 triệu đồng ( Giá đã bao gồm VAT, Chưa tính các khoản phí khác) với 2 phiên bản là tiêu chuẩn (Đỏ) và phanh ABS 2kênh ( Đen).', 200000, '1560619521535.jpg', 1, 2),
(11, 'Yamaha Sirius 2019', 'Mẫu xe số phổ thông Yamaha Sirius không chỉ bán chạy nhất phân khúc mà còn trở thành dòng xe ăn khách nhất thị trường Top 7 xe số bán chạy nhất nữa đầu năm 2019. Với 2 lựa chọn động cơ, Sirius 2019 có tất cả 6 phiên bản sử dụng phanh tang trống hoặc phanh đĩa. Trong số các phiên bản, Sirius với động cơ chế hòa khí bán tốt hơn bản với động cơ phun xăng điện tử. Đỉnh điểm vào tháng 1/2017 lượng xe bán ra vượt trên 40.000 chiếc, từ tháng 2 đến tháng 5/2017 lượng xe bán ra tuy không cao bằng nhưng vẫn không ngừng tăng mạnh, luôn đạt trên 30.000 xe/tháng. Bước qua tháng 6 lượng xe bán chỉ vào khoảng 28.000 chiếc,có phần giảm nhẹ nhưng vẫn đủ để Yamaha Sirius 2019 chiếm vị trí xe số bán chạy nhất đầu bảng về doanh số bán hàng tại thị trường Việt Nam.', 700000, '1560619701620.jpg', 2, 1),
(12, 'Honda Wave Alpha 2019', 'Wave Alpha được coi là chiếc xe số bán chạy nhất hút khách được cho nhờ vào mức giá rẻ và khả năng vận hành bền bỉ, tiết kiệm nhiên liệu. Bước sang năm 2017, doanh số của Wave Alpha 2019 là 160.909 xe có phần giảm mạnh do việc người tiêu dùng đã quen với mẫu xe Wave Alpha cũ, việc thay đổi thiết kế của mẫu xe này khiến người tiêu dùng cảm thấy không quen. Thực tế mẫu xe Wave Alpha 2019 được bán tại các đại lý có giá luôn thấp hơn 500 ngàn đồng so với mẫu xe cũ 100cc.', 100000, '1560619749154.jpg', 1, 1),
(13, 'Yamaha Exciter 150', 'Mẫu xe số bán chạy nhất Exciter 150 hiện không có đối thủ trong phân khúc xe côn tay cỡ nhỏ tại thị trường Việt Nam. Thiết kế thể thao và khả năng vận hành mạnh mẽ là những điểm thu hút người dùng với dòng xe này. Với lịch sử có mặt trên thị trường hơn 10 năm, doanh số cộng dồn của Exciter tại thị trường Việt Nam đạt hơn 1 triệu xe. Yamaha Exciter 150 thu hút khách hàng trẻ Việt nhờ khả năng tăng tốc, xử lý linh hoạt trong thành phố và kiểu dáng thể thao, phong cách xe phân khối lớn. Xe trang bị động cơ 150 phân khối, một xi-lanh, SOHC, làm mát bằng dung dịch, phun xăng điện tử. Tỷ số nén 10.4:1. Xe sản sinh công suất 15,4 mã lực ở vòng tua máy 8.500 vòng/phút, mô-men xoắn cực đại 13,8 Nm tại 7.000 vòng/phút.', 1000000, '1560619786871.jpg', 2, 1),
(14, 'Honda Blade 2019', 'Honda Blade 110, mẫu xe số bán chạy nhất 2019 được phát triển dành riêng cho thị trường Việt Nam và có nhiệm vụ thay thế cho đàn anh Wave 110 trước đây. Honda Blade 110 là mẫu xe dành cho các bạn sinh viên hay những người có thu nhập trung bình, nổi bật với kiểu dáng thiết kế thon gọn, hợp thời trang và chắc chắn. Chiếc xe này có sự kết hợp hài hòa giữa đầu xe, thân xe và đuôi xe. Trong khi đầu xe với cụm đèn chiếu sáng và đèn xi nhan liền khối tạo sự gọn gàng thì đuôi xe lại mạnh mẽ, cá tính.', 100000, '1560619821718.jpg', 1, 1),
(15, 'Honda Wave RSX 2019', 'Mẫu xe số Wave RSX 2019 vẫn đứng vững trong Top 7 xe số bán chạy nhất nửa đầu năm 2019 với động cơ phun xăng điện tử, kiểu dáng khỏe khoắn, thể thao khá thu hút người dùng nam giới. Doanh số cộng dồn nửa đầu 2017 của dòng xe này đạt gần 90.000 chiếc giảm 28% so với cùng kỳ năm trước, trong đó tháng 1 có doanh số tốt nhất với gần 20.000 xe bán ra. Trung bình hàng tháng khoảng gần 15.000 chiếc Wave RSX đến tay khách hàng Việt. Tính riêng tháng 6/2017, doanh số bán ra của mẫu xe RSX 2019 khoảng hơn 17.000 xe, giảm 13% so với tháng cùng kỳ năm trước.', 500000, '1560619897283.jpg', 1, 1),
(16, 'Honda Future 125', 'Mẫu xe số bán chạy nhất, Honda Future 125 Fi  được thiết kế với mục đích là tạo ra một chiếc xe có phong cách thể thao chất lừ. Future 125 Fi có được thiết kế mạnh mẽ, thể thao vượt trội, toát lên sự thanh thoát, mạnh mẽ và rất thể thao, mà ít có chiếc xe số nào trên thị trường có được. Mặt trước của xe vẫn là kiểu thiết kế theo hình chữ V và được tích hợp 2 đèn xi-nhan kích thước lớn. Phía trên là đèn pha đôi có cường độ ánh sáng mạnh và khả năng chiếu sáng xa. Logo trên thân xe được hoàn thiện theo kiểu 3D dạng hình khối đầy nổi bật. Kèm theo đó là bộ tem xe được làm mới với những gam màu mạnh mẽ và liền lạc với màu sắc chung của chiếc xe.', 100000, '1560619934629.jpg', 1, 1),
(17, 'Honda Winner 150', 'Winner 150 được ra mắt từ giữa tháng 04/2016, giá xe Winner 150 đề xuất cho phiên bản tiêu chuẩn là 45.500.000 đồng và bản cao cấp là 46.000.000 đồng. Winner 150 được thiết kế phong cách thể thao, nam tính góc cạnh, nhìn thoáng qua có thể thấy xe có những nét tương đồng với Honda Wave RSX. Việc sở hữu phanh trước và sau với kích thước lớn 245mm /200mm giúp tăng khả năng an toàn. Thiết kế phuộc sau monosock mang lại cảm giác êm ái, thể thao hơn khi vận hành.', 700000, '1560619994892.jpg', 1, 1),
(22, 'Honda Vario 150 2018', 'Mẫu xe tay ga Vario 150 mới với 4 màu tùy chọn Đen nhám (Exclusive Matte Black), Đỏ nhám (Exclusive Matte Red), Bạc nhám ( Exclusive Matte Silver), Trắng (Exclusive White) ở thời điểm hiện tại vẫn đang là mẫu xe có sức hút và gây chú ý nhất trong phân khúc xe tay ga tầm trung tại Việt Nam hướng đến khách hàng tiềm năng là mọi đối tượng khách hàng từ thanh niên trẻ tuổi đến người trung niên và cũng không phân biệt giới tính.', 1000000, '1560712556124.jpg', 1, 2),
(24, 'Honda SH mode 2019', 'SH mode 2019 thiết kế với màu mới cuốn hút, SH Mode có thiết kế mềm mại trên toàn bộ thân xe, phần đầu xe sắc nét với mặt nạ thiết kế hình chữ V cùng điểm nhấn logo hình thoi đặt giữa.Honda  SH mode 125 sở hữu những tiện ích như cốp đựng đồ 18 lít bên dưới yên xe, hệ thống xác định vị trí xe, ổ khóa đa chức năng… Phiên bản SH mode 125 cá tính với hai màu đỏ đậm và bạc mờ sẽ được bán cùng giá bán 50,5 triệu đồng.', 1000000, '1560713478640.jpg', 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_events_event`
--

CREATE TABLE `product_events_event` (
  `productId` int(11) NOT NULL,
  `eventId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `profile`
--

INSERT INTO `profile` (`id`, `name`, `email`, `phoneNumber`, `address`, `avatar`) VALUES
(1, 'Huy Tuấn Admin', 'casaumayman1@gmail.com', '0938029040', '4A/2/10 đường D1, P25, Quận Bình Thạnh, Hồ Chí Minh', '1561024797363.jpg'),
(17, 'casaumayman kaka', 'casaumayman1@gmail.com', '4254125412', '4A/2/10 đường D1, P25', '1560389655803.png');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `REL_ff102ecfd2f4b5a7edf239dd02` (`profileId`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_41ba949b387b1817e4e8f41dc53` (`accountId`);

--
-- Chỉ mục cho bảng `lease`
--
ALTER TABLE `lease`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_7b74e66feb1485ecf4a296481f1` (`productId`),
  ADD KEY `FK_1edd27c2b457bc605ddf3d6b60a` (`accountId`);

--
-- Chỉ mục cho bảng `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_aedbaa2962ffeb408fe497829dd` (`producerId`),
  ADD KEY `FK_ff0c0301a95e517153df97f6812` (`categoryId`);

--
-- Chỉ mục cho bảng `product_events_event`
--
ALTER TABLE `product_events_event`
  ADD PRIMARY KEY (`productId`,`eventId`),
  ADD KEY `IDX_22fc99d104836c1d11ad8a4a1d` (`productId`),
  ADD KEY `IDX_c359829ff704924892d8fa68b6` (`eventId`);

--
-- Chỉ mục cho bảng `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lease`
--
ALTER TABLE `lease`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `producer`
--
ALTER TABLE `producer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `FK_ff102ecfd2f4b5a7edf239dd025` FOREIGN KEY (`profileId`) REFERENCES `profile` (`id`);

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FK_41ba949b387b1817e4e8f41dc53` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `lease`
--
ALTER TABLE `lease`
  ADD CONSTRAINT `FK_1edd27c2b457bc605ddf3d6b60a` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `FK_7b74e66feb1485ecf4a296481f1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_aedbaa2962ffeb408fe497829dd` FOREIGN KEY (`producerId`) REFERENCES `producer` (`id`),
  ADD CONSTRAINT `FK_ff0c0301a95e517153df97f6812` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `product_events_event`
--
ALTER TABLE `product_events_event`
  ADD CONSTRAINT `FK_22fc99d104836c1d11ad8a4a1db` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_c359829ff704924892d8fa68b66` FOREIGN KEY (`eventId`) REFERENCES `event` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
