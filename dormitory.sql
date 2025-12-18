/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : dormitory

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 07/06/2025 18:01:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adjust_room
-- ----------------------------
DROP TABLE IF EXISTS `adjust_room`;
CREATE TABLE `adjust_room`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `currentroom_id` int(0) NOT NULL COMMENT '当前房间',
  `currentbed_id` int(0) NOT NULL COMMENT '当前床位号',
  `towardsroom_id` int(0) NOT NULL COMMENT '目标房间',
  `towardsbed_id` int(0) NOT NULL COMMENT '目标床位号',
  `state` enum('未处理','通过','驳回') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '未处理' COMMENT '申请状态',
  `apply_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请时间',
  `finish_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adjust_room
-- ----------------------------
-- ----------------------------
-- Records of adjust_room (完整的前20条记录)
-- ----------------------------
INSERT INTO `adjust_room` VALUES (1, 'stu4', '李雷', 1102, 1, 1103, 3, '通过', '2022-02-15 09:12:34', '2022-02-16 14:25:18');
INSERT INTO `adjust_room` VALUES (2, 'stu1', '张三', 1101, 1, 1102, 4, '通过', '2022-02-17 14:35:02', '2022-03-19 23:07:21');
INSERT INTO `adjust_room` VALUES (3, 'stu5', '王梅', 1103, 4, 1105, 2, '驳回', '2022-02-18 10:22:15', '2022-02-20 11:05:33');
INSERT INTO `adjust_room` VALUES (4, 'stu7', '赵强', 1104, 3, 1102, 1, '通过', '2022-03-10 16:45:28', '2022-03-12 09:18:42');
INSERT INTO `adjust_room` VALUES (5, 'stu2', '田田', 1101, 2, 1104, 1, '通过', '2022-03-19 23:05:25', '2025-06-26 00:00:00');
INSERT INTO `adjust_room` VALUES (6, 'stu3', '吉安', 1101, 3, 1104, 2, '驳回', '2022-03-19 23:05:52', '2022-03-19 23:07:37');
INSERT INTO `adjust_room` VALUES (7, 'stu9', '德萨', 1103, 2, 1105, 1, '通过', '2022-03-19 23:06:18', '2025-06-24 00:00:00');
INSERT INTO `adjust_room` VALUES (8, 'stu6', '泡泡', 1102, 2, 1104, 4, '未处理', '2022-03-19 23:06:52', NULL);
INSERT INTO `adjust_room` VALUES (9, 'stu1', '张三', 1102, 4, 1101, 2, '未处理', '2025-06-19 00:00:00', NULL);
INSERT INTO `adjust_room` VALUES (10, 'stu8', '韩梅', 1105, 3, 1101, 4, '通过', '2022-04-05 08:30:45', '2022-04-07 15:20:10');
INSERT INTO `adjust_room` VALUES (11, 'stu10', '林涛', 1104, 2, 1103, 1, '驳回', '2022-04-12 14:15:33', '2022-04-14 10:45:22');
INSERT INTO `adjust_room` VALUES (12, 'stu11', '周华', 1101, 4, 1105, 3, '通过', '2022-05-03 11:20:18', '2022-05-05 16:30:55');
INSERT INTO `adjust_room` VALUES (13, 'stu12', '吴芳', 1103, 1, 1102, 2, '未处理', '2022-05-18 09:45:27', NULL);
INSERT INTO `adjust_room` VALUES (14, 'stu13', '郑阳', 1105, 4, 1104, 3, '通过', '2022-06-07 13:10:39', '2022-06-09 08:15:44');
INSERT INTO `adjust_room` VALUES (15, 'stu14', '孙丽', 1102, 3, 1103, 4, '驳回', '2022-06-15 16:25:50', '2022-06-17 14:05:36');
INSERT INTO `adjust_room` VALUES (16, 'stu15', '钱伟', 1104, 1, 1101, 3, '通过', '2022-09-01 10:30:15', '2022-09-03 09:40:28');
INSERT INTO `adjust_room` VALUES (17, 'stu16', '冯雪', 1103, 3, 1105, 2, '未处理', '2022-09-12 15:45:39', NULL);
INSERT INTO `adjust_room` VALUES (18, 'stu17', '陈明', 1101, 2, 1103, 1, '通过', '2022-10-05 08:20:54', '2022-10-07 11:35:47');
INSERT INTO `adjust_room` VALUES (19, 'stu18', '楚云', 1105, 1, 1102, 3, '驳回', '2022-10-18 14:15:48', '2022-10-20 16:25:39');
INSERT INTO `adjust_room` VALUES (20, 'stu19', '魏琳', 1104, 4, 1103, 2, '通过', '2022-11-02 09:30:57', '2022-11-04 13:45:51');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `gender` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `age` int(0) NOT NULL COMMENT '年龄',
  `phone_num` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', '123456', '小帅', '男', 18, '14785412478', NULL, '562642802ad241699f014c054f751f00.jpg');

-- ----------------------------
-- Table structure for dorm_build
-- ----------------------------
DROP TABLE IF EXISTS `dorm_build`;
CREATE TABLE `dorm_build`  (
  `dormbuild_id` int(0) NOT NULL COMMENT '宿舍楼号码',
  `dormbuild_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '宿舍楼名称',
  `dormbuild_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '宿舍楼备注',
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dorm_build (完整的前20条记录)
-- ----------------------------
INSERT INTO `dorm_build` VALUES (1, '一号楼', '本科生男宿舍', 1);
INSERT INTO `dorm_build` VALUES (2, '二号楼', '本科生女宿舍', 2);
INSERT INTO `dorm_build` VALUES (3, '三号楼', '研究生男宿舍', 3);
INSERT INTO `dorm_build` VALUES (4, '四号楼', '研究生女宿舍', 4);
INSERT INTO `dorm_build` VALUES (5, '五号楼', '博士生混合宿舍', 5);
INSERT INTO `dorm_build` VALUES (6, '六号楼', '留学生男宿舍', 6);
INSERT INTO `dorm_build` VALUES (7, '七号楼', '留学生女宿舍', 7);
INSERT INTO `dorm_build` VALUES (8, '八号楼', '教师公寓', 8);
INSERT INTO `dorm_build` VALUES (9, '九号楼', '交换生宿舍', 9);
INSERT INTO `dorm_build` VALUES (10, '十号楼', '实习生临时宿舍', 10);
INSERT INTO `dorm_build` VALUES (11, '十一号楼', '医学院学生宿舍', 11);
INSERT INTO `dorm_build` VALUES (12, '十二号楼', '体育特长生宿舍', 12);
INSERT INTO `dorm_build` VALUES (13, '十三号楼', '艺术类学生宿舍', 13);
INSERT INTO `dorm_build` VALUES (14, '十四号楼', '国际交流中心', 14);
INSERT INTO `dorm_build` VALUES (15, '十五号楼', '短期培训学员宿舍', 15);
INSERT INTO `dorm_build` VALUES (16, '十六号楼', '研究生夫妻宿舍', 16);
INSERT INTO `dorm_build` VALUES (17, '十七号楼', '访问学者公寓', 17);
INSERT INTO `dorm_build` VALUES (18, '十八号楼', '留学生家属楼', 18);
INSERT INTO `dorm_build` VALUES (19, '十九号楼', '教职工值班宿舍', 19);
INSERT INTO `dorm_build` VALUES (20, '二十号楼', '特殊需求学生宿舍', 20);

-- ----------------------------
-- Table structure for dorm_manager
-- ----------------------------
DROP TABLE IF EXISTS `dorm_manager`;
CREATE TABLE `dorm_manager`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '123456' COMMENT '密码',
  `dormbuild_id` int(0) NOT NULL COMMENT '所管理的宿舍楼栋号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `gender` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `age` int(0) NOT NULL COMMENT '年龄',
  `phone_num` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dorm_manager
-- ----------------------------
INSERT INTO `dorm_manager` VALUES ('dorm1', '123456', 2, '张三', '男', 35, '15995917873', NULL, NULL);
INSERT INTO `dorm_manager` VALUES ('dorm2', '123456', 10, '李四', '女', 55, '15995917874', NULL, NULL);
INSERT INTO `dorm_manager` VALUES ('dorm3', '123456', 1, '王五', '男', 38, '15896875201', NULL, NULL);
INSERT INTO `dorm_manager` VALUES ('dorm4', '123456', 4, '赵花', '女', 40, '15877535247', NULL, NULL);
INSERT INTO `dorm_manager` VALUES ('dorm5', '123456', 5, '钱伟', '男', 42, '15812345678', 'qianwei@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm6', '123456', 6, '孙芳', '女', 39, '15823456789', 'sunfang@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm7', '123456', 3, '周明', '男', 45, '15834567890', 'zhouming@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm8', '123456', 7, '吴静', '女', 37, '15845678901', 'wujing@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm9', '123456', 8, '郑强', '男', 50, '15856789012', 'zhengqiang@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm10', '123456', 9, '王丽', '女', 48, '15867890123', 'wangli@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm11', '123456', 11, '冯军', '男', 41, '15878901234', 'fengjun@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm12', '123456', 12, '陈雪', '女', 36, '15889012345', 'chenxue@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm13', '123456', 13, '楚阳', '男', 44, '15890123456', 'chuyang@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm14', '123456', 14, '魏敏', '女', 52, '15801234567', 'weimin@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm15', '123456', 15, '蒋峰', '男', 47, '15812345098', 'jiangfeng@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm16', '123456', 16, '沈梅', '女', 39, '15823450987', 'shenmei@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm17', '123456', 17, '韩刚', '男', 43, '15834509876', 'hangang@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm18', '123456', 18, '杨琳', '女', 38, '15845609876', 'yanglin@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm19', '123456', 19, '朱涛', '男', 51, '15856709876', 'zhutao@school.com', NULL);
INSERT INTO `dorm_manager` VALUES ('dorm20', '123456', 20, '秦芳', '女', 49, '15867809876', 'qinfang@school.com', NULL);

-- ----------------------------
-- Table structure for dorm_room
-- ----------------------------
DROP TABLE IF EXISTS `dorm_room`;
CREATE TABLE `dorm_room`  (
  `dormroom_id` int(0) NOT NULL COMMENT '宿舍房间号',
  `dormbuild_id` int(0) NOT NULL COMMENT '宿舍楼号',
  `floor_num` int(0) NOT NULL COMMENT '楼层',
  `max_capacity` int(0) NOT NULL DEFAULT 4 COMMENT '房间最大入住人数',
  `current_capacity` int(0) NOT NULL DEFAULT 0 COMMENT '当前房间入住人数',
  `first_bed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一号床位',
  `second_bed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二号床位',
  `third_bed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '三号床位',
  `fourth_bed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '四号床位',
  PRIMARY KEY (`dormroom_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Records of dorm_room (宿舍房间信息)
-- ----------------------------

INSERT INTO `dorm_room` VALUES (101, 1, 1, 4, 1, 'stu1', NULL, NULL, NULL);      -- 1号楼25%入住率
INSERT INTO `dorm_room` VALUES (102, 1, 1, 4, 0, NULL, NULL, NULL, NULL);        -- 空房间

INSERT INTO `dorm_room` VALUES (201, 2, 2, 4, 3, 'stu2', 'stu3', 'stu4', NULL);  -- 2号楼75%入住率
INSERT INTO `dorm_room` VALUES (202, 2, 2, 4, 2, NULL, 'stu5', NULL, 'stu6');    -- 混合入住

INSERT INTO `dorm_room` VALUES (301, 3, 3, 4, 4, 'stu7', 'stu8', 'stu9', 'stu10');-- 3号楼100%满员
INSERT INTO `dorm_room` VALUES (302, 3, 3, 4, 1, 'stu11', NULL, NULL, NULL);      -- 新入住

INSERT INTO `dorm_room` VALUES (401, 4, 4, 4, 2, NULL, NULL, 'stu12', 'stu13');   -- 4号楼50%入住率
INSERT INTO `dorm_room` VALUES (402, 4, 4, 4, 0, NULL, NULL, NULL, NULL);        -- 空房间

INSERT INTO `dorm_room` VALUES (501, 5, 5, 4, 1, NULL, 'stu14', NULL, NULL);     -- 5号楼25%入住率
INSERT INTO `dorm_room` VALUES (502, 5, 5, 4, 3, 'stu15', 'stu16', 'stu17', NULL);-- 混合入住

INSERT INTO `dorm_room` VALUES (601, 6, 6, 4, 0, NULL, NULL, NULL, NULL);        -- 6号楼空置
INSERT INTO `dorm_room` VALUES (602, 6, 6, 4, 2, 'stu18', NULL, 'stu19', NULL);   -- 准备入住

INSERT INTO `dorm_room` VALUES (701, 7, 7, 4, 4, 'stu20', 'stu21', 'stu22', 'stu23');-- 7号楼满员
INSERT INTO `dorm_room` VALUES (702, 7, 7, 4, 0, NULL, NULL, NULL, NULL);        -- 维修中

INSERT INTO `dorm_room` VALUES (801, 8, 8, 4, 3, 'stu24', NULL, 'stu25', 'stu26');-- 8号楼75%入住
INSERT INTO `dorm_room` VALUES (802, 8, 8, 4, 1, NULL, 'stu27', NULL, NULL);      -- 单人间

INSERT INTO `dorm_room` VALUES (901, 9, 9, 4, 2, 'stu28', NULL, NULL, 'stu29');  -- 9号楼50%入住
INSERT INTO `dorm_room` VALUES (902, 9, 9, 4, 0, NULL, NULL, NULL, NULL);        -- 空房间

INSERT INTO `dorm_room` VALUES (1001, 10, 10, 4, 1, NULL, NULL, 'stu30', NULL);   -- 10号楼25%入住
INSERT INTO `dorm_room` VALUES (1002, 10, 10, 4, 4, 'stu31', 'stu32', 'stu33', 'stu34');-- 新生入住

-- 10号楼（60%入住率）
INSERT INTO `dorm_room` VALUES (1001, 10, 10, 4, 3, 'stu35', 'stu36', 'stu37', NULL);
INSERT INTO `dorm_room` VALUES (1002, 10, 10, 4, 4, 'stu31', 'stu32', 'stu33', 'stu34');

-- 11号楼（37.5%入住率）
INSERT INTO `dorm_room` VALUES (1101, 11, 11, 4, 2, 'stu38', NULL, 'stu39', NULL);
INSERT INTO `dorm_room` VALUES (1102, 11, 11, 4, 1, NULL, 'stu40', NULL, NULL);

-- 12号楼（75%入住率）
INSERT INTO `dorm_room` VALUES (1201, 12, 12, 4, 4, 'stu41', 'stu42', 'stu43', 'stu44');
INSERT INTO `dorm_room` VALUES (1202, 12, 12, 4, 2, NULL, 'stu45', NULL, 'stu46');

-- 13号楼（25%入住率）
INSERT INTO `dorm_room` VALUES (1301, 13, 13, 4, 1, 'stu47', NULL, NULL, NULL);
INSERT INTO `dorm_room` VALUES (1302, 13, 13, 4, 0, NULL, NULL, NULL, NULL);

-- 14号楼（50%入住率）
INSERT INTO `dorm_room` VALUES (1401, 14, 14, 4, 2, 'stu48', NULL, 'stu49', NULL);
INSERT INTO `dorm_room` VALUES (1402, 14, 14, 4, 2, NULL, 'stu50', NULL, 'stu51');

-- 15号楼（87.5%入住率）
INSERT INTO `dorm_room` VALUES (1501, 15, 15, 4, 4, 'stu52', 'stu53', 'stu54', 'stu55');
INSERT INTO `dorm_room` VALUES (1502, 15, 15, 4, 3, 'stu56', 'stu57', 'stu58', NULL);

-- 16号楼（12.5%入住率）
INSERT INTO `dorm_room` VALUES (1601, 16, 16, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `dorm_room` VALUES (1602, 16, 16, 4, 1, NULL, NULL, 'stu59', NULL);

-- 17号楼（62.5%入住率）
INSERT INTO `dorm_room` VALUES (1701, 17, 17, 4, 3, 'stu60', 'stu61', 'stu62', NULL);
INSERT INTO `dorm_room` VALUES (1702, 17, 17, 4, 2, NULL, 'stu63', NULL, 'stu64');

-- 18号楼（100%满员）
INSERT INTO `dorm_room` VALUES (1801, 18, 18, 4, 4, 'stu65', 'stu66', 'stu67', 'stu68');
INSERT INTO `dorm_room` VALUES (1802, 18, 18, 4, 4, 'stu69', 'stu70', 'stu71', 'stu72');

-- 19号楼（31.25%入住率）
INSERT INTO `dorm_room` VALUES (1901, 19, 19, 4, 1, 'stu73', NULL, NULL, NULL);
INSERT INTO `dorm_room` VALUES (1902, 19, 19, 4, 1, NULL, NULL, 'stu74', NULL);

-- 20号楼（18.75%入住率）
INSERT INTO `dorm_room` VALUES (2001, 20, 20, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `dorm_room` VALUES (2002, 20, 20, 4, 3, 'stu75', 'stu76', 'stu77', NULL);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `release_time` datetime(0) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice (完整的前20条记录)
-- ----------------------------
INSERT INTO `notice` VALUES (1, '入冬提醒', '<p>近期我校所在地区天气逐渐降低，同学们要注意多穿衣服，少熬夜，避免感染风寒！</p>', '', '2022-02-14 00:09:08');
INSERT INTO `notice` VALUES (2, '关于宿舍卫生的新规定', '<p>学生公寓是学生们主要的生活区域，兼具休息、学习、交际等多种功能，是培养、提升学生全面素质不可或缺的重要阵地。为了培养学生良好的行为素养和生活习惯，我们实行宿舍长内务准军事化管理，切实把学生公寓建成学生自我教育，自我管理和自我服务的家园。</p>', '张三', '2022-02-14 00:02:59');
INSERT INTO `notice` VALUES (3, '期末考试通知', '<p>学期末降至，本学期所教授的课程也接近尾声，同学们利用好最后一段时间，好好复习争取考个好成绩！</p>', '教务部', '2022-02-14 01:38:04');
INSERT INTO `notice` VALUES (4, '校园网络安全公告', '<p>近期发现不明来源的钓鱼网站冒用我校系统，请同学们提高警惕，不要点击可疑链接。如有账号安全问题请及时联系网络中心。</p>', '王主任', '2022-02-15 10:25:33');
INSERT INTO `notice` VALUES (5, '图书馆开馆时间调整', '<p>因考试季临近，即日起至月底图书馆开放时间调整为7:00-22:30，请同学们合理安排学习时间。</p>', '李老师', '2022-02-16 09:18:42');
INSERT INTO `notice` VALUES (6, '校园班车时间变更', '<p>东校门至西校区的往返班车发车时间变更，工作日高峰时段增加两班车次，具体时间见校园APP。</p>', '后勤处', '2022-02-17 14:22:51');
INSERT INTO `notice` VALUES (7, '食堂服务满意度调查', '<p>为提升餐饮服务质量，膳食服务中心开展满意度调查，扫码即可参与，意见被采纳者将获得餐券奖励。</p>', '餐饮中心', '2022-02-18 08:45:19');
INSERT INTO `notice` VALUES (8, '体育场馆维护通知', '<p>体育馆将在3月1日-3月5日进行地板维护，期间暂停开放，请同学们提前安排好锻炼计划。</p>', '体育部', '2022-02-18 11:37:05');
INSERT INTO `notice` VALUES (9, '学术讲座：人工智能前沿', '<p>计算机学院将于本周五15:00在报告厅举办AI前沿讲座，特邀王海教授主讲，欢迎全校师生参加。</p>', '科研处', '2022-02-18 13:20:48');
INSERT INTO `notice` VALUES (10, '关于东总配电室倒闸操作的停电通知', '<p>各学院、部处及广大师生员工：</p><p>因中关村校区东总配电室201路高压微机保护故障维修，经校领导批准，我公司定于1月27日晚对东总配电室及下级所属配电室进行相应的停电倒闸操作。请广大师生提前做好停电准备，并在送电后，检查本单位的供电设备运行情况。各配电室具体停电时间如下：</p><p><strong>1极27日/周四 &nbsp;22:00-23:00</strong></p><p><strong>中心教学楼配电室：</strong>中心教学楼、7#教学楼、逸夫楼、4#教学楼</p><p><strong>求是楼配电室：</strong>求是楼、2#楼电话室、10#办公楼、3#教学楼、理工餐厅、菜市场、保卫部、劳服办公楼</p><p><strong>4#教学楼配电室：</strong>三系实验区（南围墙）、图书馆、档案馆</p><p><strong>5#教学楼配电室：</strong>5#教学楼、小白楼、主楼、1#信息楼（原国防科工委）、理工加油站、南围墙三系实验区、车辆实验楼、原东车库实验、四号教学楼一层东侧实验区</p><p><strong>10#信息楼配电室：</strong>10#信息楼、先进加工实验楼、研教楼、8#教学楼、中南门值班室</p><p><strong>东总配：</strong>2#办公楼、招待所、保卫部监控中心、网络信息技术中心、老校史馆、八系重点实验楼、东北门、计算机学院学生工作室、外国专家公寓、原靶道实验室、广播楼、东平房实验室、2#楼电话室</p><p><strong>宇航楼配电室：</strong>宇航楼、1#教学楼、农科院家属楼、东平方实验室（喷涂）</p><p><strong>校医院配电室：</strong>校医院</p>', '大强', '2022-02-18 17:14:36');
INSERT INTO `notice` VALUES (11, '实验室安全规范培训', '<p>所有使用化学实验室的学生须参加本月25日14:00的安全规范培训，未参加者将暂停实验权限。</p>', '安保处', '2022-02-18 17:15:25');
INSERT INTO `notice` VALUES (12, '中关村校区紧急停热抢修通知', '<p>各位师生：您们好</p><p>中关村校区供热主干管突发爆管漏水，系统失压致使供热锅炉停止运行。学生公寓和公共浴室，自今日起停供洗澡水，待管道修复后，恢复供应。给您的生活带来不便，敬请谅解！谢谢您的支持！</p>', '大强', '2022-02-18 17:15:43');
INSERT INTO `notice` VALUES (13, '【教师发展中心】教学一对一咨询预约服务', '<p>为帮助广大教师解决教学能力提升和职业生涯发展中遇到的问题和困惑，教师发展中心汇聚了多名教学名师和专家，为我校教师提供个性化咨询服务，内容包括课堂教学、教改项目、教学竞赛、教学研究、职业发展规划等方面。欢迎感兴趣的老师报名参与！</p><p>　　【预约方式】</p><p>　　请扫描下方二维码填写信息，我们将尽快和您联系（三个工作日内），安排具体咨询时段。</p>', '大强', '2022-02-19 00:00:00');
INSERT INTO `notice` VALUES (14, '2022年寒假网络收费时间', '<p>&nbsp;时间：1月19日、1月26日、2月9日、2月16日</p><p>　　&nbsp;&nbsp;&nbsp;&nbsp; 上午9：00—11：30　下午1：30—4：00</p><p>&nbsp;&nbsp;&nbsp; 地点：中关村校区信息中心楼网络信息技术中心314室</p><p>&nbsp;&nbsp;&nbsp; 电话：6891482766</p><p>网络信息技术中心</p>', '大强', '2022-02-18 17:17:39');
INSERT INTO `notice` VALUES (15, '2021年度国家社会科学基金项目申报公告', '<p><strong>2021年度国家社会科学基金项目申报公告</strong></p><p>经全国哲学社会科学工作领导小组批准，现予发布《国家社科基金项目2021年度课题指南》，并就做好2021年度国家社科基金项目申报工作的有关事项公告如下：</p><p>一、申报国家社科基金项目的指导思想是，高举中国特色社会主义伟大旗帜，以马克思列宁主义、毛泽东思想、邓小平理论、"三个代表"重要思想、科学发展观、习近平新时代中国特色社会主义思想为指导，深入贯彻落实党的十九大和十九届二中、三中、四中、五中全会精神，落实《中共中央关于加快构建中国特色哲学社会科学的意见》，坚持解放思想、实事求是、与时俱进、求真务实，坚持以重大现实问题为主攻方向，坚持基础研究和应用研究并重，发挥国家社科基金示范引导作用，加快构建中国特色哲学社会科学，为党和国家工作大局服务，为繁荣发展哲学社会科学服务。</p><p>二、《国家社科基金项目2021年度课题指南》围绕深入学习贯彻习近平新时代中国特色社会主义思想、党的十九大和十九届二中、三中、四中、五中全会精神，在相关学科中拟定了一批重要选题，申请人可结合自己的学术专长和研究基础选择申报。</p><p>三、申报国家社科基金项目，要体现鲜明的时代特征、问题导向和创新意识，着力推出体现国家水准的研究成果。基础研究要密切跟踪国内外学术发展和学科建设的前沿和动态，着力推进学科体系、学术体系、话语体系建设和创新，力求具有原创性、开拓性和较高的学术思想价值；应用研究要立足党和国家事业发展需要，聚焦经济社会发展中的全局性、战略性和前瞻性的重大理论与实践问题，力求具有现实性、针对性和较强的决策参考价值。</p><p>四、课题申请人须具备下列条件：遵守中华人民共和国宪法和法律；具有独立开展研究和组织开展研究的能力，能够承担实质性研究工作；具有副高级以上（含）专业技术职称（职务），或者具有博士学位。不具有副高级以上（含）专业技术职称（职务）或者博士学位的，可以申请青年项目，不再需要专家书面推荐。青年项目申请人的年龄不得超过35周岁（1986年3月15日后出生）。课题组成员须征得本人同意并签字确认，否则视为违规申报。申请人可以根据研究的实际需要，吸收境外研究人员作为课题组成员参与申请。全日制在读研究生不能申请。在站博士后人员均可申请，其中在职博士后可以从所在工作单位或博士后工作站申请，全脱产博士后从所在博士后工作站申请。</p>', '大强', '2022-02-18 17:18:27');
INSERT INTO `notice` VALUES (16, '宿舍热水供应调整通知', '<p>因设备维护，2号楼、4号楼每晚22:00-次日6:00暂停热水供应，请同学们合理安排洗漱时间。</p>', '后勤部', '2022-02-19 09:30:15');
INSERT INTO `notice` VALUES (17, '奖学金申请材料提交说明', '<p>2021-2022学年奖学金申请系统已开放，请同学们在3月1日前完成线上申请并提交相关证明材料。</p>', '学工处', '2022-02-20 14:22:47');
INSERT INTO `notice` VALUES (18, '校园门禁系统升级公告', '<p>自3月1日起启用新门禁系统，师生可使用校园卡或APP二维码进出校园。原门禁卡将停止使用。</p>', '安保处', '2022-02-21 16:18:33');
INSERT INTO `notice` VALUES (19, '心理健康教育讲座安排', '<p>学生心理咨询中心将在每周三19:00举办心理健康讲座，第一讲："压力管理与情绪调节"，欢迎参加。</p>', '心理中心', '2022-02-22 10:45:09');
INSERT INTO `notice` VALUES (20, '毕业典礼预通知', '<p>2022届毕业典礼暂定6月15日举行，请毕业生提前准备学位服等事宜，具体安排另行通知。</p>', '校办', '2022-02-23 15:32:44');
-- ----------------------------
-- Table structure for repair
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `repairer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报修人',
  `dormbuild_id` int(0) NOT NULL COMMENT '报修宿舍楼',
  `dormroom_id` int(0) NOT NULL COMMENT '报修宿舍房间号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单内容',
  `state` enum('完成','未完成') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '未完成' COMMENT '订单状态（是否维修完成）',
  `order_buildtime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '订单创建时间',
  `order_finishtime` datetime(0) NULL DEFAULT NULL COMMENT '订单完成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1413525505 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair
-- ----------------------------

INSERT INTO `repair` VALUES (1, '强强', 1, 1101, '水龙头损坏', '水龙头损坏，请来1-1101宿舍修理', '完成', '2022-01-11 22:52:24', '2022-02-17 14:35:02');
INSERT INTO `repair` VALUES (2, '七七', 1, 1101, '门把手损坏', '门把手损坏，请来修理', '完成', '2022-01-17 23:11:13', '2022-02-17 14:31:14');
INSERT INTO `repair` VALUES (3, '丽丽', 2, 2102, '水池损坏', '水池损坏，请来修理', '完成', '2022-01-17 23:10:35', '2022-02-15 16:16:15');
INSERT INTO `repair` VALUES (4, '贝贝', 1, 1102, '阳台漏水', '宿舍阳台漏水，速来修理', '完成', '2022-01-17 23:12:16', '2022-02-17 14:32:38');
INSERT INTO `repair` VALUES (5, '哈哈', 1, 1101, '窗台损坏', '宿舍窗台损坏，速来修理', '未完成', '2022-02-18 22:35:37', NULL);
INSERT INTO `repair` VALUES (6, '张三', 1, 1101, '天花板漏水', '浴室天花板漏水', '完成', '2022-03-03 21:00:21', '2022-03-10 14:39:10');
INSERT INTO `repair` VALUES (7, '张三', 1, 1101, '阳台漏水', '阳台使用时会漏水请来修理', '完成', '2022-03-14 20:37:35', '2025-06-26 00:00:00');
INSERT INTO `repair` VALUES (8,'李四', 2, 2101, '门锁损坏', '宿舍门锁无法正常打开', '完成', '2025-06-10 09:15:00', '2025-06-12 14:30:00');
INSERT INTO `repair` VALUES (9,'王五', 3, 3101, '电源插座损坏', '靠门右侧的电源插座无法通电', '未完成', '2025-06-11 10:30:00', NULL);
INSERT INTO `repair` VALUES (10,'赵六', 1, 1105, '床架松动', '2号床床架连接处松动，需要加固', '完成', '2025-06-12 11:45:00', '2025-06-14 15:20:00');
INSERT INTO `repair` VALUES (11,'孙七', 4, 4103, '纱窗破损', '靠阳台的纱窗有一个大洞，需要更换', '未完成', '2025-06-13 13:00:00', NULL);
INSERT INTO `repair` VALUES (12,'周八', 2, 2202, '卫生间漏水', '卫生间下水管漏水', '完成', '2025-06-14 14:15:00', '2025-06-16 16:45:00');
INSERT INTO `repair` VALUES (13,'吴九', 1, 1201, '柜门掉落', '3号柜子的柜门完全掉落了', '未完成', '2025-06-15 15:30:00', NULL);
INSERT INTO `repair` VALUES (14,'郑十', 3, 3301, '空调故障', '空调无法制冷', '完成', '2025-06-16 16:45:00', '2025-06-18 17:50:00');
INSERT INTO `repair` VALUES (15,'陈一', 4, 4201, '窗户关不严', '靠走廊的窗户无法完全关闭', '未完成', '2025-06-17 08:00:00', NULL);
INSERT INTO `repair` VALUES (16,'林二', 1, 1302, '书桌变形', '靠暖气片处的书桌因受潮变形', '完成', '2025-06-18 09:15:00', '2025-06-20 10:25:00');
INSERT INTO `repair` VALUES (17,'黄三', 2, 2303, '灯管不亮', '宿舍中间的灯管完全不亮', '未完成', '2025-06-19 10:30:00', NULL);
INSERT INTO `repair` VALUES (18,'刘四', 3, 3104, '水龙头漏水', '洗漱池水龙头无法完全关闭，持续滴水', '完成', '2025-06-20 11:45:00', '2025-06-22 13:55:00');
INSERT INTO `repair` VALUES (19,'朱五', 4, 4304, '衣柜门卡住', '1号衣柜门卡住无法正常打开', '未完成', '2025-06-21 13:00:00', NULL);
INSERT INTO `repair` VALUES (20,'马六', 1, 1103, '窗帘轨道损坏', '左侧窗帘轨道部分脱落', '完成', '2025-06-22 14:15:00', '2025-06-24 15:35:00');
INSERT INTO `repair` VALUES (21,'钟七', 2, 2105, '厕所堵塞', '冲水后水位上涨，排泄物无法冲走', '未完成', '2025-06-23 15:30:00', NULL);




-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '123456' COMMENT '密码',
  `age` int(0) UNSIGNED NOT NULL COMMENT '年龄',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `gender` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `phone_num` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`username`) USING BTREE,
  UNIQUE INDEX `stu_num`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('stu1', '123456', 18, '张三', '男', '15875696511', NULL, '453ce92a82a447cfbd7a92bd7c9f2cbe.jpg');
INSERT INTO `student` VALUES ('stu10', '123456', 19, '马克', '女', '15889635874', NULL, NULL);
INSERT INTO `student` VALUES ('stu11', '123456', 16, '巧巧', '女', '18978431781', NULL, NULL);
INSERT INTO `student` VALUES ('stu12', '123456', 17, '丽丽', '女', '17986573547', NULL, NULL);
INSERT INTO `student` VALUES ('stu13', '123456', 18, '美美', '女', '15896475354', NULL, NULL);
INSERT INTO `student` VALUES ('stu14', '123456', 20, '拉拉', '女', '14896527357', NULL, NULL);
INSERT INTO `student` VALUES ('stu15', '123456', 18, '贝贝', '男', '15896745351', NULL, NULL);
INSERT INTO `student` VALUES ('stu16', '123456', 18, '力力', '男', '14596475257', NULL, NULL);
INSERT INTO `student` VALUES ('stu17', '123456', 18, '阿成', '男', '15896542147', NULL, NULL);
INSERT INTO `student` VALUES ('stu18', '123456', 19, '阿达', '女', '14785635874', NULL, NULL);
INSERT INTO `student` VALUES ('stu19', '123456', 19, '帕森斯', '男', '15889658475', NULL, NULL);
INSERT INTO `student` VALUES ('stu2', '123456', 18, '田田', '男', '15875359641', NULL, NULL);
INSERT INTO `student` VALUES ('stu20', '123456', 21, '柠檬', '男', '15874563558', NULL, NULL);
INSERT INTO `student` VALUES ('stu21', '123456', 21, '面对', '男', '15889635874', NULL, NULL);
INSERT INTO `student` VALUES ('stu22', '123456', 25, '等等', '男', '15589963321', NULL, NULL);
INSERT INTO `student` VALUES ('stu3', '123456', 18, '吉安', '男', '15798657350', NULL, NULL);
INSERT INTO `student` VALUES ('stu4', '123456', 22, '力力', '男', '15878965874', NULL, NULL);
INSERT INTO `student` VALUES ('stu5', '123456', 19, '哦哦', '男', '15897535478', NULL, NULL);
INSERT INTO `student` VALUES ('stu6', '123456', 18, '泡泡', '男', '18987554765', NULL, NULL);
INSERT INTO `student` VALUES ('stu7', '123456', 15, '刚刚', '男', '15897543854', NULL, NULL);
INSERT INTO `student` VALUES ('stu8', '123456', 18, '七七', '男', '12332143215', NULL, NULL);
INSERT INTO `student` VALUES ('stu9', '123456', 20, '德萨', '男', '15889658741', NULL, NULL);

-- ----------------------------
-- Table structure for visitor
-- ----------------------------
DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `gender` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `phone_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `origin_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源城市',
  `visit_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '来访时间',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of visitor
-- ----------------------------
INSERT INTO `visitor` VALUES (1, '张三', '男', '14587896544', '武汉', '2022-02-21 17:34:52', '探访孩子');
INSERT INTO `visitor` VALUES (2, '李四', '女', '15774147563', '江苏', '2022-01-24 17:08:06', '运送快递');
INSERT INTO `visitor` VALUES (3, '王五', '男', '14588635774', '湖北', '2022-01-27 16:41:21', '运送食品');
INSERT INTO `visitor` VALUES (4,'刘六', '男', '15612345678', '北京', '2025-06-10 08:00:00', '探访朋友');
INSERT INTO `visitor` VALUES (5,'赵七', '女', '15723456789', '上海', '2025-06-10 09:15:00', '家长会');
INSERT INTO `visitor` VALUES (6,'钱八', '男', '15834567890', '广州', '2025-06-11 10:30:00', '送物资');
INSERT INTO `visitor` VALUES (7,'孙九', '女', '15945678901', '深圳', '2025-06-11 11:45:00', '探望生病同学');
INSERT INTO `visitor` VALUES (8,'李十', '男', '15056789012', '天津', '2025-06-12 13:00:00', '面试辅导');
INSERT INTO `visitor` VALUES (9,'周五', '女', '15167890123', '重庆', '2025-06-12 14:15:00', '社团活动');
INSERT INTO `visitor` VALUES (10,'吴六', '男', '15278901234', '南京', '2025-06-13 15:30:00', '维修电脑');
INSERT INTO `visitor` VALUES (11,'郑七', '女', '15389012345', '杭州', '2025-06-13 16:45:00', '节日活动策划');
INSERT INTO `visitor` VALUES (12,'王八', '男', '15490123456', '成都', '2025-06-14 08:30:00', '送课本');
INSERT INTO `visitor` VALUES (13,'冯九', '女', '15501234567', '西安', '2025-06-14 10:45:00', '宿舍物品交接');
INSERT INTO `visitor` VALUES (14,'陈十', '男', '15612345670', '郑州', '2025-06-15 13:00:00', '科研合作讨论');
INSERT INTO `visitor` VALUES (15,'褚六', '女', '15723456701', '青岛', '2025-06-15 14:15:00', '社会实践调研');
INSERT INTO `visitor` VALUES (16,'卫七', '男', '15834567012', '大连', '2025-06-16 15:30:00', '校友返校交流');
INSERT INTO `visitor` VALUES (17,'蒋八', '女', '15945670123', '长沙', '2025-06-16 16:45:00', '招聘宣讲');
INSERT INTO `visitor` VALUES (18,'沈九', '男', '15056701234', '昆明', '2025-06-17 09:00:00', '送资料');
INSERT INTO `visitor` VALUES (19,'韩十', '女', '15167012345', '厦门', '2025-06-17 10:15:00', '学生会会议');
INSERT INTO `visitor` VALUES (20,'杨六', '男', '15278123456', '苏州', '2025-06-18 11:30:00', '设备维修');

SET FOREIGN_KEY_CHECKS = 1;
