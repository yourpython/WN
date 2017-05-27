/*
Navicat MySQL Data Transfer

Source Server         : FengMySQL
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : wn

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2017-05-27 17:34:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `content` text CHARACTER SET gbk,
  `author` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `img` varchar(50) CHARACTER SET gbk DEFAULT NULL,
  `pic` varchar(100) CHARACTER SET gbk DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `isshow` int(11) DEFAULT NULL,
  `istop` int(11) DEFAULT NULL,
  `isimp` int(11) DEFAULT NULL,
  `classid` int(11) DEFAULT NULL,
  `newstype` int(11) DEFAULT NULL,
  `keyword` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `donum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20345 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '标题', '内容', '作者', '图片名', '', '2017-05-02 16:47:47', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for newstype
-- ----------------------------
DROP TABLE IF EXISTS `newstype`;
CREATE TABLE `newstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `typeid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newstype
-- ----------------------------
INSERT INTO `newstype` VALUES ('1', '卫宁新闻', '0', '1', '0');
INSERT INTO `newstype` VALUES ('2', '医院之声', '0', '1', '1');
INSERT INTO `newstype` VALUES ('3', '签约新闻', '1', '1', '0');
INSERT INTO `newstype` VALUES ('4', '市场新闻', '1', '1', '1');
INSERT INTO `newstype` VALUES ('5', '行业新闻', '1', '1', '2');
INSERT INTO `newstype` VALUES ('6', '公司动态', '1', '1', '3');
INSERT INTO `newstype` VALUES ('7', null, null, null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `realname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uuid` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `folk` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qq` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `login_time` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username_uniquekey` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'admin', null, 'd42683b3df678c61', '7a57a5a743894a0e', null, null, null, null, null, null, null, null, '2017-05-25 10:40:29', null, '0', '0', null);
INSERT INTO `user` VALUES ('3', 'ljqljq', 'ljqljq', '49cf73989dfa47ce851302f6f3f1e4e2', 'd6b6def8c4b81620eac1687250c14777', 'default.png', null, null, '330031116@qq.com', null, null, null, null, '2017-05-27 11:57:11', '2017-05-27 16:13:48', '0', '0', null);

-- ----------------------------
-- Table structure for userlogininfo
-- ----------------------------
DROP TABLE IF EXISTS `userlogininfo`;
CREATE TABLE `userlogininfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userlogininfo_userid_foregignkey` (`user_id`),
  CONSTRAINT `userlogininfo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of userlogininfo
-- ----------------------------
INSERT INTO `userlogininfo` VALUES ('1', '1', '2016-01-12 10:48:28', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('2', '1', '2016-01-12 10:49:01', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('3', '1', '2016-01-12 10:54:49', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('4', '1', '2016-01-12 10:59:47', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('5', '1', '2016-01-12 11:09:21', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('6', '3', '2017-05-27 12:06:03', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('7', '3', '2017-05-27 12:07:35', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('8', '3', '2017-05-27 12:09:25', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('9', '3', '2017-05-27 14:30:39', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('10', '3', '2017-05-27 14:33:15', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('11', '3', '2017-05-27 14:34:48', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('12', '3', '2017-05-27 14:35:52', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('13', '3', '2017-05-27 14:37:10', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('14', '3', '2017-05-27 14:38:41', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('15', '3', '2017-05-27 14:55:10', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('16', '3', '2017-05-27 15:22:33', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('17', '3', '2017-05-27 15:31:41', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('18', '3', '2017-05-27 15:34:57', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('19', '3', '2017-05-27 15:50:45', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('20', '3', '2017-05-27 16:01:44', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('21', '3', '2017-05-27 16:07:37', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('22', '3', '2017-05-27 16:13:21', '0:0:0:0:0:0:0:1');
INSERT INTO `userlogininfo` VALUES ('23', '3', '2017-05-27 16:13:48', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) DEFAULT NULL,
  `upwd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'xiao', '123');
