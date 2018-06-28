/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : smartcampus

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 28/06/2018 10:36:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `au_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名，比如老师、学生、商户',
  `au_details` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限职能描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (1, '学生', '我的一卡通，我的订单');
INSERT INTO `authority` VALUES (2, '教师', '我的一卡通 审核学生申请的一卡通 我的订单');
INSERT INTO `authority` VALUES (3, '商户', '我的商品 我要上架 我要下架');

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '一卡通编号',
  `card_vid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card_balance` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '一卡通余额',
  `sq_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请ID',
  `auth_id` int(11) NOT NULL COMMENT '一卡通权限',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0不可用1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES (1, '1', '5000000', '2018001', 1, '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名',
  `g_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品价格',
  `g_ly` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品来源',
  `g_vid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '条形码',
  `g_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `g_simg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品缩略图',
  `g_label` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `g_details` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品详情',
  `g_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品状态 1上架 0下架 -1缺货',
  `s_i_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家表ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 'Aptamil爱他美', '195', '天猫', '13146767845', 'https://gw.alicdn.com/bao/uploaded/i1/725677994/TB2VLAgzf1TBuNjy0FjXXajyXXa_!!725677994-0-sm.jpg', 'https://gw.alicdn.com/bao/uploaded/i1/725677994/TB2VLAgzf1TBuNjy0FjXXajyXXa_!!725677994-0-sm.jpg', '奶粉', 'Aptamil爱他美 德国进口 幼儿配方奶粉3段 12-36月 800g\r\n德国原装进口 特有亲源配方 品牌直供', '1', '1');
INSERT INTO `goods` VALUES (2, '帆布手提包', '1828', '京东', '34534576867345', 'https://img.alicdn.com/tfscom/TB2hhk3XHRkpuFjSspmXXc.9XXa_!!0-dgshop.jpg', 'https://img.alicdn.com/tfscom/TB2hhk3XHRkpuFjSspmXXc.9XXa_!!0-dgshop.jpg', '手提包', '复古是永恒不变的时尚亮点，不会随时间与大环境的改变而过时，来自Original Penguin的这款单肩包，使用了棕色与绿色的撞色拼接，和谐耐看，彰显淡雅平静的典雅气质。', '1', '1');
INSERT INTO `goods` VALUES (3, '荷兰进口谷物麦片', '188', '天猫', '2436567345578', 'https://img.alicdn.com/tfscom/TB2ED.gXYBmpuFjSZFuXXaG_XXa_!!0-dgshop.jpg', 'https://img.alicdn.com/tfscom/TB2ED.gXYBmpuFjSZFuXXaG_XXa_!!0-dgshop.jpg', '谷物', ' 人食五谷身体好。除了大米以为五谷杂粮也是营养很丰富的哦。荷兰进口的混合物麦片，是早餐的不错选择哦。混合谷物麦片是魔力麦片哦，它融入了奶粉，速溶的香草乳粉麦片营养价值颇高哦', '0', '1');
INSERT INTO `goods` VALUES (8, '创意大象毛绒公仔', '225', '唯品会', '34567456342', 'https://img.alicdn.com/tfscom/TB2pOHQXWi5V1BjSszdXXXUJXXa_!!0-dgshop.jpg', 'https://img.alicdn.com/tfscom/TB2pOHQXWi5V1BjSszdXXXUJXXa_!!0-dgshop.jpg', '家居', '听！走过来一头蓝色的大象，迈着大大步子缓缓远离尘嚣，这大概就是它喜欢做的事情吧！迈着轻快的步子外出散步，并享受着大耳朵沐浴在阳光中的舒适。', '0', '2');
INSERT INTO `goods` VALUES (9, '麦卢卡蜂蜜酒', '290', '苏宁易购', '35365356678567', 'https://img.alicdn.com/tfscom/TB2FPkbXr0kpuFjy0FjXXcBbVXa_!!0-dgshop.jpg', 'https://img.alicdn.com/tfscom/TB2FPkbXr0kpuFjy0FjXXcBbVXa_!!0-dgshop.jpg', '酒水', '新西兰原装进口麦卢卡蜂蜜酒，采摘当地特有珍稀树种麦卢卡花蜜酿造出的蜂蜜，经过自然发酵之后成酒，口感香甜醇厚并带有花朵芳香，内含独特抗菌和抗氧化物质独麦素。', '1', '2');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `user_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `g_id` int(11) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`user_uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 1);

-- ----------------------------
-- Table structure for shop_info
-- ----------------------------
DROP TABLE IF EXISTS `shop_info`;
CREATE TABLE `shop_info`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自动生成UUID',
  `shop_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家名',
  `show_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家地址',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否可用 0不可用 1可用',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_info
-- ----------------------------
INSERT INTO `shop_info` VALUES ('1', '京东超市', '苏州市吴江区金家坝镇金长路1248号', '1');
INSERT INTO `shop_info` VALUES ('2', '天猫超市', '南京市雨花台区软件大道109号', '0');
INSERT INTO `shop_info` VALUES ('3', '苏宁易购', '京市秦淮区中山南路49号商茂世纪广场3层', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自动生成UUID',
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号/教师账号 系统生成',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码，手机登录无需密码',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否可用，0不可用，1可用',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0邮箱，1手机，2帐号',
  `auth_id` int(11) NOT NULL COMMENT '用户权限',
  `shop_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0普通用户 1商家',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', '1', '0', '1', 1, '0');
INSERT INTO `user` VALUES ('2', '2', '2', '0', '0', 2, '1');
INSERT INTO `user` VALUES ('3', '3', '3', '1', '2', 3, '0');

SET FOREIGN_KEY_CHECKS = 1;
