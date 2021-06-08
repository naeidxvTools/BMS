/*
Navicat MySQL Data Transfer

Source Server         : 阿里云
Source Server Version : 50173
Source Host           : 106.14.247.164:3306
Source Database       : goods

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2020-12-27 09:56:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `adminId` char(32) NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `adminpwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('a1', '展龙', 'zl113592');

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
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
) ENGINE=InnoDB AUTO_INCREMENT=637 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('0001E4D0AAF848CD83C4C70B08047EF6', '船舶涂装技术', '', '16.20', '16.20', '10.0', '《船舶涂装技术》编写组', '', '1', '268', '0', '', '16', 'CB-120/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-120_w.jpg', 'book_img/CB-120_b.jpg', '153');
INSERT INTO `t_book` VALUES ('004D76DB45E249C6AAEC7E216B9A26D0', '初级船舶电工操作技能', '杨石林', '9.00', '9.00', '10.0', '哈尔滨工程大学', '2005-3', '1', '95', '0', '2005-3', '16', 'CB-007', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CB-007_w.jpg', 'book_img/CB-007_b.jpg', '8');
INSERT INTO `t_book` VALUES ('00653F8AC5914EC883D05FD99DC24C87', '空调制冷安装调试手册', '李金川编', '65.00', '65.00', '10.0', '中国建筑工业出版社', '2006', '1', '550', '0', '2006', '16', 'CBX-012', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-012_w.jpg', 'book_img/CBX-012_b.jpg', '511');
INSERT INTO `t_book` VALUES ('00FF93F2762545F3AC074FDA2E4DD4EA', '制冷与空调自动控制技术', '徐红升主编', '28.00', '28.00', '10.0', '电子工业出版社', '2008', '1', '298', '0', '2008', '16', 'CBX-014', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-014_w.jpg', 'book_img/CBX-014_b.jpg', '513');
INSERT INTO `t_book` VALUES ('019B9089CE354F2EA4BAF54D4D651167', '制冷与空调作业安全技术问答', '唐纬,朱兆华编著', '20.00', '20.00', '10.0', '化学工业出版社', '2009-05', '1', '259', '0', '2009-05', '16', 'CBX-020', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-020_w.jpg', 'book_img/CBX-020_b.jpg', '519');
INSERT INTO `t_book` VALUES ('01A9573401A944C5888F1C6BA31DAD8A', '焊接冶金学', '张文钺', '35.00', '35.00', '10.0', '机械工业出版社', '2014-6', '1', '316', '0', '2014-6', '16', 'CB-201/1', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-201_w.jpg', 'book_img/CB-201_b.jpg', '249');
INSERT INTO `t_book` VALUES ('02357F5CA24E477A870CA68A4CB52518', '船舶辅机试题解答', '吴晓光主编', '35.00', '35.00', '10.0', '大连海事大学出版社', '2000', '1', '298', '0', '2000', '16', 'CBX-091', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-091_w.jpg', 'book_img/CBX-091_b.jpg', '587');
INSERT INTO `t_book` VALUES ('03F8F938A495485F8741C44598791ADB', '初级船体装配工工艺学', '金仲达', '9.50', '9.50', '10.0', '哈尔滨工程大学', '2006-3', '1', '111', '0', '2006-3', '16', 'CB-005', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-005_w.jpg', 'book_img/CB-005_b.jpg', '6');
INSERT INTO `t_book` VALUES ('03FB91A2B88A44AA8FA6B7953DC3BA29', '船舶概论', '熊仕涛', '20.00', '20.00', '10.0', '哈尔滨工程大学', '2006-9', '1', '186', '0', '2006-9', '16', 'CB-100', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-100_w.jpg', 'book_img/CB-100_b.jpg', '128');
INSERT INTO `t_book` VALUES ('041192FFCA954E4A9A35A5A5E009B924', '轮机化学', '谢盛法,周立新主编', '18.00', '18.00', '10.0', '大连海事大学出版社', '1999-01', '1', '174', '0', '1999-01', '16', 'CBX-124', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-124_w.jpg', 'book_img/CBX-124_b.jpg', '620');
INSERT INTO `t_book` VALUES ('0562B8C4CF0F45628535945E5BE5A740', '柴油机喷油泵、调速器及喷油器的使用、调整与维修', '刘希恭主编', '19.50', '19.50', '10.0', '机械工业出版社', '2008', '1', '372', '0', '2008', '16', 'CBX-032', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-032_w.jpg', 'book_img/CBX-032_b.jpg', '531');
INSERT INTO `t_book` VALUES ('05ED5E13A54940989B9A9717FB6443B4', '电焊工（初级、中级、高级）', '《职业技能鉴定教程》《职业技能鉴定指导》编审委员会', '17.40', '17.40', '10.0', '中国劳动出版社', '2013-2', '1', '180', '0', '2013-2', '16', 'CB-199/2', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-199_w.jpg', 'book_img/CB-199_b.jpg', '244');
INSERT INTO `t_book` VALUES ('063EF5C755334672BE76B1AFA637A9F3', '暖通空调设计与计算方法', '顾洁主编', '22.00', '22.00', '10.0', '化学工业出版社', '2007', '1', '144', '0', '2007', '16', 'CBX-053', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-053_w.jpg', 'book_img/CBX-053_b.jpg', '551');
INSERT INTO `t_book` VALUES ('0652F82FE47A4C52B3D71FF9373F0C0F', '船舶轮机（英文版）', '', null, null, '10.0', '', '', '1', '360', '0', '', '16', 'CB-047', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-047_w.jpg', 'book_img/CB-047_b.jpg', '55');
INSERT INTO `t_book` VALUES ('07A77655952A433795513D55FD2E2495', '船舶工程导论', '刘善平', '45.00', '45.00', '10.0', '人民交通', '2010-6', '1', '318', '0', '2010-6', '16', 'CB-163/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-163_w.jpg', 'book_img/CB-163_b.jpg', '206');
INSERT INTO `t_book` VALUES ('089CEE097ADC4F63BAE83FB711EEEE09', '《船体生产设计》课程设计指导和案例', '赵虹等', '14.10', '14.10', '10.0', '江苏科技大学', '2007-4', '1', '178', '0', '2007-4', '16', 'CB-061/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-061-1_w.jpg', 'book_img/CB-061-1_b.jpg', '77');
INSERT INTO `t_book` VALUES ('0A5AFDAF0FF0416A8ECC720AA3EB0911', '轮机长业务', '詹玉龙,张兴芝主编', '42.00', '42.00', '10.0', '人民交通出版社', '2007-10', '1', '367', '0', '2007-10', '16', 'CBX-122', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-122_w.jpg', 'book_img/CBX-122_b.jpg', '618');
INSERT INTO `t_book` VALUES ('0AB375BF732D40C986B7466849212DC2', '船舶电工操作技能', '杨石林', '16.50', '16.50', '10.0', '哈尔滨工程大学', '2003-6', '1', '193', '0', '2003-6', '16', 'CB-006', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CB-006_w.jpg', 'book_img/CB-006_b.jpg', '7');
INSERT INTO `t_book` VALUES ('0BA8F99087FC4728A9EC0950E53729E8', '船舶制造基础', '杨敏', '19.00', '19.00', '10.0', '国防工业', '', '1', '192', '0', '', '16', 'CB-128/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-128-1_w.jpg', 'book_img/CB-128-1_b.jpg', '166');
INSERT INTO `t_book` VALUES ('0BB318A931B14DD7987784C4013B089A', '金属材料焊接工艺', '李荣雪', '24.00', '24.00', '10.0', '机械工业出版社', '2011-1', '1', '196', '0', '2011-1', '16', 'CB-183', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-183_w.jpg', 'book_img/CB-183_b.jpg', '227');
INSERT INTO `t_book` VALUES ('0BDBFC5392DD4AB99142605586C3C458', '船舶性能试验技术', '郝亚平', '16.10', '16.10', '10.0', '国防工业', '', '1', '190', '0', '', '16', 'CB-127/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-127_w.jpg', 'book_img/CB-127_b.jpg', '164');
INSERT INTO `t_book` VALUES ('0D2D8CBB14274987B043E5BFF6CB86B2', '船舶机电基础', '倪依纯', '17.00', '17.00', '10.0', '人民交通', '2007-1', '1', '134', '0', '2007-1', '16', 'CB-195', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-195_w.jpg', 'book_img/CB-195_b.jpg', '239');
INSERT INTO `t_book` VALUES ('0DA9836A13A5410EA326ADDB744A9AEC', '船舶电气安装工艺', '黄问贵,许建平主编', '27.00', '27.00', '10.0', '化学工业出版社', '2008-08', '1', '233', '0', '2008-08', '16', 'CBX-113', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-113_w.jpg', 'book_img/CBX-113_b.jpg', '609');
INSERT INTO `t_book` VALUES ('0E8D3282E34C4361944CF98F9E39185A', '船舶除锈涂装工', '沈子玉', '18.00', '18.00', '10.0', '国防工业', '2008-7', '1', '160', '0', '2008-7', '16', 'CB-095', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-095_w.jpg', 'book_img/CB-095_b.jpg', '123');
INSERT INTO `t_book` VALUES ('10AE668A48EA4D8DBD2401802DC9D978', '船舶与海洋工程概论', '谢祚水', '13.00', '13.00', '10.0', '国防工业', '', '1', '228', '0', '', '16', 'CB-064/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-064_w.jpg', 'book_img/CB-064_b.jpg', '83');
INSERT INTO `t_book` VALUES ('10C2171E38B44260BE3C9654A4D417B5', '《船舶设计原理》课程设计指导书', '谢云平', '1.70', '1.70', '10.0', '江苏科技大学船舶与海洋工程学院', '2006-12', '1', null, '0', '2006-12', '16', 'CB-056/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-056-1_w.jpg', 'book_img/CB-056-1_b.jpg', '67');
INSERT INTO `t_book` VALUES ('10C2B6F6798F4172802826C696ED8C90', '船舶工程导论', '刘善平', '45.00', '45.00', '10.0', '人民交通', '2010-6', '1', '318', '0', '2010-6', '16', 'CB-163/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-163_w.jpg', 'book_img/CB-163_b.jpg', '207');
INSERT INTO `t_book` VALUES ('11BBEE75503C482A809CBEA33D837966', '户式中央空调安装维修实用手册', '姚国琦,寿炜炜主编', '43.00', '43.00', '10.0', '机械工业出版社', '2006', '1', '409', '0', '2006', '16', 'CBX-011', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-011_w.jpg', 'book_img/CBX-011_b.jpg', '510');
INSERT INTO `t_book` VALUES ('135AD304BD884843B289A715ECD5F798', '舱室设计', '孙庭秀', '13.00', '13.00', '10.0', '哈尔滨工程大学', '2006-3', '1', '141', '0', '2006-3', '16', 'CB-105', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-105_w.jpg', 'book_img/CB-105_b.jpg', '134');
INSERT INTO `t_book` VALUES ('13B0610C2C104B33A4033B7FA053D39F', '焊接结构学', '方洪渊', '32.00', '32.00', '10.0', '机械工业出版社', '2009-6', '1', '317', '0', '2009-6', '16', 'CB-203/4', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-203_w.jpg', 'book_img/CB-203_b.jpg', '262');
INSERT INTO `t_book` VALUES ('143E1CA545F14B8A95A162D1C89600E6', '船舶电工工艺', '郑恳，张德孝', '22.00', '22.00', '10.0', '哈尔滨工程大学', '2006-9', '1', '206', '0', '2006-9', '16', 'CB-104', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-104_w.jpg', 'book_img/CB-104_b.jpg', '133');
INSERT INTO `t_book` VALUES ('14B5B8BBD0974394876B37728791B7F5', '钣金工艺学（中级)', '陶长根', '19.50', '19.50', '10.0', '哈尔滨工程大学', '1989-12', '1', '270', '0', '1989-12', '16', 'CB-012', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-012_w.jpg', 'book_img/CB-012_b.jpg', '13');
INSERT INTO `t_book` VALUES ('152E577DB4FA41D9B0D1864C8D969AED', '船舶焊接工工艺学（中级）', '忻鼎乾，苪树祥', '35.00', '35.00', '10.0', '哈尔滨工程大学', '2006-6', '1', '411', '0', '2006-6', '16', 'CB-150', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '192');
INSERT INTO `t_book` VALUES ('15839A8CE3E2428495DA0B28D82B1C7D', '船舶动力装置', '刘兴永', '22.00', '22.00', '10.0', '人民交通', '2006-8', '1', '177', '0', '2006-8', '16', 'CB-154', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CB-154_w.jpg', 'book_img/CB-154_b.jpg', '196');
INSERT INTO `t_book` VALUES ('1658CBF8658448C59B2B08AE9518C702', '船舶结构与性能实验指导书（结构部分）', '', '2.40', '2.40', '10.0', '江苏科技大学船海学院', '2006-01', '1', '25', '0', '2006-01', '16', 'CB-053/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-053-2_w.jpg', 'book_img/CB-053-2_b.jpg', '63');
INSERT INTO `t_book` VALUES ('16BA37CA8297467E98F5FA9EA01DC8F0', '通风与空气调节工程', '徐勇', '27.00', '27.00', '10.0', '机械工业出版社', '2011-7', '1', '297', '0', '2011-7', '16', 'CB-177', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CB-177_w.jpg', 'book_img/CB-177_b.jpg', '221');
INSERT INTO `t_book` VALUES ('17BFA2D9276F40E1B201628B905031FA', '《船体生产设计》课程设计指导和案例', '赵虹等', '14.10', '14.10', '10.0', '江苏科技大学', '2007-4', '1', '178', '0', '2007-4', '16', 'CB-061/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-061-2_w.jpg', 'book_img/CB-061-2_b.jpg', '78');
INSERT INTO `t_book` VALUES ('1B6E8EBCA07E4A6F8ECB20B584C13F0C', '轮机专业船舶航行认识实习', '王克,甘念重主编', '30.00', '30.00', '10.0', '武汉理工大学出版社', '2009-04', '1', '214', '0', '2009-04', '16', 'CBX-131', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-131_w.jpg', 'book_img/CBX-131_b.jpg', '627');
INSERT INTO `t_book` VALUES ('1BB5D5547360427B8C0BBAD62D71989F', '船文化', '席龙飞,宋颖著', '68.00', '68.00', '10.0', '人民交通出版社', '2008-08', '1', '395', '0', '2008-08', '16', 'CBX-068', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CBX-068_w.jpg', 'book_img/CBX-068_b.jpg', '564');
INSERT INTO `t_book` VALUES ('1CA737D170C44A49A104B051F816767C', '船舶舾装工程', '刁玉锋', '26.00', '26.00', '10.0', '哈尔滨工程大学', '2006-9', '1', '251', '0', '2006-9', '16', 'CB-109', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '138');
INSERT INTO `t_book` VALUES ('1CE4C0ECE22148F1AFB017630AE241C1', '实用焊接工艺手册', '王洪光', '39.00', '39.00', '10.0', '化学工业出版社', '2010-3', '1', '524', '0', '2010-3', '16', 'CB-145', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-145_w.jpg', 'book_img/CB-145_b.jpg', '187');
INSERT INTO `t_book` VALUES ('1CF5445B97F04C34883A1BD32333764A', '柴油机喷油系统', '邓东密,邓萍编著', '39.80', '39.80', '10.0', '机械工业出版社', '2009-07', '1', '288', '0', '2009-07', '16', 'CBX-033', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-033_w.jpg', 'book_img/CBX-033_b.jpg', '532');
INSERT INTO `t_book` VALUES ('1D618A67FBB14721ADCFC7AD8FCFA47B', '船舶结构力学', '陈铁云，陈伯真', '17.20', '17.20', '10.0', '上海交通大学', '', '1', '319', '0', '', '16', 'CB-124', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-124_w.jpg', 'book_img/CB-124_b.jpg', '160');
INSERT INTO `t_book` VALUES ('1EDEE9C4A4734ACDAA0EF7989280D9AC', '高级焊工工艺与技能训练', '胡煌辉主编', '29.00', '29.00', '10.0', '中国劳动社会保障出版社', '2007', '1', '300', '0', '2007', '16', 'CBX-023', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CBX-023_w.jpg', 'book_img/CBX-023_b.jpg', '522');
INSERT INTO `t_book` VALUES ('1FC9D891C38244A5AFCB20E990A5BB43', '焊工操作技巧集锦100例', '范绍林', '25.00', '25.00', '10.0', '化学工业出版社', '2008-1', '1', '329', '0', '2008-1', '16', 'CB-142', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-142_w.jpg', 'book_img/CB-142_b.jpg', '184');
INSERT INTO `t_book` VALUES ('1FCD82E2E28A4FE3AF9869048A52CEA3', '船舶结构与性能实验指导书（结构部分）', '', '2.40', '2.40', '10.0', '江苏科技大学船海学院', '2006-01', '1', '25', '0', '2006-01', '16', 'CB-053/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-053-1_w.jpg', 'book_img/CB-053-1_b.jpg', '62');
INSERT INTO `t_book` VALUES ('210830309AC74F28B0D76BF609497C28', '船舶材料与焊接', '曾平', '23.00', '23.00', '10.0', '哈尔滨工程大学', '2006-9', '1', '217', '0', '2006-9', '16', 'CB-108', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '137');
INSERT INTO `t_book` VALUES ('2226D6E260CC404A9052BFE676966234', '管路附件设计选用手册', '周明衡,常德功主编', '150.00', '150.00', '10.0', '化学工业出版社', '2004', '1', '1167', '0', '2004', '16', 'CBX-025', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-025_w.jpg', 'book_img/CBX-025_b.jpg', '524');
INSERT INTO `t_book` VALUES ('227BF592FC9747638E178529825F956D', '金属工艺学', '王英杰，张芙丽', '30.00', '30.00', '10.0', '机械工业出版社', '2010-8', '1', '266', '0', '2010-8', '16', 'CB-179', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-179_w.jpg', 'book_img/CB-179_b.jpg', '223');
INSERT INTO `t_book` VALUES ('2464AAE5065643BBAF226FED2310A6CB', '船舶电站', '丛培亭主编', '25.00', '25.00', '10.0', '人民交通出版社', '2006', '1', '211', '0', '2006', '16', 'CBX-099', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-099_w.jpg', 'book_img/CBX-099_b.jpg', '595');
INSERT INTO `t_book` VALUES ('2495A7E76ADC4E0EA15B36CCE4E61839', '船舶设计教学手册', '华乃导', '72.00', '72.00', '10.0', '中国标准', '1999-2', '1', '746', '0', '1999-2', '16', 'CB-148', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-148_w.jpg', 'book_img/CB-148_b.jpg', '190');
INSERT INTO `t_book` VALUES ('24AE6CF10BAE4E8E87AC28E993BDB9A8', '焊接冶金学', '张文钺', '35.00', '35.00', '10.0', '机械工业出版社', '2014-6', '1', '316', '0', '2014-6', '16', 'CB-201/2', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-201_w.jpg', 'book_img/CB-201_b.jpg', '250');
INSERT INTO `t_book` VALUES ('24CE05565ABE411986A0A467D4760FCF', '航海仪器', '杨在金主编', '38.00', '38.00', '10.0', '大连海事大学出版社', '1998', '1', '322', '0', '1998', '16', 'CBX-114', '9AF0184F04364D5DA378FD386434628E', 'book_img/CBX-114_w.jpg', 'book_img/CBX-114_b.jpg', '610');
INSERT INTO `t_book` VALUES ('24F8FAC94FDA480CA4A41D8CF1F29A46', '《模型试验技术》实验指导书', '施奇，杨大明', '1.70', '1.70', '10.0', '江苏科技大学船舶与海洋工程学院', '2006-4', '1', '16', '0', '2006-4', '16', 'CB-055/2', '65640549B80E40B1981CDEC269BFFCAD', 'book_img/CB-055-2_w.jpg', 'book_img/CB-055-2_b.jpg', '66');
INSERT INTO `t_book` VALUES ('2560C13D695D45EF9EFC60D75FE22E54', '变频器从原理到完全应用', '龚仲华编著', '59.00', '59.00', '10.0', '人民邮电出版社', '2009-10', '1', '578', '0', '2009-10', '16', 'CBX-045', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-045_w.jpg', 'book_img/CBX-045_b.jpg', '544');
INSERT INTO `t_book` VALUES ('269214D75E7641D38581D7EFA106C319', '船用材料与加工工艺', '顾善明', '14.70', '14.70', '10.0', '人民交通', '2002-7', '1', '184', '0', '2002-7', '16', 'CB-116', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-116_w.jpg', 'book_img/CB-116_b.jpg', '145');
INSERT INTO `t_book` VALUES ('27381049EA084BAABEB0A8A5F4D662D4', '船体建造与修理工艺', '华乃导', '28.50', '28.50', '10.0', '人民交通', '2004-3', '1', '363', '0', '2004-3', '16', 'CB-034', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-034_w.jpg', 'book_img/CB-034_b.jpg', '41');
INSERT INTO `t_book` VALUES ('2A20E9538E7C4EA3AD033AC34D029102', '造船生产自动化', '吴天俊', '3.30', '3.30', '10.0', '国防大学', '1991-4', '1', '190', '0', '1991-4', '16', 'CB-015', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-015_w.jpg', 'book_img/CB-015_b.jpg', '16');
INSERT INTO `t_book` VALUES ('2A7CDEDD347747059995302861F92E20', '船舶与海洋工程材料', '姜锡瑞', '15.00', '15.00', '10.0', '哈尔滨工程大学', '2000-4', '1', '179', '0', '2000-4', '16', 'CB-022', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-022_w.jpg', 'book_img/CB-022_b.jpg', '26');
INSERT INTO `t_book` VALUES ('2A80C10A4EBA4C0081DF2B34D99FB0BE', '船舶信号', '赵邦良编', '9.00', '9.00', '10.0', '大连海事大学出版社', '2000', '1', '90', '0', '2000', '16', 'CBX-121', '9AF0184F04364D5DA378FD386434628E', 'book_img/CBX-121_w.jpg', 'book_img/CBX-121_b.jpg', '617');
INSERT INTO `t_book` VALUES ('2B4E202F4B8D4DFB98C55FDF5D8E6215', '船舶电力拖动', '宋谦', '28.00', '28.00', '10.0', '哈尔滨工程大学', '2006-8', '1', '274', '0', '2006-8', '16', 'CB-107', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-107_w.jpg', 'book_img/CB-107_b.jpg', '136');
INSERT INTO `t_book` VALUES ('2B8D374512654F9D82D9C41C7A122240', '焊接结构生产', '李莉', '25.00', '25.00', '10.0', '机械工业出版社', '2011-2', '1', '199', '0', '2011-2', '16', 'CB-185', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-185_w.jpg', 'book_img/CB-185_b.jpg', '229');
INSERT INTO `t_book` VALUES ('2BA5D7F17E0D46CF84B52E5E18CF2E75', '柴油发动机维修技术300问', '张金柱，韩玉敏', '28.00', '28.00', '10.0', '化学工业出版社', '2008-9', '1', '325', '0', '2008-9', '16', 'CB-137', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-137_w.jpg', 'book_img/CB-137_b.jpg', '178');
INSERT INTO `t_book` VALUES ('2BDED3E0BFC447B7BCDB6E5E21D299B6', '熔焊方法及设备', '王宗杰', '28.00', '28.00', '10.0', '机械工业出版社', '2014-1', '1', '327', '0', '2014-1', '16', 'CB-202/3', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-202_w.jpg', 'book_img/CB-202_b.jpg', '255');
INSERT INTO `t_book` VALUES ('2C2C4830DA814D4294FE6C1F745C5678', '主推进动力装置', '傅克阳主编', '35.00', '35.00', '10.0', '人民交通出版社', '2000', '1', '274', '0', '2000', '16', 'CBX-085', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-085_w.jpg', 'book_img/CBX-085_b.jpg', '581');
INSERT INTO `t_book` VALUES ('2C3A135166754D58B0C6774EA937A8F6', '造船生产技术', '黄广茂', '23.00', '23.00', '10.0', '哈尔滨工程大学', '2007-2', '1', '239', '0', '2007-2', '16', 'CB-025', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-025_w.jpg', 'book_img/CB-025_b.jpg', '29');
INSERT INTO `t_book` VALUES ('2C6E35F6133E4F7E91F6CEA7ABEECF8C', '船舶避碰与值班', '吴兆麟主编', '31.00', '31.00', '10.0', '大连海事大学出版社', '2008-08', '1', '278', '0', '2008-08', '16', 'CBX-118', '9AF0184F04364D5DA378FD386434628E', 'book_img/CBX-118_w.jpg', 'book_img/CBX-118_b.jpg', '614');
INSERT INTO `t_book` VALUES ('2D2300E257274CF1AED19A81305614FD', '船体制图', '杨永祥等', '15.50', '15.50', '10.0', '哈尔滨工程大学', '1995-11', '1', '178', '0', '1995-11', '16', 'CB-021/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '24');
INSERT INTO `t_book` VALUES ('2F7A91F39D454612979477F378128351', '船体结构制作实训指导', '傅晓斌', '9.00', '9.00', '10.0', '哈尔滨工程大学', '2007-9', '1', '59', '0', '2007-9', '16', 'CB-087', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-087_w.jpg', 'book_img/CB-087_b.jpg', '115');
INSERT INTO `t_book` VALUES ('2F8A7B427EE242218A7C4A23BC15A57D', '新编GMDSS普通操作员教程', '刘红屏,王化民主编', '34.00', '34.00', '10.0', '大连海事大学出版社', '2005', '1', '295', '0', '2005', '16', 'CBX-128', '9AF0184F04364D5DA378FD386434628E', 'book_img/CBX-128_w.jpg', 'book_img/CBX-128_b.jpg', '624');
INSERT INTO `t_book` VALUES ('30575C592B8546659249BA360F2BC309', '海上无线电通信', '乔文明,邓术章,韩光显主编', '19.00', '19.00', '10.0', '大连海事大学出版社', '2005', '1', '212', '0', '2005', '16', 'CBX-117', '9AF0184F04364D5DA378FD386434628E', 'book_img/CBX-117_w.jpg', 'book_img/CBX-117_b.jpg', '613');
INSERT INTO `t_book` VALUES ('30A56DF249CA417AA86FE6FBCEA68FEC', '船舶结构与设备管理', '谢世平主编', '33.00', '33.00', '10.0', '人民交通出版社', '2004', '1', '251', '0', '2004', '16', 'CBX-071', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CBX-071_w.jpg', 'book_img/CBX-071_b.jpg', '567');
INSERT INTO `t_book` VALUES ('313D34106E234B2099ED2D6E203004CD', '供热、通风、空调和制冷工程', '英国皇家屋宇装备工程师学会(CIBSE)发布;李', '98.00', '98.00', '10.0', '重庆大学出版社', '2008-07', '1', '590', '0', '2008-07', '16', 'CBX-054', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-054_w.jpg', 'book_img/CBX-054_b.jpg', '552');
INSERT INTO `t_book` VALUES ('31419A0A9EDE4F619F857D078C84E6EB', '结构试验技术实验指导书', '孙培林', '9.30', '9.30', '10.0', '华东船舶工业学院一系', '2002-9', '1', '133', '0', '2002-9', '16', 'CB-129/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-129_w.jpg', 'book_img/CB-129_b.jpg', '168');
INSERT INTO `t_book` VALUES ('31BEB9703657423BAB26C7715D59D9B4', '焊工 ', '杨佩时', '35.00', '35.00', '10.0', '化学工业出版社', '2011-1', '1', '237', '0', '2011-1', '16', 'CB-147', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-147_w.jpg', 'book_img/CB-147_b.jpg', '189');
INSERT INTO `t_book` VALUES ('3265D1E7FDAB49D19E6204EFB2B10917', '商船建造（英文版）', '', '12.90', '12.90', '10.0', '', '', '1', '231', '0', '', '16', 'CB-118/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-118_w.jpg', 'book_img/CB-118_b.jpg', '149');
INSERT INTO `t_book` VALUES ('329E09D9086D456AAA09D675FEEA103C', '熔焊方法及设备', '王宗杰', '28.00', '28.00', '10.0', '机械工业出版社', '2014-1', '1', '327', '0', '2014-1', '16', 'CB-202/4', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-202_w.jpg', 'book_img/CB-202_b.jpg', '256');
INSERT INTO `t_book` VALUES ('34385F9B4C5240E2B0F04BE3D74F908B', '金属材料及热处理', '高朝祥', '15.00', '15.00', '10.0', '化学工业出版社', '2007-1', '1', '202', '0', '2007-1', '16', 'CB-144', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-144_w.jpg', 'book_img/CB-144_b.jpg', '186');
INSERT INTO `t_book` VALUES ('345BB041E6CF4A50AC7345451BCAAC2E', '船舶切割工', '何汉武，陈叶华', '15.00', '15.00', '10.0', '国防工业', '2008-7', '1', '120', '0', '2008-7', '16', 'CB-094', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-094_w.jpg', 'book_img/CB-094_b.jpg', '122');
INSERT INTO `t_book` VALUES ('352DACF5658F44A789D75528BFA8262F', '结构试验技术实验指导书', '孙培林', '9.30', '9.30', '10.0', '华东船舶工业学院一系', '2002-9', '1', '133', '0', '2002-9', '16', 'CB-129/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-129_w.jpg', 'book_img/CB-129_b.jpg', '169');
INSERT INTO `t_book` VALUES ('353432FBCFC84458B5309F0F78F98BD3', '电焊工（初级、中级、高级）', '《职业技能鉴定教程》《职业技能鉴定指导》编审委员会', '17.40', '17.40', '10.0', '中国劳动出版社', '2013-2', '1', '180', '0', '2013-2', '16', 'CB-199/1', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-199_w.jpg', 'book_img/CB-199_b.jpg', '243');
INSERT INTO `t_book` VALUES ('372107CBD8264B74809CB5D27F661D49', '泵类设备维修问答', '中国机械工程学会设备与维修工程分会《机械设备维修问答丛书》编委会', '35.00', '35.00', '10.0', '机械工业出版社', '2007', '1', '359', '0', '2007', '16', 'CBX-134', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-134_w.jpg', 'book_img/CBX-134_b.jpg', '630');
INSERT INTO `t_book` VALUES ('3730EEE1354249A68984C6B6931FA34B', '工程力学', '张何阳，李立新', '28.00', '28.00', '10.0', '哈尔滨工程大学', '2007-2', '1', '247', '0', '2007-2', '16', 'CB-023', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-023_w.jpg', 'book_img/CB-023_b.jpg', '27');
INSERT INTO `t_book` VALUES ('379AD37FB54C453498A7ABC641834EC9', '船体结构（第三版）', '吴仁元等', '10.30', '10.30', '10.0', '国防工业', '', '1', '174', '0', '', '16', 'CB-071', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-071_w.jpg', 'book_img/CB-071_b.jpg', '96');
INSERT INTO `t_book` VALUES ('3879248928EA4720A8433A2FB4F54979', '能源动力装置CAD技术', '蒋炎坤编著', '28.00', '28.00', '10.0', '国防工业出版社', '2007-4', '1', '270', '0', '2007-4', '16', 'CBX-030', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-030_w.jpg', 'book_img/CBX-030_b.jpg', '529');
INSERT INTO `t_book` VALUES ('38EF22817C3941FA95F95E5B1F0E78DE', '船舶柴油机试题解答', '杜荣铭,陈景杰主编', '53.00', '53.00', '10.0', '大连海事大学出版社', '2000', '1', '411', '0', '2000', '16', 'CBX-086', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-086_w.jpg', 'book_img/CBX-086_b.jpg', '582');
INSERT INTO `t_book` VALUES ('3948671C4D434FCD97155262ACEC6B78', '造船工艺学习题（放样部分）', '', '2.00', '2.00', '10.0', '', '', '1', '10', '0', '', '16', 'CB-052/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-052_w.jpg', 'book_img/CB-052_b.jpg', '61');
INSERT INTO `t_book` VALUES ('3962CEEE4F6A402085C6C16AA06F902A', '焊接结构制造工艺及实施', '朱小兵，张祥生', '30.00', '30.00', '10.0', '机械工业出版社', '2011-1', '1', '267', '0', '2011-1', '16', 'CB-182', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-182_w.jpg', 'book_img/CB-182_b.jpg', '226');
INSERT INTO `t_book` VALUES ('39F4660206A74014870185F1559D7849', '动力管道设计手册', '《动力管道设计手册》编写组编', '105.00', '105.00', '10.0', '机械工业出版社', '2006', '1', '932', '0', '2006', '16', 'CBX-065', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-065_w.jpg', 'book_img/CBX-065_b.jpg', '561');
INSERT INTO `t_book` VALUES ('3B11051E957B4453AA1E9765C00C15D4', '船舶焊接工工艺学', '陈倩倩', '16.00', '16.00', '10.0', '哈尔滨工程大学', '2005-9', '1', '212', '0', '2005-9', '16', 'CB-013', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-013_w.jpg', 'book_img/CB-013_b.jpg', '14');
INSERT INTO `t_book` VALUES ('3BC7FCF037F74AB6AF542D78E1E11358', '金属熔焊原理及材料焊接', '邱葭菲', '35.00', '35.00', '10.0', '机械工业出版社', '2011-7', '1', '288', '0', '2011-7', '16', 'CB-180', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-180_w.jpg', 'book_img/CB-180_b.jpg', '224');
INSERT INTO `t_book` VALUES ('3C53A7E6951B41A1AC7C38B0B3F2F396', '电机状态监测与故障诊断', '马宏忠著', '128.00', '128.00', '10.0', '机械工业出版社', '2008-03', '1', '1022', '0', '2008-03', '16', 'CBX-042', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-042_w.jpg', 'book_img/CBX-042_b.jpg', '541');
INSERT INTO `t_book` VALUES ('3DC162F9732F440A8885E3C076F8F0A3', '工程热力学', '章学来', '42.00', '42.00', '10.0', '人民交通', '2011-3', '1', '285', '0', '2011-3', '16', 'CB-166', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CB-166_w.jpg', 'book_img/CB-166_b.jpg', '210');
INSERT INTO `t_book` VALUES ('3DC8EDA73AA8400498FE970386BB8B3B', '看图学修柴油机喷油泵/调速器', '赵新房编著', '35.00', '35.00', '10.0', '人民邮电出版社', '2009-01', '1', '275', '0', '2009-01', '16', 'CBX-034', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-034_w.jpg', 'book_img/CBX-034_b.jpg', '533');
INSERT INTO `t_book` VALUES ('3E6645DC38EA4AE1A92ED63E1EF41CAC', '船舶与海洋工程本科专业《船舶结构设计》指导书', '尹群等', '1.70', '1.70', '10.0', '江苏科技大学', '2007-12', '1', '6', '0', '2007-12', '16', 'CB-126/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-126-1_w.jpg', 'book_img/CB-126-1_b.jpg', '162');
INSERT INTO `t_book` VALUES ('3FAF50EB998945E5A99642F04EF6DB1E', '船舶设计原理', '顾敏童', '29.00', '29.00', '10.0', '上海交通大学', '1988-7', '1', '277', '0', '1988-7', '16', 'CB-030/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-030_w.jpg', 'book_img/CB-030_b.jpg', '36');
INSERT INTO `t_book` VALUES ('403A6AEE0A9144A994C846B0A5D65E6A', '船舶建造工艺学', '徐兆康', '23.00', '23.00', '10.0', '人民交通', '2000-5', '1', '242', '0', '2000-5', '16', 'CB-146', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CB-146_w.jpg', 'book_img/CB-146_b.jpg', '188');
INSERT INTO `t_book` VALUES ('40A50E81D1E942808928193657E0D668', '船舶建造质量检验', '陆俊岫', '35.00', '35.00', '10.0', '哈尔滨工程大学', '', '1', '480', '0', '', '16', 'CB-070/2', '65640549B80E40B1981CDEC269BFFCAD', 'book_img/CB-070_w.jpg', 'book_img/CB-070_b.jpg', '95');
INSERT INTO `t_book` VALUES ('40BBB481C3574447808E6E449E2C9574', '港口电气设备', '季本山主编', '18.00', '18.00', '10.0', '人民交通出版社', '2006', '1', '137', '0', '2006', '16', 'CBX-133', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-133_w.jpg', 'book_img/CBX-133_b.jpg', '629');
INSERT INTO `t_book` VALUES ('41531A47C85647A68426997D0845054F', '《船舶设计原理》课程设计指导书', '谢云平', '1.70', '1.70', '10.0', '江苏科技大学船舶与海洋工程学院', '2006-12', '1', null, '0', '2006-12', '16', 'CB-056/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-056-2_w.jpg', 'book_img/CB-056-2_b.jpg', '68');
INSERT INTO `t_book` VALUES ('422C6DC5B787465CBA01B46B1A3466E9', '轮机自动化', '李世臣主编', '71.00', '71.00', '10.0', '大连海事大学出版社', '2008-10', '1', '414', '0', '2008-10', '16', 'CBX-077', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-077_w.jpg', 'book_img/CBX-077_b.jpg', '573');
INSERT INTO `t_book` VALUES ('44C5A68B0B7242EF8CBA9443454397D1', '船体装配工艺', '王云梯', '26.50', '26.50', '10.0', '哈尔滨工程大学', '1994-10', '1', '315', '0', '1994-10', '16', 'CB-003', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CB-003_w.jpg', 'book_img/CB-003_b.jpg', '4');
INSERT INTO `t_book` VALUES ('45CC6BA385EF4DFC9947EEB4AB504B7D', '中央空调清洗技术', '张学发主编', '30.00', '30.00', '10.0', '化学工业出版社', '2008-07', '1', '385', '0', '2008-07', '16', 'CBX-009', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-009_w.jpg', 'book_img/CBX-009_b.jpg', '508');
INSERT INTO `t_book` VALUES ('460D36FAD4D54FFAA3E1D16A703814AC', 'AutoCAD 2009电气设计', '舒飞,李华等编著', '59.00', '59.00', '10.0', '机械工业出版社', '2009-01', '1', '504', '0', '2009-01', '16', 'CBX-037', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-037_w.jpg', 'book_img/CBX-037_b.jpg', '536');
INSERT INTO `t_book` VALUES ('4616BAB8CD254957A303C5295DBA01E5', '焊接结构学', '方洪渊', '32.00', '32.00', '10.0', '机械工业出版社', '2009-6', '1', '317', '0', '2009-6', '16', 'CB-203/2', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-203_w.jpg', 'book_img/CB-203_b.jpg', '260');
INSERT INTO `t_book` VALUES ('4617BA2B39364AD5B256C16CDB68E43D', '制冷设备维修工（中级）鉴定培训教材', '李援瑛', '23.00', '23.00', '10.0', '机械工业出版社', '2010-1', '1', '290', '0', '2010-1', '16', 'CB-186', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CB-186_w.jpg', 'book_img/CB-186_b.jpg', '230');
INSERT INTO `t_book` VALUES ('46E7337C1BFE4F2CBBB8AF6928F71F73', '船体制图', '杨永祥等', '15.50', '15.50', '10.0', '哈尔滨工程大学', '1995-11', '1', '178', '0', '1995-11', '16', 'CB-021/3', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-021-3_w.jpg', 'book_img/CB-021-3_b.jpg', '25');
INSERT INTO `t_book` VALUES ('47FEA703374D406F883DA672A462CE2B', '玻璃钢制品手工成型工艺', '邹宁宇', '39.00', '39.00', '10.0', '化学工业出版社', '2006-2', '1', '607', '0', '2006-2', '16', 'CB-193', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CB-193_w.jpg', 'book_img/CB-193_b.jpg', '237');
INSERT INTO `t_book` VALUES ('4A1DA275C1D44084837CE09CB9DE2164', '船体放样实训指导', '何志标', '20.00', '20.00', '10.0', '哈尔滨工程大学', '2008-1', '1', '168', '0', '2008-1', '16', 'CB-086', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-086_w.jpg', 'book_img/CB-086_b.jpg', '114');
INSERT INTO `t_book` VALUES ('4A327EAA53F44231B1962B0ED00C409A', '船舶涂装技术', '', '16.20', '16.20', '10.0', '《船舶涂装技术》编写组', '', '1', '268', '0', '', '16', 'CB-120/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-120_w.jpg', 'book_img/CB-120_b.jpg', '152');
INSERT INTO `t_book` VALUES ('4A37F364BB304DD2A997372E0695E160', 'AutoCAD2006中文版标准教程', '胡仁喜', '39.00', '39.00', '10.0', '科学出版社', '2005-9', '1', '433', '0', '2005-9', '16', 'CB-097', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CB-097_w.jpg', 'book_img/CB-097_b.jpg', '125');
INSERT INTO `t_book` VALUES ('4A6B69F4A391454BB40C8D2A9F912CA9', '船舶修造职业危害与防护', '蒋德志', '30.00', '30.00', '10.0', '人民交通', '2011-1', '1', '185', '0', '2011-1', '16', 'CB-161', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-161_w.jpg', 'book_img/CB-161_b.jpg', '203');
INSERT INTO `t_book` VALUES ('4A6FF47D983A474099725DAF72EEE98B', '船体结构与强度设计', '刘向东', '28.00', '28.00', '10.0', '人民交通', '2006-12', '1', '242', '0', '2006-12', '16', 'CB-155', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-155_w.jpg', 'book_img/CB-155_b.jpg', '197');
INSERT INTO `t_book` VALUES ('4B2A50BDAB414E0D80BF8927172F277A', '焊接质量管理与检验', '曾金传', '28.00', '28.00', '10.0', '机械工业出版社', '2012-2', '1', '197', '0', '2012-2', '16', 'CB-184', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-184_w.jpg', 'book_img/CB-184_b.jpg', '228');
INSERT INTO `t_book` VALUES ('4B5493DCAAB544D6B68723D381908B18', '船体装配操作技能', '曹峰', '13.00', '13.00', '10.0', '哈尔滨工程大学', '1994-10', '1', '162', '0', '1994-10', '16', 'CB-004', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-004_w.jpg', 'book_img/CB-004_b.jpg', '5');
INSERT INTO `t_book` VALUES ('4BBFDF72214446C993061D65531540B8', '船舶柴油机及安装', '王福根', '30.00', '30.00', '10.0', '哈尔滨工程大学', '2004-7', '1', '262', '0', '2004-7', '16', 'CB-083', '34000D7FB55E49D9A6B1B2C59F472AFA', 'book_img/CB-083_w.jpg', 'book_img/CB-083_b.jpg', '111');
INSERT INTO `t_book` VALUES ('4F6974BA864B4F4FA0E5F4E8E8A9B263', '造船成组技术', '陈彬', '18.00', '18.00', '10.0', '哈尔滨工程大学', '2007-2', '1', '151', '0', '2007-2', '16', 'CB-103/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-103_w.jpg', 'book_img/CB-103_b.jpg', '132');
INSERT INTO `t_book` VALUES ('4F6CBB96DC304D658FED237DFEF3F51F', '制冷原理与设备', '李晓东主编', '28.00', '28.00', '10.0', '机械工业出版社', '2007-02', '1', '278', '0', '2007-02', '16', 'CBX-008', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-008_w.jpg', 'book_img/CBX-008_b.jpg', '507');
INSERT INTO `t_book` VALUES ('4F7569B9DC59469A9723E3C2A2613173', '造船生产设计', '中国船舶工业总公司造船       生产设计指导组', '18.00', '18.00', '10.0', '武汉船舶职业技术学院翻印', '1989-2', '1', '353', '0', '1989-2', '16', 'CB-038', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-038_w.jpg', 'book_img/CB-038_b.jpg', '45');
INSERT INTO `t_book` VALUES ('50A11A58C25A40D297F7AB0A552F3C62', '船体CAD∕CAM', '彭辉', '28.00', '28.00', '10.0', '人民交通', '2007-1', '1', '236', '0', '2007-1', '16', 'CB-073/3', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-073_w.jpg', 'book_img/CB-073_b.jpg', '100');
INSERT INTO `t_book` VALUES ('5142DFCE052B426AA57FA83931F098DA', '焊接冶金学', '张文钺', '35.00', '35.00', '10.0', '机械工业出版社', '2014-6', '1', '316', '0', '2014-6', '16', 'CB-201/3', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-201_w.jpg', 'book_img/CB-201_b.jpg', '251');
INSERT INTO `t_book` VALUES ('523B51B3967F478FBFDD13AEB9750382', '船舶涂装与船体检验（英文版）', '', null, null, '10.0', '', '', '1', '431', '0', '', '16', 'CB-041', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-041_w.jpg', 'book_img/CB-041_b.jpg', '49');
INSERT INTO `t_book` VALUES ('52518FDFA88545C59D42AAD643A5EACA', '船体CAD∕CAM', '彭辉', '28.00', '28.00', '10.0', '人民交通', '2007-1', '1', '236', '0', '2007-1', '16', 'CB-073/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-073_w.jpg', 'book_img/CB-073_b.jpg', '99');
INSERT INTO `t_book` VALUES ('5380D4C8BD7A4E8E84EBE2AC099EB851', '高级船舶管系工工艺学（技师）', '刘光亚', '12.00', '12.00', '10.0', '哈尔滨工程大学', '2005-1', '1', '142', '0', '2005-1', '16', 'CB-014', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CB-014_w.jpg', 'book_img/CB-014_b.jpg', '15');
INSERT INTO `t_book` VALUES ('54D0078DBB2F4E2BBAC2C2A9102063DC', '造船CAD∕CAM实训指导', '彭辉', '26.00', '26.00', '10.0', '哈尔滨工程大学', '2007-10', '1', '237', '0', '2007-10', '16', 'CB-085', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-085_w.jpg', 'book_img/CB-085_b.jpg', '113');
INSERT INTO `t_book` VALUES ('55E398C251194C6D98434F21EB6330CD', '船舶管系工识图', '叶添法,罗延华,施福章编', '15.80', '15.80', '10.0', '哈尔滨工程大学出版社', '1994-08', '1', '128', '0', '1994-08', '16', 'CBX-096', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-096_w.jpg', 'book_img/CBX-096_b.jpg', '592');
INSERT INTO `t_book` VALUES ('580E0F7D315645CFBE739E40D665A223', '船舶设计基础', '蔡厚平', '23.00', '23.00', '10.0', '哈尔滨工程大学', '2006-9', '1', '221', '0', '2006-9', '16', 'CB-102', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-102_w.jpg', 'book_img/CB-102_b.jpg', '130');
INSERT INTO `t_book` VALUES ('588DC68228A24E51992226426FDF80C4', '超视距雷达技术', '周文瑜,焦培南等编著', '76.00', '76.00', '10.0', '电子工业出版社', '2008-08', '1', '559', '0', '2008-08', '16', 'CBX-046', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-046_w.jpg', 'book_img/CBX-046_b.jpg', '545');
INSERT INTO `t_book` VALUES ('59490F29EE8F44719B9D01B93B88AEB6', '初级船舶气割工工艺学', '曹光海，韩云枢', '12.00', '12.00', '10.0', '哈尔滨工程大学', '2007-2', '1', '85', '0', '2007-2', '16', 'CB-018', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-018_w.jpg', 'book_img/CB-018_b.jpg', '19');
INSERT INTO `t_book` VALUES ('59D343B162A74F88820C420B851A89A1', '民用建筑空调设计', '马最良,姚杨主编', '60.00', '60.00', '10.0', '化学工业出版社', '2003', '1', '443', '0', '2003', '16', 'CBX-061', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-061_w.jpg', 'book_img/CBX-061_b.jpg', '558');
INSERT INTO `t_book` VALUES ('59FA5D5CC27E497F9D6388BB48B6FC27', '船舶概论', '金仲达主编', '28.00', '28.00', '10.0', '哈尔滨工程大学出版社', '2002-03', '1', '231', '0', '2002-03', '16', 'CBX-067', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CBX-067_w.jpg', 'book_img/CBX-067_b.jpg', '563');
INSERT INTO `t_book` VALUES ('5A31E89F405B4A129A9467A835D0B33C', '计算机辅助船舶设计', '邹劲等主编', '20.00', '20.00', '10.0', '哈尔滨工程大学出版社', '2002', '1', '242', '0', '2002', '16', 'CBX-069', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CBX-069_w.jpg', 'book_img/CBX-069_b.jpg', '565');
INSERT INTO `t_book` VALUES ('5C7072392CD8450787506E0FF4C93783', '船舶结构与设备', '王忠', '15.00', '15.00', '10.0', '人民交通', '2002-7', '1', '185', '0', '2002-7', '16', 'CB-020/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-020_w.jpg', 'book_img/CB-020_b.jpg', '21');
INSERT INTO `t_book` VALUES ('5DEC845C4E754A2A8FEEC79A58128ACD', '造船成组技术', '陈彬', '18.00', '18.00', '10.0', '哈尔滨工程大学', '2007-2', '1', '151', '0', '2007-2', '16', 'CB-103/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-103_w.jpg', 'book_img/CB-103_b.jpg', '131');
INSERT INTO `t_book` VALUES ('5ED48B4D55364FB28969CC1710692AAE', '船舶修造安全概论', '周明顺', '40.00', '40.00', '10.0', '人民交通', '2011-1', '1', '289', '0', '2011-1', '16', 'CB-162/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-162_w.jpg', 'book_img/CB-162_b.jpg', '204');
INSERT INTO `t_book` VALUES ('5FB6FD1F356F4F22B51FE1B5AC76C206', '船舶电气工程概论', '陈胜林等', '14.00', '14.00', '10.0', '哈尔滨工程大学', '2007-1', '1', '109', '0', '2007-1', '16', 'CB-016', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CB-016_w.jpg', 'book_img/CB-016_b.jpg', '17');
INSERT INTO `t_book` VALUES ('5FCE244E713A456CB57C63A3D37C4252', '管道安装工程手册', '张金和主编', '148.00', '148.00', '10.0', '机械工业出版社', '2006-08', '1', '1442', '0', '2006-08', '16', 'CBX-066', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-066_w.jpg', 'book_img/CBX-066_b.jpg', '562');
INSERT INTO `t_book` VALUES ('6041BDEB9B894E44B58D48EAA2227E9C', '焊接结构学', '方洪渊', '32.00', '32.00', '10.0', '机械工业出版社', '2009-6', '1', '317', '0', '2009-6', '16', 'CB-203/5', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-203_w.jpg', 'book_img/CB-203_b.jpg', '263');
INSERT INTO `t_book` VALUES ('60B377E46ADA4D7EA100D9D3441FC674', '质量管理体系内部审核及文件编写', '田武编著', '45.00', '45.00', '10.0', '中国计量出版社', '2009-08', '1', '321', '0', '2009-08', '16', 'CBX-001', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-001_w.jpg', 'book_img/CBX-001_b.jpg', '500');
INSERT INTO `t_book` VALUES ('63364AE7F150484783040C38A97A7A8A', '船体制图（含图册）', '', '65.00', '65.00', '10.0', '国防工业', '', '1', '305', '0', '', '16', 'CB-067/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-067-2_w.jpg', 'book_img/CB-067-2_b.jpg', '88');
INSERT INTO `t_book` VALUES ('633A00A201E744C3ACEF1E32B7DF6A46', '初级船舶气割工工艺学', '曹先海，韩云枢', '12.00', '12.00', '10.0', '哈尔滨工程大学', '2007-2', '1', '85', '0', '2007-2', '16', 'CB-092', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-092_w.jpg', 'book_img/CB-092_b.jpg', '120');
INSERT INTO `t_book` VALUES ('64074316723544E78E4C4A7E9C663470', '工程船', '', '22.70', '22.70', '10.0', '国防工业', '', '1', '541', '0', '', '16', 'CB-121/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-121_w.jpg', 'book_img/CB-121_b.jpg', '154');
INSERT INTO `t_book` VALUES ('66AADF60FD1449B0A08BA5D974A230C8', '实验室和检查机构资质认定工作手册', '国家质量监督检验检疫总局[编]', '36.00', '36.00', '10.0', '中国计量出版社', '2008-01', '1', '191', '0', '2008-01', '16', 'CBX-002', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-002_w.jpg', 'book_img/CBX-002_b.jpg', '501');
INSERT INTO `t_book` VALUES ('6711D8F54BAC4D78A974E8F8A397D717', '船舶设计原理（修订本）', '林杰人', '12.20', '12.20', '10.0', '国防工业', '', '1', '241', '0', '', '16', 'CB-068/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-068_w.jpg', 'book_img/CB-068_b.jpg', '91');
INSERT INTO `t_book` VALUES ('677AF79D04BB41C0800E1A81DF2AA127', '计算机船舶绘图操作', '彭辉', '10.20', '10.20', '10.0', '人民交通', '2002-9', '1', '124', '0', '2002-9', '16', 'CB-089', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-089_w.jpg', 'book_img/CB-089_b.jpg', '117');
INSERT INTO `t_book` VALUES ('678302589DC6472EA697C3590FA769D7', '船体建造测量与数据处理技术', '叶家玮', '22.00', '22.00', '10.0', '华南理工大学', '2001-12', '1', '220', '0', '2001-12', '16', 'CB-037', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-037_w.jpg', 'book_img/CB-037_b.jpg', '44');
INSERT INTO `t_book` VALUES ('6817630302F9442CB25BB67600C1C580', '船舶工程专业英语', '黄德波', '17.50', '17.50', '10.0', '哈尔滨工程大学', '2001-8', '1', '280', '0', '2001-8', '16', 'CB-191', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-191_w.jpg', 'book_img/CB-191_b.jpg', '235');
INSERT INTO `t_book` VALUES ('68A38B1B13B943E4BB33A94FF00CB79D', '船体冷加工', '金鹏华', '18.00', '18.00', '10.0', '国防工业', '2008-7', '1', '142', '0', '2008-7', '16', 'CB-132', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-132_w.jpg', 'book_img/CB-132_b.jpg', '173');
INSERT INTO `t_book` VALUES ('6A6A408E6FE044B381B50AA3F50261CD', '智能传感器数据采集与信号处理', '(乌克兰)N. V. 基里阿纳基(Nikolay V. Kiri', '35.00', '35.00', '10.0', '化学工业出版社', '2006', '1', '212', '0', '2006', '16', 'CBX-047', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-047_w.jpg', 'book_img/CBX-047_b.jpg', '546');
INSERT INTO `t_book` VALUES ('6AD2AEC41DA94F728BAF4F149CFB9851', '船舶原理', '刘雪梅', '23.00', '23.00', '10.0', '哈尔滨工程大学', '2005-2', '1', '233', '0', '2005-2', '16', 'CB-024', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-024_w.jpg', 'book_img/CB-024_b.jpg', '28');
INSERT INTO `t_book` VALUES ('6AEAE69BFF974411936C65DCA72B560A', '船舶概论', '张德孝', '28.00', '28.00', '10.0', '化学工业出版社', '2010-9', '1', '209', '0', '2010-9', '16', 'CB-133', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-133_w.jpg', 'book_img/CB-133_b.jpg', '174');
INSERT INTO `t_book` VALUES ('6B51ED374C54435FA8FA8C7113D40D9E', '船舶焊接工艺', '王鸿斌', '24.00', '24.00', '10.0', '人民交通', '2007-2', '1', '205', '0', '2007-2', '16', 'CB-075', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '103');
INSERT INTO `t_book` VALUES ('6C4AE7AE5F2E49BAB9A97D23527438C1', '船体结构强度直接计算指南', '', '3.10', '3.10', '10.0', '北京', '2001', '1', null, '0', '2001', '16', 'CB-057/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-057-2_w.jpg', 'book_img/CB-057-2_b.jpg', '70');
INSERT INTO `t_book` VALUES ('6E6C2A8EFCBF486EA5E77840495FCEA5', '船舶概论', '邓召庭', '16.00', '16.00', '10.0', '人民交通', '2006-6', '1', '127', '0', '2006-6', '16', 'CB-153', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-153_w.jpg', 'book_img/CB-153_b.jpg', '195');
INSERT INTO `t_book` VALUES ('6FE3FEE217584983A93F2B9337ECA62A', '船舶建造工艺', '魏莉洁', '15.00', '15.00', '10.0', '哈尔滨工程大学', '2006-4', '1', '125', '0', '2006-4', '16', 'CB-074', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-074_w.jpg', 'book_img/CB-074_b.jpg', '102');
INSERT INTO `t_book` VALUES ('703E2A7A294F45B88F571569670CBAC0', '船舶与海洋工程概论', '谢祚水', '13.00', '13.00', '10.0', '国防工业', '', '1', '228', '0', '', '16', 'CB-064/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-064_w.jpg', 'book_img/CB-064_b.jpg', '84');
INSERT INTO `t_book` VALUES ('710B0E54FD474EFA831ACFDF0D2F035D', '船体结构强度直接计算指南', '', '3.10', '3.10', '10.0', '北京', '2001', '1', null, '0', '2001', '16', 'CB-057/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-057-1_w.jpg', 'book_img/CB-057-1_b.jpg', '69');
INSERT INTO `t_book` VALUES ('711ECC56117E447AA2ECAAA51BC7FDEC', '熔焊方法及设备', '王宗杰', '28.00', '28.00', '10.0', '机械工业出版社', '2014-1', '1', '327', '0', '2014-1', '16', 'CB-202/5', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-202_w.jpg', 'book_img/CB-202_b.jpg', '257');
INSERT INTO `t_book` VALUES ('722F77FBE15F4760B6F1C28FFFB8EEB6', '船体装配工', '施克菲', '29.00', '29.00', '10.0', '国防工业', '2008-6', '1', '249', '0', '2008-6', '16', 'CB-088', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '116');
INSERT INTO `t_book` VALUES ('7279081258314B49A7EA9BEEF262A173', '船舶电气设备管理与工艺', '赵殿礼主编', '21.00', '21.00', '10.0', '大连海事大学出版社', '2004', '1', '214', '0', '2004', '16', 'CBX-110', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-110_w.jpg', 'book_img/CBX-110_b.jpg', '606');
INSERT INTO `t_book` VALUES ('72E03D68CC93404290E4DDD9E9EBE053', '船舶生产设计', '周启学', '19.00', '19.00', '10.0', '人民交通', '2006-12', '1', '151', '0', '2006-12', '16', 'CB-157', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-157_w.jpg', 'book_img/CB-157_b.jpg', '199');
INSERT INTO `t_book` VALUES ('73355A044B634EA79144A57AE3999814', '空气调节用制冷技术', '彦启森等编著', '20.00', '20.00', '10.0', '中国建筑工业出版社', '2004', '1', '215', '0', '2004', '16', 'CBX-021', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-021_w.jpg', 'book_img/CBX-021_b.jpg', '520');
INSERT INTO `t_book` VALUES ('7360E2D5095F4BC9B3CD09476FCFD4B0', '船舶原理（上册）', '盛振邦，刘应中', '31.00', '31.00', '10.0', '上海交通大学', '2003-9', '1', '342', '0', '2003-9', '16', 'CB-031', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-031_w.jpg', 'book_img/CB-031_b.jpg', '38');
INSERT INTO `t_book` VALUES ('75513952839146ACB682AE80AE677684', '工程制图习题集', '石娟', '16.00', '16.00', '10.0', '人民交通', '2012-1', '1', '63', '0', '2012-1', '16', 'CB-165', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-165_w.jpg', 'book_img/CB-165_b.jpg', '209');
INSERT INTO `t_book` VALUES ('7597DE75ACC24A9D8A302B300F96DB89', '现代船舶制造技术基础', '马晓平等', '17.70', '17.70', '10.0', '江苏科技大学', '', '1', '356', '0', '', '16', 'CB-072', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-072_w.jpg', 'book_img/CB-072_b.jpg', '97');
INSERT INTO `t_book` VALUES ('75B5600B5E6F498D9BA613B631A340C8', '船舶电气的运行与维护(英文版）', '赵洪江', null, null, '10.0', '江苏科技大学船舶与海洋工程学院', '2005-12', '1', '138', '0', '2005-12', '16', 'CB-044', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-044_w.jpg', 'book_img/CB-044_b.jpg', '52');
INSERT INTO `t_book` VALUES ('75FE49DE30E74B648294FA3260FDF1E4', '船舶动力装置技术管理', '许乐平,詹玉龙主编', '30.00', '30.00', '10.0', '大连海事大学出版社', '2006', '1', '292', '0', '2006', '16', 'CBX-075', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-075_w.jpg', 'book_img/CBX-075_b.jpg', '571');
INSERT INTO `t_book` VALUES ('762AF1C276A44AE9BE001252DFB26E6B', '流体机械基础', '王正伟主编', '18.00', '18.00', '10.0', '清华大学出版社', '2006', '1', '158', '0', '2006', '16', 'CBX-028', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-028_w.jpg', 'book_img/CBX-028_b.jpg', '527');
INSERT INTO `t_book` VALUES ('76459291234E408B871985CE41392095', '船舶概论', '金仲达', '19.50', '19.50', '10.0', '哈尔滨工程大学', '2002-3', '1', '231', '0', '2002-3', '16', 'CB-001/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-001_w.jpg', 'book_img/CB-001_b.jpg', '1');
INSERT INTO `t_book` VALUES ('76B2EC58BCB94D3D9102C5D678E416BD', '电机原理与设计的MATLAB分析', '(美)Jimmie J. Cathey著;戴文进译', '39.00', '39.00', '10.0', '电子工业出版社', '2006', '1', '418', '0', '2006', '16', 'CBX-039', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-039_w.jpg', 'book_img/CBX-039_b.jpg', '538');
INSERT INTO `t_book` VALUES ('76CAC1EAA1F1451CB7C29FEEB75EA4B5', '船体制图（含图册）', '', '65.00', '65.00', '10.0', '国防工业', '', '1', '305', '0', '', '16', 'CB-067/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-067-1_w.jpg', 'book_img/CB-067-1_b.jpg', '87');
INSERT INTO `t_book` VALUES ('770EF647115C4B1FAE5BC0B0DC34AAFC', '焊工', '中华人民共和国人力资源和社会保障部制定', '8.00', '8.00', '10.0', '中国劳动社会保障出版社', '2013-7', '1', '116', '0', '2013-7', '16', 'CB-200/3', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-200_w.jpg', 'book_img/CB-200_b.jpg', '248');
INSERT INTO `t_book` VALUES ('772A3963600C41FCB3A082CF39206810', '计算机辅助船舶设计', '陈宾康，董元胜', '14.40', '14.40', '10.0', '国防工业', '', '1', '241', '0', '', '16', 'CB-122/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-122_w.jpg', 'book_img/CB-122_b.jpg', '157');
INSERT INTO `t_book` VALUES ('7835F43EC25B4EE99CF662C62BCB32C2', '高级船舶钳工工艺学', '孟宪举', '19.80', '19.80', '10.0', '哈尔滨工程大学', '2002-11', '1', '229', '0', '2002-11', '16', 'CB-008', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-008_w.jpg', 'book_img/CB-008_b.jpg', '9');
INSERT INTO `t_book` VALUES ('79FE944A592C46B1AA1B2DCDA5449FCA', '轮机自动化常识', '吕建明编', '10.00', '10.00', '10.0', '大连海事大学出版社', '2001', '1', '92', '0', '2001', '16', 'CBX-078', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-078_w.jpg', 'book_img/CBX-078_b.jpg', '574');
INSERT INTO `t_book` VALUES ('7AC9CE06E0F74724ACF4B42D58D54F4E', '制冷与空调技术', '沈雅钧编', '28.00', '28.00', '10.0', '北京大学出版社', '2008', '1', '204', '0', '2008', '16', 'CBX-013', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-013_w.jpg', 'book_img/CBX-013_b.jpg', '512');
INSERT INTO `t_book` VALUES ('7B0666025EC64049B2D52A60C613DA18', '实用供热空调设计手册（上下册）', '陆耀庆主编', '350.00', '350.00', '10.0', '中国建筑工业出版社', '2008', '1', '2685', '0', '2008', '16', 'CBX-137', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '633');
INSERT INTO `t_book` VALUES ('7BA56E1C0B3342E897579C8CB92B6E8C', '运输统计学', '余思勤', '36.00', '36.00', '10.0', '人民交通', '2011-1', '1', '225', '0', '2011-1', '16', 'CB-169', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CB-169_w.jpg', 'book_img/CB-169_b.jpg', '213');
INSERT INTO `t_book` VALUES ('7BA6C65C62DB40BE839F6B95C60BC081', '工业管道及阀门维修问答', '中国机械工程学会设备与维修工程分会《机械设备维修问答丛书》编委会', '56.00', '56.00', '10.0', '机械工业出版社', '2009', '1', '438', '0', '2009', '16', 'CBX-139', '9AF0184F04364D5DA378FD386434628E', 'book_img/CBX-139_w.jpg', 'book_img/CBX-139_b.jpg', '635');
INSERT INTO `t_book` VALUES ('7BC002F7AA2A43E7936B55273783061A', '船舶与海洋工程专业英语', '陆伟东，连琏', '28.00', '28.00', '10.0', '上海交通大学', '2009-4', '1', '162', '0', '2009-4', '16', 'CB-190', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '234');
INSERT INTO `t_book` VALUES ('7C70383DB4354E66805B717E13E338C9', '造船工艺学习题（放样部分）', '', '2.00', '2.00', '10.0', '', '', '1', '10', '0', '', '16', 'CB-052/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-052_w.jpg', 'book_img/CB-052_b.jpg', '60');
INSERT INTO `t_book` VALUES ('7F1A20213E584E8DA6A9106C4CA0EAA8', '船舶结构与设备', '王忠', '15.00', '15.00', '10.0', '人民交通', '2002-7', '1', '185', '0', '2002-7', '16', 'CB-020/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-020_w.jpg', 'book_img/CB-020_b.jpg', '22');
INSERT INTO `t_book` VALUES ('7F60640F63BF45C6ADF9BFCFF9E1CCBD', '焊接质量检测', '乌日根主编', '23.00', '23.00', '10.0', '化学工业出版社', '2009-01', '1', '188', '0', '2009-01', '16', 'CBX-024', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CBX-024_w.jpg', 'book_img/CBX-024_b.jpg', '523');
INSERT INTO `t_book` VALUES ('810326D7440C4999B0837D4A34C44C04', '工程制图测绘及技能实训指导', '李奉香', '10.00', '10.00', '10.0', '哈尔滨工程大学', '2007-8', '1', '72', '0', '2007-8', '16', 'CB-098', '65640549B80E40B1981CDEC269BFFCAD', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '126');
INSERT INTO `t_book` VALUES ('8261170A756840A99BABA40A7A62FC45', '船体修造工艺', '王鸿斌', '42.00', '42.00', '10.0', '人民交通', '2006-8', '1', '388', '0', '2006-8', '16', 'CB-027/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-027-1_w.jpg', 'book_img/CB-027-1_b.jpg', '31');
INSERT INTO `t_book` VALUES ('834E5942889A4EE3B5D9BB8E248E1423', '船舶电机与电气控制系统', '孙旭清,何吉庆主编', '28.00', '28.00', '10.0', '大连海事大学出版社', '2005', '1', '273', '0', '2005', '16', 'CBX-107', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-107_w.jpg', 'book_img/CBX-107_b.jpg', '603');
INSERT INTO `t_book` VALUES ('83F508205CC7493B9AD18F44D7BEA2A3', '统计学', '余思勤', '45.00', '45.00', '10.0', '人民交通', '2011-1', '1', '285', '0', '2011-1', '16', 'CB-168', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CB-168_w.jpg', 'book_img/CB-168_b.jpg', '212');
INSERT INTO `t_book` VALUES ('86FA69192ED247968659808782433D00', '商船建造（英文版）第一版', '', null, null, '10.0', '', '', '1', '231', '0', '', '16', 'CB-049', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '57');
INSERT INTO `t_book` VALUES ('87E1B644C95547AE9953261B0ADD28A1', '船舶电工工艺技能实训指导', '鲍军晖', '10.00', '10.00', '10.0', '哈尔滨工程大学', '2007-8', '1', '64', '0', '2007-8', '16', 'CB-076', '65640549B80E40B1981CDEC269BFFCAD', 'book_img/CB-076_w.jpg', 'book_img/CB-076_b.jpg', '104');
INSERT INTO `t_book` VALUES ('8958D3E343404F83A0C2EFEC96EB25E0', '船舶静力学课程辅导', '周宏', '3.20', '3.20', '10.0', '江苏科技大学船舶与海洋工程学院', '', '1', null, '0', '', '16', 'CB-058/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-058-1_w.jpg', 'book_img/CB-058-1_b.jpg', '71');
INSERT INTO `t_book` VALUES ('8973BFEA8F994A42B9FEC62537C07680', '船舶信号', '闫世杰', '25.00', '25.00', '10.0', '人民交通', '2006-7', '1', '206', '0', '2006-7', '16', 'CB-198', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CB-198_w.jpg', 'book_img/CB-198_b.jpg', '242');
INSERT INTO `t_book` VALUES ('8A4A1770695B4368939DA04E2E8DBB41', '船舶焊接（修订本）', '孙维善', '12.70', '12.70', '10.0', '国防工业', '', '1', '198', '0', '', '16', 'CB-062/1', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-062-1_w.jpg', 'book_img/CB-062-1_b.jpg', '79');
INSERT INTO `t_book` VALUES ('8AAF6E464882419A86863416D9489FA2', '制冷学科进展研究与发展报告', '王如竹主编', '72.00', '72.00', '10.0', '科学出版社', '2007-4', '1', '650', '0', '2007-4', '16', 'CBX-019', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-019_w.jpg', 'book_img/CBX-019_b.jpg', '518');
INSERT INTO `t_book` VALUES ('8B4C5D1566354C2FB01116E82D24D15B', '船舶信号与VHF通信', '魏云雨主编', '12.00', '12.00', '10.0', '大连海事大学出版社', '2008-08', '1', '99', '0', '2008-08', '16', 'CBX-120', '9AF0184F04364D5DA378FD386434628E', 'book_img/CBX-120_w.jpg', 'book_img/CBX-120_b.jpg', '616');
INSERT INTO `t_book` VALUES ('8D68A46CBD694789AAA009474739410E', '船舶结构与设备', '李伟主编', '29.00', '29.00', '10.0', '大连海事大学出版社', '2008-08', '1', '259', '0', '2008-08', '16', 'CBX-073', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CBX-073_w.jpg', 'book_img/CBX-073_b.jpg', '569');
INSERT INTO `t_book` VALUES ('8DC476686D3545148D9C2A8331D0606D', '船舶设备与系统', '刁玉锋', '23.00', '23.00', '10.0', '哈尔滨工程大学', '2006-12', '1', '204', '0', '2006-12', '16', 'CB-106', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-106_w.jpg', 'book_img/CB-106_b.jpg', '135');
INSERT INTO `t_book` VALUES ('8DCF8D8F03DF45E2B57BB62216E571F9', '船体CAD∕CAM', '彭辉', '28.00', '28.00', '10.0', '人民交通', '2007-1', '1', '236', '0', '2007-1', '16', 'CB-073/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-073_w.jpg', 'book_img/CB-073_b.jpg', '98');
INSERT INTO `t_book` VALUES ('8EC5750794434BD4838519E0185837F9', '船舶静力学课程辅导', '周宏', '3.20', '3.20', '10.0', '江苏科技大学船舶与海洋工程学院', '', '1', null, '0', '', '16', 'CB-058/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-058-2_w.jpg', 'book_img/CB-058-2_b.jpg', '72');
INSERT INTO `t_book` VALUES ('8F7849AB510C497194F1FD15AE841563', 'Word 2007文档处理百练成精', '卓越科技编著', '59.00', '59.00', '10.0', '电子工业出版社', '2009-03', '1', '415', '0', '2009-03', '16', 'CBX-049', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-049_w.jpg', 'book_img/CBX-049_b.jpg', '548');
INSERT INTO `t_book` VALUES ('8F8CF8961DDB4EE7858E43703D161A96', '冷库制冷工艺设计', '李敏主编', '42.00', '42.00', '10.0', '机械工业出版社', '2009-08', '1', '373', '0', '2009-08', '16', 'CBX-017', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-017_w.jpg', 'book_img/CBX-017_b.jpg', '516');
INSERT INTO `t_book` VALUES ('8F9CF2AC677D4420884BA49721F3A433', '船舶结构与设备', '夏国忠主编', '31.00', '31.00', '10.0', '大连海事大学出版社', '1998', '1', '221', '0', '1998', '16', 'CBX-072', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CBX-072_w.jpg', 'book_img/CBX-072_b.jpg', '568');
INSERT INTO `t_book` VALUES ('901FB700402F47049B507323AF4EF6A5', '制冷压缩机与设备', '朱立', '26.00', '26.00', '10.0', '机械工业出版社', '2011-1', '1', '282', '0', '2011-1', '16', 'CB-176', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CB-176_w.jpg', 'book_img/CB-176_b.jpg', '220');
INSERT INTO `t_book` VALUES ('909E353E784D4432A7129BFBE5676063', '船舶性能实验指导书', '杨大明', '1.50', '1.50', '10.0', '江苏科技大学', '2005-7', '1', '20', '0', '2005-7', '16', 'CB-069/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-069-2_w.jpg', 'book_img/CB-069-2_b.jpg', '93');
INSERT INTO `t_book` VALUES ('914D69E2AA2F4FF8A24F64A39841A6D6', '造船成组技术', '赵东', '10.30', '10.30', '10.0', '江苏科技大学', '2005-6', '1', '158', '0', '2005-6', '16', 'CB-123/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-123_w.jpg', 'book_img/CB-123_b.jpg', '158');
INSERT INTO `t_book` VALUES ('915AE1032A06435D96CFD61C8BA00448', '船舶管路系统', '付锦云', '17.00', '17.00', '10.0', '哈尔滨工程大学', '2006-8', '1', '149', '0', '2006-8', '16', 'CB-113', '34000D7FB55E49D9A6B1B2C59F472AFA', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '142');
INSERT INTO `t_book` VALUES ('919FD648A152479C8599E5EC08793059', '船舶螺旋桨理论与应用', '王国强,童世汤编著', '38.00', '38.00', '10.0', '哈尔滨工程大学出版社', '2007', '1', '392', '0', '2007', '16', 'CBX-095', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-095_w.jpg', 'book_img/CBX-095_b.jpg', '591');
INSERT INTO `t_book` VALUES ('91C1455B5EB74137A32280C1AD71CBA2', '船舶与海洋工程本科专业《船舶结构设计》指导书', '尹群等', '1.70', '1.70', '10.0', '江苏科技大学', '2007-12', '1', '6', '0', '2007-12', '16', 'CB-126/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-126-2_w.jpg', 'book_img/CB-126-2_b.jpg', '163');
INSERT INTO `t_book` VALUES ('92ECA4BAA561490C88934524A513EF7D', '高级船舶除锈涂装工艺', '彭辉，王金鑫', '15.00', '15.00', '10.0', '哈尔滨工程大学', '2006-3', '1', '110', '0', '2006-3', '16', 'CB-017', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-017_w.jpg', 'book_img/CB-017_b.jpg', '18');
INSERT INTO `t_book` VALUES ('934CE20364DB4EF5A0D8D50BEB3706DB', '船体强度与结构设计', '王杰德，杨永谦', '17.90', '17.90', '10.0', '国防工业', '', '1', '334', '0', '', '16', 'CB-063/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-063_w.jpg', 'book_img/CB-063_b.jpg', '81');
INSERT INTO `t_book` VALUES ('936F7F242EA14B4A84D4FFD4D4E07D0A', '柴油机使用与维修技术', '谭影航编著', '28.00', '28.00', '10.0', '机械工业出版社', '2007', '1', '257', '0', '2007', '16', 'CBX-036', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-036_w.jpg', 'book_img/CBX-036_b.jpg', '535');
INSERT INTO `t_book` VALUES ('93F25218735B411B97063D65BF8A0A75', '内燃机及动力装置测试技术', '罗红英主编', '22.00', '22.00', '10.0', '哈尔滨工程大学出版社', '2006-09', '1', '186', '0', '2006-09', '16', 'CBX-031', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-031_w.jpg', 'book_img/CBX-031_b.jpg', '530');
INSERT INTO `t_book` VALUES ('943340DBFB81494A8FFD7520A3ACD7D0', '造船焊接与切割技术', '姜锡瑞', '16.00', '16.00', '10.0', '哈尔滨工程大学', '2002-2', '1', '179', '0', '2002-2', '16', 'CB-093', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '121');
INSERT INTO `t_book` VALUES ('94FFDC413A014A009D215B8BDD75AC1E', 'AutoCAD辅助设计', '沈凌', '25.00', '25.00', '10.0', '人民交通', '2011-4', '1', '157', '0', '2011-4', '16', 'CB-170', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CB-170_w.jpg', 'book_img/CB-170_b.jpg', '214');
INSERT INTO `t_book` VALUES ('951BEA3E184248F2BC5E8982A391FDBF', '船舶与海洋工程材料', '王广戈等', '9.40', '9.40', '10.0', '上海交通大学', '', '1', '177', '0', '', '16', 'CB-119/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-119_w.jpg', 'book_img/CB-119_b.jpg', '151');
INSERT INTO `t_book` VALUES ('9552593373FE4E9DAC93EB988CCF36A4', '船舶原理与结构', '陈雪深等', '16.30', '16.30', '10.0', '上海交通大学', '', '1', '191', '0', '', '16', 'CB-060/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-060-1_w.jpg', 'book_img/CB-060-1_b.jpg', '75');
INSERT INTO `t_book` VALUES ('9574CEA92C68444988B0EF1E5CF967F6', '船舶柴油机', '黄步松,吕凤明主编', '62.00', '62.00', '10.0', '人民交通出版社', '2009-09', '1', '382', '0', '2009-09', '16', 'CBX-089', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-089_w.jpg', 'book_img/CBX-089_b.jpg', '585');
INSERT INTO `t_book` VALUES ('960D260413DC48E2AD702184F92F5CB9', '空调洁净工程安装调试手册', '张学助编著', '99.00', '99.00', '10.0', '机械工业出版社', '2004', '1', '947', '0', '2004', '16', 'CBX-044', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-044_w.jpg', 'book_img/CBX-044_b.jpg', '543');
INSERT INTO `t_book` VALUES ('962023C173864E6F870C3BAFFF1A54E4', '船舶柴油机', '周明顺主编', '32.00', '32.00', '10.0', '大连海事大学出版社', '2006-03', '1', '323', '0', '2006-03', '16', 'CBX-080', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-080_w.jpg', 'book_img/CBX-080_b.jpg', '576');
INSERT INTO `t_book` VALUES ('968F805E3D1745CFB2A5B5E67722C73F', '焊接冶金学', '张文钺', '35.00', '35.00', '10.0', '机械工业出版社', '2014-6', '1', '316', '0', '2014-6', '16', 'CB-201/4', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-201_w.jpg', 'book_img/CB-201_b.jpg', '252');
INSERT INTO `t_book` VALUES ('96CD578D69E9447CB505AA0FEE63FCE1', '电焊工（初级、中级、高级）', '《职业技能鉴定教程》《职业技能鉴定指导》编审委员会', '17.40', '17.40', '10.0', '中国劳动出版社', '2013-2', '1', '180', '0', '2013-2', '16', 'CB-199/3', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-199_w.jpg', 'book_img/CB-199_b.jpg', '245');
INSERT INTO `t_book` VALUES ('97506DB488FE48FDBFD98BAA16B223D2', '船舶设备', '葛云卿等', '16.70', '16.70', '10.0', '哈尔滨船舶工程学院', '', '1', '385', '0', '', '16', 'CB-117/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-117_w.jpg', 'book_img/CB-117_b.jpg', '147');
INSERT INTO `t_book` VALUES ('989DD31A9F904265AD12C9DE79562D54', '船舶电气设备及系统', '郑华耀主编', '32.00', '32.00', '10.0', '大连海事大学出版社', '2005', '1', '329', '0', '2005', '16', 'CBX-105', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-105_w.jpg', 'book_img/CBX-105_b.jpg', '601');
INSERT INTO `t_book` VALUES ('99596D744F014933AA0CB07FF1236694', '液压气动密封件推荐产品及应用案例', '机械工业信息研究院编', '258.00', '258.00', '10.0', '机械工业出版社', '2007', '1', '366', '0', '2007', '16', 'CBX-027', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-027_w.jpg', 'book_img/CBX-027_b.jpg', '526');
INSERT INTO `t_book` VALUES ('996EE9122769494CBE3166839B7F2F36', '《模型试验技术》实验指导书', '施奇，杨大明', '1.70', '1.70', '10.0', '江苏科技大学船舶与海洋工程学院', '2006-4', '1', '16', '0', '2006-4', '16', 'CB-055/1', '65640549B80E40B1981CDEC269BFFCAD', 'book_img/CB-055-1_w.jpg', 'book_img/CB-055-1_b.jpg', '65');
INSERT INTO `t_book` VALUES ('99ED024BFCD643B1A399ECE4C2E44368', '制冷与空气调节技术', '(美)William C. Whitman,(美)William M. Jo', '118.00', '118.00', '10.0', '电子工业出版社', '2008-08', '1', '1098', '0', '2008-08', '16', 'CBX-016', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-016_w.jpg', 'book_img/CBX-016_b.jpg', '515');
INSERT INTO `t_book` VALUES ('9A317444587046CB93A58139EF9DC164', '船体制图（含图册）', '', '65.00', '65.00', '10.0', '国防工业', '', '1', null, '0', '', '16', 'CB-067/3', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-067-1_w.jpg', 'book_img/CB-067-1_b.jpg', '89');
INSERT INTO `t_book` VALUES ('9BD768FD4AFB49CEBE810D3887CF6EE2', '船舶柴油机振动、噪声及废气排放', '胡以怀,应启光主编', '20.00', '20.00', '10.0', '大连海事大学出版社', '2003', '1', '185', '0', '2003', '16', 'CBX-087', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-087_w.jpg', 'book_img/CBX-087_b.jpg', '583');
INSERT INTO `t_book` VALUES ('9C05DF1D5B81472BA02C366BCF668BB3', '船舶轮机工程技术实验与实训指导', '徐立华,左贤华,高世杰主编', '20.00', '20.00', '10.0', '哈尔滨工程大学出版社', '2008', '1', '175', '0', '2008', '16', 'CBX-123', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-123_w.jpg', 'book_img/CBX-123_b.jpg', '619');
INSERT INTO `t_book` VALUES ('9C489422208A408DA807A53DF8B769E5', '船舶修造安全概论', '周明顺', '40.00', '40.00', '10.0', '人民交通', '2011-1', '1', '289', '0', '2011-1', '16', 'CB-162/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-162_w.jpg', 'book_img/CB-162_b.jpg', '205');
INSERT INTO `t_book` VALUES ('9CF7AA17DC974AD587B00B359E3AB30B', '船舶原理与结构', '陈雪深等', '16.30', '16.30', '10.0', '上海交通大学', '', '1', '191', '0', '', '16', 'CB-060/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-060-2_w.jpg', 'book_img/CB-060-2_b.jpg', '76');
INSERT INTO `t_book` VALUES ('9DEC78EF25E8424FA37A4E793C50F453', '船舶仪表及自动化', '张立军主编', '25.00', '25.00', '10.0', '哈尔滨工程大学出版社', '2007-02', '1', '208', '0', '2007-02', '16', 'CBX-098', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-098_w.jpg', 'book_img/CBX-098_b.jpg', '594');
INSERT INTO `t_book` VALUES ('9E02BA5CFFF74C91BA744C12E0590174', '船舶焊接（修订本）', '孙维善', '12.70', '12.70', '10.0', '国防工业', '', '1', '198', '0', '', '16', 'CB-062/2', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-062-2_w.jpg', 'book_img/CB-062-2_b.jpg', '80');
INSERT INTO `t_book` VALUES ('9E1F09596B03438EAE42839D6C104EC7', '高级船舶钳工操作技能', '蒋鲜城等', '13.50', '13.50', '10.0', '哈尔滨工程大学', '2003-3', '1', '158', '0', '2003-3', '16', 'CB-009', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-009_w.jpg', 'book_img/CB-009_b.jpg', '10');
INSERT INTO `t_book` VALUES ('9E3F8F7DFC6641D295E39BF609BE7834', '船舶电站及自动化', '姜锦范编著', '29.00', '29.00', '10.0', '大连海事大学出版社', '2005', '1', '288', '0', '2005', '16', 'CBX-100', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-100_w.jpg', 'book_img/CBX-100_b.jpg', '596');
INSERT INTO `t_book` VALUES ('9ED46ABB44B4481994070E64F98DE791', '船舶辅机', '陈立军主编', '43.00', '43.00', '10.0', '大连海事大学出版社', '2007', '1', '413', '0', '2007', '16', 'CBX-093', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-093_w.jpg', 'book_img/CBX-093_b.jpg', '589');
INSERT INTO `t_book` VALUES ('9F02467DFE054C34B0669E0F584EA4F3', '户式中央空调系统设计与工程实例', '寿炜炜,姚国琦主编', '49.00', '49.00', '10.0', '机械工业出版社', '2005', '1', '477', '0', '2005', '16', 'CBX-010', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-010_w.jpg', 'book_img/CBX-010_b.jpg', '509');
INSERT INTO `t_book` VALUES ('9F68AC02075645808319416ED8021728', '船体强度计算与结构设计', '冯杏娣', '18.00', '18.00', '10.0', '', '', '1', '410', '0', '', '16', 'CB-035', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-035_w.jpg', 'book_img/CB-035_b.jpg', '42');
INSERT INTO `t_book` VALUES ('9F8EFB04505E4D4996D57C1017D38098', '电机及电力拖动', '周定颐主编', '30.00', '30.00', '10.0', '机械工业出版社', '2007-8', '1', '322', '0', '2007-8', '16', 'CBX-040', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-040_w.jpg', 'book_img/CBX-040_b.jpg', '539');
INSERT INTO `t_book` VALUES ('9FAC9776AF5B4A4FA0B7F745FC8599A0', '工程船', '', '22.70', '22.70', '10.0', '国防工业', '', '1', '541', '0', '', '16', 'CB-121/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-121_w.jpg', 'book_img/CB-121_b.jpg', '155');
INSERT INTO `t_book` VALUES ('9FB18731B78644558BB658B63D7B87BE', '船体结构与制图', '彭公武', '27.00', '27.00', '10.0', '哈尔滨工程大学', '2007-2', '1', '231', '0', '2007-2', '16', 'CB-101', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-101_w.jpg', 'book_img/CB-101_b.jpg', '129');
INSERT INTO `t_book` VALUES ('A046505667BD4CAD94FFEE74F753D874', '船舶电工工艺', '郑恳,张德孝主编', '25.00', '25.00', '10.0', '哈尔滨工程大学出版社', '2006-09', '1', '207', '0', '2006-09', '16', 'CBX-108', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-108_w.jpg', 'book_img/CBX-108_b.jpg', '604');
INSERT INTO `t_book` VALUES ('A0F6EFBB9EE54A1D8A289BD44FDF61A5', '船舶电气设备', '林华峰,赵克威,陈胜林编', '16.80', '16.80', '10.0', '哈尔滨工程大学出版社', '2005-12', '1', '137', '0', '2005-12', '16', 'CBX-111', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-111_w.jpg', 'book_img/CBX-111_b.jpg', '607');
INSERT INTO `t_book` VALUES ('A109ACFAF40F4D4F9AB858CE57F5CAB9', '水运管理专业教学标准与课程标准', '蔡佩林，方风平', '25.00', '25.00', '10.0', '人民交通', '2011-6', '1', '123', '0', '2011-6', '16', 'CB-172', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-172_w.jpg', 'book_img/CB-172_b.jpg', '216');
INSERT INTO `t_book` VALUES ('A14BA274E4EF458D9834400E9CCDD2FE', '全国勘察设计注册公用设备工程师暖通空调专业考试复习教材', '全国勘察设计注册工程师公用设备专业管理委', '108.00', '108.00', '10.0', '中国建筑工业出版社', '2006-5', '1', '826', '0', '2006-5', '16', 'CBX-052', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-052_w.jpg', 'book_img/CBX-052_b.jpg', '550');
INSERT INTO `t_book` VALUES ('A197DA2D36614594BD322E893133F270', '船舶柴油机装配调试工艺', '黄政主编', '18.00', '18.00', '10.0', '哈尔滨工程大学出版社', '2006', '1', '166', '0', '2006', '16', 'CBX-081', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-081_w.jpg', 'book_img/CBX-081_b.jpg', '577');
INSERT INTO `t_book` VALUES ('A1A2EF3D3E874B9591D96BA98E44C3A0', '焊接结构学', '方洪渊', '32.00', '32.00', '10.0', '机械工业出版社', '2009-6', '1', '317', '0', '2009-6', '16', 'CB-203/3', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-203_w.jpg', 'book_img/CB-203_b.jpg', '261');
INSERT INTO `t_book` VALUES ('A286C208D4D84B4C9696976FB00FD658', 'GMDSS通信设备', '刘柏森,黄耀倞编著', '13.00', '13.00', '10.0', '大连海事大学出版社', '2005', '1', '130', '0', '2005', '16', 'CBX-126', '9AF0184F04364D5DA378FD386434628E', 'book_img/CBX-126_w.jpg', 'book_img/CBX-126_b.jpg', '622');
INSERT INTO `t_book` VALUES ('A338B6F49E0440D38A525C02F170251A', '修船业务', '韩云生', '22.00', '22.00', '10.0', '人民交通', '2007-1', '1', '177', '0', '2007-1', '16', 'CB-194', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-194_w.jpg', 'book_img/CB-194_b.jpg', '238');
INSERT INTO `t_book` VALUES ('A371E88098C048DA94AE760611B369F2', '船体制图', '杨永祥等', '13.80', '13.80', '10.0', '哈尔滨工程大学', '1995-11', '1', '178', '0', '1995-11', '16', 'CB-021/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-021-1_w.jpg', 'book_img/CB-021-1_b.jpg', '23');
INSERT INTO `t_book` VALUES ('A4589D529BF3431783A75A2F8CEBA21A', '实用铆工手册', '翟洪绪', '39.80', '39.80', '10.0', '化学工业出版社', '2008-5', '1', '776', '0', '2008-5', '16', 'CB-136', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-136_w.jpg', 'book_img/CB-136_b.jpg', '177');
INSERT INTO `t_book` VALUES ('A4768F5F542146EE8CEA9717C2BEE4DA', '船舶结构与制图', '魏莉洁', '38.00', '38.00', '10.0', '人民交通', '2006-8', '1', '322', '0', '2006-8', '16', 'CB-039/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '46');
INSERT INTO `t_book` VALUES ('A573D607EE784BE7984152AF401C1593', '船舶检验', '龙进军', '18.00', '18.00', '10.0', '哈尔滨工程大学', '2006-8', '1', '161', '0', '2006-8', '16', 'CB-131', '65640549B80E40B1981CDEC269BFFCAD', 'book_img/CB-131_w.jpg', 'book_img/CB-131_b.jpg', '172');
INSERT INTO `t_book` VALUES ('A5CBAFD2EF704717A4CA79A8AC823151', '造船生产设计', '', '28.80', '28.80', '10.0', '国防工业', '', '1', '353', '0', '', '16', 'CB-059/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-059_w.jpg', 'book_img/CB-059_b.jpg', '74');
INSERT INTO `t_book` VALUES ('A5DA5CBBE26646BF8E9B282A55FAF27E', '船舶机电基础', '刘强', '20.00', '20.00', '10.0', '哈尔滨工程大学', '2006-9', '1', '183', '0', '2006-9', '16', 'CB-112', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-112_w.jpg', 'book_img/CB-112_b.jpg', '141');
INSERT INTO `t_book` VALUES ('A6A259D82931416685A50A6DD8DD05AA', '船舶修造电气安全技术', '郭祖平', '29.00', '29.00', '10.0', '人民交通', '2011-1', '1', '147', '0', '2011-1', '16', 'CB-160', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-160_w.jpg', 'book_img/CB-160_b.jpg', '202');
INSERT INTO `t_book` VALUES ('A7ACA4D761814261B2DE141EF20733E4', '中央空调工程预算与施工管理', '何耀东主编', '29.00', '29.00', '10.0', '中国建筑工业出版社', '2001', '1', '350', '0', '2001', '16', 'CBX-059', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-059_w.jpg', 'book_img/CBX-059_b.jpg', '557');
INSERT INTO `t_book` VALUES ('A80FB933120D4D59B76AA2D38EC9B027', '船舶概论', '金仲达', '19.50', '19.50', '10.0', '哈尔滨工程大学', '2002-3', '1', '231', '0', '2002-3', '16', 'CB-001/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-001_w.jpg', 'book_img/CB-001_b.jpg', '2');
INSERT INTO `t_book` VALUES ('A90FFCE261464BAFA71315F4A9E08ACD', '船舶柴油机', '朱建元主编', '46.00', '46.00', '10.0', '人民交通出版社', '2008-09', '1', '366', '0', '2008-09', '16', 'CBX-083', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-083_w.jpg', 'book_img/CBX-083_b.jpg', '579');
INSERT INTO `t_book` VALUES ('A92173EE319C42D08DF866792710E34F', '船体强度与结构设计', '王杰德，杨永谦', '17.90', '17.90', '10.0', '国防工业', '', '1', '334', '0', '', '16', 'CB-063/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-063_w.jpg', 'book_img/CB-063_b.jpg', '82');
INSERT INTO `t_book` VALUES ('A9593C6CE1154A9CB100F837A10A8460', '实用供热空调设计手册（上下册）', '陆耀庆主编', '350.00', '350.00', '10.0', '中国建筑工业出版社', '2008', '1', '2685', '0', '2008', '16', 'CBX-138', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '634');
INSERT INTO `t_book` VALUES ('A9DCB732ED9949AAB7DF0FBFB8D1AF8B', '计算机辅助船体建造', '王勇毅，董守富', '14.30', '14.30', '10.0', '人民交通出版社', '', '1', '223', '0', '', '16', 'CB-054', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-054_w.jpg', 'book_img/CB-054_b.jpg', '64');
INSERT INTO `t_book` VALUES ('AB38C6A3A2EB4CCBA39727016B4DA7E7', 'CO2气体保护焊技术', '王艳芳，杨兵兵', '25.00', '25.00', '10.0', '机械工业出版社', '2011-1', '1', '205', '0', '2011-1', '16', 'CB-181', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-181_w.jpg', 'book_img/CB-181_b.jpg', '225');
INSERT INTO `t_book` VALUES ('AB49F7A8E0B04DB2927ACE7DD28FFCEA', '零件检测基础与技能实训指导', '晋顺', '13.00', '13.00', '10.0', '哈尔滨工程大学', '2007-2', '1', '104', '0', '2007-2', '16', 'CB-099', '65640549B80E40B1981CDEC269BFFCAD', 'book_img/CB-099_w.jpg', 'book_img/CB-099_b.jpg', '127');
INSERT INTO `t_book` VALUES ('AB8A1BA6B5C54DF8B3BC88D061E7C83A', '轮机自动化', '本书编写组编', '60.00', '60.00', '10.0', '大连海事大学出版社', '2008-03', '1', '356', '0', '2008-03', '16', 'CBX-076', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-076_w.jpg', 'book_img/CBX-076_b.jpg', '572');
INSERT INTO `t_book` VALUES ('ACA221D8DEA14FE6A78A92555AE0039D', '船舶辅机与轴系', '谭仁臣', '30.00', '30.00', '10.0', '哈尔滨工程大学', '1996-8', '1', '355', '0', '1996-8', '16', 'CB-084', '34000D7FB55E49D9A6B1B2C59F472AFA', 'book_img/CB-084_w.jpg', 'book_img/CB-084_b.jpg', '112');
INSERT INTO `t_book` VALUES ('AD2A1710D2724478ACF988F1151DD540', '船体放样', '肖子熙，霍润炽', '19.80', '19.80', '10.0', '哈尔滨工程大学', '1994-8', '1', '234', '0', '1994-8', '16', 'CB-149', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-149_w.jpg', 'book_img/CB-149_b.jpg', '191');
INSERT INTO `t_book` VALUES ('AD3A96DD4DDC40DAB2B118B91A40C931', '船舶性能试验技术', '郝亚平', '16.10', '16.10', '10.0', '国防工业', '', '1', '190', '0', '', '16', 'CB-127/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-127_w.jpg', 'book_img/CB-127_b.jpg', '165');
INSERT INTO `t_book` VALUES ('ADA0849BC1A1427CAB033010FB8ADC40', '船舶设备', '葛云卿等', '16.70', '16.70', '10.0', '哈尔滨船舶工程学院', '', '1', '385', '0', '', '16', 'CB-117/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-117_w.jpg', 'book_img/CB-117_b.jpg', '146');
INSERT INTO `t_book` VALUES ('ADEADB3F44644960A224E3001D665E76', '中国造船史', '席龙飞', '25.00', '25.00', '10.0', '湖北教育', '2000-1', '1', '346', '0', '2000-1', '16', 'CB-028/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-028_w.jpg', 'book_img/CB-028_b.jpg', '33');
INSERT INTO `t_book` VALUES ('ADFD0A1FA25E4AE1ADCB9DBA77181624', '船舶避碰与值班', '吴兆麟主编', '22.00', '22.00', '10.0', '大连海事大学出版社', '1998', '1', '163', '0', '1998', '16', 'CBX-119', '9AF0184F04364D5DA378FD386434628E', 'book_img/CBX-119_w.jpg', 'book_img/CBX-119_b.jpg', '615');
INSERT INTO `t_book` VALUES ('AE21FB88DE924068967B51E438CEA14D', '船舶性能实验指导书', '杨大明', '1.50', '1.50', '10.0', '江苏科技大学', '2005-7', '1', '20', '0', '2005-7', '16', 'CB-069/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-069-1_w.jpg', 'book_img/CB-069-1_b.jpg', '92');
INSERT INTO `t_book` VALUES ('B00E5C244E9F4E40B658691FDDB539DF', '英汉对照船舶轮机操作手册', '魏海军,于洪亮编', '19.00', '19.00', '10.0', '大连海事大学出版社', '2003', '1', '256', '0', '2003', '16', 'CBX-005', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-005_w.jpg', 'book_img/CBX-005_b.jpg', '504');
INSERT INTO `t_book` VALUES ('B05112AAB2874359B58EF7C6B0503FAB', '轮机工程技术专业教学标准与课程标准', '林凌海，黄勇亮', '30.00', '30.00', '10.0', '人民交通', '2011-8', '1', '195', '0', '2011-8', '16', 'CB-171', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-171_w.jpg', 'book_img/CB-171_b.jpg', '215');
INSERT INTO `t_book` VALUES ('B29F51A359A1460CBEA1D89C1A8F5654', '船体建造工艺学（第二版）', '王勇毅', '24.50', '24.50', '10.0', '人民交通', '', '1', '293', '0', '', '16', 'CB-065', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-065_w.jpg', 'book_img/CB-065_b.jpg', '85');
INSERT INTO `t_book` VALUES ('B2CFAA5C4E8A40B8BD4D303F7C80DC42', '焊工', '中华人民共和国人力资源和社会保障部制定', '8.00', '8.00', '10.0', '中国劳动社会保障出版社', '2013-7', '1', '116', '0', '2013-7', '16', 'CB-200/1', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-200_w.jpg', 'book_img/CB-200_b.jpg', '246');
INSERT INTO `t_book` VALUES ('B337A9780F8246A681E1B360D47BA7F2', '柴油发电机组技术手册', '杨贵恒，贺明智，袁春，际于平', '98.00', '98.00', '10.0', '化学工业出版社', '2008-10', '1', '620', '0', '2008-10', '16', 'CB-135', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-135_w.jpg', 'book_img/CB-135_b.jpg', '176');
INSERT INTO `t_book` VALUES ('B3524C36CF484C9C8D4DB609147C7A81', '船舶管件装配（英文版）', '赵洪江，孙伟智', null, null, '10.0', 'Shipower船舶英语丛书编写组', '2005-11', '1', '122', '0', '2005-11', '16', 'CB-045', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-045_w.jpg', 'book_img/CB-045_b.jpg', '53');
INSERT INTO `t_book` VALUES ('B368DF98E55C4729BCD23399606AF437', '液压气动密封件推荐产品及应用案例', '机械工业信息研究院编', '258.00', '258.00', '10.0', '机械工业出版社', '2007', '1', '378', '0', '2007', '16', 'CBX-026', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-026_w.jpg', 'book_img/CBX-026_b.jpg', '525');
INSERT INTO `t_book` VALUES ('B39EBB1C7D4B42998C631DD4CB6EA633', '铆焊加工速查速算手册', '王洪光', '29.00', '29.00', '10.0', '化学工业出版社', '2009-9', '1', '321', '0', '2009-9', '16', 'CB-139', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-139_w.jpg', 'book_img/CB-139_b.jpg', '180');
INSERT INTO `t_book` VALUES ('B54D0E006CBD48D89BA89466CB213AD6', '轮机英语教程', '李品友主编', '35.00', '35.00', '10.0', '人民交通出版社', '2004', '1', '320', '0', '2004', '16', 'CBX-004', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-004_w.jpg', 'book_img/CBX-004_b.jpg', '503');
INSERT INTO `t_book` VALUES ('B561FE61CA404D30BE84A72082A15E7A', '船舶电气', '许明华主编', '58.00', '58.00', '10.0', '人民交通出版社', '2009-10', '1', '366', '0', '2009-10', '16', 'CBX-106', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-106_w.jpg', 'book_img/CBX-106_b.jpg', '602');
INSERT INTO `t_book` VALUES ('B6379FD2ED1847DCA41BF364A6AFB10F', '船舶电工工艺', '周涛主编', '19.00', '19.00', '10.0', '人民交通出版社', '2007', '1', '155', '0', '2007', '16', 'CBX-103', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-103_w.jpg', 'book_img/CBX-103_b.jpg', '599');
INSERT INTO `t_book` VALUES ('B6717EB174EC407EAB52106A72D95CBD', '轮机自动化常识', '王同庆', '18.00', '18.00', '10.0', '人民交通', '2007-9', '1', '150', '0', '2007-9', '16', 'CB-167', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-167_w.jpg', 'book_img/CB-167_b.jpg', '211');
INSERT INTO `t_book` VALUES ('B6A680E7D3754C56B2158861FBF05563', '机舱管理', '宿靖波主编', '29.00', '29.00', '10.0', '大连海事大学出版社', '2006', '1', '192', '0', '2006', '16', 'CBX-070', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-070_w.jpg', 'book_img/CBX-070_b.jpg', '566');
INSERT INTO `t_book` VALUES ('B8394B91C1284D8695A1E7B097DF4208', '暖通空调常用数据手册', '叶方涛,赵炳文主编;数字化手册编委会编', '200.00', '200.00', '10.0', '机械工业出版社', '2003', '1', '53', '0', '2003', '16', 'CBX-063', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-063_w.jpg', 'book_img/CBX-063_b.jpg', '559');
INSERT INTO `t_book` VALUES ('B947C2CCAF3841BBAE5C9408F2CF440D', '船舶造型与舱室设计', '蒋志勇等', '21.00', '21.00', '10.0', '哈尔滨工程大学', '', '1', '231', '0', '', '16', 'CB-066', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-066_w.jpg', 'book_img/CB-066_b.jpg', '86');
INSERT INTO `t_book` VALUES ('B9A6C08E370D45F4970D49427F0509BB', '船舶轮机的运行与维护（英文版）（下）', '', null, null, '10.0', '', '', '1', '166', '0', '', '16', 'CB-043', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-043_w.jpg', 'book_img/CB-043_b.jpg', '51');
INSERT INTO `t_book` VALUES ('B9BAAF3779C8401CA3AB31CE2128FCE2', '船舶轮机工程（译文本）第一版', '赵洪江', null, null, '10.0', '', '', '1', '146', '0', '', '16', 'CB-048', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-048_w.jpg', 'book_img/CB-048_b.jpg', '56');
INSERT INTO `t_book` VALUES ('BABC7A3910044DBE8EDA83D633B4C834', '通风与空调工程禁忌手册', '张学助,张竞霜编著', '39.00', '39.00', '10.0', '机械工业出版社', '2006', '1', '320', '0', '2006', '16', 'CBX-064', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-064_w.jpg', 'book_img/CBX-064_b.jpg', '560');
INSERT INTO `t_book` VALUES ('BB27476EE3BD46DEA46E6DFD4C1C2510', '柴油发电机组与柴油机实用技术手册', '袁任光, 林由娟主编', '88.00', '88.00', '10.0', '机械工业出版社', '2006', '1', '759', '0', '2006', '16', 'CBX-043', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-043_w.jpg', 'book_img/CBX-043_b.jpg', '542');
INSERT INTO `t_book` VALUES ('BBD169EAF9B84C19B34FCF3DBB2D294D', '新编GMDSS普通操作员教程', '王化民,刘红屏主编', '29.00', '29.00', '10.0', '大连海事大学出版社', '2005', '1', '252', '0', '2005', '16', 'CBX-129', '9AF0184F04364D5DA378FD386434628E', 'book_img/CBX-129_w.jpg', 'book_img/CBX-129_b.jpg', '625');
INSERT INTO `t_book` VALUES ('BC323A9B0FF4428C870141BD227882BC', '船舶制造基础', '杨敏', '19.00', '19.00', '10.0', '国防工业', '', '1', '192', '0', '', '16', 'CB-128/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '167');
INSERT INTO `t_book` VALUES ('BD9C7DD6571A4F7097A064C81EA499F4', '焊工工艺学', '卢屹东，刘立国', '18.90', '18.90', '10.0', '电子工业出版社', '2007-9', '1', '208', '0', '2007-9', '16', 'CB-152', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-152_w.jpg', 'book_img/CB-152_b.jpg', '194');
INSERT INTO `t_book` VALUES ('BDB45C5B8F514835AC3610663991AA09', '船体冷加工工艺学（初级）', '刘向东', '13.00', '13.00', '10.0', '哈尔滨工程大学', '2006-10', '1', '119', '0', '2006-10', '16', 'CB-010', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-010_w.jpg', 'book_img/CB-010_b.jpg', '11');
INSERT INTO `t_book` VALUES ('BE9E5E26DB454B91A4BBDE01229D442D', '金属材料与热处理', '王贵斗', '28.00', '28.00', '10.0', '机械工业出版社', '2011-7', '1', '268', '0', '2011-7', '16', 'CB-178', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-178_w.jpg', 'book_img/CB-178_b.jpg', '222');
INSERT INTO `t_book` VALUES ('BEF098A53BF04F7E9571C5DCC43A5995', '船舶供电技术', '主编庄福余', '28.00', '28.00', '10.0', '哈尔滨工程大学出版社', '2008-03', '1', '259', '0', '2008-03', '16', 'CBX-104', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-104_w.jpg', 'book_img/CBX-104_b.jpg', '600');
INSERT INTO `t_book` VALUES ('BF008CB94F53477BB87AFD0529A1CCD2', '焊接结构生产', '邓洪军', '28.00', '28.00', '10.0', '机械工业出版社', '2012-1', '1', '217', '0', '2012-1', '16', 'CB-174', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-174_w.jpg', 'book_img/CB-174_b.jpg', '218');
INSERT INTO `t_book` VALUES ('BFB7A46FBF2D4879A014DAC24652F9E4', '船舶造型', '龚昌奇，傅德生', '18.00', '18.00', '10.0', '人民交通', '1999-3', '1', '237', '0', '1999-3', '16', 'CB-029', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-029_w.jpg', 'book_img/CB-029_b.jpg', '35');
INSERT INTO `t_book` VALUES ('C0BF0CFC303447C3B064FBDE1A85596A', '中国造船史', '席龙飞', '25.00', '25.00', '10.0', '湖北教育', '2000-1', '1', '346', '0', '2000-1', '16', 'CB-028/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-028_w.jpg', 'book_img/CB-028_b.jpg', '34');
INSERT INTO `t_book` VALUES ('C1098C3AAE114189AABAD2158F2302DD', '熔焊方法及设备', '王宗杰', '28.00', '28.00', '10.0', '机械工业出版社', '2014-1', '1', '327', '0', '2014-1', '16', 'CB-202/1', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-202_w.jpg', 'book_img/CB-202_b.jpg', '253');
INSERT INTO `t_book` VALUES ('C1B8A81556D34FDFB0D1746723B5CE19', '暖通空调工程设计方法与系统分析', '杨昌智,刘光大,李念平编', '18.00', '18.00', '10.0', '中国建筑工业出版社', '2005', '1', '189', '0', '2005', '16', 'CBX-055', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-055_w.jpg', 'book_img/CBX-055_b.jpg', '553');
INSERT INTO `t_book` VALUES ('C25706C0477E4BA7BF52E23CE2BBCB85', '船舶与海洋工程材料', '王广戈等', '9.40', '9.40', '10.0', '上海交通大学', '', '1', '177', '0', '', '16', 'CB-119/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-119_w.jpg', 'book_img/CB-119_b.jpg', '150');
INSERT INTO `t_book` VALUES ('C57EA33D9EF3492D8E35E94836ED8770', '船舶电气工程概论', '陈胜林,智成道,刘世杰编', '14.00', '14.00', '10.0', '哈尔滨工程大学出版社', '2007', '1', '109', '0', '2007', '16', 'CBX-102', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-102_w.jpg', 'book_img/CBX-102_b.jpg', '598');
INSERT INTO `t_book` VALUES ('C611097C2BC147729094E04D2C2AD932', '制冷原理', '雷霞', '19.00', '19.00', '10.0', '机械工业出版社', '2011-1', '1', '210', '0', '2011-1', '16', 'CB-175', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CB-175_w.jpg', 'book_img/CB-175_b.jpg', '219');
INSERT INTO `t_book` VALUES ('C61173C46C5F4E72B36DF2C068FB63A9', '船体修造工艺', '王鸿斌', '42.00', '42.00', '10.0', '人民交通', '2006-8', '1', '388', '0', '2006-8', '16', 'CB-027/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-027-2_w.jpg', 'book_img/CB-027-2_b.jpg', '32');
INSERT INTO `t_book` VALUES ('C645881CB1F042AC8B93C37E865E872D', '船舶检验', '', '11.60', '11.60', '10.0', '', '2005-7', '1', '204', '0', '2005-7', '16', 'CB-130/2', '65640549B80E40B1981CDEC269BFFCAD', 'book_img/CB-130-2_w.jpg', 'book_img/CB-130-2_b.jpg', '171');
INSERT INTO `t_book` VALUES ('C701F836FFC643839C6DF01188AF5908', '造船生产设计', '', '28.80', '28.80', '10.0', '国防工业', '', '1', '353', '0', '', '16', 'CB-059/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-059_w.jpg', 'book_img/CB-059_b.jpg', '73');
INSERT INTO `t_book` VALUES ('C7DBD8269D7449AD91DF76093F5F3A52', '船舶柴油机及安装', '王福根编', '30.00', '30.00', '10.0', '哈尔滨工程大学出版社', '2004-07', '1', '262', '0', '2004-07', '16', 'CBX-082', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-082_w.jpg', 'book_img/CBX-082_b.jpg', '578');
INSERT INTO `t_book` VALUES ('C8030B6332C140FF8DA4A36F4B24AAD7', '船舶辅机', '韩厚德,杨万枫主编', '49.00', '49.00', '10.0', '人民交通出版社', '2009-08', '1', '357', '0', '2009-08', '16', 'CBX-092', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-092_w.jpg', 'book_img/CBX-092_b.jpg', '588');
INSERT INTO `t_book` VALUES ('C820423EC344499281E6DAA0004B2FDF', '电力电子技术', '王兆安,黄俊主编', '20.00', '20.00', '10.0', '机械工业出版社', '2000', '1', '215', '0', '2000', '16', 'CBX-038', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-038_w.jpg', 'book_img/CBX-038_b.jpg', '537');
INSERT INTO `t_book` VALUES ('C94AAB21B5364331AAAC65A80099F35C', '船舶CAD', '曾隆杰', '36.00', '36.00', '10.0', '人民交通', '2000-6', '1', '234', '0', '2000-6', '16', 'CB-033', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-033_w.jpg', 'book_img/CB-033_b.jpg', '40');
INSERT INTO `t_book` VALUES ('CAFA433CF53348018D5E923EA4E0DFC7', '轮机自动化', '杨泽宇主编', '24.00', '24.00', '10.0', '哈尔滨工程大学出版社', '2006-09', '1', '234', '0', '2006-09', '16', 'CBX-074', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-074_w.jpg', 'book_img/CBX-074_b.jpg', '570');
INSERT INTO `t_book` VALUES ('CC50EA65518241838EBA5BC97E22D880', '船机检修技术', '谢荣', '25.00', '25.00', '10.0', '人民交通', '2006-8', '1', '212', '0', '2006-8', '16', 'CB-156', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-156_w.jpg', 'book_img/CB-156_b.jpg', '198');
INSERT INTO `t_book` VALUES ('CC712FFE56C04236AE742DDD1C5B4E9A', '实用通风空调工程安装技术手册', '瞿义勇主编', '68.00', '68.00', '10.0', '中国电力出版社', '2006', '1', '669', '0', '2006', '16', 'CBX-056', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-056_w.jpg', 'book_img/CBX-056_b.jpg', '554');
INSERT INTO `t_book` VALUES ('CD3A3EDA575D44839A6F25DB848CE10D', '玻璃钢典型工艺及应用', '王禹阶，班良民', '18.00', '18.00', '10.0', '化学工业出版社', '2008-4', '1', '151', '0', '2008-4', '16', 'CB-192', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CB-192_w.jpg', 'book_img/CB-192_b.jpg', '236');
INSERT INTO `t_book` VALUES ('CD7C999154974B1883774B74DCE52451', '商船建造（英文版）', '', '12.90', '12.90', '10.0', '', '', '1', '231', '0', '', '16', 'CB-118/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-118_w.jpg', 'book_img/CB-118_b.jpg', '148');
INSERT INTO `t_book` VALUES ('CDA481C4CAF44B2A8F05DF59E550A659', '蒸发冷却空调技术手册', '(美)约翰·瓦特(John R. Watt),(美)威尔·', '78.00', '78.00', '10.0', '机械工业出版社', '2009-01', '1', '600', '0', '2009-01', '16', 'CBX-007', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-007_w.jpg', 'book_img/CBX-007_b.jpg', '506');
INSERT INTO `t_book` VALUES ('CDBCBE0A162044CE93B469AE23F5FF0A', '焊工', '中华人民共和国人力资源和社会保障部制定', '8.00', '8.00', '10.0', '中国劳动社会保障出版社', '2013-7', '1', '116', '0', '2013-7', '16', 'CB-200/2', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-200_w.jpg', 'book_img/CB-200_b.jpg', '247');
INSERT INTO `t_book` VALUES ('CE73D9D9ACCD401F82EC50B60F778F35', '柴油机使用与维修技术', '谭影航编著', '28.00', '28.00', '10.0', '机械工业出版社', '2007', '1', '239', '0', '2007', '16', 'CBX-035', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-035_w.jpg', 'book_img/CBX-035_b.jpg', '534');
INSERT INTO `t_book` VALUES ('CE9965BFD08746198C039A40CFE020B5', '船舶修造资源管理', '谢荣', '35.00', '35.00', '10.0', '人民交通', '2010-7', '1', '238', '0', '2010-7', '16', 'CB-197', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-197_w.jpg', 'book_img/CB-197_b.jpg', '241');
INSERT INTO `t_book` VALUES ('CF9454612C8A4C819A1F8D1DA83C9FAE', '船舶建造质量检验', '主编陆俊岫', '46.80', '46.80', '10.0', '哈尔滨工程大学出版社', '1996-05', '1', '481', '0', '1996-05', '16', 'CBX-116', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CBX-116_w.jpg', 'book_img/CBX-116_b.jpg', '612');
INSERT INTO `t_book` VALUES ('D14F89A19571461D881872C7F6E14579', '通风空调工程施工与验收手册', '黄崇国主编', '120.00', '120.00', '10.0', '中国建筑工业出版社', '2006', '1', '1126', '0', '2006', '16', 'CBX-057', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-057_w.jpg', 'book_img/CBX-057_b.jpg', '555');
INSERT INTO `t_book` VALUES ('D18BFC962A0A4D6E9F782B1A8D5CF596', '民用建筑空调设计', '马最良,姚杨主编', '78.00', '78.00', '10.0', '化工工业出版社', '2010-1', '1', '534', '0', '2010-1', '16', 'CBX-140', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-140_w.jpg', 'book_img/CBX-140_b.jpg', '636');
INSERT INTO `t_book` VALUES ('D20A379A72D84697B68BAA7DCD765226', '船舶辅机', '胡启祥', '26.00', '26.00', '10.0', '哈尔滨工程大学', '2007-2', '1', '232', '0', '2007-2', '16', 'CB-114', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-114_w.jpg', 'book_img/CB-114_b.jpg', '143');
INSERT INTO `t_book` VALUES ('D2E1D901E6C3447A90DC299990B879AD', '船体火工初级工培训教程', '魏莉洁', '15.00', '15.00', '10.0', '哈尔滨工程大学', '2007-4', '1', '96', '0', '2007-4', '16', 'CB-079', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-079_w.jpg', 'book_img/CB-079_b.jpg', '107');
INSERT INTO `t_book` VALUES ('D2E63BE960DB49958F66FFEA017FA3B9', '船舶设计原理（修订本）', '林杰人', '12.20', '12.20', '10.0', '国防工业', '', '1', '241', '0', '', '16', 'CB-068/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-068_w.jpg', 'book_img/CB-068_b.jpg', '90');
INSERT INTO `t_book` VALUES ('D341794A5B77498F999B04C5A0298D44', '船舶检验', '', '11.60', '11.60', '10.0', '', '2005-7', '1', '204', '0', '2005-7', '16', 'CB-130/1', '65640549B80E40B1981CDEC269BFFCAD', 'book_img/CB-130-1_w.jpg', 'book_img/CB-130-1_b.jpg', '170');
INSERT INTO `t_book` VALUES ('D369788D00D641D29A29FE707C538BF6', '新型电机绕组', '许实章著', '68.00', '68.00', '10.0', '机械工业出版社', '2002', '1', '463', '0', '2002', '16', 'CBX-041', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-041_w.jpg', 'book_img/CBX-041_b.jpg', '540');
INSERT INTO `t_book` VALUES ('D3D21C866258487994BDD35D745211D5', '冷库电气技术应用手册', '盛德庄编著', '65.00', '65.00', '10.0', '中国建筑工业出版社', '2003', '1', '466', '0', '2003', '16', 'CBX-015', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-015_w.jpg', 'book_img/CBX-015_b.jpg', '514');
INSERT INTO `t_book` VALUES ('D3ED6AB4872447BAA18A7F04B3D1ECF8', '焊接生产技术问答', '周岐，孟力凯，杨惠', '29.00', '29.00', '10.0', '化学工业出版社', '2010-2', '1', '378', '0', '2010-2', '16', 'CB-140', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-140_w.jpg', 'book_img/CB-140_b.jpg', '181');
INSERT INTO `t_book` VALUES ('D4C25CCAB7D0439E9FA96279E50CE466', '电焊工（技能鉴定考核试题库）', '机械工业职业技能鉴定        指导中心 编', '13.50', '13.50', '10.0', '机械工业出版社', '2012-1', '1', '248', '0', '2012-1', '16', 'CB-187', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '231');
INSERT INTO `t_book` VALUES ('D5CC35D1922C44EDBAE23A22DAC87695', '船舶静电安全技术', '孙可平主编', '12.00', '12.00', '10.0', '人民交通出版社', '2001', '1', '170', '0', '2001', '16', 'CBX-132', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-132_w.jpg', 'book_img/CBX-132_b.jpg', '628');
INSERT INTO `t_book` VALUES ('D6607260F01746D48B6669DA3254ADF1', '实验室资质认定基本知识题集', '刘卓慧主编;国家认证认可监督管理委员会编', '50.00', '50.00', '10.0', '中国计量出版社', '2009-01', '1', '241', '0', '2009-01', '16', 'CBX-006', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-006_w.jpg', 'book_img/CBX-006_b.jpg', '505');
INSERT INTO `t_book` VALUES ('D703A1155A1C456BB15C596D4D776E96', '英汉船舶修理与建造图解词典', '赵洪江，孙伟智', null, null, '10.0', '船舶英语编写组', '2005', '1', '326', '0', '2005', '16', 'CB-046', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-046_w.jpg', 'book_img/CB-046_b.jpg', '54');
INSERT INTO `t_book` VALUES ('D78C8B62CE1A4DCF8F34E15745E6F990', '船舶电气', '封晓黎主编', '26.00', '26.00', '10.0', '大连海事大学出版社', '2006', '1', '169', '0', '2006', '16', 'CBX-109', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-109_w.jpg', 'book_img/CBX-109_b.jpg', '605');
INSERT INTO `t_book` VALUES ('D7CDF012F05D4A9F8A4492028B1CEB0C', '船舶轮机的运行与维护（英文版）（上）', '', null, null, '10.0', '', '', '1', '502', '0', '', '16', 'CB-042', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-042_w.jpg', 'book_img/CB-042_b.jpg', '50');
INSERT INTO `t_book` VALUES ('DAF33A290BE9457695EFD825A1530F0B', '商船建造（译文版）第一版', '', null, null, '10.0', '', '', '1', '79', '0', '', '16', 'CB-050', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '58');
INSERT INTO `t_book` VALUES ('DB5D787D1C1D466FA01E2CF3A2FB7C39', '船艇美学与内装设计', '于建中', '68.00', '68.00', '10.0', '上海交通大学', '2011-5', '1', '199', '0', '2011-5', '16', 'CB-188', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-188_w.jpg', 'book_img/CB-188_b.jpg', '232');
INSERT INTO `t_book` VALUES ('DBBC2811A9DA41BEB626FA0BCF69283C', '手把手教你学51单片机', '惠仇编著', '46.00', '46.00', '10.0', '电子工业出版社', '2009-01', '1', '371', '0', '2009-01', '16', 'CBX-048', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-048_w.jpg', 'book_img/CBX-048_b.jpg', '547');
INSERT INTO `t_book` VALUES ('DD6A800F2496434B8C0C403A9D15DDE9', '计算机辅助船舶设计', '陈宾康，董元胜', '14.40', '14.40', '10.0', '国防工业', '', '1', '241', '0', '', '16', 'CB-122/1', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-122_w.jpg', 'book_img/CB-122_b.jpg', '156');
INSERT INTO `t_book` VALUES ('DE8D750631494873B8BB74A244CE03B5', '空调与制冷技术手册', '(美)汪善国著;李德英, 赵秀敏等译', '158.00', '158.00', '10.0', '机械工业出版社', '2006', '1', '1253', '0', '2006', '16', 'CBX-018', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-018_w.jpg', 'book_img/CBX-018_b.jpg', '517');
INSERT INTO `t_book` VALUES ('DF10E5F460D3497F92A5C597B1F5F367', '制冷技术及其应用', '彦启森主编', '82.00', '82.00', '10.0', '中国建筑工业出版社', '2006', '1', '635', '0', '2006', '16', 'CBX-022', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-022_w.jpg', 'book_img/CBX-022_b.jpg', '521');
INSERT INTO `t_book` VALUES ('E0796FE04AB34F4D830FB177A40A7D4C', '焊接质量管理与控制读本', '张应力', '58.00', '58.00', '10.0', '化学工业出版社', '2010-6', '1', '343', '0', '2010-6', '16', 'CB-141/1', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-141_w.jpg', 'book_img/CB-141_b.jpg', '182');
INSERT INTO `t_book` VALUES ('E07C4868A08A4C0F98E0A4B5676BAC16', '焊接结构学', '方洪渊', '32.00', '32.00', '10.0', '机械工业出版社', '2009-6', '1', '317', '0', '2009-6', '16', 'CB-203/1', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-203_w.jpg', 'book_img/CB-203_b.jpg', '259');
INSERT INTO `t_book` VALUES ('E0AD6FF23D224A9794C45E88D6A47FC9', '船舶设备与系统', '刁玉锋', '23.00', '23.00', '10.0', '哈尔滨工程大学', '2006-12', '1', '204', '0', '2006-12', '16', 'CB-077', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-077_w.jpg', 'book_img/CB-077_b.jpg', '105');
INSERT INTO `t_book` VALUES ('E0F809AD89EB47BDB5ED02D13693F08D', '工程制图 ', '石娟', '22.00', '22.00', '10.0', '人民交通', '2011-12', '1', '186', '0', '2011-12', '16', 'CB-164', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-164_w.jpg', 'book_img/CB-164_b.jpg', '208');
INSERT INTO `t_book` VALUES ('E17AA7C68383462187D9AEA24829D9DD', '金属材料及热处理', '丁仁亮', '27.00', '27.00', '10.0', '机械工业出版社', '2012-1', '1', '245', '0', '2012-1', '16', 'CB-173', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-173_w.jpg', 'book_img/CB-173_b.jpg', '217');
INSERT INTO `t_book` VALUES ('E28D5DD45F2A4228ADE77BD345E481EF', '船体识图（含图册)', '金仲达', '28.50', '28.50', '10.0', '哈尔滨工程大学', '2004-8', '1', '225', '0', '2004-8', '16', 'CB-019', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '20');
INSERT INTO `t_book` VALUES ('E39E90A54A7445C2B983D7AF27E98CCE', '船舶电力拖动', '刘明伟主编', '40.00', '40.00', '10.0', '人民交通出版社', '2006', '1', '359', '0', '2006', '16', 'CBX-101', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-101_w.jpg', 'book_img/CBX-101_b.jpg', '597');
INSERT INTO `t_book` VALUES ('E43BBE069B2C443295461DD07F5DDF60', '船体强度结构规范设计课程设计任务书', '王志军，尹群', '3.30', '3.30', '10.0', '华东船舶工业学院一系', '1997-10', '1', '40', '0', '1997-10', '16', 'CB-125', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-125_w.jpg', 'book_img/CB-125_b.jpg', '161');
INSERT INTO `t_book` VALUES ('E4545395802F4DDE8BD9EB908B7A216F', '看图学通风空调工程施工', '蔡中辉', '28.00', '28.00', '10.0', '化学工业出版社', '2009-12', '1', '312', '0', '2009-12', '16', 'CB-134', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CB-134_w.jpg', 'book_img/CB-134_b.jpg', '175');
INSERT INTO `t_book` VALUES ('E494825F2EF645D4AD5ECB7075F051BB', '学校实战2000版ISO 9001标准', '赵金玉编著', '30.00', '30.00', '10.0', '中国计量出版社', '2005-01-01', '1', '130', '0', '2005-01-01', '16', 'CBX-003', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-003_w.jpg', 'book_img/CBX-003_b.jpg', '502');
INSERT INTO `t_book` VALUES ('E4CA916628F942D7A27D79F6E127A50C', '造船专业英语', '彭公武', '22.00', '22.00', '10.0', '哈尔滨工程大学', '2006-8', '1', '204', '0', '2006-8', '16', 'CB-111', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-111_w.jpg', 'book_img/CB-111_b.jpg', '140');
INSERT INTO `t_book` VALUES ('E4CD3D1BA33548C788D9125DAC636626', '船舶电气设备及系统', '史际昌主编', '30.00', '30.00', '10.0', '大连海事大学出版社', '1998', '1', '258', '0', '1998', '16', 'CBX-112', '96F209F79DB242E9B99CC1B98FAB01DB', 'book_img/CBX-112_w.jpg', 'book_img/CBX-112_b.jpg', '608');
INSERT INTO `t_book` VALUES ('E5F9C988C2544A36A4DFFBD339E0FC67', '实用安装工程预算手册', '刘庆山 刘屹立 编', '42.00', '42.00', '10.0', '机械工业出版社', '2007-2', '1', '718', '0', '2007-2', '16', 'CBX-135', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-135_w.jpg', 'book_img/CBX-135_b.jpg', '631');
INSERT INTO `t_book` VALUES ('E61CB9A985B44E6581687C05C85A2350', '船舶管系工工艺学(初级)', '邵志深编', '11.00', '11.00', '10.0', '哈尔滨工程大学出版社', '2007-04', '1', '104', '0', '2007-04', '16', 'CBX-094', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-094_w.jpg', 'book_img/CBX-094_b.jpg', '590');
INSERT INTO `t_book` VALUES ('E625A170D6B04DFF8CCA64726A9649C7', 'CO2气体保护半自动焊焊工培训教程', '赵伟兴', '18.00', '18.00', '10.0', '哈尔滨工程大学', '2003-6', '1', '208', '0', '2003-6', '16', 'CB-096', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '124');
INSERT INTO `t_book` VALUES ('E6FA5837E06C4D729758B0EFF34AE37B', '熔焊方法及设备', '王宗杰', '28.00', '28.00', '10.0', '机械工业出版社', '2014-1', '1', '327', '0', '2014-1', '16', 'CB-202/6', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-202_w.jpg', 'book_img/CB-202_b.jpg', '258');
INSERT INTO `t_book` VALUES ('E781A27D05F446B68D83EE3AEC9D9782', '船舶建造工艺学', '李忠林等', '30.00', '30.00', '10.0', '哈尔滨工程大学', '2006-9', '1', '305', '0', '2006-9', '16', 'CB-026', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-026_w.jpg', 'book_img/CB-026_b.jpg', '30');
INSERT INTO `t_book` VALUES ('E8B0031AB5AC4765855E4DDFB1C8B01D', '船舶核动力装置', '彭敏俊主编', '58.00', '58.00', '10.0', '原子能出版社', '2009-08', '1', '346', '0', '2009-08', '16', 'CBX-079', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-079_w.jpg', 'book_img/CBX-079_b.jpg', '575');
INSERT INTO `t_book` VALUES ('E95312B181724526B4489D50F0A46AF7', '船舶电气设备', '张作化', '12.60', '12.60', '10.0', '人民交通', '2012-1', '1', '147', '0', '2012-1', '16', 'CB-158', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CB-158_w.jpg', 'book_img/CB-158_b.jpg', '200');
INSERT INTO `t_book` VALUES ('EA320754271C4CD899F0ACF653105B74', '船舶中速柴油机装置图解手册', '孙培廷,魏海军主编', '76.00', '76.00', '10.0', '大连海事大学出版社', '2004', '1', '485', '0', '2004', '16', 'CBX-088', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-088_w.jpg', 'book_img/CBX-088_b.jpg', '584');
INSERT INTO `t_book` VALUES ('EAB0B59B31F747C491E43E6F0016A121', '金属表面抛光技术', '李异，刘钧泉，李建三', '29.00', '29.00', '10.0', '化学工业出版社', '2006-5', '1', '246', '0', '2006-5', '16', 'CB-143', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-143_w.jpg', 'book_img/CB-143_b.jpg', '185');
INSERT INTO `t_book` VALUES ('EAC7216D188A4CB49D18E3A619086627', '船体冷加工工艺学（中级）', '刁玉锋', '13.00', '13.00', '10.0', '哈尔滨工程大学', '2006-10', '1', '97', '0', '2006-10', '16', 'CB-011', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-011_w.jpg', 'book_img/CB-011_b.jpg', '12');
INSERT INTO `t_book` VALUES ('EAD94849FA0F42219137DF60E7984EF7', '船舶柴油机', '孙建新主编', '34.00', '34.00', '10.0', '人民交通出版社', '2006', '1', '291', '0', '2006', '16', 'CBX-084', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-084_w.jpg', 'book_img/CBX-084_b.jpg', '580');
INSERT INTO `t_book` VALUES ('ED0DFB0C5F9B4DF1A6176BAEC55AB88C', '船舶油漆工手册（英文版）', '赵洪江', null, null, '10.0', '江苏科技大学船舶与海洋工程学院', '2006-5', '1', '101', '0', '2006-5', '16', 'CB-040', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-040_w.jpg', 'book_img/CB-040_b.jpg', '48');
INSERT INTO `t_book` VALUES ('ED3BEAAD1E15443185DB7C08085E0A07', '造船材料', '汤维余等', '12.00', '12.00', '10.0', '哈尔滨工程大学', '1994-8', '1', '116', '0', '1994-8', '16', 'CB-090', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-090_w.jpg', 'book_img/CB-090_b.jpg', '118');
INSERT INTO `t_book` VALUES ('EE4E5B54AE514DAFABBCC22B58F2BDBB', '轮机机械基础', '高积慧主编', '39.00', '39.00', '10.0', '大连海事大学出版社', '2000', '1', '410', '0', '2000', '16', 'CBX-097', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-097_w.jpg', 'book_img/CBX-097_b.jpg', '593');
INSERT INTO `t_book` VALUES ('EE57280307BE4CE69B23934B882F098D', '船机检修技术', '施祝斌', '28.00', '28.00', '10.0', '哈尔滨工程大学', '2006-9', '1', '280', '0', '2006-9', '16', 'CB-115', '65640549B80E40B1981CDEC269BFFCAD', 'book_img/CB-115_w.jpg', 'book_img/CB-115_b.jpg', '144');
INSERT INTO `t_book` VALUES ('EF16C19BCE564B5996B1C968A9007448', '舰船知识', '许淼', '20.00', '20.00', '10.0', '无', '无', '1', '192', '0', '无', '16', 'CBZ-001/1', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBZ-001-1_w.jpg', 'book_img/CBZ-001-1_b.jpg', '264');
INSERT INTO `t_book` VALUES ('F13075BA6F1B458185C7B42101C429B1', '船舶建造安全技术', '王勤章', '15.00', '15.00', '10.0', '哈尔滨工程大学', '2005-2', '1', '356', '0', '2005-2', '16', 'CB-002', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-002_w.jpg', 'book_img/CB-002_b.jpg', '3');
INSERT INTO `t_book` VALUES ('F152A87553C545B5AA28236AEECFDC6B', '船舶设计原理', '顾敏童', '29.00', '29.00', '10.0', '上海交通大学', '1988-7', '1', '277', '0', '1988-7', '16', 'CB-030/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-030_w.jpg', 'book_img/CB-030_b.jpg', '37');
INSERT INTO `t_book` VALUES ('F307C60BE3924902BECCB49F662B3BEE', '轮机工程基础', '章学来主编', '60.00', '60.00', '10.0', '人民交通出版社', '2009-09', '1', '476', '0', '2009-09', '16', 'CBX-125', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-125_w.jpg', 'book_img/CBX-125_b.jpg', '621');
INSERT INTO `t_book` VALUES ('F40542877E4F4A788F704C8EF545B975', '港口机械液压与液力传动', '王剑华主编', '26.00', '26.00', '10.0', '人民交通出版社', '2008-02', '1', '204', '0', '2008-02', '16', 'CBX-115', 'A9CFBED0F77746C5BD751F2502FAB2CD', 'book_img/CBX-115_w.jpg', 'book_img/CBX-115_b.jpg', '611');
INSERT INTO `t_book` VALUES ('F4A956933C774902AFE291D8FA08FED4', '船体CAD∕CAM', '彭辉', '28.00', '28.00', '10.0', '人民交通', '2007-1', '1', '236', '0', '2007-1', '16', 'CB-073/4', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-073_w.jpg', 'book_img/CB-073_b.jpg', '101');
INSERT INTO `t_book` VALUES ('F4F75129D45248718DDDAECF2784AF86', '船舶建造质量检验', '陆俊岫', '35.00', '35.00', '10.0', '哈尔滨工程大学', '', '1', '480', '0', '', '16', 'CB-070/1', '65640549B80E40B1981CDEC269BFFCAD', 'book_img/CB-070_w.jpg', 'book_img/CB-070_b.jpg', '94');
INSERT INTO `t_book` VALUES ('F594EA7132514674B5208C9913606F0C', '暖通空调', '陆亚俊主编;陆亚俊,马最良,邹平华编著', '38.00', '38.00', '10.0', '中国建筑工业出版社', '2007-11', '1', '419', '0', '2007-11', '16', 'CBX-058', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-058_w.jpg', 'book_img/CBX-058_b.jpg', '556');
INSERT INTO `t_book` VALUES ('F5ECB17465B44C0B8A04F297B09DE2C8', '船舶英语口语', '赵洪江', null, null, '10.0', '船舶英语编写组', '2006', '1', '320', '0', '2006', '16', 'CB-051', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '59');
INSERT INTO `t_book` VALUES ('F60EC5E51E354A7FACC153BFF06926FE', '高级船舶焊接工操作技能', '吕文坤等', '17.50', '17.50', '10.0', '哈尔滨工程大学', '2002-4', '1', '193', '0', '2002-4', '16', 'CB-151', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-151_w.jpg', 'book_img/CB-151_b.jpg', '193');
INSERT INTO `t_book` VALUES ('F63547925E804E478F3F4B7F9B53C4B1', '造船成组技术', '彭公武，刘颖研', '9.00', '9.00', '10.0', '武汉船舶职业技术学院教材编审室', '2005-8', '1', '151', '0', '2005-8', '16', 'CB-036', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-036_w.jpg', 'book_img/CB-036_b.jpg', '43');
INSERT INTO `t_book` VALUES ('F6A35BD424D8461389B3EB14DA572C11', '轮机电工', '王景代', '40.00', '40.00', '10.0', '人民交通', '2012-1', '1', '371', '0', '2012-1', '16', 'CB-159', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-159_w.jpg', 'book_img/CB-159_b.jpg', '201');
INSERT INTO `t_book` VALUES ('F7F4C5EC9B8545AE9DDAE349BBE3FA0E', '焊接质量管理与控制读本', '张应力', '58.00', '58.00', '10.0', '化学工业出版社', '2010-6', '1', '343', '0', '2010-6', '16', 'CB-141/2', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-141_w.jpg', 'book_img/CB-141_b.jpg', '183');
INSERT INTO `t_book` VALUES ('F82AD8FB0DEB4D6ABFB911C53ED24A9F', '船舶电站', '丛培亭', '25.00', '25.00', '10.0', '人民交通', '2006-8', '1', '211', '0', '2006-8', '16', 'CB-196', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CB-196_w.jpg', 'book_img/CB-196_b.jpg', '240');
INSERT INTO `t_book` VALUES ('F97DF00488394F63A74D21F9D51C9377', '造船成组技术', '赵东', '10.30', '10.30', '10.0', '江苏科技大学', '2005-6', '1', '158', '0', '2005-6', '16', 'CB-123/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-123_w.jpg', 'book_img/CB-123_b.jpg', '159');
INSERT INTO `t_book` VALUES ('F9B0E5243DAC4F83BAF3D947F492A9A5', 'GMDSS通信业务', '柳邦声主编', '19.00', '19.00', '10.0', '大连海事大学出版社', '2007', '1', '192', '0', '2007', '16', 'CBX-130', '9AF0184F04364D5DA378FD386434628E', 'book_img/CBX-130_w.jpg', 'book_img/CBX-130_b.jpg', '626');
INSERT INTO `t_book` VALUES ('FA58C4F070D94BE79F2F0A57A55AA142', '熔焊方法及设备', '王宗杰', '28.00', '28.00', '10.0', '机械工业出版社', '2014-1', '1', '327', '0', '2014-1', '16', 'CB-202/2', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/CB-202_w.jpg', 'book_img/CB-202_b.jpg', '254');
INSERT INTO `t_book` VALUES ('FA738185CE99423387984106ED5A5B11', '高级船舶焊接工操作技能', '吕文坤等', '23.00', '23.00', '10.0', '哈尔滨工程大学', '2002-4', '1', '193', '0', '2002-4', '16', 'CB-091', 'F5C091B3967442A2B35EFEFC4EF8746F', 'book_img/jinggao_w.jpg', 'book_img/jinggao_b.jpg', '119');
INSERT INTO `t_book` VALUES ('FAF5A572BC6C429C8C80ACEFD088BA49', '船舶结构与制图', '魏莉洁', '38.00', '38.00', '10.0', '人民交通', '2006-8', '1', '322', '0', '2006-8', '16', 'CB-039/2', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-039-2_w.jpg', 'book_img/CB-039-2_b.jpg', '47');
INSERT INTO `t_book` VALUES ('FB1875EDD79F459B8A5D7B5EE52B08C3', '船舶内装工程', '李庆宁', '24.00', '24.00', '10.0', '哈尔滨工程大学', '2007-3', '1', '211', '0', '2007-3', '16', 'CB-078', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-078_w.jpg', 'book_img/CB-078_b.jpg', '106');
INSERT INTO `t_book` VALUES ('FC2FCE275620420B8E8549A178006E5C', '能源技术展望', '张阿玲[等]译', '108.00', '108.00', '10.0', '清华大学出版社', '2009-04', '1', '318', '0', '2009-04', '16', 'CBX-029', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/CBX-029_w.jpg', 'book_img/CBX-029_b.jpg', '528');
INSERT INTO `t_book` VALUES ('FD543FCFE89545D0B8C8802427B55D20', '铆工', '刑玉晶，王维中，付文俊等', '25.00', '25.00', '10.0', '化学工业出版社', '2009-11', '1', '352', '0', '2009-11', '16', 'CB-138', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CB-138_w.jpg', 'book_img/CB-138_b.jpg', '179');
INSERT INTO `t_book` VALUES ('FD74D59ED3FE47CEBF1662810684FBEE', '暖、卫、通风空调施工工艺标准手册', '黄剑敌主编', '120.00', '120.00', '10.0', '中国建筑工业出版社', '2003', '1', '1074', '0', '2003', '16', 'CBX-051', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-051_w.jpg', 'book_img/CBX-051_b.jpg', '549');
INSERT INTO `t_book` VALUES ('FD858CE33D5E4181B4818680D5B85B50', '船舶辅机', '费千主编', '39.00', '39.00', '10.0', '大连海事大学出版社', '2008-02', '1', '395', '0', '2008-02', '16', 'CBX-090', 'F4FBD087EB054CA1896093F172AC33D9', 'book_img/CBX-090_w.jpg', 'book_img/CBX-090_b.jpg', '586');
INSERT INTO `t_book` VALUES ('FDBF49155F384A8992F2F3ABEB3AAC72', '海上无线电通信', '唐信源主编', '38.00', '38.00', '10.0', '大连海事大学出版社', '1999', '1', '352', '0', '1999', '16', 'CBX-127', '9AF0184F04364D5DA378FD386434628E', 'book_img/CBX-127_w.jpg', 'book_img/CBX-127_b.jpg', '623');
INSERT INTO `t_book` VALUES ('FE334F54D58E4187ABAC8773FD60FA5B', '船舶防腐与涂装', '彭辉等', '25.00', '25.00', '10.0', '哈尔滨工程大学', '2006-8', '1', '240', '0', '2006-8', '16', 'CB-110', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-110_w.jpg', 'book_img/CB-110_b.jpg', '139');
INSERT INTO `t_book` VALUES ('FE3F80C8197C42FF86B243355462B961', '船舶原理（下册）', '盛振邦，刘应中', '43.00', '43.00', '10.0', '上海交通大学', '2004-5', '1', '450', '0', '2004-5', '16', 'CB-032', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-032_w.jpg', 'book_img/CB-032_b.jpg', '39');
INSERT INTO `t_book` VALUES ('FEB8727DBFB24099BFE9EA3B917935DD', '实用管道工程安装技术手册', '冯秋良主编', '66.00', '66.00', '10.0', '中国电力出版社', '2006', '1', '651', '0', '2006', '16', 'CBX-136', 'FAB7B7F7084F4D57A0808ADC61117683', 'book_img/CBX-136_w.jpg', 'book_img/CBX-136_b.jpg', '632');
INSERT INTO `t_book` VALUES ('FFD2089A33324A00893CE55EAAB1CB18', '船舶修造英语（含光盘）', '王占礼，陈朝霞', '68.00', '68.00', '10.0', '中国水利水电', '2010-3', '1', '344', '0', '2010-3', '16', 'CB-189', 'D45D96DA359A4FEAB3AB4DCF2157FC06', 'book_img/CB-189_w.jpg', 'book_img/CB-189_b.jpg', '233');

-- ----------------------------
-- Table structure for t_cartitem
-- ----------------------------
DROP TABLE IF EXISTS `t_cartitem`;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cartitem
-- ----------------------------
INSERT INTO `t_cartitem` VALUES ('F5ED4C79849440E59BFD7DCB4158EB00', '0', '76459291234E408B871985CE41392095', '288A85B2C2974684AACA656B8CF491E2', '23');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
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

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '船舶工程技术', null, '船舶工程技术分类', '1');
INSERT INTO `t_category` VALUES ('1009DC56C18E4231B197B73CC89B0D7E', '航海其他', '7', '航海其他分类', '38');
INSERT INTO `t_category` VALUES ('2', '焊接技术与自动化', null, '焊接技术与自动化分类', '2');
INSERT INTO `t_category` VALUES ('3', '船舶检验', null, '船舶检验分类', '3');
INSERT INTO `t_category` VALUES ('34000D7FB55E49D9A6B1B2C59F472AFA', '船动其他', '6', '船动其他分类', '41');
INSERT INTO `t_category` VALUES ('4', '空调工程技术', null, '空调工程技术分类', '4');
INSERT INTO `t_category` VALUES ('5', '船舶机械工程技术', null, '船舶机械工程技术分类', '5');
INSERT INTO `t_category` VALUES ('56AD72718C524147A2485E5F4A95A062', '检验其他', '3', '检验其他分类', '21');
INSERT INTO `t_category` VALUES ('5F79D0D246AD4216AC04E9C5FAB3199E', '其他的图书', '8', '其他的图书分类', '10');
INSERT INTO `t_category` VALUES ('6', '船舶动力工程技术', null, '船舶动力工程技术分类', '6');
INSERT INTO `t_category` VALUES ('65640549B80E40B1981CDEC269BFFCAD', '检验基础', '3', '检验基础分类', '20');
INSERT INTO `t_category` VALUES ('65830AB237EF428BAE9B7ADC78A8D1F6', '空调其他', '4', '空调其他分类', '28');
INSERT INTO `t_category` VALUES ('7', '航海技术', null, '航海技术分类', '7');
INSERT INTO `t_category` VALUES ('8', '其他', null, '其他分类', '8');
INSERT INTO `t_category` VALUES ('96F209F79DB242E9B99CC1B98FAB01DB', '船机其他', '5', '船机其他分类', '33');
INSERT INTO `t_category` VALUES ('9AF0184F04364D5DA378FD386434628E', '航海基础', '7', '航海基础分类', '37');
INSERT INTO `t_category` VALUES ('A9CFBED0F77746C5BD751F2502FAB2CD', '船动基础', '6', '船动基础分类', '35');
INSERT INTO `t_category` VALUES ('C4DD8CA232864B31A367EE135D86382C', '焊接其他', '2', '焊接其他分类', '17');
INSERT INTO `t_category` VALUES ('C9A99210D5914AAAB1232AB4F64A2B7B', '船体专业其他', '1', '船体专业其他分类', '40');
INSERT INTO `t_category` VALUES ('D45D96DA359A4FEAB3AB4DCF2157FC06', '船体专业基础', '1', '船体专业基础分类', '11');
INSERT INTO `t_category` VALUES ('F4FBD087EB054CA1896093F172AC33D9', '船机基础', '5', '船机基础分类', '30');
INSERT INTO `t_category` VALUES ('F5C091B3967442A2B35EFEFC4EF8746F', '焊接基础', '2', '焊接基础分类', '16');
INSERT INTO `t_category` VALUES ('FAB7B7F7084F4D57A0808ADC61117683', '空调基础', '4', '空调基础分类', '26');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
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

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1809003188274F35A587E8F420F8D20A', '2020-10-28 09:21:17', '0.00', '1', null, '116A516E4E8542A7B8E102D859CC5CE1');
INSERT INTO `t_order` VALUES ('18450A4295224B1FA374D04E369A3CD6', '2020-10-28 09:16:13', '0.00', '1', null, 'F4A52625DD7E4F63960245CDD024A909');
INSERT INTO `t_order` VALUES ('1DF1DBCAEBB54F5EA0EC0E1F2D47E469', '2020-10-28 09:16:49', '0.00', '1', null, '04A52493202A4E41BC2F209F6BA0ABCC');
INSERT INTO `t_order` VALUES ('2ECADF66BCB74D5C9A43E40BC8F1E2C5', '2020-10-28 09:17:23', '0.00', '1', null, '40B8EC2426574C9C9BD0F4894CF058BF');
INSERT INTO `t_order` VALUES ('348699D22AC5403DBA18EF3D73593F80', '2020-10-28 09:17:58', '0.00', '1', null, 'B22530B542054B3EB0D2BEBA67D90CA9');
INSERT INTO `t_order` VALUES ('7603C777A121408CB0B083DAB44B8195', '2020-10-28 09:18:31', '0.00', '1', null, '31A145058D9E4214A6AD061513C5AFAE');
INSERT INTO `t_order` VALUES ('CD0A079999CF4585960DD47A584FF2EA', '2020-10-28 09:20:49', '0.00', '1', null, '1DC5633887214323AC39F2BAA2C70974');
INSERT INTO `t_order` VALUES ('D752947C73234201AC2DE7628F839019', '2020-10-28 09:14:39', '0.00', '1', null, '154D9032FA904626A80F752334DF19CD');

-- ----------------------------
-- Table structure for t_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
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

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('047814ADBF1E473997FC2A38396724C6', '0', '0.00', '943340DBFB81494A8FFD7520A3ACD7D0', '造船焊接与切割技术', 'CB-093', '16.00', 'book_img/jinggao_b.jpg', 'D752947C73234201AC2DE7628F839019');
INSERT INTO `t_orderitem` VALUES ('0DFD1DA8CEA642F785CD21A0DE143160', '0', '0.00', '915AE1032A06435D96CFD61C8BA00448', '船舶管路系统', 'CB-113', '17.00', 'book_img/jinggao_b.jpg', '18450A4295224B1FA374D04E369A3CD6');
INSERT INTO `t_orderitem` VALUES ('0E672DFEC92C467688EC2860C0FB4690', '0', '0.00', '6B51ED374C54435FA8FA8C7113D40D9E', '船舶焊接工艺', 'CB-075', '24.00', 'book_img/jinggao_b.jpg', 'D752947C73234201AC2DE7628F839019');
INSERT INTO `t_orderitem` VALUES ('2489684DAA544AAA9611A6E7AF99C721', '0', '0.00', '152E577DB4FA41D9B0D1864C8D969AED', '船舶焊接工工艺学（中级）', 'CB-150', '35.00', 'book_img/jinggao_b.jpg', 'CD0A079999CF4585960DD47A584FF2EA');
INSERT INTO `t_orderitem` VALUES ('54297A71602A43BBB7B9DACC1FED02A2', '0', '0.00', 'E625A170D6B04DFF8CCA64726A9649C7', 'CO2气体保护半自动焊焊工培训教程', 'CB-096', '18.00', 'book_img/jinggao_b.jpg', 'CD0A079999CF4585960DD47A584FF2EA');
INSERT INTO `t_orderitem` VALUES ('579BFAD6EFE54E32A2DCBFAF813AE3C3', '0', '0.00', '810326D7440C4999B0837D4A34C44C04', '工程制图测绘及技能实训指导', 'CB-098', '10.00', 'book_img/jinggao_b.jpg', '7603C777A121408CB0B083DAB44B8195');
INSERT INTO `t_orderitem` VALUES ('5C3294504D644E94AE72A2104832A4FE', '0', '0.00', '210830309AC74F28B0D76BF609497C28', '船舶材料与焊接', 'CB-108', '23.00', 'book_img/jinggao_b.jpg', 'CD0A079999CF4585960DD47A584FF2EA');
INSERT INTO `t_orderitem` VALUES ('6139F5B4D1E34EA2A9BD545AA9022F05', '0', '0.00', 'BC323A9B0FF4428C870141BD227882BC', '船舶制造基础', 'CB-128/2', '19.00', 'book_img/jinggao_b.jpg', '18450A4295224B1FA374D04E369A3CD6');
INSERT INTO `t_orderitem` VALUES ('646A986F1F9E4DEDBA0354B73A7249F8', '0', '0.00', '722F77FBE15F4760B6F1C28FFFB8EEB6', '船体装配工', 'CB-088', '29.00', 'book_img/jinggao_b.jpg', '2ECADF66BCB74D5C9A43E40BC8F1E2C5');
INSERT INTO `t_orderitem` VALUES ('8B9278C2455249ACA28B00F1349292CB', '0', '0.00', '1CA737D170C44A49A104B051F816767C', '船舶舾装工程', 'CB-109', '26.00', 'book_img/jinggao_b.jpg', '1809003188274F35A587E8F420F8D20A');
INSERT INTO `t_orderitem` VALUES ('945939A11DF04A14A6B0A617EA9B3A51', '0', '0.00', '7B0666025EC64049B2D52A60C613DA18', '实用供热空调设计手册（上下册）', 'CBX-137', '350.00', 'book_img/jinggao_b.jpg', '348699D22AC5403DBA18EF3D73593F80');
INSERT INTO `t_orderitem` VALUES ('AA02C8B3FAEA4880A2A0064DEF8F78E0', '0', '0.00', 'E28D5DD45F2A4228ADE77BD345E481EF', '船体识图（含图册)', 'CB-019', '28.50', 'book_img/jinggao_b.jpg', '18450A4295224B1FA374D04E369A3CD6');
INSERT INTO `t_orderitem` VALUES ('AB98CFB5EAE94A12ADA2717E991464E5', '0', '0.00', 'A4768F5F542146EE8CEA9717C2BEE4DA', '船舶结构与制图', 'CB-039/1', '38.00', 'book_img/jinggao_b.jpg', '18450A4295224B1FA374D04E369A3CD6');
INSERT INTO `t_orderitem` VALUES ('AF073C0FE8634833BA59492E009C92B3', '0', '0.00', 'A9593C6CE1154A9CB100F837A10A8460', '实用供热空调设计手册（上下册）', 'CBX-138', '350.00', 'book_img/jinggao_b.jpg', '348699D22AC5403DBA18EF3D73593F80');
INSERT INTO `t_orderitem` VALUES ('B4DC7BF182E2436290453F59DA54EB56', '0', '0.00', '7BC002F7AA2A43E7936B55273783061A', '船舶与海洋工程专业英语', 'CB-190', '28.00', 'book_img/jinggao_b.jpg', '1DF1DBCAEBB54F5EA0EC0E1F2D47E469');
INSERT INTO `t_orderitem` VALUES ('CD3C34FBFC6F408DACCD8FB32BDFBE0B', '0', '0.00', '2D2300E257274CF1AED19A81305614FD', '船体制图', 'CB-021/2', '15.50', 'book_img/jinggao_b.jpg', '18450A4295224B1FA374D04E369A3CD6');
INSERT INTO `t_orderitem` VALUES ('D15D7E80B25F46298449EFB8D100AE02', '0', '0.00', 'D4C25CCAB7D0439E9FA96279E50CE466', '电焊工（技能鉴定考核试题库）', 'CB-187', '13.50', 'book_img/jinggao_b.jpg', 'CD0A079999CF4585960DD47A584FF2EA');
INSERT INTO `t_orderitem` VALUES ('F93CFEF8673A49C9B166981A98E5EAA3', '0', '0.00', 'FA738185CE99423387984106ED5A5B11', '高级船舶焊接工操作技能', 'CB-091', '23.00', 'book_img/jinggao_b.jpg', 'CD0A079999CF4585960DD47A584FF2EA');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
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

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('001E99DC6671406DBDA16118CB9BBE70', '熊振林', '888888', '111126@qq.com', '1', '0D98C33456D044109AF0CD9AF970551CEED4596A71974FE3B96E295F4465105E');
INSERT INTO `t_user` VALUES ('009C1D6E71344003B065CC2FF6E1C19D', '杨珍子', '888888', '111118@qq.com', '1', '04446794DF1F4F62A8DAE6BD32719BA0E30B51328F2245898EAD987B1193915E');
INSERT INTO `t_user` VALUES ('01F07043951449C99B36B8956F917830', '何七荣', '888888', '111141@qq.com', '1', '36FDD44E8CBE4417A50F844DFE00591677F9C8393ED9491684153F1C1F25D8F3');
INSERT INTO `t_user` VALUES ('04A52493202A4E41BC2F209F6BA0ABCC', '桑玉蕊', '888888', '111142@qq.com', '1', 'A8725B27EBEF4885B241738039742612E7662FF3B1AB425CACDF1DB7B0B672C1');
INSERT INTO `t_user` VALUES ('116A516E4E8542A7B8E102D859CC5CE1', '孙超', '888888', '111143@qq.com', '1', '072248F97EDF4D6E85073EA5C43018E2E2FB43E5B9F44B16BF5FCDAEE59C1168');
INSERT INTO `t_user` VALUES ('154D9032FA904626A80F752334DF19CD', '刘赣华', '888888', '111150@qq.com', '1', 'B1A7B625960347F1B8BB70F80218C079F4DD50FC891B439B990E4CF16EDDD37F');
INSERT INTO `t_user` VALUES ('1B06E2932A9541FC86C8B6B370823FD2', '周卫平', '888888', '111135@qq.com', '1', '03FCBD898E6440C897C67C01EE683C0F4782C003458D415EB601860EA6BED5BC');
INSERT INTO `t_user` VALUES ('1C3F5D68F1E14ED19E4ABD6FFD2C2114', '张施楠', '888888', '111132@qq.com', '1', '5E0A3B303F9B4FBDBE1D940C964F00154CEFBD2C516F445090EE5F4241885FB3');
INSERT INTO `t_user` VALUES ('1DC5633887214323AC39F2BAA2C70974', '李伟', '888888', '111128@qq.com', '1', 'BC1595B2F7B945F2BA28CAC18521F6F8F6A620AEEDC14470849E29BD6B7D4491');
INSERT INTO `t_user` VALUES ('1DFA1FD99464492E89664B3D4717CFBB', '徐剑', '888888', '111144@qq.com', '1', '24F01599CF244523905DDA698C5FFDD1B4622A3F08564A16967EB3ABC7136DA8');
INSERT INTO `t_user` VALUES ('262AA1BBB2D9463D85B7B77DE9C935F6', '连树清', '888888', '111146@qq.com', '1', 'B34A7D8629844C0C86C919F3B0B2918A4FDD7B357415463FB4CF627C94D90DBD');
INSERT INTO `t_user` VALUES ('280EEB59AFEE487A8EA40F6AC31BE646', '罗威', '888888', '111138@qq.com', '1', 'F55D7045C203406D96E6E7AC9A0890E428284BF6B94B410C923B2E655DF31988');
INSERT INTO `t_user` VALUES ('288A85B2C2974684AACA656B8CF491E2', '展龙', 'zl113592', '111121@qq.com', '1', 'D512E208BF64436F9A0BA1A9028C6BCC5FE4BB4CA0FD41AB93132ED8D2D0F2E6');
INSERT INTO `t_user` VALUES ('2E9B478D75394B56A61255D74CED67C7', '江明', '888888', '111148@qq.com', '1', '2C603B35EA964D5B89C933616F585AFA243F8A6A58EA45A2999B84A062997D0C');
INSERT INTO `t_user` VALUES ('31A145058D9E4214A6AD061513C5AFAE', '高靖', '888888', '111111@qq.com', '1', 'D09144F0700B480FAF28D01439DD1692978FC833F88A497A8B97E5B13DAA56B4');
INSERT INTO `t_user` VALUES ('392D3681C393407CBADBE57C352C86D3', '徐海青', '888888', '111124@qq.com', '1', '978B125AF6664040AD5591623022DE52F03EB9E41D194693AD0696BC42F1B697');
INSERT INTO `t_user` VALUES ('3BDD90B20ECC4C7AA13F2908A1CECA73', '张伟明', '888888', '111127@qq.com', '1', '8DC59926DD934E42A13A28FB7984C3936BF6E3247C8C49B289324B8CCF5BF645');
INSERT INTO `t_user` VALUES ('40B8EC2426574C9C9BD0F4894CF058BF', '肖雄', '888888', '111140@qq.com', '1', '103B1B1923764601B55A5EA385C8152FEEBB2044EC9D440BAC62745AD46CF46F');
INSERT INTO `t_user` VALUES ('419DC5C15F13453C8F4813CCB22B87C9', '李明华', '888888', '111114@qq.com', '1', 'AF6BCB80923A4B5EBCCFAD32C2125E1CB9ACDA2E358C4A6EAC8171EB4786D1EC');
INSERT INTO `t_user` VALUES ('43CE932BD7534B81805FAB9D0BDF275E', '吴鸿燕', '888888', '111130@qq.com', '1', '2AC5E4021961439EA2EE80570FC0CC14AA6374DFC9CE419EBC077F8ADAB867CB');
INSERT INTO `t_user` VALUES ('44B99B4F49074E0EB4194F451384CC3E', '吴渡平', '888888', '111115@qq.com', '1', '91588C0F78164C0391863F7E92CB6550B927B44A412741BDACCF039207621112');
INSERT INTO `t_user` VALUES ('4E376F959C3245879230BD46476F834E', '张东升', '888888', '111117@qq.com', '1', 'B1ACBE4E3A394516913D0CC67FF00BAAB6367B19131C4156AC1DB7D32B792839');
INSERT INTO `t_user` VALUES ('549B589E761843ECA9ADBAD3629D443F', '闵雪睿', '888888', '111119@qq.com', '1', '9A96321F3209456D9038F2A65C8F96A7FEA17C24F0B846DDA8006A53F0BF535F');
INSERT INTO `t_user` VALUES ('552240963363431CAB27F69DED276564', '凌云霞飞', '888888', '111149@qq.com', '1', '56F9A00060554A17B17401578017C902A5E59EA2A551455D9337CA9D3AF12BBA');
INSERT INTO `t_user` VALUES ('5788CFE631E84B8A9B55DA517426333D', '奚泉', '888888', '111129@qq.com', '1', 'B3A43F7F3D704584A0EB841F415CF44145FC3856955744D5A8F28C13AA52948B');
INSERT INTO `t_user` VALUES ('664B7A8AB764427BBA2926C5EF9BCB1C', '彭凡林', '888888', '111131@qq.com', '1', '293FB4FC9E8348A4ABEC685D275517A52E4C07314F534F4692DC34D072B8EEA2');
INSERT INTO `t_user` VALUES ('6968514CCEDB415E98F7B344CE445DAA', '江帆', '888888', '111113@qq.com', '1', '8DEA159DEA7045AF993A82C449C6AA97FEB91B72920042FE8E7B179AC70172B2');
INSERT INTO `t_user` VALUES ('71D896B666384D0FBE97E261346CE576', '郭明慧', '888888', '111123@qq.com', '1', '00E796B1731342BB876687FB36D031F46FD5813E043D466F8AA22428C60656D5');
INSERT INTO `t_user` VALUES ('7E4C9C0746E24B35B6C0EBF2E20EFBBC', '杨霞', '888888', '111116@qq.com', '1', '29DA05B32F064F5AB76E77DFA73EDA90042F24DC7A334420A3174EB2F5211E13');
INSERT INTO `t_user` VALUES ('89A9A4B5D4B849A7BE0AC1C00B39C42B', '左迁', '888888', '111134@qq.com', '1', '0EACC43EC55E415183442BE36B9F7DFBDBF64294C0004801B4351DD22C721707');
INSERT INTO `t_user` VALUES ('8EC439804C6342E3ACD3719B4E42B03C', '朱庆太', '888888', '111145@qq.com', '1', '37525F9D8DB941E09B968D038A83C0051A39196757DA485891AB7DAFD29F408E');
INSERT INTO `t_user` VALUES ('A9F866859EDD4A0698D0A5E22F55B168', '彭欣健', '888888', '111112@qq.com', '1', '800AB8F3B943458AA58B681C37958928EEA87E36CCB044F7A4799B1A261FE13C');
INSERT INTO `t_user` VALUES ('B22530B542054B3EB0D2BEBA67D90CA9', '陈永备', '888888', '111137@qq.com', '1', 'DCA105474BD14CF2A881C2315700613DFC796C76DA3E4C59B22CA2C85257FB1B');
INSERT INTO `t_user` VALUES ('BD07677500DF4524B3A6A4C9C7570864', '邢燕', '888888', '111139@qq.com', '1', '5C95A83831214034803C3D130FB9C23F97DA8BBD32C6477589B7B60BD5654C69');
INSERT INTO `t_user` VALUES ('C4BF65B21E7E4493875B27449347E30D', '陈炯', '888888', '111120@qq.com', '1', '8F0D21B6ABB94FFE8612CEFE81568AAB986031F9183C469DBDE9492ADC074CD8');
INSERT INTO `t_user` VALUES ('D7057F5534604E23943DDD7EC21B0270', '吴振勇', '888888', '111133@qq.com', '1', 'CA722CB802D14D5AB0AF5EEAAB4D050F1CA64935881447688A662144BE097195');
INSERT INTO `t_user` VALUES ('DB91285C83E14620BC766FE5220E0711', '吴伟国', '888888', '111122@qq.com', '1', 'A86C85541DDF4ED7AFCB3449918BE12196E66B8024CE4F6E97771E78E57DB8FB');
INSERT INTO `t_user` VALUES ('DD0390F546694444B19433A6A8B9449C', '孙坚', 'sj10706sj', '111147@qq.com', '1', 'DA9F35817A48469BA98BE92B4CFCB4EB8E82F2C17855479685A0374E52824D91');
INSERT INTO `t_user` VALUES ('E213F2AA5D464876AC09995E431E174D', '张远刚', '888888', '111136@qq.com', '1', '8131DEF501CA44439BE2644A87306689AE5D494BD2AA418AB0A91D91B107FA9D');
INSERT INTO `t_user` VALUES ('F4A52625DD7E4F63960245CDD024A909', '汪涛', '888888', '111125@qq.com', '1', 'E574410495AE421882F52ABF5D6C0ECC4A39732BB1744F67950A4928772E7A05');
