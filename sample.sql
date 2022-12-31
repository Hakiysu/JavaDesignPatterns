-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: javasjmsdata
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `goodstatus`
--

DROP TABLE IF EXISTS `goodstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodstatus` (
  `goodID` int NOT NULL,
  `goodName` char(16) NOT NULL,
  `goodFactory` char(64) DEFAULT NULL,
  `goodPrice` int NOT NULL,
  `goodAmount` int NOT NULL,
  `goodLastEditTime` char(32) NOT NULL,
  PRIMARY KEY (`goodID`),
  UNIQUE KEY `goodID` (`goodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodstatus`
--

LOCK TABLES `goodstatus` WRITE;
/*!40000 ALTER TABLE `goodstatus` DISABLE KEYS */;
INSERT INTO `goodstatus` VALUES (1,'可口可乐原味','可口可乐中国',3,4000,'Sat Dec 31 07:29:58 HKT 2022'),(2,'雪碧','可口可乐中国',3,4900,'Sat Dec 31 07:30:05 HKT 2022'),(4,'芬达苹果味','可口可乐中国',3,4500,'Sat Dec 31 07:28:30 HKT 2022'),(5,'巨无霸','麦当劳',15,4500,'Sat Dec 31 09:57:39 HKT 2022'),(6,'麦香鸡','麦当劳',12,5000,'Sat Dec 31 09:57:52 HKT 2022'),(7,'薯条(大)','麦当劳',10,10000,'Sat Dec 31 09:58:25 HKT 2022');
/*!40000 ALTER TABLE `goodstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `orderID` char(32) NOT NULL,
  `orderMaker` char(128) NOT NULL,
  `orderReceiveFactory` char(128) NOT NULL,
  `orderContent` char(128) NOT NULL,
  `orderStatus` char(128) NOT NULL,
  `orderSendMethod` char(16) NOT NULL,
  `orderSendAddress` char(128) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  UNIQUE KEY `orderID` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES ('1672443039313061873','张三','可口可乐中国','可口可乐原味x500','已签收','配送','安徽科技学院龙湖校区学院超市'),('1672443967125099122','张三','可口可乐中国','可口可乐原味x500','已接单','配送','安徽科技学院龙湖校区学院超市'),('1672451017752075776','张三','可口可乐中国','雪碧x100','已下单','自提',''),('1672451033107090243','张三','可口可乐中国','芬达苹果味x500','已发货:DPK364556685521','配送','安徽科技学院龙湖校区学院超市'),('1672451932382040021','张三','麦当劳','巨无霸x500','已下单','配送','安徽科技学院龙湖校区学院超市');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdata` (
  `username` char(32) DEFAULT NULL,
  `passwd` char(32) NOT NULL,
  `accountLevel` int NOT NULL,
  `telephone` char(64) NOT NULL,
  `email` char(32) NOT NULL,
  `address` char(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdata`
--

LOCK TABLES `userdata` WRITE;
/*!40000 ALTER TABLE `userdata` DISABLE KEYS */;
INSERT INTO `userdata` VALUES ('张三','12255566998',1,'12255566998','test@test.com','安徽科技学院龙湖校区学院超市'),('可口可乐中国','coca-cola',2,'1234567890','lshen@coca-cola.com','上海市闵行区紫竹科学园区紫月路1188号办公楼3-14室'),('麦当劳','mcdonalds',2,'400-920-0205','enquiry@cn.mcd.com','上海市徐汇区龙腾大道2121号2号楼一层108室');
/*!40000 ALTER TABLE `userdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-31 10:20:09
