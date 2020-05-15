/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : homemaking

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2020-04-29 14:59:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accept
-- ----------------------------
DROP TABLE IF EXISTS `accept`;
CREATE TABLE `accept` (
  `AC_ID` int(12) NOT NULL AUTO_INCREMENT COMMENT '接单编号',
  `AC_AP_ID` int(10) DEFAULT NULL COMMENT '接单对应的申请编号',
  `AC_W_ID` int(8) DEFAULT NULL COMMENT '接单人编号',
  PRIMARY KEY (`AC_ID`),
  KEY `AC_AP_ID` (`AC_AP_ID`),
  KEY `AC_W_ID` (`AC_W_ID`),
  CONSTRAINT `accept_ibfk_1` FOREIGN KEY (`AC_AP_ID`) REFERENCES `application` (`AP_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accept_ibfk_2` FOREIGN KEY (`AC_W_ID`) REFERENCES `worker` (`W_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accept
-- ----------------------------
INSERT INTO `accept` VALUES ('15', '4', '1');
INSERT INTO `accept` VALUES ('23', '7', '35');
INSERT INTO `accept` VALUES ('24', '1', '36');
INSERT INTO `accept` VALUES ('25', '5', '36');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `A_ID` int(5) NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `A_NAME` char(11) NOT NULL COMMENT '管理员名',
  `A_PASSWORD` char(18) NOT NULL DEFAULT '123456' COMMENT '管理员密码',
  `A_PHONE` char(11) DEFAULT NULL COMMENT '管理员手机号',
  `A_SEX` int(1) DEFAULT '0' COMMENT '管理员性别',
  `A_ROLE` int(2) DEFAULT '2' COMMENT '管理员级别',
  `A_PHOTO` char(30) DEFAULT '20180414165754.jpg' COMMENT '管理员头像',
  PRIMARY KEY (`A_ID`),
  KEY `A_ROLE` (`A_ROLE`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`A_ROLE`) REFERENCES `admintype` (`AT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'cbq', 'cbq', '18118839344', '0', '1', '20180414165840.jpg');
INSERT INTO `admin` VALUES ('19', '吴磊', '123456', '15052720752', '1', '2', '20180414165754.jpg');
INSERT INTO `admin` VALUES ('20', '房亮', '123456', '15052720111', '0', '2', '20180414165754.jpg');
INSERT INTO `admin` VALUES ('21', 'eeeee', '123456', '15356254211', '1', '2', '20180414165754.jpg');
INSERT INTO `admin` VALUES ('22', 'yyyyyy', '123456', '15324896569', '0', '2', '20180414165754.jpg');
INSERT INTO `admin` VALUES ('23', 'vvvvvvv', '123456', '13456789098', '1', '2', '20180414165754.jpg');
INSERT INTO `admin` VALUES ('25', 'llllll', '123456', '15485623565', '1', '2', '20180414165754.jpg');
INSERT INTO `admin` VALUES ('26', 'jjjjjj', '123456', '15325852888', '0', '2', '20180414165754.jpg');
INSERT INTO `admin` VALUES ('27', 'cbq', '123456', '18118839344', '1', '1', '20180414165846.jpg');
INSERT INTO `admin` VALUES ('28', 'cbqcbq3', '123456', '15052720758', '0', '2', '20180414165754.jpg');
INSERT INTO `admin` VALUES ('30', '常意杨', '123456', '15052720756', '0', '2', '20180414165754.jpg');
INSERT INTO `admin` VALUES ('31', '李永强', '123456', '15052729527', '1', '2', '20180414165754.jpg');
INSERT INTO `admin` VALUES ('32', 'cbq', '123456', '15374656475', '0', '2', '20180414165754.jpg');
INSERT INTO `admin` VALUES ('34', '张三', '123456', '18574639876', '0', '2', '20180414165754.jpg');

-- ----------------------------
-- Table structure for admintype
-- ----------------------------
DROP TABLE IF EXISTS `admintype`;
CREATE TABLE `admintype` (
  `AT_ID` int(2) NOT NULL AUTO_INCREMENT COMMENT '管理员级别编号',
  `AT_TYPE` char(10) DEFAULT NULL COMMENT '管理员级别',
  PRIMARY KEY (`AT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admintype
-- ----------------------------
INSERT INTO `admintype` VALUES ('1', '一级管理员');
INSERT INTO `admintype` VALUES ('2', '二级管理员');

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `AP_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '申请下单编号',
  `AP_U_ID` int(8) NOT NULL COMMENT '申请人',
  `AP_TYPE` char(10) NOT NULL COMMENT '申请的服务类型',
  `AP_PRICE` int(7) DEFAULT NULL COMMENT '单子的价钱',
  `AP_POSTDATE` datetime DEFAULT NULL COMMENT '申请的时间',
  `AP_TIMEON` datetime DEFAULT NULL COMMENT '服务的开始时间',
  `AP_TIMEOFF` datetime DEFAULT NULL COMMENT '服务的结束时间',
  `AP_CLAIM` varchar(50) DEFAULT NULL COMMENT '要求',
  PRIMARY KEY (`AP_ID`),
  KEY `AP_U_ID` (`AP_U_ID`),
  KEY `AP_TYPE` (`AP_TYPE`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`AP_U_ID`) REFERENCES `user` (`U_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `application_ibfk_2` FOREIGN KEY (`AP_TYPE`) REFERENCES `workertype` (`WT_TYPE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES ('1', '1', '宠物托管', '12', '2020-04-13 14:46:48', '2020-04-15 14:46:52', '2020-04-22 14:46:55', '1345');
INSERT INTO `application` VALUES ('2', '1', '宠物托管', '134', '2020-03-10 17:39:43', '2020-03-05 17:39:47', '2020-03-06 17:39:52', '随便男女');
INSERT INTO `application` VALUES ('4', '2', '保洁服务', '788', '2020-03-09 17:40:34', '2020-03-17 17:40:38', '2020-03-18 17:40:42', '男女随便');
INSERT INTO `application` VALUES ('5', '1', '宠物托管', '1', '2020-04-15 10:17:43', '2020-04-15 00:00:00', '2020-04-22 00:00:00', '男女随便');
INSERT INTO `application` VALUES ('6', '1', '搬家服务', '1', '2020-04-17 09:45:30', '2020-04-17 00:00:00', '2020-04-23 00:00:00', '必须是女的');
INSERT INTO `application` VALUES ('7', '22', '保姆服务', '5', '2020-04-19 04:11:01', '2020-04-13 00:00:00', '2020-04-21 00:00:00', '要男的');
INSERT INTO `application` VALUES ('8', '6', '家电清洗', '345', '2020-04-19 17:52:30', '2020-04-23 17:52:33', '2020-04-19 17:52:38', '随便');
INSERT INTO `application` VALUES ('9', '1', '家电清洗', '345', '2020-04-19 17:52:30', '2020-04-23 17:52:33', '2020-04-19 17:52:38', '随便');
INSERT INTO `application` VALUES ('10', '8', '家电清洗', '345', '2020-04-19 17:52:30', '2020-04-23 17:52:33', '2020-04-19 17:52:38', '随便');

-- ----------------------------
-- Table structure for chargetype
-- ----------------------------
DROP TABLE IF EXISTS `chargetype`;
CREATE TABLE `chargetype` (
  `C_ID` int(1) NOT NULL AUTO_INCREMENT COMMENT '收费方式编号',
  `C_NAME` char(5) DEFAULT NULL COMMENT '收费方式',
  PRIMARY KEY (`C_ID`),
  KEY `C_NAME` (`C_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chargetype
-- ----------------------------
INSERT INTO `chargetype` VALUES ('3', '一次性收费');
INSERT INTO `chargetype` VALUES ('2', '按天收费');
INSERT INTO `chargetype` VALUES ('1', '按时收费');

-- ----------------------------
-- Table structure for functionafter
-- ----------------------------
DROP TABLE IF EXISTS `functionafter`;
CREATE TABLE `functionafter` (
  `FA_ID` int(2) NOT NULL AUTO_INCREMENT COMMENT '后台功能编号',
  `FA_AT_ID` int(2) DEFAULT NULL COMMENT '功能对应的管理员编号',
  `FA_FUNCTION` char(10) DEFAULT NULL COMMENT '功能',
  PRIMARY KEY (`FA_ID`),
  KEY `FA_AT_ID` (`FA_AT_ID`),
  CONSTRAINT `functionafter_ibfk_1` FOREIGN KEY (`FA_AT_ID`) REFERENCES `admintype` (`AT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of functionafter
-- ----------------------------
INSERT INTO `functionafter` VALUES ('1', '1', '管理管理员');
INSERT INTO `functionafter` VALUES ('2', '2', '不能管理管理员');

-- ----------------------------
-- Table structure for functionbefore
-- ----------------------------
DROP TABLE IF EXISTS `functionbefore`;
CREATE TABLE `functionbefore` (
  `FB_ID` int(1) NOT NULL AUTO_INCREMENT COMMENT '前台功能编号',
  `FB_NAME` char(2) DEFAULT NULL COMMENT '角色',
  `FB_FUNCTION` char(10) DEFAULT NULL COMMENT '角色的功能',
  PRIMARY KEY (`FB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of functionbefore
-- ----------------------------
INSERT INTO `functionbefore` VALUES ('0', '员工', null);
INSERT INTO `functionbefore` VALUES ('1', '用户', null);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `O_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `O_U_ID` int(8) NOT NULL COMMENT '订单对应的用户编号',
  `O_W_ID` int(8) NOT NULL COMMENT '订单对应的家政人员编号',
  `O_TYPE` char(10) DEFAULT NULL COMMENT '订单的服务类型',
  `O_POSTDATE` datetime DEFAULT NULL COMMENT '订单成立时间',
  `O_TIMEON` datetime DEFAULT NULL COMMENT '服务开始时间',
  `O_TIMEOFF` datetime DEFAULT NULL COMMENT '服务结束时间',
  `O_PRICE` int(7) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`O_ID`),
  KEY `O_U_ID` (`O_U_ID`),
  KEY `O_W_ID` (`O_W_ID`),
  KEY `O_TYPE` (`O_TYPE`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`O_U_ID`) REFERENCES `user` (`U_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`O_W_ID`) REFERENCES `worker` (`W_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`O_TYPE`) REFERENCES `workertype` (`WT_TYPE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('7', '1', '6', '家电清洗', '2020-04-12 07:13:27', '2020-04-08 00:00:00', '2020-04-29 00:00:00', '968');
INSERT INTO `orders` VALUES ('8', '1', '6', '家电清洗', '2020-04-12 07:18:27', '2020-04-12 15:20:54', '2020-04-30 15:20:57', '836');
INSERT INTO `orders` VALUES ('9', '1', '6', '家电清洗', '2020-04-12 07:20:02', '2020-04-12 15:20:54', '2020-04-30 15:20:57', '836');
INSERT INTO `orders` VALUES ('10', '1', '6', '家电清洗', '2020-04-12 07:21:52', '2020-04-12 15:20:54', '2020-04-30 15:20:57', '836');
INSERT INTO `orders` VALUES ('11', '1', '6', '家电清洗', '2020-04-12 07:23:02', '2020-04-12 15:20:54', '2020-04-30 15:20:57', '836');
INSERT INTO `orders` VALUES ('12', '1', '6', '家电清洗', '2020-04-12 07:23:33', '2020-04-06 00:00:00', '2020-04-28 00:00:00', '1012');
INSERT INTO `orders` VALUES ('13', '1', '6', '家电清洗', '2020-04-12 07:24:33', '2020-04-06 00:00:00', '2020-04-28 00:00:00', '1012');
INSERT INTO `orders` VALUES ('14', '1', '6', '家电清洗', '2020-04-12 07:33:51', '2020-04-05 00:00:00', '2020-04-20 00:00:00', '704');
INSERT INTO `orders` VALUES ('15', '1', '14', '保洁服务', '2020-04-13 04:51:21', '2020-04-06 00:00:00', '2020-04-07 00:00:00', '850');
INSERT INTO `orders` VALUES ('18', '1', '22', '月嫂服务', '2020-04-17 09:21:29', '2020-04-12 15:20:54', '2020-04-17 00:00:00', '655');
INSERT INTO `orders` VALUES ('19', '1', '14', '保洁服务', '2020-04-24 02:08:26', '2020-04-08 00:00:00', '2020-04-09 00:00:00', '816');
INSERT INTO `orders` VALUES ('20', '1', '14', '保洁服务', '2020-04-26 02:00:08', '2020-04-12 15:20:54', '2020-04-30 15:20:57', '14688');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `R_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `R_W_ID` int(8) NOT NULL COMMENT '被评论的家政人员编号',
  `R_U_ID` int(8) NOT NULL COMMENT '评论的用户编号',
  `R_DATE` date DEFAULT NULL COMMENT '评论时间',
  `R_CONTENT` varchar(30) DEFAULT NULL COMMENT '评论内容',
  `R_GRADE` double(2,1) DEFAULT NULL COMMENT '给家政人员的打分',
  PRIMARY KEY (`R_ID`),
  KEY `review_ibfk_1` (`R_W_ID`),
  KEY `R_U_ID` (`R_U_ID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`R_W_ID`) REFERENCES `worker` (`W_ID`) ON DELETE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`R_U_ID`) REFERENCES `user` (`U_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('8', '14', '1', '2020-04-14', '第一评论', '4.4');
INSERT INTO `review` VALUES ('9', '14', '2', '2020-04-14', '第二个评论', '9.9');
INSERT INTO `review` VALUES ('12', '14', '6', null, '第二个评论', '7.7');
INSERT INTO `review` VALUES ('13', '8', '1', '2020-04-14', '11111', '5.0');
INSERT INTO `review` VALUES ('16', '22', '1', '2020-04-17', '号', '7.7');
INSERT INTO `review` VALUES ('17', '19', '1', '2020-04-21', '真好看', '7.0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `U_ID` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `U_NAME` char(11) NOT NULL COMMENT '用户名称',
  `U_PASSWORD` char(32) NOT NULL COMMENT '用户密码',
  `U_PHONE` char(11) DEFAULT NULL COMMENT '用户手机号',
  `U_SEX` int(1) DEFAULT '0' COMMENT '用户性别（0为女，1为男）',
  `U_BIRTHDAY` date DEFAULT NULL COMMENT '生日',
  `U_ROLE` int(1) NOT NULL DEFAULT '0' COMMENT '角色',
  `U_PHOTO` char(50) DEFAULT '20180414170003.jpg' COMMENT '用户头像',
  PRIMARY KEY (`U_ID`),
  UNIQUE KEY `U_NAME` (`U_NAME`) USING BTREE,
  UNIQUE KEY `U_PHONE` (`U_PHONE`) USING BTREE,
  KEY `U_ROLE` (`U_ROLE`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`U_ROLE`) REFERENCES `functionbefore` (`FB_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'cbq', '202cb962ac59075b964b07152d234b70', '15052720756', '0', '1997-11-29', '0', 'f9e49309-c30a-44f0-bf53-b894897d415d.jpg');
INSERT INTO `user` VALUES ('2', 'htdb', '202cb962ac59075b964b07152d234b70', '15045678989', '0', '2019-10-08', '0', '20180414165947.jpg');
INSERT INTO `user` VALUES ('6', 'yjtddd', '202cb962ac59075b964b07152d234b70', '15052720758', '1', '1994-10-31', '0', 'fb789020-5d2b-47bc-82fe-34c0aa8e1eba.png');
INSERT INTO `user` VALUES ('7', 'dhtyn', 'e10adc3949ba59abbe56e057f20f883e', '15076767676', '1', '2020-04-12', '0', '20180414170003.jpg');
INSERT INTO `user` VALUES ('8', 'umkkui', '202cb962ac59075b964b07152d234b70', '43277', '1', '2017-12-12', '0', '20180414170003.jpg');
INSERT INTO `user` VALUES ('14', 'ggg', '202cb962ac59075b964b07152d234b70', '15111111111', '0', '2020-04-07', '0', '20180414170003.jpg');
INSERT INTO `user` VALUES ('15', '小林', '202cb962ac59075b964b07152d234b70', '15756785748', '1', '2020-04-06', '0', '20180414170003.jpg');
INSERT INTO `user` VALUES ('19', '1去111', '202cb962ac59075b964b07152d234b70', '15211111111', '0', '2020-04-06', '0', '20180414170003.jpg');
INSERT INTO `user` VALUES ('20', '11111', '202cb962ac59075b964b07152d234b70', '13111111111', '0', '2020-04-20', '0', '20180414170003.jpg');
INSERT INTO `user` VALUES ('22', 'cyy', '202cb962ac59075b964b07152d234b70', '18118839344', '1', '1997-11-29', '0', '7daabf6f-4e05-45de-8e56-1ac6ac9b4302.jpg');
INSERT INTO `user` VALUES ('23', '吴庭旭小吴', 'e10adc3949ba59abbe56e057f20f883e', '13913234567', '1', '1997-04-20', '0', '20180414170003.jpg');
INSERT INTO `user` VALUES ('24', '吴玥小吴2', 'e10adc3949ba59abbe56e057f20f883e', '15065656565', '0', '2020-04-13', '0', '20180414170003.jpg');
INSERT INTO `user` VALUES ('25', 'xw123', '202cb962ac59075b964b07152d234b70', '13913271693', '1', '1997-11-28', '0', '20180414170003.jpg');

-- ----------------------------
-- Table structure for worker
-- ----------------------------
DROP TABLE IF EXISTS `worker`;
CREATE TABLE `worker` (
  `W_ID` int(8) NOT NULL AUTO_INCREMENT COMMENT '家政人员编号',
  `W_NAME` char(11) NOT NULL COMMENT '家政人员称呼',
  `W_PASSWORD` char(32) NOT NULL COMMENT '家政人员密码',
  `W_PHONE` char(11) DEFAULT NULL COMMENT '家政人员手机号',
  `W_SEX` int(1) DEFAULT '0' COMMENT '家政人员性别(0女1男)',
  `W_IDCARD` char(18) DEFAULT NULL COMMENT '家政人员身份证件',
  `W_TRUENAME` char(10) DEFAULT NULL COMMENT '家政人员真实姓名',
  `W_ADDRESS` varchar(30) DEFAULT NULL COMMENT '家政人员服务地址',
  `W_PHOTO` char(50) DEFAULT '20180414170003.jpg' COMMENT '家政人员本人照片',
  `W_EXPERIENCE` int(2) DEFAULT NULL COMMENT '家政人员从业经验（年）',
  `W_C_NAME` char(5) DEFAULT NULL COMMENT '家政人员收费方式',
  `W_CHARGE` int(5) DEFAULT NULL COMMENT '家政人员收费',
  `W_WT_TYPE` char(10) DEFAULT NULL COMMENT '家政人员服务类型',
  `W_INTRODUCE` varchar(30) DEFAULT NULL COMMENT '家政人员自我评价',
  `W_ROLE` int(1) NOT NULL DEFAULT '1' COMMENT '家政人员对应编号',
  `W_STATE` int(1) NOT NULL DEFAULT '0' COMMENT '家政人员状态（0待审核 1审核通过）',
  `W_SCORE` double(3,1) DEFAULT '8.0' COMMENT '评分',
  PRIMARY KEY (`W_ID`),
  KEY `W_ROLE` (`W_ROLE`),
  KEY `W_WT_ID` (`W_WT_TYPE`),
  KEY `W_C_NAME` (`W_C_NAME`),
  CONSTRAINT `worker_ibfk_1` FOREIGN KEY (`W_ROLE`) REFERENCES `functionbefore` (`FB_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `worker_ibfk_3` FOREIGN KEY (`W_C_NAME`) REFERENCES `chargetype` (`C_NAME`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `worker_ibfk_4` FOREIGN KEY (`W_WT_TYPE`) REFERENCES `workertype` (`WT_TYPE`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worker
-- ----------------------------
INSERT INTO `worker` VALUES ('0', '还没人接单', '还没人接单', '15087878989', '0', '宇宙', '宇宙', '宇宙', '20180414170003.jpg', '1', '一次性收费', '999999', '搬家服务', '希望你能找到我', '0', '0', '0.0');
INSERT INTO `worker` VALUES ('1', 'cbq', 'a1d066aece6a04638308d85a3b73d665', '14567876789', '0', 'cbq', 'cbq', 'js', '20180414165754.jpg', '8', '一次性收费', '345', '保洁服务', 'hao ', '0', '1', null);
INSERT INTO `worker` VALUES ('6', '的点点滴滴', '202cb962ac59075b964b07152d234b70', '15052720758', '1', '赵钱孙李', '赵钱孙李', '北京', 'default.jpg', '3', '按时收费', '44', '家电清洗', '我非常的专业', '0', '1', '7.7');
INSERT INTO `worker` VALUES ('7', '灌灌灌灌的', '202cb962ac59075b964b07152d234b70', '18569568356', '1', '赵钱孙李', '赵钱孙李', '江苏', '20180414165914.jpg', '3', '按天收费', '44', '保姆服务', '好好好爱护好好好好好好好好好', '0', '1', '3.0');
INSERT INTO `worker` VALUES ('8', '斤斤计较军军', '202cb962ac59075b964b07152d234b70', '14586923456', '0', '赵钱孙李', '赵钱孙李', '江苏', '20180414165914.jpg', '4', '按时收费', '44', '家电清洗', '好好好爱护好好好好好好好好好', '0', '1', '9.3');
INSERT INTO `worker` VALUES ('12', '67657', '202cb962ac59075b964b07152d234b70', '13212121212', '0', '11111111111111', '吴ddd', '无锡', '20180414165936.jpg', '-1', '按时收费', '456', '搬家服务', '好好好爱护好好好好好好好好好', '0', '1', '5.0');
INSERT INTO `worker` VALUES ('14', '保洁服务', '无', '11111111111', '0', '省心家政', '省心家政', '江苏', '20180414170003.jpg', '5', '按时收费', '34', '保洁服务', '好好好爱护好好好好好好好好好', '0', '1', '9.9');
INSERT INTO `worker` VALUES ('15', '宠物托管', '无', '11111111111', '0', '省心家政', '省心家政', '江苏', '20180414170003.jpg', '56', '按时收费', '54', '宠物托管', '好好好爱护好好好好好好好好好方法反反复复反复反复反复反复', '0', '1', '9.9');
INSERT INTO `worker` VALUES ('18', '家电清洗', '无', '11111111111', '0', '省心家政', '省心家政', '江苏', '20180414170003.jpg', '5', '一次性收费', '34', '家电清洗', '好好好爱护好好好好好好好好好', '0', '1', '9.9');
INSERT INTO `worker` VALUES ('19', '保姆服务', '无', '11111111111', '0', '省心家政', '省心家政', '江苏', '20180414170003.jpg', '8', '一次性收费', '456', '保姆服务', '好好好爱护好好好好好好好好好', '0', '1', '9.9');
INSERT INTO `worker` VALUES ('20', '搬家服务', '无', '11111111111', '0', '省心家政', '省心家政', '江苏', '20180414170003.jpg', '7', '一次性收费', '56', '搬家服务', '好好好爱护好好好好好好好好好', '0', '1', '9.9');
INSERT INTO `worker` VALUES ('21', '空调维修', '无', '11111111111', '0', '省心家政', '省心家政', '江苏', '20180414170003.jpg', '8', '一次性收费', '4567', '空调维修', '好好好爱护好好好好好好好好好', '0', '1', '9.9');
INSERT INTO `worker` VALUES ('22', '月嫂服务', '无', '11111111111', '1', '省心家政', '省心家政', '江苏', '20180414170003.jpg', '6', '一次性收费', '655', '月嫂服务', '好好好爱护好好好好好好好好好', '0', '1', '9.9');
INSERT INTO `worker` VALUES ('24', '王阿姨', '202cb962ac59075b964b07152d234b70', '15000000000', '1', '姓名', '身份证', '地球', '20180414165947.jpg', '4', '按天收费', '400', '保姆服务', '待人诚恳，仔细耐心', '0', '1', '8.0');
INSERT INTO `worker` VALUES ('25', '赵阿姨', '202cb962ac59075b964b07152d234b70', '15000000001', '1', '姓名', '身份证', '地球', '20180414165942.jpg', '4', '按天收费', '400', '保姆服务', '待人诚恳，仔细耐心', '0', '1', '8.0');
INSERT INTO `worker` VALUES ('26', '钱阿姨', '202cb962ac59075b964b07152d234b70', '15000000002', '1', '姓名', '身份证', '地球', '20180414165936.jpg', '4', '按天收费', '400', '保姆服务', '待人诚恳，仔细耐心', '0', '1', '9.6');
INSERT INTO `worker` VALUES ('27', '孙阿姨', '202cb962ac59075b964b07152d234b70', '15000000003', '1', '姓名', '身份证', '地球', '20180414165927.jpg', '4', '按天收费', '400', '保姆服务', '待人诚恳，仔细耐心', '0', '1', '8.0');
INSERT INTO `worker` VALUES ('28', '李阿姨', '202cb962ac59075b964b07152d234b70', '15000000004', '1', '姓名', '身份证', '地球', '20180414165920.jpg', '4', '按天收费', '400', '保姆服务', '待人诚恳，仔细耐心', '0', '1', '9.7');
INSERT INTO `worker` VALUES ('29', '周阿姨', '202cb962ac59075b964b07152d234b70', '15000000005', '1', '姓名', '身份证', '地球', '20180414165914.jpg', '4', '按天收费', '400', '保姆服务', '待人诚恳，仔细耐心', '0', '1', '8.0');
INSERT INTO `worker` VALUES ('30', '吴阿姨', '202cb962ac59075b964b07152d234b70', '15000000006', '1', '姓名', '身份证', '地球', '20180414165909.jpg', '4', '按天收费', '400', '保姆服务', '待人诚恳，仔细耐心', '0', '1', '9.5');
INSERT INTO `worker` VALUES ('31', '郑阿姨', '202cb962ac59075b964b07152d234b70', '15000000007', '1', '姓名', '身份证', '地球', '20180414165855.jpg', '4', '按天收费', '400', '保姆服务', '待人诚恳，仔细耐心', '0', '1', '8.0');
INSERT INTO `worker` VALUES ('32', '冯阿姨', '202cb962ac59075b964b07152d234b70', '15000000008', '1', '姓名', '身份证', '地球', '20180414165846.jpg', '4', '按天收费', '400', '保姆服务', '待人诚恳，仔细耐心', '0', '0', '9.8');
INSERT INTO `worker` VALUES ('33', '王阿姨', '202cb962ac59075b964b07152d234b70', '15000000009', '1', '姓名', '身份证', '地球', '20180414165840.jpg', '4', '按天收费', '400', '保姆服务', '待人诚恳，仔细耐心', '0', '1', '8.0');
INSERT INTO `worker` VALUES ('34', '王阿姨', '202cb962ac59075b964b07152d234b70', '15000000010', '0', '姓名', '身份证', '地球', '20180414165834.jpg', '4', '按天收费', '400', '保姆服务', '待人诚恳，仔细耐心', '0', '0', '8.0');
INSERT INTO `worker` VALUES ('35', 'cyy', '202cb962ac59075b964b07152d234b70', '15000000011', '0', 'cyy', 'cyy', 'sfd', '20180414165827.jpg', '3', '按天收费', '456', '保姆服务', 'dsfasdf', '1', '1', '5.0');
INSERT INTO `worker` VALUES ('36', 'cyy', '202cb962ac59075b964b07152d234b70', '15052720753', '1', '321232133322223', '常一阳', '南京', '20180414165821.jpg', '50', '按天收费', '97', '宠物托管', '乐观，积极向上', '1', '1', '8.0');
INSERT INTO `worker` VALUES ('37', '王阿姨', '202cb962ac59075b964b07152d234b70', '15323232324', '0', '1234567878', '张上', '北京', '20180414165815.jpg', '2', '一次性收费', '666', '保姆服务', '人好的不得了', '1', '1', '8.0');

-- ----------------------------
-- Table structure for workertype
-- ----------------------------
DROP TABLE IF EXISTS `workertype`;
CREATE TABLE `workertype` (
  `WT_ID` int(2) NOT NULL AUTO_INCREMENT COMMENT '服务类型编号',
  `WT_TYPE` char(10) NOT NULL COMMENT '服务类型',
  `WT_DESCRIBE` char(18) DEFAULT NULL COMMENT '服务描述',
  PRIMARY KEY (`WT_ID`),
  UNIQUE KEY `WT_TYPE` (`WT_TYPE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workertype
-- ----------------------------
INSERT INTO `workertype` VALUES ('1', '宠物托管', '可以在您不方便时帮你照顾宠物');
INSERT INTO `workertype` VALUES ('2', '家电清洗', '为您清洗油烟机、微波炉和洗衣机等');
INSERT INTO `workertype` VALUES ('3', '保洁服务', '为家庭提供清洁服务');
INSERT INTO `workertype` VALUES ('4', '保姆服务', '为您照顾您的家庭');
INSERT INTO `workertype` VALUES ('5', '搬家服务', '搬家服务');
INSERT INTO `workertype` VALUES ('6', '空调维修', '为您带来温暖或凉爽');
INSERT INTO `workertype` VALUES ('7', '月嫂服务', '月嫂服务');
