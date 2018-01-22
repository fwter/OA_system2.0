/*
 Navicat Premium Data Transfer

 Source Server         : mysql57
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : oa

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 07/01/2018 20:45:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept_power
-- ----------------------------
DROP TABLE IF EXISTS `dept_power`;
CREATE TABLE `dept_power`  (
  `menu_id` int(11) NOT NULL COMMENT '��ʶÿ���˵���Ψһ���',
  `dept_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`menu_id`, `dept_id`) USING BTREE,
  INDEX `FK_dept_power2`(`dept_id`) USING BTREE,
  CONSTRAINT `FK_dept_power2` FOREIGN KEY (`dept_id`) REFERENCES `oa_dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Fk_dept_menu` FOREIGN KEY (`menu_id`) REFERENCES `oa_menu` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for emp_bian
-- ----------------------------
DROP TABLE IF EXISTS `emp_bian`;
CREATE TABLE `emp_bian`  (
  `pay_standardid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pay_standardid`, `emp_id`) USING BTREE,
  INDEX `FK_emp_bian2`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_bian` FOREIGN KEY (`pay_standardid`) REFERENCES `oa_paystandard` (`pay_standardid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_emp_bian2` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for emp_paiban
-- ----------------------------
DROP TABLE IF EXISTS `emp_paiban`;
CREATE TABLE `emp_paiban`  (
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sht_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`emp_id`, `sht_id`) USING BTREE,
  INDEX `FK_emp_paiban2`(`sht_id`) USING BTREE,
  CONSTRAINT `FK_emp_paiban` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_emp_paiban2` FOREIGN KEY (`sht_id`) REFERENCES `oa_scheduletype` (`sht_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_attendance
-- ----------------------------
DROP TABLE IF EXISTS `oa_attendance`;
CREATE TABLE `oa_attendance`  (
  `att_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `att_date` date NULL DEFAULT NULL,
  `att_signin` datetime(0) NULL DEFAULT NULL,
  `att_signout` datetime(0) NULL DEFAULT NULL,
  `att_state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`att_id`) USING BTREE,
  INDEX `FK_atten_emp`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_atten_emp` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_balance
-- ----------------------------
DROP TABLE IF EXISTS `oa_balance`;
CREATE TABLE `oa_balance`  (
  `bal_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `baler_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `caozuo_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bal_number` int(11) NULL DEFAULT NULL,
  `bal_year` date NULL DEFAULT NULL,
  `bal_reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bal_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`bal_id`) USING BTREE,
  INDEX `FK_caozuo`(`caozuo_id`) USING BTREE,
  INDEX `FK_emper`(`baler_id`) USING BTREE,
  CONSTRAINT `FK_caozuo` FOREIGN KEY (`caozuo_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_emper` FOREIGN KEY (`baler_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_card
-- ----------------------------
DROP TABLE IF EXISTS `oa_card`;
CREATE TABLE `oa_card`  (
  `card_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_org` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_takedate` date NULL DEFAULT NULL,
  `card_workdate` date NULL DEFAULT NULL,
  `card_overdate` date NULL DEFAULT NULL,
  `card_rewark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_enc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`card_id`) USING BTREE,
  INDEX `FK_emp_card`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_card` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_cardborrow
-- ----------------------------
DROP TABLE IF EXISTS `oa_cardborrow`;
CREATE TABLE `oa_cardborrow`  (
  `cb_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cb_bdate` date NULL DEFAULT NULL,
  `cb_rdate` date NULL DEFAULT NULL,
  `cb_reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cb_id`) USING BTREE,
  INDEX `FK_bo_emp`(`emp_id`) USING BTREE,
  INDEX `FK_card_bo`(`card_id`) USING BTREE,
  CONSTRAINT `FK_bo_emp` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_card_bo` FOREIGN KEY (`card_id`) REFERENCES `oa_card` (`card_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_contract
-- ----------------------------
DROP TABLE IF EXISTS `oa_contract`;
CREATE TABLE `oa_contract`  (
  `con_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `con_term` int(11) NULL DEFAULT NULL,
  `con_signtime` int(11) NULL DEFAULT NULL,
  `con_signdate` date NULL DEFAULT NULL,
  `con_begindate` date NULL DEFAULT NULL,
  `con_tryend` date NULL DEFAULT NULL,
  `con_enddate` date NULL DEFAULT NULL,
  `con_stopdate` date NULL DEFAULT NULL,
  `con_state` int(11) NULL DEFAULT NULL,
  `con_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `con_enc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`con_id`) USING BTREE,
  INDEX `FK_emp_contract`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_contract` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_dept
-- ----------------------------
DROP TABLE IF EXISTS `oa_dept`;
CREATE TABLE `oa_dept`  (
  `dept_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_dismission
-- ----------------------------
DROP TABLE IF EXISTS `oa_dismission`;
CREATE TABLE `oa_dismission`  (
  `dis_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dis_applydate` date NULL DEFAULT NULL,
  `dis_inworkdate` date NULL DEFAULT NULL,
  `dis_date` date NULL DEFAULT NULL,
  `dis_type` int(11) NULL DEFAULT NULL,
  `dis_reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dis_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dis_enc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dis_leaderch` int(11) NULL DEFAULT NULL,
  `dis_emch` int(11) NULL DEFAULT NULL,
  `dis_state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`dis_id`) USING BTREE,
  INDEX `FK_emp_leave`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_leave` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_emp
-- ----------------------------
DROP TABLE IF EXISTS `oa_emp`;
CREATE TABLE `oa_emp`  (
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rap_aname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_logintype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_mgr` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_sex` int(11) NULL DEFAULT NULL,
  `emp_birth` date NULL DEFAULT NULL,
  `emp_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_photo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_fileid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_workstate` int(11) NULL DEFAULT NULL,
  `emp_type` int(11) NULL DEFAULT NULL,
  `emp_cardid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_native` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_nation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_oldname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_nationality` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_entrydate` date NULL DEFAULT NULL,
  `emp_formaldate` date NULL DEFAULT NULL,
  `emp_dismission` date NULL DEFAULT NULL,
  `emp_station` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_maxdegree` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_maxeducation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_school` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_graduation` date NULL DEFAULT NULL,
  `emp_like` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_healthy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_high` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_weight` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_bank` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_bankid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_eme` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_emetel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `FK_dept_emp`(`dept_id`) USING BTREE,
  INDEX `FK_emp_job`(`job_id`) USING BTREE,
  CONSTRAINT `FK_dept_emp` FOREIGN KEY (`dept_id`) REFERENCES `oa_dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_emp_job` FOREIGN KEY (`job_id`) REFERENCES `oa_job` (`job_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_examproject
-- ----------------------------
DROP TABLE IF EXISTS `oa_examproject`;
CREATE TABLE `oa_examproject`  (
  `ep_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pt_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ep_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ep_maxscore` int(11) NULL DEFAULT NULL,
  `ep_minscore` int(11) NULL DEFAULT NULL,
  `ep_stand` int(11) NULL DEFAULT NULL,
  `ep_scorerule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ep_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ep_state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ep_id`) USING BTREE,
  INDEX `FK_temp_pro`(`pt_id`) USING BTREE,
  CONSTRAINT `FK_temp_pro` FOREIGN KEY (`pt_id`) REFERENCES `oa_pertemp` (`pt_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_examtask
-- ----------------------------
DROP TABLE IF EXISTS `oa_examtask`;
CREATE TABLE `oa_examtask`  (
  `et_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pt_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `et_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `et_year` int(11) NULL DEFAULT NULL,
  `et_issue` int(11) NULL DEFAULT NULL,
  `et_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `et_startdate` date NULL DEFAULT NULL,
  `et_enddate` date NULL DEFAULT NULL,
  `et_state` int(11) NULL DEFAULT NULL COMMENT '0:代表已删除，1：代表未删除',
  `et_pushState` int(11) NULL DEFAULT NULL COMMENT '0:已发布，1：进行中.2:已完成',
  PRIMARY KEY (`et_id`) USING BTREE,
  INDEX `FK_temp_task`(`pt_id`) USING BTREE,
  CONSTRAINT `FK_temp_task` FOREIGN KEY (`pt_id`) REFERENCES `oa_pertemp` (`pt_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_flow
-- ----------------------------
DROP TABLE IF EXISTS `oa_flow`;
CREATE TABLE `oa_flow`  (
  `flow_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flow_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flow_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flow_date` date NULL DEFAULT NULL,
  `flow_state` int(11) NULL DEFAULT NULL,
  `flow_step` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flow_startdate` date NULL DEFAULT NULL,
  `flow_enddate` date NULL DEFAULT NULL,
  PRIMARY KEY (`flow_id`) USING BTREE,
  INDEX `FK_emp_flow`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_flow` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_formal
-- ----------------------------
DROP TABLE IF EXISTS `oa_formal`;
CREATE TABLE `oa_formal`  (
  `for_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `for_applydate` date NULL DEFAULT NULL,
  `for_inworkdate` date NULL DEFAULT NULL,
  `for_tryend` date NULL DEFAULT NULL,
  `for_date` date NULL DEFAULT NULL,
  `for_leaderch` int(11) NULL DEFAULT NULL,
  `for_emch` int(11) NULL DEFAULT NULL,
  `for_state` int(11) NULL DEFAULT NULL,
  `for_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`for_id`) USING BTREE,
  INDEX `FK_emp_formal`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_formal` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_job
-- ----------------------------
DROP TABLE IF EXISTS `oa_job`;
CREATE TABLE `oa_job`  (
  `job_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_superior` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_duty` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_require` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_dec` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_leave
-- ----------------------------
DROP TABLE IF EXISTS `oa_leave`;
CREATE TABLE `oa_leave`  (
  `lea_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vac_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lea_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lea_applydate` date NULL DEFAULT NULL,
  `lea_startdate` date NULL DEFAULT NULL,
  `lea_enddate` date NULL DEFAULT NULL,
  `lea_day` int(11) NULL DEFAULT NULL,
  `lea_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lea_deptch` int(11) NULL DEFAULT NULL,
  `lea_managech` int(11) NULL DEFAULT NULL,
  `lea_emch` int(11) NULL DEFAULT NULL,
  `lea_state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`lea_id`) USING BTREE,
  INDEX `FK_emp_levac`(`emp_id`) USING BTREE,
  INDEX `FK_vac_type`(`vac_id`) USING BTREE,
  CONSTRAINT `FK_emp_levac` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_vac_type` FOREIGN KEY (`vac_id`) REFERENCES `oa_vacation` (`vac_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_menu
-- ----------------------------
DROP TABLE IF EXISTS `oa_menu`;
CREATE TABLE `oa_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��ʶÿ���˵���Ψһ���',
  `meu_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�˵����ƣ�ÿ���˵�����Ӧ��Ψһ���������������ƺ��ñ������',
  `menu_father` int(11) NULL DEFAULT NULL COMMENT '��ʾ�����˵���ͨ�������˵������Ӽ��˵��������������ݽṹ',
  `menu_link` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�˵����ӣ�ÿ���˵�������ʵ�·��',
  `menu_img` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�˵�ǰ��ͼƬ·��',
  `menu_isvisible` int(11) NULL DEFAULT NULL COMMENT '�Ƿ?˵����أ�0���ɼ���1�����ɼ�',
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `meu_name`(`meu_name`) USING BTREE,
  INDEX `menu_father`(`menu_father`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ϵͳ�����в˵���ÿ���˵���Ӧһ��Ȩ��' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_menu
-- ----------------------------
INSERT INTO `oa_menu` VALUES (2, '人事', 0, '/rs', NULL, 0);
INSERT INTO `oa_menu` VALUES (3, '流程', 0, '/lc', NULL, 0);
INSERT INTO `oa_menu` VALUES (4, '/个人', 0, '/gr', NULL, 0);
INSERT INTO `oa_menu` VALUES (5, '薪资', 0, '/xz', NULL, 0);
INSERT INTO `oa_menu` VALUES (6, 'aaa', 0, '', NULL, 0);
INSERT INTO `oa_menu` VALUES (7, 'abc', 0, '', NULL, 0);
INSERT INTO `oa_menu` VALUES (8, 'acxz', 0, '', NULL, 0);
INSERT INTO `oa_menu` VALUES (9, 'qwesd', 0, '', NULL, 0);
INSERT INTO `oa_menu` VALUES (10, 'ads', 0, '', NULL, 0);
INSERT INTO `oa_menu` VALUES (11, 'adqewqr', 0, '', NULL, 0);
INSERT INTO `oa_menu` VALUES (12, 'qewrq', 0, '', NULL, 0);
INSERT INTO `oa_menu` VALUES (13, 'dasdsa', 0, '', NULL, 0);
INSERT INTO `oa_menu` VALUES (14, 'fretgf', 0, '', NULL, 0);
INSERT INTO `oa_menu` VALUES (15, NULL, 0, NULL, NULL, 0);
INSERT INTO `oa_menu` VALUES (16, NULL, 0, '/sys', NULL, 0);
INSERT INTO `oa_menu` VALUES (17, NULL, 0, '/sysy', NULL, 0);
INSERT INTO `oa_menu` VALUES (18, NULL, 0, '/aaaaa', NULL, 0);
INSERT INTO `oa_menu` VALUES (19, NULL, 0, 'aaaadsa', NULL, 0);
INSERT INTO `oa_menu` VALUES (20, 'OA', 2, '/aaaddd', NULL, 0);
INSERT INTO `oa_menu` VALUES (21, 'aasss', 4, 'qweqwe', NULL, 0);
INSERT INTO `oa_menu` VALUES (22, 'aasss', 4, 'qweqwe', NULL, 0);
INSERT INTO `oa_menu` VALUES (23, 'aaa', 3, 'aaa', NULL, 0);
INSERT INTO `oa_menu` VALUES (24, '系统', 0, '/system', NULL, 0);

-- ----------------------------
-- Table structure for oa_move
-- ----------------------------
DROP TABLE IF EXISTS `oa_move`;
CREATE TABLE `oa_move`  (
  `move_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `move_type` int(11) NULL DEFAULT NULL,
  `move_date` date NULL DEFAULT NULL,
  `move_effdate` date NULL DEFAULT NULL,
  `move_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `move_enc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `move_oldch` int(11) NULL DEFAULT NULL,
  `move_newch` int(11) NULL DEFAULT NULL,
  `move_emch` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`move_id`) USING BTREE,
  INDEX `FK_emp_move`(`emp_id`) USING BTREE,
  INDEX `FK_move_dept`(`dept_id`) USING BTREE,
  INDEX `FK_move_job`(`job_id`) USING BTREE,
  CONSTRAINT `FK_emp_move` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_move_dept` FOREIGN KEY (`dept_id`) REFERENCES `oa_dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_move_job` FOREIGN KEY (`job_id`) REFERENCES `oa_job` (`job_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_overtimecode
-- ----------------------------
DROP TABLE IF EXISTS `oa_overtimecode`;
CREATE TABLE `oa_overtimecode`  (
  `code_id` int(11) NOT NULL,
  `type_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_long` int(11) NULL DEFAULT NULL,
  `code_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`code_id`) USING BTREE,
  INDEX `FK_emp_jia`(`emp_id`) USING BTREE,
  INDEX `FK_type_add`(`type_id`) USING BTREE,
  CONSTRAINT `FK_emp_jia` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_type_add` FOREIGN KEY (`type_id`) REFERENCES `oa_overtimetype` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_overtimetype
-- ----------------------------
DROP TABLE IF EXISTS `oa_overtimetype`;
CREATE TABLE `oa_overtimetype`  (
  `type_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_price` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_password
-- ----------------------------
DROP TABLE IF EXISTS `oa_password`;
CREATE TABLE `oa_password`  (
  `pa_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pa_pass` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pa_id`) USING BTREE,
  INDEX `FK_pass_emp`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_pass_emp` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_paystandard
-- ----------------------------
DROP TABLE IF EXISTS `oa_paystandard`;
CREATE TABLE `oa_paystandard`  (
  `pay_standardid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pay_standardtype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pay_standardid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_paytable
-- ----------------------------
DROP TABLE IF EXISTS `oa_paytable`;
CREATE TABLE `oa_paytable`  (
  `pay_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_money` decimal(20, 2) NULL DEFAULT NULL,
  `pay_senddate` date NULL DEFAULT NULL,
  `pay_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pay_id`) USING BTREE,
  INDEX `FK_emp_send`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_send` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_paytemplate
-- ----------------------------
DROP TABLE IF EXISTS `oa_paytemplate`;
CREATE TABLE `oa_paytemplate`  (
  `pay_templateid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oa__emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oa__emp_id2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_templatedate` date NULL DEFAULT NULL,
  PRIMARY KEY (`pay_templateid`) USING BTREE,
  INDEX `FK_creater`(`oa__emp_id`) USING BTREE,
  INDEX `FK_examer`(`oa__emp_id2`) USING BTREE,
  INDEX `FK_sender`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_creater` FOREIGN KEY (`oa__emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_examer` FOREIGN KEY (`oa__emp_id2`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_sender` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_personalbook
-- ----------------------------
DROP TABLE IF EXISTS `oa_personalbook`;
CREATE TABLE `oa_personalbook`  (
  `per_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `per_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `per_job` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `per_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `per_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `per_residencetel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `per_fax` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `per_emial` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `per_company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`per_id`) USING BTREE,
  INDEX `FK_per_emp`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_per_emp` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_pertemp
-- ----------------------------
DROP TABLE IF EXISTS `oa_pertemp`;
CREATE TABLE `oa_pertemp`  (
  `pt_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `le_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pt_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pt_type` int(11) NULL DEFAULT NULL,
  `pt_score` int(11) NULL DEFAULT NULL,
  `pt_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pt_creater` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pt_crdate` date NULL DEFAULT NULL,
  `pt_state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`pt_id`) USING BTREE,
  INDEX `FK_emp_temp`(`emp_id`) USING BTREE,
  INDEX `FK_job_temp`(`job_id`) USING BTREE,
  CONSTRAINT `FK_emp_temp` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_job_temp` FOREIGN KEY (`job_id`) REFERENCES `oa_job` (`job_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_rap
-- ----------------------------
DROP TABLE IF EXISTS `oa_rap`;
CREATE TABLE `oa_rap`  (
  `rap_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apply_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `raper_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rap_type` int(11) NULL DEFAULT NULL,
  `rap_pro` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rap_date` date NULL DEFAULT NULL,
  `rap_money` int(11) NULL DEFAULT NULL,
  `rap_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rap_dept` int(11) NULL DEFAULT NULL,
  `rap_manage` int(11) NULL DEFAULT NULL,
  `rap_emch` int(11) NULL DEFAULT NULL,
  `rap_state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`rap_id`) USING BTREE,
  INDEX `FK_apply`(`raper_id`) USING BTREE,
  INDEX `FK_emp_rap`(`apply_id`) USING BTREE,
  CONSTRAINT `FK_apply` FOREIGN KEY (`raper_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_emp_rap` FOREIGN KEY (`apply_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_schedule
-- ----------------------------
DROP TABLE IF EXISTS `oa_schedule`;
CREATE TABLE `oa_schedule`  (
  `sch_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sch_date` date NULL DEFAULT NULL,
  `sch_timeslot` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sch_id`) USING BTREE,
  INDEX `FK_emp_sch`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_sch` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_schedulecontent
-- ----------------------------
DROP TABLE IF EXISTS `oa_schedulecontent`;
CREATE TABLE `oa_schedulecontent`  (
  `con_cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sch_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `con_type` int(11) NULL DEFAULT NULL,
  `con_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `con_starttime` datetime(0) NULL DEFAULT NULL,
  `con_endtime` datetime(0) NULL DEFAULT NULL,
  `con_remindtime` datetime(0) NULL DEFAULT NULL,
  `con_reminding` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`con_cid`) USING BTREE,
  INDEX `FK_content_sch`(`sch_id`) USING BTREE,
  CONSTRAINT `FK_content_sch` FOREIGN KEY (`sch_id`) REFERENCES `oa_schedule` (`sch_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_scheduletype
-- ----------------------------
DROP TABLE IF EXISTS `oa_scheduletype`;
CREATE TABLE `oa_scheduletype`  (
  `sht_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sht_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sht_w1` int(11) NULL DEFAULT NULL,
  `sht_w2` int(11) NULL DEFAULT NULL,
  `sht_w3` int(11) NULL DEFAULT NULL,
  `sht_w4` int(11) NULL DEFAULT NULL,
  `sht_w5` int(11) NULL DEFAULT NULL,
  `sht_w6` int(11) NULL DEFAULT NULL,
  `sht_w7` int(11) NULL DEFAULT NULL,
  `sht_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sht_status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sht_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_score
-- ----------------------------
DROP TABLE IF EXISTS `oa_score`;
CREATE TABLE `oa_score`  (
  `score_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `et_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score_state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`score_id`) USING BTREE,
  INDEX `FK_emp_score`(`emp_id`) USING BTREE,
  INDEX `FK_task_score`(`et_id`) USING BTREE,
  CONSTRAINT `FK_emp_score` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_task_score` FOREIGN KEY (`et_id`) REFERENCES `oa_examtask` (`et_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_scoredetail
-- ----------------------------
DROP TABLE IF EXISTS `oa_scoredetail`;
CREATE TABLE `oa_scoredetail`  (
  `sd_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ep_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sd_summary` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sd_leadcon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sd_id`) USING BTREE,
  INDEX `FK_pro_detail`(`ep_id`) USING BTREE,
  INDEX `FK_score_detail`(`score_id`) USING BTREE,
  CONSTRAINT `FK_pro_detail` FOREIGN KEY (`ep_id`) REFERENCES `oa_examproject` (`ep_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_score_detail` FOREIGN KEY (`score_id`) REFERENCES `oa_score` (`score_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_systemlog
-- ----------------------------
DROP TABLE IF EXISTS `oa_systemlog`;
CREATE TABLE `oa_systemlog`  (
  `log_id` int(11) NOT NULL COMMENT '��ʶ��־ÿ����¼��Ψһ��ʶ',
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_sysTime` date NULL DEFAULT NULL COMMENT '��¼ÿ��Σ�ղ�����ʱ��',
  `log_IP` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��¼ÿ��Σ�ղ�����IP��ַ',
  `log_option` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��¼ÿ��Σ�ղ���������',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `FK_emp_log`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_log` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '��ʵ����Ҫ�����¼ϵͳ�����е�Σ�ղ���������Ȩ�޵��޸�' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_telgroup
-- ----------------------------
DROP TABLE IF EXISTS `oa_telgroup`;
CREATE TABLE `oa_telgroup`  (
  `group_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_trainplan
-- ----------------------------
DROP TABLE IF EXISTS `oa_trainplan`;
CREATE TABLE `oa_trainplan`  (
  `rp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tec_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rp_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rp_host` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rp_place` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rp_day` int(11) NULL DEFAULT NULL,
  `rp_money` int(11) NULL DEFAULT NULL,
  `rp_begin` date NULL DEFAULT NULL,
  `rp_end` date NULL DEFAULT NULL,
  `rp_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rp_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rp_others` int(11) NULL DEFAULT NULL,
  `rp_state` int(11) NULL DEFAULT NULL,
  `rp_stunum` int(11) NULL DEFAULT NULL,
  `rp_assess` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rp_id`) USING BTREE,
  INDEX `FK_fuze`(`emp_id`) USING BTREE,
  INDEX `FK_tec_plan`(`tec_id`) USING BTREE,
  CONSTRAINT `FK_fuze` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_tec_plan` FOREIGN KEY (`tec_id`) REFERENCES `oa_traintec` (`tec_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_traintec
-- ----------------------------
DROP TABLE IF EXISTS `oa_traintec`;
CREATE TABLE `oa_traintec`  (
  `tec_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tec_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tec_type` int(11) NULL DEFAULT NULL,
  `tec_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tec_email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tec_post` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tec_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tec_inner` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tec_out` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tec_innerdate` date NULL DEFAULT NULL,
  `tec_outdate` date NULL DEFAULT NULL,
  `tec_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tec_state` int(11) NULL DEFAULT NULL,
  `tec_enc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tec_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_turn
-- ----------------------------
DROP TABLE IF EXISTS `oa_turn`;
CREATE TABLE `oa_turn`  (
  `turn_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `flow_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `turn_state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`turn_id`) USING BTREE,
  INDEX `FK_flow_turn`(`flow_id`) USING BTREE,
  CONSTRAINT `FK_flow_turn` FOREIGN KEY (`flow_id`) REFERENCES `oa_flow` (`flow_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_vacation
-- ----------------------------
DROP TABLE IF EXISTS `oa_vacation`;
CREATE TABLE `oa_vacation`  (
  `vac_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vac_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vac_number` int(11) NULL DEFAULT NULL,
  `vac_check` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`vac_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oa_whereabouts
-- ----------------------------
DROP TABLE IF EXISTS `oa_whereabouts`;
CREATE TABLE `oa_whereabouts`  (
  `whe_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `whe_start` date NULL DEFAULT NULL,
  `whe_end` date NULL DEFAULT NULL,
  `whe_about` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `whe_state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`whe_id`) USING BTREE,
  INDEX `FK_emp_wh`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_wh` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trainstu
-- ----------------------------
DROP TABLE IF EXISTS `trainstu`;
CREATE TABLE `trainstu`  (
  `rp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`rp_id`, `emp_id`) USING BTREE,
  INDEX `FK_trainstu2`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_trainstu` FOREIGN KEY (`rp_id`) REFERENCES `oa_trainplan` (`rp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_trainstu2` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
