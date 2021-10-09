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
INSERT INTO `door` VALUES (1,1,1,'study',2,1),(2,0,1,'second bedroom',2,1),(3,1,1,'bedroom',2,10),(4,1,0,'living room',2,10),(5,1,1,'toilet',2,10);

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
INSERT INTO `fans` VALUES (1,10,1,'bedroom',4,10),(2,9,1,'toilet',4,10),(3,8,1,'study',4,10),(4,7,1,'dining room',4,1),(5,6,1,'living rooom',4,1);

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
INSERT INTO `light` VALUES (2,1,1,1,1,0,'sstudy',1,1),(3,1,1,1,1,0,'old room',1,1),(4,80,0,0,0,1,'bedroom',1,10),(5,90,255,255,255,0,'secondary bedroom',1,10),(6,1,1,1,1,0,'bedroom',1,10),(7,1,1,1,1,0,'secondary bedroom',1,10),(8,1,1,1,1,0,'toilet',1,10),(9,1,1,1,1,0,'bedroom',1,1),(10,1,1,1,1,0,'dining room',1,1),(11,1,1,1,1,1,'study',1,10),(12,1,1,1,1,0,'secondary bedroom',1,10);

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
INSERT INTO `log` VALUES (1,1,'2021-09-29 11:25:14','bedroom',3,10,NULL,10,1,NULL),(2,1,'2021-09-28 16:57:36','secondary bedroom',3,10,NULL,20,1,NULL),(3,1,'2021-09-29 17:35:13','study',3,10,NULL,30,2,NULL),(4,1,'2021-09-29 15:37:26','dining room',3,10,NULL,40,3,NULL),(5,1,'2021-09-27 00:38:12','secondary bedroom',1,10,80,NULL,NULL,0),(6,2,'2021-09-29 20:31:42','secondary bedroom',1,10,70,NULL,NULL,0),(7,2,'2021-09-26 20:31:42','study',1,10,60,NULL,NULL,1),(8,2,'2021-09-26 20:31:42','bedroom',1,10,60,NULL,NULL,0),(9,2,'2021-09-23 20:40:42','bedroom',1,10,70,NULL,NULL,1),(10,3,'2021-09-23 20:41:42','dining room',3,10,NULL,23,45,NULL),(11,3,'2021-09-23 20:42:42','dining room',3,10,NULL,24,46,NULL),(12,3,'2021-09-23 20:43:42','dining room',3,10,NULL,25,47,NULL),(13,3,'2021-09-23 20:44:42','dining room',3,10,NULL,26,48,NULL),(14,3,'2021-09-23 20:45:42','dining room',3,10,NULL,27,49,NULL),(15,2,'2021-09-29 15:30:26','old room',1,1,55,NULL,NULL,1),(16,2,'2021-09-29 15:32:26','old room',1,1,56,NULL,NULL,1),(17,2,'2021-09-29 15:34:26','old room',1,1,57,NULL,NULL,1),(18,2,'2021-09-29 15:36:26','old room',1,1,58,NULL,NULL,1),(19,2,'2021-09-29 15:38:26','old room',1,1,60,NULL,NULL,1),(20,6,'2021-09-29 11:20:14','toilet',3,1,NULL,31,65,NULL),(21,6,'2021-09-29 11:22:14','toilet',3,1,NULL,30,64,NULL),(22,6,'2021-09-29 11:24:14','toilet',3,1,NULL,29,63,NULL),(23,6,'2021-09-29 11:26:14','toilet',3,1,NULL,30,62,NULL),(24,6,'2021-09-29 11:28:14','toilet',3,1,NULL,31,61,NULL);

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
INSERT INTO `sensor` VALUES (1,1,1,'secondary bedroom',3,1),(2,37.5,25.4,'living room',3,10),(3,10.5,10.8,'dining room',3,10),(4,12,12,'study',3,10),(5,14,16,'bedroom',3,10),(6,20,15,'toilet',3,1),(7,13.7,26.8,'study',3,1);
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
INSERT INTO `user` VALUES (202100,'e10adc3949ba59abbe56e057f20f883e','adminnistrator',20,'1@qq.com','15551305121',NULL,1),(202101,'e10adc3949ba59abbe56e057f20f883e','lixiaoya',30,'2@qq.com','15551305122',10,0),(202102,'e10adc3949ba59abbe56e057f20f883e','factory',40,'3@qq.com','15551305123',NULL,2);

SET FOREIGN_KEY_CHECKS = 1;
