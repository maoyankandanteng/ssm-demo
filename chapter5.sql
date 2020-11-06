/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : chapter5

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2020-11-06 10:34:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(60) NOT NULL,
  `sex` int(2) NOT NULL COMMENT '1 - 男 \r\n            0 -女',
  `birthday` date NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `POSITION` varchar(20) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('1', '白海峰', '1', '2020-03-24', '1358747484', '1183279@qq.com', '北京', '无');
INSERT INTO `t_employee` VALUES ('2', '孟嵽', '0', '2020-03-24', '133443312', '13243124@qq.com', '石家庄', '有');

-- ----------------------------
-- Table structure for t_employee_task
-- ----------------------------
DROP TABLE IF EXISTS `t_employee_task`;
CREATE TABLE `t_employee_task` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `emp_id` int(12) NOT NULL,
  `task_id` int(12) NOT NULL,
  `task_name` varchar(60) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_4` (`emp_id`),
  KEY `FK_Reference_8` (`task_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`id`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee_task
-- ----------------------------
INSERT INTO `t_employee_task` VALUES ('1', '1', '1', '照片', '记得收集哦');
INSERT INTO `t_employee_task` VALUES ('2', '1', '2', '报表', '收集哦');
INSERT INTO `t_employee_task` VALUES ('3', '2', '3', '办公室', '开发');
INSERT INTO `t_employee_task` VALUES ('4', '2', '4', '物资部', '开发');

-- ----------------------------
-- Table structure for t_female_health_form
-- ----------------------------
DROP TABLE IF EXISTS `t_female_health_form`;
CREATE TABLE `t_female_health_form` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `emp_id` int(12) NOT NULL,
  `heart` varchar(64) NOT NULL,
  `liver` varchar(64) NOT NULL,
  `spleen` varchar(64) NOT NULL,
  `lung` varchar(64) NOT NULL,
  `kidney` varchar(64) NOT NULL,
  `uterus` varchar(64) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`emp_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_female_health_form
-- ----------------------------
INSERT INTO `t_female_health_form` VALUES ('1', '2', '新', '伽马', '屁', '费', '肾', '数', '无');

-- ----------------------------
-- Table structure for t_male_health_form
-- ----------------------------
DROP TABLE IF EXISTS `t_male_health_form`;
CREATE TABLE `t_male_health_form` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `emp_id` int(12) NOT NULL,
  `heart` varchar(64) NOT NULL,
  `liver` varchar(64) NOT NULL,
  `spleen` varchar(64) NOT NULL,
  `lung` varchar(64) NOT NULL,
  `kidney` varchar(64) NOT NULL,
  `prostate` varchar(64) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_6` (`emp_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_male_health_form
-- ----------------------------
INSERT INTO `t_male_health_form` VALUES ('1', '1', '心', '肝', '脾', '肺', '肾', '布置', '无');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'update_role_name_1', 'update_note_1');
INSERT INTO `t_role` VALUES ('2', 'update_role_name_2', 'update_note_1');
INSERT INTO `t_role` VALUES ('3', 'bhf', 'note3');
INSERT INTO `t_role` VALUES ('4', 'role_name_2', 'note_2');
INSERT INTO `t_role` VALUES ('5', 'role_name_3', 'note_3');

-- ----------------------------
-- Table structure for t_role2
-- ----------------------------
DROP TABLE IF EXISTS `t_role2`;
CREATE TABLE `t_role2` (
  `id` int(12) NOT NULL,
  `role_name` varchar(60) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role2
-- ----------------------------
INSERT INTO `t_role2` VALUES ('1', '超级管理员', '无');
INSERT INTO `t_role2` VALUES ('2', '管理员', '无');
INSERT INTO `t_role2` VALUES ('3', '内部员工', '无');
INSERT INTO `t_role2` VALUES ('4', '游客', '无');
INSERT INTO `t_role2` VALUES ('5', '成人', 'wu');

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `context` varchar(256) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_task
-- ----------------------------
INSERT INTO `t_task` VALUES ('1', '证件照片', '收集证件照', '无');
INSERT INTO `t_task` VALUES ('2', '报表', '填写报表', '无');
INSERT INTO `t_task` VALUES ('3', '开发办公室', '办公室模块', '无');
INSERT INTO `t_task` VALUES ('4', '物资部模块', '物资部模块开发', '啥');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL,
  `real_name` varchar(60) NOT NULL,
  `sex` int(3) DEFAULT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `note` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '白海峰', '白海峰', '1', '1763413413', '132312@qq.com', '无');
INSERT INTO `t_user` VALUES ('2', '孟嵽', '孟嵽', '0', '176329343', '321432@qq.com', '无');
INSERT INTO `t_user` VALUES ('3', '尹鑫', '尹鑫', '0', '1763284324', '324324@qq.com', '无');
INSERT INTO `t_user` VALUES ('4', '陈帅军', '陈帅军', '1', '1733411324', '43214@qq.com', '无');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `role_id` int(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1', '1');
INSERT INTO `t_user_role` VALUES ('2', '1', '5');
INSERT INTO `t_user_role` VALUES ('3', '2', '2');
INSERT INTO `t_user_role` VALUES ('4', '2', '5');
INSERT INTO `t_user_role` VALUES ('5', '3', '3');
INSERT INTO `t_user_role` VALUES ('6', '3', '5');
INSERT INTO `t_user_role` VALUES ('7', '4', '5');

-- ----------------------------
-- Table structure for t_work_card
-- ----------------------------
DROP TABLE IF EXISTS `t_work_card`;
CREATE TABLE `t_work_card` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `emp_id` int(12) NOT NULL,
  `real_name` varchar(60) NOT NULL,
  `department` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `POSITION` varchar(30) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_7` (`emp_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_work_card
-- ----------------------------
INSERT INTO `t_work_card` VALUES ('1', '1', '白海峰', '软件部', '17600233843', '北欧', '无');
INSERT INTO `t_work_card` VALUES ('2', '2', '孟嵽', '行政部', '123143874', '石家庄', '无');
