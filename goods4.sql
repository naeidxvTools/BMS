-- MySQL dump 10.13  Distrib 5.7.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: goods
-- ------------------------------------------------------
-- Server version	5.7.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_admin`
--

DROP TABLE IF EXISTS `t_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_admin` (
  `adminId` char(32) NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `adminpwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin`
--

LOCK TABLES `t_admin` WRITE;
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
INSERT INTO `t_admin` VALUES ('a1','zhanlong','zl113592'),('a2','guanYu','123'),('a3','zhangSanFei','123');
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_book`
--

DROP TABLE IF EXISTS `t_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_book` (
  `bid` char(32) NOT NULL,
  `bname` varchar(200) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `discount` decimal(3,1) DEFAULT NULL,
  `press` varchar(100) DEFAULT NULL,
  `publishtime` char(10) DEFAULT NULL,
  `edition` int(11) DEFAULT NULL,
  `pageNum` int(11) DEFAULT NULL,
  `wordNum` int(11) DEFAULT NULL,
  `printtime` char(10) DEFAULT NULL,
  `booksize` int(11) DEFAULT NULL,
  `registrationNumber` varchar(10) DEFAULT NULL,
  `cid` char(32) DEFAULT NULL,
  `image_w` varchar(100) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`bid`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_t_book_t_category` (`cid`),
  CONSTRAINT `FK_t_book_t_category` FOREIGN KEY (`cid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=1198 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_book`
--

LOCK TABLES `t_book` WRITE;
/*!40000 ALTER TABLE `t_book` DISABLE KEYS */;
INSERT INTO `t_book` VALUES ('000A18FDB38F470DBE9CD0972BADB23F','Java Web整合开发实战--基于Struts 2+Hibernate+Spring（99个应用实例，4个项目开发案例，15.5小时配套教学视频，超值DVD光盘含大量开发资源。一本书搞定SSH框架整合开发！）','贾蓓',79.80,55.10,6.9,'清华大学出版社','2013-7-1',1,640,1030000,'2013-7-1',16,'IT-1176','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/23268958-1_w.jpg','book_img/23268958-1_b.jpg',1176),('029B324F3B2445BAAFBE515BC7410D45','船舶设计基础','蔡厚平',23.00,23.00,10.0,'哈尔滨工程大学出版社','2006-9',1,221,0,'2006-9',16,'CB-102','D45D96DA359A4FEAB3AB4DCF2157FC06','book_img/船舶设计基础（蔡厚平）_w.jpg','book_img/船舶设计基础（蔡厚平）_b.jpg',12),('0EE8A0AE69154287A378FB110FF2C780','Java核心技术：卷Ⅰ基础知识（原书第8版）','昊斯特曼',98.00,67.60,6.9,'机械工业出版社','2008-6-1',1,694,0,'2008-6-1',16,'IT-1172','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/20285763-1_w.jpg','book_img/20285763-1_b.jpg',1172),('22234CECF15F4ECB813F0B433DDA5365','JavaScript从入门到精通（附光盘1张）（连续8月JavaScript类全国零售排行前2名，13小时视频，400个经典实例、369项面试真题、138项测试史上最全资源库）','明日科技',69.80,48.20,6.9,'清华大学出版社','2012-9-1',1,532,939000,'2012-9-1',16,'IT-1180','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/22862057-1_w.jpg','book_img/22862057-1_b.jpg',1180),('234133EA8587493A970B2915BAB2A00A','船体建造与修理工艺','华乃导',28.50,28.50,10.0,'人民交通出版社','2004-3',1,363,0,'2004-3',16,'CB-034','D45D96DA359A4FEAB3AB4DCF2157FC06','book_img/船体建造与修理工艺（华乃导）_w.jpg','book_img/船体建造与修理工艺（华乃导）_b.jpg',8),('27F5B495F4704C708BA4ACF97A82CCD1','船舶原理（上册）','盛振邦，刘应中',31.00,31.00,10.0,'上海交通大学出版社','2003-9',1,342,0,'2003-9',16,'CB-031','D45D96DA359A4FEAB3AB4DCF2157FC06','book_img/船舶原理（上册）(盛振邦，刘应中)_w.jpg','book_img/船舶原理（上册）(盛振邦，刘应中)_b.jpg',6),('28A03D28BAD449659A77330BE35FCD65','JAVA核心技术卷II：高级特性（原书第8版）','霍斯特曼',118.00,81.40,6.9,'机械工业出版社','2008-12-1',1,852,0,'2008-12-1',16,'IT-1178','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/20446562-1_w.jpg','book_img/20446562-1_b.jpg',1178),('310A8349877C4393B1AB7888F34E505C','船舶原理（下册）','盛振邦，刘应中',43.00,43.00,10.0,'上海交通大学出版社','2004-5',1,450,0,'2004-5',16,'CB-032','D45D96DA359A4FEAB3AB4DCF2157FC06','book_img/船舶原理（下册）(盛振邦，刘应中)_w.jpg','book_img/船舶原理（下册）(盛振邦，刘应中)_b.jpg',7),('33ACF97A9A374352AE9F5E89BB791262','基于MVC的JavaScript Web富应用开发','麦卡劳',59.00,40.70,6.9,'电子工业出版社','2012-5-1',1,282,462000,'2012-5-1',16,'IT-1194','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/22757564-1_w.jpg','book_img/22757564-1_b.jpg',1194),('37F75BEAE1FE46F2B14674923F1E7987','数据结构与算法分析Java语言描述 第2版','韦斯',55.00,38.00,6.9,'机械工业出版社','2009-1-1',2,440,0,'2009-1-1',16,'IT-1192','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/20417467-1_w.jpg','book_img/20417467-1_b.jpg',1192),('39F1D0803E8F4592AE1245CACE683214','Java程序员修炼之道','埃文斯',89.00,61.40,6.9,'人民邮电出版社','2013-8-1',1,395,658000,'2013-8-1',16,'IT-1196','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/23301847-1_w_1.jpg','book_img/23301847-1_b.jpg',1196),('3E1990E19989422E9DA735978CB1E4CE','Effective Java中文版(第2版)','布洛克',52.00,35.90,6.9,'机械工业出版社','2009-1-1',2,287,0,'2009-1-1',16,'IT-1185','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/20459091-1_w.jpg','book_img/20459091-1_b.jpg',1185),('48518A50F030416E871AEFFDAFA61A95','船体修造工艺','王鸿斌',42.00,42.00,10.0,'人民交通出版社','2006-8',1,388,0,'2006-8',16,'CB-027/1','D45D96DA359A4FEAB3AB4DCF2157FC06','book_img/船体修造工艺(王鸿斌)_w.jpg','book_img/船体修造工艺(王鸿斌)_b.jpg',4),('48BBFBFC07074ADE8CC906A45BE5D9A6','JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）','弗兰纳根',139.00,95.30,6.9,'机械工业出版社','2012-4-1',1,1004,0,'2012-4-1',16,'IT-1175','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/22722790-1_w.jpg','book_img/22722790-1_b.jpg',1175),('4A9574F03A6B40C1B2A437237C17DEEC','Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）','Craig Walls',59.00,40.70,6.9,'人民邮电出版社','2013-6-1',1,374,487000,'2013-6-1',16,'IT-1171','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/23254532-1_w.jpg','book_img/23254532-1_b.jpg',1171),('4BF6D97DD18A4B77B8DED9B057577F8F','Java Web从入门到精通（附光盘1张）（连续8月Java类全国零售排行前2名，27小时视频，951个经典实例、369项面试真题、596项测试史上最全资源库）','明日科技',69.80,48.20,6.9,'清华大学出版社','2012-9-1',1,547,979000,'2012-9-1',16,'IT-1183','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/22862056-1_w.jpg','book_img/22862056-1_b.jpg',1183),('4C3331CAD5A5453787A94B8D7CCEAA29','Java Web整合开发王者归来（JSP+Servlet+Struts+Hibernate+Spring）（配光盘','刘京华',99.80,68.90,6.9,'清华大学出版社','2010-1-1',1,1010,1368000,'2010-1-1',16,'IT-1177','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/20756351-1_w_1.jpg','book_img/20756351-1_b_1.jpg',1177),('4F1D69D21AFB48B581F5C467FB55D0C1','船舶原理与结构','陈雪深等',16.30,16.30,10.0,'上海交通大学出版社','',1,231,0,'',16,'CB-060/1','D45D96DA359A4FEAB3AB4DCF2157FC06','book_img/船舶原理与结构(陈雪深等)_w.jpg','book_img/船舶原理与结构(陈雪深等)_b.jpg',10),('5315DA60D24042889400AD4C93A37501','Spring 3.x企业应用开发实战(含CD光盘1张)','陈雄华',90.00,62.10,6.9,'电子工业出版社','2012-2-1',1,710,1158000,'2012-2-1',16,'IT-1184','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/22605701-1_w.jpg','book_img/22605701-1_b.jpg',1184),('5BD81E2ADD6147AC928D79875E20E2A9','船舶制造基础','杨敏',19.00,19.00,10.0,'国防工业出版社','',1,192,0,'',16,'CB-128/1','D45D96DA359A4FEAB3AB4DCF2157FC06','book_img/船舶制造基础（杨敏)_w.jpg','book_img/船舶制造基础（杨敏)_b.jpg',13),('5C4A6F0F4A3B4672AD8C5F89BF5D37D2','Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）','明日科技',59.80,41.30,6.9,'清华大学出版社','2012-9-1',3,564,1013000,'2012-9-1',16,'IT-1174','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/22862060-1_w.jpg','book_img/22862060-1_b.jpg',1174),('5EDB981339C342ED8DB17D5A198D50DC','Java程序性能优化','葛一鸣',59.00,40.70,6.9,'清华大学出版社','2012-10-1',1,400,649000,'2012-10-1',16,'IT-1187','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/22881618-1_w.jpg','book_img/22881618-1_b.jpg',1187),('6398A7BA400D40258796BCBB2B256068','JavaScript设计模式','Addy Osmani',49.00,33.80,6.9,'人民邮电出版社','2013-6-1',1,241,301000,'2013-6-1',16,'IT-1181','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/23266635-1_w.jpg','book_img/23266635-1_b.jpg',1181),('6538BB9F0D0A487090B6523EF0239140','船舶建造工艺','魏莉洁',15.00,15.00,10.0,'哈尔滨工程大学出版社','2006-4',1,125,0,'2006-4',16,'CB-074','D45D96DA359A4FEAB3AB4DCF2157FC06','book_img/船舶建造工艺(魏莉洁)_w.jpg','book_img/船舶建造工艺(魏莉洁)_b.jpg',11),('7FD7F50B15F74248AA769798909F8653','Java网络编程（第3版）——O’Reilly Java系列','哈诺德',85.00,51.00,6.0,'中国电力出版社','2005-11-1',1,718,668000,'2005-11-1',16,'IT-1195','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/9062293-1_w.jpg','book_img/9062293-1_b.jpg',1195),('95AACC68D64D4D67B1E33E9EAC22B885','Head First Java（中文版）（JAVA经典畅销书 生动有趣 轻松学好JAVA）','塞若',79.00,47.40,6.0,'中国电力出版社','2007-2-1',1,689,983000,'2001-7-2',16,'IT-1173','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/9265169-1_w.jpg','book_img/9265169-1_b.jpg',1173),('9923901FBF124623BC707920D8936BC8','JavaScript DOM编程艺术(第2版)','基思',49.00,33.80,6.9,'人民邮电出版社','2011-4-1',1,286,443000,'2011-4-1',16,'IT-1188','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/21049601-1_w_1.jpg','book_img/21049601-1_b.jpg',1188),('9981DCEAC380493FB00CFBF500AE8026','船舶设计原理','顾敏童',29.00,29.00,10.0,'上海交通大学出版社','1988-7',1,277,0,'1988-7',16,'CB-030/1','D45D96DA359A4FEAB3AB4DCF2157FC06','book_img/船舶设计原理（顾敏童）_w.jpg','book_img/船舶设计原理（顾敏童）_b.jpg',5),('9F967B2BA57441958A4A9FAF589DD0B5','船体冷加工工艺学（中级）','刁玉锋',13.00,13.00,10.0,'哈尔滨工程大学出版社','2006-10',1,97,0,'2006-10',16,'CB-011','D45D96DA359A4FEAB3AB4DCF2157FC06','book_img/船体冷加工工艺学（中级）_w.jpg','book_img/船体冷加工工艺学（中级）_b.jpg',3),('9FF423101836438F874035A48498CF45','Java编程思想（英文版·第4版）','埃克尔 ',79.00,54.50,6.9,'机械工业出版社','2007-4-1',1,1482,0,'2007-4-1',16,'IT-1191','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/9288920-1_w.jpg','book_img/9288920-1_b.jpg',1191),('A8EF76FD21A645109538614DEA85F3F7','Java语言程序设计：基础篇（原书第8版）','梁勇',75.00,51.80,6.9,'机械工业出版社','2011-6-1',1,586,0,'2011-6-1',16,'IT-1190','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/21122188-1_w_1.jpg','book_img/21122188-1_b.jpg',1190),('A942B6F0684A42F582E1E03FE2D7B898','船舶结构与制图','魏莉洁',38.00,38.00,10.0,'人民交通出版社','2006-8',1,322,0,'2006-8',16,'CB-039/1','D45D96DA359A4FEAB3AB4DCF2157FC06','book_img/船舶结构与制图(魏莉洁)_w.jpg','book_img/船舶结构与制图(魏莉洁)_b.jpg',9),('AB83D822501042849B20F9F087A8472C','船舶概论','金仲达',19.50,19.50,10.0,'哈尔滨工程大学出版社','2002-3',1,231,0,'2002-3',16,'CB-001','D45D96DA359A4FEAB3AB4DCF2157FC06','book_img/cbgl_w.jpg','book_img/cbgl_b.jpg',1),('AD6EA79CCB8240AAAF5B292AD7E5DCAA','jQuery Mobile权威指南（根据jQuery Mobile最新版本撰写的权威参考书！全面讲解jQuery Mobile的所有功能、特性、使用方法和开发技巧）','陶国荣',59.00,40.70,6.9,'机械工业出版社','2012-8-1',1,249,0,'2012-8-1',16,'IT-1186','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/22847009-1_w.jpg','book_img/22847009-1_b.jpg',1186),('AE0935F13A214436B8599DE285A86220','JavaScript基础教程(第8版)(经典JavaScript入门书 涵盖Ajax和jQuery)','Tom Negrino　Dori Smith',69.00,47.60,6.9,'人民邮电出版社','2012-4-1',1,392,694000,'2012-4-1',16,'IT-1197','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/22717349-1_w.jpg','book_img/22717349-1_b.jpg',1197),('B329A14DDEF8455F82B3FDF25821D2BB','名师讲坛——Java Web开发实战经典基础篇（JSP、Servlet、Struts、Ajax）（32小时全真课堂培训，视频超级给力！390项实例及分析，北京魔乐科技培训中心Java Web全部精华）','李兴华',69.80,48.20,6.9,'清华大学出版社','2010-8-1',1,554,819000,'2010-8-1',16,'IT-1182','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/20915948-1_w_3.jpg','book_img/20915948-1_b.jpg',1182),('C3CF52B3ED2D4187A16754551488D733','Java从入门到精通（附光盘）','魔乐科技',59.00,35.40,6.0,'人民邮电出版社','2010-4-1',1,519,884000,'2010-4-1',16,'IT-1189','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/20810282-1_w_1.jpg','book_img/20810282-1_b.jpg',1189),('CB0AB3654945411EA69F368D0EA91A00','JavaScript语言精粹（修订版）','道格拉斯·克罗克福德',49.00,39.20,8.0,'电子工业出版社','2012-9-1',1,155,258000,'2012-9-1',16,'IT-1193','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/22872884-1_w.jpg','book_img/22872884-1_b.jpg',1193),('CD913617EE964D0DBAF20C60076D32FB','名师讲坛——Java开发实战经典（配光盘）（60小时全真课堂培训，视频超级给力！790项实例及分析，北京魔乐科技培训中心Java全部精华）','李兴华',79.80,55.10,6.9,'清华大学出版社','2009-8-1',1,831,1222000,'2012-8-1',16,'IT-1179','5F79D0D246AD4216AC04E9C5FAB3199E','book_img/20637368-1_w_2.jpg','book_img/20637368-1_b_2.jpg',1179),('FDAC96EBDA804DAC986FEA1E70EB6074','船体冷加工工艺学（初级）','刘向东',13.00,13.00,10.0,'哈尔滨工程大学出版社','2006-10',1,119,0,'2006-10',16,'CB-010','D45D96DA359A4FEAB3AB4DCF2157FC06','book_img/船体冷加工工艺学（初级）_w.jpg','book_img/船体冷加工工艺学（初级）_b.jpg',2);
/*!40000 ALTER TABLE `t_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cartitem`
--

DROP TABLE IF EXISTS `t_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cartitem` (
  `cartItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cartItemId`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_t_cartitem_t_user` (`uid`),
  KEY `FK_t_cartitem_t_book` (`bid`),
  CONSTRAINT `FK_t_cartitem_t_book` FOREIGN KEY (`bid`) REFERENCES `t_book` (`bid`),
  CONSTRAINT `FK_t_cartitem_t_user` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cartitem`
--

LOCK TABLES `t_cartitem` WRITE;
/*!40000 ALTER TABLE `t_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_category`
--

DROP TABLE IF EXISTS `t_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_category` (
  `cid` char(32) NOT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `pid` char(32) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cname` (`cname`),
  KEY `FK_t_category_t_category` (`pid`),
  KEY `orderBy` (`orderBy`),
  CONSTRAINT `FK_t_category_t_category` FOREIGN KEY (`pid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_category`
--

LOCK TABLES `t_category` WRITE;
/*!40000 ALTER TABLE `t_category` DISABLE KEYS */;
INSERT INTO `t_category` VALUES ('1','船舶工程技术',NULL,'船舶工程技术分类',1),('1009DC56C18E4231B197B73CC89B0D7E','航海核心','7','航海核心分类',38),('2','焊接技术与自动化',NULL,'焊接技术与自动化分类',2),('3','船舶检验',NULL,'船舶检验分类',3),('34000D7FB55E49D9A6B1B2C59F472AFA','船动核心','6','船动核心分类',41),('4','空调工程技术',NULL,'空调工程技术分类',4),('5','船舶机械工程技术',NULL,'船舶机械工程技术分类',5),('56AD72718C524147A2485E5F4A95A062','检验核心','3','检验核心分类',21),('5F79D0D246AD4216AC04E9C5FAB3199E','Java Javascript','8','Java Javascript分类',10),('6','船舶动力工程技术',NULL,'船舶动力工程技术分类',6),('65640549B80E40B1981CDEC269BFFCAD','检验基础','3','检验基础分类',20),('65830AB237EF428BAE9B7ADC78A8D1F6','空调核心','4','空调核心分类',28),('7','航海技术',NULL,'航海技术分类',7),('8','计算机程序设计',NULL,'计算机程序设计分类',8),('96F209F79DB242E9B99CC1B98FAB01DB','船机核心','5','船机核心分类',33),('9AF0184F04364D5DA378FD386434628E','航海基础','7','航海基础分类',37),('A9CFBED0F77746C5BD751F2502FAB2CD','船动基础','6','船动基础分类',35),('C4DD8CA232864B31A367EE135D86382C','焊接核心','2','焊接核心分类',17),('C9A99210D5914AAAB1232AB4F64A2B7B','船体专业核心','1','船体专业核心分类',40),('D45D96DA359A4FEAB3AB4DCF2157FC06','船体专业基础','1','船体专业基础分类',11),('F4FBD087EB054CA1896093F172AC33D9','船机基础','5','船机基础分类',30),('F5C091B3967442A2B35EFEFC4EF8746F','焊接基础','2','焊接基础分类',16),('FAB7B7F7084F4D57A0808ADC61117683','空调基础','4','空调基础分类',26);
/*!40000 ALTER TABLE `t_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_order`
--

DROP TABLE IF EXISTS `t_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_order` (
  `oid` char(32) NOT NULL,
  `ordertime` char(19) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_t_order_t_user` (`uid`),
  CONSTRAINT `FK_t_order_t_user` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order`
--

LOCK TABLES `t_order` WRITE;
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
INSERT INTO `t_order` VALUES ('223B7291BCFD4CC3B647C3CBBA07C0C3','2020-10-17 21:18:06',0.00,1,NULL,'9506CD44E1B543C8BD181C80F61AB0D6'),('22EFF15CC2FB402281E7002F1B698BEB','2020-10-17 21:36:23',0.00,1,NULL,'9506CD44E1B543C8BD181C80F61AB0D6'),('2DEE23B0D68749A09CB943CD5EC15196','2020-10-17 21:37:10',0.00,1,NULL,'9506CD44E1B543C8BD181C80F61AB0D6'),('4FC44003D3F54C05B9B8B1A6B3ADCC59','2020-10-17 21:36:51',0.00,1,NULL,'9506CD44E1B543C8BD181C80F61AB0D6'),('6B970B6719AD40AE943F2BA2EDDF35F1','2020-10-17 21:36:47',0.00,1,NULL,'9506CD44E1B543C8BD181C80F61AB0D6'),('B93CBC7431F54077B41C69B4E26913F5','2020-10-17 21:32:39',0.00,1,NULL,'9506CD44E1B543C8BD181C80F61AB0D6'),('C6A9125B51B64D589F1BC52D79A89960','2020-10-17 21:36:30',0.00,1,NULL,'9506CD44E1B543C8BD181C80F61AB0D6'),('CCF07F37BF394334AEE11FA8BA0B7067','2020-10-17 21:23:34',0.00,1,NULL,'9506CD44E1B543C8BD181C80F61AB0D6'),('D9F0CD58F790453CAD77DD376B35CC3E','2020-10-17 21:17:51',0.00,1,NULL,'9506CD44E1B543C8BD181C80F61AB0D6');
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_orderitem`
--

DROP TABLE IF EXISTS `t_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_orderitem` (
  `orderItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `bname` varchar(200) DEFAULT NULL,
  `registrationNumber` varchar(10) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `FK_t_orderitem_t_order` (`oid`),
  CONSTRAINT `FK_t_orderitem_t_order` FOREIGN KEY (`oid`) REFERENCES `t_order` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_orderitem`
--

LOCK TABLES `t_orderitem` WRITE;
/*!40000 ALTER TABLE `t_orderitem` DISABLE KEYS */;
INSERT INTO `t_orderitem` VALUES ('02B8379E30D34624A180DDD01605FF6E',0,0.00,'AB83D822501042849B20F9F087A8472C','船舶概论','CB-001',19.50,'book_img/cbgl_b.jpg','B93CBC7431F54077B41C69B4E26913F5'),('120E4C4931DD490898E62118F4BFBA00',0,0.00,'AB83D822501042849B20F9F087A8472C','船舶概论','CB-001',19.50,'book_img/cbgl_b.jpg','D9F0CD58F790453CAD77DD376B35CC3E'),('4142964DAA4F42DFBBAF020DB3F3D685',0,0.00,'4C3331CAD5A5453787A94B8D7CCEAA29','Java Web整合开发王者归来（JSP+Servlet+Struts+Hibernate+Spring）（配光盘','IT-1177',68.90,'book_img/20756351-1_b_1.jpg','22EFF15CC2FB402281E7002F1B698BEB'),('5138D9DD831146FB992D0FC643BE1C8C',0,0.00,'AB83D822501042849B20F9F087A8472C','船舶概论','CB-001',19.50,'book_img/cbgl_b.jpg','CCF07F37BF394334AEE11FA8BA0B7067'),('885E6184B929444F8F850B36FA65E300',0,0.00,'48BBFBFC07074ADE8CC906A45BE5D9A6','JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）','IT-1175',95.30,'book_img/22722790-1_b.jpg','CCF07F37BF394334AEE11FA8BA0B7067'),('8C16D6EEFB7B465AA0E5BE97A4C1CC7D',0,0.00,'48518A50F030416E871AEFFDAFA61A95','船体修造工艺','CB-027/1',42.00,'book_img/船体修造工艺(王鸿斌)_b.jpg','223B7291BCFD4CC3B647C3CBBA07C0C3'),('961986CDE14F4AB09B180A56502DD343',0,0.00,'0EE8A0AE69154287A378FB110FF2C780','Java核心技术：卷Ⅰ基础知识（原书第8版）','IT-1172',67.60,'book_img/20285763-1_b.jpg','CCF07F37BF394334AEE11FA8BA0B7067'),('BAD60F67452943E2A799F7F250627E00',0,0.00,'FDAC96EBDA804DAC986FEA1E70EB6074','船体冷加工工艺学（初级）','CB-010',13.00,'book_img/船体冷加工工艺学（初级）_b.jpg','223B7291BCFD4CC3B647C3CBBA07C0C3'),('D915C31E93DC44238A73B92706C5CF3C',0,0.00,'28A03D28BAD449659A77330BE35FCD65','JAVA核心技术卷II：高级特性（原书第8版）','IT-1178',81.40,'book_img/20446562-1_b.jpg','2DEE23B0D68749A09CB943CD5EC15196'),('E6A247370DBB415FBA15403051AF429E',0,0.00,'28A03D28BAD449659A77330BE35FCD65','JAVA核心技术卷II：高级特性（原书第8版）','IT-1178',81.40,'book_img/20446562-1_b.jpg','6B970B6719AD40AE943F2BA2EDDF35F1'),('F23486DBD4A54CA2AFC8A029110D9389',0,0.00,'4C3331CAD5A5453787A94B8D7CCEAA29','Java Web整合开发王者归来（JSP+Servlet+Struts+Hibernate+Spring）（配光盘','IT-1177',68.90,'book_img/20756351-1_b_1.jpg','CCF07F37BF394334AEE11FA8BA0B7067'),('FBC55502774B4AD39A570D4FA0433F93',0,0.00,'28A03D28BAD449659A77330BE35FCD65','JAVA核心技术卷II：高级特性（原书第8版）','IT-1178',81.40,'book_img/20446562-1_b.jpg','4FC44003D3F54C05B9B8B1A6B3ADCC59');
/*!40000 ALTER TABLE `t_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `uid` char(32) NOT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpass` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `activationCode` char(64) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES ('9506CD44E1B543C8BD181C80F61AB0D6','zhanlong','123456','120769563com',1,'5918489FC6E34FC18A136F6A2774DCBB11751CDB49FA4CDA87262B52F1FBD9C2'),('C162543C4CB74A33A10427770A7A6A70','yangxia','123456','120769563@qq.com',1,'CD13849C286D42F583BE507E94A1C8584E675C214FA24CB194079C293BD9CD87'),('C162543C4CB74A33A10427770A7A6A71','chenjiong','123456','120769563@qq.com',1,'CD13849C286D42F583BE507E94A1C8584E675C214FA24CB194079C293BD9CD87');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-17 21:52:12