/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : home_device

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 30/09/2021 15:55:45
*/


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP DATABASE IF EXISTS `myhome`;
CREATE DATABASE myhome;
USE myhome;

-- ----------------------------
-- Table structure for door
-- ----------------------------
DROP TABLE IF EXISTS `door`;
CREATE TABLE `door`  (
  `deviceId` int(11) NOT NULL AUTO_INCREMENT,
  `is_close` int(11) NOT NULL COMMENT '0开启\n1关闭',
  `is_lock` int(11) NOT NULL COMMENT '0上锁\n1解锁',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `rId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`deviceId`) USING BTREE,
  UNIQUE INDEX `door_deviceId_uindex`(`deviceId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of door
-- ----------------------------
INSERT INTO `door` VALUES (1, 1, 1, '书房', 2, 3);
INSERT INTO `door` VALUES (2, 0, 1, '次卧', 2, 1);
INSERT INTO `door` VALUES (3, 1, 1, '主卧', 2, 10);
INSERT INTO `door` VALUES (4, 1, 0, '客厅', 2, 10);

-- ----------------------------
-- Table structure for factory
-- ----------------------------
DROP TABLE IF EXISTS `factory`;
CREATE TABLE `factory`  (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `model` int(11) NOT NULL COMMENT '0灯\n 1门\n 2温湿度 3风扇',
  `instruction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '说明',
  PRIMARY KEY (`typeId`) USING BTREE,
  UNIQUE INDEX `factory_typeId_uindex`(`typeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of factory
-- ----------------------------
INSERT INTO `factory` VALUES (1, 'Light', 0, 'This is light');
INSERT INTO `factory` VALUES (2, 'Door', 1, 'This is door');
INSERT INTO `factory` VALUES (3, 'Sensor', 2, 'This is sensor');
INSERT INTO `factory` VALUES (4, 'Fans', 3, 'This is fans');

-- ----------------------------
-- Table structure for fans
-- ----------------------------
DROP TABLE IF EXISTS `fans`;
CREATE TABLE `fans`  (
  `deviceId` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `is_close` int(11) NOT NULL COMMENT '0开启，1关闭',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `rId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`deviceId`) USING BTREE,
  UNIQUE INDEX `light_deviceId_uindex`(`deviceId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fans
-- ----------------------------
INSERT INTO `fans` VALUES (1, 10, 1, '主卧', 4, 10);

-- ----------------------------
-- Table structure for light
-- ----------------------------
DROP TABLE IF EXISTS `light`;
CREATE TABLE `light`  (
  `deviceId` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `R` int(11) NULL DEFAULT NULL,
  `G` int(11) NULL DEFAULT NULL,
  `B` int(11) NULL DEFAULT NULL,
  `is_close` int(11) NOT NULL COMMENT '0开启，1关闭',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `rId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`deviceId`) USING BTREE,
  UNIQUE INDEX `light_deviceId_uindex`(`deviceId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of light
-- ----------------------------
INSERT INTO `light` VALUES (2, 1, 1, 1, 1, 0, '书房', 1, 1);
INSERT INTO `light` VALUES (3, 1, 1, 1, 1, 0, '老人房', 1, 1);
INSERT INTO `light` VALUES (4, 80, 0, 0, 0, 1, '主卧', 1, 10);
INSERT INTO `light` VALUES (5, 90, 255, 255, 255, 0, '次卧', 1, 10);
INSERT INTO `light` VALUES (6, 1, 1, 1, 1, 0, '主卧', 1, 10);
INSERT INTO `light` VALUES (7, 1, 1, 1, 1, 0, '次卧', 1, 10);
INSERT INTO `light` VALUES (8, 1, 1, 1, 1, 0, '卫生间', 1, 10);
INSERT INTO `light` VALUES (9, 1, 1, 1, 1, 0, '主卧', 1, 1);
INSERT INTO `light` VALUES (10, 1, 1, 1, 1, 0, '餐厅', 1, 1);
INSERT INTO `light` VALUES (11, 1, 1, 1, 1, 1, '书房', 1, 10);
INSERT INTO `light` VALUES (12, 1, 1, 1, 1, 0, '次卧', 1, 10);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `deviceId` int(11) NOT NULL,
  `time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `rId` int(11) NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL COMMENT '亮度',
  `temperature` double NULL DEFAULT NULL COMMENT '温度',
  `humidity` double NULL DEFAULT NULL COMMENT '湿度百分比',
  `is_close` int(11) NULL DEFAULT NULL COMMENT '门 0开启\n1关闭',
  PRIMARY KEY (`logId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 1, '2021-09-29 11:25:14', '主卧', 2, 10, NULL, 10, 1, NULL);
INSERT INTO `log` VALUES (2, 1, '2021-09-28 16:57:36', '次卧', 2, 10, NULL, 20, 1, NULL);
INSERT INTO `log` VALUES (3, 1, '2021-09-29 17:35:13', '书房', 2, 10, NULL, 30, 2, NULL);
INSERT INTO `log` VALUES (4, 1, '2021-09-29 15:37:26', '餐厅', 2, 10, NULL, 40, 3, NULL);
INSERT INTO `log` VALUES (5, 1, '2021-09-27 00:38:12', '次卧', 1, 10, 80, NULL, NULL, 0);
INSERT INTO `log` VALUES (6, 2, '2021-09-29 20:31:42', '次卧', 1, 10, 70, NULL, NULL, 0);
INSERT INTO `log` VALUES (7, 2, '2021-09-26 20:31:42', '书房', 1, 10, 60, NULL, NULL, 1);
INSERT INTO `log` VALUES (8, 2, '2021-09-26 20:31:42', '主卧', 1, 10, 60, NULL, NULL, 0);
INSERT INTO `log` VALUES (9, 2, '2021-09-23 20:31:42', '主卧', 1, 10, 70, NULL, NULL, 1);

-- ----------------------------
-- Table structure for sensor
-- ----------------------------
DROP TABLE IF EXISTS `sensor`;
CREATE TABLE `sensor`  (
  `deviceId` int(11) NOT NULL AUTO_INCREMENT,
  `temperature` double NULL DEFAULT NULL COMMENT '温度',
  `humidity` double NULL DEFAULT NULL COMMENT '湿度百分比',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `rId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`deviceId`) USING BTREE,
  UNIQUE INDEX `sensor_deviceId_uindex`(`deviceId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sensor
-- ----------------------------
INSERT INTO `sensor` VALUES (1, 1, 1, '次卧', 3, 1);
INSERT INTO `sensor` VALUES (2, 37.5, 25.4, '客厅', 3, 10);
INSERT INTO `sensor` VALUES (3, 10.5, 10.8, '客厅', 3, 10);
INSERT INTO `sensor` VALUES (4, 12, 12, '客厅', 3, 10);
INSERT INTO `sensor` VALUES (5, NULL, NULL, '客厅', 3, 10);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uId` int(11) NOT NULL,
  `uPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uAge` int(11) NOT NULL,
  `uEmail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uTel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rId` int(11) NULL DEFAULT NULL COMMENT 'room id',
  `uType` int(11) NOT NULL COMMENT '0 用户 1 管理员 2 设备厂家',
  PRIMARY KEY (`uId`) USING BTREE,
  UNIQUE INDEX `User_uId_uindex`(`uId`) USING BTREE,
  INDEX `user_room_rId_fk`(`rId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (202100, 'e10adc3949ba59abbe56e057f20f883e', '管理员', 20, '1@qq.com', '15551305121', NULL, 1);
INSERT INTO `user` VALUES (202101, 'e10adc3949ba59abbe56e057f20f883e', '李小丫', 30, '2@qq.com', '15551305122', 10, 0);
INSERT INTO `user` VALUES (202102, 'e10adc3949ba59abbe56e057f20f883e', '设备厂家', 40, '3@qq.com', '15551305123', NULL, 2);

SET FOREIGN_KEY_CHECKS = 1;
