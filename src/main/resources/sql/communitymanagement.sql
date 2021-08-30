/*
 Navicat Premium Data Transfer

 Source Server         : CommunityManagement
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : communitymanagement

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 30/08/2021 18:48:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appointment_record
-- ----------------------------
DROP TABLE IF EXISTS `appointment_record`;
CREATE TABLE `appointment_record`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hospital` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doctor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appointment_record
-- ----------------------------
INSERT INTO `appointment_record` VALUES (3, '29', '辽宁', '大连', '大连医科大学附属第二医院', '儿科综合', '张磊', '2021-08-29 20:48:00');

-- ----------------------------
-- Table structure for checkin
-- ----------------------------
DROP TABLE IF EXISTS `checkin`;
CREATE TABLE `checkin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) NOT NULL,
  `Checkin` int(0) NOT NULL DEFAULT 0,
  `checktime` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of checkin
-- ----------------------------
INSERT INTO `checkin` VALUES (1, 29, 31, '2020-03-23 15:01:53');
INSERT INTO `checkin` VALUES (2, 80, 1, '2020-03-09 14:44:16');
INSERT INTO `checkin` VALUES (3, 77, 1, '2020-03-09 14:50:23');
INSERT INTO `checkin` VALUES (4, 87, 1, '2020-03-19 17:13:05');

-- ----------------------------
-- Table structure for codemap
-- ----------------------------
DROP TABLE IF EXISTS `codemap`;
CREATE TABLE `codemap`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `code_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of codemap
-- ----------------------------
INSERT INTO `codemap` VALUES (1, 'province', '辽宁', NULL, NULL);
INSERT INTO `codemap` VALUES (2, 'city', '大连', '1', NULL);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '内科', '0');
INSERT INTO `department` VALUES (2, '呼吸内科', '1');
INSERT INTO `department` VALUES (3, '消化内科', '1');
INSERT INTO `department` VALUES (4, '神经内科', '1');
INSERT INTO `department` VALUES (5, '心血管内科', '1');
INSERT INTO `department` VALUES (6, '肾内科', '1');
INSERT INTO `department` VALUES (7, '外科', '0');
INSERT INTO `department` VALUES (8, '普通外科', '1');
INSERT INTO `department` VALUES (9, '神经外科', '1');
INSERT INTO `department` VALUES (10, '心胸外科', '1');
INSERT INTO `department` VALUES (11, '泌尿外科', '1');
INSERT INTO `department` VALUES (12, '心血管外科', '1');
INSERT INTO `department` VALUES (13, '妇产科', '0');
INSERT INTO `department` VALUES (14, '妇科', '1');
INSERT INTO `department` VALUES (15, '产科', '1');
INSERT INTO `department` VALUES (16, '儿科', '0');
INSERT INTO `department` VALUES (17, '儿科综合', '1');
INSERT INTO `department` VALUES (18, '小儿内科', '1');
INSERT INTO `department` VALUES (19, '小儿外科', '1');
INSERT INTO `department` VALUES (20, '五官科', '0');
INSERT INTO `department` VALUES (21, '耳鼻喉科', '1');
INSERT INTO `department` VALUES (22, '眼科', '1');
INSERT INTO `department` VALUES (23, '口腔科', '1');
INSERT INTO `department` VALUES (24, '肿瘤科', '0');
INSERT INTO `department` VALUES (25, '肿瘤内科', '1');
INSERT INTO `department` VALUES (26, '肿瘤外科', '1');
INSERT INTO `department` VALUES (27, '皮肤性病科', '0');
INSERT INTO `department` VALUES (28, '皮肤科', '1');
INSERT INTO `department` VALUES (29, '性病科', '1');
INSERT INTO `department` VALUES (30, '中医科', '0');
INSERT INTO `department` VALUES (31, '中医全科', '1');
INSERT INTO `department` VALUES (32, '中医内科', '1');
INSERT INTO `department` VALUES (33, '中医外科', '1');
INSERT INTO `department` VALUES (34, '中医妇科', '1');
INSERT INTO `department` VALUES (35, '传染科', '0');
INSERT INTO `department` VALUES (36, '肝病科', '1');
INSERT INTO `department` VALUES (37, '艾滋病科', '1');
INSERT INTO `department` VALUES (38, '结核病', '1');
INSERT INTO `department` VALUES (39, '寄生虫 ', '1');
INSERT INTO `department` VALUES (40, '精神心理科', '0');
INSERT INTO `department` VALUES (41, '精神科', '1');
INSERT INTO `department` VALUES (42, '心理咨询科', '1');
INSERT INTO `department` VALUES (43, '麻醉医学科', '0');
INSERT INTO `department` VALUES (44, '麻醉科', '1');
INSERT INTO `department` VALUES (45, '疼痛科', '1');
INSERT INTO `department` VALUES (46, '医学影像科', '0');
INSERT INTO `department` VALUES (47, '核医学科', '1');
INSERT INTO `department` VALUES (48, '放射科', '1');
INSERT INTO `department` VALUES (49, '超声科 ', '1');
INSERT INTO `department` VALUES (50, '其它科室', '0');
INSERT INTO `department` VALUES (51, '药剂科', '1');
INSERT INTO `department` VALUES (52, '护理科', '1');
INSERT INTO `department` VALUES (53, '体检科', '1');
INSERT INTO `department` VALUES (54, '检验科', '1');
INSERT INTO `department` VALUES (55, '急诊科', '1');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `foodid` int(0) NOT NULL AUTO_INCREMENT COMMENT '食品id',
  `foodname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '食品名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`foodid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, '五常大米20斤', 118.80, '/static/images/food/20200428125428.png');
INSERT INTO `food` VALUES (2, '鲁花 5S一级花生油 5L食用油', 149.90, '/static/images/food/20200428125538.png');
INSERT INTO `food` VALUES (3, '中盐 纯精竹盐无碘食用盐家用225g', 6.00, '/static/images/food/20200428125700.png');
INSERT INTO `food` VALUES (4, '味事达味极鲜酱油760ml', 17.50, '/static/images/food/20200428125826.png');
INSERT INTO `food` VALUES (5, '紫林6.5度山西老陈醋500ml', 29.50, '/static/images/food/20200428125922.png');
INSERT INTO `food` VALUES (6, '好吉利42卷纸巾本色', 22.99, '/static/images/food/20200428130144.png');
INSERT INTO `food` VALUES (7, '提客清真牛上脑4斤装', 169.00, '/static/images/food/20200428130252.png');
INSERT INTO `food` VALUES (8, '羊腿新鲜整只5.5斤', 128.00, '/static/images/food/20200428130423.png');
INSERT INTO `food` VALUES (9, '益当先小黄鱼', 14.30, '/static/images/food/20200428130612.png');
INSERT INTO `food` VALUES (10, '有机卷心菜500g', 22.50, '/static/images/food/20200428130725.png');
INSERT INTO `food` VALUES (11, '黄瓜5斤装', 13.80, '/static/images/food/20200428130820.png');
INSERT INTO `food` VALUES (12, '小香葱5斤', 24.90, '/static/images/food/20200428131151.png');
INSERT INTO `food` VALUES (13, '谢地姜100g', 1.70, '/static/images/food/20200428131314.png');
INSERT INTO `food` VALUES (14, '新鲜大蒜5斤', 19.90, '/static/images/food/20200428131417.png');
INSERT INTO `food` VALUES (15, '云南红皮小土豆10斤', 14.90, '/static/images/food/20200428131636.png');
INSERT INTO `food` VALUES (16, '韭菜500g', 11.00, '/static/images/food/20200428131716.png');
INSERT INTO `food` VALUES (17, '羽衣甘蓝1000g', 28.80, '/static/images/food/20200428131837.png');
INSERT INTO `food` VALUES (18, ' 有机紫长茄500g', 29.90, '/static/images/food/20200428131929.png');
INSERT INTO `food` VALUES (19, '混合蔬菜什锦', 19.90, '/static/images/food/20200428132046.png');

-- ----------------------------
-- Table structure for hospital
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hospital
-- ----------------------------
INSERT INTO `hospital` VALUES (1, '大连医科大学附属第二医院', '三级甲等', '0411-84671291', '大连医科大学附属第二医院始建于1958年，1969年随大连医学院南迁遵义。1987年回迁复建，1991年独立办院。年门急诊量140万人次，年出院人数7.5万余人次，年手术例数4.5万余例。目前编制床位3000张，人员定编4514人，为辽南地区最大医院。  　　医院拥有一支高素质的医疗、护理、教学和科研队伍，一批德高望重的老专家和拥有博士学位以及国外留学经历的中青年学科带头人，构成了医院的人才主体。高级以上职称者近500人，医生中硕士以上学位人员占总数的70%。享受各级政府津贴27人。拥有33 个博士、硕士点，200余名博士、硕士生导师。 　　医院大力开展学科建设，形成了学科优势和技术特色。以肿瘤疾病综合治疗、终末期肝病一体化治疗、癫痫病综合治疗、糖尿病足特色治疗、心脑血管病介入治疗为代表的技术达到国内先进水平。医院目前拥有国家重点学科2个，国家重点专科1个，辽宁省诊疗中心4个，辽宁省重点学科6个，大连市重点学科13个，辽宁省医学重点专科建设项目31项。2012年，获得大连市医疗软实力建设项目1个中心、7个基地资助。  　　医院承担了7个层次、15个专业的临床教学任务，建立了17个教学基地，4个普通专科和9个亚专科成为卫生部专科医师培训基地，16个二级学科成为省级住院医师规范化培训基地。 　 　  　　近五年，医院获得国家、省部级等各级科研课题立项355项，其中国家自然基金重点项目2项，获得国家、省部级等各级科研获奖56项，获得国家级专利4项；发表论文2904篇，主编、副主编学术专著共46部；有12个专业获得国家食品与药品监督管理局批准的临床药物试验资格。 　 　  　　医院重视学术交流，先后同美国、瑞典、德国、荷兰、日本等国家和地区医院建立友好关系，并与美国西雅图瑞典人医疗中心合作，成立了东北首家癫痫病治疗中心。 　 　  　　医院的数字化建设卓有成效，是卫生部首批数字化医院示范单位。现已形成1000多个工作站的网络系统，实现了HIS、LIS、PACS和PASS系统的一体化建设，首批获得\"卫生部数字化试点示范医院\"称号。 　 　  　　医院坚持\"以人为本、创新发展\"的办院理念，以建设人性化、现代化、国际化医疗集团为目标，社会影响力和患者满意度不断提升。先后获得\"全国卫生系统先进集体\"、\"抗震救灾重建家园工人先锋号\"、\"辽宁省精神文明创建活动先进单位\"、\"辽宁省卫生系统优质服务二十佳医院\"、\"辽宁省抗震救灾先进集体\"、 \"辽宁省重点学科建设先进单位\"、\"辽宁省住院医师规范化培训先进单位\"、\"全国医院文化建设先进单位\"等荣誉。', '大连市沙河口区中山路467号');
INSERT INTO `hospital` VALUES (2, '大连市中心医院', '三级甲等', '0411-84412001', '大连市中心医院始建于1949年，是一所集医疗、教学、科研、预防、保健、康复于一体的综合性三级甲等医院。1992年首批晋升为三级甲等医院，2002年在全省三级甲等综合性医院中率先通过ISO9001（2000）国际质量管理体系认证，2006年首批通过辽宁省三级甲等综合性医院复核评价。现为卫生部临床路径管理试点医院、电子病历试点医院、临床药师培训基地、内镜专业技术耳鼻咽喉头颈科培训基地，辽宁省住院医师规范化培训基地。  　　大连市中心医院编制床位1290张，设有南院、北院。医院现有职工2265人，其中：卫生技术人员1787人。副高职以上342人，硕士以上学历258人，硕士研究生导师28人。2009年出入院患者42450人次，门急诊诊疗人次78万人次，床位利用率110.91%，手术13772例，平均住院日11.9天。医院拥有3.0T核磁共振机、全身伽玛刀、64排螺旋CT、血管造影机、数字胃肠机等大型现代化医疗设备。  　　大连市中心医院紧紧围绕深化医药卫生体制改革的总体目标，确立“外科优先、内科精品、基础强势”的发展战略。耳鼻咽喉头颈外科、心血管内科、神经外科、手足外科、心胸外科、内分泌科、神经内科、泌尿内科、检验科为大连市一级医学重点学科，传统医学部为辽宁省综合医院重点中医科。开展的心脏介入、功能神经外科、显微外科等技术达到国内先进水平。五官医学部手术室采用国际最先进的一体化手术室建设标准，实现手术过程全球化资源共享。血液净化室达到国内领先、东北地区最大规模，拥有透析治疗机90余台，可同时安排500名患者进行透析。引进瑞典医科达3光子医用高能直线加速器，提高肿瘤患者综合治疗能力和临床疗效。开通急性心肌梗死患者救治、大型企业员工救治、海上急救、重危孕产妇抢救等急救绿色通道，建立卒中单元。先后与美国等十余个国家和地区的医学界建立学术往来关系。  　　医院坚持以科学发展观为指导，以全心全意为人民健康服务为宗旨，积极推进医院规范化与科学化管理。被卫生部、国家食品药品监督管理局、国家中医药管理局授予“全国医药卫生系统先进集体”，被辽宁省卫生厅授予2010年度全省卫生系统“诚信服务杯”竞赛活动标兵单位，被市委授予“大连市支持工会工作先进单位”，被大连市卫生局授予“全市卫生系统先进集体”。外科支会被全国总工会授予“全国模范职工小家”。大连市中心医院代表队在“辽宁省优质护理服务技能竞赛”中获得团体一等奖，成为本次比赛唯一获此殊荣的市级医院。  　　与共和国同龄的大连市中心医院将进一步弘扬“团结、热忱、精湛、严谨”的八字院风，进一步巩固“以人为本、关爱生命”的核心办院理念，进一步树立“开拓创新、追求卓越”的医院精神，把医改的挑战变成发展的动力，不断提高医疗服务质量和医疗服务能力，实现跨越式又好又快发展，以更加优质的医疗服务为人民的健康保驾护航！', NULL);
INSERT INTO `hospital` VALUES (3, '大连医科大学附属第一医院', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for loginrecord
-- ----------------------------
DROP TABLE IF EXISTS `loginrecord`;
CREATE TABLE `loginrecord`  (
  `recordid` int(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `logintime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `flag` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`recordid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 401 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of loginrecord
-- ----------------------------
INSERT INTO `loginrecord` VALUES (395, '登录成功', '112.42.7.132', '2021-08-29 19:12:24', 'sunquan', '江苏省', 0);
INSERT INTO `loginrecord` VALUES (396, '登录成功', '112.42.7.132', '2021-08-29 19:20:51', 'sunquan', '江苏省', 0);
INSERT INTO `loginrecord` VALUES (398, '登录成功', '112.42.7.132', '2021-08-29 20:43:53', 'sunquan', '江苏省', 0);
INSERT INTO `loginrecord` VALUES (399, '登录成功', '112.42.7.132', '2021-08-29 20:48:07', 'sunquan', '江苏省', 0);
INSERT INTO `loginrecord` VALUES (400, '登录成功', '112.42.7.132', '2021-08-30 18:46:27', 'sunquan', '江苏省', 0);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `noticeid` int(0) NOT NULL AUTO_INCREMENT,
  `noticename` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`noticeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '楼下小黑又有新发明了！', '大家快去围观呀！', NULL, '2020-02-09 16:07:18');
INSERT INTO `notice` VALUES (11, '楼下咖啡厅开业大酬宾！', '楼下咖啡厅开业大酬宾！', '/images/notice/1581242902743.png', '2020-02-09 18:12:20');
INSERT INTO `notice` VALUES (13, '楼下网吧开业大酬宾！', '楼下网吧开业大酬宾！', '/images/notice/1581242992574.png', '2020-02-09 18:12:15');
INSERT INTO `notice` VALUES (14, '2020年4月4日 举行全国性哀悼活动', '【国务院公告：2020年4月#4日举行全国性哀悼活动#】为表达全国各族人民对抗击新冠肺炎疫情斗争牺牲烈士和逝世同胞的深切哀悼，国务院发布公告，决定2020年4月4日举行全国性哀悼活动。在此期间，全国和驻外使领馆下半旗志哀，全国停止公共娱乐活动。#4月4日10时起全国人民默哀3分钟#，汽车、火车、舰船鸣笛，防空警报鸣响。', '/images/notice/1586001552845.png', '2020-04-04 19:59:12');
INSERT INTO `notice` VALUES (15, '123', '驱蚊器翁', '/images/notice/1629611058363.png', '2021-08-22 05:44:18');
INSERT INTO `notice` VALUES (16, '我', '请问', '/images/notice/1629611068826.png', '2021-08-22 05:44:28');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `orderid` int(0) NOT NULL COMMENT '订单id',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人',
  `foodids` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '食品id列表',
  `number` varchar(13) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `flag` int(0) NULL DEFAULT NULL COMMENT '状态（0：已下单 1:已配送 2:已完成）',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (290308430, '一号楼二单元二楼西户201', '王红梅', '3,', '15044832900', 6.00, 2, '2020-05-06 17:30:00');
INSERT INTO `order` VALUES (349000287, '一号楼二单元二楼西户201', '王红梅', '2,3,', '15044832900', 155.90, 2, '2020-05-01 15:30:52');
INSERT INTO `order` VALUES (378330706, '一号楼二单元二楼西户201', '孙权', '3,', '15044832900', 6.00, 3, '2020-05-01 16:31:28');
INSERT INTO `order` VALUES (528412265, '一号楼二单元二楼西户201', '孙权', '1,2,3,', '15044832900', 274.70, 1, '2020-05-19 14:58:48');
INSERT INTO `order` VALUES (667188519, '一号楼二单元二楼西户201', '王红梅', '2,', '15044832900', 149.90, 2, '2020-05-06 17:00:21');
INSERT INTO `order` VALUES (771204537, '一号楼二单元二楼西户201', '孙权', '1,2,3,8,', '15044832900', 402.70, 2, '2020-05-06 16:59:02');
INSERT INTO `order` VALUES (960123662, '一号楼二单元二楼西户201', '孙权', '2,3,5,', '15044832900', 185.40, 3, '2020-05-01 16:27:56');

-- ----------------------------
-- Table structure for outinfor
-- ----------------------------
DROP TABLE IF EXISTS `outinfor`;
CREATE TABLE `outinfor`  (
  `id` int(0) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `summary` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `infoSource` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sourceUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `pubDateStr` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `postid` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` varchar(2555) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `createtime` datetime(0) NOT NULL,
  `flag` int(0) NOT NULL DEFAULT 0,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `replypost` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`postid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, '社区论坛终于上线啦！', '社区论坛终于上线啦！', '2020-02-11 13:58:14', 1, 'sunquan', NULL, 9);
INSERT INTO `post` VALUES (2, '\r\n想在软景附近租房，请问大家有房源吗', '想在软景附近租房，请问大家有房源吗', '2020-02-11 14:04:35', 0, 'mumian', NULL, 5);
INSERT INTO `post` VALUES (3, '\r\n咱们学校有学生群或学生兼职群吗？', '\r\n咱们学校有学生群或学生兼职群吗？', '2020-02-04 14:05:36', 0, 'niqian', NULL, 2);
INSERT INTO `post` VALUES (4, '\r\n关于校招', '想问一下春招是几月开始啊', '2020-02-11 14:06:08', 0, 'lianggong', NULL, 5);
INSERT INTO `post` VALUES (5, '终于到了在家躺着就能给国家做贡献的时候了', '<span style=\"color:#333333;font-family:&quot;Helvetica Neue&quot;, Helvetica, Arial,sans-serif;font-size:14px;\">终于到了在家躺着就能给国家做贡献的时候了</span>', '2020-02-11 15:01:21', 0, NULL, '/images/post/1581404480711.png', 3);
INSERT INTO `post` VALUES (7, '大家去哪里实习的？', '好想去实习啊', '2020-02-12 15:29:58', 0, '', '/images/post/1581492597884.png', 4);
INSERT INTO `post` VALUES (8, '线上学习，停课不停学', '线上学习，停课不停学', '2020-02-12 16:35:34', 0, 'sunquan', NULL, 1);
INSERT INTO `post` VALUES (10, '什么时候可以出去玩呢？！', '什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩什么时候可以出去玩', '2020-02-14 23:10:03', 1, 'sunquan', '/images/post/1581693003098.png', 3);
INSERT INTO `post` VALUES (11, '震惊！90后小伙深更半夜居然做出这种事情？！', '哈哈哈哈哈哈傻逼！点进来被骗了吧！', '2020-02-14 23:23:33', 0, 'sunquan', '/images/post/1581693812787.png', 2);
INSERT INTO `post` VALUES (12, '我好想出去丸', '想吃大餐，想呼吸新鲜空气', '2020-02-14 23:24:48', 1, 'sunquan', '/images/post/1581693887760.png', 2);
INSERT INTO `post` VALUES (13, '我要出去玩牛逼！！', '别的啥也不说了，牛逼就完事儿了！', '2020-02-17 13:49:58', 0, '', '/images/post/1581918597522.png', 4);
INSERT INTO `post` VALUES (14, '', '', '2021-08-21 19:08:52', 0, 'sunquan', '/images/post/1629544132438.png', 0);
INSERT INTO `post` VALUES (15, '请问', '请问', '2021-08-29 19:21:38', 0, 'sunquan', '/images/post/1630236098197.png', 0);

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `replyid` int(0) NOT NULL AUTO_INCREMENT,
  `replypostid` int(0) NOT NULL,
  `replycontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createtime` datetime(0) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `replyname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`replyid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES (1, 36, '呵呵哈哈哈', '2020-02-15 15:17:08', 'hongmei', 'xiaoming');
INSERT INTO `reply` VALUES (14, 36, '你说哈？', '2020-02-15 18:37:27', 'kalajipang', 'hongmei');
INSERT INTO `reply` VALUES (15, 35, '0 0', '2020-02-17 15:14:17', 'sunquan', ' sunquan');
INSERT INTO `reply` VALUES (16, 35, '0 0', '2020-02-17 15:14:24', 'sunquan', 'sunquan');
INSERT INTO `reply` VALUES (17, 35, '好好好', '2020-02-24 16:21:23', 'sunquan', 'sunquan');
INSERT INTO `reply` VALUES (18, 31, 'hhhh', '2020-03-19 17:22:28', 'sunquan', ' xiaoming');
INSERT INTO `reply` VALUES (19, 42, '666', '2021-08-22 00:58:06', 'sunquan', ' sunquan');

-- ----------------------------
-- Table structure for replypost
-- ----------------------------
DROP TABLE IF EXISTS `replypost`;
CREATE TABLE `replypost`  (
  `replypostid` int(0) NOT NULL AUTO_INCREMENT,
  `postid` int(0) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `createtime` datetime(0) NOT NULL,
  `flag` int(0) NULL DEFAULT 0,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`replypostid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of replypost
-- ----------------------------
INSERT INTO `replypost` VALUES (1, 1, '终于上线了，太难了', '2020-02-10 17:09:19', 0, 'sunquan', NULL);
INSERT INTO `replypost` VALUES (2, 1, '是呀是呀', '2020-02-11 12:09:42', 0, 'sunquan', NULL);
INSERT INTO `replypost` VALUES (3, 1, '太开心啦耶耶耶', '2020-02-11 14:10:11', 0, 'sunquan', NULL);
INSERT INTO `replypost` VALUES (4, 1, 'content', '2020-02-11 17:45:36', 0, ' sunquan', '/images/replypost/1581414336400.png');
INSERT INTO `replypost` VALUES (7, 1, '回帖功能完成', '2020-02-11 17:51:03', 0, ' sunquan', '/images/replypost/1581414663092.png');
INSERT INTO `replypost` VALUES (8, 4, '今年校招延迟了', '2020-02-11 17:51:34', 0, ' sunquan', '/images/replypost/1581414694285.png');
INSERT INTO `replypost` VALUES (9, 5, 'me too', '2020-02-11 17:52:03', 0, ' sunquan', '/images/replypost/1581414723394.png');
INSERT INTO `replypost` VALUES (10, 5, '啥时候才能开学呢', '2020-02-11 17:58:50', 0, ' sunquan', '/images/replypost/1581415129718.png');
INSERT INTO `replypost` VALUES (11, 2, '不知道啊', '2020-02-11 18:00:31', 0, ' ', '/images/replypost/1581415231230.png');
INSERT INTO `replypost` VALUES (12, 2, '去网上搜一下', '2020-02-11 18:02:25', 0, ' sunquan', '/images/replypost/1581415344590.png');
INSERT INTO `replypost` VALUES (13, 4, '<span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif;font-size:14px;\">今年校招延迟了</span>', '2020-02-11 18:02:57', 0, ' sunquan', '/images/replypost/1581415377496.png');
INSERT INTO `replypost` VALUES (14, 3, '有的', '2020-02-11 18:05:02', 0, ' ', NULL);
INSERT INTO `replypost` VALUES (15, 7, '东软呀', '2020-02-11 18:08:52', 0, ' ', NULL);
INSERT INTO `replypost` VALUES (16, 1, '评论数更新', '2020-02-11 20:04:27', 0, ' sunquan', NULL);
INSERT INTO `replypost` VALUES (17, 1, '<span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif;font-size:14px;\">评论数更新</span>', '2020-02-11 20:09:37', 1, ' sunquan', NULL);
INSERT INTO `replypost` VALUES (18, 1, '<span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif;font-size:14px;\">评论数更新</span>', '2020-02-11 20:11:08', 0, ' ', NULL);
INSERT INTO `replypost` VALUES (19, 4, '<span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif;font-size:14px;\">评论数更新</span>', '2020-02-11 20:12:02', 0, ' sunquan', NULL);
INSERT INTO `replypost` VALUES (20, 2, 'count', '2020-02-11 20:14:25', 0, ' sunquan', NULL);
INSERT INTO `replypost` VALUES (21, 4, 'count', '2020-02-11 20:15:34', 0, ' sunquan', NULL);
INSERT INTO `replypost` VALUES (22, 2, 'postid', '2020-02-11 20:16:10', 0, ' sunquan', NULL);
INSERT INTO `replypost` VALUES (23, 7, '<span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif;font-size:14px;\">东软呀</span>', '2020-02-11 20:16:34', 0, ' sunquan', NULL);
INSERT INTO `replypost` VALUES (24, 6, '<span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif;font-size:14px;\">东软呀</span>', '2020-02-11 20:16:50', 1, ' sunquan', NULL);
INSERT INTO `replypost` VALUES (25, 5, '<font face=\"Helvetica Neue, Helvetica, PingFang SC, 微软雅黑, Tahoma, Arial, sans-serif\"><span style=\"font-size:14px;\">是的呢</span></font>', '2020-02-11 20:17:02', 0, ' sunquan', NULL);
INSERT INTO `replypost` VALUES (26, 4, '<span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif;font-size:14px;\">是的呢</span>', '2020-02-11 20:17:06', 0, ' sunquan', NULL);
INSERT INTO `replypost` VALUES (27, 2, '<span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif;font-size:14px;\">是的呢</span>', '2020-02-11 20:17:10', 0, ' sunquan', NULL);
INSERT INTO `replypost` VALUES (28, 1, '<span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif;font-size:14px;\">是的呢</span>', '2020-02-11 20:17:15', 0, ' sunquan', NULL);
INSERT INTO `replypost` VALUES (29, 3, '<span style=\"font-family:&quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif;font-size:14px;\">是的呢</span>', '2020-02-11 20:17:20', 0, ' sunquan', NULL);
INSERT INTO `replypost` VALUES (30, 8, '嘻嘻嘻嘻嘻', '2020-02-14 11:36:37', 0, ' hongmei', '/images/post/1581651397365.png');
INSERT INTO `replypost` VALUES (31, 10, '', '2020-02-14 23:11:22', 0, ' xiaoming', '/images/post/1581693081706.png');
INSERT INTO `replypost` VALUES (32, 10, '哈哈哈哈哈哈哈哈哈哈或或在这里玩吧', '2020-02-14 23:11:22', 1, ' xiaoming', '/images/post/1581693081718.png');
INSERT INTO `replypost` VALUES (33, 11, '你就是个憨憨，你自己注册账号去，别用我的！', '2020-02-14 23:25:22', 0, ' sunquan', '/images/post/1581693922053.png');
INSERT INTO `replypost` VALUES (34, 12, '哈哈哈哈哈哈哈有意思', '2020-02-14 23:25:34', 0, ' sunquan', '/images/post/1581693933524.png');
INSERT INTO `replypost` VALUES (35, 11, '我不！', '2020-02-14 23:26:06', 0, ' sunquan', '/images/post/1581693965687.png');
INSERT INTO `replypost` VALUES (36, 12, '嘿嘿嘿', '2020-02-14 23:31:31', 1, ' xiaoming', '/images/post/1581694290934.png');
INSERT INTO `replypost` VALUES (39, 7, '', '2020-02-14 23:53:01', 0, ' ', '/images/post/1581695581396.png');
INSERT INTO `replypost` VALUES (40, 7, '自己创业当老板<br />\r\n<br />', '2020-02-14 23:53:12', 0, ' ', '/images/post/1581695592455.png');
INSERT INTO `replypost` VALUES (41, 13, '哈哈哈哈哈哈哈，热烈庆贺我要出去玩网站上线成功！！！', '2020-02-17 13:52:10', 0, ' xiaoming', '/images/post/1581918729964.png');
INSERT INTO `replypost` VALUES (42, 13, '可以可以', '2020-02-27 22:01:33', 0, ' sunquan', '/images/post/1582812092674.png');
INSERT INTO `replypost` VALUES (43, 13, '可以可以', '2020-02-27 22:01:33', 0, ' sunquan', '/images/post/1582812092686.png');
INSERT INTO `replypost` VALUES (45, 13, 'hhhh', '2020-03-19 16:51:37', 0, ' sun', '/images/post/1584607896919.png');
INSERT INTO `replypost` VALUES (46, 10, 'hhhhh', '2020-03-19 17:22:15', 0, ' sunquan', '/images/post/1584609735451.png');

-- ----------------------------
-- Table structure for security
-- ----------------------------
DROP TABLE IF EXISTS `security`;
CREATE TABLE `security`  (
  `securityid` int(0) NOT NULL AUTO_INCREMENT COMMENT '安保人员编号（自增）',
  `password` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `securityname` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '安保人员姓名',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '照片',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '住址',
  `phonenumber` varchar(13) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `idnumber` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `gender` int(0) NOT NULL COMMENT '性别',
  `age` int(0) NOT NULL COMMENT '年龄',
  `userroleid` int(0) NOT NULL COMMENT '角色',
  `flag` int(0) NOT NULL DEFAULT 0 COMMENT '逻辑删除（默认为0）',
  PRIMARY KEY (`securityid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `shopid` int(0) NOT NULL AUTO_INCREMENT COMMENT '列表id',
  `foodid` int(0) NULL DEFAULT NULL COMMENT '食品id',
  `count` int(0) NULL DEFAULT NULL COMMENT '数量',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `orderid` int(0) NULL DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`shopid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES (19, 1, 1, 118.80, 736456252);
INSERT INTO `shop` VALUES (20, 1, 1, 118.80, 58371179);
INSERT INTO `shop` VALUES (21, 1, 1, 118.80, 43310190);
INSERT INTO `shop` VALUES (22, 2, 1, 149.90, 736456252);
INSERT INTO `shop` VALUES (23, 2, 1, 149.90, 43310190);
INSERT INTO `shop` VALUES (24, 3, 1, 6.00, 736456252);
INSERT INTO `shop` VALUES (25, 2, 1, 149.90, 58371179);
INSERT INTO `shop` VALUES (26, 3, 1, 6.00, 58371179);
INSERT INTO `shop` VALUES (27, 3, 1, 6.00, 43310190);
INSERT INTO `shop` VALUES (28, 1, 1, 118.80, 352617101);
INSERT INTO `shop` VALUES (29, 2, 1, 149.90, 352617101);
INSERT INTO `shop` VALUES (30, 3, 1, 6.00, 352617101);
INSERT INTO `shop` VALUES (31, 2, 1, 149.90, 349000287);
INSERT INTO `shop` VALUES (32, 3, 1, 6.00, 349000287);
INSERT INTO `shop` VALUES (33, 2, 1, 149.90, 599943884);
INSERT INTO `shop` VALUES (34, 8, 1, 128.00, 599943884);
INSERT INTO `shop` VALUES (35, 10, 1, 22.50, 599943884);
INSERT INTO `shop` VALUES (36, 2, 1, 149.90, 41728007);
INSERT INTO `shop` VALUES (37, 6, 1, 22.99, 41728007);
INSERT INTO `shop` VALUES (38, 7, 1, 169.00, 41728007);
INSERT INTO `shop` VALUES (39, 8, 1, 128.00, 41728007);
INSERT INTO `shop` VALUES (40, 2, 1, 149.90, 259016705);
INSERT INTO `shop` VALUES (41, 3, 1, 6.00, 259016705);
INSERT INTO `shop` VALUES (42, 4, 1, 17.50, 259016705);
INSERT INTO `shop` VALUES (43, 2, 1, 149.90, 960123662);
INSERT INTO `shop` VALUES (44, 3, 1, 6.00, 960123662);
INSERT INTO `shop` VALUES (45, 5, 1, 29.50, 960123662);
INSERT INTO `shop` VALUES (46, 3, 1, 6.00, 378330706);
INSERT INTO `shop` VALUES (47, 1, 1, 118.80, 771204537);
INSERT INTO `shop` VALUES (48, 2, 1, 149.90, 771204537);
INSERT INTO `shop` VALUES (49, 3, 1, 6.00, 771204537);
INSERT INTO `shop` VALUES (50, 8, 1, 128.00, 771204537);
INSERT INTO `shop` VALUES (51, 2, 1, 149.90, 667188519);
INSERT INTO `shop` VALUES (52, 3, 1, 6.00, 290308430);
INSERT INTO `shop` VALUES (53, 1, 1, 118.80, 528412265);
INSERT INTO `shop` VALUES (54, 2, 1, 149.90, 528412265);
INSERT INTO `shop` VALUES (55, 3, 1, 6.00, 528412265);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '??ID????',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '???',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '??',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '??',
  `phonenumber` varchar(13) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '????',
  `idnumber` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '????',
  `gender` int(0) NULL DEFAULT NULL COMMENT '??',
  `age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `userroleid` int(0) NULL DEFAULT 0 COMMENT '??',
  `flag` int(0) NULL DEFAULT 0 COMMENT '????????0?',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '照片',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '????',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('29', 'sunquan', '123456', '内蒙古巴彦淖尔市五原县', '15044832900', '15822199709220519', 0, 22, 2, 0, 'E:\\images\\1580011434982.png', '2020-01-26 12:03:54', '孙权');
INSERT INTO `user` VALUES ('75', 'hongmei', '123456', '内蒙古巴彦淖尔市五原县', '15044832900', '152822199709220519', 0, 22, 0, 0, 'E:\\images\\1581606686652.png', '2020-02-13 23:11:27', '王红梅');
INSERT INTO `user` VALUES ('76', 'hongming', '19970923sq', '内蒙古巴彦淖尔市五原县', '13848781155', '152822199709220519', 0, 51, 0, 0, 'E:\\images\\1581656716382.png', '2020-02-14 13:00:48', '孙红明');
INSERT INTO `user` VALUES ('77', 'xiaoming', '123456', '内蒙古巴彦淖尔市五原县', '15044832900', '152822199709220519', 0, 26, 12, 0, 'E:\\images\\1581658875147.png', '2020-02-14 13:31:50', '小明');
INSERT INTO `user` VALUES ('78', 'weixinru', 'weixinru', '巴彦淖尔市乌拉特中旗', '17614788932', '150202199806202443', 1, 22, 0, 0, 'E:\\images\\1581693085088.png', '2020-02-14 23:11:25', '魏心如');
INSERT INTO `user` VALUES ('80', 'kalajipang', '123456', '内蒙古巴彦淖尔市五原县', '15044832900', '152822199709220519', 0, 31, 0, 0, 'E:\\images\\1581752980909.png', '2020-02-15 15:49:41', '孙权');
INSERT INTO `user` VALUES ('81', 'xiaoyaqin', '654321', '长沙', '15044832900', '152822199709220519', 0, 18, 0, 0, 'C:\\images\\1581919441494.png', '2020-02-17 14:04:01', '肖雅琴');
INSERT INTO `user` VALUES ('82', 'you father', 'zhenshinidie', '内蒙古警察局', '14878240110', '123456789012345110', 0, 202, 0, 0, 'C:\\images\\1581924778783.png', '2020-02-17 15:32:59', '你爹');
INSERT INTO `user` VALUES ('83', 'feng', '123456', '大连', '18342214598', '210782199611193256', 0, 23, 0, 0, 'C:\\images\\1581925082056.png', '2020-02-17 15:38:02', '冯勇智');
INSERT INTO `user` VALUES ('89', 'useradmin', '123456', '内蒙古', '15044832900', '152822199709220519', 0, 23, 0, 0, 'C:\\images\\1584946785418.png', '2020-03-23 14:59:45', '孙权');

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `userroleid` int(0) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `rolename` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`userroleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES (1, '安保员');
INSERT INTO `userrole` VALUES (2, '管理员');
INSERT INTO `userrole` VALUES (11, '安保组长');
INSERT INTO `userrole` VALUES (12, '安保队长');
INSERT INTO `userrole` VALUES (13, '普通用户');

-- ----------------------------
-- Table structure for vehicle
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle`  (
  `vehicleid` int(0) NOT NULL AUTO_INCREMENT COMMENT '车辆id',
  `owner` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '车主',
  `phonenumber` varchar(13) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系电话',
  `vehicleroleid` int(0) NOT NULL COMMENT '车辆权限id',
  `vehiclenumber` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '车牌号',
  `flag` int(0) NOT NULL DEFAULT 0,
  `createtime` datetime(0) NOT NULL,
  `finite_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`vehicleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
INSERT INTO `vehicle` VALUES (35, '临时用户', NULL, 1, '浙B20587', 0, '2020-02-04 16:52:17', NULL);
INSERT INTO `vehicle` VALUES (36, '临时用户', NULL, 1, '浙B2058Z', 0, '2020-02-04 16:52:29', '2020-02-05 14:16:02');
INSERT INTO `vehicle` VALUES (37, '临时用户', NULL, 1, '浙B2058Z', 0, '2020-02-08 15:18:43', '2020-02-08 15:18:57');
INSERT INTO `vehicle` VALUES (38, '临时用户', NULL, 1, '浙B2058Z', 0, '2020-02-08 15:19:18', '2020-02-08 15:21:51');
INSERT INTO `vehicle` VALUES (40, '孙权', '15044832900', 0, '冀J00002', 0, '2020-02-14 10:43:13', '2021-02-14 10:43:13');
INSERT INTO `vehicle` VALUES (46, '孙权', '15044832900', 0, '蒙LP0832', 0, '2020-02-14 11:32:47', '2021-02-14 11:32:47');
INSERT INTO `vehicle` VALUES (47, '孙权', '15044832900', 0, '川A88888', 0, '2020-02-14 12:45:30', '2021-02-14 12:45:30');
INSERT INTO `vehicle` VALUES (48, '临时用户', NULL, 1, '粤B2058Z', 0, '2020-02-17 14:51:35', NULL);
INSERT INTO `vehicle` VALUES (49, '临时用户', NULL, 1, '浙B2058Z', 0, '2020-02-26 20:51:53', NULL);
INSERT INTO `vehicle` VALUES (50, '临时用户', NULL, 1, '辽B2CCY2', 0, '2020-02-26 20:52:44', NULL);
INSERT INTO `vehicle` VALUES (51, '临时用户', NULL, 1, '贵CV1000', 0, '2020-02-26 20:53:06', NULL);
INSERT INTO `vehicle` VALUES (52, '临时用户', NULL, 1, '苏E9917U', 0, '2020-02-26 20:53:17', NULL);
INSERT INTO `vehicle` VALUES (53, '临时用户', NULL, 1, '鲁A686EJ', 0, '2020-02-26 20:53:28', NULL);
INSERT INTO `vehicle` VALUES (54, '临时用户', NULL, 1, '浙C10098', 0, '2020-02-26 20:53:37', NULL);
INSERT INTO `vehicle` VALUES (55, '临时用户', NULL, 1, '冀EDR134', 0, '2020-02-26 20:53:47', NULL);
INSERT INTO `vehicle` VALUES (56, '临时用户', NULL, 1, '苏BG666P', 0, '2020-02-26 20:54:05', NULL);
INSERT INTO `vehicle` VALUES (57, '临时用户', NULL, 1, '京H44444', 0, '2020-02-26 20:54:19', NULL);
INSERT INTO `vehicle` VALUES (58, '临时用户', NULL, 1, '陕ACT882', 0, '2020-02-26 20:54:35', NULL);
INSERT INTO `vehicle` VALUES (59, '临时用户', NULL, 1, '辽B777FX', 1, '2020-03-02 16:22:00', NULL);
INSERT INTO `vehicle` VALUES (60, '临时用户', NULL, 1, '辽B22CY2', 0, '2020-03-19 17:26:17', '2020-03-19 17:26:36');

-- ----------------------------
-- Table structure for vehiclefares
-- ----------------------------
DROP TABLE IF EXISTS `vehiclefares`;
CREATE TABLE `vehiclefares`  (
  `fareid` int(0) NOT NULL AUTO_INCREMENT,
  `vehiclenumber` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `time` int(0) NOT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `flag` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`fareid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vehiclefares
-- ----------------------------
INSERT INTO `vehiclefares` VALUES (1, '浙B2058Z', 2, 5.00, 0);

-- ----------------------------
-- Table structure for vehiclerole
-- ----------------------------
DROP TABLE IF EXISTS `vehiclerole`;
CREATE TABLE `vehiclerole`  (
  `vehicleroleid` int(0) NOT NULL AUTO_INCREMENT COMMENT '车辆权限id',
  `vehiclerolename` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '车辆权限名称',
  PRIMARY KEY (`vehicleroleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vehiclerole
-- ----------------------------
INSERT INTO `vehiclerole` VALUES (1, '临时用户');
INSERT INTO `vehiclerole` VALUES (2, '普通用户');

SET FOREIGN_KEY_CHECKS = 1;
