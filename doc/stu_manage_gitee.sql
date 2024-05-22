/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 80029
Source Host           : localhost:3306
Source Database       : stu_manage_gitee

Target Server Type    : MYSQL
Target Server Version : 80029
File Encoding         : 65001

Date: 2024-01-24 15:08:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `class_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `class_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `school_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `depart_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `major_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `AdmissionTime` datetime NOT NULL,
  `class_num` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`class_code`),
  KEY `school_id` (`school_id`),
  KEY `major_id` (`major_id`),
  KEY `t_class_ibfk_2` (`depart_id`),
  CONSTRAINT `t_class_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `t_school` (`school_id`),
  CONSTRAINT `t_class_ibfk_2` FOREIGN KEY (`depart_id`) REFERENCES `t_depart` (`depart_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_class_ibfk_3` FOREIGN KEY (`major_id`) REFERENCES `t_major` (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES ('00012021000100021', '清华大学学校2021年级aaa院系工程造价专业1班', '0001', '0001', '0002', '2021-02-02 17:01:02', '1');
INSERT INTO `t_class` VALUES ('00022003000100021', '北京大学学校2003年级aaa院系工程造价专业1班', '0002', '0001', '0002', '2003-11-01 03:00:00', '1');
INSERT INTO `t_class` VALUES ('00022021000100021', '北京大学学校2021年级aaa院系工程造价专业1班', '0002', '0001', '0002', '2021-11-01 03:00:00', '1');
INSERT INTO `t_class` VALUES ('00022023000100021', '北京大学学校2023年级aaa院系工程造价专业1班', '0002', '0001', '0002', '2023-11-01 03:00:00', '1');
INSERT INTO `t_class` VALUES ('1', '1', '0001', '0001', '0002', '2017-07-26 00:38:11', '1');
INSERT INTO `t_class` VALUES ('2', '1', '0001', '0001', '0002', '2017-07-26 00:00:00', '012');

-- ----------------------------
-- Table structure for t_depart
-- ----------------------------
DROP TABLE IF EXISTS `t_depart`;
CREATE TABLE `t_depart` (
  `depart_id` varchar(4) NOT NULL,
  `depart_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `school_id` varchar(4) NOT NULL,
  PRIMARY KEY (`depart_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `t_depart_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `t_school` (`school_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_depart
-- ----------------------------
INSERT INTO `t_depart` VALUES ('0001', 'aaa', '0001');
INSERT INTO `t_depart` VALUES ('0002', 'aa', '0001');
INSERT INTO `t_depart` VALUES ('0003', 'aaa', '0002');
INSERT INTO `t_depart` VALUES ('0004', 'aaaa', '0002');

-- ----------------------------
-- Table structure for t_major
-- ----------------------------
DROP TABLE IF EXISTS `t_major`;
CREATE TABLE `t_major` (
  `major_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `major_name` varchar(50) NOT NULL,
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_major
-- ----------------------------
INSERT INTO `t_major` VALUES ('0002', '工程造价');
INSERT INTO `t_major` VALUES ('0005', 'aadads');

-- ----------------------------
-- Table structure for t_school
-- ----------------------------
DROP TABLE IF EXISTS `t_school`;
CREATE TABLE `t_school` (
  `school_id` varchar(4) NOT NULL,
  `school_name` varchar(25) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_school
-- ----------------------------
INSERT INTO `t_school` VALUES ('0001', '清华大学');
INSERT INTO `t_school` VALUES ('0002', '北京大学');
INSERT INTO `t_school` VALUES ('0003', '中国传媒大学');
INSERT INTO `t_school` VALUES ('0004', '中国人民大学');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `student_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `student_name` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `student_idcard` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` bit(1) NOT NULL,
  `ethnic` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `graduate_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `political` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `class_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `class_code` (`class_code`),
  CONSTRAINT `t_student_ibfk_1` FOREIGN KEY (`class_code`) REFERENCES `t_class` (`class_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('X330326200310247432', '林大庆', '330326200310247432', '', '汉族', '啊啊啊', '啊啊啊', '啊啊啊', '群众', '13032637048', '670b14728ad9902aecba32e22fa4f6bd', '00022023000100021');
INSERT INTO `t_student` VALUES ('X330326200310247433', '林大庆', '330326200310247433', '', '汉族', '啊啊啊', '啊啊啊', '啊啊啊', '群众', '13032637048', '670b14728ad9902aecba32e22fa4f6bd', '00022021000100021');
INSERT INTO `t_student` VALUES ('X330326200310247435', '林大庆', '330326200310247435', '', '汉族', '啊啊啊', '啊啊啊', '啊啊啊', '群众', '13032637048', '670b14728ad9902aecba32e22fa4f6bd', '00022021000100021');
INSERT INTO `t_student` VALUES ('X330326200310247439', '林大庆', '330326200310247439', '', '汉族', '啊啊啊', '啊啊啊', '啊啊啊', '群众', '13032637048', '670b14728ad9902aecba32e22fa4f6bd', '00022021000100021');

-- ----------------------------
-- Table structure for t_stu_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_stu_role_user`;
CREATE TABLE `t_stu_role_user` (
  `student_id` varchar(255) NOT NULL,
  `id` varchar(255) DEFAULT NULL,
  `permisson_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_stu_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_area
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_area`;
CREATE TABLE `t_sys_area` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增列',
  `area_code` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '区代码',
  `city_code` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级市代码',
  `area_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '市名称',
  `short_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '简称',
  `lng` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纬度',
  `sort` int DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `memo` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `data_state` int DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Index_1` (`area_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2014 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='地区设置';

-- ----------------------------
-- Records of t_sys_area
-- ----------------------------
INSERT INTO `t_sys_area` VALUES ('1975', '500101', '500100', '万州区', '万州', '108.380249', '30.807808', '28', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1976', '500102', '500100', '涪陵区', '涪陵', '107.394905', '29.703651', '11', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1977', '500103', '500100', '渝中区', '渝中', '106.562881', '29.556742', '37', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1978', '500104', '500100', '大渡口区', '大渡口', '106.48613', '29.481003', '6', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1979', '500105', '500100', '江北区', '江北', '106.532845', '29.575352', '13', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1980', '500106', '500100', '沙坪坝区', '沙坪坝', '106.454201', '29.541224', '24', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1981', '500107', '500100', '九龙坡区', '九龙坡', '106.480988', '29.523493', '15', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1982', '500108', '500100', '南岸区', '南岸', '106.560814', '29.523993', '18', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1983', '500109', '500100', '北碚区', '北碚', '106.437866', '29.82543', '2', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1984', '500112', '500100', '渝北区', '渝北', '106.512848', '29.601452', '35', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1985', '500113', '500100', '巴南区', '巴南', '106.519424', '29.38192', '1', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1986', '500114', '500100', '黔江区', '黔江', '108.782578', '29.527548', '21', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1987', '500115', '500100', '长寿区', '长寿', '107.074852', '29.833672', '4', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1988', '500222', '500100', '綦江区', '綦江', '106.651421', '29.028091', '22', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1989', '500223', '500100', '潼南县', '潼南', '105.84182', '30.189554', '27', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1990', '500224', '500100', '铜梁县', '铜梁', '106.054947', '29.839945', '26', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1991', '500225', '500100', '大足区', '大足', '105.715317', '29.700499', '7', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1992', '500226', '500100', '荣昌县', '荣昌', '105.594063', '29.403627', '23', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1993', '500227', '500100', '璧山县', '璧山', '106.231125', '29.59358', '3', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1994', '500228', '500100', '梁平县', '梁平', '107.800034', '30.672169', '17', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1995', '500229', '500100', '城口县', '城口', '108.664902', '31.946293', '5', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1996', '500230', '500100', '丰都县', '丰都', '107.732483', '29.866425', '9', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1997', '500231', '500100', '垫江县', '垫江', '107.348694', '30.330011', '8', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1998', '500232', '500100', '武隆县', '武隆', '107.756554', '29.323759', '29', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('1999', '500233', '500100', '忠县', '忠县', '108.037521', '30.291536', '38', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('2000', '500234', '500100', '开县', '开县', '108.413315', '31.167734', '16', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('2001', '500235', '500100', '云阳县', '云阳', '108.697701', '30.930529', '36', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('2002', '500236', '500100', '奉节县', '奉节', '109.465775', '31.019966', '10', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('2003', '500237', '500100', '巫山县', '巫山', '109.878929', '31.074842', '30', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('2004', '500238', '500100', '巫溪县', '巫溪', '109.628914', '31.396601', '31', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('2005', '500240', '500100', '石柱土家族自治县', '石柱', '108.11245', '29.998529', '25', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('2006', '500241', '500100', '秀山土家族苗族自治县', '秀山', '108.99604', '28.444773', '32', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('2007', '500242', '500100', '酉阳土家族苗族自治县', '酉阳', '108.767204', '28.839828', '34', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('2008', '500243', '500100', '彭水苗族土家族自治县', '彭水', '108.16655', '29.293856', '20', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('2009', '500381', '500100', '江津区', '江津', '106.253159', '29.283386', '14', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('2010', '500382', '500100', '合川区', '合川', '106.265556', '29.990993', '12', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('2011', '500383', '500100', '永川区', '永川', '105.894714', '29.348747', '33', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');
INSERT INTO `t_sys_area` VALUES ('2012', '500384', '500100', '南川区', '南川', '107.098152', '29.156647', '19', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');

-- ----------------------------
-- Table structure for t_sys_city
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_city`;
CREATE TABLE `t_sys_city` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增列',
  `city_code` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '市代码',
  `city_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '市名称',
  `short_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '简称',
  `province_code` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省代码',
  `lng` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纬度',
  `sort` int DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `memo` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `data_state` int DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Index_1` (`city_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='城市设置';

-- ----------------------------
-- Records of t_sys_city
-- ----------------------------
INSERT INTO `t_sys_city` VALUES ('255', '500100', '重庆市', '重庆', '500000', '106.504959', '29.533155', '1', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');

-- ----------------------------
-- Table structure for t_sys_department
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_department`;
CREATE TABLE `t_sys_department` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父id',
  `dept_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `leader` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门负责人',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` int DEFAULT NULL COMMENT '状态',
  `order_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of t_sys_department
-- ----------------------------
INSERT INTO `t_sys_department` VALUES ('1', '0', 'v2', 'v2', '13012345678', 'v2@qq.com', '1', '1');
INSERT INTO `t_sys_department` VALUES ('2', '1', '技术部门', 'x某某', '13012345678', 'v2@qq.com', '1', '2');
INSERT INTO `t_sys_department` VALUES ('3', '1', '人事部门', 'a某某', '13012345678', 'v2@qq.com', '1', '3');
INSERT INTO `t_sys_department` VALUES ('4', '2', '开发一小组', 'b某某', '13012345678', 'v2@qq.com', '1', '4');
INSERT INTO `t_sys_department` VALUES ('5', '3', '销售部门', 'd某某', '13012345678', 'v2@qq.com', '1', '5');
INSERT INTO `t_sys_department` VALUES ('6', '5', '销售一组', 'e某某', '13012345678', 'v2@qq.com', '1', '6');

-- ----------------------------
-- Table structure for t_sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict_data`;
CREATE TABLE `t_sys_dict_data` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

-- ----------------------------
-- Records of t_sys_dict_data
-- ----------------------------
INSERT INTO `t_sys_dict_data` VALUES ('331043380933038080', '1', '一般', '1', 'sys_notice_type', '', 'info', 'Y', '0', 'admin', '2019-09-09 22:15:03', 'admin', '2019-09-09 22:15:43', '');
INSERT INTO `t_sys_dict_data` VALUES ('331043525137403904', '2', '重要', '2', 'sys_notice_type', '', 'important', 'N', '0', 'admin', '2019-09-09 22:15:37', 'admin', '2020-12-27 13:57:22', '');
INSERT INTO `t_sys_dict_data` VALUES ('340080322395901952', '1', '开启', '0', 'sys_province_state', '', 'info', 'Y', '0', 'admin', '2019-10-04 20:44:37', 'admin', '2019-10-04 20:46:41', '');
INSERT INTO `t_sys_dict_data` VALUES ('340080779201744896', '2', '关闭', '-1', 'sys_province_state', '', 'important', 'N', '0', 'admin', '2019-10-04 20:46:26', 'admin', '2020-12-27 13:57:46', '');
INSERT INTO `t_sys_dict_data` VALUES ('373494384659927040', '0', 'GET请求', '1', 'sys_inter_url_type', '', 'primary', 'Y', '0', 'admin', '2020-01-05 01:40:11', 'admin', '2020-12-27 14:27:28', '');
INSERT INTO `t_sys_dict_data` VALUES ('373494483465146368', '1', 'POST请求', '2', 'sys_inter_url_type', '', 'info', 'N', '0', 'admin', '2020-01-05 01:40:34', 'admin', '2020-12-27 14:26:59', '');
INSERT INTO `t_sys_dict_data` VALUES ('506431838588375040', '0', 'DELETE请求', '3', 'sys_inter_url_type', '', 'default', 'N', '0', 'admin', '2021-01-05 13:46:10', 'admin', '2021-01-05 13:48:43', '');
INSERT INTO `t_sys_dict_data` VALUES ('506432620712824832', '0', 'PUT请求', '4', 'sys_inter_url_type', '', 'default', 'N', '0', 'admin', '2021-01-05 13:49:16', 'admin', '2021-01-05 13:49:20', '');
INSERT INTO `t_sys_dict_data` VALUES ('563746747239763968', '0', '微信', '1', 'payment_type', '', 'default', 'Y', '0', 'admin', '2021-06-12 17:35:09', 'admin', '2021-06-12 17:37:14', '');
INSERT INTO `t_sys_dict_data` VALUES ('563746783184949248', '0', '支付宝', '2', 'payment_type', '', 'default', 'Y', '0', 'admin', '2021-06-12 17:35:17', 'admin', '2021-06-12 17:37:18', '');
INSERT INTO `t_sys_dict_data` VALUES ('563746818496794624', '0', '水滴筹', '3', 'payment_type', '', 'default', 'Y', '0', 'admin', '2021-06-12 17:35:26', 'admin', '2021-06-12 17:37:21', '');
INSERT INTO `t_sys_dict_data` VALUES ('563747125104611328', '0', '火锅底料', '1', 'gift_type', '', 'default', 'Y', '0', 'admin', '2021-06-12 17:36:39', 'admin', '2021-06-12 17:36:50', '');
INSERT INTO `t_sys_dict_data` VALUES ('563747405598691328', '0', '冒菜底料', '2', 'gift_type', '', 'default', 'Y', '0', 'admin', '2021-06-12 17:37:46', '', '2021-06-12 17:37:46', '');
INSERT INTO `t_sys_dict_data` VALUES ('563747459235450880', '0', '重庆小面佐料', '3', 'gift_type', '', 'default', 'Y', '0', 'admin', '2021-06-12 17:37:58', '', '2021-06-12 17:37:58', '');
INSERT INTO `t_sys_dict_data` VALUES ('563747480336994304', '0', '其他', '4', 'gift_type', '', 'default', 'Y', '0', 'admin', '2021-06-12 17:38:03', '', '2021-06-12 17:38:03', '');
INSERT INTO `t_sys_dict_data` VALUES ('571366029360500736', '0', '是', '1', 'yes_or_no', '', 'default', 'Y', '0', 'admin', '2021-07-03 18:11:27', '', '2021-07-03 18:11:27', '');
INSERT INTO `t_sys_dict_data` VALUES ('571366105029939200', '0', '否', '-1', 'yes_or_no', '', 'info', 'Y', '0', 'admin', '2021-07-03 18:11:45', '', '2021-07-03 18:11:45', '');

-- ----------------------------
-- Table structure for t_sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict_type`;
CREATE TABLE `t_sys_dict_type` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

-- ----------------------------
-- Records of t_sys_dict_type
-- ----------------------------
INSERT INTO `t_sys_dict_type` VALUES ('340079827459641344', '省份状态', 'sys_province_state', '0', 'admin', '2019-10-04 20:42:39', '', '2019-10-04 20:42:39', '省份状态');
INSERT INTO `t_sys_dict_type` VALUES ('373493952487231488', '拦截器类型', 'sys_inter_url_type', '0', 'admin', '2020-01-05 01:38:28', 'admin', '2020-03-29 23:23:43', '拦截器类型');
INSERT INTO `t_sys_dict_type` VALUES ('563746635880992768', '捐款类型', 'payment_type', '0', 'admin', '2021-06-12 17:34:42', '', '2021-06-12 17:34:42', '');
INSERT INTO `t_sys_dict_type` VALUES ('563747016396640256', '礼物类型', 'gift_type', '0', 'admin', '2021-06-12 17:36:13', '', '2021-06-12 17:36:13', '');
INSERT INTO `t_sys_dict_type` VALUES ('571365854613213184', '是与否', 'yes_or_no', '0', 'admin', '2021-07-03 18:10:45', '', '2021-07-03 18:10:45', '用于select');
INSERT INTO `t_sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-12-27 14:26:42', '通知类型列表');

-- ----------------------------
-- Table structure for t_sys_email
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_email`;
CREATE TABLE `t_sys_email` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `receivers_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '接收人电子邮件',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '邮件标题',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8_bin COMMENT '内容',
  `send_user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '发送人id',
  `send_user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '发送人账号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='电子邮件';

-- ----------------------------
-- Records of t_sys_email
-- ----------------------------
INSERT INTO `t_sys_email` VALUES ('503928650819833856', '87766867@qq.com', '87766867@qq.com', 0x666666666666663C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F64656D6F2F7374617469632F636F6D706F6E656E742F6C617975692F696D616765732F666163652F32322E6769662220616C743D225BE5A794E5B1885D223E, '1', 'admin', '2020-12-29 15:59:23');
INSERT INTO `t_sys_email` VALUES ('503928914918379520', '87766867@qq.com', '87766867@qq.com', 0x737373737373667364667364667364663C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F64656D6F2F7374617469632F636F6D706F6E656E742F6C617975692F696D616765732F666163652F34322E6769662220616C743D225BE68A93E78B825D223E3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383038302F64656D6F2F7374617469632F636F6D706F6E656E742F6C617975692F696D616765732F666163652F37312E6769662220616C743D225BE89B8BE7B3955D223E, '1', 'admin', '2020-12-29 16:00:26');
INSERT INTO `t_sys_email` VALUES ('595001021625794560', '87766867@qq.com', 'springbootv2测试邮件', 0x3C703EE6B58BE8AF95E6B58BE6B58BE6B58B3C2F703E, '1', 'admin', '2019-06-30 21:21:38');
INSERT INTO `t_sys_email` VALUES ('899477751780741120', 'l2739606014@163.com', 'l2739606014@163.com', 0xE5958AE5958AE5958A, '889473232044953600', 'admin', '2023-12-26 04:10:18');
INSERT INTO `t_sys_email` VALUES ('899477792872337408', 'l2739606014@163.com', 'l2739606014@163.com', 0xE5958AE5958AE5958A, '889473232044953600', 'admin', '2023-12-26 04:10:28');
INSERT INTO `t_sys_email` VALUES ('899479157707247616', '2739606014@qq.com', '2739606014@qq.com', 0x616161, '889473232044953600', 'admin', '2023-12-26 04:15:53');
INSERT INTO `t_sys_email` VALUES ('899479180008361984', '2739606014@qq.com', '2739606014@qq.com', 0x616161, '889473232044953600', 'admin', '2023-12-26 04:15:58');
INSERT INTO `t_sys_email` VALUES ('899481895065227264', '2739606014@qq.com', '2739606014@qq.com', 0xE5958AE5958AE5958A, '889473232044953600', 'admin', '2023-12-26 04:26:46');
INSERT INTO `t_sys_email` VALUES ('899482391935062016', '2739606014@qq.com', '2739606014@qq.com', 0x616161, '889473232044953600', 'admin', '2023-12-26 04:28:44');

-- ----------------------------
-- Table structure for t_sys_file
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_file`;
CREATE TABLE `t_sys_file` (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `file_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '文件名字',
  `bucket_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '桶名',
  `file_size` bigint DEFAULT NULL COMMENT '文件大小',
  `file_suffix` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '后缀',
  `create_user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人名字',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人名字',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='文件信息表';

-- ----------------------------
-- Records of t_sys_file
-- ----------------------------
INSERT INTO `t_sys_file` VALUES ('503885495013609472', '503895116063313920.png', 'v2-cloud', '48831', 'image/png', '1', 'admin', '2020-12-29 13:07:54', '1', 'admin', '2020-12-29 13:46:08');
INSERT INTO `t_sys_file` VALUES ('503885528857448448', '503895039806672896.png', 'v2-cloud', '71460', 'image/png', '1', 'admin', '2020-12-29 13:08:02', '1', 'admin', '2020-12-29 13:45:50');

-- ----------------------------
-- Table structure for t_sys_inter_url
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_inter_url`;
CREATE TABLE `t_sys_inter_url` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `inter_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '拦截名称',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '拦截url',
  `type` int DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='拦截url表';

-- ----------------------------
-- Records of t_sys_inter_url
-- ----------------------------
INSERT INTO `t_sys_inter_url` VALUES ('411495038321823744', '字典表新增', '/DictDataController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506433268967673856', '字典表修改', '/DictDataController/edit', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506434978159136768', '字典表删除', '/DictDataController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506435565655298048', '字典表状态修改', '/DictDataController/updateDefault', '4');
INSERT INTO `t_sys_inter_url` VALUES ('506435921147727872', '字典表状态修改2', '/DictDataController/updateEnable', '4');
INSERT INTO `t_sys_inter_url` VALUES ('506436031403397120', '字典表类型新增', '/DictTypeController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506436148680331264', '字典表类型修改', '/DictTypeController/edit', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506436165776314368', '字典表类型删除', '/DictTypeController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506436180578013184', '字典表类型状态修改', '/DictTypeController/updateEnable', '4');
INSERT INTO `t_sys_inter_url` VALUES ('506436662134444032', '邮件新增', '/EmailController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506436757722632192', '邮件删除', '/EmailController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506437010966319104', '日志删除', '/LogController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506437420099702784', 'oss新增', '/oss/bucket/', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506437439112482816', 'oss删除', '/oss/bucket/', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506437964436475904', '权限新增', '/PermissionController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506438040823140352', '权限保存', '/PermissionController/edit', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506438121399914496', '权限删除', '/PermissionController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506438208599494656', '权限授权', '/PermissionController/saveRolePower', '4');
INSERT INTO `t_sys_inter_url` VALUES ('506438306276446208', '权限状态修改', '/PermissionController/updateVisible', '4');
INSERT INTO `t_sys_inter_url` VALUES ('506438447226032128', '定时器新增', '/SysQuartzJobController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506438589874311168', ' 任务调度状态修改', '/SysQuartzJobController/changeStatus', '4');
INSERT INTO `t_sys_inter_url` VALUES ('506438725388079104', '定时器保存', '/SysQuartzJobController/edit', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506438870959788032', '定时器修改', '/SysQuartzJobController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506439003516571648', '定时任务日志删除', '/SysQuartzJobLogController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506439171481669632', '角色新增', '/RoleController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506439186778296320', '角色修改', '/RoleController/edit', '4');
INSERT INTO `t_sys_inter_url` VALUES ('506439297122045952', '角色删除', '/RoleController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506439669773373440', '地区新增', '/SysAreaController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506439687859212288', '地区修改', '/SysAreaController/edit', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506439835490324480', '地区删除', '/SysAreaController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506440103976112128', 'City新增', '/SysCityController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506440145147400192', 'City修改', ' /SysCityController/edit', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506440217188765696', 'City删除', '/SysCityController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506440386873528320', '部门新增', '/SysDepartmentController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506440448223612928', '部门修改', '/SysDepartmentController/edit', '4');
INSERT INTO `t_sys_inter_url` VALUES ('506440515110178816', '部门删除', '/SysDepartmentController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506440574635741184', '部门状态', '/SysDepartmentController/updateVisible', '4');
INSERT INTO `t_sys_inter_url` VALUES ('506440668508459008', '拦截器url新增', '/SysInterUrlController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506440708056551424', '拦截器url修改', '/SysInterUrlController/edit', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506440802856210432', '拦截器url删除', '/SysInterUrlController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506441001783660544', '公告新增', '/SysNoticeController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506441051263864832', '公告修改', '/SysNoticeController/edit', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506441105743679488', '公告删除', '/SysNoticeController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506441242591236096', '职位新增', '/SysPositionController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506441287038275584', '职位修改', '/SysPositionController/edit', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506441350200299520', '职位删除', '/SysPositionController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506441420677189632', '职位状态修改', '/SysPositionController/updateVisible', '4');
INSERT INTO `t_sys_inter_url` VALUES ('506441780003213312', '省份新增', '/SysProvinceController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506441807383629824', '省份修改', '/SysProvinceController/edit', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506441871850082304', '省份删除', '/SysProvinceController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506441980012793856', '街道新增', '/SysStreetController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506442015706320896', '街道修改', '/SysStreetController/edit', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506442092445306880', '街道删除', '/SysStreetController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506442186552905728', '用户新增', '/UserController/add', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506442212696002560', '用户修改', '/UserController/edit', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506442271252680704', '用户修改密码', '/UserController/editPwd', '2');
INSERT INTO `t_sys_inter_url` VALUES ('506442344443285504', '用户删除', '/UserController/remove', '3');
INSERT INTO `t_sys_inter_url` VALUES ('506444610625736704', '拦截器url复制', '/SysInterUrlController/copy/', '3');

-- ----------------------------
-- Table structure for t_sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_notice`;
CREATE TABLE `t_sys_notice` (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `type` int DEFAULT NULL COMMENT '类型',
  `create_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人id',
  `create_username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人name',
  `create_time` datetime DEFAULT NULL COMMENT '发信时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='公告';

-- ----------------------------
-- Records of t_sys_notice
-- ----------------------------
INSERT INTO `t_sys_notice` VALUES ('330381411007729664', '测试公告', '<p>啊啊啊<img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/></p>', '1', '1', 'admin', '2019-09-08 02:24:37');
INSERT INTO `t_sys_notice` VALUES ('330381806358630400', '鲜花视频', '<p>哈哈哈哈<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/></p>', '2', '1', 'admin', '2019-09-08 02:26:11');

-- ----------------------------
-- Table structure for t_sys_notice_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_notice_user`;
CREATE TABLE `t_sys_notice_user` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `notice_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公告id',
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `state` int DEFAULT NULL COMMENT '0未阅读 1 阅读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='公告_用户外键';

-- ----------------------------
-- Records of t_sys_notice_user
-- ----------------------------
INSERT INTO `t_sys_notice_user` VALUES ('330381411037089792', '330381411007729664', '1', '1');
INSERT INTO `t_sys_notice_user` VALUES ('330381411045478400', '330381411007729664', '488294747442511872', '0');
INSERT INTO `t_sys_notice_user` VALUES ('330381806375407616', '330381806358630400', '1', '1');
INSERT INTO `t_sys_notice_user` VALUES ('330381806379601920', '330381806358630400', '488294747442511872', '0');
INSERT INTO `t_sys_notice_user` VALUES ('330622143622680576', '330622143597514752', '1', '1');
INSERT INTO `t_sys_notice_user` VALUES ('330622143626874880', '330622143597514752', '488294747442511872', '0');
INSERT INTO `t_sys_notice_user` VALUES ('354984345649418240', '354984345632641024', '1', '1');
INSERT INTO `t_sys_notice_user` VALUES ('373478037158760448', '373478036928073728', '1', '1');
INSERT INTO `t_sys_notice_user` VALUES ('373478037162954752', '373478036928073728', '368026921239449600', '0');
INSERT INTO `t_sys_notice_user` VALUES ('373478037171343360', '373478036928073728', '368026937181999104', '0');
INSERT INTO `t_sys_notice_user` VALUES ('373478037175537664', '373478036928073728', '368027013392502784', '0');
INSERT INTO `t_sys_notice_user` VALUES ('373478037183926272', '373478036928073728', '368027030899527680', '0');
INSERT INTO `t_sys_notice_user` VALUES ('373478037192314880', '373478036928073728', '368027048402358272', '0');
INSERT INTO `t_sys_notice_user` VALUES ('373478037204897792', '373478036928073728', '368027066563694592', '0');
INSERT INTO `t_sys_notice_user` VALUES ('373478037213286400', '373478036928073728', '368027087866564608', '0');
INSERT INTO `t_sys_notice_user` VALUES ('373478037217480704', '373478036928073728', '368027104895438848', '0');
INSERT INTO `t_sys_notice_user` VALUES ('373478037225869312', '373478036928073728', '368027130728157184', '0');
INSERT INTO `t_sys_notice_user` VALUES ('373478037230063616', '373478036928073728', '368027151624179712', '0');
INSERT INTO `t_sys_notice_user` VALUES ('373478037238452224', '373478036928073728', '368382463233363968', '0');
INSERT INTO `t_sys_notice_user` VALUES ('502750147499921408', '502750147395063808', '1', '0');
INSERT INTO `t_sys_notice_user` VALUES ('502750147508310016', '502750147395063808', '433236479427350528', '0');
INSERT INTO `t_sys_notice_user` VALUES ('502758207983325184', '502758207907827712', '1', '0');
INSERT INTO `t_sys_notice_user` VALUES ('502758207991713792', '502758207907827712', '433236479427350528', '0');
INSERT INTO `t_sys_notice_user` VALUES ('502820822130495488', '502820822042415104', '1', '0');
INSERT INTO `t_sys_notice_user` VALUES ('502820822138884096', '502820822042415104', '433236479427350528', '0');

-- ----------------------------
-- Table structure for t_sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_oper_log`;
CREATE TABLE `t_sys_oper_log` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '方法',
  `oper_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT 'url',
  `oper_param` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '参数',
  `error_msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `oper_time` date DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='日志记录表';

-- ----------------------------
-- Records of t_sys_oper_log
-- ----------------------------
INSERT INTO `t_sys_oper_log` VALUES ('354984005894017024', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"admin22\"],\"password\":[\"admin22\"],\"nickname\":[\"222\"],\"roles\":[\"488243256161730560\"]}', null, '2019-11-14');
INSERT INTO `t_sys_oper_log` VALUES ('354988722611163136', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"admin222\"],\"password\":[\"admin22\"],\"nickname\":[\"22222\"],\"roles\":[\"488243256161730560\"]}', null, '2019-11-15');
INSERT INTO `t_sys_oper_log` VALUES ('354989789822455808', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"admin33\"],\"password\":[\"admin33\"],\"nickname\":[\"333\"],\"roles\":[\"488305788310257664\"]}', null, '2019-11-15');
INSERT INTO `t_sys_oper_log` VALUES ('368026921411416064', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"admin1\"],\"password\":[\"admin1\"],\"nickname\":[\"\"]}', null, '2019-12-20');
INSERT INTO `t_sys_oper_log` VALUES ('368026937215553536', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"admin2\"],\"password\":[\"admin2\"],\"nickname\":[\"\"]}', null, '2019-12-20');
INSERT INTO `t_sys_oper_log` VALUES ('368026972204437504', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"33333\"],\"password\":[\"3333333\"],\"nickname\":[\"333\"]}', null, '2019-12-20');
INSERT INTO `t_sys_oper_log` VALUES ('368027013421862912', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"44\"],\"password\":[\"444444\"],\"nickname\":[\"444\"]}', null, '2019-12-20');
INSERT INTO `t_sys_oper_log` VALUES ('368027030928887808', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"5555555\"],\"password\":[\"555555555555\"],\"nickname\":[\"5555555555555\"]}', null, '2019-12-20');
INSERT INTO `t_sys_oper_log` VALUES ('368027048427524096', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"66\"],\"password\":[\"666666666\"],\"nickname\":[\"6666666666\"]}', null, '2019-12-20');
INSERT INTO `t_sys_oper_log` VALUES ('368027066593054720', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"2222\"],\"password\":[\"222222222\"],\"nickname\":[\"2222222222222222\"]}', null, '2019-12-20');
INSERT INTO `t_sys_oper_log` VALUES ('368027087887536128', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"4444\"],\"password\":[\"44444444444444\"],\"nickname\":[\"44444444444\"]}', null, '2019-12-20');
INSERT INTO `t_sys_oper_log` VALUES ('368027104924798976', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"5555\"],\"password\":[\"55555555555555\"],\"nickname\":[\"555555555555\"]}', null, '2019-12-20');
INSERT INTO `t_sys_oper_log` VALUES ('368027130757517312', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"666\"],\"password\":[\"66666666666\"],\"nickname\":[\"666666666\"]}', null, '2019-12-20');
INSERT INTO `t_sys_oper_log` VALUES ('368027151649345536', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"33333333333333\"],\"password\":[\"333333333333\"],\"nickname\":[\"33333333333333\"]}', null, '2019-12-20');
INSERT INTO `t_sys_oper_log` VALUES ('368382463388553216', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"adminpppoooo\"],\"password\":[\"adminppp\"],\"nickname\":[\"pppppppppp\"]}', null, '2019-12-21');
INSERT INTO `t_sys_oper_log` VALUES ('433236479515430912', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"fuce\"],\"password\":[\"111111\"],\"nickname\":[\"fuce\"]}', null, '2020-06-17');
INSERT INTO `t_sys_oper_log` VALUES ('495560243967823872', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"手动阀手动阀\"],\"password\":[\"123456\"],\"nickname\":[\"手动阀手动阀\"],\"depId\":[\"3\"],\"positionId\":[\"411477874382606336\"]}', null, '2020-12-06');
INSERT INTO `t_sys_oper_log` VALUES ('495570972590608384', '用户新增', 'com.fc.test.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"何平\"],\"password\":[\"111111\"],\"nickname\":[\"手动阀手动阀\"],\"depId\":[\"4\"],\"posId\":[\"410792443127140352\"]}', null, '2020-12-06');
INSERT INTO `t_sys_oper_log` VALUES ('501769007083425792', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{}', '', '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501772647076597760', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{}', '', '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501775645991374848', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{}', '', '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501776479886118912', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{}', '', '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501779375067369472', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{}', '', '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501779625379237888', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{}', '', '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501780125961031680', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{}', '', '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501782630312841216', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"eeee\"],\"password\":[\"eeeeee\"],\"nickname\":[\"eeeeeeee\"],\"depId\":[\"1\"],\"selectParent_select_input\":[\"v2\"],\"posId\":[\"410792368778907648\"],\"roleIds\":[\"488243256161730560,488289006124007424\"]}', null, '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501783503843758080', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"55555\"],\"password\":[\"5555\"],\"nickname\":[\"555555\"],\"depId\":[\"1\"],\"selectParent_select_input\":[\"v2\"],\"posId\":[\"410792368778907648\"],\"roleIds\":[\"488243256161730560,488289006124007424\"]}', null, '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501783738078859264', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"3\"],\"password\":[\"33333333\"],\"nickname\":[\"3333333333333333333\"],\"depId\":[\"3\"],\"selectParent_select_input\":[\"人事部门\"],\"posId\":[\"410792443127140352\"],\"roleIds\":[\"488289006124007424\"]}', null, '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501786177666420736', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"eeee\"],\"password\":[\"eee\"],\"nickname\":[\"eeeee\"],\"depId\":[\"1\"],\"selectParent_select_input\":[\"v2\"],\"posId\":[\"410792478929719296\"],\"roleIds\":[\"488243256161730560,488289006124007424,488305788310257664\"]}', null, '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501786241449201664', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"r\"],\"password\":[\"rrrrrrrrrrr\"],\"nickname\":[\"rrrrrrrrr\"],\"depId\":[\"1\"],\"selectParent_select_input\":[\"v2\"],\"posId\":[\"410792368778907648\"],\"roleIds\":[\"488243256161730560,488289006124007424,488305788310257664\"]}', null, '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501786725912285184', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"rrrrr\"],\"password\":[\"rrrrrrrrrrrrrr\"],\"nickname\":[\"rrrrrrrrrrrrrr\"],\"depId\":[\"3\"],\"selectParent_select_input\":[\"人事部门\"],\"posId\":[\"410792478929719296\"],\"roleIds\":[\"488243256161730560,488289006124007424\"]}', null, '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501787814850072576', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"rrrrrwwww\"],\"password\":[\"rrrrrrrrrrrrr\"],\"nickname\":[\"rrrrrrrrrrrrrrrrrr\"],\"depId\":[\"1\"],\"selectParent_select_input\":[\"v2\"],\"posId\":[\"410792368778907648\"],\"roleIds\":[\"\"]}', null, '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501787928188555264', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"yyyy\"],\"password\":[\"yyyyyyyyyyyyy\"],\"nickname\":[\"yyyyyyyyyyyyyy\"],\"depId\":[\"5\"],\"selectParent_select_input\":[\"销售部门\"],\"posId\":[\"410792478929719296\"],\"roleIds\":[\"488243256161730560,488289006124007424,488305788310257664\"]}', null, '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501796773694672896', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"tttt\"],\"password\":[\"ttt\"],\"nickname\":[\"tttttt\"],\"depId\":[\"4\"],\"selectParent_select_input\":[\"开发一小组\"],\"posId\":[\"410792443127140352\"],\"roleIds\":[\"488243256161730560,488305788310257664\"]}', null, '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501985140440961024', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"admin\"],\"password\":[\"admin\"],\"nickname\":[\"11111111111\"],\"depId\":[\"1\"],\"selectParent_select_input\":[\"v2\"],\"posId\":[\"410792368778907648\"],\"roleIds\":[\"488289006124007424,488305788310257664\"]}', null, '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('501986656363089920', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"admin\"],\"password\":[\"admin\"],\"nickname\":[\"admin\"],\"depId\":[\"1\"],\"selectParent_select_input\":[\"v2\"],\"posId\":[\"410792368778907648\"],\"roleIds\":[\"488289006124007424,488305788310257664\"]}', null, '2020-12-24');
INSERT INTO `t_sys_oper_log` VALUES ('889178268253687808', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"aa\"],\"password\":[\"aa\"],\"posId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-27');
INSERT INTO `t_sys_oper_log` VALUES ('889178358460583936', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"aa\"],\"password\":[\"aa\"],\"posId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-27');
INSERT INTO `t_sys_oper_log` VALUES ('889179980750262272', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"aa\"],\"password\":[\"aa\"],\"schoolId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-27');
INSERT INTO `t_sys_oper_log` VALUES ('889183822862749696', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"admin\"],\"password\":[\"admin\"],\"schoolId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-27');
INSERT INTO `t_sys_oper_log` VALUES ('889185630477750272', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"admi\"],\"password\":[\"admi\"],\"schoolId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-27');
INSERT INTO `t_sys_oper_log` VALUES ('889462860751704064', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"aa\"],\"password\":[\"aa\"],\"schoolId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('889465268160565248', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"aa\"],\"password\":[\"aa\"],\"schoolId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('889467004237516800', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"aa\"],\"password\":[\"aa\"],\"schoolId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('889467231497490432', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"aa\"],\"password\":[\"aa\"],\"schoolId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('889468067384528896', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"aaaa\"],\"password\":[\"aa\"],\"schoolId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('889468758245117952', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"aa\"],\"password\":[\"aa\"],\"schoolId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('889469149443657728', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"aaa\"],\"password\":[\"aaa\"],\"schoolId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('889470196870418432', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"aa\"],\"password\":[\"aa\"],\"schoolId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('889472178192519168', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"dsadsa\"],\"password\":[\"dsadsa\"],\"schoolId\":[\"0001\"],\"roleIds\":[\"\"]}', null, '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('889472330147958784', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"dsadsaa\"],\"password\":[\"dsadsa\"],\"schoolId\":[\"0001\"],\"role\":[\"889175176154058752\"]}', '', '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('889472809498185728', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"dsadsad\"],\"password\":[\"ddd\"],\"schoolId\":[\"0001\"],\"role\":[\"889175176154058752\"]}', null, '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('889473232078508032', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"admin\"],\"password\":[\"admin\"],\"schoolId\":[\"0001\"],\"role\":[\"889175176154058752\"]}', null, '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('889473289553055744', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"wow\"],\"password\":[\"wow\"],\"schoolId\":[\"0001\"],\"role\":[\"889175176154058752\"]}', null, '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('889485263791853568', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"qinghua\"],\"password\":[\"qinghua\"],\"schoolId\":[\"0002\"],\"role\":[\"488243256161730560\"]}', null, '2023-11-28');
INSERT INTO `t_sys_oper_log` VALUES ('895089152377360384', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"ll\"],\"password\":[\"ll\"],\"schoolId\":[\"0001\"],\"role\":[\"889175176154058752\"]}', null, '2023-12-14');
INSERT INTO `t_sys_oper_log` VALUES ('898006809011425280', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'admin', '/UserController/add', '{\"username\":[\"ca\"],\"password\":[\"ca\"],\"schoolId\":[\"0001\"],\"role\":[\"488243256161730560\"]}', null, '2023-12-22');
INSERT INTO `t_sys_oper_log` VALUES ('899587280925233152', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'X330326200310247439', '/UserController/add', '{\"username\":[\"root\"],\"password\":[\"root\"],\"schoolId\":[\"0001\"],\"role\":[\"889175176154058752\"]}', null, '2023-12-26');
INSERT INTO `t_sys_oper_log` VALUES ('904526330610192384', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'root', '/UserController/add', '{\"username\":[\"beijing\"],\"password\":[\"beijing\"],\"schoolId\":[\"0002\"],\"role\":[\"488243256161730560\"]}', null, '2024-01-09');
INSERT INTO `t_sys_oper_log` VALUES ('904526745678516224', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'root', '/UserController/add', '{\"username\":[\"qinghua\"],\"password\":[\"qinghua\"],\"schoolId\":[\"0001\"],\"role\":[\"488243256161730560\"]}', null, '2024-01-09');
INSERT INTO `t_sys_oper_log` VALUES ('904529947685687296', '用户新增', 'com.fc.v2.controller.admin.UserController.add()', 'root', '/UserController/add', '{\"username\":[\"qinghua\"],\"password\":[\"qinghua\"],\"schoolId\":[\"0001\"],\"role\":[\"488243256161730560\"]}', null, '2024-01-09');

-- ----------------------------
-- Table structure for t_sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_permission`;
CREATE TABLE `t_sys_permission` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限名称',
  `descripion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限描述',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '授权链接',
  `is_blank` int DEFAULT '0' COMMENT '是否跳转 0 不跳转 1跳转',
  `pid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父节点id',
  `perms` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限标识',
  `type` int DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标',
  `order_num` int DEFAULT NULL COMMENT '排序',
  `visible` int DEFAULT NULL COMMENT '是否可见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='权限表';

-- ----------------------------
-- Records of t_sys_permission
-- ----------------------------
INSERT INTO `t_sys_permission` VALUES ('10', '角色集合', '角色集合', '/RoleController/list', '0', '9', 'system:role:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('11', '角色添加', '角色添加', '/RoleController/add', '0', '9', 'system:role:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('12', '角色删除', '角色删除', '/RoleController/remove', '0', '9', 'system:role:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('13', '角色修改', '角色修改', '/RoleController/edit', '0', '9', 'system:role:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('14', '权限展示', '权限展示', '/PermissionController/view', '0', '411522822607867904', 'system:permission:view', '1', 'fa fa-key', '3', '0');
INSERT INTO `t_sys_permission` VALUES ('15', '权限集合', '权限集合', '/PermissionController/list', '0', '14', 'system:permission:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('16', '权限添加', '权限添加', '/permissionController/add', '0', '14', 'system:permission:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('17', '权限删除', '权限删除', '/PermissionController/remove', '0', '14', 'system:permission:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('18', '权限修改', '权限修改', '/PermissionController/edit', '0', '14', 'system:permission:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('19', '文件管理', '文件管理', '/FileController/view', '0', '592059865673760768', 'system:file:view', '1', 'fa fa-file-image-o', '4', '0');
INSERT INTO `t_sys_permission` VALUES ('20', '文件添加', '文件添加', '/FileController/add', '0', '19', 'system:file:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('21', '文件删除', '文件删除', '/FileController/remove', '0', '19', 'system:file:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('22', '文件修改', '文件修改', '/FileController/edit', '0', '19', 'system:file:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('23', '文件集合', '文件集合', '/FileController/list', '0', '19', 'system:file:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('330365026642825216', '公告管理', '公告展示', '/SysNoticeController/view', '0', '592059865673760768', 'gen:sysNotice:view', '1', 'fa fa-telegram', '10', '0');
INSERT INTO `t_sys_permission` VALUES ('3303650266428252171', '公告集合', '公告集合', '/SysNoticeController/list', '0', '330365026642825216', 'gen:sysNotice:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3303650266428252182', '公告添加', '公告添加', '/SysNoticeController/add', '0', '330365026642825216', 'gen:sysNotice:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3303650266428252193', '公告删除', '公告删除', '/SysNoticeController/remove', '0', '330365026642825216', 'gen:sysNotice:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3303650266428252204', '公告修改', '公告修改', '/SysNoticeController/edit', '0', '330365026642825216', 'gen:sysNotice:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('331778807298134016', '定时器表达式', null, 'https://www.bejson.com/othertools/cron/', '1', '617766548966211584', '#', '1', 'layui-icon fa fa-flash', '12', '0');
INSERT INTO `t_sys_permission` VALUES ('332157860920299520', '定时任务', '定时任务调度表展示', '/SysQuartzJobController/view', '0', '592059865673760768', 'gen:sysQuartzJob:view', '1', 'fa fa-hourglass-1', '13', '0');
INSERT INTO `t_sys_permission` VALUES ('3321578609202995211', '定时任务调度表集合', '定时任务调度表集合', '/SysQuartzJobController/list', '0', '332157860920299520', 'gen:sysQuartzJob:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3321578609202995222', '定时任务调度表添加', '定时任务调度表添加', '/SysQuartzJobController/add', '0', '332157860920299520', 'gen:sysQuartzJob:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3321578609202995233', '定时任务调度表删除', '定时任务调度表删除', '/SysQuartzJobController/remove', '0', '332157860920299520', 'gen:sysQuartzJob:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3321578609202995244', '定时任务调度表修改', '定时任务调度表修改', '/SysQuartzJobController/edit', '0', '332157860920299520', 'gen:sysQuartzJob:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('332857281479839744', '定时任务日志', '定时任务日志', '/SysQuartzJobLogController/view', '0', '592059865673760768', 'gen:sysQuartzJobLog:view', '1', 'fa fa-database', '14', '0');
INSERT INTO `t_sys_permission` VALUES ('3328572814798397451', '定时任务调度日志表集合', '定时任务调度日志表集合', '/SysQuartzJobLogController/list', '0', '332857281479839744', 'gen:sysQuartzJobLog:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3328572814798397473', '定时任务调度日志表删除', '定时任务调度日志表删除', '/SysQuartzJobLogController/remove', '0', '332857281479839744', 'gen:sysQuartzJobLog:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('335330315113467904', 'Json工具', null, 'https://www.bejson.com/jsonviewernew/', '1', '617766548966211584', '#', '1', 'layui-icon fa fa-retweet', '10', '0');
INSERT INTO `t_sys_permission` VALUES ('340067579836108800', '省份管理', null, '', '0', '0', '', '0', 'layui-icon layui-icon layui-icon-website', '4', '0');
INSERT INTO `t_sys_permission` VALUES ('340068151804956672', '省份表管理', '省份表展示', '/SysProvinceController/view', '0', '340067579836108800', 'gen:sysProvince:view', '1', 'fa fa-quora', '2', '0');
INSERT INTO `t_sys_permission` VALUES ('3400681518049566731', '省份表集合', '省份表集合', '/SysProvinceController/list', '0', '340068151804956672', 'gen:sysProvince:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3400681518049566742', '省份表添加', '省份表添加', '/SysProvinceController/add', '0', '340068151804956672', 'gen:sysProvince:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3400681518049566753', '省份表删除', '省份表删除', '/SysProvinceController/remove', '0', '340068151804956672', 'gen:sysProvince:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3400681518049566764', '省份表修改', '省份表修改', '/SysProvinceController/edit', '0', '340068151804956672', 'gen:sysProvince:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('340088022018166784', '城市表管理', '城市设置展示', '/SysCityController/view', '0', '340067579836108800', 'gen:sysCity:view', '1', 'fa fa-quora', '3', '0');
INSERT INTO `t_sys_permission` VALUES ('3400880220181667851', '城市设置集合', '城市设置集合', '/SysCityController/list', '0', '340088022018166784', 'gen:sysCity:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3400880220181667862', '城市设置添加', '城市设置添加', '/SysCityController/add', '0', '340088022018166784', 'gen:sysCity:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3400880220181667873', '城市设置删除', '城市设置删除', '/SysCityController/remove', '0', '340088022018166784', 'gen:sysCity:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3400880220181667884', '城市设置修改', '城市设置修改', '/SysCityController/edit', '0', '340088022018166784', 'gen:sysCity:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('340096183135506432', '地区设置管理', '地区设置展示', '/SysAreaController/view', '0', '340067579836108800', 'gen:sysArea:view', '1', 'fa fa-quora', '4', '0');
INSERT INTO `t_sys_permission` VALUES ('3400961831355064331', '地区设置集合', '地区设置集合', '/SysAreaController/list', '0', '340096183135506432', 'gen:sysArea:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3400961831355064342', '地区设置添加', '地区设置添加', '/SysAreaController/add', '0', '340096183135506432', 'gen:sysArea:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3400961831355064353', '地区设置删除', '地区设置删除', '/SysAreaController/remove', '0', '340096183135506432', 'gen:sysArea:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3400961831355064364', '地区设置修改', '地区设置修改', '/SysAreaController/edit', '0', '340096183135506432', 'gen:sysArea:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('340127412270534656', '街道设置管理', '街道设置展示', '/SysStreetController/view', '0', '340067579836108800', 'gen:sysStreet:view', '1', 'fa fa-quora', '5', '0');
INSERT INTO `t_sys_permission` VALUES ('3401274122705346571', '街道设置集合', '街道设置集合', '/SysStreetController/list', '0', '340127412270534656', 'gen:sysStreet:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3401274122705346582', '街道设置添加', '街道设置添加', '/SysStreetController/add', '0', '340127412270534656', 'gen:sysStreet:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3401274122705346593', '街道设置删除', '街道设置删除', '/SysStreetController/remove', '0', '340127412270534656', 'gen:sysStreet:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3401274122705346604', '街道设置修改', '街道设置修改', '/SysStreetController/edit', '0', '340127412270534656', 'gen:sysStreet:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('340301160042860544', '省份联动', '省份联动', '/ProvinceLinkageController/view', '0', '340067579836108800', '#', '1', 'fa fa-etsy', '1', '0');
INSERT INTO `t_sys_permission` VALUES ('340381240911859712', 'JavaScript格式化', null, '/static/tool/htmlformat/javascriptFormat.html', '0', '617766548966211584', '#', '1', 'layui-icon layui-icon fa fa-magic', '11', '0');
INSERT INTO `t_sys_permission` VALUES ('373489907429150720', 'URL拦截管理', '拦截url表展示', '/SysInterUrlController/view', '0', '617766548966211584', 'gen:sysInterUrl:view', '1', 'fa fa-hand-stop-o', '16', '0');
INSERT INTO `t_sys_permission` VALUES ('3734899074291507211', '拦截url表集合', '拦截url表集合', '/SysInterUrlController/list', '0', '373489907429150720', 'gen:sysInterUrl:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3734899074291507222', '拦截url表添加', '拦截url表添加', '/SysInterUrlController/add', '0', '373489907429150720', 'gen:sysInterUrl:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3734899074291507233', '拦截url表删除', '拦截url表删除', '/SysInterUrlController/remove', '0', '373489907429150720', 'gen:sysInterUrl:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('3734899074291507244', '拦截url表修改', '拦截url表修改', '/SysInterUrlController/edit', '0', '373489907429150720', 'gen:sysInterUrl:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('4', '管理员管理', '用户展示', '/UserController/view', '0', '411522822607867904', 'system:user:view', '1', 'icon icon-user', '1', '0');
INSERT INTO `t_sys_permission` VALUES ('410791701859405824', '岗位管理', '岗位展示', '/SysPositionController/view', '0', '411522822607867904', 'gen:sysPosition:view', '1', 'fa fa-vcard', '17', '0');
INSERT INTO `t_sys_permission` VALUES ('4107917018594058251', '岗位表集合', '岗位集合', '/SysPositionController/list', '0', '410791701859405824', 'gen:sysPosition:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('4107917018594058262', '岗位表添加', '岗位添加', '/SysPositionController/add', '0', '410791701859405824', 'gen:sysPosition:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('4107917018594058273', '岗位表删除', '岗位删除', '/SysPositionController/remove', '0', '410791701859405824', 'gen:sysPosition:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('4107917018594058284', '岗位表修改', '岗位修改', '/SysPositionController/edit', '0', '410791701859405824', 'gen:sysPosition:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('410989805699207168', '部门管理', '部门展示', '/SysDepartmentController/view', '0', '411522822607867904', 'gen:sysDepartment:view', '1', 'fa fa-odnoklassniki', '18', '0');
INSERT INTO `t_sys_permission` VALUES ('4109898056992071691', '部门集合', '部门集合', '/SysDepartmentController/list', '0', '410989805699207168', 'gen:sysDepartment:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('4109898056992071702', '部门添加', '部门添加', '/SysDepartmentController/add', '0', '410989805699207168', 'gen:sysDepartment:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('4109898056992071713', '部门删除', '部门删除', '/SysDepartmentController/remove', '0', '410989805699207168', 'gen:sysDepartment:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('4109898056992071724', '部门修改', '部门修改', '/SysDepartmentController/edit', '0', '410989805699207168', 'gen:sysDepartment:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('411522822607867904', '用户管理', null, '', '0', '0', '', '0', 'layui-icon layui-icon-user', '3', '0');
INSERT INTO `t_sys_permission` VALUES ('486690002869157888', '用户密码修改', '用户密码修改', '/UserController/editPwd', '0', '4', 'system:user:editPwd', '2', 'entypo-tools', '3', '0');
INSERT INTO `t_sys_permission` VALUES ('496126970468237312', '日志展示', '日志管理', '/LogController/view', '0', '592059865673760768', 'system:log:view', '1', 'fa fa-info', '9', '0');
INSERT INTO `t_sys_permission` VALUES ('496127240363311104', '日志删除', '日志删除', '/LogController/remove', '0', '496126970468237312', 'system:log:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('496127794879660032', '日志集合', '日志集合', '/LogController/list', '0', '496126970468237312', 'system:log:list', '2', null, null, '0');
INSERT INTO `t_sys_permission` VALUES ('5', '用户集合', '用户集合', '/UserController/list', '0', '4', 'system:user:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('581541547099553792', 'druid监控', 'druid监控', '/druid/', '0', '617766548966211584', 'user:list', '1', 'fa fa-line-chart', '6', '0');
INSERT INTO `t_sys_permission` VALUES ('583063272123531264', 'API文档', null, '/doc.html', '1', '617766548966211584', '--', '1', 'layui-icon fa fa-font', '8', '0');
INSERT INTO `t_sys_permission` VALUES ('586003694080753664', '表单构建', null, '/static/component/code/index.html', '0', '617766548966211584', 'system:tool:view', '1', 'layui-icon layui-icon fa fa-list-alt', '5', '0');
INSERT INTO `t_sys_permission` VALUES ('587453033487532032', '后台模板', null, 'https://www.layui.com/doc/', '1', '617766548966211584', '', '1', 'layui-icon layui-icon fa fa-telegram', '9', '0');
INSERT INTO `t_sys_permission` VALUES ('589559748521623552', '一级菜单', null, '', '0', '0', '', '0', 'layui-icon layui-icon layui-icon layui-icon-face-smile', '6', '0');
INSERT INTO `t_sys_permission` VALUES ('592059865673760768', '系统管理', null, '', '0', '0', '', '0', 'layui-icon layui-icon-home', '1', '0');
INSERT INTO `t_sys_permission` VALUES ('592067570522128384', '测试跳转', '测试跳转', 'http://www.baidu.com', '1', '589559748521623552', '#', '1', 'fa fa-address-book', null, '0');
INSERT INTO `t_sys_permission` VALUES ('592167738407911424', '系统监控', '系统监控', '/ServiceController/view', '0', '617766548966211584', 'system:service:view', '1', 'fa fa-video-camera', '7', '0');
INSERT INTO `t_sys_permission` VALUES ('594691026430459904', '电子邮件管理', '电子邮件展示', '/EmailController/view', '0', '592059865673760768', 'system:email:view', '1', 'fa fa-envelope', '8', '0');
INSERT INTO `t_sys_permission` VALUES ('5946910264304599041', '电子邮件集合', '电子邮件集合', '/EmailController/list', '0', '594691026430459904', 'system:email:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('5946910264304599042', '电子邮件添加', '电子邮件添加', '/EmailController/add', '0', '594691026430459904', 'system:email:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('5946910264304599043', '电子邮件删除', '电子邮件删除', '/EmailController/remove', '0', '594691026430459904', 'system:email:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('5946910264304599044', '电子邮件修改', '电子邮件修改', '/EmailController/edit', '0', '594691026430459904', 'system:email:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('6', '管理员添加', '用户添加', '/UserController/add', '0', '4', 'system:user:add', '2', 'entypo-plus-squared', null, '0');
INSERT INTO `t_sys_permission` VALUES ('610635485890478080', '代码生成', null, '', '0', '0', '', '0', 'layui-icon layui-icon layui-icon layui-icon-praise', '2', '0');
INSERT INTO `t_sys_permission` VALUES ('610635950447394816', '全局配置', '', '/autoCodeController/global', '0', '610635485890478080', 'system:autocode:global', '1', 'fa fa-university', null, '0');
INSERT INTO `t_sys_permission` VALUES ('617766548966211584', '系统工具', null, '', '0', '0', '', '0', 'layui-icon layui-icon layui-icon layui-icon layui-icon layui-icon layui-icon-util', '5', '0');
INSERT INTO `t_sys_permission` VALUES ('618918631769636864', '字典管理', '字典类型表展示', '/DictTypeController/view', '0', '592059865673760768', 'system:dictType:view', '1', 'fa fa-puzzle-piece', '11', '0');
INSERT INTO `t_sys_permission` VALUES ('6189186317738311681', '字典类型表集合', '字典类型表集合', '/DictTypeController/list', '0', '618918631769636864', 'system:dictType:list', '2', null, null, '0');
INSERT INTO `t_sys_permission` VALUES ('6189186317948026882', '字典类型表添加', '字典类型表添加', '/DictTypeController/add', '0', '618918631769636864', 'system:dictType:add', '2', null, null, '0');
INSERT INTO `t_sys_permission` VALUES ('6189186317948026883', '字典类型表删除', '字典类型表删除', '/DictTypeController/remove', '0', '618918631769636864', 'system:dictType:remove', '2', null, null, '0');
INSERT INTO `t_sys_permission` VALUES ('6189186317989969924', '字典类型表修改', '字典类型表修改', '/DictTypeController/edit', '0', '618918631769636864', 'system:dictType:edit', '2', null, null, '0');
INSERT INTO `t_sys_permission` VALUES ('6192095214866268161', '字典数据表集合', '字典数据表集合', '/DictDataController/list', '0', '618918631769636864', 'system:dictData:list', '2', null, null, '0');
INSERT INTO `t_sys_permission` VALUES ('6192095214866268162', '字典数据表添加', '字典数据表添加', '/DictDataController/add', '0', '618918631769636864', 'system:dictData:add', '2', null, null, '0');
INSERT INTO `t_sys_permission` VALUES ('6192095215075983363', '字典数据表删除', '字典数据表删除', '/DictDataController/remove', '0', '618918631769636864', 'system:dictData:remove', '2', null, null, '0');
INSERT INTO `t_sys_permission` VALUES ('6192095215075983364', '字典数据表修改', '字典数据表修改', '/DictDataController/edit', '0', '618918631769636864', 'system:dictData:edit', '2', null, null, '0');
INSERT INTO `t_sys_permission` VALUES ('619836559427895296', '字典数据视图', '字典数据视图', '/DictDataController/view', '0', '618918631769636864', 'system:dictData:view', '2', null, null, '0');
INSERT INTO `t_sys_permission` VALUES ('7', '用户删除', '用户删除', '/UserController/remove', '0', '4', 'system:user:remove', '2', 'entypo-trash', null, '0');
INSERT INTO `t_sys_permission` VALUES ('8', '用户修改', '用户修改', '/UserController/edit', '0', '4', 'system:user:edit', '2', 'fa fa-wrench', null, '0');
INSERT INTO `t_sys_permission` VALUES ('882159955191402496', '专业', '展示', '/MajorController/view', '0', '0', 'gen:major:view', '1', 'layui-icon layui-icon-face-smile', null, '0');
INSERT INTO `t_sys_permission` VALUES ('882159955191402497', '集合', '集合', '/MajorController/list', '0', '882159955191402496', 'gen:major:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('882159955191402498', '添加', '添加', '/MajorController/add', '0', '882159955191402496', 'gen:major:add', '2', 'layui-icon layui-icon-add-1', null, '0');
INSERT INTO `t_sys_permission` VALUES ('882159955191402499', '删除', '删除', '/MajorController/remove', '0', '882159955191402496', 'gen:major:remove', '2', 'layui-icon layui-icon-delete', null, '0');
INSERT INTO `t_sys_permission` VALUES ('882159955191402500', '修改', '修改', '/MajorController/edit', '0', '882159955191402496', 'gen:major:edit', '2', 'layui-icon layui-icon-edit', null, '0');
INSERT INTO `t_sys_permission` VALUES ('882236723940167680', '学校', '展示', '/SchoolController/view', '0', '0', 'gen:school:view', '1', 'layui-icon layui-icon-face-smile', null, '0');
INSERT INTO `t_sys_permission` VALUES ('882236723940167681', '集合', '集合', '/SchoolController/list', '0', '882236723940167680', 'gen:school:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('882236723940167682', '添加', '添加', '/SchoolController/add', '0', '882236723940167680', 'gen:school:add', '2', 'layui-icon layui-icon-add-1', null, '0');
INSERT INTO `t_sys_permission` VALUES ('882236723940167683', '删除', '删除', '/SchoolController/remove', '0', '882236723940167680', 'gen:school:remove', '2', 'layui-icon layui-icon-delete', null, '0');
INSERT INTO `t_sys_permission` VALUES ('882236723940167684', '修改', '修改', '/SchoolController/edit', '0', '882236723940167680', 'gen:school:edit', '2', 'layui-icon layui-icon-edit', null, '0');
INSERT INTO `t_sys_permission` VALUES ('884565986567655424', '院系', '展示', '/DepartController/view', '0', '0', 'gen:depart:view', '1', 'layui-icon layui-icon-face-smile', null, '0');
INSERT INTO `t_sys_permission` VALUES ('884565986567655425', '集合', '集合', '/DepartController/list', '0', '884565986567655424', 'gen:depart:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('884565986567655426', '添加', '添加', '/DepartController/add', '0', '884565986567655424', 'gen:depart:add', '2', 'layui-icon layui-icon-add-1', null, '0');
INSERT INTO `t_sys_permission` VALUES ('884565986567655427', '删除', '删除', '/DepartController/remove', '0', '884565986567655424', 'gen:depart:remove', '2', 'layui-icon layui-icon-delete', null, '0');
INSERT INTO `t_sys_permission` VALUES ('884565986567655428', '修改', '修改', '/DepartController/edit', '0', '884565986567655424', 'gen:depart:edit', '2', 'layui-icon layui-icon-edit', null, '0');
INSERT INTO `t_sys_permission` VALUES ('886773631940694016', '学生', '展示', '/StudentController/view', '0', '0', 'gen:student:view', '1', 'layui-icon layui-icon-face-smile', null, '0');
INSERT INTO `t_sys_permission` VALUES ('886773631940694017', '集合', '集合', '/StudentController/list', '0', '886773631940694016', 'gen:student:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('886773631940694018', '添加', '添加', '/StudentController/add', '0', '886773631940694016', 'gen:student:add', '2', 'layui-icon layui-icon-add-1', null, '0');
INSERT INTO `t_sys_permission` VALUES ('886773631940694019', '删除', '删除', '/StudentController/remove', '0', '886773631940694016', 'gen:student:remove', '2', 'layui-icon layui-icon-delete', null, '0');
INSERT INTO `t_sys_permission` VALUES ('886773631940694020', '修改', '修改', '/StudentController/edit', '0', '886773631940694016', 'gen:student:edit', '2', 'layui-icon layui-icon-edit', null, '0');
INSERT INTO `t_sys_permission` VALUES ('886773631940694021', '修改', '修改', '/StudentController/edit', '0', '886773631940694016', 'gen:student:t_edit', '2', 'layui-icon layui-icon-edit', null, '0');
INSERT INTO `t_sys_permission` VALUES ('886779957051789312', '班级', '展示', '/ClassController/view', '0', '0', 'gen:class:view', '1', 'layui-icon layui-icon-face-smile', null, '0');
INSERT INTO `t_sys_permission` VALUES ('886779957051789313', '集合', '集合', '/ClassController/list', '0', '886779957051789312', 'gen:class:list', '2', '', null, '0');
INSERT INTO `t_sys_permission` VALUES ('886779957051789314', '添加', '添加', '/ClassController/add', '0', '886779957051789312', 'gen:class:add', '2', 'layui-icon layui-icon-add-1', null, '0');
INSERT INTO `t_sys_permission` VALUES ('898004753412395008', '首页', null, '', '0', '0', 'index:view', '1', 'layui-icon layui-icon layui-icon layui-icon layui-icon layui-icon layui-icon-username', '1', '0');
INSERT INTO `t_sys_permission` VALUES ('898009033301168128', '学生首页', null, '', '0', '898004753412395008', 'index:student:view', '2', 'layui-icon', null, '0');
INSERT INTO `t_sys_permission` VALUES ('898009190302355456', '管理员首页', null, '', '0', '898004753412395008', 'index:manager:view', '2', 'layui-icon', null, '0');
INSERT INTO `t_sys_permission` VALUES ('898010530361511936', '首页', null, '', '0', '898004753412395008', 'index:view', '2', 'layui-icon', null, '0');
INSERT INTO `t_sys_permission` VALUES ('9', '角色管理', '角色展示', '/RoleController/view', '0', '411522822607867904', 'system:role:view', '1', 'fa fa-group', '2', '0');

-- ----------------------------
-- Table structure for t_sys_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_permission_role`;
CREATE TABLE `t_sys_permission_role` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色id',
  `permission_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='角色权限中间表';

-- ----------------------------
-- Records of t_sys_permission_role
-- ----------------------------
INSERT INTO `t_sys_permission_role` VALUES ('008f932c-9714-4d0e-91e7-b6e178420caa', '889175176154058752', '4');
INSERT INTO `t_sys_permission_role` VALUES ('01165e30-81e9-4c73-b894-bed38952a0e0', '488243256161730560', '340088022018166784');
INSERT INTO `t_sys_permission_role` VALUES ('01d34e5f-d429-4c6c-92e8-e12173df3d19', '488243256161730560', '6192095214866268162');
INSERT INTO `t_sys_permission_role` VALUES ('02c68837-9462-4c69-8212-00b7edddf27a', '889175176154058752', '3321578609202995222');
INSERT INTO `t_sys_permission_role` VALUES ('057a1e7e-2487-4ba4-8b11-d4b0e1fa1863', '488243256161730560', '4109898056992071713');
INSERT INTO `t_sys_permission_role` VALUES ('07cadb4f-0fbe-4743-903f-d8099d26b9e8', '488243256161730560', '23');
INSERT INTO `t_sys_permission_role` VALUES ('08a2206c-1c7a-4277-bb8e-be8113248646', '488243256161730560', '496127794879660032');
INSERT INTO `t_sys_permission_role` VALUES ('094a72d6-95a2-498d-bb74-4cc8535da0b7', '889175176154058752', '12');
INSERT INTO `t_sys_permission_role` VALUES ('09da6ff5-4a36-4bdb-a92f-3caacf1028de', '889175176154058752', '3734899074291507222');
INSERT INTO `t_sys_permission_role` VALUES ('0a5cf8bd-e339-4a7d-97aa-af4eed27ce9c', '488243256161730560', '12');
INSERT INTO `t_sys_permission_role` VALUES ('0a6ef0c9-5dc7-4a0d-812a-cabf204caeec', '488243256161730560', '410791701859405824');
INSERT INTO `t_sys_permission_role` VALUES ('0a8902ee-d8df-414e-9601-c00d9763ed66', '889175176154058752', '618918631769636864');
INSERT INTO `t_sys_permission_role` VALUES ('0ac2d5a0-f0f2-4159-b502-08250fa2248c', '889175176154058752', '331778807298134016');
INSERT INTO `t_sys_permission_role` VALUES ('0b88aef4-6776-42e8-9c3f-2b54282e4128', '488243256161730560', '884565986567655426');
INSERT INTO `t_sys_permission_role` VALUES ('0ce86c03-0912-4e0a-b406-b56a2b33e77a', '889175176154058752', '619836559427895296');
INSERT INTO `t_sys_permission_role` VALUES ('10b14790-1d48-4e86-9423-43aeb9a9caa7', '889175176154058752', '589559748521623552');
INSERT INTO `t_sys_permission_role` VALUES ('10d78aad-d910-4605-b4c3-c1362db66d3b', '488243256161730560', '15');
INSERT INTO `t_sys_permission_role` VALUES ('12015684-63e0-4176-9664-ad6fa0cc7233', '889175176154058752', '882236723940167682');
INSERT INTO `t_sys_permission_role` VALUES ('120589ad-127f-423a-b458-0c6b9816cd8e', '488243256161730560', '3400961831355064331');
INSERT INTO `t_sys_permission_role` VALUES ('12521c21-982d-46f9-bc2a-e8be5506b355', '488243256161730560', '6192095215075983364');
INSERT INTO `t_sys_permission_role` VALUES ('14c4f514-6778-4115-84e8-fe55f998e654', '889175176154058752', '20');
INSERT INTO `t_sys_permission_role` VALUES ('14cc55b6-e782-4497-be8c-d418a469faf9', '488243256161730560', '3303650266428252193');
INSERT INTO `t_sys_permission_role` VALUES ('15052c79-c311-4c7c-9332-9f8059ee94f5', '488243256161730560', '3401274122705346593');
INSERT INTO `t_sys_permission_role` VALUES ('15817714-484c-464b-9c1f-d8e2e23a7b69', '889175176154058752', '7');
INSERT INTO `t_sys_permission_role` VALUES ('15a31f44-9291-4b74-8759-2fb5c5269061', '488243256161730560', '6');
INSERT INTO `t_sys_permission_role` VALUES ('15cd16f1-02fc-41f0-a1a2-9c301bfd40b4', '488243256161730560', '610635950447394816');
INSERT INTO `t_sys_permission_role` VALUES ('179f38a4-e6df-4066-baae-b7e3ccadc744', '889175176154058752', '882159955191402497');
INSERT INTO `t_sys_permission_role` VALUES ('19263aa0-e62a-44eb-a90b-eb25377f8f91', '488243256161730560', '20');
INSERT INTO `t_sys_permission_role` VALUES ('193a9297-edb6-4236-8c33-852bd8b42608', '889175176154058752', '581541547099553792');
INSERT INTO `t_sys_permission_role` VALUES ('1ba134bd-9840-4db9-94f0-2665be083d79', '488243256161730560', '486690002869157888');
INSERT INTO `t_sys_permission_role` VALUES ('1c22fb3b-a377-47a2-b93e-8b0de5a69c28', '889175176154058752', '9');
INSERT INTO `t_sys_permission_role` VALUES ('1cc93941-5205-4165-ad09-ebed8588d073', '488243256161730560', '496126970468237312');
INSERT INTO `t_sys_permission_role` VALUES ('1de2c2dd-cb51-422b-8f2b-d486aa04b159', '889175176154058752', '886773631940694018');
INSERT INTO `t_sys_permission_role` VALUES ('1e92128f-2092-4b6a-beed-4aae3122ff89', '889159217641033728', '898010530361511936');
INSERT INTO `t_sys_permission_role` VALUES ('1e9c4478-a461-42f9-8a83-3ca8e3dc6199', '488243256161730560', '11');
INSERT INTO `t_sys_permission_role` VALUES ('1ecf6064-c638-4908-83e7-c35eb79fb41c', '889175176154058752', '898009190302355456');
INSERT INTO `t_sys_permission_role` VALUES ('1efdff16-eb6f-4e25-b1c7-2bab3f389da9', '488243256161730560', '3400880220181667884');
INSERT INTO `t_sys_permission_role` VALUES ('1ff03494-1775-44d4-b0a0-eb6429faae4e', '889175176154058752', '496127240363311104');
INSERT INTO `t_sys_permission_role` VALUES ('215656dd-56f2-4602-a0cf-7a10a47a0d1d', '488243256161730560', '5');
INSERT INTO `t_sys_permission_role` VALUES ('2188d837-ba4e-46fc-b63a-1fb26ba527e1', '488243256161730560', '4109898056992071691');
INSERT INTO `t_sys_permission_role` VALUES ('220a6062-cf7a-4edb-b463-5a344fc53a14', '488243256161730560', '592167738407911424');
INSERT INTO `t_sys_permission_role` VALUES ('22c1e7ed-ef38-46ec-9fc1-98e49f525ea3', '889175176154058752', '332157860920299520');
INSERT INTO `t_sys_permission_role` VALUES ('23d34ee1-9757-44f3-a471-7c5909490948', '889175176154058752', '335330315113467904');
INSERT INTO `t_sys_permission_role` VALUES ('23e2dbeb-93d2-447a-b1f5-c1262a53be5c', '488243256161730560', '6192095214866268161');
INSERT INTO `t_sys_permission_role` VALUES ('2456b8ca-335e-4f4c-9085-5485d6432fca', '488243256161730560', '3321578609202995244');
INSERT INTO `t_sys_permission_role` VALUES ('25323479-d584-4dd7-b03d-863fd5117823', '488243256161730560', '5946910264304599042');
INSERT INTO `t_sys_permission_role` VALUES ('27418dfc-022f-4e8d-bb7b-e308d4d0c96b', '889175176154058752', '15');
INSERT INTO `t_sys_permission_role` VALUES ('2885ac9c-677f-4e6d-bc8d-5e811901123c', '488243256161730560', '886773631940694021');
INSERT INTO `t_sys_permission_role` VALUES ('2b23d938-6bc3-489a-baa1-58bc873a84de', '488243256161730560', '3400880220181667862');
INSERT INTO `t_sys_permission_role` VALUES ('2baee873-9196-4e76-b863-4bc1402baaba', '488243256161730560', '898009190302355456');
INSERT INTO `t_sys_permission_role` VALUES ('2d797899-4500-4b29-9399-b898f6caba06', '488243256161730560', '886773631940694019');
INSERT INTO `t_sys_permission_role` VALUES ('2e8da72f-c925-4516-b193-40f3ebd9508d', '889175176154058752', '882159955191402496');
INSERT INTO `t_sys_permission_role` VALUES ('30377003-f9b4-4c8b-a511-2b4857eb0dc5', '889175176154058752', '486690002869157888');
INSERT INTO `t_sys_permission_role` VALUES ('303d4b4f-dc26-46a0-81e9-bbe2999caa86', '889175176154058752', '6189186317989969924');
INSERT INTO `t_sys_permission_role` VALUES ('31e40c08-b81f-4ed4-ba38-8c1a2a39f6c0', '889175176154058752', '14');
INSERT INTO `t_sys_permission_role` VALUES ('333d886d-080e-42c7-9826-f453ee275f93', '488243256161730560', '3734899074291507211');
INSERT INTO `t_sys_permission_role` VALUES ('37d83177-8206-486d-b30f-a561d2904b66', '488243256161730560', '13');
INSERT INTO `t_sys_permission_role` VALUES ('386e5b73-b915-42b7-a318-173a52a04e07', '488243256161730560', '5946910264304599041');
INSERT INTO `t_sys_permission_role` VALUES ('397562a2-149b-49e8-bac0-2a7ae25aad05', '488243256161730560', '882236723940167680');
INSERT INTO `t_sys_permission_role` VALUES ('3e686a60-3c71-41a9-89a9-98212144e0b3', '889175176154058752', '6192095215075983364');
INSERT INTO `t_sys_permission_role` VALUES ('40a7a938-0d5e-4d3a-bd0e-778eb79c62b8', '488243256161730560', '410989805699207168');
INSERT INTO `t_sys_permission_role` VALUES ('4277b68d-12b4-4585-8c9c-6366b60f6c33', '889175176154058752', '882159955191402500');
INSERT INTO `t_sys_permission_role` VALUES ('446e3d08-4c74-4f6c-9840-641e5ad112b1', '889175176154058752', '882159955191402499');
INSERT INTO `t_sys_permission_role` VALUES ('484a6e7a-4464-412e-9ad3-a58d0bb6f23a', '488243256161730560', '886779957051789313');
INSERT INTO `t_sys_permission_role` VALUES ('4bd3dc01-156a-48e9-b37a-f7f3c4e01f33', '889175176154058752', '3734899074291507233');
INSERT INTO `t_sys_permission_role` VALUES ('4c6bbae5-a468-47bb-a1f9-687aa56e74f5', '488243256161730560', '332157860920299520');
INSERT INTO `t_sys_permission_role` VALUES ('4c9471c8-81cf-4852-8708-b73b2c3032b8', '889175176154058752', '586003694080753664');
INSERT INTO `t_sys_permission_role` VALUES ('4caf7e7a-32c3-4471-8def-17b9e9e692cc', '488243256161730560', '18');
INSERT INTO `t_sys_permission_role` VALUES ('4fdb0b96-e8ea-4be6-a629-3bc314cc49e5', '889175176154058752', '496127794879660032');
INSERT INTO `t_sys_permission_role` VALUES ('50f0bf70-58b0-412e-a28e-a88e2aa88b9a', '889175176154058752', '19');
INSERT INTO `t_sys_permission_role` VALUES ('5189cb24-df1e-4c53-ab00-795105ba0c33', '488243256161730560', '331778807298134016');
INSERT INTO `t_sys_permission_role` VALUES ('533de69b-c6cc-41a5-98df-67b1bc4405fc', '889175176154058752', '3321578609202995211');
INSERT INTO `t_sys_permission_role` VALUES ('56435373-9ee8-45c2-96f2-7638904d23ac', '889175176154058752', '583063272123531264');
INSERT INTO `t_sys_permission_role` VALUES ('579f8b99-4545-4ac9-80b2-24ba86125d5f', '488243256161730560', '587453033487532032');
INSERT INTO `t_sys_permission_role` VALUES ('57f909b2-933a-4918-8963-ebb75f5ef671', '488243256161730560', '886773631940694017');
INSERT INTO `t_sys_permission_role` VALUES ('58d5f702-7765-4743-b576-276204de975c', '488243256161730560', '373489907429150720');
INSERT INTO `t_sys_permission_role` VALUES ('5afc662c-eb7e-47b7-b22f-db9bd57b34c7', '889175176154058752', '886773631940694020');
INSERT INTO `t_sys_permission_role` VALUES ('5c18828f-5fd8-4d76-9362-1abb413bd5d8', '488243256161730560', '4107917018594058251');
INSERT INTO `t_sys_permission_role` VALUES ('5c3d3279-79d1-40bf-b556-162ffe4f34b8', '488243256161730560', '5946910264304599043');
INSERT INTO `t_sys_permission_role` VALUES ('5eb5e28d-d0db-4d96-adfe-3ef496e3496a', '889175176154058752', '587453033487532032');
INSERT INTO `t_sys_permission_role` VALUES ('5ed47a35-c515-4aa5-88f9-b167100aa2fb', '889175176154058752', '884565986567655428');
INSERT INTO `t_sys_permission_role` VALUES ('5f5ebdd9-63bb-4491-afb1-220dda637da0', '488243256161730560', '3400681518049566742');
INSERT INTO `t_sys_permission_role` VALUES ('5f8f1a4f-bc76-4c73-be36-50a4e6a86554', '889175176154058752', '617766548966211584');
INSERT INTO `t_sys_permission_role` VALUES ('60439020-50bc-475f-a641-b6f7efcfee08', '488243256161730560', '884565986567655427');
INSERT INTO `t_sys_permission_role` VALUES ('60b95548-2647-4d38-9d05-ed559c206813', '488243256161730560', '6189186317948026882');
INSERT INTO `t_sys_permission_role` VALUES ('6203145f-a86d-446b-b686-d5b72415f87a', '488243256161730560', '618918631769636864');
INSERT INTO `t_sys_permission_role` VALUES ('6209ad2d-f39f-4f88-bcf9-a7849fcea0fb', '889175176154058752', '496126970468237312');
INSERT INTO `t_sys_permission_role` VALUES ('62805919-ed51-45a0-b279-568f32bf54ba', '889175176154058752', '330365026642825216');
INSERT INTO `t_sys_permission_role` VALUES ('632d48f5-b9c3-43d0-bde3-b8c62b2538bd', '488243256161730560', '3400880220181667851');
INSERT INTO `t_sys_permission_role` VALUES ('6488e066-47b1-4333-a9c3-a290a06000b4', '488243256161730560', '330365026642825216');
INSERT INTO `t_sys_permission_role` VALUES ('64b23870-fc6e-4d08-8b6a-16dcfc72fc78', '488243256161730560', '6192095215075983363');
INSERT INTO `t_sys_permission_role` VALUES ('653d6fb8-a304-46b9-98d7-09498fcbbd2e', '889175176154058752', '5946910264304599042');
INSERT INTO `t_sys_permission_role` VALUES ('6a350a3e-6443-4754-b60e-ead4c47b0ca7', '488243256161730560', '19');
INSERT INTO `t_sys_permission_role` VALUES ('6a4d64c7-ce57-4562-8766-629126b79eb2', '488243256161730560', '21');
INSERT INTO `t_sys_permission_role` VALUES ('6a7ded7b-a15f-4e24-a74f-261f09dc9e58', '889175176154058752', '882236723940167684');
INSERT INTO `t_sys_permission_role` VALUES ('6bad4840-46f5-417a-a6e0-abb0af5e9804', '488243256161730560', '5946910264304599044');
INSERT INTO `t_sys_permission_role` VALUES ('6c1d3e6d-7147-45c1-aa00-309966bd0d9e', '488243256161730560', '4109898056992071724');
INSERT INTO `t_sys_permission_role` VALUES ('6d4ec228-a6fa-45a1-8660-158b7ba316c9', '889175176154058752', '3328572814798397451');
INSERT INTO `t_sys_permission_role` VALUES ('6e87654c-9914-40a8-852b-932bed37ed27', '488243256161730560', '3734899074291507244');
INSERT INTO `t_sys_permission_role` VALUES ('6f3c4e4d-3624-4312-bd85-9c0dd7c925b0', '488243256161730560', '886779957051789314');
INSERT INTO `t_sys_permission_role` VALUES ('6fd46dfe-e881-40d0-b19c-e02867ae0c64', '889175176154058752', '610635485890478080');
INSERT INTO `t_sys_permission_role` VALUES ('7093d17d-bbb4-4cf3-bfb0-22191f62aee4', '488243256161730560', '6189186317738311681');
INSERT INTO `t_sys_permission_role` VALUES ('70982349-93a3-4a37-bd82-83ddf6916d8d', '889175176154058752', '3328572814798397473');
INSERT INTO `t_sys_permission_role` VALUES ('71430c2b-6f80-49bc-9d3a-e430c0a97125', '488243256161730560', '898010530361511936');
INSERT INTO `t_sys_permission_role` VALUES ('71fe6a26-bafb-4e5c-9040-f955ba1ac11c', '488243256161730560', '335330315113467904');
INSERT INTO `t_sys_permission_role` VALUES ('728839df-975b-414b-90c6-bd6886d71f3c', '488243256161730560', '583063272123531264');
INSERT INTO `t_sys_permission_role` VALUES ('72b7f6be-70be-441f-afae-67b182233098', '889175176154058752', '6192095214866268162');
INSERT INTO `t_sys_permission_role` VALUES ('72d9d4de-d6d8-4b93-b87d-ac26c9e2f253', '488243256161730560', '6189186317948026883');
INSERT INTO `t_sys_permission_role` VALUES ('72ed769a-8403-40d2-b28d-931ab212b394', '488243256161730560', '340381240911859712');
INSERT INTO `t_sys_permission_role` VALUES ('7614089a-de42-4ece-996d-5805caf550a5', '889175176154058752', '592059865673760768');
INSERT INTO `t_sys_permission_role` VALUES ('770f5c82-ffd8-4595-aff0-05afa396f3ad', '889175176154058752', '11');
INSERT INTO `t_sys_permission_role` VALUES ('779f075e-b34e-4677-907e-89a10affe7c8', '889175176154058752', '886779957051789314');
INSERT INTO `t_sys_permission_role` VALUES ('78163a97-7382-4824-998d-fd81efea5f3e', '488243256161730560', '884565986567655428');
INSERT INTO `t_sys_permission_role` VALUES ('78f1e9a4-bdad-49ed-9e04-3acf841e822d', '889175176154058752', '610635950447394816');
INSERT INTO `t_sys_permission_role` VALUES ('79f8f159-2146-434b-9466-09a3a668745a', '889175176154058752', '882236723940167681');
INSERT INTO `t_sys_permission_role` VALUES ('7a787970-8ecc-409e-8e02-26b976cb8f49', '889175176154058752', '21');
INSERT INTO `t_sys_permission_role` VALUES ('7b103954-d8ba-456c-8a2f-002cca006d21', '488243256161730560', '3321578609202995233');
INSERT INTO `t_sys_permission_role` VALUES ('7cf3949f-adb3-45bc-ba41-10cc211e3f8a', '488243256161730560', '3328572814798397473');
INSERT INTO `t_sys_permission_role` VALUES ('80204c28-ea9c-4260-a62e-73fa6d4bdd0c', '889175176154058752', '884565986567655426');
INSERT INTO `t_sys_permission_role` VALUES ('825ec538-2574-4b3f-98e0-cec2c67645a3', '488243256161730560', '3401274122705346582');
INSERT INTO `t_sys_permission_role` VALUES ('83d91a85-f031-4edc-858d-4c89eb1b1a55', '889175176154058752', '5946910264304599041');
INSERT INTO `t_sys_permission_role` VALUES ('8658d542-89ec-4120-a791-a8834fbe4d1f', '889175176154058752', '3734899074291507211');
INSERT INTO `t_sys_permission_role` VALUES ('86ff1291-6d3d-4597-99ae-c740a75be640', '889175176154058752', '882236723940167683');
INSERT INTO `t_sys_permission_role` VALUES ('87556ffd-ac65-4f66-b993-ed4ae238e86f', '488243256161730560', '882159955191402497');
INSERT INTO `t_sys_permission_role` VALUES ('89926f4f-02fd-4ba4-aab4-fc82b52f2f65', '488243256161730560', '3400681518049566731');
INSERT INTO `t_sys_permission_role` VALUES ('8c373439-56cf-4ef0-919d-fcb6acbfae1b', '488243256161730560', '10');
INSERT INTO `t_sys_permission_role` VALUES ('8d0d0743-f003-41d7-8bce-034f942614b1', '488243256161730560', '3401274122705346571');
INSERT INTO `t_sys_permission_role` VALUES ('8ffa9014-24f6-4201-85c2-27ac308e7061', '889175176154058752', '10');
INSERT INTO `t_sys_permission_role` VALUES ('922a0d80-e2ad-4d4b-9e1b-56db9af1cda8', '488243256161730560', '886773631940694020');
INSERT INTO `t_sys_permission_role` VALUES ('9283f6a8-880d-4b91-9444-d1ffd1ddaf6f', '488243256161730560', '884565986567655425');
INSERT INTO `t_sys_permission_role` VALUES ('92cd4077-4028-4044-9f6f-a7dd20d89e57', '488243256161730560', '3303650266428252171');
INSERT INTO `t_sys_permission_role` VALUES ('95347caa-de47-40dc-8f0c-39e9f07a4468', '889175176154058752', '332857281479839744');
INSERT INTO `t_sys_permission_role` VALUES ('957c5af7-127e-40ab-b49f-5b890dacb425', '889175176154058752', '6');
INSERT INTO `t_sys_permission_role` VALUES ('95e0e35a-3ab4-49e8-9073-3a58d4f898af', '488243256161730560', '3303650266428252182');
INSERT INTO `t_sys_permission_role` VALUES ('9699a7a0-a30d-4283-bd74-c9703363c112', '488243256161730560', '8');
INSERT INTO `t_sys_permission_role` VALUES ('97f2627b-4a77-4f62-a1b1-54cf9cc24c24', '889175176154058752', '8');
INSERT INTO `t_sys_permission_role` VALUES ('98ead07b-4db2-4859-b7e0-7ca2c9fc2d46', '889175176154058752', '6192095215075983363');
INSERT INTO `t_sys_permission_role` VALUES ('998da317-574a-4277-846c-b75a977ae1d7', '488243256161730560', '594691026430459904');
INSERT INTO `t_sys_permission_role` VALUES ('99cf59f1-08db-4864-9b09-bc614620acac', '488243256161730560', '4107917018594058273');
INSERT INTO `t_sys_permission_role` VALUES ('9b11adbc-fd8d-4a8f-abc9-a81e80b6d7fb', '889175176154058752', '3303650266428252171');
INSERT INTO `t_sys_permission_role` VALUES ('9b5680fa-86b8-43ae-9081-ee0815cf9154', '889175176154058752', '898009033301168128');
INSERT INTO `t_sys_permission_role` VALUES ('9d73d6ed-273d-43b0-a6b5-54a91348168a', '889175176154058752', '3303650266428252204');
INSERT INTO `t_sys_permission_role` VALUES ('9e20a4fa-2f52-49a2-b20d-0ec949f1a2d2', '488243256161730560', '3401274122705346604');
INSERT INTO `t_sys_permission_role` VALUES ('9e632dc8-c05e-4920-9b71-a7f5901f56e5', '889175176154058752', '886773631940694017');
INSERT INTO `t_sys_permission_role` VALUES ('a04231ee-5556-4a25-9416-ae000255ce90', '889175176154058752', '373489907429150720');
INSERT INTO `t_sys_permission_role` VALUES ('a11b6928-c737-4d00-9279-379bc30e7b0b', '889175176154058752', '340381240911859712');
INSERT INTO `t_sys_permission_role` VALUES ('a1277a79-74f8-4306-b0db-1b2c1dc502c8', '488243256161730560', '7');
INSERT INTO `t_sys_permission_role` VALUES ('a1444ff6-9be0-43fb-96c0-a680babaa176', '488243256161730560', '3400681518049566753');
INSERT INTO `t_sys_permission_role` VALUES ('a2185f6c-b442-45cd-a3ca-adf2f7d3713d', '889175176154058752', '6189186317738311681');
INSERT INTO `t_sys_permission_role` VALUES ('a25d67b1-3a9c-48c2-874f-3c9a36319380', '488243256161730560', '886779957051789312');
INSERT INTO `t_sys_permission_role` VALUES ('a369c423-e859-4067-a091-610e49c975f0', '488243256161730560', '340127412270534656');
INSERT INTO `t_sys_permission_role` VALUES ('a36c11e9-227a-412d-a5ae-0646fc798c2a', '488243256161730560', '22');
INSERT INTO `t_sys_permission_role` VALUES ('a96fa1e9-ebe2-4c83-8d01-c524f9c3394d', '488243256161730560', '3328572814798397451');
INSERT INTO `t_sys_permission_role` VALUES ('aa419b57-60c5-4358-a09f-b539183ed574', '488243256161730560', '3303650266428252204');
INSERT INTO `t_sys_permission_role` VALUES ('ade031bf-a87d-4cab-94f5-25a84cb45de2', '488243256161730560', '884565986567655424');
INSERT INTO `t_sys_permission_role` VALUES ('afbc1bfb-8b4f-4f5e-a836-dbf796713a92', '488243256161730560', '3321578609202995211');
INSERT INTO `t_sys_permission_role` VALUES ('b139b148-18d8-430a-8a0a-18295fb1fa1d', '889175176154058752', '3303650266428252182');
INSERT INTO `t_sys_permission_role` VALUES ('b320825e-31e2-4e59-bb85-d9386f38f316', '488243256161730560', '3400880220181667873');
INSERT INTO `t_sys_permission_role` VALUES ('b3ebbcb8-b830-4eb2-b886-18f0285b40c4', '889175176154058752', '23');
INSERT INTO `t_sys_permission_role` VALUES ('b4139abe-ed49-4233-9c40-79a2524dec2a', '488243256161730560', '619836559427895296');
INSERT INTO `t_sys_permission_role` VALUES ('b6677f58-ca36-44d6-ab88-503771ec228f', '488243256161730560', '3400961831355064364');
INSERT INTO `t_sys_permission_role` VALUES ('b7bfba73-1690-4156-9b8e-c2ced4cd99ca', '488243256161730560', '882236723940167681');
INSERT INTO `t_sys_permission_role` VALUES ('bb4cc1a6-1b42-4bd3-8988-4e956be621c8', '488243256161730560', '4');
INSERT INTO `t_sys_permission_role` VALUES ('bb9102c7-ea6f-4614-86a9-4829121d7502', '889175176154058752', '6192095214866268161');
INSERT INTO `t_sys_permission_role` VALUES ('bd352730-8e17-4732-8523-a3026714abd4', '889175176154058752', '882159955191402498');
INSERT INTO `t_sys_permission_role` VALUES ('bdf2fb2c-2012-47a2-8e53-97b48c29c80e', '488243256161730560', '886773631940694016');
INSERT INTO `t_sys_permission_role` VALUES ('bf20a693-1673-4ae7-b7ce-e761b37a2f51', '889175176154058752', '592167738407911424');
INSERT INTO `t_sys_permission_role` VALUES ('c4057ebf-1b18-4525-afc9-860b1d8ff0dd', '488243256161730560', '332857281479839744');
INSERT INTO `t_sys_permission_role` VALUES ('c557f03f-3e92-4236-8fdb-db0fc8f93dcf', '889175176154058752', '17');
INSERT INTO `t_sys_permission_role` VALUES ('c55f1149-8f3f-4f0c-8476-269e514503fb', '889175176154058752', '16');
INSERT INTO `t_sys_permission_role` VALUES ('c5cd7930-b63c-4c80-9fae-253825d55bdc', '889175176154058752', '884565986567655425');
INSERT INTO `t_sys_permission_role` VALUES ('ca8b511e-0e76-4922-814b-73b3748109bc', '889175176154058752', '886779957051789313');
INSERT INTO `t_sys_permission_role` VALUES ('cb1b5801-6fec-440e-86c0-6abff733f55c', '889175176154058752', '6189186317948026882');
INSERT INTO `t_sys_permission_role` VALUES ('cb40d88e-fa9d-4778-9594-f60baa2ba678', '889159217641033728', '898009033301168128');
INSERT INTO `t_sys_permission_role` VALUES ('cc724b80-5170-45cd-8d48-3f86106a8b13', '889175176154058752', '5946910264304599044');
INSERT INTO `t_sys_permission_role` VALUES ('ce9260be-6e6d-40e7-8479-1ce1fe12457d', '488243256161730560', '3734899074291507233');
INSERT INTO `t_sys_permission_role` VALUES ('cfc7a5fa-d047-4a42-95a3-3912f2e577b7', '889175176154058752', '18');
INSERT INTO `t_sys_permission_role` VALUES ('d0258de5-25b0-4c3f-8237-02ee3bb1cdf7', '488243256161730560', '17');
INSERT INTO `t_sys_permission_role` VALUES ('d076d918-e60f-46e8-92d1-1a2a5bebcb9a', '889175176154058752', '884565986567655427');
INSERT INTO `t_sys_permission_role` VALUES ('d2561d23-ee6a-40e4-8e06-f7276fd063ac', '889175176154058752', '3734899074291507244');
INSERT INTO `t_sys_permission_role` VALUES ('d2ba1a42-d001-4c39-a571-b0901b4ee53f', '889175176154058752', '3303650266428252193');
INSERT INTO `t_sys_permission_role` VALUES ('d4317614-d0a0-4ade-8bce-9c5204b1985e', '488243256161730560', '340068151804956672');
INSERT INTO `t_sys_permission_role` VALUES ('d46d3128-17e0-462d-9808-a4aa0bae6dca', '488243256161730560', '3400961831355064353');
INSERT INTO `t_sys_permission_role` VALUES ('d84eb525-88b1-469d-8510-647f69e0fecb', '488243256161730560', '4109898056992071702');
INSERT INTO `t_sys_permission_role` VALUES ('d95ff489-a689-47fe-bc67-e1fb8d8a9b47', '488243256161730560', '9');
INSERT INTO `t_sys_permission_role` VALUES ('d99f94fb-59da-4fb9-a050-8ca79fb497e9', '889175176154058752', '592067570522128384');
INSERT INTO `t_sys_permission_role` VALUES ('d9ec6acc-e598-4eaa-b1af-9439a488cd13', '488243256161730560', '496127240363311104');
INSERT INTO `t_sys_permission_role` VALUES ('da5170f8-29ec-4f09-b3a7-c4998f1a4e68', '488243256161730560', '581541547099553792');
INSERT INTO `t_sys_permission_role` VALUES ('dc9ba0b9-5d28-4bfa-a403-b82d49a5b164', '488243256161730560', '3400961831355064342');
INSERT INTO `t_sys_permission_role` VALUES ('e0db5ba5-fa1e-459f-96ca-2b2e1aa676fd', '889175176154058752', '886773631940694019');
INSERT INTO `t_sys_permission_role` VALUES ('e244e6e6-d6d7-44b6-81aa-8f0f045e0aba', '488243256161730560', '882159955191402496');
INSERT INTO `t_sys_permission_role` VALUES ('e3bc505c-b6fd-4569-b558-7622e1256c74', '488243256161730560', '14');
INSERT INTO `t_sys_permission_role` VALUES ('e5d65c93-5231-482c-b997-258049710542', '889175176154058752', '411522822607867904');
INSERT INTO `t_sys_permission_role` VALUES ('e705c32a-c05d-40dc-a697-438d72d90079', '488243256161730560', '3400681518049566764');
INSERT INTO `t_sys_permission_role` VALUES ('e971ad39-3d51-49f1-b5e3-d8b7c8bc3998', '889175176154058752', '13');
INSERT INTO `t_sys_permission_role` VALUES ('ea5a596a-a031-4415-a8fc-1029027cc9d7', '488243256161730560', '3321578609202995222');
INSERT INTO `t_sys_permission_role` VALUES ('ed9ad03f-753b-4dd5-b503-a6f0bc7c127c', '488243256161730560', '16');
INSERT INTO `t_sys_permission_role` VALUES ('eea46652-0cfd-4096-8e83-92fe652eba41', '488243256161730560', '886773631940694018');
INSERT INTO `t_sys_permission_role` VALUES ('ef07f3c6-df8f-4722-8997-a7171529a68c', '889175176154058752', '898010530361511936');
INSERT INTO `t_sys_permission_role` VALUES ('efeb9e70-9aad-4803-9e6c-9aaba62864f2', '889175176154058752', '886773631940694021');
INSERT INTO `t_sys_permission_role` VALUES ('f0a23ef1-0a8b-45ac-bf6d-31994034d3c8', '488243256161730560', '6189186317989969924');
INSERT INTO `t_sys_permission_role` VALUES ('f41e1ec5-f47d-47f0-9467-445388e488a3', '488243256161730560', '586003694080753664');
INSERT INTO `t_sys_permission_role` VALUES ('f4cf17e0-574c-4f29-a191-0d8b2a196798', '488243256161730560', '3734899074291507222');
INSERT INTO `t_sys_permission_role` VALUES ('f4e4f32b-ebc0-4411-8ff5-1537ddb12adb', '488243256161730560', '340301160042860544');
INSERT INTO `t_sys_permission_role` VALUES ('f61d8c93-4d14-435c-be09-3e7b545757fb', '889175176154058752', '6189186317948026883');
INSERT INTO `t_sys_permission_role` VALUES ('f6870958-e60b-4f3e-929b-7feb3d35b6bf', '889175176154058752', '5946910264304599043');
INSERT INTO `t_sys_permission_role` VALUES ('f6d3d371-ac1b-424f-87e4-3b7a46f08777', '488243256161730560', '4107917018594058262');
INSERT INTO `t_sys_permission_role` VALUES ('f7bec724-b8d1-4028-a3fc-be0744786e08', '488243256161730560', '4107917018594058284');
INSERT INTO `t_sys_permission_role` VALUES ('f884cdb6-a838-420d-a921-353fbaa6007f', '889175176154058752', '22');
INSERT INTO `t_sys_permission_role` VALUES ('fcb57ca6-da12-4321-a31b-8c38c258dc81', '889175176154058752', '3321578609202995233');
INSERT INTO `t_sys_permission_role` VALUES ('fd44679b-2c00-40e8-b328-d44f3c1d366e', '889175176154058752', '3321578609202995244');
INSERT INTO `t_sys_permission_role` VALUES ('fd601f12-4ca0-4bf6-8cb6-bda64221831d', '488243256161730560', '592067570522128384');
INSERT INTO `t_sys_permission_role` VALUES ('fdb39942-89f7-482f-9e4e-d4d0b5c8c893', '488243256161730560', '340096183135506432');
INSERT INTO `t_sys_permission_role` VALUES ('fe5edf92-5680-463d-8ab7-08b6fde04d3c', '889175176154058752', '5');
INSERT INTO `t_sys_permission_role` VALUES ('fee436f2-b5b5-49cc-bacf-da2664417af8', '889175176154058752', '594691026430459904');

-- ----------------------------
-- Table structure for t_sys_position
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_position`;
CREATE TABLE `t_sys_position` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `post_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '岗位名称',
  `order_num` int DEFAULT NULL COMMENT '排序',
  `status` int DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='岗位表';

-- ----------------------------
-- Records of t_sys_position
-- ----------------------------
INSERT INTO `t_sys_position` VALUES ('410792368778907648', '总经理', '1', '1');
INSERT INTO `t_sys_position` VALUES ('410792443127140352', '技术经理', '2', '1');
INSERT INTO `t_sys_position` VALUES ('410792478929719296', '人事经理', '3', '1');
INSERT INTO `t_sys_position` VALUES ('411477874382606336', '员工', '4', '1');

-- ----------------------------
-- Table structure for t_sys_province
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_province`;
CREATE TABLE `t_sys_province` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增列',
  `province_code` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '省份代码',
  `province_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '省份名称',
  `short_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '简称',
  `lng` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纬度',
  `sort` int DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `memo` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `data_state` int DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Index_1` (`province_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='省份表';

-- ----------------------------
-- Records of t_sys_province
-- ----------------------------
INSERT INTO `t_sys_province` VALUES ('22', '500000', '重庆', '重庆', '106.504959', '29.533155', '22', '2019-02-28 17:16:58', '2019-02-28 17:17:05', '', '0');

-- ----------------------------
-- Table structure for t_sys_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_quartz_job`;
CREATE TABLE `t_sys_quartz_job` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '日志id',
  `job_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务组名',
  `invoke_target` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'cron执行表达式',
  `misfire_policy` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'cron计划策略',
  `concurrent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否并发执行（0允许 1禁止）',
  `status` int DEFAULT NULL COMMENT '任务状态（0正常 1暂停）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

-- ----------------------------
-- Records of t_sys_quartz_job
-- ----------------------------
INSERT INTO `t_sys_quartz_job` VALUES ('332182389491109888', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', '*/5 * * * * ?', '2', '0', '1');

-- ----------------------------
-- Table structure for t_sys_quartz_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_quartz_job_log`;
CREATE TABLE `t_sys_quartz_job_log` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `job_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务组名',
  `invoke_target` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '调用目标字符串',
  `job_message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` int DEFAULT NULL COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '异常信息',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of t_sys_quartz_job_log
-- ----------------------------
INSERT INTO `t_sys_quartz_job_log` VALUES ('333610566486724608', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2019-09-17 00:16:07', '2019-09-17 00:16:07');
INSERT INTO `t_sys_quartz_job_log` VALUES ('333610572270669824', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2019-09-17 00:16:09', '2019-09-17 00:16:09');
INSERT INTO `t_sys_quartz_job_log` VALUES ('354984595927732224', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：3毫秒', '0', null, '2019-11-14 23:48:53', '2019-11-14 23:48:53');
INSERT INTO `t_sys_quartz_job_log` VALUES ('354990312722141184', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：2毫秒', '0', null, '2019-11-15 00:11:36', '2019-11-15 00:11:36');
INSERT INTO `t_sys_quartz_job_log` VALUES ('354996339316232192', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：3毫秒', '0', null, '2019-11-15 00:35:33', '2019-11-15 00:35:33');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421274211356672', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：5毫秒', '0', null, '2020-04-29 18:22:40', '2020-04-29 18:22:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421274303631360', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:22:40', '2020-04-29 18:22:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421274324602880', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:22:40', '2020-04-29 18:22:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421274366545920', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:22:40', '2020-04-29 18:22:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421315554611200', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:22:50', '2020-04-29 18:22:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421357501845504', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:23:00', '2020-04-29 18:23:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421399453274112', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:23:10', '2020-04-29 18:23:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421441375342592', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:23:20', '2020-04-29 18:23:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421483351937024', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：2毫秒', '0', null, '2020-04-29 18:23:30', '2020-04-29 18:23:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421525257228288', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:23:40', '2020-04-29 18:23:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421567233822720', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:23:50', '2020-04-29 18:23:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421609130725376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:24:00', '2020-04-29 18:24:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421648662040576', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:24:09', '2020-04-29 18:24:09');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421651073765376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:24:10', '2020-04-29 18:24:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421693041971200', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:24:20', '2020-04-29 18:24:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421734959845376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:24:30', '2020-04-29 18:24:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421776974188544', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:24:40', '2020-04-29 18:24:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421818862702592', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:24:50', '2020-04-29 18:24:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421860805742592', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:25:00', '2020-04-29 18:25:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415421902736199680', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:25:10', '2020-04-29 18:25:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423552540512256', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：4毫秒', '0', null, '2020-04-29 18:31:43', '2020-04-29 18:31:43');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423552636981248', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:31:43', '2020-04-29 18:31:43');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423552670535680', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:31:43', '2020-04-29 18:31:43');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423552687312896', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:31:43', '2020-04-29 18:31:43');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423552716673024', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:31:43', '2020-04-29 18:31:43');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423552741838848', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:31:43', '2020-04-29 18:31:43');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423559536611328', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:31:45', '2020-04-29 18:31:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423580482965504', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:31:50', '2020-04-29 18:31:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423601454485504', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:31:55', '2020-04-29 18:31:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423622405033984', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:32:00', '2020-04-29 18:32:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423643372359680', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:32:05', '2020-04-29 18:32:05');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423664343879680', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:32:10', '2020-04-29 18:32:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423685311205376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:32:15', '2020-04-29 18:32:15');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423706328862720', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:32:20', '2020-04-29 18:32:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423727325548544', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:32:25', '2020-04-29 18:32:25');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423748250931200', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:32:30', '2020-04-29 18:32:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423769188896768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:32:35', '2020-04-29 18:32:35');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423790227525632', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:32:40', '2020-04-29 18:32:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423811190657024', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:32:45', '2020-04-29 18:32:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423832178954240', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:32:50', '2020-04-29 18:32:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423853100142592', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:32:55', '2020-04-29 18:32:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423874054885376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:33:00', '2020-04-29 18:33:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423895026405376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:33:05', '2020-04-29 18:33:05');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423916002119680', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:33:10', '2020-04-29 18:33:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423937015582720', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:33:15', '2020-04-29 18:33:15');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423957970325504', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:33:20', '2020-04-29 18:33:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423978925068288', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:33:25', '2020-04-29 18:33:25');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415423999942725632', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:33:30', '2020-04-29 18:33:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424020889079808', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:33:35', '2020-04-29 18:33:35');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424041894154240', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:33:40', '2020-04-29 18:33:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424062844702720', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:33:45', '2020-04-29 18:33:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424083803639808', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:33:50', '2020-04-29 18:33:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424104754188288', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:33:55', '2020-04-29 18:33:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424125746679808', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:34:00', '2020-04-29 18:34:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424146726588416', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:34:05', '2020-04-29 18:34:05');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424167727468544', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:34:10', '2020-04-29 18:34:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424188678017024', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:34:15', '2020-04-29 18:34:15');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424209636954112', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:34:20', '2020-04-29 18:34:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424230595891200', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:34:25', '2020-04-29 18:34:25');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424251567411200', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:34:30', '2020-04-29 18:34:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424272559902720', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:34:35', '2020-04-29 18:34:35');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424293518839808', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:34:40', '2020-04-29 18:34:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424314507137024', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:34:45', '2020-04-29 18:34:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424335436713984', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:34:50', '2020-04-29 18:34:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424356404039680', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:34:55', '2020-04-29 18:34:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424377396531200', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:35:00', '2020-04-29 18:35:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424398414188544', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:35:05', '2020-04-29 18:35:05');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424419326988288', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:35:10', '2020-04-29 18:35:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424440332062720', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:35:15', '2020-04-29 18:35:15');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424461282611200', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:35:20', '2020-04-29 18:35:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424482254131200', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:35:25', '2020-04-29 18:35:25');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424503200485376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:35:30', '2020-04-29 18:35:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424524163616768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:35:35', '2020-04-29 18:35:35');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424545135136768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:35:40', '2020-04-29 18:35:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424566148599808', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:35:45', '2020-04-29 18:35:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424587103342592', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:35:50', '2020-04-29 18:35:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424608150360064', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:35:55', '2020-04-29 18:35:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424629029605376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:36:00', '2020-04-29 18:36:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424650072428544', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:36:05', '2020-04-29 18:36:05');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424671035559936', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:36:10', '2020-04-29 18:36:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424691981914112', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:36:15', '2020-04-29 18:36:15');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424712961822720', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:36:20', '2020-04-29 18:36:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424733899788288', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:36:25', '2020-04-29 18:36:25');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424754862919680', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:36:30', '2020-04-29 18:36:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424775888965632', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:36:35', '2020-04-29 18:36:35');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424796797571072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:36:40', '2020-04-29 18:36:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424817836199936', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:36:45', '2020-04-29 18:36:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424838769971200', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:36:50', '2020-04-29 18:36:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424859741491200', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:36:55', '2020-04-29 18:36:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424880696233984', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:37:00', '2020-04-29 18:37:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424901705502720', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:37:05', '2020-04-29 18:37:05');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424922681217024', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:37:10', '2020-04-29 18:37:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424943690485760', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:37:15', '2020-04-29 18:37:15');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424964632645632', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:37:20', '2020-04-29 18:37:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415424985562222592', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:37:25', '2020-04-29 18:37:25');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425006516965376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:37:30', '2020-04-29 18:37:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425027484291072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:37:35', '2020-04-29 18:37:35');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425048476782592', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：2毫秒', '0', null, '2020-04-29 18:37:40', '2020-04-29 18:37:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425069427331072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:37:45', '2020-04-29 18:37:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425090436599808', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:37:50', '2020-04-29 18:37:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425111412314112', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:37:55', '2020-04-29 18:37:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425132354473984', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:38:00', '2020-04-29 18:38:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425153334382592', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:38:05', '2020-04-29 18:38:05');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425174335262720', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:38:10', '2020-04-29 18:38:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425195290005504', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:38:15', '2020-04-29 18:38:15');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425216248942592', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:38:20', '2020-04-29 18:38:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425237224656896', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：2毫秒', '0', null, '2020-04-29 18:38:25', '2020-04-29 18:38:25');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425258200371200', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:38:30', '2020-04-29 18:38:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425279192862720', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:38:35', '2020-04-29 18:38:35');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425300126633984', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:38:40', '2020-04-29 18:38:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425321089765376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:38:45', '2020-04-29 18:38:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425342082256896', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:38:50', '2020-04-29 18:38:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425363041193984', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:38:55', '2020-04-29 18:38:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425384000131072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:39:00', '2020-04-29 18:39:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425404967456768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:39:05', '2020-04-29 18:39:05');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425425997697024', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:39:10', '2020-04-29 18:39:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425446956634112', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:39:15', '2020-04-29 18:39:15');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425467902988288', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:39:20', '2020-04-29 18:39:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425488866119680', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:39:25', '2020-04-29 18:39:25');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425509825056768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:39:30', '2020-04-29 18:39:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425530800771072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:39:35', '2020-04-29 18:39:35');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425551768096768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:39:40', '2020-04-29 18:39:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425572743811072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:39:45', '2020-04-29 18:39:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425593706942464', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:39:50', '2020-04-29 18:39:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425614678462464', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:39:55', '2020-04-29 18:39:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425635654176768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:40:00', '2020-04-29 18:40:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425656629891072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:40:05', '2020-04-29 18:40:05');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425677597216768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:40:10', '2020-04-29 18:40:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425698568736768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:40:15', '2020-04-29 18:40:15');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425719540256768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:40:20', '2020-04-29 18:40:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425740515971072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:40:25', '2020-04-29 18:40:25');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425761487491072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:40:30', '2020-04-29 18:40:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425782454816768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:40:35', '2020-04-29 18:40:35');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425803430531072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:40:40', '2020-04-29 18:40:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425824397856768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:40:45', '2020-04-29 18:40:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425845373571072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:40:50', '2020-04-29 18:40:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425866340896768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:40:55', '2020-04-29 18:40:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425887312416768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:41:00', '2020-04-29 18:41:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425908283936768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:41:05', '2020-04-29 18:41:05');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425929255456768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:41:10', '2020-04-29 18:41:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425950226976768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:41:15', '2020-04-29 18:41:15');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425971198496768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:41:20', '2020-04-29 18:41:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415425992165822464', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:41:25', '2020-04-29 18:41:25');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426013141536768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:41:30', '2020-04-29 18:41:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426034117251072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:41:35', '2020-04-29 18:41:35');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426055088771072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:41:40', '2020-04-29 18:41:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426076056096768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:41:45', '2020-04-29 18:41:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426117479043072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：4毫秒', '0', null, '2020-04-29 18:41:51', '2020-04-29 18:41:51');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426138983239680', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:42:00', '2020-04-29 18:42:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426180909502464', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:42:10', '2020-04-29 18:42:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426222856736768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:42:20', '2020-04-29 18:42:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426264799776768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:42:30', '2020-04-29 18:42:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426306742816768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:42:40', '2020-04-29 18:42:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426348685856768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:42:50', '2020-04-29 18:42:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426390633091072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:43:00', '2020-04-29 18:43:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426432580325376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:43:10', '2020-04-29 18:43:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426453539262464', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:43:15', '2020-04-29 18:43:15');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426474519171072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：2毫秒', '0', null, '2020-04-29 18:43:20', '2020-04-29 18:43:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426495486496768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:43:25', '2020-04-29 18:43:25');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426516462211072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:43:30', '2020-04-29 18:43:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426537437925376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:43:35', '2020-04-29 18:43:35');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426558417833984', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:43:40', '2020-04-29 18:43:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426579372576768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:43:45', '2020-04-29 18:43:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426600344096768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:43:50', '2020-04-29 18:43:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426789146497024', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：3毫秒', '0', null, '2020-04-29 18:44:35', '2020-04-29 18:44:35');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426810071879680', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:44:40', '2020-04-29 18:44:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426831039205376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:44:45', '2020-04-29 18:44:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426851998142464', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:44:50', '2020-04-29 18:44:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426872982245376', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:44:55', '2020-04-29 18:44:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426894041845760', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:45:00', '2020-04-29 18:45:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426914921091072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:45:05', '2020-04-29 18:45:05');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426935888416768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:45:10', '2020-04-29 18:45:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426956864131072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:45:15', '2020-04-29 18:45:15');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415426977835651072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-04-29 18:45:20', '2020-04-29 18:45:20');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415427019774496768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:45:30', '2020-04-29 18:45:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415427061713342464', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:45:40', '2020-04-29 18:45:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('415427103660576768', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：0毫秒', '0', null, '2020-04-29 18:45:50', '2020-04-29 18:45:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503199187412848640', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：45毫秒', '0', null, '2020-12-27 15:40:45', '2020-12-27 15:40:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503200830422388736', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：37毫秒', '0', null, '2020-12-27 15:47:17', '2020-12-27 15:47:17');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503205708326637568', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：148毫秒', '0', null, '2020-12-27 16:06:40', '2020-12-27 16:06:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503205749506314240', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：10毫秒', '0', null, '2020-12-27 16:06:50', '2020-12-27 16:06:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503205791440965632', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：5毫秒', '0', null, '2020-12-27 16:07:00', '2020-12-27 16:07:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503205917249114112', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：7毫秒', '0', null, '2020-12-27 16:07:30', '2020-12-27 16:07:30');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503205959217319936', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：8毫秒', '0', null, '2020-12-27 16:07:40', '2020-12-27 16:07:40');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503218856400130048', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：39毫秒', '0', null, '2020-12-27 16:58:55', '2020-12-27 16:58:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503222358929182720', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：2毫秒', '0', null, '2020-12-27 17:12:50', '2020-12-27 17:12:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503222379850371072', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：1毫秒', '0', null, '2020-12-27 17:12:55', '2020-12-27 17:12:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503222442806874112', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：3毫秒', '0', null, '2020-12-27 17:13:10', '2020-12-27 17:13:10');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503222463786782720', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：2毫秒', '0', null, '2020-12-27 17:13:15', '2020-12-27 17:13:15');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503222842696011776', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：5毫秒', '0', null, '2020-12-27 17:14:45', '2020-12-27 17:14:45');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503222862266634240', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：4毫秒', '0', null, '2020-12-27 17:14:50', '2020-12-27 17:14:50');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503222883204599808', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：3毫秒', '0', null, '2020-12-27 17:14:55', '2020-12-27 17:14:55');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503222904176119808', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：3毫秒', '1', 'ewrwerwer', '2020-12-27 17:15:00', '2020-12-30 17:15:00');
INSERT INTO `t_sys_quartz_job_log` VALUES ('503236547471085568', 'v2Task2', 'SYSTEM', 'v2Task.runTask2(1,2l,\'asa\',true,2D)', 'v2Task2 总共耗时：37毫秒', '0', null, '2020-12-27 18:09:13', '2020-12-27 18:09:13');

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('488243256161730560', '管理员');
INSERT INTO `t_sys_role` VALUES ('889159217641033728', '学生');
INSERT INTO `t_sys_role` VALUES ('889175176154058752', '超级管理员');

-- ----------------------------
-- Table structure for t_sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_user`;
CREATE TABLE `t_sys_role_user` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `sys_user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `sys_role_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户角色中间表';

-- ----------------------------
-- Records of t_sys_role_user
-- ----------------------------
INSERT INTO `t_sys_role_user` VALUES ('889498911369203712', 'X330326200310247433', '889159217641033728');
INSERT INTO `t_sys_role_user` VALUES ('894191136023908352', 'X330326200310247432', '889159217641033728');
INSERT INTO `t_sys_role_user` VALUES ('895101319268929536', 'X330326200310247433', '889159217641033728');
INSERT INTO `t_sys_role_user` VALUES ('897622539185033216', 'X330326200310247435', '889159217641033728');
INSERT INTO `t_sys_role_user` VALUES ('898011267627880448', 'X330326200310247439', '889175176154058752');
INSERT INTO `t_sys_role_user` VALUES ('898011267627880449', '898011267627880448', '889175176154058752');
INSERT INTO `t_sys_role_user` VALUES ('899587280849735680', '899587280845541376', '889175176154058752');
INSERT INTO `t_sys_role_user` VALUES ('904529947580829697', '904529947580829696', '488243256161730560');

-- ----------------------------
-- Table structure for t_sys_street
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_street`;
CREATE TABLE `t_sys_street` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增列',
  `street_code` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '街道代码',
  `area_code` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级区代码',
  `street_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '街道名称',
  `short_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '简称',
  `lng` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纬度',
  `sort` int DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `memo` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `data_state` int DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Index_1` (`street_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='街道设置';

-- ----------------------------
-- Records of t_sys_street
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户账号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户密码',
  `school_id` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('899587280845541376', 'root', '63a9f0ea7bb98050796b649e85481845', '0000');
INSERT INTO `t_sys_user` VALUES ('904529947580829696', 'qinghua', '21b6fe282fd67514b7dd062ebea60cd6', '0001');

-- ----------------------------
-- Table structure for t_test
-- ----------------------------
DROP TABLE IF EXISTS `t_test`;
CREATE TABLE `t_test` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `age` int DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `b_c_update` datetime DEFAULT NULL COMMENT '修改时间',
  `t_cb_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '写个字符串',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='测试表';

-- ----------------------------
-- Records of t_test
-- ----------------------------
INSERT INTO `t_test` VALUES ('457067146405613568', '管理员', '2', '1', '2021-01-14 16:00:00', '2021-01-15 16:00:00', '7');
INSERT INTO `t_test` VALUES ('457067174939463680', '法院用户', '2', '1', '2021-01-12 16:00:00', '2021-01-18 16:00:00', '');
INSERT INTO `t_test` VALUES ('457067196175224832', 'guest', '1', '3', '2021-01-02 16:00:00', '2021-01-16 16:00:00', '');
INSERT INTO `t_test` VALUES ('457067220279889920', 'helloword', '1', '3', '2021-01-03 16:00:00', '2021-01-25 16:00:00', '');
