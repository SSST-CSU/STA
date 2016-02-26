/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : sta

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2016-02-26 15:14:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admessage
-- ----------------------------
DROP TABLE IF EXISTS `admessage`;
CREATE TABLE `admessage` (
  `id` int(11) NOT NULL auto_increment,
  `type` int(255) default NULL,
  `content` varchar(255) default NULL,
  `applyFormId` int(11) default NULL,
  `time` varchar(255) default NULL,
  `isRead` int(11) default NULL,
  `personId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admessage
-- ----------------------------
INSERT INTO `admessage` VALUES ('2', '1', '这里是提问！', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('3', '2', 'XXX这里出问题了', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('4', '0', '招新啦', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('5', '2', 'sadada', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('6', '0', '招新0', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('7', '1', '提问0', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('8', '0', '招新0', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('9', '0', '招新1', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('10', '1', '提问1', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('11', '0', '招新1', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('12', '0', '招新2', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('13', '1', '提问2', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('14', '0', '招新2', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('15', '0', '招新3', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('16', '1', '提问3', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('17', '0', '招新3', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('18', '0', '招新4', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('19', '1', '提问4', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('20', '0', '招新4', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('21', '0', '招新5', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('22', '1', '提问5', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('23', '0', '招新5', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('24', '0', '招新6', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('25', '1', '提问6', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('26', '0', '招新6', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('27', '0', '招新7', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('28', '1', '提问7', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('29', '0', '招新7', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('30', '0', '招新8', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('31', '1', '提问8', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('32', '0', '招新8', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('33', '0', '招新9', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('34', '1', '提问9', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('35', '0', '招新9', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('36', '0', '招新10', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('37', '1', '提问10', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('38', '0', '招新10', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('39', '0', '招新11', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('40', '1', '提问11', '0', '2016-02-25', '0', '0');
INSERT INTO `admessage` VALUES ('41', '0', '招新11', '0', '2016-02-25', '1', '0');
INSERT INTO `admessage` VALUES ('42', '0', '招新12', '0', '2016-02-25', '1', '0');
INSERT INTO `admessage` VALUES ('43', '1', '提问12', '0', '2016-02-25', '1', '50');
INSERT INTO `admessage` VALUES ('51', '2', '的说法是范德萨发生的', '0', '2016-02-25', '1', '50');
INSERT INTO `admessage` VALUES ('52', '1', '对方是否是范德萨发生', '0', '2016-02-25', '1', '50');
INSERT INTO `admessage` VALUES ('53', '1', '222222', '0', '2016-02-26', '1', '50');
INSERT INTO `admessage` VALUES ('54', '0', '1申请加入科协，点击查看', '3', '2016-02-26', '1', '50');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `account` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  PRIMARY KEY  (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '2133213', '1312', 'asdas');
INSERT INTO `admin` VALUES ('3', 'sadasd', 'asdad', 'aaaaaa');
INSERT INTO `admin` VALUES ('7', 'helloman', 'xxxxxx', 'xxxxxx');

-- ----------------------------
-- Table structure for applyform
-- ----------------------------
DROP TABLE IF EXISTS `applyform`;
CREATE TABLE `applyform` (
  `id` int(11) NOT NULL auto_increment,
  `personId` int(11) default NULL,
  `name` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `political` varchar(255) default NULL,
  `place` varchar(255) default NULL,
  `classes` varchar(255) default NULL,
  `studentId` varchar(255) default NULL,
  `qq` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `oldjob` varchar(255) default NULL,
  `swap` varchar(255) default NULL,
  `first` varchar(255) default NULL,
  `second` varchar(255) default NULL,
  `award` varchar(255) default NULL,
  `achievement` varchar(255) default NULL,
  `advice` varchar(255) default NULL,
  `attach` varchar(255) default NULL,
  `portrait` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of applyform
-- ----------------------------
INSERT INTO `applyform` VALUES ('2', '50', 'sadasd', '男', '共青团员团', 'sdadsad', '2131', '2131312', '21323131', '2368126', 'askdhak', '是', '研发中心', '综合事务部', 'qweakdhkas', '2163817638', '没有建议', '无', 'sakdhsakjdhkaj');
INSERT INTO `applyform` VALUES ('3', '50', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '11', '12', '13', '14', '15', '16', 'person_portraits/12016-02-26-10-19-41.jpg');

-- ----------------------------
-- Table structure for attach
-- ----------------------------
DROP TABLE IF EXISTS `attach`;
CREATE TABLE `attach` (
  `id` int(11) NOT NULL auto_increment,
  `mark` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `content` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attach
-- ----------------------------
INSERT INTO `attach` VALUES ('1', '研发中心', 'responsibility', '技术交流');
INSERT INTO `attach` VALUES ('2', '研发中心', 'responsibility', '项目管理');
INSERT INTO `attach` VALUES ('3', '研发中心', 'responsibility', '团队管理');
INSERT INTO `attach` VALUES ('4', '研发中心', 'achievement', '网站制作');
INSERT INTO `attach` VALUES ('5', '研发中心', 'achievement', '新生培训');
INSERT INTO `attach` VALUES ('6', '研发中心', 'achievement', '软件开发');
INSERT INTO `attach` VALUES ('7', '公共关系部', 'achievement', '筹集资金');
INSERT INTO `attach` VALUES ('8', null, 'responsibility', 'sadasdsada');
INSERT INTO `attach` VALUES ('12', '主席团', 'achievement', 'sadasdaasd');
INSERT INTO `attach` VALUES ('14', '主席团', 'achievement', 'sadsadasfasfaas');
INSERT INTO `attach` VALUES ('15', '主席团', 'responsibility', '撒打算打算');
INSERT INTO `attach` VALUES ('16', '主席团', 'responsibility', '萨达是答案案说法');
INSERT INTO `attach` VALUES ('17', '主席团', 'responsibility', '爱的撒旦撒大大撒');
INSERT INTO `attach` VALUES ('18', '主席团', 'achievement', '发的是股份大股东');
INSERT INTO `attach` VALUES ('19', '主席团', 'responsibility', '啥方法是发生大');
INSERT INTO `attach` VALUES ('20', '主席团', 'responsibility', '的说法是发生的发生的身份');

-- ----------------------------
-- Table structure for competition
-- ----------------------------
DROP TABLE IF EXISTS `competition`;
CREATE TABLE `competition` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `time` varchar(255) default NULL,
  `link` varchar(255) default NULL,
  `introduce` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition
-- ----------------------------
INSERT INTO `competition` VALUES ('1', '软件创新大赛', 'Wed Jan 13 19:08:03 CST 2016', '#', '没有介绍');
INSERT INTO `competition` VALUES ('4', '服务外包大赛', 'Wed Jan 13 19:08:03 CST 2016', '#', '还是没有介绍');
INSERT INTO `competition` VALUES ('41', '比赛1', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('42', '比赛2', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('43', '比赛3', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('44', '比赛4', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('45', '比赛5', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('46', '比赛6', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('47', '比赛7', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('48', '比赛8', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('49', '比赛9', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('50', '比赛10', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('51', '比赛11', '2016-02-23', 'http://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('52', '比赛12', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('53', '比赛13', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('54', '比赛14', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('55', '比赛15', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('56', '比赛16', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('57', '比赛17', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('58', '比赛18', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('59', '比赛19', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('60', '比赛20', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('61', '比赛21', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('62', '比赛22', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('63', '比赛23', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('64', '比赛24', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('65', '比赛25', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('66', '比赛26', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('67', '比赛27', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('68', '比赛28', '2016-02-23', 'htt://www.baidu.com', '没有介绍1');
INSERT INTO `competition` VALUES ('69', '比赛29', '2016-02-23', 'http://www.aliyun.com', '没有介绍1');
INSERT INTO `competition` VALUES ('109', 'xxxxxx', 'xxxxxx', 'xxxxxx', 'xxxxxx');
INSERT INTO `competition` VALUES ('110', 'aaaaa', 'aaaaaa', 'http://www.baidu.com', 'aaaaaa');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `introduce` varchar(255) default NULL,
  `destination` varchar(255) default NULL,
  `minister` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('2', '研发中心', '是一个技术研究部门，专注于软件开发技术', '目前的目标是开发科协网站', '3');
INSERT INTO `department` VALUES ('3', '综合事务部', '是一个管理科协综合事务的部门', '对科协内部的综合事务进行管理', '4');
INSERT INTO `department` VALUES ('4', '主席团', '啊大大', '的公司给第三方', '5');
INSERT INTO `department` VALUES ('5', '技术交流与推广部', '灰色空间爱德华', '手机号就看', '2');
INSERT INTO `department` VALUES ('6', '赛事部', '死垃圾大赛的离开家', '看撒娇的拉斯卡', '3');
INSERT INTO `department` VALUES ('7', '项目部', '卡里就打了肯德基', '四六级福利卡接收到', '6');
INSERT INTO `department` VALUES ('8', '公共关系部', '拉开加大了法律', '机刷卡的萨科技的金卡', '8');
INSERT INTO `department` VALUES ('9', '创新创业项目管理中心', '卡拉就对啦空间的', '开始就立刻就俺俩是', '6');

-- ----------------------------
-- Table structure for department_person
-- ----------------------------
DROP TABLE IF EXISTS `department_person`;
CREATE TABLE `department_person` (
  `id` int(11) NOT NULL auto_increment,
  `department_id` int(11) default NULL,
  `person_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `dp_department_id` (`department_id`),
  KEY `dp_person_id` (`person_id`),
  CONSTRAINT `dp_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `dp_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department_person
-- ----------------------------
INSERT INTO `department_person` VALUES ('1', '2', '5');
INSERT INTO `department_person` VALUES ('2', '2', '3');
INSERT INTO `department_person` VALUES ('3', '2', '4');

-- ----------------------------
-- Table structure for lecture
-- ----------------------------
DROP TABLE IF EXISTS `lecture`;
CREATE TABLE `lecture` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `introduce` varchar(255) default NULL,
  `accessable` varchar(255) default NULL,
  `time` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lecture
-- ----------------------------
INSERT INTO `lecture` VALUES ('1', '大数据讲座', '简单介绍一下大数据的概念以及应用前景', '0', 'Sun Jan 17 17:41:13 CST 2016');
INSERT INTO `lecture` VALUES ('3', '讲座0', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('4', '讲座1', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('5', '讲座2', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('6', '讲座3', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('7', '讲座4', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('8', '讲座5', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('9', '讲座6', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('10', '讲座7', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('11', '讲座8', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('12', '讲座9', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('13', '讲座9', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('14', '讲座10', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('15', '讲座11', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('16', '讲座12', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('17', '讲座13', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('18', '讲座14', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('19', '讲座15', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('20', '讲座16', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('21', '讲座17', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('22', '讲座18', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('23', '讲座19', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('24', '讲座20', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('25', '讲座21', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('26', '讲座22', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('27', '讲座23', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('28', '讲座24', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('29', '讲座25', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('30', '讲座26', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('31', '讲座27', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('32', '讲座28', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '0', '2016-02-20');
INSERT INTO `lecture` VALUES ('33', '讲座29', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('34', '讲座30', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '1', '2016-02-20');
INSERT INTO `lecture` VALUES ('35', '讲座31', '是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101', '0', '2016-02-25');
INSERT INTO `lecture` VALUES ('36', 'ss', 'ss', '1', '2016-02-25');

-- ----------------------------
-- Table structure for lecture_person
-- ----------------------------
DROP TABLE IF EXISTS `lecture_person`;
CREATE TABLE `lecture_person` (
  `id` int(11) NOT NULL auto_increment,
  `lecture_id` int(11) default NULL,
  `person_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `lp_lecture_id` (`lecture_id`),
  KEY `lp_person_id` (`person_id`),
  CONSTRAINT `lp_lecture_id` FOREIGN KEY (`lecture_id`) REFERENCES `lecture` (`id`),
  CONSTRAINT `lp_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lecture_person
-- ----------------------------
INSERT INTO `lecture_person` VALUES ('1', '1', '3');
INSERT INTO `lecture_person` VALUES ('2', '36', '50');
INSERT INTO `lecture_person` VALUES ('3', '36', '49');
INSERT INTO `lecture_person` VALUES ('5', '36', '46');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `personId` int(11) default NULL,
  `personName` varchar(255) default NULL,
  `operatable` int(11) default NULL,
  `teamId` int(11) default NULL,
  `teamName` varchar(255) default NULL,
  `occurName` varchar(255) default NULL,
  `occurTime` varchar(255) default NULL,
  `occurPlace` varchar(255) default NULL,
  `time` varchar(255) default NULL,
  `messageType` int(11) default NULL,
  `receiverId` int(11) default NULL,
  `msgContent` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '49', 'sad', '1', '135', 'sda', null, null, null, '2016-02-14', '1', '50', null);
INSERT INTO `message` VALUES ('2', '49', 'zxzxzx', '1', '134', 'starveTogether', null, null, null, '2016-02-14', '1', '50', null);
INSERT INTO `message` VALUES ('3', '49', 'zxzxzx', '0', '0', 'starveTogether', null, null, null, '2016-02-14', '2', '50', null);
INSERT INTO `message` VALUES ('4', '49', 'zxzxzx', '0', '0', 'starveTogether', null, null, null, '2016-02-14', '3', '50', null);
INSERT INTO `message` VALUES ('5', '49', 'zxzxzx', '0', '0', 'starveTogether', null, null, null, '2016-02-14', '4', '50', null);
INSERT INTO `message` VALUES ('6', '49', 'zxzxzx', '0', '0', 'starveTogether', null, null, null, '2016-02-14', '5', '50', null);
INSERT INTO `message` VALUES ('7', '0', null, '0', '0', null, '大数据讲座', '2015-10-15', '世纪A101', '2016-02-14', '6', '50', null);
INSERT INTO `message` VALUES ('9', '0', null, '0', '0', '我要开始标车啦！', null, null, null, '2016-02-14', '8', '50', null);
INSERT INTO `message` VALUES ('10', '49', 'zxzxzx', '0', '0', '哈哈', null, null, null, '2016-02-14', '9', '50', null);
INSERT INTO `message` VALUES ('11', '0', null, '0', '0', 'hello', null, null, null, '2016-02-14', '10', '50', null);
INSERT INTO `message` VALUES ('13', '0', null, '0', '0', 'yellow', null, null, null, '2016-02-14', '11', '50', null);
INSERT INTO `message` VALUES ('14', '0', null, '0', '0', null, '研发中心', '2015-10-15', '世纪A101', '2016-02-14', '7', '50', null);
INSERT INTO `message` VALUES ('15', '0', null, '0', '0', null, '研发中心', '2015-10-15', '世纪A101', '2016-02-14', '7', '50', null);
INSERT INTO `message` VALUES ('16', '0', null, '0', '0', '我还要发布一个信息', null, null, null, '2016-02-14', '10', '50', null);
INSERT INTO `message` VALUES ('17', '0', null, '0', '0', 'dsadsa', null, null, null, '2016-02-14', '10', '50', null);
INSERT INTO `message` VALUES ('18', '0', null, '0', '0', 'dsadadadsads', null, null, null, '2016-02-14', '10', '50', null);
INSERT INTO `message` VALUES ('19', '0', null, '0', '0', 'dasdasfaawdawda', null, null, null, '2016-02-14', '10', '50', null);
INSERT INTO `message` VALUES ('20', '25', 'eeeeee', '2', '139', 'dasdasfaawdawda', null, null, null, '2016-02-14', '1', '50', null);
INSERT INTO `message` VALUES ('21', '50', 'hahaha', '0', '0', 'dasdasfaawdawda', null, null, null, '2016-02-14', '5', '25', null);
INSERT INTO `message` VALUES ('22', '25', 'eeeeee', '0', '0', 'dasdasfaawdawda', null, null, null, '2016-02-14', '2', '46', null);
INSERT INTO `message` VALUES ('23', '0', null, '0', '0', 'dasdasfaawdawda', null, null, null, '2016-02-14', '8', '50', null);
INSERT INTO `message` VALUES ('24', '50', 'hahaha', '0', '0', 'dasdasfaawdawda', null, null, null, '2016-02-14', '9', '25', null);
INSERT INTO `message` VALUES ('25', '50', 'hahaha', '0', '0', 'dasdasfaawdawda', null, null, null, '2016-02-14', '9', '46', null);
INSERT INTO `message` VALUES ('26', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '我是科协管理员，给你发来消息');
INSERT INTO `message` VALUES ('27', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '我是科协管理员，给你发来消息');
INSERT INTO `message` VALUES ('28', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '我是科协管理员，给你发来消息我是科协管理员，给你发来消息我是科协管理员，给你发来消息我是科协管理员，给你发来消息我是科协管理员，给你发来消息我是科协管理员，给你发来消息我是科协管理员，给你发来消息我是科协管理员，给你发来消息');
INSERT INTO `message` VALUES ('29', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '我是科协管理员，给你发来消息我是科协管理员，给你发来消息我是科协管理员，给你发来消息我是科协管理员，给你发来消息我是科协管理员，给你发来消息我是科协管理员，给你发来消息我是科协管理员，给你发来消息我是科协管理员，给你发来消息');
INSERT INTO `message` VALUES ('30', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', 'sadadasda');
INSERT INTO `message` VALUES ('31', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', 'asdasdadsa');
INSERT INTO `message` VALUES ('32', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '撒大大三大的');
INSERT INTO `message` VALUES ('33', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '撒大大三大的');
INSERT INTO `message` VALUES ('34', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '撒大大大  舒服发发发发');
INSERT INTO `message` VALUES ('35', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '撒大大大  舒服发发发发');
INSERT INTO `message` VALUES ('36', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '撒大大大  舒服发发发发');
INSERT INTO `message` VALUES ('37', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', 'sadadas');
INSERT INTO `message` VALUES ('38', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', 'sadsadassssss');
INSERT INTO `message` VALUES ('39', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', 'sadsadassssss');
INSERT INTO `message` VALUES ('40', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '撒大大三大是事实上事实上事实上');
INSERT INTO `message` VALUES ('41', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '萨达萨达萨达萨达爱撒大大三大');
INSERT INTO `message` VALUES ('42', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '啥大事小支撑着吃自助餐');
INSERT INTO `message` VALUES ('43', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '飒飒大师大厦');
INSERT INTO `message` VALUES ('44', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '哈迪斯连话费卡对方空间里达科技楼换个卡积分多换个卡多好看就分开交电费的尽快恢复快捷达返回给开了家地方会尽快航空及恢复到卡里就更好空间大撒谎发科技安徽高考积分兑换发卡机抠脚大汉高科技的韩国客户来说看');
INSERT INTO `message` VALUES ('45', '0', null, '0', '0', 'what the fuck', null, null, null, '2016-02-23', '8', '46', null);
INSERT INTO `message` VALUES ('46', '46', 'marts', '0', '0', 'what the fuck', null, null, null, '2016-02-23', '9', '49', null);
INSERT INTO `message` VALUES ('47', '46', 'marts', '0', '0', 'what the fuck', null, null, null, '2016-02-23', '9', '47', null);
INSERT INTO `message` VALUES ('48', '46', 'marts', '0', '0', 'what the fuck', null, null, null, '2016-02-23', '9', '48', null);
INSERT INTO `message` VALUES ('49', '46', 'marts', '0', '0', 'what the fuck', null, null, null, '2016-02-23', '9', '50', null);
INSERT INTO `message` VALUES ('50', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '您的团队：dsadadadsads已经被强制解散！');
INSERT INTO `message` VALUES ('51', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '您的团队：dsadsa已经被强制解散！');
INSERT INTO `message` VALUES ('52', '0', null, '0', '0', null, null, null, null, '2016-02-23', '14', '50', '您的团队：我还要发布一个信息已经被强制解散！');
INSERT INTO `message` VALUES ('53', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '0', 'sakdjlasjkl宽带了卡德加拉斯看得见');
INSERT INTO `message` VALUES ('54', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', '沙拉酱的龙卡及达拉斯');
INSERT INTO `message` VALUES ('55', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', 'ahkghkajgh撒大大');
INSERT INTO `message` VALUES ('56', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', '撒大大三大大');
INSERT INTO `message` VALUES ('57', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', '负担和公司给回复');
INSERT INTO `message` VALUES ('58', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', '按时打算的撒');
INSERT INTO `message` VALUES ('59', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', '嘎达的发发');
INSERT INTO `message` VALUES ('60', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', 'sss撒大大');
INSERT INTO `message` VALUES ('61', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', '撒大大撒');
INSERT INTO `message` VALUES ('62', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', '范德萨范德萨发生');
INSERT INTO `message` VALUES ('63', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', '按时大大大');
INSERT INTO `message` VALUES ('64', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', '的风格的方式该');
INSERT INTO `message` VALUES ('65', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', '撒大大大');
INSERT INTO `message` VALUES ('66', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '0', '的法规规范规范的');
INSERT INTO `message` VALUES ('67', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '0', '多岁的冯绍峰');
INSERT INTO `message` VALUES ('68', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', '发生地方大赛的手术费大幅度发大幅度发发呆的方法2222');
INSERT INTO `message` VALUES ('69', '0', null, '0', '0', null, null, null, null, '2016-02-25', '14', '50', '的说法是对方是否');
INSERT INTO `message` VALUES ('70', '0', null, '0', '0', null, null, null, null, '2016-02-26', '14', '50', '22222');
INSERT INTO `message` VALUES ('71', '0', null, '0', '0', null, null, null, null, '2016-02-26', '14', '50', '213131312');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `classes` varchar(255) default NULL,
  `department` varchar(255) default NULL,
  `mail` varchar(255) default NULL,
  `account` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `isMenber` varchar(255) default NULL,
  `qq` varchar(255) default NULL,
  `wechat` varchar(255) default NULL,
  `introduce` varchar(255) default NULL,
  `job` varchar(255) default NULL,
  `protrait` varchar(255) default NULL,
  `hobby` varchar(255) default NULL,
  `speciality` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('3', '张三', '1301', null, 'zhangsan@qq.com', 'zhangsan', '123456', '1234567891111', '1', '1456943876', '1234567891111', '无介绍', '干事', '#', '没有爱好', 'ps、图像处理');
INSERT INTO `person` VALUES ('4', '李四', '1302', null, 'zhangsan@qq.com', 'lisi', '123456', '1234567891111', '1', '1456943876', '1234567891111', '无介绍', '干事', '#', '没有爱好', 'ps、图像处理');
INSERT INTO `person` VALUES ('5', '王五', '1303', null, 'zhangsan@qq.com', 'wangwu', '123456', '1234567891111', '1', '1456943876', '1234567891111', '无介绍', '干事', '#', '没有爱好', 'ps、图像处理');
INSERT INTO `person` VALUES ('6', '赵六', '1304', null, 'zhaoliu@qq.com', 'xxxx', '123456', '1234567891234', '0', '324324243', '1234567891234', '没有介绍', '干事', '#', '喜欢打篮球，游戏什么的', '前端设计');
INSERT INTO `person` VALUES ('7', '严七', '1305', null, 'yanqi@qq.com', 'yanqi', '123456', '1234567891234', '0', '324324243', '1234567891234', '没有介绍', '干事', '#', '喜欢打篮球，游戏什么的', '前端设计');
INSERT INTO `person` VALUES ('8', 'sadas', '2132', null, 'sdadw@qq.com', 'sadawdwa', '111111', null, '0', '1456943876', 'dawdqqe', 'jihkhku', null, null, 'sdfgdgfd', 'ewrwrwr');
INSERT INTO `person` VALUES ('9', 'sadas', '2132', null, 'sdadw@qq.com', 'sadawdwawqeqe', 'qqqqqqqq', null, '0', '1456943876', 'dawdqqe', 'jihkhku', null, null, 'sdfgdgfd', 'ewrwrwr');
INSERT INTO `person` VALUES ('10', 'dsfwerwe', '21234', null, 'sadawda@qq.com', 'gfhdggf', '2222222', null, '0', '1456943876', 'gffhfghf', 'vcxdvxvdxd', null, null, 'fggdgfdgd', 'retetretter');
INSERT INTO `person` VALUES ('11', 'dsfwerwe', '21234', null, 'sadawda@qq.com', 'gfhdggf', '2222222', null, '0', '1456943876', 'gffhfghf', 'vcxdvxvdxd', null, null, 'fggdgfdgd', 'retetretter');
INSERT INTO `person` VALUES ('12', 'asdasda', 'gfhg', null, 'gfhf@qq.com', 'sadadassadasdda', '123456', null, '0', '14569438765', 'sadafa', 'yt5yujrt', null, null, 'gfddg', '21ewqrq');
INSERT INTO `person` VALUES ('13', 'sadwqeqe', 'gfhdhgf', null, 'ssadw@qq.com', 'sadadassadasddaq', '11111111', null, '0', '135165', '5dsa3d5', '1da8wd4a6', null, null, 'a35ds1a', '15da3d1a3');
INSERT INTO `person` VALUES ('14', 'helloman', '1302', null, 'helloman@qq.com', 'helloman', '123456', null, '0', '1456943876', '13924569321', '大学生', null, 'C:\\Users\\martsforever\\IdeaProjects\\WSJ-SAT\\out\\artifacts\\WSJ_SAT_war_exploded\\person_portraits\\海滩2.jpg', '游山玩水', 'ps，视频剪辑，图像处理');
INSERT INTO `person` VALUES ('15', '撒打我的娃', '发的鬼地方个', null, 'dwqqew@qq.com', '撒旦王企鹅', '123444', null, '0', '561351', '撒粉色', '额粉色粉色', null, 'C:\\sat\\person_portraits\\海滩1.jpg', '大大王', '关于教育机构');
INSERT INTO `person` VALUES ('16', 'sadasd', 'sadadsdsa', null, 'sadasds@qq.com', 'sadasdasddasdasd', '222222', null, '0', '21313141', 'asdsad', '', null, 'C:\\Users\\martsforever\\IdeaProjects\\WSJ-SAT\\out\\artifacts\\WSJ_SAT_war_exploded\\person_portraits\\sadasdasddasdasd', '', '');
INSERT INTO `person` VALUES ('17', 'wqeqe', '2214', null, 'sadwadwa@wq.sad', 'sadsad2113', 'ssssss', null, '0', '54646431', '', '', null, 'C:\\Users\\martsforever\\IdeaProjects\\WSJ-SAT\\out\\artifacts\\WSJ_SAT_war_exploded\\person_portraits\\sadsad2113jpg', '', '');
INSERT INTO `person` VALUES ('18', 'dgssfsd', '2114', null, 'd3a5w@qq.com', 'saafasfda', '44444444', null, '0', '435461', 'klsahdlk', 'lsdkjfalifowjalksjdd', null, 'person_portraits\\saafasfdajpg', 'kfhklajflakj', 'flksjlajals');
INSERT INTO `person` VALUES ('19', 'saddsa', 'dassdsa', null, 'dawd@qq.com', 'sadfaasfa', '212121', null, '0', '54313', 'sadsadsaads', 'tgfdhdfgd', null, 'person_portraits/sadfaasfa.jpg', 'sdadasdsa', 'sadasdaadsfas');
INSERT INTO `person` VALUES ('20', 'saddsa', 'dassdsa', null, 'dawd@qq.com', 'sadfaasfa', '212121', null, '0', '54313', 'sadsadsaads', 'tgfdhdfgd', null, 'person_portraits/sadfaasfa.jpg', 'sdadasdsa', 'sadasdaadsfas');
INSERT INTO `person` VALUES ('21', 'rose', '1302', null, 'rose@qq.com', 'rose', '111111', null, '0', '1456943878', 'rose', 'rose', null, 'person_portraits/rose.jpg', 'rose', 'rose');
INSERT INTO `person` VALUES ('22', 'qqqqq', 'qqqqq', null, 'qqqq@qq.com', 'qqqq', 'qqqqqq', null, '0', '64584685', '', '', null, 'person_portraits/qqqq.jpg', '', '');
INSERT INTO `person` VALUES ('23', 'kldajdliajwdal', 'sadads', null, 'sadasds@qq.com', 'dwauhdjkah', '444444', null, '0', '21313141', '', '', null, 'person_portraits/dwauhdjkah.jpg', '', '');
INSERT INTO `person` VALUES ('24', 'wwwwww', 'www', null, 'wwwwww@qq.com', 'wwww', 'wwwwww', null, '0', '21313141', '', '', null, 'person_portraits/wwww.jpg', '', '');
INSERT INTO `person` VALUES ('25', 'eeeeee', 'eeee', null, 'eeeeee@qq.com', 'eeeeee', 'eeeeee', null, '0', '865465', '', '', null, 'person_portraits/eeeeee.jpg', '', '');
INSERT INTO `person` VALUES ('27', 'wqeeq', 'weqwew', null, 'yyyy@qqq.dsf', 'yyyyyy', 'yyyyyy', null, '0', '324423523', '', '', null, 'person_portraits/yyyyyy.jpg', '', '');
INSERT INTO `person` VALUES ('28', 'oooooo', 'ooo', null, 'ooo@qq.oo', 'oooooo', 'oooooo', null, '0', '93822979', '', '', null, 'person_portraits/oooooo.jpg', '', '');
INSERT INTO `person` VALUES ('29', 'wsj', '12314', null, 'wsj@qq.com', 'wsj', 'qq1111', null, '0', '2151244221', '', '', null, 'person_portraits/wsj.jpg', '', '');
INSERT INTO `person` VALUES ('30', 'sadsad', 'aasda', null, 'asdadsd@wqe.hjg', 'aaaaa', 'aaaaaa', null, '0', '3254354656', '', '', null, 'person_portraits/aaaaa.jpg', '', '');
INSERT INTO `person` VALUES ('31', '韦胜健', '1302', null, 'martsforever@aliyum.com', 'martsforever', 'qq450881199', null, '0', '1456943876', '13924569321', '吃藕丑', null, 'person_portraits/martsforever.jpg', 'lol，Javaweb，Android，IOS，图像处理', '没特长');
INSERT INTO `person` VALUES ('32', 'ananan', 'ananan', null, 'ananan@qq.gg', 'ananan', 'ananan', null, '0', '213435', '', '', null, 'person_portraits/ananan.jpg', '', '');
INSERT INTO `person` VALUES ('33', 'ananan', 'ananan', null, 'ananan@qq.gg', 'ananan', 'ananan', null, '0', '213435', '', '', null, 'person_portraits/ananan.jpg', '', '');
INSERT INTO `person` VALUES ('34', 'zhangran', 'aaaa', null, 'sadaw@sada.com', 'zhangran', 'qqqqqq', null, '0', '135412', '', '', null, 'person_portraits/zhangran.jpg', '', '');
INSERT INTO `person` VALUES ('35', '撒大大', '444', null, '4444@sakjld.sakldj', 'sadsafaf', '444444', null, '0', '465431', '', '', null, 'person_portraits/sadsafaf.jpg', '', '');
INSERT INTO `person` VALUES ('36', 'SADADSAD', '21214', null, 'nihhaoya@qq.com', 'nihaoya', '123456', null, '0', '327116', 'saafsad', 'zvzdvxvd', null, 'person_portraits/nihaoya.jpg', 'hgjfhgfh', 'dstewtwet');
INSERT INTO `person` VALUES ('37', 'akjsdla', '21412', null, 'skjah@jskha.com', 'kaka', '111111', null, '0', '21413241', 'safafaf', '', null, 'person_portraits/kaka.jpg', 'fdgdgfd', 'dhghfh');
INSERT INTO `person` VALUES ('38', 'sadas', '21341', null, 'dadwa@qq.com', 'buzhidao', '111111', '12354678955', '0', '65431253', '324544fdsf', 'hgmgvf', null, 'person_portraits/buzhidao.jpg', 'sdfsdfsd', 'xvdvxdv');
INSERT INTO `person` VALUES ('39', '啥快递很快', '1342', null, 'adw@akdh.com', 'budong', '111111', '13242342343', '0', '2142353634', '微信', '个人简介', null, 'person_portraits/budong.jpg', '兴趣爱好', '特长');
INSERT INTO `person` VALUES ('40', 'dsfdfsd', '13213', null, 'sada@qq.gf', 'nihao', '111111', '13244566575', '0', '3425246', 'sadsad', 'fdgdf', null, 'person_portraits/nihao.jpg', 'saasd', 'dfsg');
INSERT INTO `person` VALUES ('41', 'commit', '132', null, 'adawd@adad.jdh', 'commit', 'commit', '13244556789', '0', '2133214', '435355', '324234', null, 'person_portraits/commit.jpg', '657567', '645646');
INSERT INTO `person` VALUES ('42', 'sdfaf', '2131', null, 'dawda@qq.com', 'yaya', '111111', '13453466785', '0', '32423525', 'fdgdfg', '243253fsfd', null, 'person_portraits/yaya.jpg', 'dfgdg', 'ewfesa');
INSERT INTO `person` VALUES ('43', 'wsj', '1302', null, 'marts_forever@163.com', 'marts_forever', 'qq450881199', '13924569321', '0', '1456943876', '1392569321', '文能挂机喷队友，武能越塔送人头。进可孤身一挑五，退可坐等二十投。前能飞脚救残敌，后能放墙堵队友。静则百年不见人，动则千里送超神。英勇闪现送一血，卖起队友不回头。顺风浪，逆风投。问君能有几多愁，恰似五人四坑20投', null, 'person_portraits/marts_forever.jpg', '啦啦啦啦，我喜欢打撸', '没什么特长');
INSERT INTO `person` VALUES ('44', 'sadasad', 'sadasad', null, 'sadasd@af.fsg', 'sadasad', '111111', '13425255755', '0', '2114153', '', '', null, 'person_portraits/sadasad.jpg', '', '');
INSERT INTO `person` VALUES ('45', 'haha', null, null, 'zhaoliu@qq.com', 'zhaoliu', '123456', '1234567891234', '0', '324324243', '1234567891234', '没有介绍', '干事', '#', '喜欢打篮球，游戏什么的', '前端设计');
INSERT INTO `person` VALUES ('46', 'marts', '666666', null, '66666@qqqqqqq.com', 'xxxxxx', 'xxxxxx', '16666666666', '0', '666666', '66666', '6666666', null, 'person_portraits/xxxxxx.jpg', '666666', '666666');
INSERT INTO `person` VALUES ('47', 'qeqeqe', 'qeqewwww', null, 'qeqeq@add.dsf', 'qeqeqe', 'qeqeqe', '11313123331', '0', '21312414', 'qeqeqe', 'qeqeeqe', null, 'person_portraits/qeqeqe.jpg', 'qeqeqe', 'qeqeqeqe');
INSERT INTO `person` VALUES ('48', 'asasas', '1111', null, 'adasa@dsa.dafsa', 'asasas', 'asasas', '12342342344', '0', '12342123', 'sasaa', 'saasasa', null, 'img/avatar/avatar.png', 'saasas', 'asasa');
INSERT INTO `person` VALUES ('49', 'zxzxzx', '213124', null, 'asdcsa@ad.dg', 'zxzxzx', 'zxzxzx', '12432524324', '0', '213543', '', '', null, 'person_portraits/zxzxzx.jpg', '', '');
INSERT INTO `person` VALUES ('50', 'hahaha', '1302', null, 'weqdw@dsa.dsfd', 'hahaha', 'ssssss', '13242425555', '0', '21524131', 'hahaha', 'hahaha', null, 'person_portraits/hahaha.jpg', 'hahaha', 'hahaha');
INSERT INTO `person` VALUES ('52', 'dsadsadas', 'asdasdasda', '技术交流部', null, null, null, null, '0', null, null, null, '副部长', 'person_portraits/dsadsadas2016-02-24-10-01-06.jpg', null, null);
INSERT INTO `person` VALUES ('53', 'sadasds', 'saadsada', '技术交流部', null, null, null, null, '0', null, null, null, '副部长', 'person_portraits/sadasds2016-02-24-10-04-42.jpg', null, null);
INSERT INTO `person` VALUES ('54', 'asdasdasd', 'sad', '创新创业管理中心', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/2016-02-24-10-05-11.jpg', null, null);
INSERT INTO `person` VALUES ('55', '萨达按时打算的撒', '1324', '赛事部', null, null, null, null, '0', null, null, null, '副部长', 'person_portraits/萨达按时打算的撒2016-02-24-10-31-30.jpg', null, null);
INSERT INTO `person` VALUES ('56', '阿斯顿撒啊啊啊', '啊啊的撒的萨达萨达萨达', '技术交流部', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/阿斯顿撒啊啊啊2016-02-24-10-32-12.jpg', null, null);
INSERT INTO `person` VALUES ('57', '发广东话的风格的', '发的规范的郭德纲', '技术交流部', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/发广东话的风格的2016-02-24-10-32-27.jpg', null, null);
INSERT INTO `person` VALUES ('58', 'asdadasda', '3122', '综合事务部', null, null, null, null, '0', null, null, null, '副部长', 'person_portraits/asdadasda2016-02-25-01-05-24.jpg', null, null);
INSERT INTO `person` VALUES ('60', 'sadasdad', 'asdasdasd', '主席团', null, null, null, null, '0', null, null, null, '副部长', 'person_portraits/sadasdad2016-02-25-01-28-35.jpg', null, null);
INSERT INTO `person` VALUES ('63', 'afafasf', 'addsadsafa', '技术交流部', null, null, null, null, '0', null, null, null, '副部长', 'person_portraits/afafasf2016-02-25-09-49-10.jpg', null, null);
INSERT INTO `person` VALUES ('65', 'sdasdad', 'asdadad', '综合事务部', null, null, null, null, '0', null, null, null, '副部长', 'person_portraits/sdasdad2016-02-25-10-10-38.jpg', null, null);
INSERT INTO `person` VALUES ('66', 'sadada', 'adasdsad', '主席团', null, null, null, null, '0', null, null, null, '副部长', 'person_portraits/sadada2016-02-25-10-10-54.jpg', null, null);
INSERT INTO `person` VALUES ('67', '', '', '技术交流部', null, null, null, null, '0', null, null, null, '副部长', 'person_portraits/2016-02-25-10-53-43.jpg', null, null);
INSERT INTO `person` VALUES ('68', '撒大大说', '21313', '技术交流与推广部', null, null, null, null, '0', null, null, null, '职位', 'person_portraits/撒大大说2016-02-25-10-56-09.jpg', null, null);
INSERT INTO `person` VALUES ('69', '', '', '项目部', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/2016-02-25-10-56-23.jpg', null, null);
INSERT INTO `person` VALUES ('70', '大大', '1232', '技术交流与推广部', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/大大2016-02-25-10-56-40.jpg', null, null);
INSERT INTO `person` VALUES ('71', '萨达', '123', '技术交流与推广部', null, null, null, null, '0', null, null, null, '副部长', 'person_portraits/萨达2016-02-25-10-57-23.jpg', null, null);
INSERT INTO `person` VALUES ('72', '撒大大', '2131', '公共关系部', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/撒大大2016-02-25-10-57-42.jpg', null, null);
INSERT INTO `person` VALUES ('73', '仨我单位', '2131', '创新创业项目管理中心', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/仨我单位2016-02-25-10-58-01.jpg', null, null);
INSERT INTO `person` VALUES ('74', '个的发货的', '1231', '部门', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/个的发货的2016-02-25-10-58-23.jpg', null, null);
INSERT INTO `person` VALUES ('75', '萨达我', '213', '研发中心', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/萨达我2016-02-25-10-58-50.jpg', null, null);
INSERT INTO `person` VALUES ('76', '打发撒', '21312', '研发中心', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/打发撒2016-02-25-10-59-07.jpg', null, null);
INSERT INTO `person` VALUES ('77', '按时大大撒', '21313', '创新创业项目管理中心', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/按时大大撒2016-02-25-10-59-45.jpg', null, null);
INSERT INTO `person` VALUES ('78', '阿萨达', '2131', '主席团', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/阿萨达2016-02-25-12-08-20.jpg', null, null);
INSERT INTO `person` VALUES ('79', '案发生大', '231', '主席团', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/案发生大2016-02-25-12-08-34.jpg', null, null);
INSERT INTO `person` VALUES ('80', '阿发达', '2131', '主席团', null, null, null, null, '0', null, null, null, '副部长', 'person_portraits/阿发达2016-02-25-12-08-46.jpg', null, null);
INSERT INTO `person` VALUES ('81', '阿萨达', '2321321', '主席团', null, null, null, null, '0', null, null, null, '副部长', 'person_portraits/阿萨达2016-02-25-12-09-00.jpg', null, null);
INSERT INTO `person` VALUES ('82', '阿斯顿撒大大', '2131', '创新创业项目管理中心', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/阿斯顿撒大大2016-02-25-12-41-47.jpg', null, null);
INSERT INTO `person` VALUES ('83', '俺师傅的说法是', '21313', '创新创业项目管理中心', null, null, null, null, '0', null, null, null, '干事', 'person_portraits/俺师傅的说法是2016-02-25-12-42-07.jpg', null, null);
INSERT INTO `person` VALUES ('84', 'zzzzzz', '2133', null, 'qweqwea@ad.fs', 'zzzzzz', 'zzzzzz', '13922222222', '0', '213123', 'adass', 'adsad', null, 'person_portraits/zzzzzz.jpg', 'adasds', 'adasd');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `introduce` varchar(255) default NULL,
  `downloadUrl` varchar(255) default NULL,
  `time` varchar(255) default NULL,
  `size` varchar(255) default NULL,
  `downloadTimes` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('3', 'C++', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('4', 'C++0', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('5', 'C++1', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('7', 'C++3', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('8', 'C++4', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('9', 'C++5', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('10', 'C++6', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('11', 'C++7', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('12', 'C++8', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('13', 'C++9', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('14', 'C++10', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('15', 'C++11', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('16', 'C++12', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('17', 'C++13', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('18', 'C++14', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('19', 'C++15', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('20', 'C++16', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('21', 'C++17', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('22', 'C++18', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('23', 'C++19', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('24', 'C++20', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('25', 'C++21', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('26', 'C++22', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('27', 'C++23', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('28', 'C++24', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('29', 'C++25', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('30', 'C++26', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('31', 'C++27', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('32', 'C++28', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('33', 'C++29', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('34', 'C++30', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('35', 'C++31', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('36', 'C++32', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('37', 'Java33', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('38', 'Java34', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('39', 'Java35', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('40', 'Java36', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('41', 'Java37', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('42', 'Java38', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('43', 'Java39', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('44', 'Java40', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('45', 'Java41', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('46', 'Java42', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('47', 'Java43', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '1');
INSERT INTO `resource` VALUES ('48', 'PHP33', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('51', 'Objective-C34', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('52', 'PHP35', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('53', 'Objective-C35', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('54', 'PHP36', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('55', 'Objective-C36', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('56', 'PHP37', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('57', 'Objective-C37', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('58', 'PHP38', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('59', 'Objective-C38', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('60', 'PHP39', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('61', 'Objective-C39', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('62', 'PHP40', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('63', 'Objective-C40', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('64', 'PHP41', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('65', 'Objective-C41', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/dropdowns.html', '2016-02-01', '1000.0', '0');
INSERT INTO `resource` VALUES ('70', 'hello', '一个比较老旧的用于开发window应用程序的开发环境', 'resource/kexie.zip', '2016-02-01', '1000.0', '2');
INSERT INTO `resource` VALUES ('80', '眼睛', 'dsadsadas', 'resource/眼睛.jpg', '2016-02-24', '4614.0', '2');
INSERT INTO `resource` VALUES ('81', '一首歌', 'gggggggg', 'resource/一首歌.mp3', '2016-02-24', '8976063.0', '2');
INSERT INTO `resource` VALUES ('82', '一首歌的压缩包', 'ssssss', 'resource/一首歌的压缩包.zip', '2016-02-24', '8946154.0', '1');
INSERT INTO `resource` VALUES ('83', '萨达', '撒大大大', 'resource/萨达.jpg', '2016-02-24', '279162.0', '0');
INSERT INTO `resource` VALUES ('84', 'ggggg', 'gggg', 'resource/ggggg.jpg', '2016-02-24', '279162.0', '0');

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `teamSize` int(11) default NULL,
  `currentSize` int(11) default NULL,
  `introduce` varchar(255) default NULL,
  `logo` varchar(255) default NULL,
  `ministerId` int(11) default NULL,
  `expiryDate` varchar(255) default NULL,
  `publishTime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('1', '第一个团队', '10', '3', '没有介绍', '#', '3', '2015-11-11', '2015-11-11');
INSERT INTO `team` VALUES ('2', '第二个团队', '5', '4', '没有介绍2', '#2', '4', '2015-11-11', '2015-12-12');
INSERT INTO `team` VALUES ('3', '芒果团队', '5', '5', '一个专注于帮助聋哑人的大学生团队', '#', '5', '2015-11-11', '2015-7-9');
INSERT INTO `team` VALUES ('102', '芒果团队1', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('103', '芒果团队2', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('104', '芒果团队3', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('105', '芒果团队4', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('106', '芒果团队5', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('107', '芒果团队6', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('108', '芒果团队7', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('109', '芒果团队8', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('110', '芒果团队9', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('111', '芒果团队10', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:25 CST 2016');
INSERT INTO `team` VALUES ('112', '芒果团队1', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:56:59 CST 2016');
INSERT INTO `team` VALUES ('113', '芒果团队2', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('114', '芒果团队3', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('115', '芒果团队4', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('116', '芒果团队5', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('117', '芒果团队6', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('118', '芒果团队7', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('119', '芒果团队8', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('120', '芒果团队9', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('121', '芒果团队10', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:00 CST 2016');
INSERT INTO `team` VALUES ('122', '芒果团队1', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('123', '芒果团队2', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('124', '芒果团队3', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('125', '芒果团队4', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('126', '芒果团队5', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('127', '芒果团队6', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('128', '芒果团队7', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('129', '芒果团队8', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('130', '芒果团队9', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('131', '芒果团队10', '5', '0', '一个专注于帮助聋哑人的大学生团队', '#', '3', '2015-11-11', 'Mon Jan 25 14:57:20 CST 2016');
INSERT INTO `team` VALUES ('132', 'helloman', '5', '1', '我们团队特NB，来了绝对拿国奖，现在我们团队已经完成了队长选举，没错就是本大爷，现在还需要一个给本大爷出创意的和一个编代码的，像蹭我的光就赶紧来！', null, '46', '2016-01-31', 'Fri Jan 29 15:27:26 CST 2016');
INSERT INTO `team` VALUES ('134', 'starveTogether', '7', '2', '没错，下现在就是差一个打酱油的！', null, '25', '2016-02-12', '2016-02-11');
INSERT INTO `team` VALUES ('135', '没错，我又要开始飙车啦，哈哈哈', '6', '1', '刚开会尽快尽快汇款', null, '50', '2016-02-29', '2016-02-14');

-- ----------------------------
-- Table structure for team_person
-- ----------------------------
DROP TABLE IF EXISTS `team_person`;
CREATE TABLE `team_person` (
  `id` int(11) NOT NULL auto_increment,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `team_id` (`team_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team_person
-- ----------------------------
INSERT INTO `team_person` VALUES ('1', '1', '3');
INSERT INTO `team_person` VALUES ('2', '1', '4');
INSERT INTO `team_person` VALUES ('3', '2', '4');
INSERT INTO `team_person` VALUES ('4', '2', '5');
INSERT INTO `team_person` VALUES ('9', '134', '46');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `ID` int(11) NOT NULL auto_increment,
  `password` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL auto_increment,
  `password` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
