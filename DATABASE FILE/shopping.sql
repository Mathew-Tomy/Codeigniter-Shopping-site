-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2021 at 11:49 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_description` text NOT NULL,
  `publication_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `brand_name`, `brand_description`, `publication_status`) VALUES
(1, 'Symphony', 'Symphony Desc', 1),
(2, 'Samsung', 'Samsung desc', 1),
(3, 'IPhone', 'IPhone Desc<br>', 1),
(4, 'H&M', 'H&amp;M Desc', 1),
(5, 'Adidas', 'Adidas Desc', 1),
(6, 'Razer', 'Razer Desc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_description` text NOT NULL,
  `publication_status` tinyint(4) NOT NULL COMMENT 'Published=1,Unpublished=0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `category_name`, `category_description`, `publication_status`) VALUES
(1, 'Computer', 'Computer Desc', 1),
(2, 'Laptop', 'Laptop Desc', 1),
(3, 'Smartphone', 'Smartphone Desc', 1),
(4, 'Smart TV', 'SmartTV Desc', 1),
(5, 'Clothing', 'Clothing Desc  ', 1),
(6, 'Shoes & Sneakers', 'Shoes &amp; Sneakers Desc', 1),
(7, 'Accessories', 'Accessories Desc.', 1),
(8, 'Glass', 'Google Glass', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_password` varchar(32) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_city` varchar(50) NOT NULL,
  `customer_zipcode` varchar(20) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_country` varchar(100) NOT NULL,
  `customer_active` tinyint(4) NOT NULL COMMENT 'Active=1,Unactive=0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `customer_name`, `customer_email`, `customer_password`, `customer_address`, `customer_city`, `customer_zipcode`, `customer_phone`, `customer_country`, `customer_active`) VALUES
(11, 'demo', 'demo@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'nn', 'f', '686543', '8075754554', 'USA', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_total` float NOT NULL,
  `actions` varchar(50) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `payment_id`, `order_total`, `actions`) VALUES
(15, 11, 15, 21, 33982.5, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` float NOT NULL,
  `product_sales_quantity` int(11) NOT NULL,
  `product_image` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_sales_quantity`, `product_image`) VALUES
(12, 15, 8, 'Galaxy Buds Pro', 29550, 1, 'jbl_ear.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` int(11) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `actions` varchar(50) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `payment_type`, `actions`) VALUES
(21, 'cashon', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_short_description` text NOT NULL,
  `product_long_description` text NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_feature` tinyint(4) NOT NULL,
  `product_category` int(11) NOT NULL,
  `product_brand` int(11) NOT NULL,
  `product_author` int(11) NOT NULL,
  `product_view` int(11) NOT NULL DEFAULT 0,
  `published_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `publication_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_title`, `product_short_description`, `product_long_description`, `product_image`, `product_price`, `product_quantity`, `product_feature`, `product_category`, `product_brand`, `product_author`, `product_view`, `published_date`, `publication_status`) VALUES
(11, 'Ultraboost DNA Black Python Shoes', '                                    Responsive shoes snakeskin acc.                                ', '                                    Black pythons are sleek, cool and a little bit dangerous. Channel the exotic beauty of the Australian snake and make it yours in these adidas Ultraboost DNA Black Python Shoes. The stretchy knit upper features snakeskin-inspired details. Energy-returning cushioning keeps you comfortable when you\'re on the move.                                ', 'OIP_(2).jpg', 19500, 50, 1, 6, 5, 1, 0, '2017-11-30 19:24:41', 1),
(12, 'Face Covers 3-Pack', '                                    Two 3-packs for $30 with code MASKUP. Size M/L is recommended for most adults. This product is not eligible for returns or exchanges.                                ', '                                    Made with soft, breathable fabric the adidas Face Cover is comfortable, washable and reusable for practicing healthy habits every day. This cover is not a medically-graded mask nor personal protective equipment.                                ', 'OIP_(1).jpg', 1250, 50, 1, 5, 5, 1, 0, '2017-11-30 19:29:04', 1),
(13, 'Slim Fit Linen Blazer', '                                    Single-breasted blazer in woven linen fabric. Narrow, notched lapels with decorative buttonhole. Chest pocket, front pockets with flap, and two inner pockets.                                ', '                                    Single-breasted blazer in woven linen fabric. Narrow, notched lapels with decorative buttonhole. Chest pocket, front pockets with flap, and two inner pockets. Two buttons at front, decorative buttons at cuffs, and vent at back. Lined. Slim Fit – tapered at chest and waist with slightly narrower sleeves for a tailored silhouette.\r\n\r\n                                ', 'OIP.jpg', 12500, 35, 1, 5, 4, 1, 0, '2017-11-30 19:38:25', 1),
(14, 'AUE60 ', '                                    4K UHD TV goes beyond regular FHD with 4x more pixels, offering your eyes the sharp and crisp images they deserve. Now you can see even the small details in the scene.                                ', '                                    A sleek and elegant design that draws you to the purest picture. Crafted with an effortless minimalistic style from every angle and a boundless design that sets new standards. Keep your cables tidy and conceal them, reducing clutter and keeping a seamless look for your TV. Choose your favorite voice assistant; Bixby, Amazon Alexa or Google Assistant. For the first time, all are built into your Samsung TV to provide the optimal entertainment experience and advanced control in your connected home.\r\n\r\n                                ', 'maxresdefault.jpg', 695000, 150, 1, 4, 2, 1, 0, '2017-11-30 19:38:57', 1),
(15, 'Razer 15.6', '                                    Designed for gaming, the Razer 15.6\" Blade 15 Gaming Laptop combines mobility with performance. Graphics are handled by the dedicated NVIDIA GeForce GTX 1660 Ti graphics card with VRAM.                                     ', '                                    Designed for gaming, the Razer 15.6\" Blade 15 Gaming Laptop combines mobility with performance. Graphics are handled by the dedicated NVIDIA GeForce GTX 1660 Ti graphics card with VRAM. It also features a 10th Gen 2.6 GHz Intel Core i7-10750H six-core processor and 16GB of 2933 MHz of DDR4 RAM. Its 256GB NVME PCIe M.2 SSD allows for fast boot times. For online multiplayer features, the Razer Blade 15 can utilize Wi-Fi 6 (802.11ax) or a wired Gigabit Ethernet connection. It also supports wireless accessories via Bluetooth 5.1 technology. The Razer Blade 15 features a precision-crafted aluminum chassis.\r\n\r\nThe 15.6\" display features a FHD 1920 x 1080 resolution and are individually factory calibrated, providing 100% of the sRGB color space. The bezels are thin, measuring in at about 4.9mm. The screen also has a matte finish to reduce glare in brightly-lit environments. The keyboard is backlit and supports Razer Chroma single-zone RGB lighting. Other features included Thunderbolt 3, USB Type-C, USB Type-A, and a 3.5mm audio jack. Windows 10 Home is the installed operating system.                                ', 'razer_rz09_02887e91_r3u1_15_6_blade_15_gaming_1485498.jpg', 230000, 56, 1, 1, 6, 1, 0, '2017-11-30 19:40:34', 1),
(16, 'adidas H08837 Face Covers, Size M/L - 3 Pack for sale online | eBay', '<ul style=\"margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box; list-style: none; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; background-color: rgb(255, 255, 255);\"><li class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; list-style-type: none; vertical-align: top; width: 1186px;\">Face Masks</li></ul>', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">Adult Unisex</span>', 's-l640.jpg', 350, 3, 0, 5, 1, 1, 0, '2021-07-23 18:58:49', 1),
(17, 'Puma Cap', '<font face=\"Arial, Verdana\"><span style=\"font-size: 13.3333px;\">Puma Cap</span></font>', '<font face=\"Arial, Verdana\"><span style=\"font-size: 13.3333px;\">Puma Cap</span></font>', 'OIP_(3).jpg', 1000, 3, 0, 5, 1, 1, 0, '2021-07-23 19:05:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_name` varchar(50) NOT NULL,
  `shipping_email` varchar(100) NOT NULL,
  `shipping_address` text NOT NULL,
  `shipping_city` varchar(100) NOT NULL,
  `shipping_country` varchar(50) NOT NULL,
  `shipping_phone` varchar(20) NOT NULL,
  `shipping_zipcode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `customer_id`, `shipping_name`, `shipping_email`, `shipping_address`, `shipping_city`, `shipping_country`, `shipping_phone`, `shipping_zipcode`) VALUES
(11, 0, 'Christine', 'christinem@gmail.com', '245 Ralph Street', 'Steyr', 'Austria', '7456320000', '12500'),
(12, 0, 'Bob', 'bob@gmail.com', '3556 Denver Avenue', 'Mira Loma', 'Australia', '7458000025', '3006'),
(13, 0, 's', 's@gmail.com', 's', 's', 'Afghanistan', '23', '3'),
(14, 0, 'demo', 'demo@gmail.com', 's', 's', 'India', '98087656567', '686779'),
(15, 0, 'demo', 'mtomy1@gmail.com', 's', 's', 'India', '98087656567', '686779');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_role` tinyint(4) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_email`, `user_password`, `user_role`, `created_time`, `updated_time`) VALUES
(1, 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 1, '2021-07-12 17:31:36', '2021-07-13 17:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Author'),
(3, 'Editor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
