/*
Navicat MySQL Data Transfer

Source Server         : trkj
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-01-09 14:03:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dept_power`
-- ----------------------------
DROP TABLE IF EXISTS `dept_power`;
CREATE TABLE `dept_power` (
  `menu_id` int(11) NOT NULL COMMENT '菜单编号',
  `dept_id` varchar(20) NOT NULL COMMENT '部门编号',
  PRIMARY KEY (`menu_id`,`dept_id`) USING BTREE,
  KEY `FK_dept_power2` (`dept_id`) USING BTREE,
  CONSTRAINT `FK_dept_power2` FOREIGN KEY (`dept_id`) REFERENCES `oa_dept` (`dept_id`),
  CONSTRAINT `dept_power_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `oa_menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限部门';

-- ----------------------------
-- Records of dept_power
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_bian`
-- ----------------------------
DROP TABLE IF EXISTS `emp_bian`;
CREATE TABLE `emp_bian` (
  `pay_standardid` varchar(10) NOT NULL COMMENT '薪资标准编号',
  `emp_id` varchar(20) NOT NULL COMMENT '工号',
  PRIMARY KEY (`pay_standardid`,`emp_id`) USING BTREE,
  KEY `FK_emp_bian2` (`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_bian` FOREIGN KEY (`pay_standardid`) REFERENCES `oa_paystandard` (`pay_standardid`),
  CONSTRAINT `FK_emp_bian2` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='标准员工';

-- ----------------------------
-- Records of emp_bian
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_paiban`
-- ----------------------------
DROP TABLE IF EXISTS `emp_paiban`;
CREATE TABLE `emp_paiban` (
  `emp_id` varchar(20) NOT NULL COMMENT '工号',
  `sht_id` varchar(20) NOT NULL COMMENT '排班类型编号',
  PRIMARY KEY (`emp_id`,`sht_id`) USING BTREE,
  KEY `FK_emp_paiban2` (`sht_id`) USING BTREE,
  CONSTRAINT `FK_emp_paiban` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`),
  CONSTRAINT `FK_emp_paiban2` FOREIGN KEY (`sht_id`) REFERENCES `oa_scheduletype` (`sht_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='员工排班';

-- ----------------------------
-- Records of emp_paiban
-- ----------------------------
INSERT INTO `emp_paiban` VALUES ('emp2018001', 'sht2018001');
INSERT INTO `emp_paiban` VALUES ('emp2018002', 'sht2018001');
INSERT INTO `emp_paiban` VALUES ('emp2018003', 'sht2018001');
INSERT INTO `emp_paiban` VALUES ('emp2018004', 'sht2018001');
INSERT INTO `emp_paiban` VALUES ('emp2018005', 'sht2018001');
INSERT INTO `emp_paiban` VALUES ('emp2018006', 'sht2018001');
INSERT INTO `emp_paiban` VALUES ('emp2018007', 'sht2018001');

-- ----------------------------
-- Table structure for `oa_attendance`
-- ----------------------------
DROP TABLE IF EXISTS `oa_attendance`;
CREATE TABLE `oa_attendance` (
  `att_id` varchar(20) NOT NULL COMMENT '编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `att_date` date DEFAULT NULL COMMENT '考勤日期',
  `att_signin` datetime DEFAULT NULL COMMENT '签到时间',
  `att_signout` datetime DEFAULT NULL COMMENT '签离时间',
  `att_state` int(11) DEFAULT NULL COMMENT '签到状态',
  PRIMARY KEY (`att_id`) USING BTREE,
  KEY `FK_atten_emp` (`emp_id`) USING BTREE,
  CONSTRAINT `FK_atten_emp` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考勤表';

-- ----------------------------
-- Records of oa_attendance
-- ----------------------------
INSERT INTO `oa_attendance` VALUES ('att2018001', 'emp2018001', '2018-01-08', '2018-01-08 08:07:14', '2018-01-08 17:07:36', '1');

-- ----------------------------
-- Table structure for `oa_balance`
-- ----------------------------
DROP TABLE IF EXISTS `oa_balance`;
CREATE TABLE `oa_balance` (
  `bal_id` varchar(20) NOT NULL COMMENT '加班结余编号',
  `baler_id` varchar(20) DEFAULT NULL COMMENT '加班人',
  `caozuo_id` varchar(20) DEFAULT NULL COMMENT '操作人',
  `bal_number` int(11) DEFAULT NULL COMMENT '加班结余天数',
  `bal_year` varchar(20) DEFAULT NULL COMMENT '加班结余年份',
  `bal_reason` varchar(100) DEFAULT NULL COMMENT '变更原因',
  `bal_date` date DEFAULT NULL COMMENT '操作日期',
  PRIMARY KEY (`bal_id`) USING BTREE,
  KEY `FK_caozuo` (`caozuo_id`) USING BTREE,
  KEY `FK_emper` (`baler_id`) USING BTREE,
  CONSTRAINT `FK_caozuo` FOREIGN KEY (`caozuo_id`) REFERENCES `oa_emp` (`emp_id`),
  CONSTRAINT `FK_emper` FOREIGN KEY (`baler_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='加班结余表';

-- ----------------------------
-- Records of oa_balance
-- ----------------------------
INSERT INTO `oa_balance` VALUES ('bal2018001', 'emp2018001', 'emp2018002', '1', '2017', 'aaaaaaaaaaa', '2018-01-08');

-- ----------------------------
-- Table structure for `oa_card`
-- ----------------------------
DROP TABLE IF EXISTS `oa_card`;
CREATE TABLE `oa_card` (
  `card_id` varchar(20) NOT NULL COMMENT '证件编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `card_org` varchar(20) DEFAULT NULL COMMENT '发证机构',
  `card_takedate` date DEFAULT NULL COMMENT '取证日期',
  `card_workdate` date DEFAULT NULL COMMENT '生效日期',
  `card_overdate` date DEFAULT NULL COMMENT '到期日期',
  `card_rewark` varchar(100) DEFAULT NULL COMMENT '证件备注',
  `card_enc` varchar(50) DEFAULT NULL COMMENT '证件附件',
  PRIMARY KEY (`card_id`) USING BTREE,
  KEY `FK_emp_card` (`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_card` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='证件表';

-- ----------------------------
-- Records of oa_card
-- ----------------------------
INSERT INTO `oa_card` VALUES ('card2018001', 'emp2018001', '中科韬睿', '2018-01-08', '2018-01-08', '2019-01-08', null, null);

-- ----------------------------
-- Table structure for `oa_cardborrow`
-- ----------------------------
DROP TABLE IF EXISTS `oa_cardborrow`;
CREATE TABLE `oa_cardborrow` (
  `cb_id` varchar(20) NOT NULL COMMENT '借阅编号',
  `card_id` varchar(20) DEFAULT NULL COMMENT '证件编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `cb_bdate` date DEFAULT NULL COMMENT '借阅时间',
  `cb_rdate` date DEFAULT NULL COMMENT '归还时间',
  `cb_reason` varchar(100) DEFAULT NULL COMMENT '借阅事由',
  PRIMARY KEY (`cb_id`) USING BTREE,
  KEY `FK_bo_emp` (`emp_id`) USING BTREE,
  KEY `FK_card_bo` (`card_id`) USING BTREE,
  CONSTRAINT `FK_bo_emp` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`),
  CONSTRAINT `FK_card_bo` FOREIGN KEY (`card_id`) REFERENCES `oa_card` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='证件借阅表';

-- ----------------------------
-- Records of oa_cardborrow
-- ----------------------------
INSERT INTO `oa_cardborrow` VALUES ('cb2018001', 'card2018001', 'emp2018002', '2018-01-10', '2018-05-03', '公司需要');

-- ----------------------------
-- Table structure for `oa_contract`
-- ----------------------------
DROP TABLE IF EXISTS `oa_contract`;
CREATE TABLE `oa_contract` (
  `con_id` varchar(20) NOT NULL COMMENT '合同编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `con_type` int(11) DEFAULT NULL,
  `con_term` int(11) DEFAULT NULL COMMENT '固定期限',
  `con_signtime` int(11) DEFAULT NULL COMMENT '签约次数',
  `con_signdate` date DEFAULT NULL COMMENT '签约日期',
  `con_begindate` date DEFAULT NULL COMMENT '合同开始日期',
  `con_tryend` date DEFAULT NULL COMMENT '试用到期',
  `con_enddate` date DEFAULT NULL COMMENT '合同结束日期',
  `con_stopdate` date DEFAULT NULL COMMENT '提前终止日期',
  `con_state` int(11) DEFAULT NULL COMMENT '合同状态',
  `con_remark` varchar(100) DEFAULT NULL COMMENT '合同备注',
  `con_enc` varchar(50) DEFAULT NULL COMMENT '合同附件',
  PRIMARY KEY (`con_id`) USING BTREE,
  KEY `FK_emp_contract` (`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_contract` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='合同表';

-- ----------------------------
-- Records of oa_contract
-- ----------------------------
INSERT INTO `oa_contract` VALUES ('con2018001', 'emp2018001', '1', null, '1', '2018-01-08', '2018-01-09', '2018-01-31', null, null, '1', null, null);
INSERT INTO `oa_contract` VALUES ('con2018002', 'emp2018002', '1', null, '1', '2018-01-08', '2018-01-09', '2018-01-23', null, null, '1', null, null);
INSERT INTO `oa_contract` VALUES ('con2018003', 'emp2018003', '0', null, '1', '2017-12-30', '2018-01-01', '2018-01-23', '2020-01-01', null, '1', null, null);
INSERT INTO `oa_contract` VALUES ('con2018004', 'emp2018004', '1', null, '1', '2018-01-02', '2018-01-03', '2018-01-31', null, '2018-01-08', '0', null, null);

-- ----------------------------
-- Table structure for `oa_dept`
-- ----------------------------
DROP TABLE IF EXISTS `oa_dept`;
CREATE TABLE `oa_dept` (
  `dept_id` varchar(20) NOT NULL COMMENT '部门编号',
  `dept_name` varchar(20) DEFAULT NULL COMMENT '部门名称',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of oa_dept
-- ----------------------------
INSERT INTO `oa_dept` VALUES ('dept001', '人事部');
INSERT INTO `oa_dept` VALUES ('dept002', '采购部');
INSERT INTO `oa_dept` VALUES ('dept003', '技术部');
INSERT INTO `oa_dept` VALUES ('dept004', '财务部');

-- ----------------------------
-- Table structure for `oa_dismission`
-- ----------------------------
DROP TABLE IF EXISTS `oa_dismission`;
CREATE TABLE `oa_dismission` (
  `dis_id` varchar(20) NOT NULL COMMENT '离职编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `dis_applydate` date DEFAULT NULL COMMENT '离职申请日期',
  `dis_inworkdate` date DEFAULT NULL COMMENT '员工入职日期',
  `dis_date` date DEFAULT NULL COMMENT '离职表离职日期',
  `dis_type` int(11) DEFAULT NULL COMMENT '离职类型',
  `dis_reason` varchar(100) DEFAULT NULL COMMENT '离职原因',
  `dis_remark` varchar(100) DEFAULT NULL COMMENT '离职备注',
  `dis_enc` varchar(50) DEFAULT NULL COMMENT '离职附件',
  `dis_leaderch` int(11) DEFAULT NULL COMMENT '领导离职审批',
  `dis_emch` int(11) DEFAULT NULL COMMENT '人事部离职审批',
  `dis_state` int(11) DEFAULT NULL COMMENT '离职状态',
  PRIMARY KEY (`dis_id`) USING BTREE,
  KEY `FK_emp_leave` (`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_leave` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='离职表';

-- ----------------------------
-- Records of oa_dismission
-- ----------------------------
INSERT INTO `oa_dismission` VALUES ('dis2018001', 'emp2018004', '2018-01-08', '2018-01-03', '2018-01-08', '1', '过度劳累，感觉身体被掏空', null, null, '1', '1', '1');

-- ----------------------------
-- Table structure for `oa_emp`
-- ----------------------------
DROP TABLE IF EXISTS `oa_emp`;
CREATE TABLE `oa_emp` (
  `emp_id` varchar(20) NOT NULL COMMENT '工号',
  `job_id` varchar(20) DEFAULT NULL COMMENT '职位编号',
  `dept_id` varchar(20) DEFAULT NULL COMMENT '部门编号',
  `emp_name` varchar(20) DEFAULT NULL COMMENT '申请人姓名',
  `emp_mgr` varchar(20) DEFAULT NULL COMMENT '直接上级工号',
  `emp_sex` int(11) DEFAULT NULL COMMENT '性别',
  `emp_birth` date DEFAULT NULL COMMENT '生日',
  `emp_phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `emp_tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `emp_email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `emp_qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `emp_address` varchar(20) DEFAULT NULL COMMENT '地址',
  `emp_photo` varchar(50) DEFAULT NULL COMMENT '图片',
  `emp_fileid` varchar(20) DEFAULT NULL COMMENT '档案编号',
  `emp_workstate` int(11) DEFAULT NULL COMMENT '在职状态',
  `emp_type` int(11) DEFAULT NULL COMMENT '员工类型',
  `emp_cardid` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `emp_native` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `emp_nation` varchar(20) DEFAULT NULL COMMENT '民族',
  `emp_oldname` varchar(20) DEFAULT NULL COMMENT '曾用名',
  `emp_nationality` varchar(20) DEFAULT NULL COMMENT '国籍',
  `emp_entrydate` date DEFAULT NULL COMMENT '入职日期',
  `emp_formaldate` date DEFAULT NULL COMMENT '转正日期',
  `emp_dismission` date DEFAULT NULL COMMENT '离职日期',
  `emp_station` varchar(20) DEFAULT NULL COMMENT '岗位',
  `emp_maxdegree` varchar(20) DEFAULT NULL COMMENT '最高学位',
  `emp_maxeducation` varchar(20) DEFAULT NULL COMMENT '最高学历',
  `emp_school` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `emp_major` varchar(20) DEFAULT NULL COMMENT '所学专业',
  `emp_graduation` date DEFAULT NULL COMMENT '毕业日期',
  `emp_like` varchar(50) DEFAULT NULL COMMENT '业余爱好',
  `emp_healthy` varchar(50) DEFAULT NULL COMMENT '健康状况',
  `emp_high` varchar(20) DEFAULT NULL COMMENT '身高(cm)',
  `emp_weight` varchar(20) DEFAULT NULL COMMENT '体重(kg)',
  `emp_bank` varchar(50) DEFAULT NULL COMMENT '银行',
  `emp_bankid` varchar(20) DEFAULT NULL COMMENT '银行帐号',
  `emp_eme` varchar(20) DEFAULT NULL COMMENT '紧急联系人',
  `emp_emetel` varchar(20) DEFAULT NULL COMMENT '紧急联系人号码',
  `emp_remark` varchar(100) DEFAULT NULL COMMENT '员工备注',
  PRIMARY KEY (`emp_id`) USING BTREE,
  KEY `FK_dept_emp` (`dept_id`) USING BTREE,
  KEY `FK_emp_job` (`job_id`) USING BTREE,
  CONSTRAINT `FK_dept_emp` FOREIGN KEY (`dept_id`) REFERENCES `oa_dept` (`dept_id`),
  CONSTRAINT `FK_emp_job` FOREIGN KEY (`job_id`) REFERENCES `oa_job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='员工表';

-- ----------------------------
-- Records of oa_emp
-- ----------------------------
INSERT INTO `oa_emp` VALUES ('emp2018001', 'job004', 'dept004', '樊文涛', null, '1', '1996-03-26', '15707338407', null, null, null, null, null, null, '1', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `oa_emp` VALUES ('emp2018002', 'job002', 'dept004', '黄琼', null, '0', '2018-01-08', '1234567890', null, null, null, null, null, null, '1', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `oa_emp` VALUES ('emp2018003', 'job003', 'dept002', '曾梦园', null, '1', '2014-08-27', '1876665177', null, null, null, null, null, null, '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `oa_emp` VALUES ('emp2018004', 'job002', 'dept001', '何立贵', null, '1', '2011-06-21', '1550093945', null, null, null, null, null, null, '0', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `oa_emp` VALUES ('emp2018005', 'job002', 'dept001', '瞿红', null, '0', '2010-06-29', '1310887788', null, null, null, null, null, null, '1', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `oa_emp` VALUES ('emp2018006', 'job003', 'dept001', '何志康', null, '1', '2009-02-17', '1098877767', null, null, null, null, null, null, '1', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `oa_emp` VALUES ('emp2018007', 'job004', 'dept001', '岳婷', null, '0', '2018-01-01', '1517890877', null, null, null, null, null, null, '0', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `oa_examproject`
-- ----------------------------
DROP TABLE IF EXISTS `oa_examproject`;
CREATE TABLE `oa_examproject` (
  `ep_id` varchar(20) NOT NULL COMMENT '考核项目id',
  `pt_id` varchar(20) DEFAULT NULL COMMENT '绩效模板id',
  `ep_name` varchar(20) DEFAULT NULL COMMENT '考核项目名称',
  `ep_maxscore` int(11) DEFAULT NULL COMMENT '项目最高分',
  `ep_minscore` int(11) DEFAULT NULL COMMENT '项目最低分',
  `ep_stand` int(11) DEFAULT NULL COMMENT '标准分',
  `ep_scorerule` varchar(100) DEFAULT NULL COMMENT '评分细则',
  `ep_remark` varchar(100) DEFAULT NULL COMMENT '项目备注',
  `ep_state` int(11) DEFAULT NULL COMMENT '项目状态',
  PRIMARY KEY (`ep_id`) USING BTREE,
  KEY `FK_temp_pro` (`pt_id`) USING BTREE,
  CONSTRAINT `FK_temp_pro` FOREIGN KEY (`pt_id`) REFERENCES `oa_pertemp` (`pt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考核项目表';

-- ----------------------------
-- Records of oa_examproject
-- ----------------------------
INSERT INTO `oa_examproject` VALUES ('ep001', 'pt001', '工作技能', '50', '0', '40', '独立高效地开展工作，学习能力强，善于发现问题', null, '1');
INSERT INTO `oa_examproject` VALUES ('ep002', 'pt001', '工作内容', '50', '0', '40', '工作量和难度	', null, '1');
INSERT INTO `oa_examproject` VALUES ('ep003', 'pt002', '认同感', '100', '0', '90', '认同公司，忠于公司，热心本质工作，遵守公司规章制度', null, '1');
INSERT INTO `oa_examproject` VALUES ('ep004', 'pt003', '工作实效', '100', '0', '90', '作完成的及时性', null, '1');
INSERT INTO `oa_examproject` VALUES ('ep005', 'pt004', '协作能力', '100', '0', '80', '独立高效地开展工作，学习能力强，善于发现问题', null, '1');

-- ----------------------------
-- Table structure for `oa_examtask`
-- ----------------------------
DROP TABLE IF EXISTS `oa_examtask`;
CREATE TABLE `oa_examtask` (
  `et_id` varchar(20) NOT NULL COMMENT '考核任务id',
  `pt_id` varchar(20) DEFAULT NULL COMMENT '绩效模板id',
  `et_name` varchar(20) DEFAULT NULL COMMENT '考核名称',
  `et_year` int(11) DEFAULT NULL COMMENT '考核年份',
  `et_issue` int(11) DEFAULT NULL COMMENT '考核期次',
  `et_remark` varchar(100) DEFAULT NULL COMMENT '考核任务备注',
  `et_startdate` date DEFAULT NULL COMMENT '评分开始时间',
  `et_enddate` date DEFAULT NULL COMMENT '评分结束时间',
  `et_state` int(11) DEFAULT NULL COMMENT '状态',
  `et_fb_state` varchar(20) DEFAULT NULL COMMENT '发布状态',
  PRIMARY KEY (`et_id`) USING BTREE,
  KEY `FK_temp_task` (`pt_id`) USING BTREE,
  CONSTRAINT `FK_temp_task` FOREIGN KEY (`pt_id`) REFERENCES `oa_pertemp` (`pt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='考核任务表';

-- ----------------------------
-- Records of oa_examtask
-- ----------------------------
INSERT INTO `oa_examtask` VALUES ('et001', 'pt001', '2018年员工绩效考核', '2018', '2', null, '2018-01-09', '2018-01-10', '1', '已发布');
INSERT INTO `oa_examtask` VALUES ('et002', 'pt001', '考核1', '2018', '1', null, '2018-01-09', '2018-01-10', '1', '已发布');
INSERT INTO `oa_examtask` VALUES ('et003', 'pt002', '考核2', '2018', '1', null, '2018-01-09', '2018-01-15', '1', '已发布');
INSERT INTO `oa_examtask` VALUES ('et004', 'pt003', '考核4', '2018', '1', null, '2018-01-09', '2018-01-12', '1', '已完成');
INSERT INTO `oa_examtask` VALUES ('et005', 'pt004', '考核5', '2018', '3', null, '2018-01-09', '2018-01-10', '1', '进行中');

-- ----------------------------
-- Table structure for `oa_flow`
-- ----------------------------
DROP TABLE IF EXISTS `oa_flow`;
CREATE TABLE `oa_flow` (
  `flow_id` varchar(20) NOT NULL COMMENT '流程编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `flow_name` varchar(20) DEFAULT NULL COMMENT '流程名称',
  `flow_title` varchar(50) DEFAULT NULL COMMENT '标题',
  `flow_date` date DEFAULT NULL COMMENT '发起时间',
  `flow_state` int(11) DEFAULT NULL COMMENT '流程状态',
  `flow_step` varchar(20) DEFAULT NULL COMMENT '当前步骤',
  `flow_startdate` date DEFAULT NULL COMMENT '流程开始时间',
  `flow_enddate` date DEFAULT NULL COMMENT '流程结束时间',
  PRIMARY KEY (`flow_id`) USING BTREE,
  KEY `FK_emp_flow` (`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_flow` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程表';

-- ----------------------------
-- Records of oa_flow
-- ----------------------------

-- ----------------------------
-- Table structure for `oa_formal`
-- ----------------------------
DROP TABLE IF EXISTS `oa_formal`;
CREATE TABLE `oa_formal` (
  `for_id` varchar(20) NOT NULL COMMENT '转正编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `for_applydate` date DEFAULT NULL COMMENT '申请日期',
  `for_inworkdate` date DEFAULT NULL COMMENT '转正表入职日期',
  `for_tryend` date DEFAULT NULL COMMENT '试用到期日',
  `for_date` date DEFAULT NULL COMMENT '转正表转正日期',
  `for_leaderch` int(11) DEFAULT NULL COMMENT '领导审批',
  `for_emch` int(11) DEFAULT NULL COMMENT '人事部审批',
  `for_state` int(11) DEFAULT NULL COMMENT '转正状态',
  `for_remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`for_id`) USING BTREE,
  KEY `FK_emp_formal` (`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_formal` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='转正表';

-- ----------------------------
-- Records of oa_formal
-- ----------------------------

-- ----------------------------
-- Table structure for `oa_job`
-- ----------------------------
DROP TABLE IF EXISTS `oa_job`;
CREATE TABLE `oa_job` (
  `job_id` varchar(20) NOT NULL COMMENT '职位编号',
  `job_name` varchar(20) DEFAULT NULL COMMENT '职位名称',
  `job_superior` varchar(20) DEFAULT NULL COMMENT '上级职位',
  `job_level` varchar(20) DEFAULT NULL COMMENT '职位级别',
  `job_duty` varchar(20) DEFAULT NULL COMMENT '岗位职责',
  `job_require` varchar(20) DEFAULT NULL COMMENT '任职要求',
  `job_dec` varchar(50) DEFAULT NULL COMMENT '职位描述',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='职位表';

-- ----------------------------
-- Records of oa_job
-- ----------------------------
INSERT INTO `oa_job` VALUES ('job001', '总经理', null, '3', null, null, null);
INSERT INTO `oa_job` VALUES ('job002', '部门经理', '总经理', '2', null, null, null);
INSERT INTO `oa_job` VALUES ('job003', '出纳', '部门经理', '1', null, null, null);
INSERT INTO `oa_job` VALUES ('job004', '会计', '部门经理', '1', null, null, null);

-- ----------------------------
-- Table structure for `oa_leave`
-- ----------------------------
DROP TABLE IF EXISTS `oa_leave`;
CREATE TABLE `oa_leave` (
  `lea_id` varchar(20) NOT NULL COMMENT '请假编号',
  `vac_id` varchar(20) DEFAULT NULL COMMENT '假期编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `lea_name` varchar(20) DEFAULT NULL COMMENT '请假人姓名',
  `lea_applydate` date DEFAULT NULL COMMENT '申请时间',
  `lea_startdate` date DEFAULT NULL COMMENT '开始时间',
  `lea_enddate` date DEFAULT NULL COMMENT '结束时间',
  `lea_day` int(11) DEFAULT NULL COMMENT '请假天数',
  `lea_content` varchar(100) DEFAULT NULL COMMENT '请假事由',
  `lea_deptch` int(11) DEFAULT NULL COMMENT '部门审批',
  `lea_managech` int(11) DEFAULT NULL COMMENT '总经理审批',
  `lea_emch` int(11) DEFAULT NULL COMMENT '人事归档',
  `lea_state` int(11) DEFAULT NULL COMMENT '请假状态',
  PRIMARY KEY (`lea_id`) USING BTREE,
  KEY `FK_emp_levac` (`emp_id`) USING BTREE,
  KEY `FK_vac_type` (`vac_id`) USING BTREE,
  CONSTRAINT `FK_emp_levac` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`),
  CONSTRAINT `FK_vac_type` FOREIGN KEY (`vac_id`) REFERENCES `oa_vacation` (`vac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='请假表';

-- ----------------------------
-- Records of oa_leave
-- ----------------------------

-- ----------------------------
-- Table structure for `oa_level`
-- ----------------------------
DROP TABLE IF EXISTS `oa_level`;
CREATE TABLE `oa_level` (
  `le_id` varchar(20) NOT NULL COMMENT '等级标准id',
  `le_name` varchar(20) DEFAULT NULL COMMENT '等级标准名称',
  `le_minscore` int(11) DEFAULT NULL COMMENT '标准最低分',
  `le_maxscore` int(11) DEFAULT NULL COMMENT '标准最高分',
  `le_state` int(11) DEFAULT NULL COMMENT '标准状态',
  `le_sx` int(11) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`le_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_level
-- ----------------------------
INSERT INTO `oa_level` VALUES ('le001', '优秀', '90', '100', '1', '1');
INSERT INTO `oa_level` VALUES ('le002', '良好', '80', '89', '1', '2');
INSERT INTO `oa_level` VALUES ('le003', '合格', '60', '79', '1', '3');
INSERT INTO `oa_level` VALUES ('le004', '不合格', '0', '59', '1', '4');

-- ----------------------------
-- Table structure for `oa_menu`
-- ----------------------------
DROP TABLE IF EXISTS `oa_menu`;
CREATE TABLE `oa_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `meu_name` varchar(10) DEFAULT NULL COMMENT '菜单名称',
  `menu_father` int(11) DEFAULT NULL COMMENT '上级菜单',
  `menu_link` varchar(30) DEFAULT NULL COMMENT '菜单连接',
  `menu_img` varchar(50) DEFAULT NULL COMMENT '菜单图片',
  `menu_isvisible` int(11) DEFAULT NULL COMMENT '是否隐藏',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限表';

-- ----------------------------
-- Records of oa_menu
-- ----------------------------
INSERT INTO `oa_menu` VALUES ('37', '个人', '0', '/gr', null, '0');
INSERT INTO `oa_menu` VALUES ('38', '系统', '0', '/sys', null, '0');
INSERT INTO `oa_menu` VALUES ('39', '流程', '0', '/lc', null, '0');
INSERT INTO `oa_menu` VALUES ('40', '人事', '0', '/rs', null, '0');
INSERT INTO `oa_menu` VALUES ('42', '我的日程', '37', null, null, '0');
INSERT INTO `oa_menu` VALUES ('43', '我的去向', '37', null, null, '0');
INSERT INTO `oa_menu` VALUES ('44', '菜单设置', '38', null, null, '0');
INSERT INTO `oa_menu` VALUES ('45', '角色设置', '38', null, null, '0');
INSERT INTO `oa_menu` VALUES ('46', '发起流程', '39', null, null, '0');
INSERT INTO `oa_menu` VALUES ('47', '代办流程', '39', null, null, '0');
INSERT INTO `oa_menu` VALUES ('48', '人事管理', '40', null, null, '0');
INSERT INTO `oa_menu` VALUES ('49', '考核管理', '40', null, null, '0');
INSERT INTO `oa_menu` VALUES ('50', '首页', '0', '/sy', null, '0');
INSERT INTO `oa_menu` VALUES ('51', '小日程', '42', '/xrc', null, '0');

-- ----------------------------
-- Table structure for `oa_move`
-- ----------------------------
DROP TABLE IF EXISTS `oa_move`;
CREATE TABLE `oa_move` (
  `move_id` varchar(20) NOT NULL COMMENT '调动编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '调动人工号',
  `beforjob` varchar(20) DEFAULT NULL,
  `befordept` varchar(20) DEFAULT NULL,
  `job_id` varchar(20) DEFAULT NULL COMMENT '调动后职位编号',
  `dept_id` varchar(20) DEFAULT NULL COMMENT '调动后部门编号',
  `move_type` int(11) DEFAULT NULL COMMENT '调动类型',
  `move_date` date DEFAULT NULL COMMENT '调动日期',
  `move_effdate` date DEFAULT NULL COMMENT '调动生效日期',
  `move_remark` varchar(100) DEFAULT NULL COMMENT '调动备注',
  `move_enc` varchar(50) DEFAULT NULL COMMENT '调动附件',
  `move_oldch` int(11) DEFAULT NULL COMMENT '前领导审批',
  `move_newch` int(11) DEFAULT NULL COMMENT '后领导审批',
  `move_emch` int(11) DEFAULT NULL COMMENT '调动人事审批',
  `move_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`move_id`) USING BTREE,
  KEY `FK_emp_move` (`emp_id`) USING BTREE,
  KEY `FK_move_dept` (`dept_id`) USING BTREE,
  KEY `FK_move_job` (`job_id`) USING BTREE,
  CONSTRAINT `FK_emp_move` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`),
  CONSTRAINT `FK_move_dept` FOREIGN KEY (`dept_id`) REFERENCES `oa_dept` (`dept_id`),
  CONSTRAINT `FK_move_job` FOREIGN KEY (`job_id`) REFERENCES `oa_job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='人事调动表';

-- ----------------------------
-- Records of oa_move
-- ----------------------------
INSERT INTO `oa_move` VALUES ('move2018001', 'emp2018001', '部门经理', '技术部', 'job004', 'dept004', '3', '2018-01-10', '2018-01-10', null, null, '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `oa_overtimecode`
-- ----------------------------
DROP TABLE IF EXISTS `oa_overtimecode`;
CREATE TABLE `oa_overtimecode` (
  `type_id` varchar(20) NOT NULL DEFAULT '' COMMENT '加班类型编号',
  `emp_id` varchar(20) NOT NULL DEFAULT '' COMMENT '工号',
  `code_long` int(11) DEFAULT NULL COMMENT '加班时长',
  `code_date` date DEFAULT NULL COMMENT '加班日期',
  PRIMARY KEY (`type_id`,`emp_id`) USING BTREE,
  KEY `FK_emp_jia` (`emp_id`) USING BTREE,
  KEY `FK_type_add` (`type_id`) USING BTREE,
  CONSTRAINT `FK_emp_jia` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`),
  CONSTRAINT `FK_type_add` FOREIGN KEY (`type_id`) REFERENCES `oa_overtimetype` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='员工加班记录表';

-- ----------------------------
-- Records of oa_overtimecode
-- ----------------------------
INSERT INTO `oa_overtimecode` VALUES ('type2018001', 'emp2018001', '2', '2018-01-08');

-- ----------------------------
-- Table structure for `oa_overtimetype`
-- ----------------------------
DROP TABLE IF EXISTS `oa_overtimetype`;
CREATE TABLE `oa_overtimetype` (
  `type_id` varchar(20) NOT NULL COMMENT '加班类型编号',
  `type_name` varchar(20) DEFAULT NULL COMMENT '加班类型名称',
  `type_price` int(11) DEFAULT NULL COMMENT '每小时单价',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='加班类型表';

-- ----------------------------
-- Records of oa_overtimetype
-- ----------------------------
INSERT INTO `oa_overtimetype` VALUES ('type2018001', '节假日加班', '40');
INSERT INTO `oa_overtimetype` VALUES ('type2018002', '周末加班', '30');
INSERT INTO `oa_overtimetype` VALUES ('type2018003', '平日加班', '20');

-- ----------------------------
-- Table structure for `oa_password`
-- ----------------------------
DROP TABLE IF EXISTS `oa_password`;
CREATE TABLE `oa_password` (
  `pa_id` varchar(20) NOT NULL COMMENT '密码编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `pa_pass` varchar(20) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`pa_id`) USING BTREE,
  KEY `FK_pass_emp` (`emp_id`) USING BTREE,
  CONSTRAINT `FK_pass_emp` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='密码表';

-- ----------------------------
-- Records of oa_password
-- ----------------------------
INSERT INTO `oa_password` VALUES ('1', 'emp2018001', '123456');
INSERT INTO `oa_password` VALUES ('2', 'emp2018002', '123456');
INSERT INTO `oa_password` VALUES ('3', 'emp2018003', '123456');
INSERT INTO `oa_password` VALUES ('4', 'emp2018004', '123456');

-- ----------------------------
-- Table structure for `oa_paystandard`
-- ----------------------------
DROP TABLE IF EXISTS `oa_paystandard`;
CREATE TABLE `oa_paystandard` (
  `pay_standardid` varchar(10) NOT NULL COMMENT '薪资标准编号',
  `pay_standardtype` varchar(10) DEFAULT NULL COMMENT '薪资标准类型',
  PRIMARY KEY (`pay_standardid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='薪资标准表';

-- ----------------------------
-- Records of oa_paystandard
-- ----------------------------

-- ----------------------------
-- Table structure for `oa_paytable`
-- ----------------------------
DROP TABLE IF EXISTS `oa_paytable`;
CREATE TABLE `oa_paytable` (
  `pay_id` varchar(20) NOT NULL COMMENT '薪资发放编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `pay_money` decimal(20,2) DEFAULT NULL COMMENT '薪资发放金额',
  `pay_senddate` date DEFAULT NULL COMMENT '薪资发放时间',
  `pay_remark` varchar(100) DEFAULT NULL COMMENT '备注2',
  PRIMARY KEY (`pay_id`) USING BTREE,
  KEY `FK_emp_send` (`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_send` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='薪资发放表';

-- ----------------------------
-- Records of oa_paytable
-- ----------------------------

-- ----------------------------
-- Table structure for `oa_paytemplate`
-- ----------------------------
DROP TABLE IF EXISTS `oa_paytemplate`;
CREATE TABLE `oa_paytemplate` (
  `pay_templateid` varchar(20) NOT NULL COMMENT '薪资模版编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `oa__emp_id` varchar(20) DEFAULT NULL COMMENT '员工表_工号',
  `oa__emp_id2` varchar(20) DEFAULT NULL COMMENT '员工表_工号2',
  `pay_templatedate` date DEFAULT NULL COMMENT '薪资模版生成日期',
  PRIMARY KEY (`pay_templateid`) USING BTREE,
  KEY `FK_creater` (`oa__emp_id`) USING BTREE,
  KEY `FK_examer` (`oa__emp_id2`) USING BTREE,
  KEY `FK_sender` (`emp_id`) USING BTREE,
  CONSTRAINT `FK_creater` FOREIGN KEY (`oa__emp_id`) REFERENCES `oa_emp` (`emp_id`),
  CONSTRAINT `FK_examer` FOREIGN KEY (`oa__emp_id2`) REFERENCES `oa_emp` (`emp_id`),
  CONSTRAINT `FK_sender` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='薪资模版表';

-- ----------------------------
-- Records of oa_paytemplate
-- ----------------------------

-- ----------------------------
-- Table structure for `oa_personalbook`
-- ----------------------------
DROP TABLE IF EXISTS `oa_personalbook`;
CREATE TABLE `oa_personalbook` (
  `per_id` varchar(20) NOT NULL COMMENT '通讯人编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `group_id` varchar(20) DEFAULT NULL,
  `per_name` varchar(20) DEFAULT NULL COMMENT '通讯人姓名',
  `per_job` varchar(20) DEFAULT NULL COMMENT '通讯人职务',
  `per_tel` varchar(20) DEFAULT NULL COMMENT '通讯人电话',
  `per_phone` varchar(20) DEFAULT NULL COMMENT '通讯人手机',
  `per_residencetel` varchar(20) DEFAULT NULL COMMENT '通讯人住址电话',
  `per_fax` varchar(20) DEFAULT NULL COMMENT '通讯人传真',
  `per_emial` varchar(20) DEFAULT NULL COMMENT '通讯人邮箱',
  `per_company` varchar(50) DEFAULT NULL COMMENT '通讯人单位',
  PRIMARY KEY (`per_id`) USING BTREE,
  KEY `FK_per_emp` (`emp_id`) USING BTREE,
  KEY `FK_per_group` (`group_id`),
  CONSTRAINT `FK_per_emp` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`),
  CONSTRAINT `FK_per_group` FOREIGN KEY (`group_id`) REFERENCES `oa_telgroup` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='个人通讯录表';

-- ----------------------------
-- Records of oa_personalbook
-- ----------------------------
INSERT INTO `oa_personalbook` VALUES ('1', 'emp2018001', '1', '朱多福', '', '7302945', '15115383287', '', '', '619390153@qq.com', '中科韬睿');
INSERT INTO `oa_personalbook` VALUES ('2', 'emp2018001', '2', '李小璐', '', '8865243', '15115383286', '', '', '619390153@qq.com', '中科韬睿');
INSERT INTO `oa_personalbook` VALUES ('3', 'emp2018002', '3', '大闸蟹', '', '6325514', '15115383289', '', '', '619390153@qq.com', '湖南铁道');

-- ----------------------------
-- Table structure for `oa_pertemp`
-- ----------------------------
DROP TABLE IF EXISTS `oa_pertemp`;
CREATE TABLE `oa_pertemp` (
  `pt_id` varchar(20) NOT NULL COMMENT '绩效模板id',
  `le_id` varchar(20) DEFAULT NULL COMMENT '等级标准id',
  `job_id` varchar(20) DEFAULT NULL COMMENT '职位编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `pt_name` varchar(20) DEFAULT NULL COMMENT '模板名称',
  `pt_type` int(11) DEFAULT NULL COMMENT '考核类型',
  `pt_score` int(11) DEFAULT NULL COMMENT '总分',
  `pt_remark` varchar(100) DEFAULT NULL COMMENT '绩效模板备注',
  `pt_creater` varchar(20) DEFAULT NULL COMMENT '创建人',
  `pt_crdate` date DEFAULT NULL COMMENT '创建日期',
  `pt_state` int(11) DEFAULT NULL COMMENT '绩效模板状态',
  PRIMARY KEY (`pt_id`) USING BTREE,
  KEY `FK_emp_temp` (`emp_id`) USING BTREE,
  KEY `FK_job_temp` (`job_id`) USING BTREE,
  KEY `FK_le_temp` (`le_id`),
  CONSTRAINT `FK_emp_temp` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`),
  CONSTRAINT `FK_job_temp` FOREIGN KEY (`job_id`) REFERENCES `oa_job` (`job_id`),
  CONSTRAINT `FK_le_temp` FOREIGN KEY (`le_id`) REFERENCES `oa_level` (`le_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='绩效模板表';

-- ----------------------------
-- Records of oa_pertemp
-- ----------------------------
INSERT INTO `oa_pertemp` VALUES ('pt001', 'le001', 'job002', 'emp2018002', '员工绩效1', '0', '100', null, '黄琼', '2018-01-09', '1');
INSERT INTO `oa_pertemp` VALUES ('pt002', 'le002', 'job002', 'emp2018002', '员工绩效2', '0', '100', null, '黄琼', '2018-01-09', '1');
INSERT INTO `oa_pertemp` VALUES ('pt003', 'le003', 'job002', 'emp2018002', '员工绩效3', '1', '100', null, '黄琼', '2018-01-10', '1');
INSERT INTO `oa_pertemp` VALUES ('pt004', 'le004', 'job002', 'emp2018002', '员工绩效4', '2', '100', null, '黄琼', '2018-01-11', '1');
INSERT INTO `oa_pertemp` VALUES ('pt005', 'le001', 'job002', 'emp2018002', '员工绩效5', '0', '100', null, '黄琼', '2018-01-10', '1');

-- ----------------------------
-- Table structure for `oa_rap`
-- ----------------------------
DROP TABLE IF EXISTS `oa_rap`;
CREATE TABLE `oa_rap` (
  `rap_id` varchar(20) NOT NULL COMMENT '奖惩编号',
  `apply_id` varchar(20) DEFAULT NULL COMMENT '申请人',
  `raper_id` varchar(20) DEFAULT NULL COMMENT '奖惩人',
  `rap_type` int(11) DEFAULT NULL COMMENT '奖惩类型',
  `rap_pro` varchar(20) DEFAULT NULL COMMENT '奖惩项目',
  `rap_date` date DEFAULT NULL COMMENT '奖惩日期',
  `rap_money` int(11) DEFAULT NULL COMMENT '奖惩金额',
  `rap_content` varchar(100) DEFAULT NULL COMMENT '奖惩内容',
  `rap_dept` int(11) DEFAULT NULL COMMENT '奖惩部门审批',
  `rap_manage` int(11) DEFAULT NULL COMMENT '奖惩总经理审批',
  `rap_emch` int(11) DEFAULT NULL COMMENT '人事审批',
  `rap_state` int(11) DEFAULT NULL COMMENT '奖惩状态',
  PRIMARY KEY (`rap_id`) USING BTREE,
  KEY `FK_apply` (`raper_id`) USING BTREE,
  KEY `FK_emp_rap` (`apply_id`) USING BTREE,
  CONSTRAINT `FK_apply` FOREIGN KEY (`raper_id`) REFERENCES `oa_emp` (`emp_id`),
  CONSTRAINT `FK_emp_rap` FOREIGN KEY (`apply_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='奖惩表';

-- ----------------------------
-- Records of oa_rap
-- ----------------------------
INSERT INTO `oa_rap` VALUES ('rap2018001', 'emp2018002', 'emp2018001', '1', null, '2018-01-10', '1000', '工作认真', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `oa_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `oa_schedule`;
CREATE TABLE `oa_schedule` (
  `sch_id` varchar(20) NOT NULL COMMENT '日程编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `sch_date` date DEFAULT NULL COMMENT '日期',
  `con_cid` varchar(20) DEFAULT NULL,
  `sch_timeslot` int(11) DEFAULT NULL COMMENT '时间段',
  PRIMARY KEY (`sch_id`) USING BTREE,
  KEY `FK_emp_sch` (`emp_id`) USING BTREE,
  KEY `FK_con_id` (`con_cid`),
  CONSTRAINT `FK_con_id` FOREIGN KEY (`con_cid`) REFERENCES `oa_schedulecontent` (`con_cid`),
  CONSTRAINT `FK_emp_sch` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日程表';

-- ----------------------------
-- Records of oa_schedule
-- ----------------------------
INSERT INTO `oa_schedule` VALUES ('1', 'emp2018001', '2018-01-09', '20180109001', '8');

-- ----------------------------
-- Table structure for `oa_schedulecontent`
-- ----------------------------
DROP TABLE IF EXISTS `oa_schedulecontent`;
CREATE TABLE `oa_schedulecontent` (
  `con_cid` varchar(20) NOT NULL COMMENT '日程内容编号',
  `con_type` int(11) DEFAULT NULL COMMENT '日程员工类型 2.日 3.周 4.月',
  `con_content` varchar(100) DEFAULT NULL COMMENT '日程内容',
  `con_starttime` datetime DEFAULT NULL COMMENT '日程开始时间',
  `con_endtime` datetime DEFAULT NULL COMMENT '日程结束时间',
  `con_remindtime` datetime DEFAULT NULL COMMENT '提醒时间',
  `con_reminding` int(11) DEFAULT NULL COMMENT '是否短信提醒',
  PRIMARY KEY (`con_cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日程内容表';

-- ----------------------------
-- Records of oa_schedulecontent
-- ----------------------------
INSERT INTO `oa_schedulecontent` VALUES ('20180109001', '2', '记得开项目会议', '2018-01-09 08:51:52', '2018-01-09 08:52:29', '2018-01-09 08:40:19', '0');

-- ----------------------------
-- Table structure for `oa_scheduletype`
-- ----------------------------
DROP TABLE IF EXISTS `oa_scheduletype`;
CREATE TABLE `oa_scheduletype` (
  `sht_id` varchar(20) NOT NULL COMMENT '排班类型编号',
  `sht_name` varchar(20) DEFAULT NULL COMMENT '排班类型名称',
  `sht_w1` int(11) DEFAULT NULL COMMENT '星期一',
  `sht_w2` int(11) DEFAULT NULL COMMENT '星期二',
  `sht_w3` int(11) DEFAULT NULL COMMENT '星期三',
  `sht_w4` int(11) DEFAULT NULL COMMENT '星期四',
  `sht_w5` int(11) DEFAULT NULL COMMENT '星期五',
  `sht_w6` int(11) DEFAULT NULL COMMENT '星期六',
  `sht_w7` int(11) DEFAULT NULL COMMENT '星期天',
  `sht_remark` varchar(100) DEFAULT NULL COMMENT '备注3',
  `sht_status` int(11) DEFAULT NULL COMMENT '状态2',
  PRIMARY KEY (`sht_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='排班类型表';

-- ----------------------------
-- Records of oa_scheduletype
-- ----------------------------
INSERT INTO `oa_scheduletype` VALUES ('sht2018001', '日常班', '1', '1', '1', '1', '1', '0', '0', '公司员工固定上班日志', '1');

-- ----------------------------
-- Table structure for `oa_score`
-- ----------------------------
DROP TABLE IF EXISTS `oa_score`;
CREATE TABLE `oa_score` (
  `score_id` varchar(20) NOT NULL COMMENT '评分id',
  `et_id` varchar(20) DEFAULT NULL COMMENT '考核任务id',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '评分人',
  `score_content` varchar(100) DEFAULT NULL COMMENT '评语',
  `score_state` int(11) DEFAULT NULL COMMENT '评分状态',
  PRIMARY KEY (`score_id`) USING BTREE,
  KEY `FK_emp_score` (`emp_id`) USING BTREE,
  KEY `FK_task_score` (`et_id`) USING BTREE,
  CONSTRAINT `FK_emp_score` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`),
  CONSTRAINT `FK_task_score` FOREIGN KEY (`et_id`) REFERENCES `oa_examtask` (`et_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评分表';

-- ----------------------------
-- Records of oa_score
-- ----------------------------
INSERT INTO `oa_score` VALUES ('score001', 'et001', 'emp2018002', '工作认真', '1');
INSERT INTO `oa_score` VALUES ('score002', 'et002', 'emp2018002', '很好', '1');
INSERT INTO `oa_score` VALUES ('score003', 'et003', 'emp2018002', null, '1');
INSERT INTO `oa_score` VALUES ('score004', 'et004', 'emp2018002', null, '1');
INSERT INTO `oa_score` VALUES ('score005', 'et004', 'emp2018002', null, '1');

-- ----------------------------
-- Table structure for `oa_scoredetail`
-- ----------------------------
DROP TABLE IF EXISTS `oa_scoredetail`;
CREATE TABLE `oa_scoredetail` (
  `sd_id` varchar(20) NOT NULL COMMENT '评分明细编号',
  `ep_id` varchar(20) DEFAULT NULL COMMENT '考核项目id',
  `score_id` varchar(20) DEFAULT NULL COMMENT '评分id',
  `sd_summary` varchar(100) DEFAULT NULL COMMENT '工作总结',
  `sd_leadcon` varchar(100) DEFAULT NULL COMMENT '领导评语',
  PRIMARY KEY (`sd_id`) USING BTREE,
  KEY `FK_pro_detail` (`ep_id`) USING BTREE,
  KEY `FK_score_detail` (`score_id`) USING BTREE,
  CONSTRAINT `FK_pro_detail` FOREIGN KEY (`ep_id`) REFERENCES `oa_examproject` (`ep_id`),
  CONSTRAINT `FK_score_detail` FOREIGN KEY (`score_id`) REFERENCES `oa_score` (`score_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评分明细表';

-- ----------------------------
-- Records of oa_scoredetail
-- ----------------------------
INSERT INTO `oa_scoredetail` VALUES ('sd001', 'ep001', 'score001', '工作过程中认真努力', '表现不错，再接再厉');
INSERT INTO `oa_scoredetail` VALUES ('sd002', 'ep002', 'score002', '还应努力', '加油');
INSERT INTO `oa_scoredetail` VALUES ('sd003', 'ep003', 'score003', null, '加油');
INSERT INTO `oa_scoredetail` VALUES ('sd004', 'ep004', 'score004', null, '不错');
INSERT INTO `oa_scoredetail` VALUES ('sd005', 'ep005', 'score005', null, '继续努力');

-- ----------------------------
-- Table structure for `oa_systemlog`
-- ----------------------------
DROP TABLE IF EXISTS `oa_systemlog`;
CREATE TABLE `oa_systemlog` (
  `log_id` int(11) NOT NULL COMMENT '日志编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `log_sysTime` date DEFAULT NULL COMMENT '系统时间',
  `log_IP` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `log_option` varchar(100) DEFAULT NULL COMMENT '操作内容',
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `FK_emp_log` (`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_log` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统日志';

-- ----------------------------
-- Records of oa_systemlog
-- ----------------------------

-- ----------------------------
-- Table structure for `oa_telgroup`
-- ----------------------------
DROP TABLE IF EXISTS `oa_telgroup`;
CREATE TABLE `oa_telgroup` (
  `group_id` varchar(20) NOT NULL COMMENT '分组编号',
  `group_name` varchar(50) DEFAULT NULL COMMENT '组名',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='通讯录分组表';

-- ----------------------------
-- Records of oa_telgroup
-- ----------------------------
INSERT INTO `oa_telgroup` VALUES ('1', '家人');
INSERT INTO `oa_telgroup` VALUES ('2', '朋友');
INSERT INTO `oa_telgroup` VALUES ('3', '客户');

-- ----------------------------
-- Table structure for `oa_trainplan`
-- ----------------------------
DROP TABLE IF EXISTS `oa_trainplan`;
CREATE TABLE `oa_trainplan` (
  `rp_id` varchar(20) NOT NULL COMMENT '培训计划编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `tec_id` varchar(20) DEFAULT NULL COMMENT '培训讲师id',
  `rp_name` varchar(20) DEFAULT NULL COMMENT '名称',
  `rp_host` varchar(50) DEFAULT NULL COMMENT '主办单位',
  `rp_place` varchar(50) DEFAULT NULL COMMENT '培训地点',
  `rp_day` int(11) DEFAULT NULL COMMENT '培训天数',
  `rp_money` int(11) DEFAULT NULL COMMENT '培训费用',
  `rp_begin` date DEFAULT NULL COMMENT '开始日期',
  `rp_end` date DEFAULT NULL COMMENT '结束日期',
  `rp_content` varchar(100) DEFAULT NULL COMMENT '培训内容',
  `rp_remark` varchar(100) DEFAULT NULL COMMENT '培训备注',
  `rp_others` int(11) DEFAULT NULL COMMENT '其他费用',
  `rp_state` int(11) DEFAULT NULL COMMENT '培训状态',
  `rp_stunum` int(11) DEFAULT NULL COMMENT '学员总数',
  `rp_assess` varchar(100) DEFAULT NULL COMMENT '培训评估',
  PRIMARY KEY (`rp_id`) USING BTREE,
  KEY `FK_fuze` (`emp_id`) USING BTREE,
  KEY `FK_tec_plan` (`tec_id`) USING BTREE,
  CONSTRAINT `FK_fuze` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`),
  CONSTRAINT `FK_tec_plan` FOREIGN KEY (`tec_id`) REFERENCES `oa_traintec` (`tec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='培训计划表';

-- ----------------------------
-- Records of oa_trainplan
-- ----------------------------

-- ----------------------------
-- Table structure for `oa_traintec`
-- ----------------------------
DROP TABLE IF EXISTS `oa_traintec`;
CREATE TABLE `oa_traintec` (
  `tec_id` varchar(20) NOT NULL COMMENT '培训讲师id',
  `tec_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `tec_type` int(11) DEFAULT NULL COMMENT '讲师类型',
  `tec_phone` varchar(20) DEFAULT NULL COMMENT '讲师电话',
  `tec_email` varchar(20) DEFAULT NULL COMMENT '讲师邮箱',
  `tec_post` varchar(20) DEFAULT NULL COMMENT '邮编',
  `tec_address` varchar(50) DEFAULT NULL COMMENT '讲师地址',
  `tec_inner` varchar(20) DEFAULT NULL COMMENT '内部证书',
  `tec_out` varchar(20) DEFAULT NULL COMMENT '外部证书',
  `tec_innerdate` date DEFAULT NULL COMMENT '内部发证日期',
  `tec_outdate` date DEFAULT NULL COMMENT '外部发证日期',
  `tec_remark` varchar(100) DEFAULT NULL COMMENT '讲师备注',
  `tec_state` int(11) DEFAULT NULL COMMENT '讲师状态',
  `tec_enc` varchar(50) DEFAULT NULL COMMENT '讲师附件',
  PRIMARY KEY (`tec_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='培训讲师表';

-- ----------------------------
-- Records of oa_traintec
-- ----------------------------

-- ----------------------------
-- Table structure for `oa_turn`
-- ----------------------------
DROP TABLE IF EXISTS `oa_turn`;
CREATE TABLE `oa_turn` (
  `turn_id` varchar(20) NOT NULL COMMENT '转办记录编号',
  `flow_id` varchar(20) DEFAULT NULL COMMENT '流程编号',
  `turn_state` int(11) DEFAULT NULL COMMENT '转办状态',
  PRIMARY KEY (`turn_id`) USING BTREE,
  KEY `FK_flow_turn` (`flow_id`) USING BTREE,
  CONSTRAINT `FK_flow_turn` FOREIGN KEY (`flow_id`) REFERENCES `oa_flow` (`flow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='转办记录表';

-- ----------------------------
-- Records of oa_turn
-- ----------------------------

-- ----------------------------
-- Table structure for `oa_vacation`
-- ----------------------------
DROP TABLE IF EXISTS `oa_vacation`;
CREATE TABLE `oa_vacation` (
  `vac_id` varchar(20) NOT NULL COMMENT '假期编号',
  `vac_name` varchar(20) DEFAULT NULL COMMENT '假期名称',
  `vac_number` int(11) DEFAULT NULL COMMENT '假期天数',
  `vac_check` int(11) DEFAULT NULL COMMENT '是否计算考勤',
  PRIMARY KEY (`vac_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='假期类型表';

-- ----------------------------
-- Records of oa_vacation
-- ----------------------------
INSERT INTO `oa_vacation` VALUES ('vac2018001', '劳动节', '3', '1');
INSERT INTO `oa_vacation` VALUES ('vac2018002', '中秋节', '3', '1');
INSERT INTO `oa_vacation` VALUES ('vac2018003', '国庆节', '7', '1');

-- ----------------------------
-- Table structure for `oa_whereabouts`
-- ----------------------------
DROP TABLE IF EXISTS `oa_whereabouts`;
CREATE TABLE `oa_whereabouts` (
  `whe_id` varchar(20) NOT NULL COMMENT '去向编号',
  `emp_id` varchar(20) DEFAULT NULL COMMENT '工号',
  `whe_start` datetime DEFAULT NULL COMMENT '去向开始时间',
  `whe_end` datetime DEFAULT NULL COMMENT '去向结束时间',
  `whe_about` varchar(100) DEFAULT NULL COMMENT '去向',
  `whe_state` int(11) DEFAULT NULL COMMENT '是否公开',
  PRIMARY KEY (`whe_id`) USING BTREE,
  KEY `FK_emp_wh` (`emp_id`) USING BTREE,
  CONSTRAINT `FK_emp_wh` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='去向表';

-- ----------------------------
-- Records of oa_whereabouts
-- ----------------------------
INSERT INTO `oa_whereabouts` VALUES ('1', 'emp2018001', '2018-01-08 10:24:56', '2018-01-09 10:25:00', '市场调查', '0');
INSERT INTO `oa_whereabouts` VALUES ('2', 'emp2018002', '2018-01-02 00:00:00', '2018-01-03 00:00:00', '修养身心', '0');
INSERT INTO `oa_whereabouts` VALUES ('3', 'emp2018001', '2018-01-09 00:00:00', '2018-01-10 00:00:00', '见客户', '1');

-- ----------------------------
-- Table structure for `trainstu`
-- ----------------------------
DROP TABLE IF EXISTS `trainstu`;
CREATE TABLE `trainstu` (
  `rp_id` varchar(20) NOT NULL COMMENT '培训计划编号',
  `emp_id` varchar(20) NOT NULL COMMENT '工号',
  PRIMARY KEY (`rp_id`,`emp_id`) USING BTREE,
  KEY `FK_trainstu2` (`emp_id`) USING BTREE,
  CONSTRAINT `FK_trainstu` FOREIGN KEY (`rp_id`) REFERENCES `oa_trainplan` (`rp_id`),
  CONSTRAINT `FK_trainstu2` FOREIGN KEY (`emp_id`) REFERENCES `oa_emp` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='培训学员';

-- ----------------------------
-- Records of trainstu
-- ----------------------------
