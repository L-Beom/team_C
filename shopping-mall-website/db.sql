-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.1.48-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- mydb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;

-- 테이블 mydb.cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart` (
  `cartNumber` int(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) DEFAULT NULL,
  `goodsCode` varchar(50) DEFAULT NULL,
  `goodsName` varchar(50) DEFAULT NULL,
  `cartStock` int(20) DEFAULT NULL,
  `cartAddedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cartNumber`),
  KEY `goodsName` (`goodsName`),
  KEY `userid` (`userid`),
  CONSTRAINT `FK_cart_goods` FOREIGN KEY (`goodsName`) REFERENCES `goods` (`goodsName`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mydb.goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods` (
  `goodsCode` varchar(50) NOT NULL,
  `goodsName` varchar(50) NOT NULL,
  `firstClassification` varchar(50) NOT NULL,
  `secondClassification` varchar(50) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `goodsPrice` int(50) NOT NULL DEFAULT '0',
  `goodsStock` int(50) NOT NULL DEFAULT '0',
  `goodsDiscountRate` int(50) DEFAULT NULL,
  `goodsDescription` varchar(250) DEFAULT NULL,
  `goodsImage` varchar(250) DEFAULT NULL,
  `goodsThumbnailImage` varchar(250) DEFAULT NULL,
  `goodsAddedTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`goodsCode`),
  KEY `goodsCode` (`goodsCode`),
  KEY `goodsName` (`goodsName`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mydb.goods_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods_reply` (
  `goodsCode` varchar(50) NOT NULL,
  `goodsName` varchar(50) NOT NULL,
  `replyNumber` varchar(50) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `replyData` varchar(255) NOT NULL DEFAULT '',
  `replyRating` int(10) NOT NULL DEFAULT '1',
  `replyDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replyNumber`),
  KEY `goodsCode` (`goodsCode`),
  KEY `goodsName` (`goodsName`),
  KEY `userid` (`userid`),
  CONSTRAINT `FK_goods_reply_goods` FOREIGN KEY (`goodsCode`) REFERENCES `goods` (`goodsCode`),
  CONSTRAINT `FK_goods_reply_goods_2` FOREIGN KEY (`goodsName`) REFERENCES `goods` (`goodsName`),
  CONSTRAINT `FK_goods_reply_member` FOREIGN KEY (`userid`) REFERENCES `member` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mydb.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `zipcode` varchar(50) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `regedate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `verify` int(50) DEFAULT '0',
  PRIMARY KEY (`email`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mydb.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `orderId` varchar(50) NOT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `orderRecipient` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `zipcode` varchar(50) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `amount` int(25) DEFAULT NULL,
  `orderDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  KEY `orderId` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mydb.ordered_goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `ordered_goods` (
  `orderId` varchar(50) DEFAULT NULL,
  `goodsName` varchar(50) DEFAULT NULL,
  `goodsCode` varchar(50) DEFAULT NULL,
  `cartStock` int(20) DEFAULT NULL,
  `goodsPrice` int(20) DEFAULT NULL,
  `goodsThumbnailImage` varchar(250) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT '1',
  KEY `orderId` (`orderId`),
  CONSTRAINT `FK_ordered_goods_order` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
