-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for jfootwear
DROP DATABASE IF EXISTS `jfootwear`;
CREATE DATABASE IF NOT EXISTS `jfootwear` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jfootwear`;

-- Dumping structure for table jfootwear.address
DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ADDRESS` varchar(255) NOT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  `SHIP_TO_ADDRESS` bit(1) DEFAULT NULL,
  `STATE` varchar(255) NOT NULL,
  `ZIPCODE` varchar(255) NOT NULL,
  `CUSTCODE_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9k6khtmvo5vp03mg15e68grka` (`CUSTCODE_FK`),
  CONSTRAINT `FK9k6khtmvo5vp03mg15e68grka` FOREIGN KEY (`CUSTCODE_FK`) REFERENCES `customer` (`custcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table jfootwear.address: ~0 rows (approximately)
DELETE FROM `address`;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` (`id`, `ADDRESS`, `COUNTRY`, `SHIP_TO_ADDRESS`, `STATE`, `ZIPCODE`, `CUSTCODE_FK`) VALUES
	(1, 'TEST', 'USA', b'1', 'NY', '11224', 9);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

-- Dumping structure for table jfootwear.authorities
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE IF NOT EXISTS `authorities` (
  `authority` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`username`,`authority`),
  CONSTRAINT `FKajpwh1di441xbk0eui6f540cm` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table jfootwear.authorities: ~2 rows (approximately)
DELETE FROM `authorities`;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` (`authority`, `username`) VALUES
	('ROLE_ADMIN', 'kun@gmail.com'),
	('ROLE_CUSTOMER', 'test@ps.org');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;

-- Dumping structure for table jfootwear.creditcard_info
DROP TABLE IF EXISTS `creditcard_info`;
CREATE TABLE IF NOT EXISTS `creditcard_info` (
  `id` int(11) NOT NULL,
  `CVV_CODE` varchar(255) NOT NULL,
  `CREDITCARD_NO` varchar(255) NOT NULL,
  `CARD_TYPE` varchar(255) NOT NULL,
  `CUSTOMER_CODE` int(11) NOT NULL,
  `EXPIRY_DATE` datetime NOT NULL,
  `CARDHOLDER_NAME` varchar(255) NOT NULL,
  `CUSTCODE_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK94p7e1xago78qiee9kucxmvfc` (`CUSTCODE_FK`),
  CONSTRAINT `FK94p7e1xago78qiee9kucxmvfc` FOREIGN KEY (`CUSTCODE_FK`) REFERENCES `customer` (`custcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table jfootwear.creditcard_info: ~0 rows (approximately)
DELETE FROM `creditcard_info`;
/*!40000 ALTER TABLE `creditcard_info` DISABLE KEYS */;
INSERT INTO `creditcard_info` (`id`, `CVV_CODE`, `CREDITCARD_NO`, `CARD_TYPE`, `CUSTOMER_CODE`, `EXPIRY_DATE`, `CARDHOLDER_NAME`, `CUSTCODE_FK`) VALUES
	(1, '123', '123456789011', 'VISA', 9, '2019-11-09 17:10:04', 'Max', 9);
/*!40000 ALTER TABLE `creditcard_info` ENABLE KEYS */;

-- Dumping structure for table jfootwear.customer
DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `custcode` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_CONTACT` varchar(255) NOT NULL,
  `CUSTOMER_NAME` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `PHONE` varchar(255) NOT NULL,
  PRIMARY KEY (`custcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table jfootwear.customer: ~2 rows (approximately)
DELETE FROM `customer`;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`custcode`, `CUSTOMER_CONTACT`, `CUSTOMER_NAME`, `EMAIL`, `PHONE`) VALUES
	(9, 'Max', 'Target', 'max@target.com', '123-456-789'),
	(10, 'Lucy', 'Amazon', 'lucy@amazon.com', '123-456-7890');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table jfootwear.item
DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `ITEM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY` varchar(255) DEFAULT NULL,
  `CURRENCY` varchar(255) DEFAULT NULL,
  `DESCRITPION` varchar(255) DEFAULT NULL,
  `ITEM_NAME` varchar(255) DEFAULT NULL,
  `PHOTO` varchar(255) DEFAULT NULL,
  `SUB_CATEGORY` varchar(255) DEFAULT NULL,
  `UNIT_PRICE` double DEFAULT NULL,
  PRIMARY KEY (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table jfootwear.item: ~14 rows (approximately)
DELETE FROM `item`;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`ITEM_ID`, `CATEGORY`, `CURRENCY`, `DESCRITPION`, `ITEM_NAME`, `PHOTO`, `SUB_CATEGORY`, `UNIT_PRICE`) VALUES
	(18, 'MEN', 'USD', 'MEN CASUAL', 'ANCHOR_02', 'photo/ANCHOR02.jpg', 'CASUAL', 15),
	(19, 'MEN', 'USD', 'MEN CASUAL', 'BAREA_01', 'photo/BAREA01.jpg', 'CASUAL', 14),
	(20, 'MEN', 'USD', 'MEN CASUAL', 'BLACKSTONE_01', 'photo/BLACKSTONE01.jpg', 'CASUAL', 16),
	(21, 'MEN', 'USD', 'MEN CASUAL', 'BYNUM_01', 'photo/BYNUM01.jpg', 'CASUAL', 14),
	(22, 'MEN', 'USD', 'MEN DRESS', 'ATLANTIC', 'photo/BILLY.jpg', 'DRESS', 15),
	(23, 'MEN', 'USD', 'MEN DRESS', 'BASSONG', 'photo/BASSONG1.jpg', 'DRESS', 14),
	(24, 'MEN', 'USD', 'MEN BOOTS', 'CHRISTOPHER_01', 'photo/CHRISTOPHER_01.jpg', 'BOOTS', 16),
	(25, 'MEN', 'USD', 'MEN BOOTS', 'CHRISTOPER_02', 'photo/CHRISTOPHER_02.jpg', 'BOOTS', 14),
	(26, 'MEN', 'USD', 'MEN SANDALS', 'ALASKA_12', 'photo/ALASKA_12.jpg', 'SANDALS', 16),
	(27, 'MEN', 'USD', 'MEN SANDALS', 'ALASKA_25', 'photo/ALASKA_25.jpg', 'SANDALS', 14),
	(28, 'MEN', 'USD', 'MEN SLIPPERS', 'ALASKA_01', 'photo/ALASKA1.jpg', 'SLIPPERS', 16),
	(29, 'MEN', 'USD', 'MEN SLIPPERS', 'ALASKA_02', 'photo/ALASKA2.jpg', 'SLIPPERS', 14),
	(30, 'WOMEN', 'USD', 'WOMEN DRESS', 'GLORIA', 'photo/GLORIA.jpg', 'CASUAL', 18),
	(31, 'WOMEN', 'USD', 'WOMEN DRESS', 'ANGIE_16', 'photo/ANGIE_16.jpg', 'DRESS', 20);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- Dumping structure for table jfootwear.item_detail
DROP TABLE IF EXISTS `item_detail`;
CREATE TABLE IF NOT EXISTS `item_detail` (
  `ITEM_DETAIL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `ITEM_ID_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ITEM_DETAIL_ID`),
  KEY `FKqg0hqjcb2g57q3glupi9ngqa2` (`ITEM_ID_FK`),
  CONSTRAINT `FKqg0hqjcb2g57q3glupi9ngqa2` FOREIGN KEY (`ITEM_ID_FK`) REFERENCES `item` (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table jfootwear.item_detail: ~123 rows (approximately)
DELETE FROM `item_detail`;
/*!40000 ALTER TABLE `item_detail` DISABLE KEYS */;
INSERT INTO `item_detail` (`ITEM_DETAIL_ID`, `color`, `quantity`, `size`, `sku`, `ITEM_ID_FK`) VALUES
	(1, 'Black', 100, 'A', '1001', 18),
	(2, 'Black', 100, 'B', '1002', 18),
	(3, 'Black', 100, 'C', '1003', 18),
	(4, 'Brown', 200, 'A', '1004', 18),
	(5, 'Brown', 200, 'B', '1005', 18),
	(6, 'Brown', 200, 'C', '1006', 18),
	(7, 'Dark Brown', 300, 'A', '1007', 18),
	(8, 'Dark Brown', 300, 'B', '1008', 18),
	(9, 'Dark Brown', 300, 'C', '1009', 18),
	(10, 'Black', 100, 'A', '2001', 19),
	(11, 'Black', 100, 'B', '2002', 19),
	(12, 'Black', 100, 'C', '2003', 19),
	(13, 'Brown', 100, 'A', '2004', 19),
	(14, 'Brown', 200, 'B', '2005', 19),
	(15, 'Brown', 200, 'C', '2006', 19),
	(16, 'Dark Brown', 300, 'A', '2007', 19),
	(17, 'Dark Brown', 300, 'B', '2008', 19),
	(18, 'Dark Brown', 300, 'C', '2009', 19),
	(19, 'Black', 100, 'A', '3001', 20),
	(20, 'Black', 100, 'B', '3002', 20),
	(21, 'Black', 100, 'C', '3003', 20),
	(22, 'Brown', 200, 'A', '3004', 20),
	(23, 'Brown', 200, 'B', '3005', 20),
	(24, 'Brown', 200, 'C', '3006', 20),
	(25, 'Dark Brown', 300, 'A', '3007', 20),
	(26, 'Dark Brown', 300, 'B', '3008', 20),
	(27, 'Dark Brown', 300, 'C', '3009', 20),
	(28, 'Black', 100, 'A', '4001', 21),
	(29, 'Black', 100, 'B', '4002', 21),
	(30, 'Black', 100, 'C', '4003', 21),
	(31, 'Brown', 200, 'A', '4004', 21),
	(32, 'Brown', 200, 'B', '4005', 21),
	(33, 'Brown', 200, 'C', '4006', 21),
	(34, 'Dark Brown', 300, 'A', '4007', 21),
	(35, 'Dark Brown', 300, 'B', '4008', 21),
	(36, 'Dark Brown', 300, 'C', '4009', 21),
	(37, 'Black', 100, 'A', '5001', 22),
	(38, 'Black', 100, 'B', '5002', 22),
	(39, 'Black', 100, 'C', '5003', 22),
	(40, 'Brown', 200, 'A', '5004', 22),
	(41, 'Brown', 200, 'B', '5005', 22),
	(42, 'Brown', 200, 'C', '5006', 22),
	(43, 'Dark Brown', 300, 'A', '5007', 22),
	(44, 'Dark Brown', 300, 'B', '5008', 22),
	(45, 'Dark Brown', 300, 'C', '5009', 22),
	(46, 'Black', 100, 'A', '6001', 23),
	(47, 'Black', 100, 'B', '6002', 23),
	(48, 'Black', 100, 'C', '6003', 23),
	(49, 'Brown', 100, 'A', '6004', 23),
	(50, 'Brown', 200, 'B', '6005', 23),
	(51, 'Brown', 200, 'C', '6006', 23),
	(52, 'Dark Brown', 300, 'A', '6007', 23),
	(53, 'Dark Brown', 300, 'B', '6008', 23),
	(54, 'Dark Brown', 300, 'C', '6009', 23),
	(55, 'Black', 100, 'A', '7001', 24),
	(56, 'Black', 100, 'B', '7002', 24),
	(57, 'Black', 100, 'C', '7003', 24),
	(58, 'Brown', 200, 'A', '7004', 24),
	(59, 'Brown', 200, 'B', '7005', 24),
	(60, 'Brown', 200, 'C', '7006', 24),
	(61, 'Dark Brown', 300, 'A', '7007', 24),
	(62, 'Dark Brown', 300, 'B', '7008', 24),
	(63, 'Dark Brown', 300, 'C', '7009', 24),
	(64, 'Black', 100, 'A', '8001', 25),
	(65, 'Black', 100, 'B', '8002', 25),
	(66, 'Black', 100, 'C', '8003', 25),
	(67, 'Brown', 200, 'A', '8004', 25),
	(68, 'Brown', 200, 'B', '8005', 25),
	(69, 'Brown', 200, 'C', '8006', 25),
	(70, 'Dark Brown', 300, 'A', '8007', 25),
	(71, 'Dark Brown', 300, 'B', '8008', 25),
	(72, 'Dark Brown', 300, 'C', '8009', 25),
	(73, 'Black', 100, 'A', '9001', 26),
	(74, 'Black', 100, 'B', '9002', 26),
	(75, 'Black', 100, 'C', '9003', 26),
	(76, 'Brown', 200, 'A', '9004', 26),
	(77, 'Brown', 200, 'B', '9005', 26),
	(78, 'Brown', 200, 'C', '9006', 26),
	(79, 'Dark Brown', 300, 'A', '9007', 26),
	(80, 'Dark Brown', 300, 'B', '9008', 26),
	(81, 'Dark Brown', 300, 'C', '9009', 26),
	(82, 'Black', 100, 'A', '1101', 27),
	(83, 'Black', 100, 'B', '1102', 27),
	(84, 'Black', 100, 'C', '1103', 27),
	(85, 'Brown', 100, 'A', '1104', 27),
	(86, 'Brown', 200, 'B', '1105', 27),
	(87, 'Brown', 200, 'C', '1106', 27),
	(88, 'Dark Brown', 300, 'A', '1107', 27),
	(89, 'Dark Brown', 300, 'B', '1108', 27),
	(90, 'Dark Brown', 300, 'C', '1109', 27),
	(91, 'Black', 100, 'A', '1201', 28),
	(92, 'Black', 100, 'B', '1202', 28),
	(93, 'Black', 100, 'C', '1203', 28),
	(94, 'Brown', 200, 'A', '1204', 28),
	(95, 'Brown', 200, 'B', '1205', 28),
	(96, 'Brown', 200, 'C', '1206', 28),
	(97, 'Dark Brown', 300, 'A', '1207', 28),
	(98, 'Dark Brown', 300, 'B', '1208', 28),
	(99, 'Dark Brown', 300, 'C', '1209', 28),
	(100, 'Black', 100, 'A', '1301', 29),
	(101, 'Black', 100, 'B', '1302', 29),
	(102, 'Black', 100, 'C', '1303', 29),
	(103, 'Brown', 200, 'A', '1304', 29),
	(104, 'Brown', 200, 'B', '1305', 29),
	(105, 'Brown', 200, 'C', '1306', 29),
	(106, 'Dark Brown', 300, 'A', '1307', 29),
	(107, 'Dark Brown', 300, 'B', '1308', 29),
	(108, 'Dark Brown', 300, 'C', '1309', 29),
	(109, 'Black', 100, 'A', '1401', 30),
	(110, 'Black', 100, 'B', '1402', 30),
	(111, 'Black', 100, 'C', '1403', 30),
	(112, 'Brown', 200, 'A', '1404', 30),
	(113, 'Brown', 200, 'B', '1405', 30),
	(114, 'Brown', 200, 'C', '1406', 30),
	(115, 'Dark Brown', 300, 'A', '1407', 30),
	(116, 'Dark Brown', 300, 'B', '1408', 30),
	(117, 'Dark Brown', 300, 'C', '1409', 30),
	(118, 'Black', 100, 'A', '1501', 31),
	(119, 'Black', 100, 'B', '1502', 31),
	(120, 'Black', 100, 'C', '1503', 31),
	(121, 'Brown', 100, 'A', '1504', 31),
	(122, 'Brown', 200, 'B', '1505', 31),
	(123, 'Brown', 200, 'C', '1506', 31),
	(124, 'Dark Brown', 300, 'A', '1507', 31),
	(125, 'Dark Brown', 300, 'B', '1508', 31),
	(126, 'Dark Brown', 300, 'C', '1509', 31);
/*!40000 ALTER TABLE `item_detail` ENABLE KEYS */;

-- Dumping structure for table jfootwear.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_AMOUNT` double DEFAULT NULL,
  `CURRENCY` varchar(255) DEFAULT NULL,
  `DELIVERY_DATE` datetime DEFAULT NULL,
  `ORDER_DATE` datetime DEFAULT NULL,
  `ORDER_TOTAL` double DEFAULT NULL,
  `PAID_AMOUNT` double DEFAULT NULL,
  `PAY_TYPE` varchar(255) DEFAULT NULL,
  `PAY_DATE` datetime DEFAULT NULL,
  `SHIP_TO_ADDRESS` int(11) DEFAULT NULL,
  `SHIPPING_COST` double DEFAULT NULL,
  `ORDER_STATUS` varchar(255) DEFAULT NULL,
  `TAX` double DEFAULT NULL,
  `CUSTCODE_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `FKh59ijpnkd1cjw9uixu9tpef7e` (`CUSTCODE_FK`),
  CONSTRAINT `FKh59ijpnkd1cjw9uixu9tpef7e` FOREIGN KEY (`CUSTCODE_FK`) REFERENCES `customer` (`custcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table jfootwear.orders: ~2 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`ORDER_ID`, `ORDER_AMOUNT`, `CURRENCY`, `DELIVERY_DATE`, `ORDER_DATE`, `ORDER_TOTAL`, `PAID_AMOUNT`, `PAY_TYPE`, `PAY_DATE`, `SHIP_TO_ADDRESS`, `SHIPPING_COST`, `ORDER_STATUS`, `TAX`, `CUSTCODE_FK`) VALUES
	(35, 564, 'USD', NULL, '2019-11-09 18:43:17', 614.055, NULL, NULL, NULL, 0, NULL, 'Confirmed', 50.055, 9),
	(36, 780, 'USD', NULL, '2019-11-09 18:58:24', 849.225, NULL, NULL, NULL, 0, NULL, 'Cart', 69.225, 9);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table jfootwear.order_detail
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `ORDER_DETAIL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COLOR` varchar(255) DEFAULT NULL,
  `DESCRITPION` varchar(255) DEFAULT NULL,
  `ITEM_NAME` varchar(255) DEFAULT NULL,
  `PHOTO` varchar(255) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `SIZE` varchar(255) DEFAULT NULL,
  `SKU` varchar(255) DEFAULT NULL,
  `UNITPRICE` double DEFAULT NULL,
  `ORDER_ID_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`ORDER_DETAIL_ID`),
  KEY `FKqidayaaw1dnl3cqg6yaclwqhj` (`ORDER_ID_FK`),
  CONSTRAINT `FKqidayaaw1dnl3cqg6yaclwqhj` FOREIGN KEY (`ORDER_ID_FK`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table jfootwear.order_detail: ~5 rows (approximately)
DELETE FROM `order_detail`;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` (`ORDER_DETAIL_ID`, `COLOR`, `DESCRITPION`, `ITEM_NAME`, `PHOTO`, `QUANTITY`, `SIZE`, `SKU`, `UNITPRICE`, `ORDER_ID_FK`) VALUES
	(91, 'Black', 'MEN SANDALS', 'ALASKA_25', 'photo/ALASKA_25.jpg', 1, 'A', '1101', 14, 35),
	(92, 'Black', 'MEN DRESS', 'ATLANTIC', 'photo/BILLY.jpg', 1, 'A', '5001', 15, 35),
	(93, 'Brown', 'WOMEN DRESS', 'GLORIA', 'photo/GLORIA.jpg', 1, 'B', '1405', 18, 35),
	(94, 'Brown', 'WOMEN DRESS', 'GLORIA', 'photo/GLORIA.jpg', 2, 'A', '1404', 18, 36),
	(95, 'Brown', 'MEN BOOTS', 'CHRISTOPER_02', 'photo/CHRISTOPHER_02.jpg', 1, 'A', '8004', 14, 36),
	(96, 'Black', 'MEN CASUAL', 'ANCHOR_02', 'photo/ANCHOR02.jpg', 1, 'A', '1001', 15, 36);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;

-- Dumping structure for table jfootwear.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `USER_PASSWORD` varchar(255) DEFAULT NULL,
  `CUSTCODE_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `FKlkttm3stc94vange82m0m2c03` (`CUSTCODE_FK`),
  CONSTRAINT `FKlkttm3stc94vange82m0m2c03` FOREIGN KEY (`CUSTCODE_FK`) REFERENCES `customer` (`CUSTCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table jfootwear.users: ~2 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`username`, `enabled`, `FIRST_NAME`, `LAST_NAME`, `USER_PASSWORD`, `CUSTCODE_FK`) VALUES
	('kun@gmail.com', b'1', 'kun', 'Kun', '$2a$10$m6bNubuqreA3ankgGuOj7.SjSkrA8bMFXU0Ua6PA08mdSycQ1hufu', 9),
	('test@ps.org', b'1', 'Max', 'Trump', '$2a$10$3oIDBwI7PkKQ.zsbFeqhy.tDW/e7zDdxwBD7fx/gzPql8qpAriuW6', 10);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
