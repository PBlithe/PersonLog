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

 Date: 03/07/2019 21:16:32
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
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (22, 1, '胡言乱语', 2, '兴亡千古繁华梦，诗眼倦天涯。');
INSERT INTO `comments` VALUES (24, 49, '予人后飘零', 1, '我越来越相信。用爱来连接的人，一定会重逢。在某个时间，某个地点，某个现在的我无法想象的形式。又或许在彼此的脑海里，广袤的银河星海里，我们早已无数次电波冲撞，无数次喜悦相逢。');
INSERT INTO `comments` VALUES (25, 49, '予人后飘零', 1, '说得很好');
INSERT INTO `comments` VALUES (26, 49, '予人后飘零', 1, '123');

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
INSERT INTO `friends` VALUES (2, 1);
INSERT INTO `friends` VALUES (1, 3);
INSERT INTO `friends` VALUES (4, 1);
INSERT INTO `friends` VALUES (5, 1);
INSERT INTO `friends` VALUES (6, 1);
INSERT INTO `friends` VALUES (7, 1);
INSERT INTO `friends` VALUES (8, 1);
INSERT INTO `friends` VALUES (3, 1);

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
INSERT INTO `messages` VALUES (2, 1, 2, '今天一起吃午饭吗', '2019-06-24 20:46:53', 1);
INSERT INTO `messages` VALUES (2, 1, 1, '今天一起吃午饭吗', '2019-06-24 20:46:53', 2);
INSERT INTO `messages` VALUES (1, 2, 1, '好的，什么时候？', '2019-06-24 20:47:34', 2);
INSERT INTO `messages` VALUES (1, 2, 2, '好的，什么时候？', '2019-06-24 20:47:34', 1);
INSERT INTO `messages` VALUES (2, 1, 2, '大概11点30可以吗？', '2019-06-24 20:49:46', 1);
INSERT INTO `messages` VALUES (2, 1, 1, '大概11点30可以吗？', '2019-06-24 20:49:46', 2);
INSERT INTO `messages` VALUES (1, 2, 1, '可以', '2019-06-24 20:50:22', 2);
INSERT INTO `messages` VALUES (1, 2, 2, '可以', '2019-06-24 20:50:22', 1);
INSERT INTO `messages` VALUES (1, 2, 1, '我们今天去黄焖鸡吧，好久没吃了。', '2019-06-24 20:50:52', 2);
INSERT INTO `messages` VALUES (1, 2, 2, '我们今天去黄焖鸡吧，好久没吃了。', '2019-06-24 20:50:52', 1);
INSERT INTO `messages` VALUES (2, 1, 2, '嗯，行。', '2019-06-24 20:52:06', 1);
INSERT INTO `messages` VALUES (2, 1, 1, '嗯，行。', '2019-06-24 20:52:06', 2);
INSERT INTO `messages` VALUES (2, 1, 2, '我到了，你来了吗？', '2019-06-24 20:52:18', 1);
INSERT INTO `messages` VALUES (2, 1, 1, '我到了，你来了吗？', '2019-06-24 20:52:18', 2);
INSERT INTO `messages` VALUES (2, 1, 2, '人呢？？？', '2019-06-24 20:52:27', 1);
INSERT INTO `messages` VALUES (2, 1, 1, '人呢？？？', '2019-06-24 20:52:27', 2);
INSERT INTO `messages` VALUES (2, 1, 2, '。。。。。', '2019-06-24 20:52:38', 1);
INSERT INTO `messages` VALUES (2, 1, 1, '。。。。。', '2019-06-24 20:52:38', 2);
INSERT INTO `messages` VALUES (2, 1, 2, '我先点了', '2019-06-24 20:52:49', 1);
INSERT INTO `messages` VALUES (2, 1, 1, '我先点了', '2019-06-24 20:52:49', 2);
INSERT INTO `messages` VALUES (2, 1, 2, '你还不来吗？电话也不 接，我都吃完了。', '2019-06-24 20:53:06', 1);
INSERT INTO `messages` VALUES (2, 1, 1, '你还不来吗？电话也不 接，我都吃完了。', '2019-06-24 20:53:06', 2);
INSERT INTO `messages` VALUES (1, 2, 1, '啊啊啊啊，抱歉，忽然有些事情', '2019-06-24 20:53:45', 2);
INSERT INTO `messages` VALUES (1, 2, 2, '啊啊啊啊，抱歉，忽然有些事情', '2019-06-24 20:53:45', 1);
INSERT INTO `messages` VALUES (1, 2, 1, '下次再一起吃吧', '2019-06-24 20:53:56', 2);
INSERT INTO `messages` VALUES (1, 2, 2, '下次再一起吃吧', '2019-06-24 20:53:56', 1);
INSERT INTO `messages` VALUES (2, 1, 2, '嗯，行', '2019-06-24 20:54:24', 1);
INSERT INTO `messages` VALUES (2, 1, 1, '嗯，行', '2019-06-24 20:54:24', 2);
INSERT INTO `messages` VALUES (2, 1, 2, '我先看书了', '2019-06-24 20:54:32', 1);
INSERT INTO `messages` VALUES (2, 1, 1, '我先看书了', '2019-06-24 20:54:32', 2);
INSERT INTO `messages` VALUES (1, 2, 1, '好的', '2019-06-24 20:54:54', 2);
INSERT INTO `messages` VALUES (1, 2, 2, '好的', '2019-06-24 20:54:54', 1);
INSERT INTO `messages` VALUES (1, 2, 1, 'suibian', '2019-06-25 10:57:15', 2);
INSERT INTO `messages` VALUES (1, 2, 2, 'suibian', '2019-06-25 10:57:15', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rizhi
-- ----------------------------
INSERT INTO `rizhi` VALUES (1, '予人后飘零', '山中何事？松花酿酒，春水煎茶', '2019-06-03 20:17:11', 1, 'user1.jpg', '0');
INSERT INTO `rizhi` VALUES (2, '胡言乱语', '远远围墙，隐隐茅堂。飏青旗、流水桥旁。——秦观《行香子·树绕村庄》', '2019-06-03 20:37:11', 2, 'user2.jpg', '1');
INSERT INTO `rizhi` VALUES (3, '逍遥居士', '两水夹明镜，双桥落彩虹。人烟寒橘柚，秋色老梧桐。——李白《秋登宣城谢眺北楼》', '2019-06-03 20:27:11', 3, 'user3.jpg', '0');
INSERT INTO `rizhi` VALUES (6, '宏桑', '喝一碗胡辣汤，\n汤汁滴在了夜光的剧本上，\n看不清文字，\n充满了忧伤，\n这忧伤就如同你的头发那样长，\n在那家做头发的发廊。\n你伸出一根手指，\n指向了青青草原的方向，\n你说，\n做一个好男人啊，\n就要学会原谅，\n做一个好女人啊，\n就要学会遗忘。\n遗忘了，\n翠绿色的\n坚强。', '2019-06-03 20:57:20', 6, 'user6.jpg', '0');
INSERT INTO `rizhi` VALUES (7, '寂寂若离', '身处大时代中的惶惑与无力，唯有努力看书学习才能化解一点。让自己对世界的想象能追赶上世界本身。每天靠活久见的“大新闻”把自己炸出认识的边界是危险且悲哀的。 ​​​​', '2019-06-03 20:59:02', 7, 'user7.jpg', '0');
INSERT INTO `rizhi` VALUES (8, 'weteartre', '被问到很多次理想的伴侣是什么样，直到最近，这个形象才变得清晰。\r\n对我来说， 不需要在对方身上看到我的影子，不需要对方的兴趣和我多么重合，甚至不需要有能够分享的趣味，更不期待笑点哭点完全一样。\r\n我希望对方拥有自己的天地，一个自己独立、完整、复杂的内心世界，一个我不了解却好奇，我陌生却依然向往的小宇宙。\r\n当两个人拥有各自的广阔天地，这种爱对于我才是平等而持久的。当一个人的灵魂拥有值得探险的秘境，这样的人对于我来说才是闪光的。', '2019-06-03 21:07:35', 8, 'user8.jpg', '0');
INSERT INTO `rizhi` VALUES (9, 'tert34564ert', '人们总说要做自己。但我总觉得，人一直存在着两个自己，一个冷静，一个热烈；一个历经沧桑，一个选择依然天真；一个顺从于生活，一个还在梦想贴地飞行。\n\n两个自己时而重叠，时而交错，有时像敌人一样彼此怀疑，有时像伙伴一样相互理解；有时候，又像失散的旅伴，终其一生都在寻找另一个自己。 \n\n我们在两个自我之间摇摆，或许无法统一，但我们终将找到平衡，兜兜转转，找到那个平静的瞬间：我与我周旋久，宁做我。', '2019-06-04 08:42:45', 9, 'user9.jpg', '0');
INSERT INTO `rizhi` VALUES (49, '胡言乱语', '等到秋叶终于金黄\n等到华发悄然苍苍\n我们相约老地方\n等到人已不再奔忙\n等到心也不再轻狂\n我们相约老地方\n等到记忆只剩精华\n等到笑容不掺伪装\n我们相约老地方\n等到释怀所有悲伤\n等到体谅世事无常\n我们相约老地方', '2019-06-24 20:13:19', 2, 'user2.jpg', '0');

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
INSERT INTO `user` VALUES (1, '予人后飘零', '001', '202cb962ac59075b964b07152d234b70', 'user1.jpg', '计算机专业出身的金融从业者');
INSERT INTO `user` VALUES (2, '胡言乱语', '002', '202cb962ac59075b964b07152d234b70', 'user2.jpg', NULL);
INSERT INTO `user` VALUES (3, '逍遥居士', '003', '202cb962ac59075b964b07152d234b70', 'user3.jpg', NULL);
INSERT INTO `user` VALUES (4, '清霜白月', '004', '202cb962ac59075b964b07152d234b70', 'user4.jpg', NULL);
INSERT INTO `user` VALUES (5, '韩东然', '005', '202cb962ac59075b964b07152d234b70', 'user5.jpg', NULL);
INSERT INTO `user` VALUES (6, '宏桑', '006', '202cb962ac59075b964b07152d234b70', 'user6.jpg', NULL);
INSERT INTO `user` VALUES (7, '寂寂若离', '007', '202cb962ac59075b964b07152d234b70', 'user7.jpg', NULL);
INSERT INTO `user` VALUES (8, 'weteartre', '008', '202cb962ac59075b964b07152d234b70', 'user8.jpg', NULL);
INSERT INTO `user` VALUES (9, '月', '009', '202cb962ac59075b964b07152d234b70', 'user9.jpg', NULL);
INSERT INTO `user` VALUES (10, '我在天南海北', '033', '202cb962ac59075b964b07152d234b70', 'head.png', NULL);

SET FOREIGN_KEY_CHECKS = 1;
