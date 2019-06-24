/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : daily

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 24/06/2019 10:06:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addfriend
-- ----------------------------
DROP TABLE IF EXISTS `addfriend`;
CREATE TABLE `addfriend`  (
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NULL DEFAULT NULL,
  `agree` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daily_id` int(11) NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `com_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 1, 'wsx', 1, 'sdfsdfsdfsgdergergerfgreg');
INSERT INTO `comments` VALUES (2, 1, 'sdfsdf', 1, 'gdegregergergfreger');
INSERT INTO `comments` VALUES (3, 3, 'dfgdfgdfg', 3, 'sdfsdgfrfgergergergerg');

-- ----------------------------
-- Table structure for friends
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends`  (
  `owner_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES (1, 2);
INSERT INTO `friends` VALUES (1, 4);
INSERT INTO `friends` VALUES (1, 5);
INSERT INTO `friends` VALUES (1, 6);
INSERT INTO `friends` VALUES (1, 7);
INSERT INTO `friends` VALUES (1, 8);
INSERT INTO `friends` VALUES (1, 9);
INSERT INTO `friends` VALUES (2, 1);
INSERT INTO `friends` VALUES (1, 3);

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `sender` int(11) NULL DEFAULT NULL,
  `receiver` int(11) NULL DEFAULT NULL,
  `owner_id` int(11) NULL DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `sendto` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (2, 1, 1, '你属狗', '2019-06-15 09:59:11', 2);
INSERT INTO `messages` VALUES (1, 2, 1, '啥？', '2019-06-15 10:01:01', 2);
INSERT INTO `messages` VALUES (2, 1, 1, '因为我属猪', '2019-06-15 10:02:13', 2);
INSERT INTO `messages` VALUES (2, 1, 1, '这样在十二生肖里面我就可以靠得近', '2019-06-15 10:03:24', 2);
INSERT INTO `messages` VALUES (2, 1, 1, '猪狗不如说得就是我们俩是不是很亲切呀', '2019-06-15 10:04:45', 2);
INSERT INTO `messages` VALUES (1, 2, 1, '你好', '2019-06-15 10:05:11', 2);
INSERT INTO `messages` VALUES (2, 1, 1, 'Hi,很高兴认识你，感觉我们能成为好朋友呢', '2019-06-15 10:06:16', 2);
INSERT INTO `messages` VALUES (1, 2, 1, '你说这话认真的吗？', '2019-06-15 10:07:34', 2);
INSERT INTO `messages` VALUES (2, 1, 1, '特别是那衣服显得人很精神', '2019-06-15 10:08:24', 2);
INSERT INTO `messages` VALUES (2, 1, 1, '今天又是愉快的一天呢！', '2019-06-15 10:08:45', 2);
INSERT INTO `messages` VALUES (1, 2, 1, '是啊！我爱学习', '2019-06-15 10:09:41', 2);
INSERT INTO `messages` VALUES (2, 1, 1, '我爱敲代码！', '2019-06-15 10:10:16', 2);
INSERT INTO `messages` VALUES (2, 1, 1, '我是谷歌派去微软的卧底！', '2019-06-15 10:12:43', 2);
INSERT INTO `messages` VALUES (1, 2, 1, '哈哈哈哈哈哈哈', '2019-06-15 10:14:11', 2);
INSERT INTO `messages` VALUES (2, 1, 1, '嘿嘿~', '2019-06-15 10:16:11', 2);
INSERT INTO `messages` VALUES (1, 2, 1, '你就是你的神经病', '2019-06-17 11:04:33', 2);
INSERT INTO `messages` VALUES (2, 1, 1, '你喜欢神经病吗？', '2019-06-17 12:04:33', 2);
INSERT INTO `messages` VALUES (1, 2, 1, '你真骚', '2019-06-17 14:04:33', 2);
INSERT INTO `messages` VALUES (1, 2, 1, '撒旦发射点', '2019-06-18 10:09:53', 2);
INSERT INTO `messages` VALUES (1, 2, 2, '撒旦发射点', '2019-06-18 10:09:53', 1);
INSERT INTO `messages` VALUES (1, 2, 1, '手动阀手动阀', '2019-06-18 10:11:12', 2);
INSERT INTO `messages` VALUES (1, 2, 2, '手动阀手动阀', '2019-06-18 10:11:12', 1);
INSERT INTO `messages` VALUES (1, 2, 1, '大师傅士大夫', '2019-06-18 10:11:49', 2);
INSERT INTO `messages` VALUES (1, 2, 2, '大师傅士大夫', '2019-06-18 10:11:49', 1);
INSERT INTO `messages` VALUES (1, 3, 1, '你好呀', '2019-06-21 15:47:23', 3);
INSERT INTO `messages` VALUES (1, 3, 3, '你好呀', '2019-06-21 15:47:23', 1);
INSERT INTO `messages` VALUES (1, 2, 1, '你好呀', '2019-06-21 15:51:51', 2);
INSERT INTO `messages` VALUES (1, 2, 2, '你好呀', '2019-06-21 15:51:51', 1);
INSERT INTO `messages` VALUES (1, 2, 1, 'sdfsd ', '2019-06-24 10:01:50', 2);
INSERT INTO `messages` VALUES (1, 2, 2, 'sdfsd ', '2019-06-24 10:01:50', 1);

-- ----------------------------
-- Table structure for response
-- ----------------------------
DROP TABLE IF EXISTS `response`;
CREATE TABLE `response`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `zhudong_id` int(11) NULL DEFAULT NULL,
  `beidong_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of response
-- ----------------------------
INSERT INTO `response` VALUES (2, 3, 3);

-- ----------------------------
-- Table structure for rizhi
-- ----------------------------
DROP TABLE IF EXISTS `rizhi`;
CREATE TABLE `rizhi`  (
  `daily_id` int(11) NOT NULL AUTO_INCREMENT,
  `daily_author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `daily_details` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `daily_createtime` datetime(0) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `daily_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `privacy` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`daily_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rizhi
-- ----------------------------
INSERT INTO `rizhi` VALUES (1, 'solariusyang', '山中何事？松花酿酒，春水煎茶。——张可久《人月圆·山中书事》', '2019-06-03 20:17:11', 1, 'user1.jpg', '0');
INSERT INTO `rizhi` VALUES (2, '胡言乱语', '\r\n\r\n远远围墙，隐隐茅堂。飏青旗、流水桥旁。——秦观《行香子·树绕村庄》', '2019-06-03 20:37:11', 2, 'user2.jpg', '1');
INSERT INTO `rizhi` VALUES (3, '逍遥居士', '\r\n\r\n两水夹明镜，双桥落彩虹。人烟寒橘柚，秋色老梧桐。——李白《秋登宣城谢眺北楼》', '2019-06-03 20:27:11', 3, 'user3.jpg', '0');
INSERT INTO `rizhi` VALUES (6, '宏桑', '喝一碗胡辣汤，\r\n汤汁滴在了夜光的剧本上，\r\n看不清文字，\r\n充满了忧伤，\r\n这忧伤就如同你的头发那样长，\r\n在那家做头发的发廊。\r\n你伸出一根手指，\r\n指向了青青草原的方向，\r\n你说，\r\n做一个好男人啊，\r\n就要学会原谅，\r\n做一个好女人啊，\r\n就要学会遗忘。\r\n遗忘了，\r\n翠绿色的\r\n坚强。', '2019-06-03 20:57:20', 6, 'user6.jpg', '0');
INSERT INTO `rizhi` VALUES (7, '寂寂若离', '身处大时代中的惶惑与无力，唯有努力看书学习才能化解一点。让自己对世界的想象能追赶上世界本身。每天靠活久见的“大新闻”把自己炸出认识的边界是危险且悲哀的。 ​​​​', '2019-06-03 20:59:02', 7, 'user7.jpg', '0');
INSERT INTO `rizhi` VALUES (8, 'weteartre', '被问到很多次理想的伴侣是什么样，直到最近，这个形象才变得清晰。\r\n对我来说， 不需要在对方身上看到我的影子，不需要对方的兴趣和我多么重合，甚至不需要有能够分享的趣味，更不期待笑点哭点完全一样。\r\n我希望对方拥有自己的天地，一个自己独立、完整、复杂的内心世界，一个我不了解却好奇，我陌生却依然向往的小宇宙。\r\n当两个人拥有各自的广阔天地，这种爱对于我才是平等而持久的。当一个人的灵魂拥有值得探险的秘境，这样的人对于我来说才是闪光的。', '2019-06-03 21:07:35', 8, 'user8.jpg', '0');
INSERT INTO `rizhi` VALUES (9, 'tert34564ert', '人们总说要做自己。但我总觉得，人一直存在着两个自己，一个冷静，一个热烈；一个历经沧桑，一个选择依然天真；一个顺从于生活，一个还在梦想贴地飞行。\r\n\r\n两个自己时而重叠，时而交错，有时像敌人一样彼此怀疑，有时像伙伴一样相互理解；有时候，又像失散的旅伴，终其一生都在寻找另一个自己。 \r\n\r\n我们在两个自我之间摇摆，或许无法统一，但我们终将找到平衡，兜兜转转，找到那个平静的瞬间：我与我周旋久，宁做我。', '2019-06-04 08:42:45', 9, 'user9.jpg', '0');
INSERT INTO `rizhi` VALUES (13, 'solariusyang', '原来觉得每个人都活在自身经验的牢笼里，现在发现每个人也活在自身立场的牢笼里。 ​​​​', '2019-06-18 12:44:01', 1, 'user1.jpg', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_pswd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `daily_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'solariusyang', '001', '123', 'user1.jpg', '计算机专业出身的金融从业者');
INSERT INTO `user` VALUES (2, '胡言乱语', '002', '123', 'user2.jpg', NULL);
INSERT INTO `user` VALUES (3, '逍遥居士', '003', '123', 'user3.jpg', NULL);
INSERT INTO `user` VALUES (4, '清霜白月', '004', '123', 'user4.jpg', NULL);
INSERT INTO `user` VALUES (5, '韩东然', '005', '123', 'user5.jpg', NULL);
INSERT INTO `user` VALUES (6, '宏桑', '006', '123', 'user6.jpg', NULL);
INSERT INTO `user` VALUES (7, '寂寂若离', '007', '123', 'user7.jpg', NULL);
INSERT INTO `user` VALUES (8, 'weteartre', '008', '123', 'user8.jpg', NULL);
INSERT INTO `user` VALUES (9, 'tert34564ert', '009', '123', 'user9.jpg', NULL);

SET FOREIGN_KEY_CHECKS = 1;
